part of 'index.dart';

class GraphQlService extends GetxService implements IGraphQlClient {
  late final GraphQLClient _client;
  WebSocketLink? _socketLink;
  late final IStorage _storage;
  late final ILogger? _logger;

  final cachePolicies = <CachePolicy, FetchPolicy>{
    CachePolicy.cacheAndNetwork: FetchPolicy.cacheAndNetwork,
    CachePolicy.cacheFirst: FetchPolicy.cacheFirst,
    CachePolicy.cacheOnly: FetchPolicy.cacheOnly,
    CachePolicy.networkOnly: FetchPolicy.networkOnly,
    CachePolicy.noCache: FetchPolicy.noCache,
  };

  Future<GraphQlService> init(
    IStorage storage,
    String api, {
    ILogger? logger,
    String? wss,
    http.Client? httpClient,
  }) async {
    _logger = logger;
    _storage = storage;
    await _socketLink?.dispose();
    final token = await _storage.get<String>(StorageKey.token);

    final httpLink = HttpLink(api, httpClient: httpClient);
    final authLink = AuthLink(getToken: () => token);

    if (wss != null) {
      _socketLink = WebSocketLink(
        wss,
        config: SocketClientConfig(
          autoReconnect: true,
          initialPayload:
              token != null ? {'Authorization': 'Bearer' + token} : null,
        ),
      );
    }

    final link = Link.split(
      (request) => request.isSubscription,
      _socketLink ?? const PassthroughLink(),
      authLink.concat(httpLink),
    );

    _client = GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: link,
    );

    return this;
  }

  @override
  Future<Map> query({
    required String queryString,
    String? operationName,
    Map<String, dynamic> variables = const {},
    CachePolicy? cachePolicy,
  }) async {
    return _processQueryResult(await _client.query(QueryOptions(
      document: gql(queryString),
      operationName: operationName,
      variables: variables,
      fetchPolicy: cachePolicies[cachePolicy],
    )));
  }

  @override
  Future<Map> mutate({
    required String queryString,
    String? operationName,
    Map<String, dynamic> variables = const {},
    CachePolicy? cachePolicy,
  }) async {
    return _processQueryResult(await _client.mutate(MutationOptions(
      document: gql(queryString),
      operationName: operationName,
      variables: variables,
      fetchPolicy: cachePolicies[cachePolicy],
    )));
  }

  @override
  Stream<Map> subscribe({
    required String queryString,
    String? operationName,
    Map<String, dynamic> variables = const {},
    CachePolicy? cachePolicy,
  }) async* {
    await for (final result in _client.subscribe(SubscriptionOptions(
      document: gql(queryString),
      operationName: operationName,
      variables: variables,
      fetchPolicy: cachePolicies[cachePolicy],
    ))) {
      yield await _processQueryResult(result);
    }
  }

  Future<Map> _processQueryResult(QueryResult queryResult) async {
    if (queryResult.hasException) {
      if (queryResult.exception?.linkException != null) {
        _logger?.e(queryResult.exception!.linkException);
        throw queryResult.exception!.linkException!;
      } else if (queryResult.exception!.graphqlErrors.isNotEmpty) {
        final unauthenticatedError = queryResult.exception!.graphqlErrors
            .firstWhereOrNull(
                (element) => element.extensions?['code'] == 'UNAUTHENTICATED');
        final clientError = queryResult.exception!.graphqlErrors
            .firstWhereOrNull(
                (element) => element.extensions?['code'] == 'CLIENT_ERROR');
        if (unauthenticatedError != null) {
          throw UnauthenticatedException();
        } else if (clientError != null) {
          throw clientError.message;
        } else {
          _logger?.e(queryResult.exception!.graphqlErrors[0].message);
          throw UnknownException(
              queryResult.exception!.graphqlErrors[0].message);
        }
      } else {
        _logger?.e(queryResult.exception);
        throw UnknownException(queryResult.exception.toString());
      }
    } else {
      _logger?.i(queryResult.data?.keys);
    }

    return queryResult.data ?? {};
  }
}

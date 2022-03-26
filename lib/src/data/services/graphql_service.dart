part of 'services.dart';

class GraphQlService extends GetxService implements IGraphQlClient {
  GraphQlService(
    this._storage,
    this._api, [
    this._wss,
    this._httpClient,
    this._logger,
  ]);

  final IStorage _storage;
  final String _api;
  final String? _wss;
  final http.Client? _httpClient;
  final ILogger? _logger;

  WebSocketLink? _socketLink;

  final cachePolicies = <CachePolicy, FetchPolicy>{
    CachePolicy.cacheAndNetwork: FetchPolicy.cacheAndNetwork,
    CachePolicy.cacheFirst: FetchPolicy.cacheFirst,
    CachePolicy.cacheOnly: FetchPolicy.cacheOnly,
    CachePolicy.networkOnly: FetchPolicy.networkOnly,
    CachePolicy.noCache: FetchPolicy.noCache,
  };

  Future<GraphQLClient> _getClient() async {
    await _socketLink?.dispose();
    final token = await _storage.get(StorageKey.token);

    final httpLink = HttpLink(
      _api,
      httpClient: _httpClient,
      defaultHeaders: {
        'Authorization': 'Bearer $token',
      },
    );
    final authLink = AuthLink(getToken: () => null);

    if (_wss != null) {
      _socketLink = WebSocketLink(
        _wss!,
        config: SocketClientConfig(autoReconnect: true),
      );
    }

    final link = Link.split(
      (request) => request.isSubscription,
      _socketLink ?? const PassthroughLink(),
      authLink.concat(httpLink),
    );

    return GraphQLClient(
      cache: GraphQLCache(store: HiveStore()),
      link: link,
    );
  }

  @override
  Future<Map> query({
    required String queryString,
    String? operationName,
    Map<String, dynamic> variables = const {},
    CachePolicy? cachePolicy,
  }) async {
    _logger?.i(queryString);
    _logger?.i(variables);
    return _processQueryResult(await (await _getClient()).query(QueryOptions(
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
    _logger?.i(queryString);
    _logger?.i(variables);
    return _processQueryResult(
        await (await _getClient()).mutate(MutationOptions(
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
    _logger?.i(queryString);
    _logger?.i(variables);
    await for (final result
        in (await _getClient()).subscribe(SubscriptionOptions(
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
        if (queryResult.exception!.linkException is HttpLinkServerException) {
          final errorBody =
              (queryResult.exception!.linkException! as HttpLinkServerException)
                  .response
                  .body;
          throw errorBody;
        }
        throw UnknownException(error: queryResult.exception!.linkException);
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
              message: queryResult.exception!.graphqlErrors[0].message);
        }
      } else {
        _logger?.e(queryResult.exception);
        throw UnknownException(message: queryResult.exception.toString());
      }
    }

    _logger?.i(queryResult.data);
    return queryResult.data ?? {};
  }
}

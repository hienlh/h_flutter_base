part of 'index.dart';

class GetHttpService extends GetxService implements IHttpClient {
  late final IStorage _storage;
  IConnectivity? _connectivity;
  late final GetConnect _http;
  late final String _baseUrl;

  Future<GetHttpService> init(
    IStorage storage,
    String baseUrl, [
    IConnectivity? connectivity,
  ]) async {
    _storage = storage;
    _connectivity = connectivity;
    _baseUrl = baseUrl;
    _http = GetConnect();
    return this;
  }

  @override
  Future<dynamic> request(
    ApiMethod method,
    String url, {
    Map<String, String>? headers,
    Map<String, String>? query,
    dynamic body,
  }) async {
    final token = await _storage.get<String>(StorageKey.token);
    final _headers = {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token'
    };

    if (headers != null) {
      _headers.addAll(headers);
    }

    // Read from cache when no network connection
    if (_connectivity != null && !(await _connectivity!.checkConnected())) {
      if (method == ApiMethod.GET) {
        final cachedData = await _storage.get(url + query.toString());
        if (cachedData != null) {
          return cachedData;
        }
      }
      throw NoNetworkConnectionException();
    }

    try {
      final response = await _http.request(
        url.startsWith('/') ? _baseUrl + url : url,
        method.toString().split('.').last,
        body: body,
        headers: _headers,
        query: query,
      );

      if (response.statusCode != null && response.statusCode! < 400) {
        // Save to cache
        if (method == ApiMethod.GET) {
          unawaited(_storage.set(url + query.toString(), response.body));
        }
        return response.body;
      } else {
        throw 'Error ${response.statusCode}: ${response.statusText}';
      }
    } on GetHttpException catch (e) {
      throw e.message;
    } catch (e) {
      rethrow;
    }
  }
}

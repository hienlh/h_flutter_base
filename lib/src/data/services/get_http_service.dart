part of 'services.dart';

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
    String? contentType,
    Function(double percent)? uploadProgress,
  }) async {
    final token = await _storage.get<String>(StorageKey.token);

    final _headers = {
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token'
    };

    final _contentType = contentType ?? 'application/json';

    if (headers != null) {
      _headers.addAll(headers);
    }
    query ??= {};

    // Read from cache when no network connection
    if (_connectivity != null && !(await _connectivity!.checkConnected())) {
      if (method == ApiMethod.get) {
        final cachedData = await _storage.get(url + query.toString());
        if (cachedData != null) {
          return cachedData;
        }
      }
      throw NoNetworkConnectionException();
    }

    var uri = Uri.parse(url);
    if (uri.host.isEmpty) {
      uri = Uri.parse(_baseUrl + url);
    }

    try {
      final response = await _http.request(
        uri.toString(),
        method.toString().split('.').last,
        body: body,
        headers: _headers,
        query: query,
        contentType: _contentType,
        uploadProgress: uploadProgress,
      );

      log('========> ${method.toString().split('.').last}: ${uri.toString()}');
      log('Header: $_headers');
      if (body != null) {
        log('Body: $body');
      }
      log('query: $query');
      log('Response: ${response.body}');

      if (response.statusCode != null && response.statusCode! < 400) {
        // Save to cache
        if (method == ApiMethod.get) {
          _storage.set(
            url + query.toString(),
            response.body?.toString() ?? '',
          );
        }
        return response.body;
      } else {
        if (response.body is Map &&
            response.body['error'] != null &&
            response.body['error'] is Map &&
            response.body['error']['message'] != null) {
          throw response.body['error']['message'];
        }
        throw UnknownException(
          error: 'Error ${response.statusCode}: ${response.statusText}',
          code: response.statusCode.toString(),
        );
      }
    } on GetHttpException catch (e) {
      throw e.message;
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }
}

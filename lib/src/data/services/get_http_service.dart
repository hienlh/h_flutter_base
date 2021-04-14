part of 'index.dart';

class GetHttpService extends GetxService implements IHttpClient {
  late IStorage _storage;
  late final GetConnect http;

  Future<GetHttpService> init(IStorage storage, String baseUrl) async {
    _storage = storage;
    http = GetConnect();
    http.baseUrl = baseUrl;
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

    try {
      final response = await http.request(
        url,
        method.toString().split('.').last,
        body: body,
        headers: _headers,
        query: query,
      );

      if (response.statusCode != null && response.statusCode! < 400) {
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

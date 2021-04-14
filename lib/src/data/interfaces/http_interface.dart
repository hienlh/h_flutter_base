enum ApiMethod { GET, POST, PUT, DELETE }

abstract class IHttpClient {
  Future<dynamic> request(
    ApiMethod method,
    String url, {
    Map<String, String>? headers,
    Map<String, String>? query,
    dynamic body,
  });
}

enum ApiMethod { get, post, put, delete }

abstract class IHttpClient {
  Future<dynamic> request(
    ApiMethod method,
    String url, {
    Map<String, String>? headers,
    Map<String, String>? query,
    dynamic body,
    String? contentType,
    Function(double percent)? uploadProgress,
  });
}

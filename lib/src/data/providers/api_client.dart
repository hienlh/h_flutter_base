import '../interfaces/api_client_interface.dart';
import '../interfaces/graphql_interface.dart';
import '../interfaces/http_interface.dart';
import '../interfaces/storage_interface.dart';

class ApiClient extends IApiClient {
  ApiClient(
    IHttpClient api,
    IGraphQlClient graphql,
    IStorage storage, [
    Future<String?> Function()? refreshToken,
  ]) : super(api, graphql, storage, refreshToken);

  Future<String> getExternalIp() async {
    final res = await request(
      ApiMethod.get,
      'https://wtfismyip.com/text',
    );
    return res.toString().trim();
  }
}

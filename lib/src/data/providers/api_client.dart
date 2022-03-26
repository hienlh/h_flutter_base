import '../interfaces/api_client_interface.dart';
import '../interfaces/graphql_interface.dart';
import '../interfaces/http_interface.dart';
import '../interfaces/storage_interface.dart';
import '../models/responses/check_user_phone_res.dart';

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

  Future<CheckUserPhoneResponse> checkUserPhone(String phone) async {
    final res = await request(
      ApiMethod.post,
      '/auth/checkUsrPhn',
      body: {'usrPhn': phone},
    );
    return CheckUserPhoneResponse.fromJson(res);
  }
}

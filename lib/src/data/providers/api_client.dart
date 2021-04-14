import 'package:flutter_base/src/data/interfaces/http_interface.dart';
import 'package:flutter_base/src/data/models/responses/check_user_phone_res.dart';

class ApiClient {
  final IHttpClient _api;

  ApiClient(this._api);

  Future<String> getExternalIp() async {
    final res = await _api.request(
      ApiMethod.GET,
      'https://wtfismyip.com/text',
    );
    return res.toString().trim();
  }

  Future<CheckUserPhoneResponse> checkUserPhone(String phone) async {
    final res = await _api.request(
      ApiMethod.POST,
      '/auth/checkUsrPhn',
      body: {'usrPhn': phone},
    );
    return CheckUserPhoneResponse.fromJson(res);
  }
}

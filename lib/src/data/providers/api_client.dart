import 'package:flutter_base/src/data/models/sample.dart';
import 'package:get/get_connect.dart';

class ApiClient {
  final GetConnectInterface _api;

  ApiClient(this._api);

// Get request
  Future<Response> getUser(int id) => _api.get('/users/id');
// Post request
  Future<Response> postUser(Map data) => _api.post('/users', data);
// Post request with File
  Future<Response<UserModel>> postCases(List<int> image) {
    final form = FormData({
      'file': MultipartFile(image, filename: 'avatar.png'),
      'otherFile': MultipartFile(image, filename: 'cover.png'),
    });
    return _api.post('/users/upload', form);
  }

  GetSocket userMessages() {
    return _api.socket('/users/socket');
  }
}

import 'package:flutter_base/src/base/app_config.dart';
import 'package:flutter_base/src/data/models/sample.dart';
import 'package:get/get_connect.dart';

final baseUrl = AppConfig.shared.apiUrl;

class ApiClient extends GetConnect {
  final api;
  ApiClient({required this.api});

// Get request
  Future<Response> getUser(int id) => get('$baseUrl/users/id');
// Post request
  Future<Response> postUser(Map data) => post('$baseUrl/users', data);
// Post request with File
  Future<Response<UserModel>> postCases(List<int> image) {
    final form = FormData({
      'file': MultipartFile(image, filename: 'avatar.png'),
      'otherFile': MultipartFile(image, filename: 'cover.png'),
    });
    return post('$baseUrl/users/upload', form);
  }

  GetSocket userMessages() {
    return socket('$baseUrl//users/socket');
  }
}

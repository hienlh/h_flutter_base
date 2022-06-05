import 'dart:io';

import '../models/entities/user_entity.dart';
import '../models/responses/file_upload_res.dart';
import '../models/responses/sign_in_phone_email.dart';
import '../models/responses/sign_in_res.dart';
import '../providers/api_client.dart';

class UserRepository {
  final ApiClient _apiClient;

  UserRepository(this._apiClient);

  Future<UserEntity> getMe() => _apiClient.getMe();

  Future<SignInRes> verifyOtp(String phoneOrEmail, String otp) {
    return _apiClient.verifyOtp(phoneOrEmail, otp);
  }

  Future<SignInRes> signIn(String username, String password) async {
    return _apiClient.signIn(username, password);
  }

  Future<SignInPhoneEmailRes> signInPhoneOrEmail(String phoneOrEmail) {
    return _apiClient.signInPhoneOrEmail(phoneOrEmail);
  }

  Future<FileUploadRes> uploadAvatar(File file) => _apiClient.uploadFile(file);
}

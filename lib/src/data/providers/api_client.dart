import 'dart:io';

import 'package:get/get.dart';

import '../interfaces/api_client_interface.dart';
import '../interfaces/graphql_interface.dart';
import '../interfaces/http_interface.dart';
import '../interfaces/storage_interface.dart';
import '../models/entities/user_entity.dart';
import '../models/responses/file_upload_res.dart';
import '../models/responses/sign_in_phone_email.dart';
import '../models/responses/sign_in_res.dart';

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

  Future<UserEntity> getMe() async {
    final res = await request(ApiMethod.get, '/api/account/my-profile');
    return UserEntity.fromJson(res);
  }

  Future<SignInRes> verifyOtp(String phoneOrEmail, String otp) async {
    final res = await request(
      ApiMethod.post,
      '/api/customers/sign-in-by-email-or-phone',
      body: {
        'EmailOrPhone': phoneOrEmail,
        'OTP': otp,
      },
    );
    return SignInRes.fromJson(res);
  }

  Future<SignInRes> signIn(String username, String password) async {
    final res = await request(
      ApiMethod.post,
      '/connect/token',
      contentType: 'application/x-www-form-urlencoded',
      body: {
        'grant_type': 'password',
        'username': username,
        'password': password,
        'client_id': 'TriHai_App',
        'scope': 'TriHai',
      },
    );
    return SignInRes.fromJson(res);
  }

  Future<SignInPhoneEmailRes> signInPhoneOrEmail(String phoneOrEmail) async {
    final res = await request(
      ApiMethod.post,
      '/api/customers/send-sign-in-otp',
      body: {
        'EmailOrPhone': phoneOrEmail,
      },
    );
    return SignInPhoneEmailRes.fromJson(res);
  }

  Future<FileUploadRes> uploadFile(File file) async {
    final res = await request(
      ApiMethod.post,
      '/api/files/upload-by-form',
      body: FormData({
        'file': MultipartFile(file, filename: file.path),
      }),
      contentType: 'multipart/form-data',
    );
    return FileUploadRes.fromJson(res);
  }
}

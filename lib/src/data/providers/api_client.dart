import 'package:flutter_base/src/data/models/responses/sign_in_phone_email.dart';
import 'package:flutter_base/src/data/models/responses/sign_in_res.dart';

import '../interfaces/api_client_interface.dart';
import '../interfaces/graphql_interface.dart';
import '../interfaces/http_interface.dart';
import '../interfaces/storage_interface.dart';
import '../models/entities/user_entity.dart';

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

  Future<SignInPhoneEmailRes> signInPhoneOrEmail(String phoneOrEmail) async {
    return SignInPhoneEmailRes();
    // final res = await request(
    //   ApiMethod.post,
    //   '/api/customers/send-sign-in-otp',
    //   body: {
    //     'EmailOrPhone': phoneOrEmail,
    //   },
    // );
    // return SignInPhoneEmailRes.fromJson(res);
  }

  Future<SignInRes> firebaseSignIn(String idToken) async {
    final res = await request(
      ApiMethod.post,
      '/api/customers/sign-in-by-firebase-id-token',
      body: {
        'IdToken': idToken,
      },
    );
    return SignInRes.fromJson(res);
  }

  Future<SignInRes> verifyOtp(String phoneOrEmail, String otp) async {
    return SignInRes(
      jwt:
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmUgSldUIEJ1aWxkZXIiLCJpYXQiOjE2NjE5MDU1ODAsImV4cCI6NDg0OTExNTE4MCwiYXVkIjoid3d3LmhpZW5saC5jb20iLCJzdWIiOiJhZG1pbkBoaWVubGguY29tIiwibmFtZSI6ImhpZW5saCJ9.YT6YpbUPmgrNf4Of9FSJUXWOpV1Wvp7te6I0-ZooHvg',
      user: UserEntity(
        id: 'id',
        firstName: 'firstName',
        lastName: 'lastName',
        age: 22,
      ),
    );
    // final res = await request(
    //   ApiMethod.post,
    //   '/api/customers/sign-in-by-email-or-phone',
    //   body: {
    //     'EmailOrPhone': phoneOrEmail,
    //     'OTP': otp,
    //   },
    // );
    // return SignInRes.fromJson(res);
  }

  Future<int> getCountNoti() async {
    return 0;
    // final res = await request(
    //   ApiMethod.get,
    //   '/api/customers/my-count-unread-notifications',
    // );
    // return res;
  }

  Future<UserEntity> getMe() async {
    return UserEntity(
      id: 'id',
      firstName: 'firstName',
      lastName: 'lastName',
      age: 22,
    );
    // final res = await request(ApiMethod.get, '/api/customers/my-profile');
    // return UserEntity.fromJson(res);
  }

  Future deleteAccount() async {
    await request(ApiMethod.delete, '/api/customers/my-profile');
  }
}

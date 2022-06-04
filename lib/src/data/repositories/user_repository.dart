import '../models/entities/user_entity.dart';
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

  Future<SignInPhoneEmailRes> signInPhoneOrEmail(String phoneOrEmail) {
    return _apiClient.signInPhoneOrEmail(phoneOrEmail);
  }
}

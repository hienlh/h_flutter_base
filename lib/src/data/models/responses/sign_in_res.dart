import 'package:freezed_annotation/freezed_annotation.dart';

import '../entities/user_entity.dart';

part 'sign_in_res.freezed.dart';
part 'sign_in_res.g.dart';

@freezed
class SignInRes with _$SignInRes {
  const factory SignInRes({
    required String jwt,
    required UserEntity user,
  }) = _SignInRes;

  factory SignInRes.fromJson(Map<String, Object?> json) =>
      _$SignInResFromJson(json);
}

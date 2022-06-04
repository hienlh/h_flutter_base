import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sign_in_phone_email.freezed.dart';
part 'sign_in_phone_email.g.dart';

@freezed
class SignInPhoneEmailRes with _$SignInPhoneEmailRes {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory SignInPhoneEmailRes({
    String? emailOrPhone,
    DateTime? createdAt,
    DateTime? expireAt,
    DateTime? nextTimeAllowSendOtp,
  }) = _SignInPhoneEmailRes;

  factory SignInPhoneEmailRes.fromJson(Map<String, Object?> json) =>
      _$SignInPhoneEmailResFromJson(json);
}

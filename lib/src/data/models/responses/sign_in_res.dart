import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_res.freezed.dart';
part 'sign_in_res.g.dart';

@freezed
class SignInRes with _$SignInRes {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory SignInRes({
    String? accessToken,
  }) = _SignInRes;

  factory SignInRes.fromJson(Map<String, Object?> json) =>
      _$SignInResFromJson(json);
}

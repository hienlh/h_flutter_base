// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_phone_email.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignInPhoneEmailRes _$$_SignInPhoneEmailResFromJson(
        Map<String, dynamic> json) =>
    _$_SignInPhoneEmailRes(
      emailOrPhone: json['EmailOrPhone'] as String?,
      createdAt: json['CreatedAt'] == null
          ? null
          : DateTime.parse(json['CreatedAt'] as String),
      expireAt: json['ExpireAt'] == null
          ? null
          : DateTime.parse(json['ExpireAt'] as String),
      nextTimeAllowSendOtp: json['NextTimeAllowSendOtp'] == null
          ? null
          : DateTime.parse(json['NextTimeAllowSendOtp'] as String),
    );

Map<String, dynamic> _$$_SignInPhoneEmailResToJson(
        _$_SignInPhoneEmailRes instance) =>
    <String, dynamic>{
      'EmailOrPhone': instance.emailOrPhone,
      'CreatedAt': instance.createdAt?.toIso8601String(),
      'ExpireAt': instance.expireAt?.toIso8601String(),
      'NextTimeAllowSendOtp': instance.nextTimeAllowSendOtp?.toIso8601String(),
    };

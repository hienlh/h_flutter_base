// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignInRes _$$_SignInResFromJson(Map<String, dynamic> json) => _$_SignInRes(
      info: json['Info'] == null
          ? null
          : UserEntity.fromJson(json['Info'] as Map<String, dynamic>),
      accessToken: json['AccessToken'] as String?,
    );

Map<String, dynamic> _$$_SignInResToJson(_$_SignInRes instance) =>
    <String, dynamic>{
      'Info': instance.info,
      'AccessToken': instance.accessToken,
    };

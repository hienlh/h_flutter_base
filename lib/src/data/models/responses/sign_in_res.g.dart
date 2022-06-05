// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignInRes _$$_SignInResFromJson(Map<String, dynamic> json) => _$_SignInRes(
      info: json['info'] == null
          ? null
          : UserEntity.fromJson(json['info'] as Map<String, dynamic>),
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$$_SignInResToJson(_$_SignInRes instance) =>
    <String, dynamic>{
      'info': instance.info,
      'accessToken': instance.accessToken,
    };

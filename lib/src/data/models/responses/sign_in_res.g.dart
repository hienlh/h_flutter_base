// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignInRes _$$_SignInResFromJson(Map<String, dynamic> json) => _$_SignInRes(
      jwt: json['jwt'] as String,
      user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SignInResToJson(_$_SignInRes instance) =>
    <String, dynamic>{
      'jwt': instance.jwt,
      'user': instance.user,
    };

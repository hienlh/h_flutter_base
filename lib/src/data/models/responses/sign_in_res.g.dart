// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignInResImpl _$$SignInResImplFromJson(Map<String, dynamic> json) =>
    _$SignInResImpl(
      jwt: json['jwt'] as String,
      user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SignInResImplToJson(_$SignInResImpl instance) =>
    <String, dynamic>{
      'jwt': instance.jwt,
      'user': instance.user,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserEntity _$$_UserEntityFromJson(Map<String, dynamic> json) =>
    _$_UserEntity(
      userName: json['userName'] as String?,
      email: json['email'] as String,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      isExternal: json['isExternal'] as bool?,
      hasPassword: json['hasPassword'] as bool?,
      concurrencyStamp: json['concurrencyStamp'] as String?,
    );

Map<String, dynamic> _$$_UserEntityToJson(_$_UserEntity instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'name': instance.name,
      'surname': instance.surname,
      'phoneNumber': instance.phoneNumber,
      'isExternal': instance.isExternal,
      'hasPassword': instance.hasPassword,
      'concurrencyStamp': instance.concurrencyStamp,
    };

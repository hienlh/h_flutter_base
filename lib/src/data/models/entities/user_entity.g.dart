// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserEntity _$$_UserEntityFromJson(Map<String, dynamic> json) =>
    _$_UserEntity(
      id: json['Id'] as String,
      firstName: json['FirstName'] as String,
      lastName: json['LastName'] as String,
      age: json['Age'] as int,
    );

Map<String, dynamic> _$$_UserEntityToJson(_$_UserEntity instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'Age': instance.age,
    };

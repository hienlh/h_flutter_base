// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserEntity _$$_UserEntityFromJson(Map<String, dynamic> json) =>
    _$_UserEntity(
      fullName: json['fullName'] as String?,
      email: json['email'] as String,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      avatarUrl: json['avatarUrl'] as String?,
      note: json['note'] as String?,
      customerGroupId: json['customerGroupId'] as String?,
      customerGroupName: json['customerGroupName'] as String?,
      id: json['id'] as String,
      creationTime: json['creationTime'] == null
          ? null
          : DateTime.parse(json['creationTime'] as String),
      lastModificationTime: json['lastModificationTime'] == null
          ? null
          : DateTime.parse(json['lastModificationTime'] as String),
    );

Map<String, dynamic> _$$_UserEntityToJson(_$_UserEntity instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'avatarUrl': instance.avatarUrl,
      'note': instance.note,
      'customerGroupId': instance.customerGroupId,
      'customerGroupName': instance.customerGroupName,
      'id': instance.id,
      'creationTime': instance.creationTime?.toIso8601String(),
      'lastModificationTime': instance.lastModificationTime?.toIso8601String(),
    };

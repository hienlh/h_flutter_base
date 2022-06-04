// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserEntity _$$_UserEntityFromJson(Map<String, dynamic> json) =>
    _$_UserEntity(
      fullName: json['FullName'] as String?,
      email: json['Email'] as String,
      phone: json['Phone'] as String?,
      address: json['Address'] as String?,
      dateOfBirth: json['DateOfBirth'] == null
          ? null
          : DateTime.parse(json['DateOfBirth'] as String),
      avatarUrl: json['AvatarUrl'] as String?,
      note: json['Note'] as String?,
      customerGroupId: json['CustomerGroupId'] as String?,
      customerGroupName: json['CustomerGroupName'] as String?,
      id: json['Id'] as String,
      creationTime: json['CreationTime'] == null
          ? null
          : DateTime.parse(json['CreationTime'] as String),
      lastModificationTime: json['LastModificationTime'] == null
          ? null
          : DateTime.parse(json['LastModificationTime'] as String),
    );

Map<String, dynamic> _$$_UserEntityToJson(_$_UserEntity instance) =>
    <String, dynamic>{
      'FullName': instance.fullName,
      'Email': instance.email,
      'Phone': instance.phone,
      'Address': instance.address,
      'DateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'AvatarUrl': instance.avatarUrl,
      'Note': instance.note,
      'CustomerGroupId': instance.customerGroupId,
      'CustomerGroupName': instance.customerGroupName,
      'Id': instance.id,
      'CreationTime': instance.creationTime?.toIso8601String(),
      'LastModificationTime': instance.lastModificationTime?.toIso8601String(),
    };

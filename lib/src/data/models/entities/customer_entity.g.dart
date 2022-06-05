// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerEntity _$$_CustomerEntityFromJson(Map<String, dynamic> json) =>
    _$_CustomerEntity(
      id: json['id'] as String,
      fullName: json['fullName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      note: json['note'] as String?,
      customerGroupId: json['customerGroupId'] as String?,
      customerGroupName: json['customerGroupName'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      creationTime: json['creationTime'] == null
          ? null
          : DateTime.parse(json['creationTime'] as String),
    );

Map<String, dynamic> _$$_CustomerEntityToJson(_$_CustomerEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'avatarUrl': instance.avatarUrl,
      'note': instance.note,
      'customerGroupId': instance.customerGroupId,
      'customerGroupName': instance.customerGroupName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'creationTime': instance.creationTime?.toIso8601String(),
    };

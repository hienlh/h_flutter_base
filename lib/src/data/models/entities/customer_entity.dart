import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'customer_entity.freezed.dart';
part 'customer_entity.g.dart';

@freezed
class CustomerEntity with _$CustomerEntity {
  const factory CustomerEntity({
    required String id,
    String? fullName,
    String? email,
    String? phone,
    String? address,
    String? avatarUrl,
    String? note,
    String? customerGroupId,
    String? customerGroupName,
    DateTime? dateOfBirth,
    DateTime? creationTime,
  }) = _CustomerEntity;

  factory CustomerEntity.fromJson(Map<String, Object?> json) =>
      _$CustomerEntityFromJson(json);
}

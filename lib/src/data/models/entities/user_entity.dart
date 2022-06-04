import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory UserEntity({
    String? fullName,
    required String email,
    String? phone,
    String? address,
    DateTime? dateOfBirth,
    String? avatarUrl,
    String? note,
    String? customerGroupId,
    String? customerGroupName,
    required String id,
    DateTime? creationTime,
    DateTime? lastModificationTime,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, Object?> json) =>
      _$UserEntityFromJson(json);
}

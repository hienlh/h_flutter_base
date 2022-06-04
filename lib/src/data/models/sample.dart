import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sample.freezed.dart';
part 'sample.g.dart';

@freezed
class Person with _$Person {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  const factory Person({
    required String firstName,
    required String lastName,
    required int age,
  }) = _Person;

  factory Person.fromJson(Map<String, Object?> json) => _$PersonFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserModel({
    required int id,
    String? name,
    String? email,
    String? phone,
    @JsonKey(name: 'image_url') String? avatar,
  }) = _UserModel;
}

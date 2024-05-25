import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_configs_model.freezed.dart';
part 'app_configs_model.g.dart';

@freezed
class AppConfigModel with _$AppConfigModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AppConfigModel({
    String? type,
    bool? value,
  }) = _AppConfigModel;

  factory AppConfigModel.fromJson(Map<String, Object?> json) =>
      _$AppConfigModelFromJson(json);
}

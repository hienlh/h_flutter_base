import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'file_upload_res.freezed.dart';
part 'file_upload_res.g.dart';

@freezed
class FileUploadRes with _$FileUploadRes {
  const factory FileUploadRes({
    bool? isImage,
    int? imageWidthPx,
    int? imageHeightPx,
    String? imageDominantHexColor,
    String? name,
    String? mimeType,
    String? fileUrl,
    String? location,
  }) = _FileUploadRes;

  factory FileUploadRes.fromJson(Map<String, Object?> json) =>
      _$FileUploadResFromJson(json);
}

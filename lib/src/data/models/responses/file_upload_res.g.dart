// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_upload_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FileUploadRes _$$_FileUploadResFromJson(Map<String, dynamic> json) =>
    _$_FileUploadRes(
      isImage: json['isImage'] as bool?,
      imageWidthPx: json['imageWidthPx'] as int?,
      imageHeightPx: json['imageHeightPx'] as int?,
      imageDominantHexColor: json['imageDominantHexColor'] as String?,
      name: json['name'] as String?,
      mimeType: json['mimeType'] as String?,
      fileUrl: json['fileUrl'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$$_FileUploadResToJson(_$_FileUploadRes instance) =>
    <String, dynamic>{
      'isImage': instance.isImage,
      'imageWidthPx': instance.imageWidthPx,
      'imageHeightPx': instance.imageHeightPx,
      'imageDominantHexColor': instance.imageDominantHexColor,
      'name': instance.name,
      'mimeType': instance.mimeType,
      'fileUrl': instance.fileUrl,
      'location': instance.location,
    };

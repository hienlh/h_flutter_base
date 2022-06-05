import 'dart:io';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../generated/l10n.dart';

Future<File?> showImagePickerActionSheet(BuildContext context) async {
  return await showAdaptiveActionSheet(
    context: context,
    title: Text(S.current.selectPictureFrom),
    actions: <BottomSheetAction>[
      BottomSheetAction(
        title: Text(S.current.camera),
        onPressed: () async {
          XFile? image;
          try {
            image = await ImagePicker().pickImage(source: ImageSource.camera);
          } finally {
            Get.back(result: image != null ? File(image.path) : null);
          }
        },
      ),
      BottomSheetAction(
        title: Text(S.current.gallery),
        onPressed: () async {
          XFile? image;
          try {
            image = await ImagePicker().pickImage(source: ImageSource.gallery);
          } catch (e) {
            print(e);
          } finally {
            Get.back(result: image != null ? File(image.path) : null);
          }
        },
      ),
    ],
    cancelAction: CancelAction(title: Text(S.current.cancel)),
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../base/extensions/context_ext.dart';
import '../../../ui/widgets/indicators/loading_indicator.dart';

class LoadingDialog {
  static bool _isShown = false;

  static void show({String? message}) {
    _isShown = true;
    Get.dialog(
      Dialog(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Get.context!.colorScheme.background,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoadingIndicator(),
              if (message != null) ...[
                10.heightBox,
                Text(message),
              ],
            ],
          ),
        ),
      ),
    ).whenComplete(() => _isShown = false);
  }

  static void hide() {
    if (_isShown) Get.back();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../translations/app_translations.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('hello'.tr),
            TextButton(
              onPressed: () {
                if (Get.locale?.languageCode == 'vi') {
                  Get.updateLocale(Locale('en', 'US'));
                } else {
                  Get.updateLocale(Locale('vi', 'VI'));
                }
              },
              child: Text(Get.locale?.title ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/l10n.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(S.current.helloWorld),
            TextButton(
              onPressed: () {
                if (Get.locale?.languageCode == 'vi') {
                  S.load(Locale('en', ''));
                  Get.updateLocale(Locale('en', ''));
                } else {
                  S.load(Locale('vi', ''));
                  Get.updateLocale(Locale('vi', ''));
                }
              },
              child: Text(
                Get.locale?.languageCode == 'vi'
                    ? S.current.english
                    : S.current.vietnamese,
              ),
            ),
            TextButton(
              onPressed: () {
                if (Get.theme.brightness == Brightness.dark) {
                  Get.changeTheme(ThemeData.light());
                } else {
                  Get.changeTheme(ThemeData.dark());
                }
              },
              child: Text(S.current.changeTheme),
            ),
            TextButton(
              onPressed: () {
                throw Exception(
                  '${S.current.unknownError} from ${Platform.isIOS ? 'ios' : 'other'}',
                );
              },
              child: Text('Throw exception'),
            ),
          ],
        ),
      ),
    );
  }
}

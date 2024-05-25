import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenSizeExt on Widget {
  Widget fixedScreenSize(
    BuildContext context, {
    Size designSize = const Size(375, 812),
  }) {
    final screenSize = MediaQuery.of(context).size;
    final needToScale = screenSize.width / screenSize.height > 0.6;

    final screenUtilInit = ScreenUtilInit(
      designSize: designSize,
      builder: (context, child) {
        return this;
      },
    );

    if (!needToScale) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(
          padding: MediaQuery.of(context).padding.copyWith(
                top: kIsWeb ? 40 : MediaQuery.of(context).padding.top,
                bottom: kIsWeb ? 40 : MediaQuery.of(context).padding.bottom,
              ),
        ),
        child: screenUtilInit,
      );
    }

    final customScreenSize = Size(
      screenSize.height / designSize.height * designSize.width,
      screenSize.height,
    );

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        size: customScreenSize,
        devicePixelRatio: 1.0,
        padding: MediaQuery.of(context).padding.copyWith(
              top: kIsWeb ? 40 : MediaQuery.of(context).padding.top,
              bottom: kIsWeb ? 40 : MediaQuery.of(context).padding.bottom,
            ),
      ),
      child: Center(
        child: SizedBox(
          width: customScreenSize.width,
          height: customScreenSize.height,
          child: screenUtilInit,
        ),
      ),
    );
  }
}

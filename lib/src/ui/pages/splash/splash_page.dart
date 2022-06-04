import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/assets.dart';
import '../../widgets/animations/fade_in.dart';
import '../../widgets/indicators/loading_indicator.dart';
import 'splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInTranslate(
                delay: 2,
                startY: 50,
                duration: 150,
                delayDuration: 300,
                child: Image.asset(
                  Assets.images.logo,
                  fit: BoxFit.cover,
                  width: Get.width * 0.8,
                ),
              ),
              FutureBuilder<bool>(
                future: Future.value((() async {
                  await (300 * 4).milliseconds.delay();
                  controller.startApp();
                  return true;
                })()),
                builder: (context, snapshot) {
                  return AnimatedSwitcher(
                    duration: 500.milliseconds,
                    transitionBuilder: (child, animation) => SizeTransition(
                      sizeFactor: animation,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    ),
                    child: Container(
                      key: ValueKey<bool>(snapshot.hasData),
                      height: snapshot.hasData ? 100 : 0,
                      width: Get.width,
                      child: Center(
                        child: LoadingIndicator(color: Get.theme.primaryColor),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

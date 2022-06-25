import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/env.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;
  final bool enable;
  FlavorBanner({required this.child, this.enable = true});

  @override
  Widget build(BuildContext context) {
    return enable
        ? Stack(
            children: <Widget>[child, if (!kReleaseMode) _buildBanner(context)],
          )
        : child;
  }

  BannerConfig _getDefaultBanner() {
    return BannerConfig(
      bannerName: Env.flavor.name.toUpperCase(),
      bannerColor: Colors.red,
    );
  }

  Widget _buildBanner(BuildContext context) {
    final bannerConfig = _getDefaultBanner();
    return Container(
      width: 50,
      height: 50,
      child: CustomPaint(
        painter: BannerPainter(
            message: bannerConfig.bannerName,
            textDirection: Directionality.of(context),
            layoutDirection: Directionality.of(context),
            location: BannerLocation.topStart,
            color: bannerConfig.bannerColor),
      ),
    );
  }
}

class BannerConfig {
  final String bannerName;
  final Color bannerColor;
  BannerConfig({required this.bannerName, required this.bannerColor});
}

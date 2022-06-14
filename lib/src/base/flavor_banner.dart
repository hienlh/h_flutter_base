part of 'app_config.dart';

class FlavorBanner extends StatelessWidget {
  final Widget child;
  FlavorBanner({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[child, if (!kReleaseMode) _buildBanner(context)],
    );
  }

  BannerConfig _getDefaultBanner() {
    return BannerConfig(
      bannerName: AppConfig.shared.flavor.name,
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

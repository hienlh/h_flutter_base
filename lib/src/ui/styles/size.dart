import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

double get appBarHeight => kIsWeb ? 70.hh : 56;

class HTextSize {
  static double get hXSmall => 15.sp;
  static double get hSmall => 16.sp;
  static double get hSNormal => 18.sp;
  static double get hNormal => 20.sp;
  static double get hMedium => 25.sp;
  static double get hLarge => 30.sp;
  static double get hXLarge => 35.sp;
  static double get hXXLarge => 45.sp;
}

extension TextSizeExt on VxTextBuilder {
  VxTextBuilder get hXSmall => size(HTextSize.hXSmall);
  VxTextBuilder get hSmall => size(HTextSize.hSmall);
  VxTextBuilder get hSNormal => size(HTextSize.hSNormal);
  VxTextBuilder get hNormal => size(HTextSize.hNormal);
  VxTextBuilder get hMedium => size(HTextSize.hMedium);
  VxTextBuilder get hLarge => size(HTextSize.hLarge);
  VxTextBuilder get hXLarge => size(HTextSize.hXLarge);
  VxTextBuilder get hXXLarge => size(HTextSize.hXXLarge);
}

extension NumExt on num {
  Widget get hHeightBox => h.heightBox;
  Widget get hWidthBox => w.widthBox;

  double get hh => h;
  double get hw => w;
  double get hsp => sp;
  double get hsw => sw;
  double get hsh => sh;
  double get hr => r;

  EdgeInsets get hPadHor => EdgeInsets.symmetric(horizontal: w);
  EdgeInsets get hPadVer => EdgeInsets.symmetric(vertical: h);
  EdgeInsets get hPadAll => EdgeInsets.all(w);
  EdgeInsets get hPadSym => EdgeInsets.symmetric(horizontal: w, vertical: h);
  EdgeInsets get hPadLeft => EdgeInsets.only(left: w);
  EdgeInsets get hPadRight => EdgeInsets.only(right: w);
  EdgeInsets get hPadTop => EdgeInsets.only(top: h);
  EdgeInsets get hPadBottom => EdgeInsets.only(bottom: h);

  BorderRadius get hRadius => BorderRadius.circular(r);
}

extension WidgetExt on Widget {
  Widget hPadHor(double value) => Padding(padding: value.hPadHor, child: this);
  Widget hPadVer(double value) => Padding(padding: value.hPadVer, child: this);
  Widget hPadAll(double value) => Padding(padding: value.hPadAll, child: this);
  Widget hPadSym(double value) => Padding(padding: value.hPadSym, child: this);
  Widget hPadLeft(double value) =>
      Padding(padding: value.hPadLeft, child: this);
  Widget hPadRight(double value) =>
      Padding(padding: value.hPadRight, child: this);
  Widget hPadTop(double value) => Padding(padding: value.hPadTop, child: this);
  Widget hPadBottom(double value) =>
      Padding(padding: value.hPadBottom, child: this);
}

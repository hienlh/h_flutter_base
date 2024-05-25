import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HTheme {
  final Color bgColor;
  final Color secondBgColor;
  final Color onBgColor;
  final Color onSecondBgColor;
  final Color textColor;
  final Color linkColor;
  final Color errorTextColor;
  final Color buttonBgColor;
  final Color buttonSecondBgColor;
  final Color buttonTextColor;
  final Color buttonSecondaryTextColor;
  final Color dialogTextColor;

  HTheme({
    required this.bgColor,
    required this.secondBgColor,
    required this.onBgColor,
    required this.onSecondBgColor,
    required this.textColor,
    required this.linkColor,
    required this.errorTextColor,
    required this.buttonBgColor,
    required this.buttonSecondBgColor,
    required this.buttonTextColor,
    required this.buttonSecondaryTextColor,
    required this.dialogTextColor,
  });

  // Default theme
  static HTheme d = HTheme(
    bgColor: Color(0xffffffff),
    secondBgColor: Color(0xffD2FFFF),
    onBgColor: Color(0xFF000000),
    onSecondBgColor: Color(0xFF000000),
    textColor: Color(0xff60FFFF),
    linkColor: Color(0xff0066FE),
    errorTextColor: Color(0xffF42C2C),
    buttonBgColor: Color(0xff00C3CB),
    buttonSecondBgColor: Color(0xff0063C9),
    buttonTextColor: Color(0xffD2FFFF),
    buttonSecondaryTextColor: Colors.white,
    dialogTextColor: Color(0xff707070),
  );
}

extension VxTextBuilderExt on VxTextBuilder {
  VxTextBuilder get hTextColor => color(HTheme.d.textColor);
  VxTextBuilder get hLinkColor => color(HTheme.d.linkColor);
  VxTextBuilder get hErrorTextColor => color(HTheme.d.errorTextColor);
  VxTextBuilder get hBtnTextColor => color(HTheme.d.buttonTextColor);
  VxTextBuilder get hBtnTextColor2 => color(HTheme.d.buttonSecondaryTextColor);
  VxTextBuilder get hDialogTextColor => color(HTheme.d.dialogTextColor);
  VxTextBuilder get hOnBgColor => color(HTheme.d.onBgColor);
  VxTextBuilder get hOnSecondBgColor => color(HTheme.d.onSecondBgColor);
}

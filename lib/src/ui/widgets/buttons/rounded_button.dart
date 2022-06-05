import 'package:flutter/material.dart';
import 'package:trihai_admin_app/src/base/extensions/context_ext.dart';
import 'package:velocity_x/velocity_x.dart';

class RoundedButton extends StatelessWidget {
  final Widget title;
  final Widget? icon;
  final Color? backgroundColor;
  final EdgeInsets padding;
  final double radius;
  final double elevation;
  final BorderSide? borderSide;
  final void Function()? onPressed;
  final Widget? suffixIcon;

  const RoundedButton({
    Key? key,
    required this.title,
    this.icon,
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    this.radius = 90,
    this.elevation = 2,
    this.onPressed,
    this.borderSide,
    this.suffixIcon,
  }) : super(key: key);

  factory RoundedButton.large({
    required String title,
    IconData? icon,
    Color? backgroundColor,
    Color textColor = Colors.white,
    bool isUpperCase = false,
    void Function()? onPressed,
    double radius = 90,
    Widget? suffixIcon,
  }) =>
      RoundedButton(
        icon: icon != null ? Icon(icon, color: textColor, size: 14) : null,
        title: Text(isUpperCase ? title.toUpperCase() : title,
            style: TextStyle(fontSize: 16, color: textColor)),
        backgroundColor: backgroundColor,
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        radius: radius,
        suffixIcon: suffixIcon,
        elevation: 0,
      );

  factory RoundedButton.outlined({
    required String title,
    IconData? icon,
    Color? backgroundColor,
    Color textColor = Colors.white,
    bool isUpperCase = false,
    void Function()? onPressed,
    Color borderColor = Colors.black,
  }) =>
      RoundedButton(
        icon: icon != null ? Icon(icon, color: textColor, size: 14) : null,
        title: Text(isUpperCase ? title.toUpperCase() : title,
            style: TextStyle(fontSize: 16, color: textColor)),
        backgroundColor: backgroundColor,
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        elevation: 0,
        borderSide: BorderSide(color: borderColor),
      );

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      primary: backgroundColor,
      padding: padding,
      minimumSize: Size.zero,
      elevation: elevation,
      onSurface: context.colorScheme.primary,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: borderSide ?? BorderSide.none,
      ),
    );
    final titleWidget = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        title,
        if (suffixIcon != null) ...[2.widthBox, suffixIcon!],
      ],
    );
    return icon != null
        ? ElevatedButton.icon(
            onPressed: onPressed,
            style: buttonStyle,
            icon: icon!,
            label: titleWidget,
          )
        : ElevatedButton(
            onPressed: onPressed,
            style: buttonStyle,
            child: titleWidget,
          );
  }
}

class SmallRoundedButton extends RoundedButton {
  SmallRoundedButton({
    required String title,
    IconData? icon,
    Widget? iconWidget,
    Color? backgroundColor,
    Color textColor = Colors.white,
    void Function()? onPressed,
  }) : super(
          icon: iconWidget ??
              (icon != null ? Icon(icon, color: textColor, size: 14) : null),
          title: Text(title, style: TextStyle(fontSize: 10, color: textColor)),
          backgroundColor: backgroundColor,
          onPressed: onPressed,
          padding: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: iconWidget != null || icon != null ? 4 : 12,
          ),
        );
}

class MediumRoundedButton extends RoundedButton {
  MediumRoundedButton({
    required String title,
    IconData? icon,
    Color? backgroundColor,
    Color textColor = Colors.white,
    bool isUpperCase = false,
    void Function()? onPressed,
  }) : super(
          icon: icon != null ? Icon(icon, color: textColor, size: 14) : null,
          title: Text(isUpperCase ? title.toUpperCase() : title,
              style: TextStyle(fontSize: 10, color: textColor)),
          backgroundColor: backgroundColor,
          onPressed: onPressed,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        );
}

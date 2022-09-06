import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../indicators/loading_indicator.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.onPressed,
    this.text,
    this.isLoading = false,
    this.suffixIcon,
    this.icon,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  final Function()? onPressed;
  final String? text;
  final bool isLoading;
  final Widget? suffixIcon;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: isLoading ? null : onPressed,
      padding: EdgeInsets.zero,
      pressedOpacity: 0.7,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: backgroundColor ?? context.theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: !isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[icon!],
                  if (text != null) ...[
                    20.widthBox,
                    text!.text
                        .size(18)
                        .color(textColor ?? Colors.white)
                        .makeCentered(),
                    20.widthBox
                  ],
                  if (suffixIcon != null) ...[suffixIcon!],
                ],
              )
            : LoadingIndicator(size: 24, color: Colors.white),
      ),
    );
  }
}

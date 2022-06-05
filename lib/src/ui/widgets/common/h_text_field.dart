import 'package:flutter/material.dart';
import 'package:trihai_admin_app/src/base/extensions/context_ext.dart';

import '../indicators/loading_indicator.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    this.borderColor,
    this.initialValue,
    this.validator,
    this.hintText,
    this.onChanged,
    this.focusNode,
    this.keyboardType,
    this.obscureText = false,
    this.enabled = true,
    this.fontSize = 18,
    this.suffixIcon,
    this.prefixIcon,
    this.backgroundColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
    this.contentPadding = const EdgeInsets.all(14),
    this.textAlign = TextAlign.start,
    this.decoration,
    this.isLoading = false,
    this.onUnfocus,
    this.autovalidateMode,
  }) : super(key: key) {
    controller.text = initialValue ?? '';
  }

  final String? initialValue;
  final String? hintText;
  final Color? borderColor;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onUnfocus;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final double fontSize;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final BorderRadius borderRadius;
  final EdgeInsets contentPadding;
  final TextAlign textAlign;
  final InputDecoration? decoration;
  final bool isLoading;
  final TextEditingController controller = TextEditingController();
  final AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    final borderColor = this.borderColor ?? context.colorScheme.primary;
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus) {
          onUnfocus?.call(controller.text);
        }
      },
      child: TextFormField(
        autovalidateMode: autovalidateMode,
        readOnly: isLoading || !enabled,
        focusNode: focusNode,
        onChanged: onChanged,
        keyboardType: keyboardType,
        validator: validator,
        controller: controller,
        obscureText: obscureText,
        decoration: decoration ??
            InputDecoration(
              fillColor: backgroundColor,
              filled: backgroundColor != null,
              enabledBorder: OutlineInputBorder(
                borderRadius: borderRadius,
                borderSide: BorderSide(color: borderColor, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1.0),
                borderRadius: borderRadius,
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1.0),
                borderRadius: borderRadius,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 1.0),
                borderRadius: borderRadius,
              ),
              hintText: hintText,
              contentPadding: contentPadding,
              hintStyle: TextStyle(fontSize: fontSize),
              suffixIcon: isLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        LoadingIndicator(
                          size: 24,
                          padding: EdgeInsets.only(right: 10),
                        ),
                      ],
                    )
                  : suffixIcon,
              prefixIcon: prefixIcon,
            ),
        style: TextStyle(fontSize: fontSize),
        textAlign: textAlign,
      ),
    );
  }
}

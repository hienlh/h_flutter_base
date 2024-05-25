import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
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
    this.contentPadding,
    this.isDense = false,
    this.focusBorderColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(15)),
    this.inputFormatters,
    this.textAlign = TextAlign.start,
    this.decoration,
  });

  factory CustomTextField.intRange({
    Key? key,
    String? initialValue,
    String? hintText,
    Color? borderColor,
    Color? focusBorderColor,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    bool obscureText = false,
    bool enabled = true,
    double fontSize = 18,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? backgroundColor,
    EdgeInsets? contentPadding,
    bool isDense = false,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(30)),
    List<TextInputFormatter>? inputFormatters,
    int min = 0,
    int max = 0,
  }) {
    return CustomTextField(
      key: key,
      initialValue: initialValue,
      hintText: hintText,
      borderColor: borderColor,
      focusBorderColor: focusBorderColor,
      validator: validator,
      onChanged: onChanged,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enabled: enabled,
      fontSize: fontSize,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      backgroundColor: backgroundColor,
      contentPadding: contentPadding,
      isDense: isDense,
      borderRadius: borderRadius,
      inputFormatters: [
        ...inputFormatters ?? [],
        NumericalRangeFormatter(
          min: min.toDouble(),
          max: max.toDouble(),
        )
      ],
    );
  }

  final String? initialValue;
  final String? hintText;
  final Color? borderColor;
  final Color? focusBorderColor;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final double fontSize;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final EdgeInsets? contentPadding;
  final bool isDense;
  final BorderRadius borderRadius;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    final borderColor = this.borderColor ?? context.theme.colorScheme.onSurface;
    final focusBorderColor =
        this.focusBorderColor ?? context.theme.colorScheme.primary;
    return TextFormField(
      readOnly: !enabled,
      initialValue: initialValue,
      focusNode: focusNode,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      inputFormatters: inputFormatters,
      decoration: decoration ??
          InputDecoration(
            fillColor: backgroundColor,
            filled: backgroundColor != null,
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: borderColor, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: focusBorderColor, width: 1.0),
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
            contentPadding: contentPadding ?? EdgeInsets.all(14),
            isDense: isDense,
            hintStyle: TextStyle(fontSize: fontSize),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
      style: TextStyle(fontSize: fontSize),
      textAlign: textAlign,
    );
  }
}

class NumericalRangeFormatter extends TextInputFormatter {
  final double min;
  final double max;

  NumericalRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final oldV = int.tryParse(oldValue.text) ?? 0;
    final newV = int.tryParse(newValue.text) ?? 0;

    if (oldV < min) {
      return TextEditingValue().copyWith(text: min.toString());
    } else {
      return newV > max ? oldValue : newValue;
    }
  }
}

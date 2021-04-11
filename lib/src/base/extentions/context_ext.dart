import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Size get size => MediaQuery.of(this).size;
}
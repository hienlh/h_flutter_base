import 'package:flutter/material.dart';
import 'package:flutter_base/src/base/extentions/context_ext.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;
  final Color? color;
  final EdgeInsets padding;

  const LoadingIndicator({
    Key? key,
    this.size = 50,
    this.color,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: LinearProgressIndicator(
        color: color ?? context.colorScheme.primary,
      ),
    );
  }
}

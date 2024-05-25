import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../styles/theme.dart';

class PrimaryScaffold extends StatelessWidget {
  final Widget? body;
  final ScrollController? scrollController;
  final Widget? footer;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final Function? onBack;
  final bool extendBodyBehindAppBar;
  final bool extendBody;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final List<Widget> floats;
  final bool enableCupertinoScaffold;
  final Color? backgroundColor;

  PrimaryScaffold({
    super.key,
    this.body,
    this.scrollController,
    this.footer,
    this.bottomNavigationBar,
    this.appBar,
    this.drawer,
    this.onBack,
    this.floatingActionButton,
    this.extendBodyBehindAppBar = false,
    this.extendBody = false,
    this.floatingActionButtonLocation,
    this.floats = const [],
    this.enableCupertinoScaffold = true,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final scaffold = GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          appBar: appBar,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          extendBody: extendBody,
          backgroundColor: backgroundColor ?? HTheme.d.bgColor,
          drawer: drawer,
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
        ),
      ),
    );

    return Material(
      child: cupertinoScaffold(
        body: scaffold,
      ),
    );
  }

  Widget cupertinoScaffold({required Widget body}) {
    return enableCupertinoScaffold ? CupertinoScaffold(body: body) : body;
  }
}

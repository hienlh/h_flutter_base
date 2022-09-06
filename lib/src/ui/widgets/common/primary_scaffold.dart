import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PrimaryScaffold extends StatelessWidget {
  final Widget? body;
  final ScrollController? scrollController;
  final Widget? footer;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final Function? onBack;
  final double loadingBackgroundOpacity;
  final bool extendBodyBehindAppBar;
  final bool extendBody;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final List<Widget> floats;
  final bool enableCupertinoScaffold;
  final Color? backgroundColor;

  PrimaryScaffold({
    Key? key,
    this.body,
    this.scrollController,
    this.footer,
    this.bottomNavigationBar,
    this.appBar,
    this.drawer,
    this.onBack,
    this.floatingActionButton,
    this.loadingBackgroundOpacity = 0.5,
    this.extendBodyBehindAppBar = false,
    this.extendBody = false,
    this.floatingActionButtonLocation,
    this.floats = const [],
    this.enableCupertinoScaffold = true,
    this.backgroundColor,
  }) : super(key: key);

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
          backgroundColor:
              backgroundColor ?? context.theme.colorScheme.background,
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
        body: Stack(
          children: [
            if (context.height > context.width && kIsWeb)
              Center(
                child: SizedBox(
                  width: context.height * 9 / 19.5,
                  child: scaffold,
                ),
              )
            else
              scaffold,
            if (floats.isNotEmpty) ...floats,
          ],
        ),
      ),
    );
  }

  Widget cupertinoScaffold({required Widget body}) {
    return enableCupertinoScaffold ? CupertinoScaffold(body: body) : body;
  }
}

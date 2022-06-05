import 'package:flutter/material.dart';

const _kLockTime = 2;

mixin LoadMoreMixin<T extends StatefulWidget> on State<T> {
  final ScrollController scrollController = ScrollController();
  bool _isLocking = false;

  double get bottomOffset => 20;

  @protected
  @mustCallSuper
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (!_isLocking) {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - bottomOffset) {
          _isLocking = true;
          onLoadMore();

          Future.delayed(Duration(seconds: _kLockTime)).then((_) {
            _isLocking = false;
          });
        }
      }
    });
  }

  @protected
  void onLoadMore();
}

mixin LoadMoreActionMixin {
  final ScrollController scrollController = ScrollController();
  bool _isLocking = false;

  double get bottomOffset => 20;

  void initLoadMore() {
    scrollController.addListener(() {
      if (!_isLocking) {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - bottomOffset) {
          _isLocking = true;
          onLoadMore();

          Future.delayed(Duration(seconds: _kLockTime)).then((_) {
            _isLocking = false;
          });
        }
      }
    });
  }

  @protected
  void onLoadMore();
}

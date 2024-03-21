import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import 'main_tab_enum.dart';

class MainController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final AuthController _authController;
  MainController(this._authController);

  late final TabController tabController = TabController(
    vsync: this,
    length: MainTabEnum.values.length,
  )..index = MainTabEnum.home.index;

  final _selectedTab = MainTabEnum.menu.obs;
  MainTabEnum get selectedTab => _selectedTab.value;

  Future changeTab(MainTabEnum tab) async {
    try {
      if ([MainTabEnum.setting].contains(tab)) {
        await _authController.requireLoginAction();
      }
      _selectedTab.value = tab;
      tabController.animateTo(MainTabEnum.values.indexOf(selectedTab));
    } catch (e) {
      // ignore: avoid_catches_without_on_clauses
    }
  }
}

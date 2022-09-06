import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/common/primary_scaffold.dart';
import 'main_controller.dart';
import 'main_tab_enum.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController(Get.find()));
  }
}

class MainPage extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      extendBody: true,
      bottomNavigationBar: Obx(
        () => MainBottomNav(
          tabController: controller.tabController,
          onSelected: controller.changeTab,
          selected: controller.selectedTab.index,
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.tabController,
        children: MainTabEnum.values.map((e) => e.page).toList(),
      ),
    );
  }
}

class MainBottomNav extends StatelessWidget {
  const MainBottomNav({
    Key? key,
    required this.tabController,
    this.onSelected,
    required this.selected,
  }) : super(key: key);

  final TabController tabController;
  final Function(MainTabEnum selected)? onSelected;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, -2),
          ),
        ],
        color: context.theme.colorScheme.background.withOpacity(0.9),
      ),
      child: SafeArea(
        child: TabBar(
          controller: tabController,
          onTap: (index) {
            if (selected == index) return;
            tabController.index = tabController.previousIndex;
            onSelected?.call(MainTabEnum.values[index]);
          },
          labelColor: context.theme.colorScheme.onBackground,
          unselectedLabelColor: context.theme.colorScheme.surface,
          tabs: MainTabEnum.values.map((item) {
            return StatefulBuilder(builder: (context, setState) {
              tabController.addListener(() {
                setState(() {});
              });
              final isSelected = tabController.index == item.index;
              return Tab(
                icon: AnimatedRotation(
                  turns: isSelected ? 1.0 / 50.0 : 0,
                  duration: const Duration(milliseconds: 300),
                  child: Icon(
                    item.iconData,
                    color: context.theme.colorScheme.onBackground
                        .withOpacity(isSelected ? 1 : 0.5),
                    size: 24,
                  ),
                ),
              );
            });
          }).toList(),
        ),
      ),
    );
  }
}

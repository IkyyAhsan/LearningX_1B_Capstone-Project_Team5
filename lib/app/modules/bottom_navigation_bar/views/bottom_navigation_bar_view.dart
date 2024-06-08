import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';

class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
  const BottomNavigationBarView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavigationBarController());
    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      bottomNavigationBar: Obx(
        () => ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            indicatorColor: Colors.transparent,
            onDestinationSelected: (index) => controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(icon: Icon(FluentIcons.home_20_regular), label: "Home", selectedIcon: Icon(FluentIcons.home_20_filled, color: SlectivColors.loginButtonColor,),),
              NavigationDestination(icon: Icon(FluentIcons.calendar_phone_20_regular), label: "Information", selectedIcon: Icon(FluentIcons.calendar_phone_20_filled, color: SlectivColors.loginButtonColor,)),
              NavigationDestination(icon: Icon(FluentIcons.document_multiple_20_regular), label: "Portofolio", selectedIcon: Icon(FluentIcons.document_multiple_20_filled, color: SlectivColors.loginButtonColor,)),
              NavigationDestination(icon: Icon(FluentIcons.person_20_regular), label: "Profile", selectedIcon: Icon(FluentIcons.person_20_filled, color: SlectivColors.loginButtonColor,))
            ]
          ),
        )
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

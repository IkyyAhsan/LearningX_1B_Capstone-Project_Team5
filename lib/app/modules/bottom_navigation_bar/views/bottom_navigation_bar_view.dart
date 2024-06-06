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
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(FluentIcons.home_20_regular), label: "Home"),
            NavigationDestination(icon: Icon(FluentIcons.calendar_phone_20_regular), label: "Information"),
            NavigationDestination(icon: Icon(FluentIcons.document_multiple_20_regular), label: "Portofolio"),
            NavigationDestination(icon: Icon(FluentIcons.person_20_regular), label: "Profile")
          ]
        )
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

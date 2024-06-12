import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'package:slectiv_studio_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
  const BottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavigationBarController());
    final profileController = Get.find<ProfileController>(); // Pastikan Anda sudah menginisialisasi ProfileController

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
            destinations: [
              const NavigationDestination(
                icon: Icon(FluentIcons.home_24_regular),
                label: SlectivTexts.homeLabel,
                selectedIcon: Icon(FluentIcons.home_24_filled, color: SlectivColors.loginButtonColor,),
              ),
              const NavigationDestination(
                icon: Icon(FluentIcons.camera_add_24_regular),
                label: SlectivTexts.informationLabel,
                selectedIcon: Icon(FluentIcons.camera_add_24_filled, color: SlectivColors.loginButtonColor,),
              ),
              const NavigationDestination(
                icon: Icon(FluentIcons.document_bullet_list_24_regular),
                label: SlectivTexts.portofolioLabel,
                selectedIcon: Icon(FluentIcons.document_bullet_list_24_filled, color: SlectivColors.loginButtonColor,),
              ),
              NavigationDestination(
                icon: Obx(() => _buildProfileIcon(profileController, false)),
                label: SlectivTexts.profileLabel,
                selectedIcon: Obx(() => _buildProfileIcon(profileController, true)),
              ),
            ],
          ),
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }

  Widget _buildProfileIcon(ProfileController profileController, bool isSelected) {
    final userImage = profileController.profileImageUrl.value;

    return userImage.isNotEmpty
        ? CircleAvatar(
            backgroundImage: NetworkImage(userImage),
            radius: 12,
            backgroundColor: Colors.transparent,
          )
        : Icon(
            isSelected ? FluentIcons.person_24_filled : FluentIcons.person_24_regular,
            color: isSelected ? SlectivColors.loginButtonColor : null,
          );
  }
}

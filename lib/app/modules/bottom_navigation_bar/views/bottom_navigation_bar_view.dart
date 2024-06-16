import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'package:slectiv_studio_app/app/modules/bottom_navigation_bar/views/widgets/booking_destination.dart';
import 'package:slectiv_studio_app/app/modules/bottom_navigation_bar/views/widgets/gallery_destination.dart';
import 'package:slectiv_studio_app/app/modules/bottom_navigation_bar/views/widgets/home_destination.dart';
import 'package:slectiv_studio_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
  const BottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavigationBarController());
    final profileController = Get.find<ProfileController>();

    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,

      // -- Navigate Destination
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
              const SlectivHomeDestination(),
              const SlectivBookingDestination(),
              const SlectivGalleryDestination(),
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
            color: isSelected ? SlectivColors.submitButtonColor : null,
          );
  }
}
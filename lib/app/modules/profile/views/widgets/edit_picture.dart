import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/profile/controllers/profile_controller.dart';

class SlectivEditPicture extends StatelessWidget {
  const SlectivEditPicture({
    super.key,
    required this.profileController,
  });

  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Obx(() {
          return CircleAvatar(
            radius: 65,
            backgroundColor: Colors.grey.shade800,
            backgroundImage:
                profileController.profileImageUrl.value.isNotEmpty
                    ? NetworkImage(
                        profileController.profileImageUrl.value)
                    : null,
            child: profileController.profileImageUrl.value.isEmpty
                ? const Icon(
                    FluentIcons.person_20_regular,
                    color: Colors.white,
                    size: 65,
                  )
                : null,
          );
        }),
        Positioned(
          top: 80,
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 2),
                  blurRadius: 4,
                ),
              ],
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
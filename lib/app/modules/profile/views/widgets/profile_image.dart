import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivProfileEmail extends StatelessWidget {
  const SlectivProfileEmail({
    super.key,
    required this.profileController,
  });

  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Obx(() => TextField(
        controller: TextEditingController(
          text: profileController.email.value,
        ),
        decoration: const InputDecoration(
          labelText: SlectivTexts.email,
          enabled: false, // Disable editing
        ),
      )),
    );
  }
}
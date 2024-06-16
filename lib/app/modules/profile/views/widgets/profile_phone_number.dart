import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivProfilePhoneNumber extends StatelessWidget {
  const SlectivProfilePhoneNumber({
    super.key,
    required this.profileController,
  });

  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Obx(
        () => TextField(
          controller: TextEditingController(
            text: profileController.phoneNumber.value,
          ),
          readOnly: true,
          onTap: () {
            Get.dialog(
              AlertDialog(
                title: const Text(SlectivTexts.changePhoneNumber),
                content: TextField(
                  controller: TextEditingController(
                    text: profileController.phoneNumber.value
                  ),
                  decoration: const InputDecoration(
                    labelText: SlectivTexts.changeYourPhoneNumber,
                    hintText: SlectivTexts.enterNewPhoneNumber,
                  ),
                  onChanged: (value) {
                    profileController.phoneNumber.value = value;
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(SlectivTexts.cancel)
                  ),
                  TextButton(
                    onPressed: () {
                      profileController.updatePhoneNumber(profileController.phoneNumber.value);
                      Get.back();
                    },
                    child: const Text(SlectivTexts.save)
                  ),
                ],
              ),
            );
          },
          decoration: const InputDecoration(
            labelText: SlectivTexts.phoneNumber,
          ),
        ),
      ),
    );
  }
}
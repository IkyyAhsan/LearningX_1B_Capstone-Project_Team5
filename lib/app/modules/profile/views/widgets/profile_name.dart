import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivProfileName extends StatelessWidget {
  const SlectivProfileName({
    super.key,
    required this.profileController,
  });

  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
          onTap: () {
            Get.dialog(
              AlertDialog(
                title: const Text(SlectivTexts.changeName),
                content: TextField(
                  controller:
                      TextEditingController(text: profileController.name.value),
                  decoration: const InputDecoration(
                    labelText: SlectivTexts.changeYourName,
                    hintText: SlectivTexts.enterNewName,
                  ),
                  onChanged: (value) {
                    profileController.name.value = value;
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text(SlectivTexts.cancel),
                  ),
                  TextButton(
                    onPressed: () {
                      profileController.updateName(profileController.name.value);
                      Get.back();
                    },
                    child: const Text(SlectivTexts.save),
                  ),
                ],
              ),
            );
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    profileController.name.value,
                    style: GoogleFonts.spaceGrotesk(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: SlectivColors.profileNameColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ));
  }
}

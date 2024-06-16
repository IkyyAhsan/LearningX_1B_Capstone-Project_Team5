import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivHelloToUser extends StatelessWidget {
  const SlectivHelloToUser({
    super.key,
    required this.profileController,
  });

  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text("${SlectivTexts.hallo} ${profileController.name.value}", style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: SlectivColors.titleColor)),));
  }
}
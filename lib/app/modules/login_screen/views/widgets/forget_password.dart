import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/modules/forget_password_screen/views/forget_password_screen_view.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivForgetPassword extends StatelessWidget {
  const SlectivForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => Get.to(ForgetPasswordScreenView()),
          child: Text(SlectivTexts.forgetPassword, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: SlectivColors.blackColor))),
          )
      ],
    );
  }
}
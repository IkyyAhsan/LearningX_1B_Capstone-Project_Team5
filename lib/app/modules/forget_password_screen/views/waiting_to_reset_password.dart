import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:slectiv_studio_app/app/modules/forget_password_screen/controllers/forget_password_screen_controller.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/login_screen_view.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/authentication_header.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/submit_button.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/image_strings.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class WaitingToResetPassword extends StatelessWidget {
  const WaitingToResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final ForgetPasswordController = Get.put(ForgetPasswordScreenController());
    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24,),
              const SlectivAuthenticationHeader(),
              const SizedBox(height: 36,),

              Lottie.asset(SlectivImages.waitingToResetPassword),
              Text(ForgetPasswordController.emailController.text),
              const SizedBox(height: 5,),
              Text(
                SlectivTexts.forgetPasswordWaitingToResetTitle, 
                textAlign: TextAlign.center,
                style: GoogleFonts.spaceGrotesk(
                  textStyle: TextStyle(
                    fontSize: 28, 
                    fontWeight: FontWeight.bold, 
                    color: SlectivColors.blackColor
                  )
                )
              ),
              const SizedBox(height: 5,),
              Text(
                SlectivTexts.forgetPasswordWaitingToResetSubtitle,
                textAlign: TextAlign.center, 
                style: GoogleFonts.spaceGrotesk(
                  textStyle: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.w500, 
                    color: SlectivColors.blackColor
                  ),
                ),
              ),
              const SizedBox(height: 32,),
              SlectiveWidgetButton(buttonName: SlectivTexts.successfullyResetPassword, onPressed: () => Get.offAll(LoginScreenView()), backgroundColor: SlectivColors.forgetPasswordButtonColor)
            ],
          ),
        )
      ),
    );
  }
}
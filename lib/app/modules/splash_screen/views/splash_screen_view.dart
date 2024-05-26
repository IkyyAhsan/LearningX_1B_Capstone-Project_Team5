import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/modules/splash_screen/views/widgets/center_logo.dart';
import 'package:slectiv_studio_app/app/routes/app_pages.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/image_strings.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      initState: (_){
        Timer(const Duration(seconds: 3), () {
          Get.offAllNamed(Routes.ONBOARDING_SCREEN);
        });
      },
      builder: (context){
        return Scaffold(
          backgroundColor: SlectivColors.backgroundColor,
          body: Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CenterLogo(
                  logo: SlectivImages.applogo,
                  width: 300,
                  height: 100,
                ),
                const SizedBox(height: 16,),
                Text(SlectivTexts.splashTextDesc, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF1A1A1A))),)
              ],
            ),
          ),
        );
      }
    );
  }
}

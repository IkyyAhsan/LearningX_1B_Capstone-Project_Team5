import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/modules/splash_screen/views/widgets/center_logo.dart';
import 'package:slectiv_studio_app/app/routes/app_pages.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
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
          backgroundColor: const Color(0xFFECE7DD),
          body: Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CenterLogo(
                  logo: 'assets/logos/slectiv_studio_logo.png',
                  width: 800,
                  height: 100,
                ),
                const SizedBox(height: 16,),
          Text("Balikpapan 1st Wide Self Photo Studio", style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF1A1A1A))),)
              ],
            ),
          ),
        );
      }
    );
  }
}

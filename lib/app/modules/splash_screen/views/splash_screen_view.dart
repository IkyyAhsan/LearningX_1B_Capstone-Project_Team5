import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/splash_screen/views/widgets/splash_display.dart';
import 'package:slectiv_studio_app/app/routes/app_pages.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
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
        return const Scaffold(
          backgroundColor: SlectivColors.backgroundColor,

          // -- Display of Splash Screen
          body: Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: SlectivSplashDisplay(),
          ),
        );
      }
    );
  }
}



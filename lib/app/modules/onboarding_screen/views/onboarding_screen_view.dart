import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/onboarding_screen/views/widgets/horizontal_scrollable_pages.dart';
import 'package:slectiv_studio_app/app/modules/onboarding_screen/views/widgets/onboarding_dot_navigation.dart';
import 'package:slectiv_studio_app/app/modules/onboarding_screen/views/widgets/onboarding_next_button.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import '../controllers/onboarding_screen_controller.dart';

class OnboardingScreenView extends GetView<OnboardingScreenController> {
  const OnboardingScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final onBoardingcontroller = Get.put(OnboardingScreenController());
    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      body: Stack(
        children: [
          // -- Horizontal Scrollable Pages
          SlectivScrollablePages(onBoardingcontroller: onBoardingcontroller),

          // -- Dot Navigation SmoothPageIndicator
          const SlectivonBoardingDotNavigation(),
          // -- Circular Button
          const SlectivonBoardingNextButton()
        ],
      ),
    );
  }
}



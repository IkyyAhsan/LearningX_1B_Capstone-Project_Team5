import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/onboarding_screen/controllers/onboarding_screen_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SlectivonBoardingDotNavigation extends StatelessWidget {
  const SlectivonBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final onBoardingcontroller = Get.put(OnboardingScreenController());
    return Positioned(
      bottom: kBottomNavigationBarHeight + 25,
      left: 24,
      child: SmoothPageIndicator(
        onDotClicked: onBoardingcontroller.dotNavigationClick,
        controller: onBoardingcontroller.pageController,
        count: 3,
        effect: const ExpandingDotsEffect(activeDotColor: Colors.black, dotHeight: 6),
      )
    );
  }
}
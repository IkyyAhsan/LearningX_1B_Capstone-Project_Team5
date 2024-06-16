import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/app/modules/onboarding_screen/controllers/onboarding_screen_controller.dart';
import 'package:slectiv_studio_app/app/modules/onboarding_screen/views/widgets/onboarding_page.dart';
import 'package:slectiv_studio_app/utils/constants/image_strings.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivScrollablePages extends StatelessWidget {
  const SlectivScrollablePages({
    super.key,
    required this.onBoardingcontroller,
  });

  final OnboardingScreenController onBoardingcontroller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: onBoardingcontroller.pageController,
      onPageChanged: onBoardingcontroller.updatePageIndicator,
      children: const [
        OnBoardingPage(
          lottie: SlectivImages.onBoardingAnimation1,  
          title: SlectivTexts.onBoardingTitle1, 
          subtitle: SlectivTexts.onBoardingSubtitle1
        ),
        OnBoardingPage(
          lottie: SlectivImages.onBoardingAnimation2, 
          title: SlectivTexts.onBoardingTitle2, 
          subtitle: SlectivTexts.onBoardingSubtitle2,
        ),
        OnBoardingPage(
          lottie: SlectivImages.onBoardingAnimation3,
          title: SlectivTexts.onBoardingTitle3, 
          subtitle: SlectivTexts.onBoardingSubtitle3,
        ),
      ],
    );
  }
}
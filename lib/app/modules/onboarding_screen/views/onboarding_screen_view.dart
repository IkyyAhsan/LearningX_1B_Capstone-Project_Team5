import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/onboarding_screen/views/widgets/onboarding_dot_navigation.dart';
import 'package:slectiv_studio_app/app/modules/onboarding_screen/views/widgets/onboarding_next_button.dart';
import 'package:slectiv_studio_app/app/modules/onboarding_screen/views/widgets/onboarding_page.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/image_strings.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';
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
          PageView(
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
          ),

          // -- Dot Navigation SmoothPageIndicator
          const onBoardingDotNavigation(),
          // -- Circular Button
          const onBoardingNextButton()
        ],
      ),
    );
  }
}

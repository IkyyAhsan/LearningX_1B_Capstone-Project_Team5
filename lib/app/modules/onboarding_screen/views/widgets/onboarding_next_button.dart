import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/app/modules/onboarding_screen/controllers/onboarding_screen_controller.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';

class onBoardingNextButton extends StatelessWidget {
  const onBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 24,
      bottom: kBottomNavigationBarHeight,
      child: GestureDetector(
        onTap: () => OnboardingScreenController.instance.nextPage(),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: SlectivColors.blackColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: const Icon(FluentIcons.arrow_right_20_regular, color: SlectivColors.whiteColor)
        ),
      )
    );
  }
}
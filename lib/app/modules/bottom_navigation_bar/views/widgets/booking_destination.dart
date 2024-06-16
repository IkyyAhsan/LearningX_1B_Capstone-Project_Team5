import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivBookingDestination extends StatelessWidget {
  const SlectivBookingDestination({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const NavigationDestination(
      icon: Icon(FluentIcons.camera_add_24_regular),
      label: SlectivTexts.bookingLabel,
      selectedIcon: Icon(FluentIcons.camera_add_24_filled, color: SlectivColors.submitButtonColor,),
    );
  }
}
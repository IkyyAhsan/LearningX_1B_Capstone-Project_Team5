import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivHomeDestination extends StatelessWidget {
  const SlectivHomeDestination({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const NavigationDestination(
      icon: Icon(FluentIcons.home_24_regular),
      label: SlectivTexts.homeLabel,
      selectedIcon: Icon(FluentIcons.home_24_filled, color: SlectivColors.submitButtonColor,),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivPersonDropdownTitle extends StatelessWidget {
  const SlectivPersonDropdownTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      SlectivTexts.person,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: SlectivColors.blackColor,
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivChooseDateTitle extends StatelessWidget {
  const SlectivChooseDateTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      SlectivTexts.chooseDate,
      style: TextStyle(
        fontSize: 16,
        color: SlectivColors.blackColor,
      ),
    );
  }
}
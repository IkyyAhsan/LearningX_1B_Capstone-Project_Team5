import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivBookingHeader extends StatelessWidget {
  const SlectivBookingHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      SlectivTexts.bookingTitle,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: SlectivColors.blackColor,
      ),
    );
  }
}

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
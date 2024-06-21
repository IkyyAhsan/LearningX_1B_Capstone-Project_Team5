import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/booking/views/widgets/booking_history.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivBookingHeader extends StatelessWidget {
  const SlectivBookingHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          SlectivTexts.bookingTitle,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: SlectivColors.blackColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: IconButton(
            onPressed: () => Get.to(() => SlectivBookingHistory()), 
            icon: const Icon(FluentIcons.cart_20_filled, size: 40, color: SlectivColors.blackColor,)),
        )
      ],
    );
  }
}
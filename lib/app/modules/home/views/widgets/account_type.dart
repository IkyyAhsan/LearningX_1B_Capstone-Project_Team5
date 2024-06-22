import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/booking/controllers/booking_controller.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';

class SlectivTypeAccount extends StatelessWidget {
  const SlectivTypeAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BookingController bookingController = Get.put(BookingController());
    return Obx(() => Text(
          bookingController.getAccountTypeText(),
          style: const TextStyle(
            fontSize: 15,
            color: SlectivColors.jenisAkunColor,
          ),
        ));
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/booking/controllers/booking_controller.dart';

class SlectiveProfileTypeAccount extends StatelessWidget {
  const SlectiveProfileTypeAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BookingController bookingController = Get.put(BookingController());
    return Obx(() => Text(
          bookingController.getAccountTypeText(),
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
        ));
  }
}

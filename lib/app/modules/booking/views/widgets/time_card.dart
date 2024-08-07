import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/booking/controllers/booking_controller.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';

class TimeCard extends StatelessWidget {
  final String time;

  const TimeCard({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BookingController>();

    return Obx(() {
      final isSelected = controller.selectedTime.value == time;
      final isBooked = controller.isTimeBooked(controller.selectedDay.value, time);
      final isPassed = controller.isTimePassed(controller.selectedDay.value, time);

      return GestureDetector(
        onTap: () {
          if (!isBooked && !isPassed) {
            controller.selectedTime.value = time;
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isBooked || isPassed ? Colors.grey : isSelected ? SlectivColors.warningColor : Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            time,
            style: TextStyle(
              fontSize: 16,
              color: isBooked || isPassed ? Colors.white : isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      );
    });
  }
}

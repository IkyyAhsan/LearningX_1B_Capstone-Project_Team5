import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:slectiv_studio_app/app/modules/booking/controllers/booking_controller.dart';
import 'package:slectiv_studio_app/app/modules/booking/views/widgets/time_card.dart';

class SlectivTimeReservation extends StatelessWidget {
  const SlectivTimeReservation({
    super.key,
    required this.controller,
    required this.now,
  });

  final BookingController controller;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selectedDay = controller.selectedDay.value;
      if (selectedDay.isBefore(DateTime(now.year, now.month, now.day))) {
        return const SizedBox();
      } else {
        return const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimeCard(time: '10:00'),
                TimeCard(time: '10:30'),
                TimeCard(time: '11:00'),
                TimeCard(time: '11:30'),
                TimeCard(time: '12:00'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimeCard(time: '12:30'),
                TimeCard(time: '14:00'),
                TimeCard(time: '14:30'),
                TimeCard(time: '15:00'),
                TimeCard(time: '15:30'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimeCard(time: '16:00'),
                TimeCard(time: '16:30'),
                TimeCard(time: '17:00'),
                TimeCard(time: '17:30'),
                TimeCard(time: '18:00'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimeCard(time: '18:30'),
                TimeCard(time: '19:00'),
                TimeCard(time: '19:30'),
                TimeCard(time: '20:00'),
                TimeCard(time: '20:30'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimeCard(time: '21:00'),
                TimeCard(time: '21:30'),
                TimeCard(time: '22:00'),
                TimeCard(time: '22:30'),
                TimeCard(time: '23:00'),
              ],
            ),
          ],
        );
      }
    });
  }
}

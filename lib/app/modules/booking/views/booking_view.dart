import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/booking/controllers/booking_controller.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TableCalendar(
                  focusedDay: DateTime.now(), 
                  firstDay: DateTime.utc(2024, 1, 1), 
                  lastDay: DateTime.utc(2024, 12, 31),
                  calendarFormat: CalendarFormat.week,
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}

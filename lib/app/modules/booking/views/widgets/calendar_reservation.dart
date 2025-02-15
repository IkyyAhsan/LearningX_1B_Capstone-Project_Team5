import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:slectiv_studio_app/app/modules/booking/controllers/booking_controller.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class SlectivCalendarReservation extends StatelessWidget {
  const SlectivCalendarReservation({
    super.key,
    required this.controller,
    required this.now,
  });

  final BookingController controller;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    DateTime lastDay = DateTime.utc(2026, 12, 31);
    DateTime firstDay =
        now.isBefore(lastDay) ? now : lastDay.subtract(const Duration(days: 1));

    return Obx(() => TableCalendar(
          focusedDay: controller.focusedDay.value.isBefore(lastDay)
              ? controller.focusedDay.value
              : lastDay,
          firstDay: firstDay,
          lastDay: lastDay,
          selectedDayPredicate: (day) {
            return isSameDay(controller.selectedDay.value, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if (selectedDay
                .isAfter(DateTime.now().subtract(const Duration(days: 1)))) {
              controller.selectedDay.value = selectedDay;
              controller.focusedDay.value =
                  focusedDay.isBefore(lastDay) ? focusedDay : lastDay;
              controller.selectedTime.value = '';
            }
          },
          enabledDayPredicate: (day) {
            return day
                .isAfter(DateTime.now().subtract(const Duration(days: 1)));
          },
          calendarStyle: const CalendarStyle(
            todayTextStyle: TextStyle(color: SlectivColors.whiteColor),
            todayDecoration: BoxDecoration(
              color: SlectivColors.blackColor,
              shape: BoxShape.rectangle,
            ),
            defaultTextStyle: TextStyle(color: SlectivColors.blackColor),
            defaultDecoration: BoxDecoration(
              color: SlectivColors.whiteColor,
              shape: BoxShape.rectangle,
            ),
            weekendTextStyle: TextStyle(color: SlectivColors.blackColor),
            weekendDecoration: BoxDecoration(
              color: SlectivColors.whiteColor,
              shape: BoxShape.rectangle,
            ),
            outsideTextStyle: TextStyle(color: SlectivColors.greyBooking),
            holidayTextStyle: TextStyle(color: SlectivColors.blackColor),
            selectedDecoration: BoxDecoration(
              color: SlectivColors.warningColor,
              shape: BoxShape.rectangle,
            ),
          ),
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekendStyle: TextStyle(
                color: SlectivColors.cancelAndNegatifSnackbarButtonColor),
          ),
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            leftChevronVisible: true,
            rightChevronVisible: true,
          ),
          onFormatChanged: (format) {},
          onPageChanged: (focusedDay) {
            controller.focusedDay.value =
                focusedDay.isBefore(lastDay) ? focusedDay : lastDay;
          },
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              if (day.isBefore(DateTime.now())) {
                return Container(); // Hide days before today
              } else {
                return Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: SlectivColors.blackColor,
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: const TextStyle(color: SlectivColors.whiteColor),
                      ),
                    ),
                  ),
                );
              }
            },
            todayBuilder: (context, day, focusedDay) {
              return Center(
                child: Container(
                  decoration: const BoxDecoration(
                    color: SlectivColors.blackColor,
                    shape: BoxShape.rectangle,
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: const TextStyle(color: SlectivColors.whiteColor),
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}

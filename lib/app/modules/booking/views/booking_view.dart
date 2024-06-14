import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/submit_button.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import '../controllers/booking_controller.dart';
import 'widgets/time_card.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());
    final DateTime now = DateTime.now();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const Text(
                  'Booking Studio Photo',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                // Calendar
                Obx(() => TableCalendar(
                      focusedDay: controller.focusedDay.value,
                      firstDay: now,
                      lastDay: DateTime.utc(2024, 12, 31),
                      selectedDayPredicate: (day) {
                        return isSameDay(controller.selectedDay.value, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        if (selectedDay.isAfter(DateTime.now().subtract(const Duration(days: 1)))) {
                          controller.selectedDay.value = selectedDay;
                          controller.focusedDay.value = focusedDay;
                        }
                      },
                      enabledDayPredicate: (day) {
                        return day.isAfter(DateTime.now().subtract(const Duration(days: 1)));
                      },
                      calendarStyle: const CalendarStyle(
                        todayTextStyle: TextStyle(color: Colors.white),
                        todayDecoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.rectangle,
                        ),
                        defaultTextStyle: TextStyle(color: Colors.black),
                        defaultDecoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                        ),
                        weekendTextStyle: TextStyle(color: Colors.black),
                        weekendDecoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                        ),
                        outsideTextStyle: TextStyle(color: Colors.grey),
                        holidayTextStyle: TextStyle(color: Colors.black),
                        selectedDecoration: BoxDecoration(
                          color: Colors.orange,
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      daysOfWeekStyle: const DaysOfWeekStyle(
                        weekendStyle: TextStyle(color: Colors.red),
                      ),
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        leftChevronVisible: true,
                        rightChevronVisible: true,
                      ),
                      onFormatChanged: (format) {},
                      onPageChanged: (focusedDay) {
                        controller.focusedDay.value = focusedDay;
                      },
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) {
                          if (day.isBefore(DateTime.now())) {
                            return Container(); // Hide days before today
                          } else {
                            return Center(
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  shape: BoxShape.rectangle,
                                ),
                                child: Center(
                                  child: Text(
                                    '${day.day}',
                                    style: const TextStyle(color: Colors.white),
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
                                color: Colors.black,
                                shape: BoxShape.rectangle,
                              ),
                              child: Center(
                                child: Text(
                                  '${day.day}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )),
                const SizedBox(height: 20),
                const Text(
                  "Choose a date above to see available times.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                // Time slots
                Obx(() {
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
                }),
                const SizedBox(height: 20),
                // Dropdowns
                const Text(
                  "Color",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Obx(() => Container(
                        width: double.infinity,
                        height: 48.65,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("Select an option..."),
                          ),
                          value: controller.selectedOption.value.isEmpty ? null : controller.selectedOption.value,
                          onChanged: (String? newValue) {
                            controller.selectedOption.value = newValue!;
                          },
                          items: <String>[
                            'White Background',
                            'Dark Grey Background',
                            'Sage Background',
                            'Wide Blue',
                            'Spotlight',
                            'American Yearbook'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                        ),
                      )),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Person",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Center(
                  child: Obx(() => Container(
                        width: double.infinity,
                        height: 48.65,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("Select an option..."),
                          ),
                          value: controller.selectedQuantity.value.isEmpty ? null : controller.selectedQuantity.value,
                          onChanged: (String? newValue) {
                            controller.selectedQuantity.value = newValue!;
                          },
                          items: <String>[
                            '1',
                            '2',
                            '3',
                            '4(+20.000)',
                            '5(+40.000)',
                            '6(+60.000)',
                            '7(+80.000)',
                            '8(+100.000)',
                            '9(+120.000)',
                            '10(+140.000)',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                        ),
                      )),
                ),
                const SizedBox(height: 32),
                Center(
                  child: SlectiveWidgetButton(
                    buttonName: "Book Now", 
                    onPressed: () async {
                      await controller.saveBooking();
                      Get.offAll(BottomNavigationBarView());
                    }, 
                    backgroundColor: SlectivColors.submitButtonColor
                  )
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

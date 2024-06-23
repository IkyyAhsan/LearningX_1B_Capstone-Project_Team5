import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:slectiv_studio_app/app/modules/booking/controllers/booking_controller.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';
import 'package:slectiv_studio_app/app/modules/profile/controllers/profile_controller.dart';

class SlectivBookingHistory extends StatefulWidget {
  const SlectivBookingHistory({super.key});

  @override
  _SlectivBookingHistoryState createState() => _SlectivBookingHistoryState();
}

class _SlectivBookingHistoryState extends State<SlectivBookingHistory> {
  bool showMoreUpcoming = false;
  bool showMoreCompleted = false;

  @override
  Widget build(BuildContext context) {
    final BookingController bookingController = Get.find();
    final ProfileController profileController = Get.find();
    final String userEmail = profileController.email.value;

    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              FluentIcons.arrow_left_20_regular,
              size: 25,
              color: SlectivColors.blackColor,
            ),
          ),
        ),
        backgroundColor: SlectivColors.backgroundColor,
        title: Text(
          SlectivTexts.bookingHistoryTitle,
          style: GoogleFonts.spaceGrotesk(
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: SlectivColors.blackColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if (bookingController.bookings.isEmpty) {
            return const Center(
              child: Text(
                SlectivTexts.bookingNotHistory,
                style: TextStyle(fontSize: 16, color: SlectivColors.blackColor),
              ),
            );
          } else {
            List<String> sortedDates = bookingController.bookings.keys.toList();
            DateTime now = DateTime.now();

            List<Map<String, dynamic>> upcomingBookings = [];
            List<Map<String, dynamic>> completedBookings = [];

            for (String date in sortedDates) {
              DateTime parsedDate = DateTime.parse(date);
              List<String> bookings = bookingController.bookings[date] ?? [];
              for (String booking in bookings) {
                List<String> bookingDetails = booking.split('|');
                String email = bookingDetails[3];
                if (email == userEmail) {
                  String time = bookingDetails[0];
                  DateTime bookingTime = DateTime(parsedDate.year, parsedDate.month, parsedDate.day, int.parse(time.split(':')[0]), int.parse(time.split(':')[1]));

                  if (bookingTime.isAfter(now)) {
                    upcomingBookings.add({SlectivTexts.bookingDate: date, SlectivTexts.bookingDetails: booking});
                  } else {
                    completedBookings.add({SlectivTexts.bookingDate: date, SlectivTexts.bookingDetails: booking});
                  }
                }
              }
            }

            upcomingBookings.sort((a, b) {
              DateTime dateTimeA = DateTime.parse(a[SlectivTexts.bookingDate]);
              DateTime dateTimeB = DateTime.parse(b[SlectivTexts.bookingDate]);
              DateTime timeA = DateTime(dateTimeA.year, dateTimeA.month, dateTimeA.day, int.parse(a[SlectivTexts.bookingDetails].split('|')[0].split(':')[0]), int.parse(a[SlectivTexts.bookingDetails].split('|')[0].split(':')[1]));
              DateTime timeB = DateTime(dateTimeB.year, dateTimeB.month, dateTimeB.day, int.parse(b[SlectivTexts.bookingDetails].split('|')[0].split(':')[0]), int.parse(b[SlectivTexts.bookingDetails].split('|')[0].split(':')[1]));
              return timeA.compareTo(timeB);
            });

            completedBookings.sort((a, b) {
              DateTime dateTimeA = DateTime.parse(a[SlectivTexts.bookingDate]);
              DateTime dateTimeB = DateTime.parse(b[SlectivTexts.bookingDate]);
              DateTime timeA = DateTime(dateTimeA.year, dateTimeA.month, dateTimeA.day, int.parse(a[SlectivTexts.bookingDetails].split('|')[0].split(':')[0]), int.parse(a[SlectivTexts.bookingDetails].split('|')[0].split(':')[1]));
              DateTime timeB = DateTime(dateTimeB.year, dateTimeB.month, dateTimeB.day, int.parse(b[SlectivTexts.bookingDetails].split('|')[0].split(':')[0]), int.parse(b[SlectivTexts.bookingDetails].split('|')[0].split(':')[1]));
              return timeB.compareTo(timeA);
            });

            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              children: [
                const Text(
                  SlectivTexts.bookingUpcoming,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ...upcomingBookings.take(showMoreUpcoming ? upcomingBookings.length : 3).map((booking) {
                  return buildBookingList(booking[SlectivTexts.bookingDate], booking[SlectivTexts.bookingDetails]);
                }).toList(),
                if (upcomingBookings.length > 3)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        showMoreUpcoming = !showMoreUpcoming;
                      });
                    },
                    child: Text(showMoreUpcoming 
                    ? SlectivTexts.bookingShowLess 
                    : SlectivTexts.bookingShowMore),
                  ),
                const SizedBox(height: 24),
                const Text(
                  SlectivTexts.bookingCompleted,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                ...completedBookings.take(showMoreCompleted ? completedBookings.length : 3).map((booking) {
                  return buildBookingList(booking[SlectivTexts.bookingDate], booking[SlectivTexts.bookingDetails]);
                }).toList(),
                if (completedBookings.length > 3)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        showMoreCompleted = !showMoreCompleted;
                      });
                    },
                    child: Text(showMoreCompleted 
                    ? SlectivTexts.bookingShowLess 
                    : SlectivTexts.bookingShowMore),
                  ),
              ],
            );
          }
        }),
      ),
    );
  }

  Widget buildBookingList(String date, String bookingDetails) {
    List<String> details = bookingDetails.split('|');
    String time = details[0];
    String color = details[1];
    String person = details[2];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$date $time",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${SlectivTexts.bookingTitleTime} : $time",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "${SlectivTexts.bookingTitle3} : $color",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "${SlectivTexts.bookingTitle4} : $person",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
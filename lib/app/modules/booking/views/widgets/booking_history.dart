import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:slectiv_studio_app/app/modules/booking/controllers/booking_controller.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';

class SlectivBookingHistory extends StatelessWidget {
  const SlectivBookingHistory({Key? key});

  @override
  Widget build(BuildContext context) {
    final BookingController bookingController = Get.find();

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
          "Bookings History",
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
                "No order history yet",
                style: TextStyle(fontSize: 16, color: SlectivColors.blackColor),
              ),
            );
          } else {
            List<String> sortedDates = bookingController.bookings.keys.toList();
            DateTime now = DateTime.now();

            
            List<String> upcomingDates = sortedDates.where((date) => DateTime.parse(date).isAfter(now)).toList();
            List<String> pastDates = sortedDates.where((date) => DateTime.parse(date).isBefore(now)).toList();

            
            upcomingDates.sort((a, b) => DateTime.parse(a).compareTo(DateTime.parse(b)));
            pastDates.sort((a, b) => DateTime.parse(b).compareTo(DateTime.parse(a)));

            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              children: [
                if (upcomingDates.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Upcoming Bookings",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...upcomingDates.map((date) {
                        List<String> bookings = bookingController.bookings[date] ?? [];
                        return buildBookingList(date, bookings);
                      }).toList(),
                    ],
                  ),
                if (pastDates.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      const Text(
                        "Completed Bookings",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...pastDates.map((date) {
                        List<String> bookings = bookingController.bookings[date] ?? [];
                        return buildBookingList(date, bookings);
                      }).toList(),
                    ],
                  ),
              ],
            );
          }
        }),
      ),
    );
  }

  Widget buildBookingList(String date, List<String> bookings) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        if (bookings.isEmpty)
          const Text(
            "No bookings history yet",
            style: TextStyle(fontSize: 16, color: SlectivColors.blackColor),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bookings.length,
            itemBuilder: (context, idx) {
              List<String> bookingDetails = bookings[idx].split('|');
              String time = bookingDetails[0];
              String color = bookingDetails[1];
              String person = bookingDetails[2];

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
                        "Time : $time",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Color : $color",
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        "Person : $person",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}

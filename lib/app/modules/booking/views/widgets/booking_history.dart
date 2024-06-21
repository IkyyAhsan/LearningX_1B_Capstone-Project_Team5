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
          "Riwayat Pesanan",
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
                "Belum ada riwayat pesanan.",
                style: TextStyle(fontSize: 16, color: SlectivColors.blackColor),
              ),
            );
          } else {
            List<String> sortedDates = bookingController.bookings.keys.toList();
            sortedDates
                .sort((a, b) => DateTime.parse(b).compareTo(DateTime.parse(a)));

            return ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              itemCount: sortedDates.length,
              itemBuilder: (context, index) {
                String date = sortedDates[index];
                List<String> bookings = bookingController.bookings[date] ?? [];

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
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: const Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Waktu : $time",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Warna : $color",
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "Orang : $person",
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
              },
            );
          }
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/booking/views/widgets/calendar_reservation.dart';
import 'package:slectiv_studio_app/app/modules/booking/views/widgets/color_dropdown.dart';
import 'package:slectiv_studio_app/app/modules/booking/views/widgets/person_dropdown.dart';
import 'package:slectiv_studio_app/app/modules/booking/views/widgets/time_reservation.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/submit_button.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';
import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({super.key});

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
                  SlectivTexts.bookingTitle,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),

                // Calendar
                SlectivCalendarReservation(controller: controller, now: now),
                const SizedBox(height: 20),
                const Text(
                  SlectivTexts.chooseDate,
                  style: TextStyle(
                    fontSize: 16,
                    color: SlectivColors.blackColor,
                  ),
                ),
                const SizedBox(height: 20),
                // Time slots
                SlectivTimeReservation(controller: controller, now: now),
                const SizedBox(height: 20),
                // Dropdowns
                const Text(
                  SlectivTexts.color,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: SlectivColors.blackColor,
                  ),
                ),
                const SizedBox(height: 8),
                SlectivColorDropdown(controller: controller),
                const SizedBox(height: 20),
                const Text(
                  SlectivTexts.person,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: SlectivColors.blackColor,
                  ),
                ),
                const SizedBox(height: 8),
                SlectivPersonDropdown(controller: controller),
                const SizedBox(height: 32),
                Center(
                  child: SlectiveWidgetButton(
                    buttonName: SlectivTexts.bookingNow, 
                    onPressed: () async {
                      Get.dialog(
                          const Center(
                            child: SizedBox(
                              height: 100,
                              width: 100,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(SlectivColors.circularProgressColor),
                              ),
                            ),
                          ),
                          barrierDismissible: false,
                        );
                        await Future.delayed(const Duration(seconds: 3));

                        await controller.slectivBookingValidation(controller);

                        Get.back();

                        Get.snackbar(
                          SlectivTexts.confirmedBookTitle,
                          SlectivTexts.confirmedBookSubtitle,
                          backgroundColor: SlectivColors.positifSnackbarColor,
                          colorText: Colors.white,
                          duration: const Duration(seconds: 3),
                        );

                    }, 
                    backgroundColor: SlectivColors.submitButtonColor
                  ),
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
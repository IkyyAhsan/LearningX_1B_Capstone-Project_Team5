import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:slectiv_studio_app/app/modules/booking/controllers/booking_controller.dart';
import 'package:slectiv_studio_app/app/modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/image_strings.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/submit_button.dart';

class BookingSuccessScreen extends StatelessWidget {
  const BookingSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());

    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(SlectivImages.bookingSuccessfully)
            ),
            Text(
              SlectivTexts.bookingSuccessTitle,
              style: GoogleFonts.spaceGrotesk(
                  textStyle: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: SlectivColors.blackColor)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              SlectivTexts.bookingSuccessDescription,
              style: GoogleFonts.spaceGrotesk(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            SlectiveWidgetButton(
              buttonName: SlectivTexts.bookingConfirm,
              onPressed: () {
                if (controller.bookingCount.value == 5) {
                  Get.snackbar(
                    SlectivTexts.snackbarBookingMembershipTitle,
                    SlectivTexts.snackbarBookingMembershipSubtitle,
                    duration: const Duration(seconds: 7),
                    backgroundColor: SlectivColors.submitButtonColor,
                    colorText: SlectivColors.whiteColor,
                  );
                }
                Get.offAll(() => const BottomNavigationBarView());
              },
              backgroundColor: SlectivColors.submitButtonColor,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/submit_button.dart';

class SlectivFifthBookingPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: SlectivColors.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              SlectivTexts.bookingChangeMembershipTitle,
              style: GoogleFonts.spaceGrotesk(
                textStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: SlectivColors.blackColor,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              SlectivTexts.bookingChangeMembershipSubtitle,
              style: GoogleFonts.spaceGrotesk(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: SlectivColors.blackColor,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            SlectiveWidgetButton(
              buttonName: 'OK',
              onPressed: () {
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

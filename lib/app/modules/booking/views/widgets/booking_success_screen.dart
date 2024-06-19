import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/routes/app_pages.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/image_strings.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class BookingSuccessScreen extends StatefulWidget {
  const BookingSuccessScreen({Key? key}) : super(key: key);

  @override
  _BookingSuccessScreenState createState() => _BookingSuccessScreenState();
}

class _BookingSuccessScreenState extends State<BookingSuccessScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Image(
                image: AssetImage(SlectivImages.bookingSuccessImage),
                width: 162,
                height: 162,
              ),
            ),
            Text(
              SlectivTexts.bookingSuccessTitle,
              style: GoogleFonts.spaceGrotesk(
                  textStyle: const TextStyle(
                      fontSize: 20,
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
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

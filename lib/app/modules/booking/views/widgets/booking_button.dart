import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/modules/booking/views/widgets/booking_success_screen.dart';
import 'package:slectiv_studio_app/app/modules/booking/controllers/booking_controller.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/submit_button.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivBookingButton extends StatelessWidget {
  const SlectivBookingButton({
    super.key,
    required this.controller,
  });

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() {
        final isButtonEnabled = controller.isBookingComplete;
        return SlectiveWidgetButton(
          buttonName: SlectivTexts.bookingNow,
          onPressed: () async {
            if (isButtonEnabled) {
              bool confirmed = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      SlectivTexts.snackbarBookingConfirmTitle,
                      style: GoogleFonts.spaceGrotesk(
                        textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: SlectivColors.blackColor,
                        ),
                      ),
                    ),
                    content: Text(
                      SlectivTexts.snackbarBookingConfirmSubtitle,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.spaceGrotesk(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          color: SlectivColors.blackColor,
                        ),
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text(
                          SlectivTexts.bookingNo,
                          style: GoogleFonts.spaceGrotesk(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: SlectivColors.cancelAndNegatifSnackbarButtonColor,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Get.back(result: false);
                        },
                      ),
                      TextButton(
                        child: Text(
                          SlectivTexts.bookingYes,
                          style: GoogleFonts.spaceGrotesk(
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: SlectivColors.submitButtonColor,
                            ),
                          ),
                        ),
                        onPressed: () {
                          Get.back(result: true);
                        },
                      ),
                    ],
                  );
                },
              );

              if (confirmed == true) {
                Get.dialog(
                  const Center(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            SlectivColors.circularProgressColor),
                      ),
                    ),
                  ),
                  barrierDismissible: false,
                );
                await Future.delayed(const Duration(seconds: 3));

                await controller.slectivBookingValidation(controller);

                Get.back();

                Get.snackbar(
                  SlectivTexts.snackbarSuccessfullyBookingTitle,
                  SlectivTexts.snackbarSuccessfullyBookingSubtitle,
                  backgroundColor: SlectivColors.submitButtonColor,
                  colorText: SlectivColors.whiteColor,
                );

                Get.offAll(() => const BookingSuccessScreen());
              }
            }
          },
          backgroundColor: isButtonEnabled ? SlectivColors.submitButtonColor : Colors.grey,
        );
      }),
    );
  }
}

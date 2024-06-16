import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    );
  }
}
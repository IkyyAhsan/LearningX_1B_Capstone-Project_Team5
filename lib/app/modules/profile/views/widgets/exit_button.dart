import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/routes/app_pages.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivExitButton extends StatelessWidget {
  const SlectivExitButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
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
    
                  Get.back();
    
                  Get.snackbar(
                    SlectivTexts.profileSuccessLogoutTitleButton, 
                    SlectivTexts.profileSuccessLogoutSubtitleButton, 
                    backgroundColor: SlectivColors.positifSnackbarColor, 
                    colorText: SlectivColors.whiteColor, 
                    duration: const Duration(
                      seconds: 4
                    ),
                  );
    
                  Get.offAllNamed(Routes.LOGIN_SCREEN);
                }, 
          style: ElevatedButton.styleFrom(
            backgroundColor: SlectivColors.cancelAndNegatifSnackbarButtonColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 24, vertical: 12
            ),
          ),
          child: Text(
            SlectivTexts.exit, 
            style: GoogleFonts.spaceGrotesk(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: SlectivColors.whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
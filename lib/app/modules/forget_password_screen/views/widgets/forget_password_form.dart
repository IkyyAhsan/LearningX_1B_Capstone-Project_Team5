import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/modules/forget_password_screen/controllers/forget_password_screen_controller.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/login_screen_view.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/submit_button.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';
import 'package:slectiv_studio_app/utils/validators/validation.dart';

class SlectivFormForgetPassword extends StatelessWidget {
  const SlectivFormForgetPassword({
    super.key,
    required this.forgetPasswordFormKey,
    required this.forgetPasswordController,
  });

  final GlobalKey<FormState> forgetPasswordFormKey;
  final ForgetPasswordScreenController forgetPasswordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forgetPasswordFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
    
          // -- Email
          
          Text(
            SlectivTexts.email,
            style: GoogleFonts.spaceGrotesk(
              textStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: SlectivColors.blackColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: forgetPasswordController.emailController,
            validator: (value) => SlectiValidator.forgetPasswordEmailValidate(value),
            decoration: InputDecoration(
              hintText: SlectivTexts.emailHintText,
              hintStyle: GoogleFonts.spaceGrotesk(
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: SlectivColors.hintColor,
                ),
              ),
              fillColor: const Color(0xFFF6F6F6),
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: SlectivColors.blackColor),
              ),
            ),
          ),
          const SizedBox(height: 48),
    
          // -- Forget Password Button
    
          SlectiveWidgetButton(
            buttonName: SlectivTexts.sendForgetPassword,
            onPressed: () async {
              if (forgetPasswordFormKey.currentState!.validate()) {
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
    
                forgetPasswordController.resetPassword(forgetPasswordController.emailController.text);
    
                Get.back();
    
                forgetPasswordController.clearForm();
              }
            },
            backgroundColor: SlectivColors.submitButtonColor,
          ),
          const SizedBox(height: 24),
    
          // -- Back to login Button
    
          SlectiveWidgetButton(
            buttonName: SlectivTexts.backToLogin,
            onPressed: () => Get.off(() => LoginScreenView()),
            backgroundColor: SlectivColors.cancelAndNegatifSnackbarButtonColor,
          ),
        ],
      ),
    );
  }
}
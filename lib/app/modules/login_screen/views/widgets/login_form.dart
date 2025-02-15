import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/controllers/login_screen_controller.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/forget_password.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/submit_button.dart';
import 'package:slectiv_studio_app/app/modules/register_screen/views/register_screen_view.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';
import 'package:slectiv_studio_app/utils/validators/validation.dart';

class SlectivLoginForm extends StatelessWidget {
  const SlectivLoginForm({
    super.key,
    required this.loginFormKey,
    required this.loginController,
  });

  final GlobalKey<FormState> loginFormKey;
  final LoginScreenController loginController;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -- Email
            Text(SlectivTexts.email,
                style: GoogleFonts.spaceGrotesk(
                    textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: SlectivColors.blackColor))),
            const SizedBox(
              height: 8,
            ),

            TextFormField(
              controller: loginController.emailController,
              validator: (value) => SlectiValidator.emailValidate(value),
              decoration: InputDecoration(
                  hintText: SlectivTexts.emailHintText,
                  hintStyle: GoogleFonts.spaceGrotesk(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: SlectivColors.hintColor)),
                  fillColor: const Color(0xFFF6F6F6),
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: SlectivColors.blackColor))),
            ),
            const SizedBox(
              height: 16,
            ),

            Text(
              SlectivTexts.password,
              style: GoogleFonts.spaceGrotesk(
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: SlectivColors.blackColor)),
            ),
            const SizedBox(
              height: 8,
            ),
            // -- Password
            Obx(
              () => TextFormField(
                controller: loginController.passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => SlectiValidator.passwordValidate(value),
                obscureText: loginController.hidePassword.value,
                decoration: InputDecoration(
                    hintText: SlectivTexts.passwordHintText,
                    hintStyle: GoogleFonts.spaceGrotesk(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: SlectivColors.hintColor)),
                    fillColor: const Color(0xFFF6F6F6),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: SlectivColors.blackColor)),
                    suffixIcon: IconButton(
                      onPressed: () => loginController.hidePassword.value =
                          !loginController.hidePassword.value,
                      icon: Icon(loginController.hidePassword.value
                          ? FluentIcons.eye_off_20_regular
                          : FluentIcons.eye_20_regular),
                    )),
                style: GoogleFonts.plusJakartaSans(
                    textStyle: const TextStyle(
                  fontSize: 14,
                )),
              ),
            ),
            const SlectivForgetPassword(),
            const SizedBox(
              height: 36,
            ),

            // -- Login Button
            SlectiveWidgetButton(
              buttonName: SlectivTexts.login,
              onPressed: () async {
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

                loginController.loginValidation();

                Get.back();
              },
              backgroundColor: SlectivColors.submitButtonColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  SlectivTexts.dontHaveAccount,
                  style: GoogleFonts.spaceGrotesk(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: SlectivColors.blackColor)),
                ),
                TextButton(
                    onPressed: () => Get.to(() => RegisterScreenView()),
                    child: Text(
                      SlectivTexts.registerHere,
                      style: GoogleFonts.spaceGrotesk(
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: SlectivColors.submitButtonColor)),
                    )),
              ],
            )
          ],
        ));
  }
}

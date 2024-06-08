import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/login_screen_view.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/authentication_header.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/header_text.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/submit_button.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';
import 'package:slectiv_studio_app/utils/validators/validation.dart';
import '../controllers/forget_password_screen_controller.dart';

class ForgetPasswordScreenView extends GetView<ForgetPasswordScreenController> {
  ForgetPasswordScreenView({
    super.key
    });

    final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final forgetPasswordController = Get.put(ForgetPasswordScreenController());
    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24,),
                  const SlectivAuthenticationHeader(),
                  const SizedBox(height: 36,),
              
                  const SlectivLoginHeaderText(title: SlectivTexts.forgetPasswordTitle, subtitle: SlectivTexts.forgetPasswordSubtitle,),
                  const SizedBox(height: 24,),

                  Form(
                    key: forgetPasswordFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // -- Email
                        Text(SlectivTexts.email, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: SlectivColors.blackColor))),
                        const SizedBox(height: 8,),

                        TextFormField(
                          controller: forgetPasswordController.emailController,
                          validator: (value) => SlectiValidator.emailValidate(value),
                          decoration: InputDecoration(
                            hintText: "Enter your Email",
                            hintStyle: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: SlectivColors.hintColor)),
                            fillColor: const Color(0xFFF6F6F6),
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: SlectivColors.blackColor)
                            )
                          ),
                        ),
                        const SizedBox(height: 48,),

                        // -- Forget Password Button
                        SlectiveWidgetButton(
                          buttonName: SlectivTexts.sendForgetPassword, 
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

                            forgetPasswordController.resetPassword(forgetPasswordController.emailController.text);

                            Get.back();

                            forgetPasswordController.clearForm();
                          }, 
                          backgroundColor: SlectivColors.forgetPasswordButtonColor,
                        ),

                        const SizedBox(height: 24,),

                        // -- Back to login Button
                        SlectiveWidgetButton(
                          buttonName: SlectivTexts.backToLogin, 
                          onPressed: () => Get.off(() => LoginScreenView()),
                          backgroundColor: SlectivColors.cancelButtonColor,
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),
          )
        )
    );
  }
}

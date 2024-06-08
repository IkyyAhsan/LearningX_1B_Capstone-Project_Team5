import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/authentication_header.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/forget_password.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/header_text.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/submit_button.dart';
import 'package:slectiv_studio_app/app/modules/register_screen/views/register_screen_view.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';
import 'package:slectiv_studio_app/utils/validators/validation.dart';

import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  LoginScreenView({super.key});

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginScreenController());
    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24,),
              const SlectivAuthenticationHeader(),
              const SizedBox(height: 36,),

              const SlectivLoginHeaderText(title: SlectivTexts.loginTitle, subtitle: SlectivTexts.loginSubtitle,),
              const SizedBox(height: 24,),

              Form(
                key: loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // -- Email
                    Text(SlectivTexts.email, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: SlectivColors.blackColor))),
                    const SizedBox(height: 8,),

                    TextFormField(
                      controller: loginController.emailController,
                      validator: (value) => SlectiValidator.emailValidate(value),
                      decoration: InputDecoration(
                        hintText: "Enter your Email",
                        hintStyle: GoogleFonts.spaceGrotesk(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: SlectivColors.hintColor)),
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
                    const SizedBox(height: 16,),

                    Text(SlectivTexts.password, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: SlectivColors.blackColor)),),
                    const SizedBox(height: 8,),
                    // -- Password
                    Obx(
                      () => TextFormField(
                        controller: loginController.passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => SlectiValidator.passwordValidate(value),
                        obscureText: loginController.hidePassword.value,
                        decoration: InputDecoration(
                          hintText: "Enter your Password",
                          hintStyle: GoogleFonts.spaceGrotesk(textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: SlectivColors.hintColor)),
                          fillColor: const Color(0xFFF6F6F6),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: SlectivColors.blackColor)
                          ),
                          suffixIcon: IconButton(
                            onPressed: () => loginController.hidePassword.value = !loginController.hidePassword.value,
                            icon: Icon(loginController.hidePassword.value ? FluentIcons.eye_off_20_regular : FluentIcons.eye_20_regular),
                          )
                        ),
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                            fontSize: 14,
                          )
                        ),
                      ),
                    ),
                    const SlectivForgetPassword(),
                    const SizedBox(height: 36,),

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
                                valueColor: AlwaysStoppedAnimation<Color>(SlectivColors.circularProgressColor),
                              ),
                            ),
                          ),
                          barrierDismissible: false,
                        );
                        await Future.delayed(const Duration(seconds: 3));

                        loginController.loginValidation();

                        Get.back();

                        
                      }, 
                      backgroundColor: SlectivColors.loginButtonColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?", style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: SlectivColors.blackColor)),),
                        TextButton(onPressed: () => Get.to(() => RegisterScreenView()), 
                          child: Text("Register here", style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: SlectivColors.loginButtonColor)),)
                        ),
                      ],
                    )
                  ],
                )
              )
              
            ],
          ),
        ),
      )
    );
  }
}
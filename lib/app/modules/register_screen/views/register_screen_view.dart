import 'package:fluentui_system_icons/fluentui_system_icons.dart';
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
import '../controllers/register_screen_controller.dart';

class RegisterScreenView extends GetView<RegisterScreenController> {
  RegisterScreenView({
    super.key
    });

    final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterScreenController());
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
            
                const SlectivLoginHeaderText(title: SlectivTexts.registerTitle, subtitle: SlectivTexts.registerSubtitle,),
                const SizedBox(height: 24,),
            
                Form(
                  key: registerFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      // -- Name
                      Text(SlectivTexts.name, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: SlectivColors.blackColor))),
                      const SizedBox(height: 8,),
            
                      TextFormField(
                        controller: registerController.nameController,
                        validator: (value) => SlectiValidator.nameValidate(value),
                        decoration: InputDecoration(
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
            
                      // -- Phone Number
                      Text(SlectivTexts.phoneNumber, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: SlectivColors.blackColor))),
                      const SizedBox(height: 8,),
            
                      TextFormField(
                        controller: registerController.phoneNumberController,
                        validator: (value) => SlectiValidator.phoneNumberValidate(value),
                        decoration: InputDecoration(
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
            
                      // -- Email
                      Text(SlectivTexts.email, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: SlectivColors.blackColor))),
                      const SizedBox(height: 8,),
            
                      TextFormField(
                        controller: registerController.emailController,
                        validator: (value) => SlectiValidator.emailValidate(value),
                        decoration: InputDecoration(
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
            
                      // -- Password
                      Text(SlectivTexts.password, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: SlectivColors.blackColor))),
                      const SizedBox(height: 8,),
            
                      Obx(
                        () => TextFormField(
                          controller: registerController.passwordController,
                          validator: (value) => SlectiValidator.passwordValidate(value),
                          obscureText: registerController.hidePassword.value,
                          decoration: InputDecoration(
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
                              onPressed: () => registerController.hidePassword.value = !registerController.hidePassword.value,
                              icon: Icon(registerController.hidePassword.value ? FluentIcons.eye_off_20_regular : FluentIcons.eye_20_regular),
                              )
                          ),
                          style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 14)),
                        ),
                      ),
                      const SizedBox(height: 16,),
            
                      // -- Confirm Password
                      Text(SlectivTexts.confirmPassword, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: SlectivColors.blackColor))),
                      const SizedBox(height: 8,),
            
                      Obx(
                        () => TextFormField(
                          controller: registerController.confirmPasswordController,
                          validator: (value) => SlectiValidator.confirmPasswordValidate(value, registerController.confirmPasswordController.text),
                          obscureText: registerController.hideConfirmPassword.value,
                          decoration: InputDecoration(
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
                              onPressed: () => registerController.hideConfirmPassword.value = !registerController.hideConfirmPassword.value,
                              icon: Icon(registerController.hideConfirmPassword.value ? FluentIcons.eye_off_20_regular : FluentIcons.eye_20_regular),
                              )
                          ),
                          style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 14)),
                        ),
                      ),
                      const SizedBox(height: 36,),
            
                      // -- Register Button Button
                      SlectiveWidgetButton(
                        buttonName: SlectivTexts.register, 
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
                          Get.off(
                            () => LoginScreenView(),
                            transition: Transition.fadeIn,
                            duration: const Duration(seconds: 2),
                          );

                          Get.snackbar(
                            SlectivTexts.registerSuccessfullTitle, 
                            SlectivTexts.registerSuccessfullSubtitle,
                            backgroundColor: SlectivColors.registerButtonColor, 
                            colorText: SlectivColors.whiteColor, 
                            duration: const Duration(
                              seconds: 4
                            ),
                          );
                          }, 

                        backgroundColor: SlectivColors.registerButtonColor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(SlectivTexts.alreadyHave, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: SlectivColors.blackColor)),),
                          TextButton(onPressed: () => Get.to(() => LoginScreenView()), 
                            child: Text(SlectivTexts.loginHere, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: SlectivColors.loginButtonColor)),)
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
        ),
    );
  }
}

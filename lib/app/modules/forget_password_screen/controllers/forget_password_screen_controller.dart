import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/forget_password_screen/views/waiting_to_reset_password.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class ForgetPasswordScreenController extends GetxController {
  // -- Variables
  final emailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void resetPassword(String email) async {
    if (email.isNotEmpty && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.to(const WaitingToResetPassword());
      } catch (e) {
        Get.snackbar(
          SlectivTexts.snackbarErrorTitle,
          SlectivTexts.snackbarUnableSendResetLink,
          backgroundColor: const Color(0xFFE92027),
          colorText: const Color(0xFFFFFFFF)
        );
      }
    } else {
      Get.snackbar(
        SlectivTexts.snackbarErrorTitle,
        SlectivTexts.snackbarInvalidEmail,
        backgroundColor: const Color(0xFFE92027),
        colorText: const Color(0xFFFFFFFF)
      );
    }
  }

  void clearForm() {
    emailController.clear();
  }
}

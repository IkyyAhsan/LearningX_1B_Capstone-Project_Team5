import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class LoginScreenController extends GetxController {
  // -- Variables
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final hidePassword = true.obs;

  // final CollectionReference _userCollection =
  //     FirebaseFirestore.instance.collection('user');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void clearForm() {
    emailController.clear();
    passwordController.clear();
  }

  Future<bool> checkCredentials(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> loginValidation() async {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        SlectivTexts.snackbarErrorTitle,
        SlectivTexts.snackbarErrorSubtitle,
        backgroundColor: SlectivColors.cancelAndNegatifSnackbarButtonColor,
        colorText: SlectivColors.whiteColor,
      );
      return;
    }

    bool isValidCredentials = await checkCredentials(email, password);

    if (isValidCredentials) {
      Get.snackbar(
        SlectivTexts.snackbarLoginSuccessfulTitle,
        SlectivTexts.snackbarLoginSuccessfulSubtitle,
        backgroundColor: SlectivColors.positifSnackbarColor,
        colorText: SlectivColors.whiteColor,
        duration: const Duration(seconds: 4),
      );

      Get.off(
        () => const BottomNavigationBarView(),
        transition: Transition.cupertinoDialog,
        duration: const Duration(milliseconds: 500),
      );

      clearForm();
    } else {
      Get.snackbar(SlectivTexts.snackbarErrorTitle,
          SlectivTexts.snackbarIncorrectEmailSubtitle,
          backgroundColor: SlectivColors.cancelAndNegatifSnackbarButtonColor,
          colorText: SlectivColors.whiteColor);
    }
  }
}

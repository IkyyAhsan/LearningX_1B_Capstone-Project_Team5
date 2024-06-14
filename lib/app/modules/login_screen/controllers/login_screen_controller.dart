import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';

class LoginScreenController extends GetxController {
  // -- Variables
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final hidePassword = true.obs;

  // final CollectionReference _userCollection =
  //     FirebaseFirestore.instance.collection('user');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void clearForm(){
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
      Get.snackbar('Error', 'Email atau Password tidak boleh kosong',
          backgroundColor: SlectivColors.cancelAndNegatifSnackbarButtonColor, 
          colorText: SlectivColors.whiteColor,
      );
      return;
    }

    bool isValidCredentials = await checkCredentials(email, password);

    if (isValidCredentials) {
      Get.snackbar(
        "Login Successful", 
        "Congratulations, You have logged in successfully", 
        backgroundColor: SlectivColors.positifSnackbarColor, 
        colorText: SlectivColors.whiteColor, 
        duration: const Duration(
          seconds: 4
        ),
      );

      Get.off(
        () => const BottomNavigationBarView(),
        transition: Transition.cupertinoDialog,
        duration: const Duration(milliseconds: 500),
      );

      clearForm();
    } else {
      Get.snackbar('Error', 'Email atau Password salah',
        backgroundColor: SlectivColors.cancelAndNegatifSnackbarButtonColor, 
        colorText: SlectivColors.whiteColor
      );
    }
  }
}
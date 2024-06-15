import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class RegisterScreenController extends GetxController {
  final CollectionReference _userCollection =
    FirebaseFirestore.instance.collection('user');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // -- Variables
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final hidePassword = true.obs;
  final hideConfirmPassword = true.obs;

  void clearForm(){
    name.clear();
    phoneNumber.clear();
    email.clear();
    password.clear();
    confirmPassword.clear();
  }

  Future<bool> isUsernameExists(String email) async {
    QuerySnapshot querySnapshot =
        await _userCollection.where(SlectivTexts.profileEmail, isEqualTo: email).get();
    return querySnapshot.docs.isNotEmpty;
  }

  Future<void> registerUser(String name, String phoneNumber, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      String userId = userCredential.user!.uid;

      await _userCollection.doc(userId).set({
        SlectivTexts.profileName: name,
        SlectivTexts.profilePhoneNumber: phoneNumber,
        SlectivTexts.profileEmail: email,
      });

    } catch (e) {
      Get.snackbar(SlectivTexts.snackbarErrorTitle, SlectivTexts.snackbarErrorRegistrationSubtitle, backgroundColor: SlectivColors.cancelAndNegatifSnackbarButtonColor, colorText: SlectivColors.whiteColor);
      print(e);
    }
  }

  bool validateInputs({
    required String name,
    required String phoneNumber,
    required String email, 
    required String password }) {
    if (name.isEmpty ||
        phoneNumber.isEmpty ||
        email.isEmpty ||
        password.isEmpty ) {
      Get.snackbar(SlectivTexts.snackbarErrorTitle, SlectivTexts.snackbarErrorNotCompleteAllColumnSubtitle, backgroundColor: SlectivColors.cancelAndNegatifSnackbarButtonColor, colorText: SlectivColors.whiteColor);
      return false;
    } else if (!isValidEmail(email)) {
      Get.snackbar(SlectivTexts.snackbarErrorTitle, SlectivTexts.snackbarErrorNotValidEmailSubtitle, backgroundColor: SlectivColors.cancelAndNegatifSnackbarButtonColor, colorText: SlectivColors.whiteColor);
      return false;
    } else if (password.length < 8) {
      Get.snackbar(SlectivTexts.snackbarErrorTitle, SlectivTexts.snackbarErrorMustConsistsPasswordSubtitle, backgroundColor: SlectivColors.cancelAndNegatifSnackbarButtonColor, colorText: SlectivColors.whiteColor);
      return false;
    }
    return true;
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(SlectivTexts.regExp);
    return emailRegex.hasMatch(email);
  }
}

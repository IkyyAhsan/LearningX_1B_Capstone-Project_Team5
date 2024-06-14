import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';

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
        await _userCollection.where('email', isEqualTo: email).get();
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
        'name': name,
        'phone_number': phoneNumber,
        'email': email,
      });

    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan saat registrasi. Silakan coba lagi.', backgroundColor: SlectivColors.cancelAndNegatifSnackbarButtonColor, colorText: SlectivColors.whiteColor);
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
      Get.snackbar('Error', 'Silahkan lengkapi semua kolom terlebih dahulu.', backgroundColor: SlectivColors.cancelAndNegatifSnackbarButtonColor, colorText: SlectivColors.whiteColor);
      return false;
    } else if (!isValidEmail(email)) {
      Get.snackbar('Error', 'Silahkan gunakan format email yang valid.', backgroundColor: SlectivColors.cancelAndNegatifSnackbarButtonColor, colorText: SlectivColors.whiteColor);
      return false;
    } else if (password.length < 8) {
      Get.snackbar('Error', 'Password terdiri dari minimal 8 karakter.', backgroundColor: SlectivColors.cancelAndNegatifSnackbarButtonColor, colorText: SlectivColors.whiteColor);
      return false;
    }
    return true;
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}

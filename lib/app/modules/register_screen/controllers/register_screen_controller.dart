import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreenController extends GetxController {
  // -- Variables
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final hidePassword = true.obs;
  final hideConfirmPassword = true.obs;
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import '../controllers/forget_password_screen_controller.dart';

class ForgetPasswordScreenView extends GetView<ForgetPasswordScreenController> {
  const ForgetPasswordScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: SlectivColors.backgroundColor,
      ),
      body: const Center(
        child: Text(
          'ForgetPasswordScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

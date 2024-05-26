import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import '../controllers/register_screen_controller.dart';

class RegisterScreenView extends GetView<RegisterScreenController> {
  const RegisterScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: SlectivColors.backgroundColor,
      ),
      body: const Center(
        child: Text(
          'RegisterScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

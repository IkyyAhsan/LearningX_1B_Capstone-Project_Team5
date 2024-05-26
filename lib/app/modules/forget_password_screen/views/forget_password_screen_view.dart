import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/forget_password_screen_controller.dart';

class ForgetPasswordScreenView extends GetView<ForgetPasswordScreenController> {
  const ForgetPasswordScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForgetPasswordScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ForgetPasswordScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

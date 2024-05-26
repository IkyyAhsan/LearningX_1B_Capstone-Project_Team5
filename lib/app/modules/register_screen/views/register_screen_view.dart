import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_screen_controller.dart';

class RegisterScreenView extends GetView<RegisterScreenController> {
  const RegisterScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RegisterScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

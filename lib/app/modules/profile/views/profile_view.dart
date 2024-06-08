import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: SlectivColors.backgroundColor,
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

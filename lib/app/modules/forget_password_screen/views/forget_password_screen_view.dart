import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/forget_password_screen/views/widgets/forget_password_form.dart';
import 'package:slectiv_studio_app/app/modules/forget_password_screen/views/widgets/forget_password_header.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/authentication_header.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import '../controllers/forget_password_screen_controller.dart';

class ForgetPasswordScreenView extends GetView<ForgetPasswordScreenController> {
  ForgetPasswordScreenView({super.key});

  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final forgetPasswordController = Get.put(ForgetPasswordScreenController());
    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // -- Authentication Header
                const SizedBox(height: 24),
                const SlectivAuthenticationHeader(),

                // -- Forget Password Header
                const SizedBox(height: 36),
                const SlectivForgetPasswordHeader(),

                // -- Forget Password Form
                const SizedBox(height: 24),
                SlectivFormForgetPassword(forgetPasswordFormKey: forgetPasswordFormKey, forgetPasswordController: forgetPasswordController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/authentication_header.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/header_text.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/login_form.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  LoginScreenView({super.key});

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginScreenController());
    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -- Authentication Header
              const SizedBox(height: 24,),
              const SlectivAuthenticationHeader(),
              
              // -- Header Text
              const SizedBox(height: 36,),
              const SlectivLoginHeaderText(title: SlectivTexts.loginTitle, subtitle: SlectivTexts.loginSubtitle,),
              
              // -- Login Form
              const SizedBox(height: 24,),
              SlectivLoginForm(loginFormKey: loginFormKey, loginController: loginController)
              
            ],
          ),
        ),
      )
    );
  }
}


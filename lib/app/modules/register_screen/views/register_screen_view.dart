import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/authentication_header.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/header_text.dart';
import 'package:slectiv_studio_app/app/modules/register_screen/views/widgets/register_form.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';
import '../controllers/register_screen_controller.dart';

class RegisterScreenView extends GetView<RegisterScreenController> {
  RegisterScreenView({
    super.key
    });

    final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterScreenController());
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
                const SizedBox(height: 24,),
                const SlectivAuthenticationHeader(),

                // -- Registration Header
                const SizedBox(height: 36,),
                const SlectivLoginHeaderText(title: SlectivTexts.registerTitle, subtitle: SlectivTexts.registerSubtitle,),

                // -- Registration Form
                const SizedBox(height: 24,),
                SlectivRegisterForm(registerFormKey: registerFormKey, registerController: registerController)
              ],
            ),
          ),
          )
        ),
    );
  }
}



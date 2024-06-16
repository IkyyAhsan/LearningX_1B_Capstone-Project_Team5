import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/home/controllers/home_controller.dart';
import 'package:slectiv_studio_app/app/modules/home/views/widgets/account_type.dart';
import 'package:slectiv_studio_app/app/modules/home/views/widgets/membership_banner.dart';
import 'package:slectiv_studio_app/app/modules/home/views/widgets/tab_bar.dart';
import 'package:slectiv_studio_app/app/modules/home/views/widgets/welcome_user.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/authentication_header.dart';
import 'package:slectiv_studio_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final profileController = Get.put(ProfileController());
    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // -- Authentication Header
                const SizedBox(height: 24,),
                const SlectivAuthenticationHeader(),

                // -- String Hello to User
                const SizedBox(height: 24,),
                SlectivHelloToUser(profileController: profileController),
                
                // -- Account Type
                const SlectivTypeAccount(),
                const SizedBox(height: 24,),

                // -- Membership Banner
                const SlectivMembershipBanner(),
                const SizedBox(height: 16,),

                // -- Tab Bar 
                const SlectivTabSection(),

                // -- Divider
                const Divider(color: SlectivColors.blackColor, indent: 0, endIndent: 500,),
              ],
            ),
          ),
        )
      ),
    );
  }
}







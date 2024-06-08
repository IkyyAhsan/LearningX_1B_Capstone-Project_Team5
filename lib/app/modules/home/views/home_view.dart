import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/modules/home/views/widgets/tab_bar.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/authentication_header.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/image_strings.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
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
                const SizedBox(height: 24,),
                const SlectivAuthenticationHeader(),
                const SizedBox(height: 24,),
                Text("${SlectivTexts.hallo} ${controller.name.value}", style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700, color: SlectivColors.titleColor)),),
                Text(SlectivTexts.newAccountType, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: SlectivColors.accountTypeColor)),),
                const SizedBox(height: 24,),
                const Image(image: AssetImage(SlectivImages.newMembershipBanners),
                  width: double.infinity,
                ),
                const SizedBox(height: 16,),
                const TabSection(),
              ],
            ),
          ),
        )
      ),
    );
  }
}

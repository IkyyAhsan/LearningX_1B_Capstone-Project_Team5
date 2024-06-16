import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/profile/views/widgets/edit_picture.dart';
import 'package:slectiv_studio_app/app/modules/profile/views/widgets/edit_picture_button.dart';
import 'package:slectiv_studio_app/app/modules/profile/views/widgets/exit_button.dart';
import 'package:slectiv_studio_app/app/modules/profile/views/widgets/profile_image.dart';
import 'package:slectiv_studio_app/app/modules/profile/views/widgets/profile_name.dart';
import 'package:slectiv_studio_app/app/modules/profile/views/widgets/profile_phone_number.dart';
import 'package:slectiv_studio_app/app/modules/profile/views/widgets/profile_type_account.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});

  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
        
            // -- Edit Picture
            SlectivEditPicture(profileController: profileController),

            // -- Edit picture Button
            SlectivEditPictureButton(profileController: profileController),
        
            // -- Name
            SlectivProfileName(profileController: profileController),

            // -- Type Account
            const SlectiveProfileTypeAccount(),
            const SizedBox(height: 20),
          
            // -- Phone Number
            SlectivProfilePhoneNumber(profileController: profileController),
            const SizedBox(height: 16),
          
            // -- Email
            SlectivProfileEmail(profileController: profileController),
            const Spacer(),

            // -- Exit Button
            const SlectivExitButton(),
          ],
        ),
      ),
    );
  }
}
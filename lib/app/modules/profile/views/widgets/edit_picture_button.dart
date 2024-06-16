import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivEditPictureButton extends StatelessWidget {
  const SlectivEditPictureButton({
    super.key,
    required this.profileController,
  });

  final ProfileController profileController;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){
      showModalBottomSheet(
        context: context,
        backgroundColor: SlectivColors.backgroundColor,
        builder: (context) {
          return SizedBox(
            height: 270,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(profileController.profileImageUrl.value),
                              radius: 25,
                              backgroundColor: Colors.transparent,
                            ),
                            const SizedBox(width: 16,),
                            Text(SlectivTexts.editPicture, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: SlectivColors.blackColor)),)
                          ],
                        ),
                        IconButton(onPressed: () => Get.back(), icon: const Icon(FluentIcons.dismiss_24_regular, color: SlectivColors.blackColor))
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: SlectivColors.whiteColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListTile(
                    trailing: const Icon(FluentIcons.image_add_20_filled, color: Colors.black,),
                    title: Text(SlectivTexts.selectPhoto, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),),
                    onTap: () {
                      profileController.pickImage();
                    },
                  ),
                ),
                const SizedBox(height: 4,),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: SlectivColors.whiteColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListTile(
                    trailing: const Icon(FluentIcons.delete_20_filled, color: SlectivColors.cancelAndNegatifSnackbarButtonColor,),
                    title: Text(SlectivTexts.deletePhoto, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: SlectivColors.cancelAndNegatifSnackbarButtonColor)),),
                    onTap: () {
                      profileController.deleteImage();
                    },
                  ),
                )
              ],
            ),
          );
        }
      );
    }, 
    child: Text(
      SlectivTexts.editPicture, 
      style: GoogleFonts.spaceGrotesk(
        textStyle: const TextStyle(
          fontSize: 14, 
          fontWeight: FontWeight.w500, 
          color: SlectivColors.submitButtonColor
        )
      ),
    )
              );
  }
}
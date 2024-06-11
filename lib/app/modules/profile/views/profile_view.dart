import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/login_screen_view.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';
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
        
            Stack(
              alignment: Alignment.center,
              children: [
                Obx(() {
                  return CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.grey.shade800,
                    backgroundImage:
                        profileController.profileImageUrl.value.isNotEmpty
                            ? NetworkImage(
                                profileController.profileImageUrl.value)
                            : null,
                    child: profileController.profileImageUrl.value.isEmpty
                        ? const Icon(
                            FluentIcons.person_20_regular,
                            color: Colors.white,
                            size: 65,
                          )
                        : null,
                  );
                }),
                Positioned(
                  top: 80,
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1, 2),
                          blurRadius: 4,
                        ),
                      ],
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            TextButton(onPressed: (){
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
                                    Text("Edit Picture", style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: SlectivColors.blackColor)),)
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
                            title: Text("Select Photo", style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),),
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
                            trailing: const Icon(FluentIcons.delete_20_filled, color: SlectivColors.cancelButtonColor,),
                            title: Text("Delete Photo", style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: SlectivColors.cancelButtonColor)),),
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
              "Edit Picture", 
              style: GoogleFonts.spaceGrotesk(
                textStyle: const TextStyle(
                  fontSize: 14, 
                  fontWeight: FontWeight.w500, 
                  color: SlectivColors.loginButtonColor
                )
              ),
            )
          ),
        
        
          // Name
        
          Obx(() => GestureDetector(
            onTap: () {
              Get.dialog(
                AlertDialog(
                  title: const Text("Ubah Nama"),
                  content: TextField(
                    controller: TextEditingController(
                      text: profileController.name.value
                    ),
                    decoration: const InputDecoration(
                      labelText: "Nama Baru",
                      hintText: "Masukkan nama baru",
                    ),
                    onChanged: (value) {
                      profileController.name.value = value;
                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("Batal"),
                    ),
                    TextButton(
                      onPressed: () {
                        profileController.updateName(
                          profileController.name.value
                        );
                        Get.back();
                      },
                      child: const Text("Simpan"),
                    ),
                  ],
                ),
              );
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      profileController.name.value,
                      style: GoogleFonts.spaceGrotesk(
                        textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: SlectivColors.profileNameColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          )),
          Text(
            SlectivTexts.newAccountType,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 20),
        
          // Phone Number
        
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Obx(
              () => TextField(
                controller: TextEditingController(
                  text: profileController.phoneNumber.value,
                ),
                readOnly: true,
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text("Change Phone Number"),
                      content: TextField(
                        controller: TextEditingController(
                          text: profileController.phoneNumber.value
                        ),
                        decoration: const InputDecoration(
                          labelText: "New Phone Number",
                          hintText: "Add New Phone Number",
                        ),
                        onChanged: (value) {
                          profileController.phoneNumber.value = value;
                        },
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("Cancel")
                        ),
                        TextButton(
                          onPressed: () {
                            profileController.updatePhoneNumber(profileController.phoneNumber.value);
                            Get.back();
                          },
                          child: const Text("Save")
                        ),
                      ],
                    ),
                  );
                },
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        
          // Email
        
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Obx(() => TextField(
              controller: TextEditingController(
                text: profileController.email.value,
              ),
              decoration: const InputDecoration(
                labelText: 'Email',
                enabled: false, // Disable editing
              ),
            )),
          ),
          const Spacer(),
          // Exit Button
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(() => LoginScreenView());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: SlectivColors.cancelButtonColor,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24, vertical: 12
                  ),
                ),
                child: Text(
                  'Exit', 
                  style: GoogleFonts.spaceGrotesk(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: SlectivColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
  }
}
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/modules/profile/views/widgets/profile_box.dart';
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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.grey.shade800,
                    backgroundImage: profileController.profileImageUrl.value.isNotEmpty
                        ? NetworkImage(profileController.profileImageUrl.value)
                        : null,
                    child: profileController.profileImageUrl.value.isEmpty
                        ? const Icon(
                            FluentIcons.person_20_regular,
                            color: Colors.white,
                          )
                        : null,
                  ),
                  Positioned(
                    top: 80,
                    child: Container(
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(1, 2),
                            ),
                          ],
                          shape: BoxShape.circle),
                      child: IconButton(
                        onPressed: () {
                          profileController.pickImage();
                        },
                        icon: const Icon(FluentIcons.camera_switch_20_regular),
                        iconSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -- Name
                  
                  Obx(() => GestureDetector(
                        onTap: () {
                          Get.dialog(
                            AlertDialog(
                              title: const Text("Ubah Nama"),
                              content: TextField(
                                controller: TextEditingController(
                                    text: profileController.name.value),
                                decoration: const InputDecoration(
                                    labelText: "Nama Baru",
                                    hintText: "Masukkan nama baru"),
                                onChanged: (value) {
                                  profileController.name.value = value;
                                },
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text("Batal")),
                                TextButton(
                                    onPressed: () {
                                      profileController.updateName(
                                          profileController.name.value);
                                      Get.back();
                                    },
                                    child: const Text("Simpan")),
                              ],
                            ),
                          );
                        },
                        child: Text(profileController.name.value, style: GoogleFonts.spaceGrotesk(textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: SlectivColors.profileNameColor)),)
                      )),
                ],
              ),
            )
            ],
          ),
        ),
      ),
    );
  }
}

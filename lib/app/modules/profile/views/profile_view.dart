import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
              const SizedBox(height: 16),
              // Name
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
                                profileController
                                    .updateName(profileController.name.value);
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
                                textStyle: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: SlectivColors.profileNameColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.edit, color: Colors.grey),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Moment Welcomer",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 20),
              // Phone Number
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Obx(() => TextField(
                      controller: TextEditingController(
                          text: profileController.phoneNumber.value),
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            _showEditDialog(context, 'Phone',
                                profileController.phoneNumber.value, (value) {
                              profileController.updatePhoneNumber(value);
                            });
                          },
                        ),
                      ),
                    )),
              ),
              const SizedBox(height: 16),
              // Email
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Obx(() => TextField(
                      controller: TextEditingController(
                        text: profileController.email.value,
                      ),
                      decoration: InputDecoration(
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
                      // Implement your exit action here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    child: const Text('Exit'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, String field, String currentValue,
      Function(String) onSave) {
    TextEditingController _controller =
        TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit $field'),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Enter new $field',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                onSave(_controller.text);
                Get.back();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

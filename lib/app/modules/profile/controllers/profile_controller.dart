import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';

class ProfileController extends GetxController {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('user');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var name = ''.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;
  var profileImageUrl = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userSnapshot =
            await _userCollection.doc(user.uid).get();
        if (userSnapshot.exists) {
          var userData = userSnapshot.data() as Map<String, dynamic>;
          name.value = userData['name'] ?? '';
          email.value = userData['email'] ?? '';
          phoneNumber.value = userData['phone_number'] ?? '';
          profileImageUrl.value = userData['profileImageUrl'] ?? '';
        } else {
          print('No user data found.');
        }
      } else {
        print('No user logged in.');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File image = File(pickedFile.path);
      await uploadImage(image);
      Get.back();
      Get.snackbar("Photo Changed", "Your profile photo has been successfully changed.", backgroundColor: SlectivColors.loginButtonColor, colorText: SlectivColors.whiteColor);
    } else {
      print('No image selected.');
    }
  }


      

  void deleteImage() {
    profileImageUrl.value = '';
    Get.back();
    Get.snackbar("Photo Deleted", "Your profile photo has been successfully deleted.", backgroundColor: SlectivColors.cancelButtonColor, colorText: SlectivColors.whiteColor);
  }

  Future<void> uploadImage(File image) async {
    try {
      Get.dialog(
        const Center(
          child: SizedBox(
            height: 100,
            width: 100,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(SlectivColors.circularProgressColor),
              strokeWidth: 5,
            ),
          ),
        ),
        barrierDismissible: false,
      );

      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${DateTime.now().millisecondsSinceEpoch}.jpg');

      await ref.putFile(image);

      String imageUrl = await ref.getDownloadURL();

      profileImageUrl.value = imageUrl;

      User? user = _auth.currentUser;
      if (user != null) {
        await _userCollection.doc(user.uid).update({
          'profileImageUrl': imageUrl,
        });
      }

      Get.back();
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<void> updateName(String newName) async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        await _userCollection.doc(user.uid).update({'name': newName});
        name.value = newName;
        Get.back();
        Get.snackbar("Success", "Name has been updated",
            backgroundColor: SlectivColors.registerButtonColor, colorText: SlectivColors.whiteColor
        );
        
      } catch (e) {
        Get.snackbar("Kesalahan", "Gagal memperbarui nama: $e");
        Get.snackbar("Kesalahan", "Gagal memperbarui nama: $e",
            backgroundColor: SlectivColors.cancelButtonColor, colorText: SlectivColors.whiteColor);
      }
    }
  }

  Future<void> updatePhoneNumber(String newPhoneNumber) async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        await _userCollection.doc(user.uid).update({'phone_number': newPhoneNumber});
        phoneNumber.value = newPhoneNumber;
        Get.snackbar("Success", "Name has been updated",
            backgroundColor: SlectivColors.forgetPasswordButtonColor, colorText: SlectivColors.whiteColor);
      } catch (e) {
        Get.snackbar("Kesalahan", "Gagal memperbarui nama: $e");
        Get.snackbar("Kesalahan", "Gagal memperbarui nama: $e",
            backgroundColor: SlectivColors.cancelButtonColor, colorText: SlectivColors.whiteColor);
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/home/views/home_view.dart';
import 'package:slectiv_studio_app/app/modules/profile/views/profile_view.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';

class BottomNavigationBarController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomeView(), Container(color: SlectivColors.backgroundColor,), Container(color: SlectivColors.backgroundColor,), const ProfileView()];
}

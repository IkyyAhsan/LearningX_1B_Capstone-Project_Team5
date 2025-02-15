import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/utils/constants/image_strings.dart';

class GalleryController extends GetxController {
  // Observable list untuk menyimpan path gambar
  final imageList = <String>[].obs;
  final pageController = PageController(); // Tambahkan PageController
  final currentSlideIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi daftar gambar
    imageList.addAll([
      SlectivImages.galeryImage1,
      SlectivImages.galeryImage2,
      SlectivImages.galeryImage3,
      SlectivImages.galeryImage4,
      SlectivImages.galeryImage5,
      SlectivImages.galeryImage6,
      SlectivImages.galeryImage7,
      SlectivImages.galeryImage8,
      SlectivImages.galeryImage9,
    ]);
  }

  void goToPreviousPage() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  void goToNextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  void onClose() {
    pageController.dispose(); // Pastikan untuk dispose PageController
    super.onClose();
  }
}

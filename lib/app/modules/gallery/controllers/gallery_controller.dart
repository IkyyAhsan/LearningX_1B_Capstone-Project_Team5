import 'package:get/get.dart';

class GalleryController extends GetxController {
  // Observable list to hold image paths
  final imageList = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the image list
    imageList.addAll([
      'assets/images/gallery/image1.png',
      'assets/images/gallery/image2.png',
      'assets/images/gallery/image3.png',
      'assets/images/gallery/image4.png',
      'assets/images/gallery/image5.png',
      'assets/images/gallery/image6.png',
      'assets/images/gallery/image7.png',
      'assets/images/gallery/image8.png',
      'assets/images/gallery/image9.png',
    ]);
  }

  @override
  void onReady() {
    super.onReady();
    // Add additional logic if needed
  }

  @override
  void onClose() {
    super.onClose();
    // Add additional cleanup if needed
  }
}

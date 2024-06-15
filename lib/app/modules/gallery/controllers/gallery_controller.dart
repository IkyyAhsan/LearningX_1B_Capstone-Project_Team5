import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/utils/constants/image_strings.dart';

class GalleryController extends GetxController {
  // Observable list to hold image paths
  final imageList = <String>[].obs;
  final carouselController = CarouselController();
  final currentSlideIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize the image list
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

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/gallery/controllers/gallery_controller.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivPhotoGallery extends StatelessWidget {
  const SlectivPhotoGallery({
    super.key,
    required this.controller,
  });

  final GalleryController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(SlectivTexts.galleryPhoto,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: SlectivColors.titleColor)),
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: Text(SlectivTexts.gallerysub,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: SlectivColors.titleColor)),
        ),
        const SizedBox(
          height: 15,
        ),
        Obx(() {
          return Stack(
            children: [
              CarouselSlider(
                carouselController: controller.carouselController,
                options: CarouselOptions(
                  autoPlay: true,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  height: 330,
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    controller.currentSlideIndex.value = index;
                  },
                ),
                items: controller.imageList.map((item) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    child: Center(
                      child: Image.asset(
                        item,
                      ),
                    ),
                  );
                }).toList(),
              ),
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: IconButton(
                  icon: const Icon(Icons.arrow_left, size: 40, color: SlectivColors.titleColor),
                  onPressed: () {
                    controller.carouselController.previousPage();
                  },
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: IconButton(
                  icon: const Icon(Icons.arrow_right, size: 40, color: SlectivColors.titleColor),
                  onPressed: () {
                    controller.carouselController.nextPage();
                  },
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
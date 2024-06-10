import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/gallery/controllers/gallery_controller.dart';
import 'package:slectiv_studio_app/app/modules/gallery/views/widgets/authentication_header_blue.dart';
import 'package:slectiv_studio_app/app/modules/gallery/views/widgets/footer_blue.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/image_strings.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class GalleryView extends GetView<GalleryController> {
  const GalleryView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GalleryController());
    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(SlectivTexts.galleryWellcome,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: SlectivColors.titleColor)),
                    const Text(
                      SlectivTexts.galleryWellcome2,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: SlectivColors.accountTypeColor),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const SlectivAuthenticationHeaderBlue(),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      SlectivTexts.galleryHsitory,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: SlectivColors.accountTypeColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      SlectivTexts.galleryHsitoryContex1,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: SlectivColors.accountTypeColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Image(image: AssetImage(SlectivImages.line1)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      SlectivTexts.galleryHistoryContex2,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: SlectivColors.accountTypeColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Center(
                      child: Image(image: AssetImage(SlectivImages.line1)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      SlectivTexts.galleryHistoryContex3,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: SlectivColors.accountTypeColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Center(
                      child: Image(image: AssetImage(SlectivImages.line2)),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
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
                      return CarouselSlider(
                        options: CarouselOptions(
                          autoPlay: true,
                          viewportFraction: 1,
                          enlargeCenterPage: true,
                          height: 330,
                          initialPage: 0,
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
                      );
                    }),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
              Container(
                height: 150,
                padding: const EdgeInsets.all(20),
                color: SlectivColors.semiWhite,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Left Side
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SlectivFooterBlue2(),
                          Center(
                            child: Text(
                              SlectivTexts.splashTextDesc,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: SlectivColors.loginButtonColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50),
                    // Right Side
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(SlectivTexts.footerContacUs,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: SlectivColors.titleColor)),
                          SizedBox(height: 5),
                          Text(SlectivTexts.footerPhone,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: SlectivColors.titleColor)),
                          Text(SlectivTexts.footerIG,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: SlectivColors.titleColor)),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
    );
  }
}

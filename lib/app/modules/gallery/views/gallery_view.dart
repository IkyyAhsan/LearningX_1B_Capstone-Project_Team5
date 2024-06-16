import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/gallery/controllers/gallery_controller.dart';
import 'package:slectiv_studio_app/app/modules/gallery/views/widgets/authentication_header_blue.dart';
import 'package:slectiv_studio_app/app/modules/gallery/views/widgets/first_galley_history.dart';
import 'package:slectiv_studio_app/app/modules/gallery/views/widgets/first_welcome_gallery.dart';
import 'package:slectiv_studio_app/app/modules/gallery/views/widgets/footer_widget.dart';
import 'package:slectiv_studio_app/app/modules/gallery/views/widgets/gallery_history_header.dart';
import 'package:slectiv_studio_app/app/modules/gallery/views/widgets/history_divider.dart';
import 'package:slectiv_studio_app/app/modules/gallery/views/widgets/lines_divider.dart';
import 'package:slectiv_studio_app/app/modules/gallery/views/widgets/photo_gallery.dart';
import 'package:slectiv_studio_app/app/modules/gallery/views/widgets/second_gallery_history.dart';
import 'package:slectiv_studio_app/app/modules/gallery/views/widgets/second_welcome_gallery.dart';
import 'package:slectiv_studio_app/app/modules/gallery/views/widgets/third_gallery_history.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';

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

                    // -- Welcome Gallery Text
                    const SizedBox(height: 24,),
                    const SlectiveFirstWelcomeGallery(),
                    
                    const SlectivSecondWelcomeGallery(),
                    const SizedBox(height: 24,),

                    // -- Blue App Logo
                    const SlectivAuthenticationHeaderBlue(),
                    const SizedBox(height: 24),

                    // -- History Header Text
                    const SlectivGalleryHistoryHeader(),
                    const SizedBox(height: 10,),

                    // -- First Paragraph of History
                    const SlectivFirstParagraphGalleryHistory(),
                    const SizedBox(height: 10,),

                    // -- History Divider
                    const SlectivHistoryDivider(),
                    const SizedBox(height: 10,),

                    // -- Second Paragraph of History
                    const SlectivSecondParagraphGalleryHistory(),
                    const SizedBox(height: 10,),

                    // -- History Divider
                    const SlectivHistoryDivider(),
                    const SizedBox(height: 10,),
                    
                    // -- Third Paragraph of History
                    const SlectivThirdParagraphGalleryHistory(),
                    const SizedBox(height: 34,),

                    // -- Lines Divider
                    const SlectivLinesDivider(),
                    const SizedBox(height: 24,),

                    // Photo Gallery
                    SlectivPhotoGallery(controller: controller),
                    const SizedBox(height: 24,),
                  ],
                ),
              ),
              // Footer
              const SlectivFooterWidget(),
            ],
          ),
        )
      ),
    );
  }
}



















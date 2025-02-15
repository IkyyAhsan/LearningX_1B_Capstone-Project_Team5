import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/submit_button.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/image_strings.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivPhotobooth extends StatefulWidget {
  const SlectivPhotobooth({super.key});

  @override
  _SlectivPhotoboothState createState() => _SlectivPhotoboothState();
}

class _SlectivPhotoboothState extends State<SlectivPhotobooth> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(SlectivImages.saveIGVideo);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 24,
              ),
              Text(
                SlectivTexts.photoboothTitle,
                style: GoogleFonts.spaceGrotesk(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: SlectivColors.blackColor)),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                SlectivTexts.photoboothDescription,
                style: GoogleFonts.spaceGrotesk(
                    textStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: SlectivColors.blackColor)),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // First Feature
                  Container(
                    width: 210,
                    height: 25,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: SlectivColors.blackColor.withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      SlectivTexts.photoboothFeature,
                      style: GoogleFonts.spaceGrotesk(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: SlectivColors.blackColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // Second Feature
                  Container(
                    width: 210,
                    height: 25,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: SlectivColors.blackColor.withOpacity(0.1),
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      SlectivTexts.widePhotoboxFeature,
                      style: GoogleFonts.spaceGrotesk(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: SlectivColors.blackColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // Third Feature
                  Container(
                    width: 210,
                    height: 25,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: SlectivColors.blackColor.withOpacity(0.1)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      SlectivTexts.hightAngleFeature,
                      style: GoogleFonts.spaceGrotesk(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: SlectivColors.blackColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SlectiveWidgetButton(
                  buttonName: SlectivTexts.photoboothButtonName,
                  onPressed: () async {
                    final Uri adminContactUrl = Uri.parse(
                        'https://wa.me/6281345383641?text=Halo,%20saya%20ingin%20mengajukan%20pertanyaan.');
                    launchUrl(adminContactUrl);
                    // Uri adminContactUri = Uri.parse(SlectivTexts.adminContactUrl);
                    // if (await canLaunchUrl(adminContactUri)) {
                    //   await launchUrl(adminContactUri);
                    // } else {
                    //   Get.snackbar(
                    //     SlectivTexts.buttonExecutionTitle,
                    //     SlectivTexts.buttonExecutionSubtitle,
                    //     backgroundColor: SlectivColors.warningColor,
                    //     colorText: SlectivColors.whiteColor,
                    //   );
                    // }
                  },
                  backgroundColor: SlectivColors.submitButtonColor),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

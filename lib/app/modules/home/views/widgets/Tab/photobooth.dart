import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/submit_button.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/image_strings.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivPhotobooth extends StatelessWidget {
  const SlectivPhotobooth({super.key});

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
              const SizedBox(height: 24,),
              Text(SlectivTexts.photoboothTitle, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: SlectivColors.blackColor)),),
              const SizedBox(height: 10,),
              const Center(child: Image(image: AssetImage(SlectivImages.photoboothImages))),
              const SizedBox(height: 10,),
              Text(SlectivTexts.photoboothDescription, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: SlectivColors.blackColor)), textAlign: TextAlign.justify,),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(SlectivTexts.selfPhotoPerson, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: SlectivColors.blackColor)),),
                      Text(SlectivTexts.selfPhotoPrice, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 36, fontWeight: FontWeight.w300, color: SlectivColors.blackColor)),),
                      const SizedBox(height: 5,),
                      Text(SlectivTexts.selfPhotoFee, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: SlectivColors.blackColor)),)
                    ],
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // First Feature
                    Container(
                      width: 180,
                      height: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: SlectivColors.blackColor.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text("® 15 Minutes Session", 
                        style: GoogleFonts.spaceGrotesk(
                          textStyle:const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400, color: SlectivColors.blackColor
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),

                    // Second Feature
                    Container(
                      width: 180,
                      height: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: SlectivColors.blackColor.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text("® Softlite", 
                        style: GoogleFonts.spaceGrotesk(
                          textStyle:const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400, color: SlectivColors.blackColor
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),

                    // Third Feature
                    Container(
                      width: 180,
                      height: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: SlectivColors.blackColor.withOpacity(0.2)
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text("® Printed Photo", 
                        style: GoogleFonts.spaceGrotesk(
                          textStyle:const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400, color: SlectivColors.blackColor
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),

                    // Four Feature
                    Container(
                      width: 180,
                      height: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: SlectivColors.blackColor.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text("® Choose Background", 
                        style: GoogleFonts.spaceGrotesk(
                          textStyle:const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400, color: SlectivColors.blackColor
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ],
              ),
              const SizedBox(height: 30,),
              SlectiveWidgetButton(buttonName: "Contact Us", onPressed: (){}, backgroundColor: SlectivColors.registerButtonColor),
              const SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}
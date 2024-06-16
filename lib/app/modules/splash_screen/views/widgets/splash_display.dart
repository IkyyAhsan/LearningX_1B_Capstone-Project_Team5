import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/app/modules/splash_screen/views/widgets/center_logo.dart';
import 'package:slectiv_studio_app/utils/constants/image_strings.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivSplashDisplay extends StatelessWidget {
  const SlectivSplashDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CenterLogo(
          logo: SlectivImages.applogo,
          width: 300,
          height: 100,
        ),
        const SizedBox(height: 16,),
        Text(SlectivTexts.splashTextDesc, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF1A1A1A))),)
      ],
    );
  }
}
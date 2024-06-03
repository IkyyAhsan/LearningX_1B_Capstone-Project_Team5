import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/image_strings.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivAuthenticationHeader extends StatelessWidget {
  const SlectivAuthenticationHeader({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 46.47,
            width: 125,
            child: Image(
              image: AssetImage(
                SlectivImages.applogo),
            ),
          ),
          const SizedBox(height: 16,),
          Text(SlectivTexts.brandSubtitle, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: SlectivColors.blackColor))),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivLoginHeaderText extends StatelessWidget {
  const SlectivLoginHeaderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(SlectivTexts.loginTitle, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: SlectivColors.titleColor)),),
        Text(SlectivTexts.loginSubtitle, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: SlectivColors.blackColor)),),
      ],
    );
  }
}
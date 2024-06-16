import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivTypeAccount extends StatelessWidget {
  const SlectivTypeAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(SlectivTexts.newAccountType, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: SlectivColors.jenisAkunColor)),);
  }
}
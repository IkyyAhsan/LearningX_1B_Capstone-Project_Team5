import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,required this.lottie,required this.title, required this.subtitle, 
  });

  final String lottie, title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Lottie.asset(lottie),
          ),
          Text(title,  style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: SlectivColors.titleColor)), textAlign: TextAlign.center,),
          const SizedBox(height: 16,),
          Text(subtitle, style: GoogleFonts.spaceGrotesk(textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: SlectivColors.blackColor)), textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivSecondWelcomeGallery extends StatelessWidget {
  const SlectivSecondWelcomeGallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      SlectivTexts.galleryWellcome2,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: SlectivColors.jenisAkunColor),
    );
  }
}
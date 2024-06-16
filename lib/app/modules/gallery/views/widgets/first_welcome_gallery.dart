import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectiveFirstWelcomeGallery extends StatelessWidget {
  const SlectiveFirstWelcomeGallery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(SlectivTexts.galleryWellcome,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: SlectivColors.titleColor));
  }
}
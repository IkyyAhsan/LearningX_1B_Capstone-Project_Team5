import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivThirdParagraphGalleryHistory extends StatelessWidget {
  const SlectivThirdParagraphGalleryHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      SlectivTexts.galleryHistoryContex3,
      textAlign: TextAlign.justify,
      style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: SlectivColors.jenisAkunColor),
    );
  }
}
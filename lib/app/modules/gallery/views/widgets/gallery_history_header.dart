import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivGalleryHistoryHeader extends StatelessWidget {
  const SlectivGalleryHistoryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      SlectivTexts.galleryHsitory,
      textAlign: TextAlign.justify,
      style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: SlectivColors.jenisAkunColor),
    );
  }
}
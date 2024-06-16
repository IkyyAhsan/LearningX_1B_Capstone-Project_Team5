import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/utils/constants/image_strings.dart';

class SlectivHistoryDivider extends StatelessWidget {
  const SlectivHistoryDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Image(image: AssetImage(SlectivImages.line1)),
    );
  }
}
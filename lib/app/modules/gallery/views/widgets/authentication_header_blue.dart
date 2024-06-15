import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/utils/constants/image_strings.dart';

class SlectivAuthenticationHeaderBlue extends StatelessWidget {
  const SlectivAuthenticationHeaderBlue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 145,
            width: 328,
            child: Image(
              image: AssetImage(SlectivImages.applogoBlue),
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

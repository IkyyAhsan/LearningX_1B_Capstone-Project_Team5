import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/utils/constants/image_strings.dart';

class SlectivAuthenticationHeaderBlue extends StatelessWidget {
  const SlectivAuthenticationHeaderBlue({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 145,
            width: 328,
            child: Image(
              image: AssetImage(SlectivImages.applogoBlue),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}

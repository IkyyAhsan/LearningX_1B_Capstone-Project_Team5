import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/utils/constants/image_strings.dart';

class SlectivMembershipBanner extends StatelessWidget {
  const SlectivMembershipBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Image(image: AssetImage(SlectivImages.newMembershipBanners),
      width: double.infinity,
    );
  }
}
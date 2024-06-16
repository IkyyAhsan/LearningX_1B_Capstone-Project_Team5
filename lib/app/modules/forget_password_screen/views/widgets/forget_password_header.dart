import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/header_text.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivForgetPasswordHeader extends StatelessWidget {
  const SlectivForgetPasswordHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SlectivLoginHeaderText(
      title: SlectivTexts.forgetPasswordTitle,
      subtitle: SlectivTexts.forgetPasswordSubtitle,
    );
  }
}
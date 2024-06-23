import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivTypeAccount extends StatelessWidget {
  const SlectivTypeAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
          SlectivTexts.oldAccountType,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
          ),
        );
  }
}

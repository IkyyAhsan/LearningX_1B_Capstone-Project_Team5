import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectiveProfileTypeAccount extends StatelessWidget {
  const SlectiveProfileTypeAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      SlectivTexts.newAccountType,
      style: TextStyle(
        fontSize: 16,
        color: Colors.grey.shade600,
      ),
    );
  }
}
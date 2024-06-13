import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/app/modules/gallery/views/widgets/footer_blue.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivFooterWidget extends StatelessWidget {
  const SlectivFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(20),
      color: SlectivColors.semiWhite,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Left Side
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SlectivFooterBlue2(),
                Center(
                  child: Text(
                    SlectivTexts.splashTextDesc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: SlectivColors.submitButtonColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 50),
          // Right Side
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(SlectivTexts.footerContacUs,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: SlectivColors.titleColor)),
                SizedBox(height: 5),
                Text(SlectivTexts.footerPhone,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: SlectivColors.titleColor)),
                Text(SlectivTexts.footerIG,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: SlectivColors.titleColor)),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
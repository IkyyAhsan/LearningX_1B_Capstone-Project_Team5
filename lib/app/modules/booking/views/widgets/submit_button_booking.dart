import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';

class SlectiveWidgetButtonBooking extends StatelessWidget {
  const SlectiveWidgetButtonBooking({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.backgroundColor,
  }) : super(key: key);
  final String buttonName;
  final VoidCallback onPressed;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        child: Text(
          buttonName,
          style: GoogleFonts.spaceGrotesk(
              textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: SlectivColors.whiteColor)),
        ),
      ),
    );
  }
}

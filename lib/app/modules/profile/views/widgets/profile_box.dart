import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SlectivProfileBox extends StatelessWidget {
  const SlectivProfileBox({
    super.key, required this.text, required this.icon, this.continueIcon,
  });

  final String text;
  final IconData icon;
  final IconData? continueIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromARGB(31, 142, 142, 142)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.black),
                const SizedBox(width: 16,),
                Text(text, style: GoogleFonts.plusJakartaSans(textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
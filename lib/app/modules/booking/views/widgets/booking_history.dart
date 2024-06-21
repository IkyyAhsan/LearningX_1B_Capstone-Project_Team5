import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';

class SlectivBookingHistory extends StatelessWidget {
  const SlectivBookingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: IconButton(
                      onPressed: () => Get.back(), 
                      icon: const Icon(
                        FluentIcons.arrow_left_20_regular, 
                        size: 25, 
                        color: SlectivColors.blackColor,
                      )
                    ),
        ),
        backgroundColor: SlectivColors.backgroundColor,
        title: Text("History", 
          style: GoogleFonts.spaceGrotesk(
            textStyle: const TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.w600, 
              color: SlectivColors.blackColor
            )
          ),
        ),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("asdas")
            ],
          ),
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';

class TimeCard extends StatelessWidget {
  final String time;

  const TimeCard({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 70,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: SlectivColors.titleColor,
                ),
              ),
              const Text(
                'WITA',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: SlectivColors.titleColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
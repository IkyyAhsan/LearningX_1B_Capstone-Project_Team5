import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:slectiv_studio_app/app/modules/booking/controllers/booking_controller.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class SlectivColorDropdown extends StatelessWidget {
  const SlectivColorDropdown({
    super.key,
    required this.controller,
  });

  final BookingController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() => Container(
            width: double.infinity,
            height: 48.65,
            decoration: BoxDecoration(
              border: Border.all(color: SlectivColors.blackColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButton<String>(
              isExpanded: true,
              hint: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(SlectivTexts.selectAnOption),
              ),
              value: controller.selectedOption.value.isEmpty ? null : controller.selectedOption.value,
              onChanged: (String? newValue) {
                controller.selectedOption.value = newValue!;
              },
              items: <String>[
                'White Background',
                'Dark Grey Background',
                'Sage Background',
                'Wide Blue',
                'Spotlight',
                'American Yearbook'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
          )),
    );
  }
}
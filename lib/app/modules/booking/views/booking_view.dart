import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/submit_button.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';
import 'package:slectiv_studio_app/app/modules/login_screen/views/widgets/authentication_header.dart';
import 'package:slectiv_studio_app/app/modules/booking/views/widgets/time_card.dart';
import 'package:table_calendar/table_calendar.dart';
import '../controllers/booking_controller.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());

    return Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const SlectivAuthenticationHeader(),
                const SizedBox(height: 30),
                const Text(
                  SlectivTexts.bookingTitle1,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: SlectivColors.titleColor,
                  ),
                ),
                const SizedBox(height: 10),
                // calender
                TableCalendar(
                  focusedDay: DateTime.now(), 
                  firstDay: DateTime.utc(2024, 1, 1), 
                  lastDay: DateTime.utc(2024, 12, 31),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimeCard(time: '10:00'),
                    TimeCard(time: '10:30'),
                    TimeCard(time: '11:00'),
                    TimeCard(time: '11:30'),
                    TimeCard(time: '12:00'),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimeCard(time: '12:30'),
                    TimeCard(time: '14:00'),
                    TimeCard(time: '14:30'),
                    TimeCard(time: '15:00'),
                    TimeCard(time: '15:30'),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimeCard(time: '16:00'),
                    TimeCard(time: '16:30'),
                    TimeCard(time: '17:00'),
                    TimeCard(time: '17:30'),
                    TimeCard(time: '18:00'),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimeCard(time: '18:30'),
                    TimeCard(time: '19:00'),
                    TimeCard(time: '19:30'),
                    TimeCard(time: '20:00'),
                    TimeCard(time: '20:30'),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimeCard(time: '21:00'),
                    TimeCard(time: '21:30'),
                    TimeCard(time: '22:00'),
                    TimeCard(time: '22:30'),
                    TimeCard(time: '23:00'),
                  ],
                ),
                const SizedBox(height: 30),
                const Text(
                  SlectivTexts.bookingTitle3,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: SlectivColors.titleColor,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Obx(() => Container(
                        width: 326,
                        height: 48.65,
                        decoration: BoxDecoration(
                          border: Border.all(color: SlectivColors.titleColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: const Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 8.0),
                            child: const Text("Select an option..."),
                          ),
                          value: controller.selectedOption.value,
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                        ),
                      )),
                ),
                const SizedBox(height: 30),
                const Text(
                  SlectivTexts.bookingTitle4,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: SlectivColors.titleColor,
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Obx(() => Container(
                        width: 326,
                        height: 48.65,
                        decoration: BoxDecoration(
                          border: Border.all(color: SlectivColors.titleColor),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: const Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("Select an option..."),
                          ),
                          value: controller.selectedQuantity.value,
                          onChanged: (String? newValue) {
                            controller.selectedQuantity.value = newValue!;
                          },
                          items: <String>[
                            '1',
                            '2',
                            '3',
                            '4(+20.000)',
                            '5(+40.000)',
                            '6(+60.000)',
                            '7(+80.000)',
                            '8(+100.000)',
                            '9(+120.000)',
                            '10(+140.000)',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(value),
                              ),
                            );
                          }).toList(),
                        ),
                      )),
                ),
                const SizedBox(height: 24),
                SlectiveWidgetButton(
                    buttonName: SlectivTexts.informationLabel,
                    onPressed: () {},
                    backgroundColor: SlectivColors.submitButtonColor),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
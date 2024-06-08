import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/booking/controllers/booking_controller.dart';
import 'package:slectiv_studio_app/utils/constants/colors.dart';

class BookingView extends GetView<BookingController> {
  const BookingView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: SlectivColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(),
      )
    );
  }
}

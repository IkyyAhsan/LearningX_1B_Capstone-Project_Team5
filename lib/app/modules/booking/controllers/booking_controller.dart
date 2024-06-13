import 'package:get/get.dart';

class BookingController extends GetxController {
  final count = 0.obs;
  final selectedDate = Rxn<DateTime>();
  final selectedOption = Rxn<String>();
  final selectedQuantity = Rxn<String>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
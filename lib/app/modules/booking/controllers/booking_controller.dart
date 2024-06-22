import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:slectiv_studio_app/app/modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class BookingController extends GetxController {
  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;
  var selectedOption = ''.obs;
  var selectedQuantity = ''.obs;
  var selectedTime = ''.obs;
  var bookingCount = 0.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var bookings = <String, List<String>>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBookings();
    fetchBookingCount();
    _scheduleDailyReset();
  }

  Future<void> fetchBookings() async {
    var snapshot = await _firestore.collection(SlectivTexts.bookings).get();
    for (var doc in snapshot.docs) {
      String date = (doc[SlectivTexts.bookingDate] as Timestamp)
          .toDate()
          .toIso8601String()
          .split('T')
          .first;
      if (!bookings.containsKey(date)) {
        bookings[date] = [];
      }
      String time = doc[SlectivTexts.bookingTime];
      String color = doc[SlectivTexts.bookingColor];
      String person = doc[SlectivTexts.bookingPerson];
      String bookingDetails = "$time|$color|$person";
      bookings[date]?.add(bookingDetails);
    }
  }

  Future<void> fetchBookingCount() async {
    var snapshot = await _firestore.collection(SlectivTexts.bookings).get();
    bookingCount.value = snapshot.docs.length;
  }

  Future<void> saveBooking() async {
    await _firestore.collection(SlectivTexts.bookings).add({
      SlectivTexts.bookingDate: selectedDay.value,
      SlectivTexts.bookingTime: selectedTime.value,
      SlectivTexts.bookingColor: selectedOption.value,
      SlectivTexts.bookingPerson: selectedQuantity.value,
    });
    String date = selectedDay.value.toIso8601String().split('T').first;
    if (!bookings.containsKey(date)) {
      bookings[date] = [];
    }
    
    String bookingDetails = "${selectedTime.value}|${selectedOption.value}|${selectedQuantity.value}";
    bookings[date]?.add(bookingDetails);
    selectedTime.value = '';
    bookingCount.value += 1;
  }

  bool isTimeBooked(DateTime date, String time) {
    String dateStr = date.toIso8601String().split('T').first;
    return bookings[dateStr]?.any((booking) => booking.split('|')[0] == time) ?? false;
  }

  bool isTimePassed(DateTime date, String time) {
    final now = DateTime.now();
    if (date.isBefore(DateTime(now.year, now.month, now.day))) {
      return true;
    } else if (date.isAtSameMomentAs(DateTime(now.year, now.month, now.day))) {
      final bookingTime = DateTime(now.year, now.month, now.day,
          int.parse(time.split(':')[0]), int.parse(time.split(':')[1]));
      return bookingTime.isBefore(now);
    }
    return false;
  }

  void _scheduleDailyReset() {
    final now = DateTime.now();
    final nextMidnight = DateTime(now.year, now.month, now.day + 1);
    final duration = nextMidnight.difference(now);

    Future.delayed(duration, () {
      selectedDay.value = DateTime.now();
      fetchBookings();
      _scheduleDailyReset();
    });
  }

  Future<void> slectivBookingValidation(BookingController controller) async {
    if (controller.selectedOption.value.isEmpty ||
        controller.selectedQuantity.value.isEmpty ||
        controller.selectedTime.value.isEmpty) {
      Get.snackbar(SlectivTexts.errorBookingValidationTitle,
          SlectivTexts.errorBookingValidationSubtitle);
    } else {
      await controller.saveBooking();
      Get.offAll(const BottomNavigationBarView());
    }
  }

  bool get isBookingComplete {
    return selectedOption.isNotEmpty && selectedQuantity.isNotEmpty && selectedTime.isNotEmpty;
  }

  // Add this method
  String getAccountTypeText() {
    return bookingCount.value >= 5 ? SlectivTexts.oldAccountType : SlectivTexts.newAccountType;
  }
}

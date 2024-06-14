import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:slectiv_studio_app/app/modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';

class BookingController extends GetxController {
  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;
  var selectedOption = ''.obs;
  var selectedQuantity = ''.obs;
  var selectedTime = ''.obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var bookings = <String, List<String>>{}.obs; // Key: date, Value: list of booked times

  @override
  void onInit() {
    super.onInit();
    fetchBookings();
    _scheduleDailyReset();
  }

  Future<void> fetchBookings() async {
    var snapshot = await _firestore.collection('bookings').get();
    for (var doc in snapshot.docs) {
      String date = (doc['date'] as Timestamp).toDate().toIso8601String().split('T').first;
      if (!bookings.containsKey(date)) {
        bookings[date] = [];
      }
      bookings[date]?.add(doc['time']);
    }
  }

  Future<void> saveBooking() async {
    await _firestore.collection('bookings').add({
      'date': selectedDay.value,
      'time': selectedTime.value,
      'color': selectedOption.value,
      'person': selectedQuantity.value,
    });
    String date = selectedDay.value.toIso8601String().split('T').first;
    if (!bookings.containsKey(date)) {
      bookings[date] = [];
    }
    bookings[date]?.add(selectedTime.value);
    selectedTime.value = ''; // Reset selected time after booking
  }

  bool isTimeBooked(DateTime date, String time) {
    String dateStr = date.toIso8601String().split('T').first;
    return bookings[dateStr]?.contains(time) ?? false;
  }

  bool isTimePassed(DateTime date, String time) {
    final now = DateTime.now();
    if (date.isBefore(DateTime(now.year, now.month, now.day))) {
      return true;
    } else if (date.isAtSameMomentAs(DateTime(now.year, now.month, now.day))) {
      final bookingTime = DateTime(now.year, now.month, now.day, int.parse(time.split(':')[0]), int.parse(time.split(':')[1]));
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

  Future<void> SlectivBookingValidation(BookingController controller) async {
    if (controller.selectedOption.value.isEmpty || controller.selectedQuantity.value.isEmpty || controller.selectedTime.value.isEmpty) {
      Get.snackbar('Error', 'Please select all options before booking.');
    } else {
      await controller.saveBooking();
      Get.offAll(const BottomNavigationBarView());
    }
  }
}

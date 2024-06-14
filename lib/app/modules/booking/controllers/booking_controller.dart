import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookingController extends GetxController {
  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;
  var selectedOption = ''.obs;
  var selectedQuantity = ''.obs;
  var selectedTime = ''.obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var bookings = <String, List<String>>{}.obs;  // Key: date, Value: list of booked times

  @override
  void onInit() {
    super.onInit();
    fetchBookings();
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
    selectedTime.value = '';  // Reset selected time after booking
  }

  bool isTimeBooked(DateTime date, String time) {
    String dateStr = date.toIso8601String().split('T').first;
    return bookings[dateStr]?.contains(time) ?? false;
  }
}

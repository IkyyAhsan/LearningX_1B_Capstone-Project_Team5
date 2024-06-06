import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('user');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var name = ''.obs;
  var email = ''.obs;
  var phoneNumber = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        DocumentSnapshot userSnapshot =
            await _userCollection.doc(user.uid).get();
        if (userSnapshot.exists) {
          var userData = userSnapshot.data() as Map<String, dynamic>;
          name.value = userData['name'] ?? '';
          email.value = userData['email'] ?? '';
          phoneNumber.value = userData['phone_number'] ?? '';
        } else {
          print('No user data found.');
        }
      } else {
        print('No user logged in.');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
}

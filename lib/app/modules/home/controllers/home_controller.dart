import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';

class HomeController extends GetxController {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection(SlectivTexts.profileUser);
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
          name.value = userData[SlectivTexts.profileName] ?? '';
          email.value = userData[SlectivTexts.profileEmail] ?? '';
          phoneNumber.value = userData[SlectivTexts.profilePhoneNumber] ?? '';
        } else {
          print(SlectivTexts.profileNoUserDataFound);
        }
      } else {
        print(SlectivTexts.profileNoUserLoggedIn);
      }
    } catch (e) {
      print('${SlectivTexts.profileErrorFetchingUserData} $e');
    }
  }
}

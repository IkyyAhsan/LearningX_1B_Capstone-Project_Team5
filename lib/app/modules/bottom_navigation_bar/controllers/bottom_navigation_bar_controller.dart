import 'package:get/get.dart';
import 'package:slectiv_studio_app/app/modules/booking/views/booking_view.dart';
import 'package:slectiv_studio_app/app/modules/gallery/views/gallery_view.dart';
import 'package:slectiv_studio_app/app/modules/home/views/home_view.dart';
import 'package:slectiv_studio_app/app/modules/profile/views/profile_view.dart';

class BottomNavigationBarController extends GetxController {
  var selectedIndex = 0.obs;

  final screens = [const HomeView(), const BookingView(), const GalleryView(), ProfileView()];
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:slectiv_studio_app/utils/constants/text_strings.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting(SlectivTexts.profileId, null);
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAjUU6-7vmZj6Pom-JBxHeQVluJGRnDigA',
          appId: '1:765394348193:android:95cc43c5f923e3d5d2e8e0',
          messagingSenderId: '765394348193',
          projectId: 'slectiv-studio-project'));
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: SlectivTexts.mobileApplicationMainTitle,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

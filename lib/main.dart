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
  );       
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: SlectivTexts.mobileApplicationMainTitle,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
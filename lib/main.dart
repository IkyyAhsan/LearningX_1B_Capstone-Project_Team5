import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      appId: '1:297855924061:android:4a6b8a3b6b6b9f3f',
      messagingSenderId: '297855924061',
      projectId: 'slectiv-studio',
      apiKey: 'AIzaSyD-4J9Q1Q1J9Q1Q1J9Q1J9Q1J9Q1J9Q1J9',
    ),
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Slectiv Studio App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
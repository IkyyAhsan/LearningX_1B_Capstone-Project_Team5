import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
<<<<<<< HEAD
      options: const FirebaseOptions(
          apiKey: 'AIzaSyAjUU6-7vmZj6Pom-JBxHeQVluJGRnDigA',
          appId: '1:765394348193:android:95cc43c5f923e3d5d2e8e0',
          messagingSenderId: '765394348193',
          projectId: 'slectiv-studio-project',
          storageBucket: 'slectiv-studio-project.appspot.com'));

=======
    options: const FirebaseOptions(
      appId: '1:297855924061:android:4a6b8a3b6b6b9f3f',
      messagingSenderId: '297855924061',
      projectId: 'slectiv-studio',
      apiKey: 'AIzaSyD-4J9Q1Q1J9Q1Q1J9Q1J9Q1J9Q1J9Q1J9',
    ),
  );
>>>>>>> 02461b075bde7da4cb2deaa17dd382fb5e24b0fb
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Slectiv Studio App",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

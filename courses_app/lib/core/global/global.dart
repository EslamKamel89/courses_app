import 'package:courses_app/core/services/local_storage.dart';
import 'package:courses_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class GlobalServices {
  static late LocalStorage localStorage;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    localStorage = await LocalStorage().init();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}

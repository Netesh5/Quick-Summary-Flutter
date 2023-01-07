import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quicksummary/firebase_options.dart';

import 'view/myapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

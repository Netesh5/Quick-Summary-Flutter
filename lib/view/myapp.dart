import 'package:flutter/material.dart';
import 'package:quicksummary/resources/theme_manager.dart';
import 'package:quicksummary/view/login/login_page.dart';

import 'homepage/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationThemeData(),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

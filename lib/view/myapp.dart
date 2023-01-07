import 'package:flutter/material.dart';
import 'package:quicksummary/view/login/login_page.dart';

import 'homepage/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

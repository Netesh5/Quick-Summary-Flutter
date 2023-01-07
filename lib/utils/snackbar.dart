import 'package:flutter/material.dart';
import 'package:quicksummary/resources/color_manager.dart';

snackBar(String message, BuildContext context) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: ColorManager.error,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

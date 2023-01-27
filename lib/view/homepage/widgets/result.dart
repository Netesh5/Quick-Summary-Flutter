import 'package:flutter/material.dart';
import 'package:quicksummary/resources/string_manager.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringManager.summarizedText),
      ),
    );
  }
}

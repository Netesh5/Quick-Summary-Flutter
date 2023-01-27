import 'package:flutter/material.dart';
import 'package:quicksummary/resources/string_manager.dart';

import '../../../resources/color_manager.dart';

class ResultScreen extends StatelessWidget {
  String? result;
  ResultScreen({this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringManager.summarizedText),
      ),
      body: InputField(result),
    );
  }
}

Widget InputField(String? result) {
  TextEditingController controller = TextEditingController(text: result);
  return TextFormField(
    //textAlign: TextAlign.justify,
    controller: controller,
    cursorColor: ColorManager.lightGreen,
    textInputAction: TextInputAction.done,
    minLines: 5,
    maxLines: 20,
    decoration: const InputDecoration(
      // counterText: controller.text.length.toString(),
      label: Text(StringManager.labelText),
    ),
  );
}

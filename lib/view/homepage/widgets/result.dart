import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicksummary/data/network/network_service.dart';
import 'package:quicksummary/resources/font_manager.dart';
import 'package:quicksummary/resources/string_manager.dart';
import 'package:quicksummary/resources/textstyle_manager.dart';
import 'package:quicksummary/utils/switch_button.dart';

import '../../../resources/color_manager.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringManager.summarizedText,
          style: getRegularTextStyle(
              fontSize: FontSizeManager.f18,
              color: ColorManager.darkFontcolor,
              fontWeight: FontWeightManager.bold),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Spacer(),
              const Text(StringManager.showPoints),
              switchBtn()
            ],
          ),
          InputField(context), //field
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget InputField(BuildContext context) {
  final btn = Provider.of<SwitchBtn>(context).ispointon;
  String summary = NetworkService.result!["summary"];
  List sentences = NetworkService.result!["sentences"];

  getPoints() {
    return List.generate(
        sentences.length, (index) => sentences[index] + "\n\n");
  }

  TextEditingController controller =
      TextEditingController(text: btn ? getPoints().toString() : summary);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      //textAlign: TextAlign.justify,
      controller: controller,
      cursorColor: ColorManager.lightGreen,
      textInputAction: TextInputAction.newline,
      minLines: 5,
      maxLines: 20,
      decoration: const InputDecoration(
        // counterText: controller.text.length.toString(),
        label: Text(StringManager.labelText),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:quicksummary/data/network/network_service.dart';
import 'package:quicksummary/resources/font_manager.dart';
import 'package:quicksummary/resources/string_manager.dart';
import 'package:quicksummary/resources/textstyle_manager.dart';
import 'package:quicksummary/utils/switch_button.dart';

import '../../../resources/color_manager.dart';

class ResultScreen extends StatelessWidget {
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
          InputField(), //field
        ],
      ),
    );
  }
}

Widget InputField() {
  SwitchBtn btn = SwitchBtn();
  String summary = NetworkService.result!["summary"];
  List sentences = NetworkService.result!["sentences"];
  TextEditingController controller =
      TextEditingController(text: btn.ispointon ? sentences[0] : summary);
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
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
    ),
  );
}

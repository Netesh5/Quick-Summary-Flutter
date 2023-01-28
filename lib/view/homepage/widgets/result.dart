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
              Spacer(),
              const Text(StringManager.showPoints),
              switchBtn()
            ],
          ),
          InputField(),
        ],
      ),
    );
  }
}

Widget InputField() {
  TextEditingController controller = TextEditingController(
      text: SwitchBtn().ispointon
          ? NetworkService.result!["sentences"]
          : NetworkService.result?["summary"]);
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

import 'package:flutter/material.dart';

import '../../../resources/color_manager.dart';
import '../../../resources/string_manager.dart';

class Textformfield with ChangeNotifier {
  int count = 0;
  TextFormField InputField() {
    TextEditingController controller = TextEditingController();
    return TextFormField(
      //textAlign: TextAlign.justify,
      controller: controller,
      cursorColor: ColorManager.lightGreen,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        counterText: count.toString(),
        label: const Text(StringManager.labelText),
      ),
      minLines: 5,
      maxLines: 20,
      onChanged: (value) {
        Inputvalue.value = controller.text;
        count = Inputvalue.value.length;
        notifyListeners();
      },
    );
  }
}

class Inputvalue {
  static String value = "";
}

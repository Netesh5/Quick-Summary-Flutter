import 'package:flutter/material.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/string_manager.dart';

class Textformfield with ChangeNotifier {
  static final formkey = GlobalKey<FormState>();
  static final formkey2 = GlobalKey<FormState>();
  static final formkey3 = GlobalKey<FormState>();
  int count = 0;
  Widget InputField() {
    return Form(
      key: formkey,
      child: TextFormField(
          cursorColor: ColorManager.lightGreen,
          textInputAction: TextInputAction.newline,
          minLines: 5,
          maxLines: 20,
          onChanged: (value) {
            Inputvalue.value = value;
            notifyListeners();
            // count = value.length;
          },
          decoration: const InputDecoration(
            // counterText: controller.text.length.toString(),
            label: Text(StringManager.labelText),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Field cannot be empty";
            } else {
              return null;
            }
          }),
    );
  }

  Widget minLength(BuildContext context) {
    TextEditingController controller = TextEditingController(text: "50");
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      child: Form(
        key: formkey2,
        child: TextFormField(
            controller: controller,
            cursorColor: ColorManager.lightGreen,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text(StringManager.summaryPercentage),
            ),
            onChanged: (value) {
              controller.addListener(() {
                Inputvalue.percentage = controller.text;
              });
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Field cannot be empty";
              } else {
                return null;
              }
            }),
      ),
    );
  }
}

class Inputvalue {
  static String value = "";
  static String? percentage;
  static String maxLength = "";
}

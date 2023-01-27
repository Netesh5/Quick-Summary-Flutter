import 'package:flutter/material.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/string_manager.dart';

class Textformfield with ChangeNotifier {
  static final formkey = GlobalKey<FormState>();
  static final formkey2 = GlobalKey<FormState>();
  static final formkey3 = GlobalKey<FormState>();
  int count = 0;
  Widget InputField() {
    TextEditingController controller = TextEditingController();
    return Form(
      key: formkey,
      child: TextFormField(
          //textAlign: TextAlign.justify,
          controller: controller,
          cursorColor: ColorManager.lightGreen,
          textInputAction: TextInputAction.done,
          minLines: 5,
          maxLines: 20,
          onChanged: (value) {
            Inputvalue.value = controller.text;
            count = value.length;
            notifyListeners();
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
    TextEditingController controller = TextEditingController();
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Form(
        key: formkey2,
        child: TextFormField(
            controller: controller,
            cursorColor: ColorManager.lightGreen,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              label: Text(StringManager.minLength),
            ),
            onChanged: (value) {
              Inputvalue.minLength = controller.text;
              notifyListeners();
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

  Widget maxLength(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Form(
        key: formkey3,
        child: TextFormField(
          controller: controller,
          cursorColor: ColorManager.lightGreen,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
            label: Text(StringManager.maxLength),
          ),
          onChanged: (value) {
            Inputvalue.maxLength = controller.text;
            notifyListeners();
          },
          validator: (value) {
            if (value!.isEmpty) {
              return "Field cannot be empty";
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}

class Inputvalue {
  static String value = "";
  static String? minLength = "";
  static String maxLength = "";
}

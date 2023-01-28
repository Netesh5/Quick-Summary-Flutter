import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicksummary/resources/color_manager.dart';

class SwitchBtn with ChangeNotifier {
  bool ispointon = false;
  void toogleSwitch(bool value) {
    if (ispointon == false) {
      ispointon = true;
      notifyListeners();
    } else {
      ispointon = false;
      notifyListeners();
    }
  }
}

Widget switchBtn() {
  return Consumer<SwitchBtn>(
    builder: (context, value, child) => Switch.adaptive(
      value: value.ispointon,
      onChanged: value.toogleSwitch,
      activeColor: ColorManager.lightGreen,
    ),
  );
}

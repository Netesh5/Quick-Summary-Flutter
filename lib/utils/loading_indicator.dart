import 'package:flutter/material.dart';
import 'package:quicksummary/resources/color_manager.dart';

class LoadingIndicator with ChangeNotifier {
  bool isLoading = false;
  Widget loading() {
    return CircularProgressIndicator.adaptive(
      backgroundColor: ColorManager.white,
    );
  }

  summarizeloading() {
    isLoading = true;
    notifyListeners();
  }

  summarizenotloading() {
    isLoading = false;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:quicksummary/resources/font_manager.dart';

import 'color_manager.dart';
import 'textStyle_manager.dart';

ThemeData getApplicationThemeData() {
  return ThemeData(
    splashColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        color: ColorManager.lightGreen,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: getRegularTextStyle(
            color: ColorManager.white, fontSize: FontSizeManager.f18)),
  );
}

import 'package:flutter/material.dart';
import 'package:quicksummary/resources/font_manager.dart';

import 'color_manager.dart';
import 'textStyle_manager.dart';
import 'value_manger.dart';

ThemeData getApplicationThemeData() {
  return ThemeData(
      splashColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          color: ColorManager.lightBGWhiteColor,
          centerTitle: true,
          iconTheme: IconThemeData(color: ColorManager.darkBgPrimary),
          elevation: 0,
          titleTextStyle: getRegularTextStyle(
              color: ColorManager.darkBgPrimary,
              fontSize: FontSizeManager.f18)),
      iconTheme: IconThemeData(color: ColorManager.primaryFontcolor),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorManager.white,
          contentPadding: const EdgeInsets.all(PaddingManager.p8),
          hintStyle: getRegularTextStyle(
              color: ColorManager.grey1, fontSize: FontSizeManager.f8),
          labelStyle: getRegularTextStyle(
              color: ColorManager.grey1, fontSize: FontSizeManager.f14),
          errorStyle: getRegularTextStyle(
              color: ColorManager.error, fontSize: FontSizeManager.f8),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.ap8),
            borderSide:
                BorderSide(color: ColorManager.grey1, width: AppSize.ap1_5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.ap8),
            borderSide: BorderSide(
                color: ColorManager.lightGreen, width: AppSize.ap1_5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.ap8),
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.ap1_5),
          )));
}

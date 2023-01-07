import 'package:flutter/material.dart';

TextStyle _textStyle(double fontSize, Color color, fontWeight) {
  return TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight);
}

TextStyle getRegularTextStyle(
    {required fontSize, required Color color, fontWeight}) {
  return _textStyle(fontSize, color, fontWeight);
}

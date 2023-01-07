import 'package:flutter/material.dart';

TextStyle _textStyle(double fontSize, Color color) {
  return TextStyle(fontSize: fontSize, color: color);
}

TextStyle getRegularTextStyle({required fontSize, required Color color}) {
  return _textStyle(fontSize, color);
}

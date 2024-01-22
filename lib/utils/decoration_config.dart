import 'package:flutter/material.dart';

const primaryColor = Color(0xFF1C1A29);
const secondaryColor = Color(0xFF6C61AF);

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: primaryColor,
    brightness: Brightness.light,
    colorSchemeSeed: primaryColor,
    fontFamily: "Poppins",
  );
}

import 'package:flutter/material.dart';

const primaryColor = Color(0xFF1C1A29);
const primaryAccent = Color(0xFF2F2C44);
const secondaryColor = Color(0xFF6C61AF);

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: primaryColor,
    brightness: Brightness.light,
    colorSchemeSeed: primaryColor,
    fontFamily: "Poppins",
    inputDecorationTheme: inputDecorationTheme(),
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    filled: true,
    fillColor: primaryAccent,
    hintStyle: TextStyle(color: Colors.grey[700]),
    counterStyle: const TextStyle(color: Colors.white),
    prefixIconColor: Colors.grey[700],
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

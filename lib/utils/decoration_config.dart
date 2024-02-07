import 'package:flutter/material.dart';
import 'package:flutter_bioskop/utils/color_dir.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorDir.primaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorDir.primaryColor,
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: ColorDir.primaryColor),
    useMaterial3: true,
    fontFamily: "Poppins",
  );
}

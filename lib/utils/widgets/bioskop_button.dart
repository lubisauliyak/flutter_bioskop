import 'package:flutter/material.dart';
import 'package:flutter_bioskop/utils/color_dir.dart';

class BioskopButton {
  Widget buttonAuth({required String text, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(colors: [
              ColorDir.secondaryColor,
              ColorDir.secondaryAccent,
            ])),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: ColorDir.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget buttonPrimary({
    required String text,
    required Function() onTap,
    IconData? icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(colors: [
              ColorDir.secondaryColor,
              ColorDir.secondaryAccent,
            ])),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Row(
                  children: [
                    Icon(icon, color: ColorDir.whiteColor),
                    const SizedBox(width: 5),
                  ],
                ),
              Text(
                text,
                style: const TextStyle(
                  color: ColorDir.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

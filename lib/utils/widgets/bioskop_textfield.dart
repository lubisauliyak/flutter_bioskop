import 'package:flutter/material.dart';
import 'package:flutter_bioskop/utils/color_dir.dart';

class BioskopTextField {
  Widget textFieldAuth({
    required String hintText,
    required String varText,
    required IconData icon,
    required TextEditingController controller,
    required TextInputType type,
    required void Function(String) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: ColorDir.primaryAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: ColorDir.whiteColor),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: ColorDir.whiteAccent2,
            fontSize: 14,
          ),
          prefixIcon: Icon(
            icon,
            color: varText.isNotEmpty
                ? ColorDir.whiteColor
                : ColorDir.whiteAccent2,
          ),
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget textFieldPassword({
    required String hintText,
    required String varText,
    required IconData icon,
    required TextEditingController controller,
    required void Function(String) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: ColorDir.primaryAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        style: const TextStyle(color: ColorDir.whiteColor),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: ColorDir.whiteAccent2,
            fontSize: 14,
          ),
          prefixIcon: Icon(
            icon,
            color: varText.isNotEmpty
                ? ColorDir.whiteColor
                : ColorDir.whiteAccent2,
          ),
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }

  Widget textFieldPrimary({
    required String hintText,
    required String varText,
    required IconData icon,
    required TextEditingController controller,
    required TextInputType type,
    required void Function(String) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF2F2C44),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: ColorDir.whiteColor),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: ColorDir.whiteAccent2,
            fontWeight: FontWeight.bold,
          ),
          prefixIcon: Icon(
            icon,
            color: varText.isNotEmpty
                ? ColorDir.whiteColor
                : ColorDir.whiteAccent2,
          ),
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}

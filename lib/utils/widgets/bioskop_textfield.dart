import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BioskopTextField {
  static Widget textField(String hinText, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: const Color(0xFF2F2C44),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        onChanged: (String value) {},
        decoration: InputDecoration(
          hintText: hinText,
          hintStyle: GoogleFonts.openSans(
            color: Colors.white.withOpacity(0.2),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(0.2),
          ),
          disabledBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}

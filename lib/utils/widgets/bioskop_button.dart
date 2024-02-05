import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BioskopButton {
  Widget primaryButton({required String text, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 55,
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(colors: [
              Color(0xFF6C61AF),
              Color(0xFF867AD2),
            ])),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

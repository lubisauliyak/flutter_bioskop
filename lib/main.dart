import 'package:flutter/material.dart';
import 'package:flutter_bioskop/screens/splash_screen.dart';
import 'package:flutter_bioskop/utils/decoration_config.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const SplashScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bioskop/core/navigation/bioskop_navigation.dart';
import 'package:flutter_bioskop/screens/auth/login_screen.dart';
import 'package:flutter_bioskop/utils/image_dir.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      BioskopNavigation().pushReplacementNamed(LoginScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Expanded(
        child: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageDir.splashImage),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Image.asset(ImageDir.logoApp),
              ],
            )),
      )),
    );
  }
}

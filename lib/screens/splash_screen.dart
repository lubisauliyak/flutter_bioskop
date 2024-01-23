import 'package:flutter/material.dart';
import 'package:flutter_bioskop/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()));
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
                    image: AssetImage('assets/images/splash_image.png'),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Image.asset('assets/images/nonton_id.png'),
              ],
            )),
      )),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bioskop/core/navigation/bioskop_navigation.dart';
import 'package:flutter_bioskop/screens/auth/register_screen.dart';
import 'package:flutter_bioskop/screens/menu/home_screen.dart';
import 'package:flutter_bioskop/utils/color_dir.dart';
import 'package:flutter_bioskop/utils/image_dir.dart';
import 'package:flutter_bioskop/utils/widgets/bioskop_button.dart';
import 'package:flutter_bioskop/utils/widgets/bioskop_textfield.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void dispose() {
    _controllerUsername.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(height: 100),
              Image.asset(ImageDir.logoApp),
              const SizedBox(height: 80),
              const Text(
                'Masuk',
                style: TextStyle(
                  color: ColorDir.whiteColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              BioskopTextField().textFieldAuth(
                  hintText: 'username',
                  varText: username,
                  icon: CupertinoIcons.person,
                  controller: _controllerUsername,
                  type: TextInputType.text,
                  onChanged: (String value) {
                    setState(() {
                      username = value;
                    });
                  }),
              const SizedBox(height: 5),
              BioskopTextField().textFieldPassword(
                  hintText: 'kata sandi',
                  varText: password,
                  icon: CupertinoIcons.lock,
                  controller: _controllerPassword,
                  onChanged: (String value) {
                    setState(() {
                      password = value;
                    });
                  }),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Text(
                      'Belum punya akun? ',
                      style: TextStyle(color: ColorDir.whiteAccent2),
                    ),
                    GestureDetector(
                      onTap: () {
                        BioskopNavigation().pushNamed(RegisterScreen.routeName);
                      },
                      child: const Text('Daftar disini',
                          style: TextStyle(
                            color: ColorDir.whiteColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(bottom: 20),
          child: BioskopButton()
              .buttonAuth(text: 'Masuk', onTap: _onTapButtonLogin)),
    );
  }

  void _onTapButtonLogin() {
    BioskopNavigation().pushReplacementNamed(MainScreen.routeName);
  }
}

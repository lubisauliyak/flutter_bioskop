import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bioskop/core/navigation/bioskop_navigation.dart';
import 'package:flutter_bioskop/utils/color_dir.dart';
import 'package:flutter_bioskop/utils/image_dir.dart';
import 'package:flutter_bioskop/utils/widgets/bioskop_button.dart';
import 'package:flutter_bioskop/utils/widgets/bioskop_textfield.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register-screen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<RegisterScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerRePassword = TextEditingController();

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerUsername.dispose();
    _controllerPassword.dispose();
    _controllerRePassword.dispose();
    super.dispose();
  }

  String email = '';
  String username = '';
  String password = '';
  String rePassword = '';

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
              const Text('Daftar',
                  style: TextStyle(
                    color: ColorDir.whiteColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(height: 20),
              BioskopTextField().textFieldAuth(
                  hintText: 'alamat email',
                  varText: email,
                  icon: CupertinoIcons.mail,
                  controller: _controllerEmail,
                  type: TextInputType.emailAddress,
                  onChanged: (String value) {
                    setState(() {
                      email = value;
                    });
                  }),
              const SizedBox(height: 5),
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
              const SizedBox(height: 5),
              BioskopTextField().textFieldPassword(
                  hintText: 'ulangi kata sandi',
                  varText: rePassword,
                  icon: CupertinoIcons.lock,
                  controller: _controllerRePassword,
                  onChanged: (String value) {
                    setState(() {
                      rePassword = value;
                    });
                  }),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Text(
                      'Sudah punya akun? ',
                      style: TextStyle(color: ColorDir.whiteAccent2),
                    ),
                    GestureDetector(
                      onTap: () {
                        BioskopNavigation().pop();
                      },
                      child: const Text(
                        'Masuk disini',
                        style: TextStyle(
                          color: ColorDir.whiteColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(bottom: 20),
          child: BioskopButton()
              .buttonAuth(text: 'Daftar', onTap: _onTapButtonRegister)),
    );
  }

  void _onTapButtonRegister() {
    BioskopNavigation().pop();
  }
}

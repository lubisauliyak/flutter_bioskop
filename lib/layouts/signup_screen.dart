import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bioskop/layouts/login_screen.dart';
import 'package:flutter_bioskop/utils/decoration_config.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
              Image.asset('assets/images/nonton_id.png'),
              const SizedBox(height: 80),
              const Text(
                'Daftar',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'alamat email',
                      prefixIcon: Icon(
                        CupertinoIcons.mail,
                        color:
                            email.isNotEmpty ? Colors.white : Colors.grey[700],
                      ),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        email = value;
                      });
                    },
                  )),
              const SizedBox(height: 5),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    controller: _controllerUsername,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'username',
                      prefixIcon: Icon(
                        CupertinoIcons.person,
                        color: username.isNotEmpty
                            ? Colors.white
                            : Colors.grey[700],
                      ),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        username = value;
                      });
                    },
                  )),
              const SizedBox(height: 5),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    controller: _controllerPassword,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'kata sandi',
                      prefixIcon: Icon(
                        CupertinoIcons.lock,
                        color: password.isNotEmpty
                            ? Colors.white
                            : Colors.grey[700],
                      ),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        password = value;
                      });
                    },
                  )),
              const SizedBox(height: 5),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    controller: _controllerRePassword,
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'ulangi kata sandi',
                      prefixIcon: Icon(
                        CupertinoIcons.lock,
                        color: (rePassword.isNotEmpty && password == rePassword)
                            ? Colors.white
                            : Colors.grey[700],
                      ),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        rePassword = value;
                      });
                    },
                  )),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(left: 40),
                child: Row(
                  children: [
                    Text(
                      'Sudah Punya Akun? ',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        'Masuk',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(bottom: 20),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: secondaryColor,
          ),
          child: const Text(
            'Daftar',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

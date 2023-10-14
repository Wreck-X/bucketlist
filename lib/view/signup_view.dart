import 'package:bucketlist/view/login_view.dart';
import 'package:flutter/material.dart';
import '../resources/animation.dart';
import '../resources/buttons.dart';
import '../resources/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ColorsClass.black,
        child: Stack(
          children: [
            Positioned(
              top: 80,
              left: 40,
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 2,
                ),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: ColorsClass.grey,
                  width: 2,
                ))),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(FadeRoute(page: const LoginScreen()));
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      color: ColorsClass.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 110,
              child: Container(
                padding: const EdgeInsets.only(
                  bottom: 2,
                ),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: ColorsClass.grey,
                  width: 2,
                ))),
                child: const Text(
                  "SIGNUP",
                  style: TextStyle(
                    color: ColorsClass.lightGrey,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 214,
              left: 41,
              child: Text(
                'Welcome',
                style: TextStyle(
                    color: ColorsClass.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 359,
              left: 41,
              child: Container(
                width: 300,
                height: 50,
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorsClass.violet),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorsClass.violet,
                      ),
                    ),
                    border: InputBorder.none,
                    floatingLabelStyle: TextStyle(color: ColorsClass.violet),
                    hintText: 'Email ID',
                    hintStyle: TextStyle(
                      color: ColorsClass.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 446,
              left: 41,
              child: Container(
                width: 300,
                height: 50,
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: TextField(
                  controller: _userNameController,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorsClass.violet),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorsClass.violet,
                      ),
                    ),
                    border: InputBorder.none,
                    floatingLabelStyle: TextStyle(color: ColorsClass.violet),
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      color: ColorsClass.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 533,
              left: 41,
              child: Container(
                width: 300,
                height: 50,
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorsClass.violet),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorsClass.violet,
                      ),
                    ),
                    border: InputBorder.none,
                    floatingLabelStyle: TextStyle(color: ColorsClass.violet),
                    hintText: 'Password',
                    hintStyle: TextStyle(
                      color: ColorsClass.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 618,
              left: 41,
              child: Container(
                width: 300,
                height: 50,
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: TextField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ColorsClass.violet),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorsClass.violet,
                      ),
                    ),
                    border: InputBorder.none,
                    floatingLabelStyle: TextStyle(color: ColorsClass.violet),
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(
                      color: ColorsClass.grey,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 708,
              left: 97,
              child: CustomButton(
                text: 'Login',
                color: ColorsClass.violet,
                function: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

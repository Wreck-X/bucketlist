import 'package:bucketlist/resources/buttons.dart';
import 'package:flutter/material.dart';

import '../resources/colors.dart';
import '../utils/Routes/route_names.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                child: const Text(
                  "LOGIN",
                  style: TextStyle(
                    color: ColorsClass.lightGrey,
                    fontSize: 15,
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
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.signup);
                  },
                  child: const Text(
                    "SIGNUP",
                    style: TextStyle(
                      color: ColorsClass.grey,
                      fontSize: 15,
                    ),
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
              top: 446,
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
              top: 520,
              left: 218,
              child: InkWell(
                onTap: () {},
                child: const Text("Forgot Password?",
                    style: TextStyle(
                      color: ColorsClass.white,
                      fontSize: 15,
                    )),
              ),
            ),
            Positioned(
              top: 623,
              left: 97,
              child: CustomButton(
                text: 'Login',
                color: ColorsClass.violet,
                function: () {},
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: ColorsClass.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

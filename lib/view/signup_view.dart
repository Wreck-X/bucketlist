import 'package:bucketlist/view/login_view.dart';
import 'package:flutter/material.dart';
import '../resources/animation.dart';
import '../utils/widgets/buttons.dart';
import '../resources/colors.dart';
import '../utils/utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscureText = true;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  FocusNode usernameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();
  FocusNode emailFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          color: ColorsClass.black,
          child: Stack(
            children: [
              Positioned(
                top: 80,
                left: 40,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacement(FadeRoute(page: const LoginScreen()));
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
                    color: ColorsClass.lightGrey,
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
                  child: TextFormField(
                    style: const TextStyle(color: ColorsClass.white),
                    focusNode: emailFocus,
                    controller: _emailController,
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context, emailFocus, usernameFocus);
                    },
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
                  child: TextFormField(
                    controller: _userNameController,
                    style: const TextStyle(color: ColorsClass.white),
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context, usernameFocus, passwordFocus);
                    },
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
                  child: TextFormField(
                    style: const TextStyle(color: ColorsClass.white),
                    controller: _passwordController,
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context, passwordFocus, confirmPasswordFocus);
                    },
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorsClass.violet),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsClass.violet,
                        ),
                      ),
                      border: InputBorder.none,
                      floatingLabelStyle:
                          const TextStyle(color: ColorsClass.violet),
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                        color: ColorsClass.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
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
                  child: TextFormField(
                    style: const TextStyle(color: ColorsClass.white),
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorsClass.violet),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsClass.violet,
                        ),
                      ),
                      border: InputBorder.none,
                      floatingLabelStyle:
                          const TextStyle(color: ColorsClass.violet),
                      hintText: 'Confirm Password',
                      hintStyle: const TextStyle(
                        color: ColorsClass.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 708,
                left: 97,
                child: CustomButton(
                  text: 'Signup',
                  color: ColorsClass.violet,
                  function: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

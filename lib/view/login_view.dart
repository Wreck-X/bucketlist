import 'package:bucketlist/utils/widgets/buttons.dart';
import 'package:flutter/material.dart';
import '../resources/animation.dart';
import '../resources/colors.dart';
import '../utils/Routes/route_names.dart';
import '../utils/utils.dart';
import '../view_model/login_view_model.dart';
import 'signup_view.dart';
import '../utils/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode usernameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    super.dispose();

    _userNameController.dispose();
    _passwordController.dispose();

    usernameFocus.dispose();
    passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    api.refresh_cookies(); // refresh cookies

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          color: ColorsClass.black,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      height: 80,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 41,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: ColorsClass.lightGrey,
                            width: 2,
                          ))),
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              color: ColorsClass.lightGrey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 17,
                        ),
                        Container(
                            padding: const EdgeInsets.only(
                              bottom: 10,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .push(FadeRoute(page: const SignupScreen()));
                              },
                              child: const Text(
                                "SIGNUP",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                ),
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(
                      width: double.infinity,
                      height: 100,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 41),
                      child: Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: double.infinity,
                      height: 85,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 41),
                      child: Container(
                        width: 300,
                        height: 50,
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: TextFormField(
                          style: const TextStyle(color: ColorsClass.white),
                          controller: _userNameController,
                          focusNode: usernameFocus,
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
                            floatingLabelStyle:
                                TextStyle(color: ColorsClass.violet),
                            hintText: 'Email',
                            hintStyle: TextStyle(
                              color: ColorsClass.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: double.infinity,
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 41),
                      child: Container(
                        width: 300,
                        height: 50,
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: TextFormField(
                          style: const TextStyle(color: ColorsClass.white),
                          controller: _passwordController,
                          focusNode: passwordFocus,
                          obscureText: _obscureText,
                          obscuringCharacter: '*',
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
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: double.infinity,
                      height: 37,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 224),
                      child: InkWell(
                        onTap: () {},
                        child: const Text("Forgot Password?",
                            style: TextStyle(
                              color: ColorsClass.white,
                              fontSize: 15,
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: double.infinity,
                      height: 85,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 97, bottom: 100),
                      child: CustomButton(
                          color: ColorsClass.violet,
                          text: 'Login',
                          function: () async {
                            try {
                              var success = await login(_userNameController.text,
                                  _passwordController.text);
                              org_repo.fetchData();
                              if (success) {
                                Navigator.of(context)
                                    .pushNamed(RouteNames.organizations);
                              } else {
                                print("failed to login");
                              }
                            } catch (e) {
                              throw Exception(e);
                            }
                          }),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

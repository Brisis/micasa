import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micasa/bloc/app_bloc.dart';
import 'package:micasa/extensions/if_debugging.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/helpers/widgets/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controllers
  final _emailController = TextEditingController(
    text: "ben${Random().nextInt(10)}@gmail.com".ifDebugging,
  );
  final _passwordController = TextEditingController(
    text: "football".ifDebugging,
  );

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset("assets/images/logo.png"),
                )
              ],
            ),
          ),
          verticalSpace(height: 15),
          LoginFormSection(
            emailController: _emailController,
            passwordController: _passwordController,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final email = _emailController.text;
                      final password = _passwordController.text;

                      context.read<AppBloc>().add(
                            AppEventLogIn(
                              email: email,
                              password: password,
                            ),
                          );
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(10.0),
                      ),
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(),
          TextButton(
            onPressed: () {
              context.read<AppBloc>().add(
                    const AppEventGoToRegistration(),
                  );
            },
            child: const Text(
              "Don't have an account, register instead.",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: kMediumTextSize,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginFormSection extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginFormSection({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Welcome Back!",
            style: TextStyle(
              color: kBlackColor,
              fontSize: kSubHeaderTextSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(),
          CustomTextField(
            controller: emailController,
            hintText: 'Email Address',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: passwordController,
            hintText: 'Password (atleast 6 characters)',
            isObsecure: true,
          ),
        ],
      ),
    );
  }
}

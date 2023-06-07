import 'package:flutter/material.dart';
import 'package:micasa/app_view.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/helpers/widgets/custom_text.dart';
import 'package:micasa/helpers/widgets/text_field.dart';
import 'package:micasa/pages/auth/login_page.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          const RegistrationTopSection(),
          verticalSpace(height: 15),
          const EditFormSection(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        routeTransition(
                          const AppView(),
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
                      "Register",
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
              Navigator.of(context).push(
                routeTransition(
                  const LoginPage(),
                ),
              );
            },
            child: const Text(
              "Already registered, login.",
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

class RegistrationTopSection extends StatelessWidget {
  const RegistrationTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryColor,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomText(
            shadows: [
              Shadow(
                blurRadius: 40,
                color: Colors.blue,
              ),
            ],
            text: 'Micasa',
            fontSize: 70,
          ),
        ],
      ),
    );
  }
}

class EditFormSection extends StatefulWidget {
  const EditFormSection({super.key});

  @override
  State<EditFormSection> createState() => _EditFormSectionState();
}

class _EditFormSectionState extends State<EditFormSection> {
  //text controllers
  final _nameController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailAddressController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Register Account",
            style: TextStyle(
              color: kBlackColor,
              fontSize: kSubHeaderTextSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(),
          CustomTextField(
            controller: _nameController,
            hintText: 'Full Name',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: _emailAddressController,
            hintText: 'Email Address',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: _passwordController,
            hintText: 'Password (atleast 6 characters)',
            isObsecure: true,
          ),
        ],
      ),
    );
  }
}

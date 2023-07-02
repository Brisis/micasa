import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';

class LoadingAppPage extends StatelessWidget {
  const LoadingAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Image.asset("assets/images/logo-alt.png"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

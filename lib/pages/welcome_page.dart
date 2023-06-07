import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:micasa/pages/auth/registration_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        children: [
          Expanded(
            child: ClipPath(
              clipper: DiagonalPathClipperOne(),
              child: Container(
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  image: DecorationImage(
                    image: AssetImage("assets/images/h1.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Perfect choice for your future",
                    style: TextStyle(
                      color: kBlackColor,
                      fontSize: kHeaderTextSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Our properties are masterpieces for all our clients with lasting value!",
                    style: TextStyle(
                      color: kBlackColor,
                      fontSize: kBigTextSize,
                    ),
                  ),
                  const Text(
                    " - Made with love from Micasa Family.",
                    style: TextStyle(
                      color: kBlackFaded,
                      fontSize: kMediumTextSize,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              routeTransition(
                                const RegistrationPage(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.all(10.0),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(kPrimaryColor),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Get Started",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

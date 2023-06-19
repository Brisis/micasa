import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';
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
              clipper: CustomClipPath(),
              child: Container(
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  image: DecorationImage(
                    image: AssetImage("assets/images/welcome1.jpg"),
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
                    "A Perfect choice for your housing",
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
                    " - Made with love from the Micasa Family",
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

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

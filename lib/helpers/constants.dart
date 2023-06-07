import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

// const kPrimaryColor = Color(0xFFD61EDA);
const kPrimaryColor = Color(0xFF573BE9);
const kSecondaryColor = Color(0xFF0C0B0E);
const kBackgroundColor = Color(0xFFF1F2F6);
const kBackgroundColorFaded = Color.fromARGB(255, 221, 222, 227);
const kBlackColor = Colors.black;
const kRedColor = Colors.red;
const kWhiteColor = Colors.white;
const kGreyColor = Colors.black45;
const kBlackFaded = Colors.black54;

const kIconGreyColor = Color(0xFF5E5F6E);
const kChipColor = Color(0xFF323335);
const kWarningColor = Color(0xFFEA266D);
const kSuccessColor = Color(0xFF128557);

const kHeaderTextSize = 38.0;
const kHeaderSubTextSize = 34.0;
const kSubHeaderTextSize = 28.0;
const kMidHeaderTextSize = 20.0;
const kBigTextSize = 18.0;
const kMediumTextSize = 15.0;
const kNormalTextSize = 13.0;
const kSmallerTextSize = 12.0;

const kIconSize = 25.0;
const kIconLargeSize = 30.0;

SizedBox verticalSpace({double height = 8.0}) {
  return SizedBox(height: height);
}

SizedBox horizontalSpace({double width = 8.0}) {
  return SizedBox(width: width);
}

PageTransition routeTransition(Widget screen) {
  return PageTransition(
    child: screen,
    type: PageTransitionType.fade,
    duration: const Duration(),
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/pages/extras/contact_page.dart';
import 'package:micasa/pages/extras/tcs_page.dart';
import 'package:micasa/pages/profile/billing_information_page.dart';
import 'package:micasa/pages/profile/edit_profile_page.dart';
import 'package:micasa/pages/profile/favourites_page.dart';
import 'package:micasa/pages/profile/lease_page.dart';
import 'package:micasa/pages/profile/rentals_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          const ProfileTopSection(),
          verticalSpace(height: 15),
          const ProfileMenusSection(),
        ],
      ),
    );
  }
}

class ProfileTopSection extends StatelessWidget {
  const ProfileTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Profile",
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: kSubHeaderTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: kChipColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.logout_outlined,
                    color: kWarningColor,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            color: kChipColor,
            thickness: 1,
          ),
          verticalSpace(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "Benevolent Mudzinganyama",
              style: TextStyle(
                color: kWhiteColor,
                fontSize: kBigTextSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          verticalSpace(height: 30),
        ],
      ),
    );
  }
}

class ProfileMenusSection extends StatelessWidget {
  const ProfileMenusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileMenuItem(
            title: "Edit Profile",
            icon: Icons.edit,
            onTap: () {
              Navigator.of(context)
                  .push(routeTransition(const EditProfilePage()));
            },
          ),
          verticalSpace(height: 15),
          ProfileMenuItem(
            title: "Billing Information",
            icon: Icons.payment,
            onTap: () {
              Navigator.of(context)
                  .push(routeTransition(const BillingInformationPage()));
            },
          ),
          verticalSpace(height: 15),
          ProfileMenuItem(
            title: "My Favourites",
            icon: CupertinoIcons.heart_circle,
            onTap: () {
              Navigator.of(context)
                  .push(routeTransition(const FavouritesPage()));
            },
          ),
          verticalSpace(height: 15),
          ProfileMenuItem(
            title: "Rentals",
            icon: Icons.other_houses_outlined,
            onTap: () {
              Navigator.of(context).push(routeTransition(const RentalsPage()));
            },
          ),
          verticalSpace(height: 15),
          ProfileMenuItem(
            title: "Lease Agreement",
            icon: Icons.verified_user_outlined,
            onTap: () {
              Navigator.of(context).push(routeTransition(const LeasePage()));
            },
          ),
          verticalSpace(height: 15),
          ProfileMenuItem(
            title: "Privacy, Terms and Conditions",
            icon: Icons.privacy_tip_outlined,
            onTap: () {
              Navigator.of(context)
                  .push(routeTransition(const PrivacyTermsAndConditionsPage()));
            },
          ),
          verticalSpace(height: 15),
          ProfileMenuItem(
            title: "Contact Us",
            icon: Icons.phone,
            onTap: () {
              Navigator.of(context).push(routeTransition(const ContactPage()));
            },
          ),
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: kBlackColor,
                fontSize: kMediumTextSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            horizontalSpace(),
            Icon(
              icon,
              color: kBlackFaded,
              size: kIconSize,
            ),
          ],
        ),
      ),
    );
  }
}

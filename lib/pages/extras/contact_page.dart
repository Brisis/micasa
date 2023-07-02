import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micasa/bloc/app_bloc.dart';
import 'package:micasa/helpers/constants.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          const ContactTopSection(),
          verticalSpace(height: 15),
          const ContactInformationSection(),
        ],
      ),
    );
  }
}

class ContactTopSection extends StatelessWidget {
  const ContactTopSection({super.key});

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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<AppBloc>().add(
                          const AppEventGoToAppView(
                            tabIndex: 4,
                          ),
                        );
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: kChipColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: kWhiteColor,
                      size: 20,
                    ),
                  ),
                ),
                horizontalSpace(),
                const Text(
                  "Contact Us",
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: kSubHeaderTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactInformationSection extends StatelessWidget {
  const ContactInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContactItem(
            title: "Facebook - Micasa Listings",
            icon: Icons.facebook,
            onTap: () {},
          ),
          verticalSpace(height: 15),
          ContactItem(
            title: "WhatsApp Business",
            icon: Icons.wechat_sharp,
            onTap: () {},
          ),
          verticalSpace(height: 15),
          ContactItem(
            title: "Twitter - @micasa_listings",
            icon: Icons.local_fire_department_outlined,
            onTap: () {},
          ),
          verticalSpace(height: 15),
          ContactItem(
            title: "Instagram - @micasa_listings",
            icon: Icons.photo_camera_outlined,
            onTap: () {},
          ),
          verticalSpace(height: 15),
          ContactItem(
            title: "Youtube - Micasa Listings",
            icon: Icons.smart_display_outlined,
            onTap: () {},
          ),
          verticalSpace(height: 15),
          ContactItem(
            title: "Tiktok - @micasa_listings",
            icon: Icons.tiktok,
            onTap: () {},
          ),
          verticalSpace(height: 15),
          ContactItem(
            title: "Call Us",
            icon: Icons.phone,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onTap;
  const ContactItem({
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

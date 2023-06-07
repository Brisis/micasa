import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/helpers/widgets/property_item.dart';
import 'package:micasa/helpers/widgets/property_item_sm.dart';
import 'package:micasa/pages/property/properties_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          const HomeTopSection(),
          verticalSpace(height: 15),
          const CategorySection(),
          verticalSpace(),
          const NearbySection(),
          verticalSpace(),
          const RecommendedSection(),
        ],
      ),
    );
  }
}

class HomeTopSection extends StatelessWidget {
  const HomeTopSection({super.key});

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
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: kChipColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.info_outline,
                    color: kWhiteColor,
                    size: 14,
                  ),
                  horizontalSpace(),
                  const Expanded(
                    child: Text(
                      "Get the latest on our COVID-19 response",
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: kSmallerTextSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  horizontalSpace(),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: kWhiteColor,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: kChipColor,
            thickness: 1,
          ),
          verticalSpace(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 46, 76, 121),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.card_giftcard_sharp,
                      color: kWhiteColor,
                      size: 25,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "You got 20% discount!",
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: kMediumTextSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      verticalSpace(),
                      const Text(
                        "Welcome to your first sign up",
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: kNormalTextSize,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: kWhiteColor,
                    size: 25,
                  ),
                ],
              ),
            ),
          ),
          verticalSpace(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.search,
                    color: kBlackColor,
                    size: 25,
                  ),
                  horizontalSpace(),
                  const Text(
                    "Where are you looking?",
                    style: TextStyle(
                      color: kBlackColor,
                      fontSize: kMediumTextSize,
                    ),
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

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: CategoryItem(
                  title: "Houses",
                  icon: Icons.house,
                  items: 186,
                ),
              ),
              horizontalSpace(width: 15),
              const Expanded(
                child: CategoryItem(
                  title: "Rooms",
                  icon: Icons.window_outlined,
                  items: 128,
                ),
              ),
            ],
          ),
          verticalSpace(height: 15),
          Row(
            children: [
              const Expanded(
                child: CategoryItem(
                  title: "Cottages",
                  icon: Icons.cottage,
                  items: 53,
                ),
              ),
              horizontalSpace(width: 15),
              const Expanded(
                child: CategoryItem(
                  title: "Spaces",
                  icon: Icons.store,
                  items: 152,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final int items;

  const CategoryItem({
    super.key,
    required this.title,
    required this.icon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          routeTransition(
            const PropertiesPage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: kPrimaryColor,
              size: 35,
            ),
            horizontalSpace(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: kBlackColor,
                    fontSize: kMediumTextSize,
                  ),
                ),
                verticalSpace(),
                Text(
                  "$items items",
                  style: const TextStyle(
                    color: kBlackFaded,
                    fontSize: kNormalTextSize,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NearbySection extends StatelessWidget {
  const NearbySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Nearby",
                style: TextStyle(
                  color: kBlackColor,
                  fontSize: kBigTextSize,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    routeTransition(
                      const PropertiesPage(),
                    ),
                  );
                },
                child: const Text(
                  "See all",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: kMediumTextSize,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(),
          const NearbyItems(),
          verticalSpace(height: 15),
        ],
      ),
    );
  }
}

class NearbyItems extends StatelessWidget {
  const NearbyItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: PropertySmallItem(
                name: "Chitumba House",
                location: "Meyrick",
                imageUrl: "assets/images/h1.jpg",
              ),
            ),
            horizontalSpace(width: 15),
            const Expanded(
              child: PropertySmallItem(
                name: "Zindoga Room",
                location: "Waterfalls",
                imageUrl: "assets/images/h2.jpg",
              ),
            ),
          ],
        ),
        verticalSpace(height: 15),
        Row(
          children: [
            const Expanded(
              child: PropertySmallItem(
                name: "Ruva House",
                location: "Belgravia",
                imageUrl: "assets/images/h2.jpg",
              ),
            ),
            horizontalSpace(width: 15),
            const Expanded(
              child: PropertySmallItem(
                name: "Chanda Cottage",
                location: "Glenview",
                imageUrl: "assets/images/h1.jpg",
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recommended",
            style: TextStyle(
              color: kBlackColor,
              fontSize: kBigTextSize,
            ),
          ),
          verticalSpace(),
          const PropertyItem(
            name: "Emerald House",
            imageUrl: "assets/images/h2.jpg",
            price: 150,
            rating: 4.3,
            reviewCount: 3,
          ),
          verticalSpace(height: 15),
          const PropertyItem(
            name: "Mainway Meadows Clusters",
            imageUrl: "assets/images/h1.jpg",
            price: 1250,
            rating: 5.0,
            reviewCount: 10,
            hasFavourited: true,
          ),
        ],
      ),
    );
  }
}

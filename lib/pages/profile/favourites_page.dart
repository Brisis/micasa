import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/helpers/widgets/property_item.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          const FavouritesTopSection(),
          verticalSpace(height: 15),
          const PropertySection(),
        ],
      ),
    );
  }
}

class FavouritesTopSection extends StatelessWidget {
  const FavouritesTopSection({super.key});

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
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
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
                      "Favourites",
                      style: TextStyle(
                        color: kWhiteColor,
                        fontSize: kSubHeaderTextSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: kWarningColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.delete_outline,
                    color: kWhiteColor,
                    size: 20,
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

class PropertySection extends StatelessWidget {
  const PropertySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PropertyItem(
            name: "Emerald House",
            imageUrl: "assets/images/h2.jpg",
            price: 150,
            rating: 4.3,
            reviewCount: 3,
            hasFavourited: true,
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
          verticalSpace(height: 15),
          const PropertyItem(
            name: "Emerald House",
            imageUrl: "assets/images/h2.jpg",
            price: 150,
            rating: 4.3,
            reviewCount: 3,
            hasFavourited: true,
          ),
        ],
      ),
    );
  }
}

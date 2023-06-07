import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/helpers/widgets/property_item_card.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          const ActivityTopSection(),
          verticalSpace(height: 15),
          const ActivityPropertyItems(),
          verticalSpace(height: 15),
        ],
      ),
    );
  }
}

class ActivityTopSection extends StatelessWidget {
  const ActivityTopSection({super.key});

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
                  "Activity",
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
                    Icons.date_range,
                    color: kWhiteColor,
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Browsing History",
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: kBigTextSize,
                    fontWeight: FontWeight.bold,
                  ),
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
          verticalSpace(height: 30),
        ],
      ),
    );
  }
}

class ActivityPropertyItems extends StatelessWidget {
  const ActivityPropertyItems({super.key});

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
                child: PropertyItemCard(
                  name: "Chitumba House",
                  price: 150,
                  location: "Meyrick",
                  imageUrl: "assets/images/h1.jpg",
                ),
              ),
              horizontalSpace(width: 15),
              const Expanded(
                child: PropertyItemCard(
                  name: "Zindoga Room",
                  price: 150,
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
                child: PropertyItemCard(
                  name: "Ruva House",
                  price: 150,
                  location: "Belgravia",
                  imageUrl: "assets/images/h2.jpg",
                ),
              ),
              horizontalSpace(width: 15),
              const Expanded(
                child: PropertyItemCard(
                  name: "Chanda Cottage",
                  price: 150,
                  location: "Glenview",
                  imageUrl: "assets/images/h1.jpg",
                ),
              ),
            ],
          ),
          verticalSpace(height: 15),
          Row(
            children: [
              const Expanded(
                child: PropertyItemCard(
                  name: "Zindoga Room",
                  price: 150,
                  location: "Waterfalls",
                  imageUrl: "assets/images/h1.jpg",
                ),
              ),
              horizontalSpace(width: 15),
              const Expanded(
                child: PropertyItemCard(
                  name: "Chitumba House",
                  price: 150,
                  location: "Meyrick",
                  imageUrl: "assets/images/h2.jpg",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

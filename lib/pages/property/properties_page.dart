import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/helpers/widgets/property_item_card.dart';

class PropertiesPage extends StatelessWidget {
  const PropertiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          const ExploreTopSection(),
          verticalSpace(height: 15),
          const PropertySection(),
        ],
      ),
    );
  }
}

class ExploreTopSection extends StatelessWidget {
  const ExploreTopSection({super.key});

  static final List<String> catList = [
    "Wifi",
    "TV",
    "Working Space",
    "Laundry",
    "Garden"
  ];

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
                  "Properties",
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: kSubHeaderTextSize,
                    fontWeight: FontWeight.bold,
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
              "Amenities",
              style: TextStyle(
                color: kWhiteColor,
                fontSize: kBigTextSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          verticalSpace(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: catList.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kChipColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    child: Text(
                      catList[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
          verticalSpace(height: 30),
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

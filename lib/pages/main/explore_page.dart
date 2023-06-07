import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/helpers/widgets/property_item.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {},
        child: const Icon(
          Icons.map_outlined,
          color: kWhiteColor,
          size: kIconSize,
        ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Explore",
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
                    Icons.filter_list,
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
          verticalSpace(height: 15),
          const PropertyItem(
            name: "Emerald House",
            imageUrl: "assets/images/h2.jpg",
            price: 150,
            rating: 4.3,
            reviewCount: 3,
          ),
        ],
      ),
    );
  }
}

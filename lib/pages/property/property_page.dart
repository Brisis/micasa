import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';

class PropertyPage extends StatelessWidget {
  const PropertyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                const PropertyTopSection(),
                const PropertyDetailsSection(),
                verticalSpace(height: 15),
                const Divider(
                  color: kBackgroundColorFaded,
                  thickness: 5.0,
                ),
                const PropertyFacilitiesSection(),
              ],
            ),
          ),
          //verticalSpace(height: 15),
          Container(
            padding: const EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            color: kWhiteColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    text: "\$208",
                    children: [
                      TextSpan(
                        text: " / month",
                        style: TextStyle(
                          fontSize: kMediumTextSize,
                          color: kBlackFaded,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                    style: TextStyle(
                      color: kBlackColor,
                      fontSize: kSubHeaderTextSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                horizontalSpace(width: 15),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(10.0),
                      ),
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Reserve",
                      style: TextStyle(
                        fontSize: kMediumTextSize,
                        color: Colors.white,
                      ),
                    ),
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

class PropertyTopSection extends StatelessWidget {
  const PropertyTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          Container(
            height: 370,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/h2.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 10,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back,
                            color: kChipColor,
                            size: kIconSize,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.heart_fill,
                              color: kWarningColor,
                              size: kIconSize,
                            ),
                          ),
                        ),
                        verticalSpace(height: 15),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.videocam_circle,
                              color: kChipColor,
                              size: kIconSize,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 30,
            child: const PropertyGallerySection(),
          ),
          Positioned(
            bottom: 0,
            right: 25,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(35),
              ),
              child: const Center(
                child: Icon(
                  CupertinoIcons.share,
                  color: kWhiteColor,
                  size: kIconLargeSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyGallerySection extends StatelessWidget {
  const PropertyGallerySection({super.key});

  static final List<String> images = [
    "assets/images/h1.jpg",
    "assets/images/h2.jpg",
    "assets/images/h1.jpg",
    "assets/images/h2.jpg",
    "assets/images/h1.jpg",
    "assets/images/h2.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        height: 70,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 80,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kWhiteColor,
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: AssetImage(
                    images[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PropertyDetailsSection extends StatelessWidget {
  const PropertyDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Ibis House",
            style: TextStyle(
              color: kBlackColor,
              fontSize: kMidHeaderTextSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                color: kSuccessColor,
                size: 20,
              ),
              horizontalSpace(),
              RichText(
                text: const TextSpan(
                  text: "4.3",
                  children: [
                    TextSpan(
                      text: " (3 reviews)",
                      style: TextStyle(
                        fontSize: kMediumTextSize,
                        color: kBlackFaded,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                  style: TextStyle(
                    color: kBlackColor,
                    fontSize: kMediumTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(height: 15),
          Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: kBlackFaded,
                size: 20,
              ),
              horizontalSpace(),
              const Expanded(
                child: Text(
                  "Kuwadzana Extension Phase II",
                  style: TextStyle(
                    color: kBlackColor,
                    fontSize: kMediumTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(height: 15),
          RichText(
            text: const TextSpan(
              text:
                  "Our properties are masterpieces for all our clients with lasting value! Made with love from Micasa Family and ...",
              children: [
                TextSpan(
                  text: " Read more",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              style: TextStyle(
                color: kBlackColor,
                fontSize: kMediumTextSize,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          verticalSpace(height: 30),
          const PropertyTipBox(),
        ],
      ),
    );
  }
}

class PropertyTipBox extends StatelessWidget {
  const PropertyTipBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: kBackgroundColorFaded,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Icon(
              Icons.diamond_outlined,
              color: kPrimaryColor,
              size: 25,
            ),
          ),
          horizontalSpace(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "This is a rare find!",
                  style: TextStyle(
                    color: kBlackColor,
                    fontSize: kBigTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                verticalSpace(),
                const Text(
                  "Ibis house is usually fully booked.",
                  style: TextStyle(
                    color: kBlackFaded,
                    fontSize: kNormalTextSize,
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

class PropertyFacilitiesSection extends StatelessWidget {
  const PropertyFacilitiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Facilities",
            style: TextStyle(
              color: kBlackColor,
              fontSize: kBigTextSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace(height: 15),
          const FacilityItems(),
        ],
      ),
    );
  }
}

class FacilityItems extends StatelessWidget {
  const FacilityItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: FacilityItem(
                name: "2 Bedroom",
                icon: Icons.bed,
              ),
            ),
            horizontalSpace(width: 15),
            const Expanded(
              child: FacilityItem(
                name: "1 Bathroom",
                icon: Icons.bathroom_outlined,
              ),
            ),
          ],
        ),
        verticalSpace(height: 15),
        Row(
          children: [
            const Expanded(
              child: FacilityItem(
                name: "Wi-Fi",
                icon: Icons.wifi,
              ),
            ),
            horizontalSpace(width: 15),
            const Expanded(
              child: FacilityItem(
                name: "TV",
                icon: Icons.tv,
              ),
            ),
          ],
        ),
        verticalSpace(height: 15),
      ],
    );
  }
}

class FacilityItem extends StatelessWidget {
  final String name;
  final IconData icon;
  const FacilityItem({
    super.key,
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: kBlackFaded,
          size: kIconLargeSize,
        ),
        horizontalSpace(),
        Text(
          name,
          style: const TextStyle(
            color: kBlackFaded,
            fontSize: kMediumTextSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/pages/property/property_page.dart';

class PropertyItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int price;
  final double rating;
  final int reviewCount;
  final bool hasFavourited;
  const PropertyItem({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.reviewCount,
    this.hasFavourited = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          SizedBox(
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      routeTransition(
                        const PropertyPage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: hasFavourited
                          ? const Icon(
                              CupertinoIcons.heart_fill,
                              color: kWarningColor,
                              size: kIconSize,
                            )
                          : const Icon(
                              CupertinoIcons.heart,
                              color: kBlackColor,
                              size: kIconSize,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          color: kBlackColor,
                          fontSize: kMediumTextSize,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    horizontalSpace(),
                    RichText(
                      text: TextSpan(
                        text: "\$$price",
                        children: const [
                          TextSpan(
                            text: " / month",
                            style: TextStyle(
                              fontSize: kMediumTextSize,
                              color: kBlackFaded,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                        style: const TextStyle(
                          color: kBlackColor,
                          fontSize: kMediumTextSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpace(),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: kSuccessColor,
                      size: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        text: "$rating",
                        children: [
                          TextSpan(
                            text: " ($reviewCount reviews)",
                            style: const TextStyle(
                              fontSize: kMediumTextSize,
                              color: kBlackFaded,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                        style: const TextStyle(
                          color: kBlackColor,
                          fontSize: kMediumTextSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

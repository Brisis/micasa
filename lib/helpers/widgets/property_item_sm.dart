import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/pages/property/property_page.dart';

class PropertySmallItem extends StatelessWidget {
  final String name;
  final String location;
  final String imageUrl;
  const PropertySmallItem({
    super.key,
    required this.name,
    required this.location,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          routeTransition(
            const PropertyPage(),
          ),
        );
      },
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          horizontalSpace(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: kBlackColor,
                    fontSize: kMediumTextSize,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                verticalSpace(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.room_outlined,
                      color: kBlackFaded,
                      size: 15,
                    ),
                    Text(
                      location,
                      style: const TextStyle(
                        color: kBlackFaded,
                        fontSize: kNormalTextSize,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

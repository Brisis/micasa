import 'package:flutter/material.dart';
import 'package:micasa/global/server_url.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/pages/property/property_page.dart';

class PropertySmallItem extends StatelessWidget {
  final String name;
  final int price;
  final String? imageUrl;
  const PropertySmallItem({
    super.key,
    required this.name,
    required this.price,
    this.imageUrl,
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
              image: imageUrl != null
                  ? DecorationImage(
                      image: NetworkImage(
                          "${LOCAL_SERVER_URL}thumbnails/${imageUrl!}"),
                      fit: BoxFit.cover,
                    )
                  : const DecorationImage(
                      image: AssetImage("assets/images/h1.jpg"),
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
                    // const Icon(
                    //   Icons.room_outlined,
                    //   color: kBlackFaded,
                    //   size: 15,
                    // ),
                    const Icon(
                      Icons.attach_money,
                      color: kBlackFaded,
                      size: 15,
                    ),
                    Text(
                      "$price",
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

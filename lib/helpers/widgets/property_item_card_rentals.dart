import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/pages/property/property_page.dart';

class PropertyItemCardRental extends StatelessWidget {
  final String name;
  final String location;
  final String imageUrl;
  final DateTime rentalExpirationDate;

  const PropertyItemCardRental({
    super.key,
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.rentalExpirationDate,
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
      child: Container(
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              height: 80,
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
            Padding(
              padding: const EdgeInsets.all(15.0),
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
                      Expanded(
                        child: Text(
                          location,
                          style: const TextStyle(
                            color: kBlackFaded,
                            fontSize: kNormalTextSize,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        color: kWarningColor,
                        size: 15,
                      ),
                      Expanded(
                        child: Text(
                          "${rentalExpirationDate.day}/${rentalExpirationDate.month}/${rentalExpirationDate.year}",
                          style: const TextStyle(
                            color: kBlackFaded,
                            fontSize: kNormalTextSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

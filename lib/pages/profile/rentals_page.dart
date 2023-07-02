import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micasa/bloc/app_bloc.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/helpers/widgets/property_item_card_rentals.dart';

class RentalsPage extends StatelessWidget {
  const RentalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          const RentalsTopSection(),
          verticalSpace(height: 15),
          const PropertySection(),
        ],
      ),
    );
  }
}

class RentalsTopSection extends StatelessWidget {
  const RentalsTopSection({super.key});

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
                        context.read<AppBloc>().add(
                              const AppEventGoToAppView(
                                tabIndex: 4,
                              ),
                            );
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
                      "Rentals",
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
                    Icons.calendar_month,
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
          Row(
            children: [
              Expanded(
                child: PropertyItemCardRental(
                  name: "Chitumba House sjksjns  sjnks",
                  location: "Meyrick hksj sks sjksns",
                  imageUrl: "assets/images/h1.jpg",
                  rentalExpirationDate: DateTime(2023, 9, 7),
                ),
              ),
              horizontalSpace(width: 15),
              Expanded(
                child: PropertyItemCardRental(
                  name: "Zindoga Room",
                  location: "Waterfalls",
                  imageUrl: "assets/images/h2.jpg",
                  rentalExpirationDate: DateTime(2023, 9, 7),
                ),
              ),
            ],
          ),
          verticalSpace(height: 15),
          Row(
            children: [
              Expanded(
                child: PropertyItemCardRental(
                  name: "Ruva House",
                  location: "Belgravia",
                  imageUrl: "assets/images/h2.jpg",
                  rentalExpirationDate: DateTime(2023, 9, 7),
                ),
              ),
              horizontalSpace(width: 15),
              Expanded(
                child: PropertyItemCardRental(
                  name: "Chanda Cottage",
                  location: "Glenview",
                  imageUrl: "assets/images/h1.jpg",
                  rentalExpirationDate: DateTime(2023, 9, 7),
                ),
              ),
            ],
          ),
          verticalSpace(height: 15),
          Row(
            children: [
              Expanded(
                child: PropertyItemCardRental(
                  name: "Zindoga Room",
                  location: "Waterfalls",
                  imageUrl: "assets/images/h1.jpg",
                  rentalExpirationDate: DateTime(2023, 9, 7),
                ),
              ),
              horizontalSpace(width: 15),
              Expanded(
                child: PropertyItemCardRental(
                  name: "Chitumba House",
                  location: "Meyrick",
                  imageUrl: "assets/images/h2.jpg",
                  rentalExpirationDate: DateTime(2023, 9, 7),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

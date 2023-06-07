import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/helpers/widgets/text_field.dart';

class LeasePage extends StatelessWidget {
  const LeasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          const LeaseTopSection(),
          verticalSpace(height: 15),
          const EditFormSection(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                      "Save Changes",
                      style: TextStyle(
                        fontSize: 20,
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

class LeaseTopSection extends StatelessWidget {
  const LeaseTopSection({super.key});

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
                  "Lease Agreement",
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: kSubHeaderTextSize,
                    fontWeight: FontWeight.bold,
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

class EditFormSection extends StatefulWidget {
  const EditFormSection({super.key});

  @override
  State<EditFormSection> createState() => _EditFormSectionState();
}

class _EditFormSectionState extends State<EditFormSection> {
  //text controllers
  final _nameController =
      TextEditingController(text: "Benevolent Mudzinganyama");
  final _identityNumberController = TextEditingController(text: "23-143578M23");
  final _dateOfBirthController = TextEditingController(text: "07/25/2023");
  final _occupationController =
      TextEditingController(text: "Software Engineer");
  final _periodEmployedController = TextEditingController(text: "2 years");
  final _employerController = TextEditingController(text: "Itinordic");
  final _salaryController = TextEditingController(text: "\$800 USD");
  final _businessAddressController =
      TextEditingController(text: "Bainnes Avenue, Harare");
  final _phoneNumberController = TextEditingController(text: "0784174687");
  final _residentialAddressController =
      TextEditingController(text: "Waterfalls, Prospect");
  final _homePhoneNumberController = TextEditingController(text: "+263988917");
  final _familySizeController = TextEditingController(text: "3");
  final _nextOfKinController =
      TextEditingController(text: "Tinashe Mudzinganyama");
  final _nextOfKinPhoneNumberController =
      TextEditingController(text: "0776071106");
  final _nextOfKinAddressController =
      TextEditingController(text: "Gokwe, Mapfungautsi");

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _identityNumberController.dispose();
    _dateOfBirthController.dispose();
    _occupationController.dispose();
    _periodEmployedController.dispose();
    _employerController.dispose();
    _salaryController.dispose();
    _businessAddressController.dispose();
    _phoneNumberController.dispose();
    _residentialAddressController.dispose();
    _homePhoneNumberController.dispose();
    _familySizeController.dispose();
    _nextOfKinController.dispose();
    _nextOfKinPhoneNumberController.dispose();
    _nextOfKinAddressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: _nameController,
            hintText: 'Full Name',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: _identityNumberController,
            hintText: 'National ID Number',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: _dateOfBirthController,
            hintText: 'Date of Birth',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: _occupationController,
            hintText: 'Occupation/Work',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: _periodEmployedController,
            hintText: 'Period Employed in Months',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: _employerController,
            hintText: 'Employer Name',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: _salaryController,
            hintText: 'Salary/Income per Month',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: _businessAddressController,
            hintText: 'Business Address',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: _phoneNumberController,
            hintText: 'Phone Number',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: _residentialAddressController,
            hintText: 'Residential Address (current)',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: _homePhoneNumberController,
            hintText: 'Home Phone Number',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: _familySizeController,
            hintText: 'Family Size',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: _nextOfKinController,
            hintText: 'Next of Kin',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: _nextOfKinPhoneNumberController,
            hintText: 'Next of Kin Phone Number',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: _nextOfKinAddressController,
            hintText: 'Next of Kin Address',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/helpers/widgets/text_field.dart';

class BillingInformationPage extends StatelessWidget {
  const BillingInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          const BillingInformationTopSection(),
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

class BillingInformationTopSection extends StatelessWidget {
  const BillingInformationTopSection({super.key});

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
                  "Billing",
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
  final _accountBalanceController = TextEditingController(text: "\$25");
  final _expiryDateController = TextEditingController(text: "07/25/2023");

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _accountBalanceController.dispose();
    _expiryDateController.dispose();
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
            controller: _accountBalanceController,
            hintText: 'Account Balance',
            isReadOnly: true,
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: _expiryDateController,
            hintText: 'Expiry Date',
            isReadOnly: true,
          ),
        ],
      ),
    );
  }
}

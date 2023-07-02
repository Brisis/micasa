import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:micasa/bloc/app_bloc.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/helpers/widgets/text_field.dart';
import 'package:micasa/models/lease.dart';
import 'package:micasa/models/user.dart';

class LeasePage extends StatelessWidget {
  const LeasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final lease = context.watch<AppBloc>().state.lease;
    final user = context.watch<AppBloc>().state.user!;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          const LeaseTopSection(),
          verticalSpace(height: 15),
          EditFormSection(
            user: user,
            lease: lease,
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

class EditFormSection extends HookWidget {
  final Lease? lease;
  final User user;

  const EditFormSection({
    super.key,
    this.lease,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    //text controllers
    final nameController = TextEditingController(text: user.name);
    final identityNumberController = TextEditingController(
      text: lease != null ? lease!.nationalId : null,
    );
    final dateOfBirthController = TextEditingController(
      text: lease != null ? lease!.dateOfBirth : null,
    );
    final occupationController = TextEditingController(
      text: lease != null ? lease!.occupation : null,
    );
    final periodEmployedController = TextEditingController(
      text: lease != null ? lease!.periodEmployedInMonths.toString() : null,
    );
    final employerController = TextEditingController(
      text: lease != null ? lease!.employerName : null,
    );
    final salaryController = TextEditingController(
      text: lease != null ? lease!.salary.toString() : null,
    );
    final businessAddressController = TextEditingController(
      text: lease != null ? lease!.businessAddress : null,
    );
    final phoneNumberController = TextEditingController(
      text: lease != null ? lease!.phoneNumber : null,
    );
    final residentialAddressController = TextEditingController(
      text: lease != null ? lease!.currentHomeAddress : null,
    );
    final homePhoneNumberController = TextEditingController(
      text: lease != null ? lease!.homePhoneNumber : null,
    );
    final familySizeController = TextEditingController(
      text: lease != null ? lease!.familySize.toString() : null,
    );
    final nextOfKinController = TextEditingController(
      text: lease != null ? lease!.nextOfKin : null,
    );
    final nextOfKinPhoneNumberController = TextEditingController(
      text: lease != null ? lease!.nextOfKinPhoneNumber : null,
    );
    final nextOfKinAddressController = TextEditingController(
      text: lease != null ? lease!.nextOfKinAddress : null,
    );
    final signatureController = TextEditingController(
      text: lease != null ? lease!.signature : null,
    );
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: nameController,
            hintText: 'Full Name',
            isReadOnly: true,
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: identityNumberController,
            hintText: 'National ID Number',
            isReadOnly: lease != null,
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: dateOfBirthController,
            hintText: 'Date of Birth',
            isReadOnly: lease != null,
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: occupationController,
            hintText: 'Occupation/Work',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: periodEmployedController,
            hintText: 'Period Employed in Months',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: employerController,
            hintText: 'Employer Name',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: salaryController,
            hintText: 'Salary/Income per Month',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: businessAddressController,
            hintText: 'Business Address',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: phoneNumberController,
            hintText: 'Phone Number',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: residentialAddressController,
            hintText: 'Residential Address (current)',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: homePhoneNumberController,
            hintText: 'Home Phone Number',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: familySizeController,
            hintText: 'Family Size',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: nextOfKinController,
            hintText: 'Next of Kin',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: nextOfKinPhoneNumberController,
            hintText: 'Next of Kin Phone Number',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: nextOfKinAddressController,
            hintText: 'Next of Kin Address',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: signatureController,
            hintText: 'Signature (can be initials)',
            isReadOnly: lease != null,
          ),
          verticalSpace(height: 30),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final userId = user.id;
                    final nationalId = identityNumberController.text;
                    final dateOfBirth = dateOfBirthController.text;
                    final occupation = occupationController.text;
                    final periodEmployedInMonths =
                        periodEmployedController.text;
                    final employerName = employerController.text;
                    final salary = salaryController.text;
                    final businessAddress = businessAddressController.text;
                    final phoneNumber = phoneNumberController.text;
                    final currentHomeAddress =
                        residentialAddressController.text;
                    final homePhoneNumber = homePhoneNumberController.text;
                    final familySize = familySizeController.text;
                    final nextOfKin = nextOfKinController.text;
                    final nextOfKinPhoneNumber =
                        nextOfKinPhoneNumberController.text;
                    final nextOfKinAddress = nextOfKinAddressController.text;
                    final signature = signatureController.text;

                    context.read<AppBloc>().add(
                          AppEventRegisterLease(
                            userId: userId,
                            nationalId: nationalId,
                            dateOfBirth: dateOfBirth,
                            occupation: occupation,
                            periodEmployedInMonths:
                                int.parse(periodEmployedInMonths),
                            employerName: employerName,
                            salary: int.parse(salary),
                            businessAddress: businessAddress,
                            phoneNumber: phoneNumber,
                            currentHomeAddress: currentHomeAddress,
                            homePhoneNumber: homePhoneNumber,
                            familySize: int.parse(familySize),
                            nextOfKin: nextOfKin,
                            nextOfKinPhoneNumber: nextOfKinPhoneNumber,
                            nextOfKinAddress: nextOfKinAddress,
                            signature: signature,
                          ),
                        );
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
        ],
      ),
    );
  }
}

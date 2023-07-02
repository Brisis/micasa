import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:micasa/bloc/app_bloc.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/helpers/widgets/text_field.dart';
import 'package:micasa/models/user.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AppBloc>().state.user!;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          const EditProfileTopSection(),
          verticalSpace(height: 15),
          EditFormSection(
            user: user,
          ),
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

class EditProfileTopSection extends StatelessWidget {
  const EditProfileTopSection({super.key});

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
                  "Edit Profile",
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
  final User user;
  EditFormSection({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final location = context.watch<AppBloc>().state.location!;

    //text controllers
    final nameController = TextEditingController(text: user.name);
    final locationController = TextEditingController(
      text: location.name,
    );
    final emailAddressController = TextEditingController(text: user.email);
    final joinedDateController =
        TextEditingController(text: user.dateJoined.substring(0, 10));

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            controller: nameController,
            hintText: 'Full Name',
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: emailAddressController,
            hintText: 'Email Address',
            isReadOnly: true,
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: locationController,
            hintText: "Physical Location",
          ),
          verticalSpace(height: 15),
          CustomTextField(
            controller: joinedDateController,
            hintText: 'Joined Date',
            isReadOnly: true,
          ),
        ],
      ),
    );
  }
}

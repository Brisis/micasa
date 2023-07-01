import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micasa/app_view.dart';
import 'package:micasa/bloc/app_bloc.dart';
import 'package:micasa/dialogs/show_auth_error.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/loading/loading_screen.dart';
import 'package:micasa/pages/auth/login_page.dart';
import 'package:micasa/pages/auth/registration_page.dart';
import 'package:micasa/pages/extras/contact_page.dart';
import 'package:micasa/pages/extras/tcs_page.dart';
import 'package:micasa/pages/profile/billing_information_page.dart';
import 'package:micasa/pages/profile/edit_profile_page.dart';
import 'package:micasa/pages/profile/favourites_page.dart';
import 'package:micasa/pages/profile/lease_page.dart';
import 'package:micasa/pages/profile/rentals_page.dart';
import 'package:micasa/pages/welcome_page.dart';

void main() {
  runApp(const AppMain());
}

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc()
        ..add(
          const AppEventInitialize(),
        ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
        ),
        home: BlocConsumer<AppBloc, AppState>(
          listener: (context, appState) {
            if (appState.isLoading) {
              LoadingScreen.instance()
                  .show(context: context, text: "Loading...");
            } else {
              LoadingScreen.instance().hide();
            }

            // handle exceptions
            final authError = appState.authError;
            if (authError != null) {
              showAuthErrorDialog(
                authError: authError,
                context: context,
              );
            }
          },
          builder: (context, appState) {
            if (appState is AppStateInitial) {
              return const WelcomePage();
            }

            if (appState is AppStateLoggedOut) {
              return const LoginPage();
            }

            if (appState is AppStateLoggedIn) {
              return const AppView();
            }

            if (appState is AppStateIsInRegistrationView) {
              return const RegistrationPage();
            }

            if (appState is AppStateIsInRegistrationView) {
              return const RegistrationPage();
            }

            if (appState is AppStateIsInEditProfilePage) {
              return const EditProfilePage();
            }

            if (appState is AppStateIsInBillingInformationPage) {
              return const BillingInformationPage();
            }

            if (appState is AppStateIsInFavouritesPage) {
              return const FavouritesPage();
            }

            if (appState is AppStateIsInRentalsPage) {
              return const RentalsPage();
            }

            if (appState is AppStateIsInLeasePage) {
              return const LeasePage();
            }

            if (appState is AppStateIsInPrivacyTermsAndConditionsPage) {
              return const PrivacyTermsAndConditionsPage();
            }

            if (appState is AppStateIsInContactPage) {
              return const ContactPage();
            }

            // this should never happen
            // todo - you should crash the app
            return const Placeholder();
          },
        ),
      ),
    );
  }
}

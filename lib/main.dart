import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micasa/app_view.dart';
import 'package:micasa/bloc/app_bloc.dart';
import 'package:micasa/dialogs/show_auth_error.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/loading/loading_screen.dart';
import 'package:micasa/pages/auth/login_page.dart';
import 'package:micasa/pages/auth/registration_page.dart';
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
            } else if (appState is AppStateLoggedOut) {
              return const LoginPage();
            } else if (appState is AppStateLoggedIn) {
              return const AppView();
            } else if (appState is AppStateIsInRegistrationView) {
              return const RegistrationPage();
            } else {
              // this should never happen
              // todo - you should crash the app
              return const Placeholder();
            }
          },
        ),
      ),
    );
  }
}

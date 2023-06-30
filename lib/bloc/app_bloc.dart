import 'package:flutter/foundation.dart' show immutable;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micasa/global/token.dart';
import 'package:micasa/models/auth_error.dart';
import 'package:micasa/models/user.dart';
import 'package:micasa/repository/auth.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(
          const AppStateLoggedOut(
            isLoading: false,
          ),
        ) {
    // start events

    //initialize app
    on<AppEventInitialize>((event, emit) async {
      //get the current user
      if (AUTH_TOKEN != null) {
        final authResponse = await AuthRepository().authenticate(
          token: AUTH_TOKEN,
        );

        if (authResponse.authToken == null) {
          emit(
            const AppStateLoggedOut(
              isLoading: false,
            ),
          );
        } else {
          // go grab the user's data

          final user = authResponse.user;

          if (user != null) {
            AUTH_TOKEN = authResponse.authToken;

            emit(
              AppStateLoggedIn(
                isLoading: false,
                user: user,
              ),
            );
          }
        }
      } else {
        emit(
          const AppStateInitial(
            isLoading: false,
          ),
        );
      }
    });

    //navigation events
    on<AppEventGoToRegistration>((event, emit) {
      emit(
        const AppStateIsInRegistrationView(
          isLoading: false,
        ),
      );
    });

    on<AppEventGoToLogin>((event, emit) {
      emit(
        const AppStateLoggedOut(
          isLoading: false,
        ),
      );
    });

    //auth events

    //login user
    on<AppEventLogIn>((event, emit) async {
      emit(
        const AppStateLoggedOut(
          isLoading: true,
        ),
      );
      //log user in
      final email = event.email;
      final password = event.password;

      try {
        final authResponse = await AuthRepository().login(
          email: email,
          password: password,
        );

        final user = authResponse.user;

        if (user != null) {
          AUTH_TOKEN = authResponse.authToken;

          emit(
            AppStateLoggedIn(
              isLoading: false,
              user: user,
            ),
          );
        }
      } on Exception catch (e) {
        emit(
          AppStateLoggedOut(
            isLoading: false,
            authError: AuthError.from(e),
          ),
        );
      }
    });

    //register user
    on<AppEventRegister>((event, emit) async {
      // start loading
      emit(
        const AppStateIsInRegistrationView(
          isLoading: true,
        ),
      );

      final name = event.name;
      final email = event.email;
      final password = event.password;

      try {
        final response = await AuthRepository().register(
          name: name,
          email: email,
          password: password,
        );

        if (response.contains("email")) {
          final authResponse = await AuthRepository().login(
            email: email,
            password: password,
          );

          final user = authResponse.user;

          if (user != null) {
            AUTH_TOKEN = authResponse.authToken;

            emit(
              AppStateLoggedIn(
                isLoading: false,
                user: user,
              ),
            );
          }
        }
      } on Exception catch (e) {
        emit(
          AppStateIsInRegistrationView(
            isLoading: false,
            authError: AuthError.from(e),
          ),
        );
      }
    });

    // user account events

    //handle user sign out
    // on<AppEventLogOut>((event, emit) async {
    //   //start loading
    //   emit(
    //     const AppStateLoggedOut(
    //       isLoading: true,
    //     ),
    //   );
    //   //log the user out
    //   await FirebaseAuth.instance.signOut();

    //   //log the user out in the UI
    //   emit(
    //     const AppStateLoggedOut(
    //       isLoading: false,
    //     ),
    //   );
    // });

    //end for now
  }
}

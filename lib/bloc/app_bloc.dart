import 'package:flutter/foundation.dart' show immutable;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micasa/global/token.dart';
import 'package:micasa/models/app_exceptions.dart';
import 'package:micasa/models/auth_error.dart';
import 'package:micasa/models/lease.dart';
import 'package:micasa/models/location.dart';
import 'package:micasa/models/property.dart';
import 'package:micasa/models/user.dart';
import 'package:micasa/repository/auth.dart';
import 'package:micasa/repository/lease.dart';
import 'package:micasa/repository/location.dart';
import 'package:micasa/repository/property.dart';

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
      emit(const AppStateLoadAppPage(
        isLoading: false,
      ));

      try {
        final token = await getAuthToken();

        //get the current user
        if (token != null) {
          final authResponse = await AuthRepository().authenticate(
            token: token,
          );

          final user = authResponse.user;

          if (user == null) {
            emit(
              const AppStateLoggedOut(
                isLoading: false,
              ),
            );
          } else {
            // go grab the user's info and data
            final location = await LocationRepository().getLocation(
              locationId: user.locationId,
            );

            final properties = await PropertyRepository().getProperties();

            emit(
              AppStateLoggedIn(
                isLoading: false,
                user: user,
                location: location,
                properties: properties,
              ),
            );
          }
        } else {
          emit(
            const AppStateInitial(
              isLoading: false,
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

    on<AppEventGoToAppView>((event, emit) {
      final user = state.user;
      final location = state.location;

      if (user != null && location != null) {
        emit(
          AppStateLoggedIn(
            isLoading: false,
            user: user,
            location: state.location!,
            tabIndex: event.tabIndex,
          ),
        );
      } else {
        emit(
          const AppStateLoggedOut(
            isLoading: false,
          ),
        );
      }
    });

    on<AppEventGoToEditProfilePage>((event, emit) {
      emit(
        AppStateIsInEditProfilePage(
          isLoading: false,
          user: state.user,
          location: state.location,
        ),
      );
    });

    on<AppEventGoToBillingInformationPage>((event, emit) {
      emit(
        AppStateIsInBillingInformationPage(
          isLoading: false,
          user: state.user!,
          location: state.location,
        ),
      );
    });

    on<AppEventGoToFavouritesPage>((event, emit) {
      emit(
        AppStateIsInFavouritesPage(
          isLoading: false,
          user: state.user!,
          location: state.location,
        ),
      );
    });

    on<AppEventGoToRentalsPage>((event, emit) {
      emit(
        AppStateIsInRentalsPage(
          isLoading: false,
          user: state.user!,
          location: state.location,
        ),
      );
    });

    on<AppEventGoToLeasePage>((event, emit) async {
      try {
        final leaseId = state.user!.id;

        final lease = await LeaseRepository().getLease(
          leaseId: leaseId,
        );

        emit(
          AppStateIsInLeasePage(
            isLoading: false,
            lease: lease,
            user: state.user!,
            location: state.location,
          ),
        );
      } on AppException catch (e) {
        if (e.code == 110) {
          emit(
            AppStateIsInLeasePage(
              isLoading: false,
              user: state.user!,
              location: state.location,
            ),
          );
        } else {
          emit(
            AppStateLoggedOut(
              isLoading: false,
              authError: AuthError.from(e),
            ),
          );
        }
      }
    });

    on<AppEventGoToPrivacyTermsAndConditionsPage>((event, emit) {
      emit(
        AppStateIsInPrivacyTermsAndConditionsPage(
          isLoading: false,
          user: state.user!,
          location: state.location,
        ),
      );
    });

    on<AppEventGoToContactPage>((event, emit) {
      emit(
        AppStateIsInContactPage(
          isLoading: false,
          user: state.user!,
          location: state.location,
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
          saveAuthToken(authResponse.authToken!);
          final location = await LocationRepository().getLocation(
            locationId: user.locationId,
          );

          final properties = await PropertyRepository().getProperties();

          emit(
            AppStateLoggedIn(
              isLoading: false,
              user: user,
              location: location,
              properties: properties,
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
            saveAuthToken(authResponse.authToken!);
            final location = await LocationRepository().getLocation(
              locationId: user.locationId,
            );

            final properties = await PropertyRepository().getProperties();

            emit(
              AppStateLoggedIn(
                isLoading: false,
                user: user,
                location: location,
                properties: properties,
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

    on<AppEventRegisterLease>((event, emit) async {
      final user = state.user!;
      final lease = state.lease;
      // start loading
      emit(
        AppStateIsInLeasePage(
          isLoading: true,
          user: user,
        ),
      );

      final userId = user.id;
      final nationalId = event.nationalId;
      final dateOfBirth = event.dateOfBirth;
      final occupation = event.occupation;
      final periodEmployedInMonths = event.periodEmployedInMonths;
      final employerName = event.employerName;
      final salary = event.salary;
      final businessAddress = event.businessAddress;
      final phoneNumber = event.phoneNumber;
      final currentHomeAddress = event.currentHomeAddress;
      final homePhoneNumber = event.homePhoneNumber;
      final familySize = event.familySize;
      final nextOfKin = event.nextOfKin;
      final nextOfKinPhoneNumber = event.nextOfKinPhoneNumber;
      final nextOfKinAddress = event.nextOfKinAddress;
      final signature = event.signature;

      try {
        if (lease != null) {
          final response = await LeaseRepository().updateLease(
            leaseId: lease.id,
            occupation: occupation,
            periodEmployedInMonths: periodEmployedInMonths,
            employerName: employerName,
            salary: salary,
            businessAddress: businessAddress,
            phoneNumber: phoneNumber,
            currentHomeAddress: currentHomeAddress,
            homePhoneNumber: homePhoneNumber,
            familySize: familySize,
            nextOfKin: nextOfKin,
            nextOfKinPhoneNumber: nextOfKinPhoneNumber,
            nextOfKinAddress: nextOfKinAddress,
          );
          emit(
            AppStateIsInLeasePage(
              isLoading: false,
              lease: response,
              user: user,
            ),
          );
        } else {
          final response = await LeaseRepository().registerLease(
            userId: userId,
            nationalId: nationalId,
            dateOfBirth: dateOfBirth,
            occupation: occupation,
            periodEmployedInMonths: periodEmployedInMonths,
            employerName: employerName,
            salary: salary,
            businessAddress: businessAddress,
            phoneNumber: phoneNumber,
            currentHomeAddress: currentHomeAddress,
            homePhoneNumber: homePhoneNumber,
            familySize: familySize,
            nextOfKin: nextOfKin,
            nextOfKinPhoneNumber: nextOfKinPhoneNumber,
            nextOfKinAddress: nextOfKinAddress,
            signature: signature,
          );
          emit(
            AppStateIsInLeasePage(
              isLoading: false,
              lease: response,
              user: user,
            ),
          );
        }
      } on Exception catch (e) {
        emit(
          AppStateIsInLeasePage(
            isLoading: false,
            user: user,
            authError: AuthError.from(e),
          ),
        );
      }
    });

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

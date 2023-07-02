part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

@immutable
class AppEventUploadImage implements AppEvent {
  final String filePathToUpload;

  const AppEventUploadImage({
    required this.filePathToUpload,
  });

  @override
  List<Object> get props => [filePathToUpload];

  @override
  bool? get stringify => true;
}

@immutable
class AppEventDeleteAccount implements AppEvent {
  const AppEventDeleteAccount();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

@immutable
class AppEventLogOut implements AppEvent {
  const AppEventLogOut();
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

@immutable
class AppEventInitialize implements AppEvent {
  const AppEventInitialize();
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

@immutable
class AppEventLogIn implements AppEvent {
  final String email;
  final String password;

  const AppEventLogIn({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];

  @override
  bool? get stringify => true;
}

@immutable
class AppEventGoToRegistration implements AppEvent {
  const AppEventGoToRegistration();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

@immutable
class AppEventGoToLogin implements AppEvent {
  const AppEventGoToLogin();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

@immutable
class AppEventRegister implements AppEvent {
  final String name;
  final String email;
  final String password;

  const AppEventRegister({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [name, email, password];

  @override
  bool? get stringify => true;
}

@immutable
class AppEventGoToAppView implements AppEvent {
  final int tabIndex;
  const AppEventGoToAppView({
    required this.tabIndex,
  });

  @override
  List<Object> get props => [tabIndex];

  @override
  bool? get stringify => true;
}

@immutable
class AppEventGoToBillingInformationPage implements AppEvent {
  const AppEventGoToBillingInformationPage();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

@immutable
class AppEventGoToEditProfilePage implements AppEvent {
  const AppEventGoToEditProfilePage();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

@immutable
class AppEventGoToFavouritesPage implements AppEvent {
  const AppEventGoToFavouritesPage();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

@immutable
class AppEventGoToRentalsPage implements AppEvent {
  const AppEventGoToRentalsPage();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

@immutable
class AppEventGoToLeasePage implements AppEvent {
  const AppEventGoToLeasePage();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

@immutable
class AppEventGoToPrivacyTermsAndConditionsPage implements AppEvent {
  const AppEventGoToPrivacyTermsAndConditionsPage();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

@immutable
class AppEventGoToContactPage implements AppEvent {
  const AppEventGoToContactPage();

  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}

@immutable
class AppEventRegisterLease implements AppEvent {
  final int userId;
  final String nationalId;
  final String dateOfBirth;
  final String occupation;
  final int periodEmployedInMonths;
  final String employerName;
  final int salary;
  final String businessAddress;
  final String phoneNumber;
  final String currentHomeAddress;
  final String homePhoneNumber;
  final int familySize;
  final String nextOfKin;
  final String nextOfKinPhoneNumber;
  final String nextOfKinAddress;
  final String signature;

  const AppEventRegisterLease({
    required this.userId,
    required this.nationalId,
    required this.dateOfBirth,
    required this.occupation,
    required this.periodEmployedInMonths,
    required this.employerName,
    required this.salary,
    required this.businessAddress,
    required this.phoneNumber,
    required this.currentHomeAddress,
    required this.homePhoneNumber,
    required this.familySize,
    required this.nextOfKin,
    required this.nextOfKinPhoneNumber,
    required this.nextOfKinAddress,
    required this.signature,
  });

  @override
  List<Object> get props => [
        userId,
        nationalId,
        dateOfBirth,
        occupation,
        periodEmployedInMonths,
        employerName,
        salary,
        businessAddress,
        phoneNumber,
        currentHomeAddress,
        homePhoneNumber,
        familySize,
        nextOfKin,
        nextOfKinPhoneNumber,
        nextOfKinAddress,
        signature,
      ];

  @override
  bool? get stringify => true;
}

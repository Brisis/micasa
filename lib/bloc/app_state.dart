part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  final bool isLoading;
  final AuthError? authError;
  final User? user;
  final Location? location;
  final List<Property>? properties;

  const AppState({
    required this.isLoading,
    this.user,
    this.location,
    this.authError,
    this.properties,
  });

  @override
  List<Object> get props => [isLoading, authError!];
}

class AppStateInitial extends AppState {
  const AppStateInitial({required super.isLoading});
}

class AppStateLoadAppPage extends AppState {
  const AppStateLoadAppPage({required super.isLoading});
}

@immutable
class AppStateLoggedIn extends AppState {
  final int? tabIndex;

  const AppStateLoggedIn({
    required bool isLoading,
    User? user,
    Location? location,
    List<Property>? properties,
    AuthError? authError,
    this.tabIndex = 0,
  }) : super(
          isLoading: isLoading,
          authError: authError,
          user: user,
          location: location,
          properties: properties,
        );

  @override
  List<Object> get props => [
        isLoading,
        "$user",
        "$location",
        "$properties",
        "$authError",
        "$tabIndex",
      ];

  @override
  bool? get stringify => true;
}

@immutable
class AppStateLoggedOut extends AppState {
  const AppStateLoggedOut({
    required bool isLoading,
    AuthError? authError,
  }) : super(
          isLoading: isLoading,
          authError: authError,
        );

  @override
  List<Object> get props => [isLoading, "$authError"];

  @override
  bool? get stringify => true;
}

@immutable
class AppStateIsInRegistrationView extends AppState {
  const AppStateIsInRegistrationView({
    required bool isLoading,
    AuthError? authError,
  }) : super(
          isLoading: isLoading,
          authError: authError,
        );

  @override
  List<Object> get props => [isLoading, "$authError"];

  @override
  bool? get stringify => true;
}

@immutable
class AppStateIsInAppView extends AppState {
  const AppStateIsInAppView({
    required bool isLoading,
    AuthError? authError,
  }) : super(
          isLoading: isLoading,
          authError: authError,
        );

  @override
  List<Object> get props => [isLoading, "$authError"];

  @override
  bool? get stringify => true;
}

@immutable
class AppStateIsInEditProfilePage extends AppState {
  const AppStateIsInEditProfilePage({
    required bool isLoading,
    User? user,
    Location? location,
    AuthError? authError,
  }) : super(
          isLoading: isLoading,
          user: user,
          location: location,
          authError: authError,
        );

  @override
  List<Object> get props => [isLoading, "$user", "$location" "$authError"];

  @override
  bool? get stringify => true;
}

@immutable
class AppStateIsInBillingInformationPage extends AppState {
  const AppStateIsInBillingInformationPage({
    required bool isLoading,
    User? user,
    Location? location,
    AuthError? authError,
  }) : super(
          isLoading: isLoading,
          user: user,
          location: location,
          authError: authError,
        );

  @override
  List<Object> get props => [isLoading, "$user", "$location" "$authError"];

  @override
  bool? get stringify => true;
}

@immutable
class AppStateIsInFavouritesPage extends AppState {
  const AppStateIsInFavouritesPage({
    required bool isLoading,
    User? user,
    Location? location,
    AuthError? authError,
  }) : super(
          isLoading: isLoading,
          user: user,
          location: location,
          authError: authError,
        );

  @override
  List<Object> get props => [isLoading, "$user", "$location" "$authError"];

  @override
  bool? get stringify => true;
}

@immutable
class AppStateIsInRentalsPage extends AppState {
  const AppStateIsInRentalsPage({
    required bool isLoading,
    User? user,
    Location? location,
    AuthError? authError,
  }) : super(
          isLoading: isLoading,
          user: user,
          location: location,
          authError: authError,
        );

  @override
  List<Object> get props => [isLoading, "$user", "$location" "$authError"];

  @override
  bool? get stringify => true;
}

@immutable
class AppStateIsInLeasePage extends AppState {
  final Lease? lease;
  const AppStateIsInLeasePage({
    this.lease,
    User? user,
    Location? location,
    required bool isLoading,
    AuthError? authError,
  }) : super(
          isLoading: isLoading,
          user: user,
          location: location,
          authError: authError,
        );

  @override
  List<Object> get props =>
      ["$lease", "$user", "$location", isLoading, "$authError"];

  @override
  bool? get stringify => true;
}

@immutable
class AppStateIsInPrivacyTermsAndConditionsPage extends AppState {
  const AppStateIsInPrivacyTermsAndConditionsPage({
    required bool isLoading,
    User? user,
    Location? location,
    AuthError? authError,
  }) : super(
          isLoading: isLoading,
          user: user,
          location: location,
          authError: authError,
        );

  @override
  List<Object> get props => [isLoading, "$user", "$location" "$authError"];

  @override
  bool? get stringify => true;
}

@immutable
class AppStateIsInContactPage extends AppState {
  const AppStateIsInContactPage({
    required bool isLoading,
    User? user,
    Location? location,
    AuthError? authError,
  }) : super(
          isLoading: isLoading,
          user: user,
          location: location,
          authError: authError,
        );

  @override
  List<Object> get props => [isLoading, "$user", "$location" "$authError"];

  @override
  bool? get stringify => true;
}

// Extract user from AppState
extension GetUser on AppState {
  // cls -> class name
  User? get user {
    final cls = this;
    if (cls.user != null) {
      return cls.user;
    } else if (cls is AppStateLoggedIn) {
      return cls.user;
    } else {
      return null;
    }
  }
}

extension GetProperties on AppState {
  // cls -> class name
  List<Property>? get properties {
    final cls = this;
    if (cls.properties != []) {
      return cls.properties;
    } else if (cls is AppStateLoggedIn) {
      return cls.properties;
    } else {
      return [];
    }
  }
}

extension GetLocation on AppState {
  // cls -> class name
  Location? get location {
    final cls = this;
    if (cls.location != null) {
      return cls.location;
    } else if (cls is AppStateLoggedIn) {
      return cls.location;
    } else {
      return null;
    }
  }
}

extension GetTabIndex on AppState {
  // cls -> class name
  int? get tabIndex {
    final cls = this;
    if (cls is AppStateLoggedIn) {
      return cls.tabIndex;
    } else {
      return 0;
    }
  }
}

extension GetLease on AppState {
  // cls -> class name
  Lease? get lease {
    final cls = this;
    if (cls is AppStateIsInLeasePage) {
      return cls.lease;
    } else {
      return null;
    }
  }
}

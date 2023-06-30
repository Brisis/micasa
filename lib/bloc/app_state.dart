part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  final bool isLoading;
  final AuthError? authError;

  const AppState({
    required this.isLoading,
    this.authError,
  });

  @override
  List<Object> get props => [isLoading, authError!];
}

class AppStateInitial extends AppState {
  const AppStateInitial({required super.isLoading});
}

@immutable
class AppStateLoggedIn extends AppState {
  final User user;

  const AppStateLoggedIn({
    required bool isLoading,
    required this.user,
    AuthError? authError,
  }) : super(
          isLoading: isLoading,
          authError: authError,
        );

  @override
  List<Object> get props => [isLoading, user, "$authError"];

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

// Extract user from AppState
extension GetUser on AppState {
  // cls -> class name
  User? get user {
    final cls = this;
    if (cls is AppStateLoggedIn) {
      return cls.user;
    } else {
      return null;
    }
  }
}

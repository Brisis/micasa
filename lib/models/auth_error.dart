import 'package:flutter/foundation.dart' show immutable;

const Map<String, AuthError> authErrorMapping = {
  "user-not-found": AuthErrorUserNotFound(),
  "weak-password": AuthErrorWeakPassword(),
  "invalid-email": AuthErrorInvalidEmail(),
  "operation-not-allowed": AuthErrorOperationNotAllowed(),
  "email-already-in-use": AuthErrorEmailAlreadyInUse(),
  "requires-recent-login": AuthErrorRequiresRecentLogin(),
  "no-current-user": AuthErrorNoCurrentUser(),
};

@immutable
abstract class AuthError {
  final String dialogTitle;
  final String dialogText;

  const AuthError({
    required this.dialogTitle,
    required this.dialogText,
  });

  factory AuthError.from(Exception exception) =>
      authErrorMapping[exception.toString().toLowerCase().trim()] ??
      const AuthErrorUnknown();
}

@immutable
class AuthErrorUnknown extends AuthError {
  const AuthErrorUnknown()
      : super(
          dialogTitle: "Authentication error",
          dialogText: "Unknown authentication error",
        );
}

//  no-current-user

@immutable
class AuthErrorNoCurrentUser extends AuthError {
  const AuthErrorNoCurrentUser()
      : super(
          dialogTitle: "No current user!",
          dialogText: "No current user with this information was found!",
        );
}

// requires-recent-login

@immutable
class AuthErrorRequiresRecentLogin extends AuthError {
  const AuthErrorRequiresRecentLogin()
      : super(
          dialogTitle: "Requires recent login",
          dialogText:
              "You need to logout and log back in again in order to perform this operation.",
        );
}

// occures when you try to sign-in using any auth method while it is not enabled in firebase
//  operation-not-allowed

@immutable
class AuthErrorOperationNotAllowed extends AuthError {
  const AuthErrorOperationNotAllowed()
      : super(
          dialogTitle: "Operation not allowed",
          dialogText:
              "You cannot register using this method at this moment in time!",
        );
}

//  user-not-found
@immutable
class AuthErrorUserNotFound extends AuthError {
  const AuthErrorUserNotFound()
      : super(
          dialogTitle: "User not found",
          dialogText: "The given user was not found on the server!",
        );
}

//  weak-password

@immutable
class AuthErrorWeakPassword extends AuthError {
  const AuthErrorWeakPassword()
      : super(
          dialogTitle: "Weak password",
          dialogText:
              "Please choose a stronger password consisting of more characters!",
        );
}

//  invalid-email

@immutable
class AuthErrorInvalidEmail extends AuthError {
  const AuthErrorInvalidEmail()
      : super(
          dialogTitle: "Invalid email",
          dialogText: "Please double check your email and try again!",
        );
}

//  email-already-in-use

@immutable
class AuthErrorEmailAlreadyInUse extends AuthError {
  const AuthErrorEmailAlreadyInUse()
      : super(
          dialogTitle: "Email already in use",
          dialogText: "Please choose another email to register with!",
        );
}

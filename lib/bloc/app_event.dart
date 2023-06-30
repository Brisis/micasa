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

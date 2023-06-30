import 'package:equatable/equatable.dart';
import 'package:micasa/models/user.dart';

class AuthResponse extends Equatable {
  final String message;
  final String? authToken;
  final User? user;

  const AuthResponse({
    required this.message,
    required this.authToken,
    required this.user,
  });

  AuthResponse.fromJson(Map<String, dynamic> json)
      : message = json["msg"],
        authToken = json["token"],
        user = User.fromJson(json["user"]);

  @override
  List<Object?> get props => [
        message,
        authToken,
        user,
      ];

  @override
  bool? get stringify => true;
}

import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;
import 'package:micasa/models/auth_response.dart';
import 'package:micasa/network/api_base.dart';

@immutable
class AuthRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    Map data = {
      "email": email,
      "password": password,
    };

    String body = json.encode(data);

    final response = await _helper.post(
      url: "api/login",
      body: body,
    );

    return AuthResponse.fromJson(response);
  }

  Future<String> register({
    required String name,
    required String email,
    required String password,
  }) async {
    Map data = {
      "name": name,
      "email": email,
      "password": password,
    };

    String body = json.encode(data);

    final response = await _helper.post(
      url: "api/register",
      body: body,
    );

    return response.toString();
  }

  Future<AuthResponse> authenticate({required String token}) async {
    final response = await _helper.post(
      url: "api/authenticate",
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    return AuthResponse.fromJson(response);
  }
}

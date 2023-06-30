import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:micasa/models/app_exceptions.dart';

class ApiBaseHelper {
  final String _baseUrl = "http://192.168.254.61:8000/"; //and
  //final String _baseUrl = "http://localhost:8000/"; //win

  Future<dynamic> get(String url) async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + url));
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException(message: 'No Internet connection');
    }
  }

  Future<dynamic> post({
    required String url,
    Map<String, String>? headers,
    Object? body,
  }) async {
    try {
      final route = Uri.parse(_baseUrl + url);
      final response = await http.post(
        route,
        headers: headers ??
            {
              "Content-Type": "application/json",
              "accept": "application/json",
              "Access-Control-Allow-Origin": "*"
            },
        body: body,
      );
      //print(route);
      print(response.body);
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException(message: 'No Internet connection');
    }
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(message: response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(message: response.body.toString());
      case 500:
      default:
        throw FetchDataException(
          message:
              'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}

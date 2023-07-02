import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;
import 'package:micasa/models/lease.dart';
import 'package:micasa/network/api_base.dart';

@immutable
class LeaseRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<Lease> registerLease({
    required int userId,
    required String nationalId,
    required String dateOfBirth,
    required String occupation,
    required int periodEmployedInMonths,
    required String employerName,
    required int salary,
    required String businessAddress,
    required String phoneNumber,
    required String currentHomeAddress,
    required String homePhoneNumber,
    required int familySize,
    required String nextOfKin,
    required String nextOfKinPhoneNumber,
    required String nextOfKinAddress,
    required String signature,
  }) async {
    Map data = {
      "userId": userId,
      "nationalId": nationalId,
      "dateOfBirth": dateOfBirth,
      "occupation": occupation,
      "periodEmployedInMonths": periodEmployedInMonths,
      "employerName": employerName,
      "salary": salary,
      "businessAddress": businessAddress,
      "phoneNumber": phoneNumber,
      "currentHomeAddress": currentHomeAddress,
      "homePhoneNumber": homePhoneNumber,
      "familySize": familySize,
      "nextOfKin": nextOfKin,
      "nextOfKinPhoneNumber": nextOfKinPhoneNumber,
      "nextOfKinAddress": nextOfKinAddress,
      "signature": signature
    };

    String body = json.encode(data);

    final response = await _helper.post(
      url: "api/leases",
      body: body,
    );

    return Lease.fromJson(response);
  }

  Future<Lease> updateLease({
    required int leaseId,
    required String occupation,
    required int periodEmployedInMonths,
    required String employerName,
    required int salary,
    required String businessAddress,
    required String phoneNumber,
    required String currentHomeAddress,
    required String homePhoneNumber,
    required int familySize,
    required String nextOfKin,
    required String nextOfKinPhoneNumber,
    required String nextOfKinAddress,
  }) async {
    Map data = {
      "occupation": occupation,
      "periodEmployedInMonths": periodEmployedInMonths,
      "employerName": employerName,
      "salary": salary,
      "businessAddress": businessAddress,
      "phoneNumber": phoneNumber,
      "currentHomeAddress": currentHomeAddress,
      "homePhoneNumber": homePhoneNumber,
      "familySize": familySize,
      "nextOfKin": nextOfKin,
      "nextOfKinPhoneNumber": nextOfKinPhoneNumber,
      "nextOfKinAddress": nextOfKinAddress
    };

    String body = json.encode(data);

    final response = await _helper.put(
      url: "api/leases/$leaseId",
      body: body,
    );

    return Lease.fromJson(response);
  }

  Future<Lease> getLease({
    required int leaseId,
  }) async {
    final response = await _helper.get(
      url: "api/leases/$leaseId",
    );

    return Lease.fromJson(response);
  }
}

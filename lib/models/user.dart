import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String? phoneNumber;
  final int locationId;
  //final String location;
  final String dateJoined;
  //final String? authToken;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.locationId,
    //required this.location,
    required this.dateJoined,
    //required this.authToken,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        name = json["name"] as String,
        email = json["email"] as String,
        phoneNumber = json["phone"] == null ? null : json["phone"] as String,
        locationId = json["location_id"] as int,
        //location = json["location"] as String,
        dateJoined = json["dateJoined"] as String;
  // authToken =
  //     json["authToken"] == null ? null : json["authToken"] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['locationId'] = locationId;
    // data['location'] = location;
    data['dateJoined'] = dateJoined;
    // data['authToken'] = authToken;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phoneNumber,
        locationId,
        //location,
        dateJoined,
        //authToken,
      ];

  @override
  bool? get stringify => true;
}

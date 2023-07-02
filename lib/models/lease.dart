import 'package:equatable/equatable.dart';

class Lease extends Equatable {
  final int id;
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

  const Lease({
    required this.id,
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

  Lease.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        userId = json["user_id"] as int,
        nationalId = json["national_id"] as String,
        dateOfBirth = json["dob"] as String,
        occupation = json["occupation"] as String,
        periodEmployedInMonths = json["periodEmployedInMonths"] as int,
        employerName = json["employerName"] as String,
        salary = json["salary"] as int,
        businessAddress = json["businessAddress"] as String,
        phoneNumber = json["phoneNumber"] as String,
        currentHomeAddress = json["currentHomeAddress"] as String,
        homePhoneNumber = json["homePhoneNumber"] as String,
        familySize = json["familySize"] as int,
        nextOfKin = json["nextOfKin"] as String,
        nextOfKinPhoneNumber = json["nextOfKinPhoneNumber"] as String,
        nextOfKinAddress = json["nextOfKinAddress"] as String,
        signature = json["signature"] as String;

  @override
  List<Object?> get props => [
        id,
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

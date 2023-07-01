import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final int id;
  final String name;
  final String mapCoordinates;

  const Location({
    required this.id,
    required this.name,
    required this.mapCoordinates,
  });

  Location.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        name = json["name"] as String,
        mapCoordinates = json["map_coordinates"] as String;

  @override
  List<Object?> get props => [
        id,
        name,
        mapCoordinates,
      ];

  @override
  bool? get stringify => true;
}

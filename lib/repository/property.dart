import 'package:flutter/foundation.dart' show immutable;
import 'package:micasa/models/property.dart';
import 'package:micasa/network/api_base.dart';

@immutable
class PropertyRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<Property> getProperty({
    required int propertyId,
  }) async {
    final response = await _helper.get(
      url: "api/properties/$propertyId",
    );

    return Property.fromJson(response);
  }

  Future<List<Property>> getProperties() async {
    final response = await _helper.get(
      url: "api/properties",
    );

    return (response as List<dynamic>)
        .map((i) => Property.fromJson(i))
        .toList();
  }
}

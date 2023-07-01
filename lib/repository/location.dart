import 'dart:convert';

import 'package:flutter/foundation.dart' show immutable;
import 'package:micasa/models/location.dart';
import 'package:micasa/network/api_base.dart';

@immutable
class LocationRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<Location> getLocation({
    required int locationId,
  }) async {
    final response = await _helper.get(
      url: "api/locations/$locationId",
    );

    return Location.fromJson(response);
  }

  Future<List<Location>> getLocations() async {
    final response = await _helper.get(
      url: "api/locations",
    );

    return [Location.fromJson(response)];
  }
}

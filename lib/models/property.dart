import 'package:equatable/equatable.dart';

class Property extends Equatable {
  final int id;
  final String name;
  final String? coverImage;
  final int locationId;
  final String? video;
  final String description;
  final String amenities;
  final String category;
  final int price;
  final String status;
  final String purpose;
  final double averageRating;
  final String statusExpireDate;
  final String dateCreated;
  final List<Gallery>? images;

  const Property({
    required this.id,
    required this.name,
    required this.coverImage,
    required this.locationId,
    required this.video,
    required this.description,
    required this.amenities,
    required this.category,
    required this.price,
    required this.status,
    required this.purpose,
    required this.averageRating,
    required this.statusExpireDate,
    required this.dateCreated,
    required this.images,
  });

  Property.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        name = json["name"] as String,
        coverImage =
            json["cover_image"] == null ? null : json["cover_image"] as String,
        locationId = json["location_id"] as int,
        video = json["video"] == null ? null : json["video"] as String,
        description = json["description"] as String,
        amenities = json["amenities"] as String,
        category = json["category"] as String,
        price = json["price"] as int,
        status = json["status"] as String,
        purpose = json["purpose"] as String,
        averageRating = checkDouble(json["average_rating"]),
        statusExpireDate = json["status_expire_date"] as String,
        dateCreated = json["created"] as String,
        images =
            json["images"] == null ? null : json["images"] as List<Gallery>;

  @override
  List<Object?> get props => [
        id,
        name,
        coverImage,
        locationId,
        video,
        description,
        amenities,
        category,
        price,
        status,
        purpose,
        averageRating,
        statusExpireDate,
        dateCreated,
      ];

  @override
  bool? get stringify => true;
}

class Gallery extends Equatable {
  final int id;
  final String imageThumbnail;
  final String imageOriginal;
  final int propertyId;

  const Gallery({
    required this.id,
    required this.imageThumbnail,
    required this.imageOriginal,
    required this.propertyId,
  });

  Gallery.fromJson(Map<String, dynamic> json)
      : id = json["id"] as int,
        imageThumbnail = json["image_thumbnail"] as String,
        imageOriginal = json["image_original"] as String,
        propertyId = json["property_id"] as int;

  @override
  List<Object?> get props => [
        id,
        imageThumbnail,
        imageOriginal,
        propertyId,
      ];

  @override
  bool? get stringify => true;
}

double checkDouble(dynamic value) {
  if (value is int) {
    return double.parse(value.toString());
  } else {
    return value;
  }
}

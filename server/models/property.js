export class Property {
    constructor(
        id,
        name,
        coverImage,
        images,
        video,
        reviews,
        locationId,
        description,
        amenities,
        category,
        price,
        status,
        purpose
    ){
        this.id = id;
        this.name = name;
        this.coverImage = coverImage;
        this.images = images;
        this.video = video;
        this.reviews = reviews;
        this.locationId = locationId;
        this.description = description;
        this.amenities = amenities;
        this.category = category;
        this.price = price;
        this.status = status;
        this.purpose = purpose;
    }
}
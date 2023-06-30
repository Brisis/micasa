export class Location {
    constructor(
        id,
        userId,
        propertyId,
        name,
        mapCoordinates
    ){
        this.id = id;
        this.userId = userId;
        this.propertyId = propertyId;
        this.name = name;
        this.mapCoordinates = mapCoordinates;
    }
}
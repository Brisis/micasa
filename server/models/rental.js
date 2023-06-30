export class Rental {
    constructor(
        id,
        userId,
        propertyId,
        expiryDate
    ){
        this.id = id;
        this.userId = userId;
        this.propertyId = propertyId;
        this.expiryDate = expiryDate;
    }
}
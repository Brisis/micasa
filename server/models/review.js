export class Review {
    constructor(
        id,
        userId,
        propertyId,
        rating,
        comment
    ){
        this.id = id;
        this.userId = userId;
        this.propertyId = propertyId;
        this.rating = rating;
        this.comment = comment;
    }
}
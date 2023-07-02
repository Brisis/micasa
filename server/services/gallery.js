import {poolConnection} from "../database/connection.js"

export async function addPropertyImage(image_thumbnail, image_original, property_id){
    try {
        //check if property is registered
        const [property] = await poolConnection.query(
            `
            SELECT * FROM properties 
            WHERE id = ?;
            `, [property_id]
        );

        if (property.length >= 1) {
            //register location
            const [image] = await poolConnection.query(
                `
                INSERT INTO gallery (image_thumbnail, image_original, property_id) 
                VALUES (?, ?, ?)
                `, [image_thumbnail, image_original, property_id]
            );
            
            return {
                id: image.insertId,
                image_thumbnail: image_thumbnail,
                image_original: image_original,
                property_id: property_id
            };
        }

        return "Property not found";
        
    } catch (error) {
        return error;
    }
}

export async function getImages() {
    const [images] = await poolConnection.query("SELECT * FROM gallery")
    return images
}

export async function getImage(id) {
    const [image] = await poolConnection.query(
        `
            SELECT * FROM gallery
            WHERE id = ?
        `, 
        [id]
        )
    return image[0]
}


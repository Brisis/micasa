import {poolConnection} from "../database/connection.js"

export async function registerProperty(
    name,
    locationId,
    description,
    amenities,
    category,
    price,
    status,
    purpose
){
    try {
        //check if property is registered
        const [nameCheck] = await poolConnection.query(
            `
            SELECT * FROM properties 
            WHERE LOWER(name) = LOWER(?);
            `, [name]
        );

        if (nameCheck.length < 1) {
            //register location
            const [property] = await poolConnection.query(
                `
                INSERT INTO properties (name,  
                    location_id,
                    description,
                    amenities,
                    category,
                    price,
                    status,
                    purpose
                ) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)
                `, [
                    name, 
                    locationId,
                    description,
                    amenities,
                    category,
                    price,
                    status,
                    purpose
                ]
            );
            
            return {
                id: property.insertId,
                name: name,
                locationId: locationId,
                description: description,
                amenities: amenities,
                category: category,
                price: price,
                status: status,
                purpose: purpose
            };
        }

        return "Property already registered"
        
    } catch (error) {
        return error;
    }
}

export async function getProperties() {
    const [properties] = await poolConnection.query("SELECT * FROM properties")
    return properties
}

export async function getProperty(id) {
    const [property] = await poolConnection.query(
        `
            SELECT * FROM properties
            WHERE id = ?
        `, 
        [id]
        )
    return property[0]
}


export async function updateProperty(id, imageId) {
    const [image] = await poolConnection.query(
        `
            SELECT * FROM gallery
            WHERE id = ?
        `, 
        [imageId]
        );

    if (image.length >= 1) {
        const coverImage = image[0].image_original;

        console.log(coverImage);

        const [query] = await poolConnection.query(
            `
                UPDATE properties
                SET cover_image = ?
                WHERE id = ?;
            `, 
            [coverImage, id]
            )

         const property = await getProperty(id);

        return property
    }
    
    return "Image not found"
}

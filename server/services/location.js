import {poolConnection} from "../database/connection.js"

export async function registerLocation(name, map_coordinates){
    try {
        //check if location is registered
        const [nameCheck] = await poolConnection.query(
            `
            SELECT * FROM locations 
            WHERE LOWER(name) = LOWER(?);
            `, [name]
        );

        if (nameCheck.length < 1) {
            //register location
            const [location] = await poolConnection.query(
                `
                INSERT INTO locations (name, map_coordinates) 
                VALUES (?, ?)
                `, [name, map_coordinates]
            );
            
            return {
                id: location.insertId,
                name: name,
                map_coordinates: map_coordinates
            };
        }

        return "Location already registered";
        
    } catch (error) {
        return error;
    }
}

export async function getLocations() {
    const [locations] = await poolConnection.query("SELECT * FROM locations")
    return locations
}

export async function getLocation(id) {
    const [location] = await poolConnection.query(
        `
            SELECT * FROM locations
            WHERE id = ?
        `, 
        [id]
        )
    return location[0]
}


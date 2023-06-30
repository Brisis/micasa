import {poolConnection} from "../database/connection.js"

export async function getUsers() {
    const [users] = await poolConnection.query("SELECT * FROM users")
    return users
}

export async function editUser(id){
    const [user] = await poolConnection.query(
        `
            SELECT * FROM users
            WHERE id = ?
        `, 
        [id]
    );
}
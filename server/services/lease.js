import {poolConnection} from "../database/connection.js"

export async function registerLease(
    userId,
    nationalId,
    dateOfBirth,
    occupation,
    periodEmployedInMonths,
    employerName,
    salary,
    businessAddress,
    phoneNumber,
    currentHomeAddress,
    homePhoneNumber,
    familySize,
    nextOfKin,
    nextOfKinPhoneNumber,
    nextOfKinAddress,
    signature
){
    try {
        //check if lease is registered
        const [leaseCheck] = await poolConnection.query(
            `
            SELECT * FROM leases 
            WHERE user_id = ?;
            `, [userId]
        );

        if (leaseCheck.length < 1) {
            //register lease
            const [lease] = await poolConnection.query(
                `
                INSERT INTO leases (
                    user_id,
                    national_id,
                    dob,
                    occupation,
                    periodEmployedInMonths,
                    employerName,
                    salary,
                    businessAddress,
                    phoneNumber,
                    currentHomeAddress,
                    homePhoneNumber,
                    familySize,
                    nextOfKin,
                    nextOfKinPhoneNumber,
                    nextOfKinAddress,
                    signature
                ) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                `, [
                    userId,
                    nationalId,
                    dateOfBirth,
                    occupation,
                    periodEmployedInMonths,
                    employerName,
                    salary,
                    businessAddress,
                    phoneNumber,
                    currentHomeAddress,
                    homePhoneNumber,
                    familySize,
                    nextOfKin,
                    nextOfKinPhoneNumber,
                    nextOfKinAddress,
                    signature
                ]
            );
            
            return {
                id: lease.insertId,
                userId: userId,
                nationalId: nationalId,
                dateOfBirth: dateOfBirth,
                occupation: occupation,
                periodEmployedInMonths: periodEmployedInMonths,
                employerName: employerName,
                salary: salary,
                businessAddress: businessAddress,
                phoneNumber: phoneNumber,
                currentHomeAddress: currentHomeAddress,
                homePhoneNumber: homePhoneNumber,
                familySize: familySize,
                nextOfKin: nextOfKin,
                nextOfKinPhoneNumber: nextOfKinPhoneNumber,
                nextOfKinAddress: nextOfKinAddress,
                signature: signature
            };
        }

        return "Lease already registered"
        
    } catch (error) {
        return error;
    }
}

export async function updateLease(
    leaseId,
    occupation,
    periodEmployedInMonths,
    employerName,
    salary,
    businessAddress,
    phoneNumber,
    currentHomeAddress,
    homePhoneNumber,
    familySize,
    nextOfKin,
    nextOfKinPhoneNumber,
    nextOfKinAddress
){
    try {
        //check if lease is registered
        const [leaseCheck] = await poolConnection.query(
            `
            SELECT * FROM leases 
            WHERE id = ?;
            `, [leaseId]
        );

        if (leaseCheck.length > 1) {
            //register lease
            const [lease] = await poolConnection.query(
                `
                INSERT INTO leases (
                    occupation,
                    periodEmployedInMonths,
                    employerName,
                    salary,
                    businessAddress,
                    phoneNumber,
                    currentHomeAddress,
                    homePhoneNumber,
                    familySize,
                    nextOfKin,
                    nextOfKinPhoneNumber,
                    nextOfKinAddress
                ) 
                VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                `, [
                    occupation,
                    periodEmployedInMonths,
                    employerName,
                    salary,
                    businessAddress,
                    phoneNumber,
                    currentHomeAddress,
                    homePhoneNumber,
                    familySize,
                    nextOfKin,
                    nextOfKinPhoneNumber,
                    nextOfKinAddress
                ]
            );
            
            return {
                id: lease.insertId,
                occupation: occupation,
                periodEmployedInMonths: periodEmployedInMonths,
                employerName: employerName,
                salary: salary,
                businessAddress: businessAddress,
                phoneNumber: phoneNumber,
                currentHomeAddress: currentHomeAddress,
                homePhoneNumber: homePhoneNumber,
                familySize: familySize,
                nextOfKin: nextOfKin,
                nextOfKinPhoneNumber: nextOfKinPhoneNumber,
                nextOfKinAddress: nextOfKinAddress
            };
        }

        return "Lease not found"
        
    } catch (error) {
        return error;
    }
}

export async function getLeases() {
    const [leases] = await poolConnection.query("SELECT * FROM leases")
    return leases
}

export async function getLease(id) {
    const [lease] = await poolConnection.query(
        `
            SELECT * FROM leases
            WHERE id = ?
        `, 
        [id]
        )

    if (lease.length < 1) {
        return "Lease not Found";
    }

    return lease[0]
}


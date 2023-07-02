import express from "express";
export const leaseRouter = express();
import { registerLease, updateLease, getLeases, getUserLease } from "../services/lease.js";

leaseRouter.post('/leases', async (req, res) => {
    const userId = req.body.userId
    const nationalId = req.body.nationalId
    const dateOfBirth = req.body.dateOfBirth
    const occupation = req.body.occupation
    const periodEmployedInMonths = req.body.periodEmployedInMonths
    const employerName = req.body.employerName
    const salary = req.body.salary
    const businessAddress = req.body.businessAddress
    const phoneNumber = req.body.phoneNumber
    const currentHomeAddress = req.body.currentHomeAddress
    const homePhoneNumber = req.body.homePhoneNumber
    const familySize = req.body.familySize
    const nextOfKin = req.body.nextOfKin
    const nextOfKinPhoneNumber = req.body.nextOfKinPhoneNumber
    const nextOfKinAddress = req.body.nextOfKinAddress
    const signature = req.body.signature
 
    const query = await registerLease(
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
    )
    res.send(query)
})

leaseRouter.put('/leases/:id', async (req, res) => {
    const occupation = req.body.occupation
    const periodEmployedInMonths = req.body.periodEmployedInMonths
    const employerName = req.body.employerName
    const salary = req.body.salary
    const businessAddress = req.body.businessAddress
    const phoneNumber = req.body.phoneNumber
    const currentHomeAddress = req.body.currentHomeAddress
    const homePhoneNumber = req.body.homePhoneNumber
    const familySize = req.body.familySize
    const nextOfKin = req.body.nextOfKin
    const nextOfKinPhoneNumber = req.body.nextOfKinPhoneNumber
    const nextOfKinAddress = req.body.nextOfKinAddress

    const leaseId = req.params.id
 
    const query = await updateLease(
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
        nextOfKinAddress,
    )
    res.send(query)
})

leaseRouter.get('/leases', async (req, res) => {
    const query = await getLeases()
    res.send(query)
})

leaseRouter.get('/leases/:id', async (req, res) => {
    const id = req.params.id
    const query = await getUserLease(id)
    if (query == "Lease not Found") {
        res.status(110);
    }

    res.send(query)
})

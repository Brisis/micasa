import express from "express";
export const propertyRouter = express();
import { registerProperty, getProperties, getProperty } from "../services/property.js";

propertyRouter.post('/properties', async (req, res) => {
    const name = req.body.name
    const locationId = req.body.locationId
    const description = req.body.description
    const amenities = req.body.amenities
    const category = req.body.category
    const price = req.body.price
    const status = req.body.status
    const purpose = req.body.purpose
 
    const query = await registerProperty(
        name,
        locationId,
        description,
        amenities,
        category,
        price,
        status,
        purpose
    )
    res.send(query)
})

propertyRouter.get('/properties', async (req, res) => {
    const query = await getProperties()
    res.send(query)
})
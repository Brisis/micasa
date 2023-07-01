import express from "express";
export const locationRouter = express();
import { registerLocation, getLocations, getLocation } from "../services/location.js";

locationRouter.post('/locations', async (req, res) => {
    const name = req.body.name
    const map_coordinates = req.body.map_coordinates
 
    const query = await registerLocation(name, map_coordinates)
    res.send(query)
})

locationRouter.get('/locations', async (req, res) => {
    const query = await getLocations()
    res.send(query)
})

locationRouter.get('/locations/:id', async (req, res) => {
    const id = req.params.id
    const query = await getLocation(id)
    res.send(query)
})
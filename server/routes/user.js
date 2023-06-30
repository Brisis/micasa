import express from "express";
export const userRouter = express();
import { getUsers, updateUser } from "../services/user.js";

userRouter.put('/users', async (req, res) => {
    const name = req.body.name
    const map_coordinates = req.body.map_coordinates
 
    const query = await updateUser(name, map_coordinates)
    res.send(query)
})

userRouter.get('/users', async (req, res) => {
    const query = await getUsers()
    res.send(query)
})
import express from "express";
export const authRouter = express();
import { signupValidation, loginValidation } from "../services/auth/validation.js";
import { getUser, loginUser, registerUser } from "../services/auth/authentication.js";

authRouter.post('/register', signupValidation, async (req, res) => {
    const name = req.body.name
    const email = req.body.email
    const password = req.body.password
 
    const query = await registerUser(name, email, password)
    res.send(query)
})

authRouter.post('/login', loginValidation, async (req, res) => {
    const email = req.body.email
    const password = req.body.password
 
    const query = await loginUser(email, password)
    res.send(query)
})

authRouter.post('/authenticate', signupValidation, async (req, res) => {
    const authorization = req.headers.authorization

    if (
        !authorization ||
        !authorization.startsWith("Bearer") ||
        !authorization.split(" ")[1]
      ) {
        return res.status(422).send("Please provide the token");
    }
 
    const query = await getUser(authorization)
    res.send(query)
})
import express from 'express'
import { authRouter } from './routes/auth.js'
import cors from "cors"
import pkg from 'body-parser';
import { locationRouter } from './routes/location.js';
import { propertyRouter } from './routes/property.js';
import { userRouter } from './routes/user.js';
const bodyParser  = pkg;

const app = express()
app.use(express.json())

app.use(bodyParser.json());
 
app.use(bodyParser.urlencoded({
    extended: true
}));
 
app.use(cors());

app.use('/api', authRouter);
app.use('/api', locationRouter);
app.use('/api', propertyRouter);
app.use('/api', userRouter);

// app.get('/notes/:id', async (req, res) => {
//     const id = req.params.id
//     const note = await getNote(id)
//     res.send(note)
// })

// app.post('/notes', async (req, res) => {
//     const {title, contents} = req.body
//     const note = await createNote(title, contents)
//     res.status(201).send(note)
// })

app.use((err, req, res, next) => {
    console.error(err.stack)
    res.status(500).send('Something broke!')
})

app.listen(8000, () => {
    console.log('Server is running on port 8080');
})
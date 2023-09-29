import express from "express";
import cors from "cors";

const app = express()
const port = 8000

app.use(cors())
app.use(express.json())
app.use(express.urlencoded({ extended: true }))

app.listen(port, () => {
    console.log("Listening on port ", port);
})
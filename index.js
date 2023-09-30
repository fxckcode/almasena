import express from "express";
import cors from "cors";
import authRouter from './src/routes/auth.routes.js'
import usersRouter from './src/routes/users.routes.js'
import elementsRouter from './src/routes/elements.routes.js'
import { isAdmin, isAuthenticated } from "./src/middlewares.js";
const app = express()
const port = 8000

app.use(cors())
app.use(express.json())
app.use(express.urlencoded({ extended: true }))

app.use("/auth", authRouter)
app.use("/", usersRouter)
app.use("/", isAuthenticated, elementsRouter)

app.listen(port, () => {
    console.log("Listening on port ", port);
})
import { Router } from 'express'
import { createUserByNameAndEmailAndPassword, findUserByEmail } from '../services/users.service.js';
import { createToken } from '../services/auth.service.js';

const router = Router()

router.post('/register', async (req, res, next) => {
    try {
        const { name, email, password, id } = req.body;
        if (!name || !email || !password) {
            res.status(400)
            throw new Error("You must provide an email and a password.")
        }

        const existingUser = await findUserByEmail(email)

        if (existingUser) {
            res.status(400)
            throw new Error("Email already in use.")
        }

        const user = await createUserByNameAndEmailAndPassword({name, email, password, id})
        const token = createToken(user)

        res.json({
            token
        })
        

    } catch (error) {
        next(error)
    }
})

export default router
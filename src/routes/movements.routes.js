import { Router } from 'express'
import { getMovements, createMovement, getMovementById, updateMovementById } from '../services/movements.service'
const router = Router()

router.get("/movements", async (req, res, next) => {
    try {
        const movements = await getMovements()
        res.json(movements)
    } catch (error) {
        next(error)
    }
})

router.post("/movements", async (req, res, next) => {
    try {
        const data = req.body;
        const movement = await createMovement(data)
        res.json(movement)
    } catch (error) {
        next(error)
    }
})

router.get("/movements/:id", async (req, res, next) => {
    try {
        const { id } = req.params
        const movement = await getMovementById(id)
        res.json(movement)
    } catch (error) {
        next(error)
    }
})

router.put("/movements/:id", async (req, res, next) => {
    try {
        const { id } = req.params
        const data = req.body
        const movement = await updateMovementById(id, data)
        res.json(movement)
    } catch (error) {
        next(error)
    }
})

export default router
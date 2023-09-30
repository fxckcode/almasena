import { Router } from 'express'
import prisma from '../../utils/prisma.js'
const router = Router()


router.get("/elements", async (req, res, next) => {
    try {
        const elements = await prisma.elements.findMany()
        res.json(elements)
    } catch (error) {
        next(error)
    }
})

router.post("/elements", async (req, res, next) => {
    try {
        const element = req.body;

        const newElement = await prisma.elements.create({
            data: {
                ...element
            }
        })

        res.json(newElement)

    } catch (error) {
        next(error)
    }
})

router.get("/elements/:id", async (req, res, next) => {
    try {
        const { id } = req.params;

        const element = await prisma.elements.findUnique({
            where: {
                id: parseInt(id)
            }
        })

        res.json(element)
    } catch (error) {
        next(error)
    }
})


router.put("/elements/:id", async (req, res, next) => {
    try {
        const { id } = req.params;
        const data = req.body;
        const updateElement = await prisma.elements.update({
            where: {
                id: parseInt(id)
            }, data: {
                ...data
            }
        })

        res.json(updateElement)
    } catch (error) {
        next(error)
    }
})

router.delete("/elements/:id", async (req, res, next) => {
    try {
        const { id } = req.params;
        await prisma.elements.delete({
            where: {
                id: parseInt(id)
            }
        })

        res.status(201).send({ message: 'Delete element!'})
    } catch (error) {
        next(error)
    }
})

export default router
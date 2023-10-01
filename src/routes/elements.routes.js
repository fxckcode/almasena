import { Router } from 'express'
import { createElement, deleteElement, findElementById, getElements, updateElementById } from '../services/elements.service.js'
const router = Router()


router.get("/elements", async (req, res, next) => {
    try {
        const elements = await getElements()
        res.json(elements)
    } catch (error) {
        next(error)
    }
})

router.post("/elements", async (req, res, next) => {
    try {
        const element = req.body;

        const newElement = await createElement(element)

        res.json(newElement)

    } catch (error) {
        next(error)
    }
})

router.get("/elements/:id", async (req, res, next) => {
    try {
        const { id } = req.params;

        const element = await findElementById(id)

        res.json(element)
    } catch (error) {
        next(error)
    }
})


router.put("/elements/:id", async (req, res, next) => {
    try {
        const { id } = req.params;
        const data = req.body;
        const updateElement = await updateElementById(id, data)

        res.json(updateElement)
    } catch (error) {
        next(error)
    }
})

router.delete("/elements/:id", async (req, res, next) => {
    try {
        const { id } = req.params;
        await deleteElement(id)

        res.status(201).send({ message: 'Delete element!'})
    } catch (error) {
        next(error)
    }
})

export default router
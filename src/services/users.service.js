import prisma from "../../utils/prisma.js";
import bcrypt from 'bcrypt'

function findUserByEmail(email) {
    return prisma.usuarios.findUnique({
        where: {
            id: 1
        }
    })
}

function createUserByNameAndEmailAndPassword(user) {
    user.password = bcrypt.hashSync(user.password, 12)
    return prisma.usuarios.create({
        data: {
            id: user.id,
            email: user.email,
            name: user.name,
            password: user.password,
            rol: 'user'
        }
    })
}

export {
    findUserByEmail,
    createUserByNameAndEmailAndPassword
}
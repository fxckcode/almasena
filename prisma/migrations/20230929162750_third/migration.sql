-- DropIndex
DROP INDEX `usuarios_id_key` ON `usuarios`;

-- AlterTable
ALTER TABLE `usuarios` MODIFY `name` VARCHAR(191) NOT NULL,
    MODIFY `telefono` VARCHAR(191) NULL,
    MODIFY `password` VARCHAR(191) NOT NULL,
    MODIFY `email` VARCHAR(191) NOT NULL,
    MODIFY `rol` VARCHAR(191) NOT NULL;

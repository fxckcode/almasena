/*
  Warnings:

  - You are about to drop the column `telefono` on the `users` table. All the data in the column will be lost.
  - You are about to alter the column `rol` on the `users` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Enum(EnumId(0))`.

*/
-- AlterTable
ALTER TABLE `users` DROP COLUMN `telefono`,
    ADD COLUMN `phone` VARCHAR(191) NULL,
    MODIFY `rol` ENUM('user', 'admin') NOT NULL DEFAULT 'user';

-- CreateTable
CREATE TABLE `elements` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `brand` VARCHAR(191) NOT NULL,
    `color` VARCHAR(191) NOT NULL,
    `stock` INTEGER NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `state` ENUM('active', 'inactive') NOT NULL DEFAULT 'active',

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

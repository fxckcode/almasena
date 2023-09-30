/*
  Warnings:

  - Added the required column `id_categorie` to the `elements` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `elements` ADD COLUMN `id_categorie` INTEGER NOT NULL,
    MODIFY `brand` VARCHAR(191) NULL,
    MODIFY `color` VARCHAR(191) NULL,
    MODIFY `stock` INTEGER NOT NULL DEFAULT 0,
    MODIFY `description` VARCHAR(191) NULL;

-- CreateTable
CREATE TABLE `categories` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `elements` ADD CONSTRAINT `elements_id_categorie_fkey` FOREIGN KEY (`id_categorie`) REFERENCES `categories`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

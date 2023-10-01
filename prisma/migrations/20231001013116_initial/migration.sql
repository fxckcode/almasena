-- CreateTable
CREATE TABLE `users` (
    `id` INTEGER NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `rol` ENUM('user', 'admin') NOT NULL DEFAULT 'user',
    `phone` VARCHAR(191) NULL,

    UNIQUE INDEX `users_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `elements` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `brand` VARCHAR(191) NULL,
    `color` VARCHAR(191) NULL,
    `stock` INTEGER NOT NULL DEFAULT 0,
    `description` VARCHAR(191) NULL,
    `state` ENUM('active', 'inactive') NOT NULL DEFAULT 'active',
    `id_categorie` INTEGER NOT NULL,
    `id_size` INTEGER NOT NULL,

    INDEX `elements_id_categorie_fkey`(`id_categorie`),
    INDEX `elements_id_size_fkey`(`id_size`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `categories` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sizes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `elements` ADD CONSTRAINT `elements_id_categorie_fkey` FOREIGN KEY (`id_categorie`) REFERENCES `categories`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `elements` ADD CONSTRAINT `elements_id_size_fkey` FOREIGN KEY (`id_size`) REFERENCES `sizes`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

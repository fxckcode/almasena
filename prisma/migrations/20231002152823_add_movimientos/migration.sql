-- CreateTable
CREATE TABLE `movements` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `sheet` INTEGER NOT NULL,
    `date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `description` VARCHAR(191) NOT NULL,
    `id_user` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `details_movements` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_movement` INTEGER NOT NULL,
    `id_element` INTEGER NOT NULL,
    `cant` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `movements` ADD CONSTRAINT `movements_id_user_fkey` FOREIGN KEY (`id_user`) REFERENCES `users`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `details_movements` ADD CONSTRAINT `details_movements_id_element_fkey` FOREIGN KEY (`id_element`) REFERENCES `elements`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `details_movements` ADD CONSTRAINT `details_movements_id_movement_fkey` FOREIGN KEY (`id_movement`) REFERENCES `movements`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

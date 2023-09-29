-- CreateTable
CREATE TABLE `carrito` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `fk_elemento` INTEGER NULL,

    INDEX `fkElemento`(`fk_elemento`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `categorias` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(32) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `elementos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `fk_categoria` INTEGER NOT NULL,
    `fk_talla` INTEGER NOT NULL,
    `elemento` VARCHAR(50) NOT NULL,
    `marca` VARCHAR(50) NOT NULL,
    `color` VARCHAR(10) NOT NULL,
    `existencias` INTEGER NOT NULL,
    `observacion` VARCHAR(500) NOT NULL,
    `estado` ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    INDEX `fkCategoria`(`fk_categoria`),
    INDEX `idTipo`(`fk_talla`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `movimiento` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `tipo_movimiento` ENUM('salida', 'entrada') NOT NULL,
    `tomador` INTEGER NOT NULL,
    `elemento` INTEGER NOT NULL,
    `ficha` INTEGER NOT NULL,
    `cantidad` INTEGER NOT NULL,
    `observacion` TEXT NOT NULL,
    `fecha` DATE NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    INDEX `elemento`(`elemento`),
    INDEX `elemento_2`(`elemento`),
    INDEX `tomador`(`tomador`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tallas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `tallas` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `usuarios` (
    `id` INTEGER NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `telefono` VARCHAR(15) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    `email` VARCHAR(50) NOT NULL,
    `rol` VARCHAR(10) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `carrito` ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`fk_elemento`) REFERENCES `elementos`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `elementos` ADD CONSTRAINT `elementos_ibfk_1` FOREIGN KEY (`fk_talla`) REFERENCES `tallas`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `elementos` ADD CONSTRAINT `elementos_ibfk_2` FOREIGN KEY (`fk_categoria`) REFERENCES `categorias`(`id`) ON DELETE CASCADE ON UPDATE RESTRICT;

-- AddForeignKey
ALTER TABLE `movimiento` ADD CONSTRAINT `movimiento_ibfk_1` FOREIGN KEY (`tomador`) REFERENCES `usuarios`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `movimiento` ADD CONSTRAINT `movimiento_ibfk_2` FOREIGN KEY (`elemento`) REFERENCES `elementos`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

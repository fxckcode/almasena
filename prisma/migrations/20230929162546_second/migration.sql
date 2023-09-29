/*
  Warnings:

  - You are about to drop the `carrito` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `categorias` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `elementos` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `movimiento` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `tallas` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `carrito` DROP FOREIGN KEY `carrito_ibfk_1`;

-- DropForeignKey
ALTER TABLE `elementos` DROP FOREIGN KEY `elementos_ibfk_1`;

-- DropForeignKey
ALTER TABLE `elementos` DROP FOREIGN KEY `elementos_ibfk_2`;

-- DropForeignKey
ALTER TABLE `movimiento` DROP FOREIGN KEY `movimiento_ibfk_1`;

-- DropForeignKey
ALTER TABLE `movimiento` DROP FOREIGN KEY `movimiento_ibfk_2`;

-- DropTable
DROP TABLE `carrito`;

-- DropTable
DROP TABLE `categorias`;

-- DropTable
DROP TABLE `elementos`;

-- DropTable
DROP TABLE `movimiento`;

-- DropTable
DROP TABLE `tallas`;

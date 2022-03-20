/*
  Warnings:

  - Made the column `is_stock` on table `product` required. This step will fail if there are existing NULL values in that column.
  - Made the column `id_cat1` on table `product` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE `product` DROP FOREIGN KEY `fk_product_category01`;

-- AlterTable
ALTER TABLE `product` MODIFY `is_stock` TINYINT NOT NULL DEFAULT 0,
    MODIFY `id_cat1` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `user` MODIFY `password` VARCHAR(400) NOT NULL;

-- AddForeignKey
ALTER TABLE `product` ADD CONSTRAINT `fk_product_category01` FOREIGN KEY (`id_cat1`) REFERENCES `product_category`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

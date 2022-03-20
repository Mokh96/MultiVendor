/*
  Warnings:

  - You are about to drop the column `userId` on the `brand` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[aff_by]` on the table `user` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[modifed_by]` on the table `user` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id_admin]` on the table `vendor` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id_customer]` on the table `wishlist` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE `brand` DROP FOREIGN KEY `fk_brand_user02`;

-- DropForeignKey
ALTER TABLE `brand` DROP FOREIGN KEY `brand_userId_fkey`;

-- AlterTable
ALTER TABLE `brand` DROP COLUMN `userId`;

-- CreateIndex
CREATE UNIQUE INDEX `user_aff_by_key` ON `user`(`aff_by`);

-- CreateIndex
CREATE UNIQUE INDEX `user_modifed_by_key` ON `user`(`modifed_by`);

-- CreateIndex
CREATE UNIQUE INDEX `vendor_id_admin_key` ON `vendor`(`id_admin`);

-- CreateIndex
CREATE UNIQUE INDEX `wishlist_id_customer_key` ON `wishlist`(`id_customer`);

-- AddForeignKey
ALTER TABLE `brand` ADD CONSTRAINT `brand_modified_by_fkey` FOREIGN KEY (`modified_by`) REFERENCES `user`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

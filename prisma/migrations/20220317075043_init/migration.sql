/*
  Warnings:

  - You are about to drop the column `name` on the `product` table. All the data in the column will be lost.
  - Added the required column `name1` to the `product` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `brand` DROP FOREIGN KEY `fk_brand_user01`;

-- AlterTable
ALTER TABLE `brand` ADD COLUMN `userId` INTEGER NULL;

-- AlterTable
ALTER TABLE `product` DROP COLUMN `name`,
    ADD COLUMN `name1` VARCHAR(100) NOT NULL;

-- AddForeignKey
ALTER TABLE `brand` ADD CONSTRAINT `brand_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `brand` ADD CONSTRAINT `brand_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

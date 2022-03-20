/*
  Warnings:

  - A unique constraint covering the columns `[username]` on the table `user` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `username` to the `user` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `user` ADD COLUMN `username` VARCHAR(100) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `user_username_key` ON `user`(`username`);

-- RenameIndex
ALTER TABLE `brand` RENAME INDEX `fk_brand_user01_idx` TO `fk_brand_user_idx`;

-- RenameIndex
ALTER TABLE `brand` RENAME INDEX `fk_brand_user02_idx` TO `fk_brand_user_idx2`;

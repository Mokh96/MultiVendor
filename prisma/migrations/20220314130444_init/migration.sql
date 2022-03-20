-- CreateTable
CREATE TABLE `brand` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(145) NOT NULL,
    `image` VARCHAR(255) NULL,
    `icon_img` VARCHAR(255) NULL,
    `slug` VARCHAR(145) NOT NULL,
    `description` VARCHAR(255) NULL,
    `created_by` INTEGER NOT NULL,
    `created_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `modified_by` INTEGER NULL,
    `modified_at` DATETIME(0) NULL,

    INDEX `fk_brand_user01_idx`(`created_by`),
    INDEX `fk_brand_user02_idx`(`modified_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `city` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `zipcode` VARCHAR(10) NOT NULL,
    `citycol` VARCHAR(45) NULL,
    `id_country` INTEGER NULL,

    INDEX `fk_city_country_idx`(`id`),
    INDEX `fk_city_country_idx1`(`id_country`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `complaint` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_customer` INTEGER NOT NULL,
    `id_vendor` INTEGER NOT NULL,
    `by_customer` TINYINT NULL,
    `title` VARCHAR(255) NULL,
    `message` VARCHAR(1000) NOT NULL,
    `created_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `fk_complaint_customer_idx`(`id_customer`),
    INDEX `fk_complaint_vendor_idx`(`id_vendor`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `country` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(155) NULL,
    `flag_img` VARCHAR(255) NULL,
    `iso_code` VARCHAR(5) NULL,
    `phone_code` VARCHAR(5) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `currency` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `code` VARCHAR(10) NOT NULL,
    `symbol` VARCHAR(5) NOT NULL,
    `change_rate` DOUBLE NULL,
    `is_default` TINYINT NOT NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customer_category` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(145) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `discount` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `cupon` VARCHAR(45) NULL,
    `value` INTEGER NOT NULL,
    `type` INTEGER NOT NULL,
    `date_start` DATETIME(0) NOT NULL,
    `date_end` DATETIME(0) NOT NULL,
    `state` INTEGER NOT NULL DEFAULT 1,
    `id_category_customer` INTEGER NULL,
    `id_product` INTEGER NULL,
    `id_vendor` INTEGER NULL,
    `id_customer` INTEGER NULL,
    `id_category_product` INTEGER NULL,
    `max_value` VARCHAR(45) NULL,
    `is_use_once` TINYINT NULL,
    `qte` INTEGER NULL,

    INDEX `fk_discount_customer_idx`(`id_customer`),
    INDEX `fk_discount_product_cateegory_idx`(`id_category_product`),
    INDEX `fk_discount_product_idx`(`id_product`),
    INDEX `fk_discount_vendor_idx`(`id_vendor`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `feedback` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `comment` VARCHAR(255) NOT NULL,
    `rating` DOUBLE NOT NULL,
    `image` VARCHAR(255) NULL,
    `id_customer` INTEGER NULL,
    `id_order` INTEGER NULL,
    `id_vendor` INTEGER NULL,
    `id_product` INTEGER NULL,
    `created_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `fk_feedback_customer_idx`(`id_customer`),
    INDEX `fk_feedback_order_idx`(`id_order`),
    INDEX `fk_feedback_vendor_idx`(`id_vendor`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `lang` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `description` VARCHAR(255) NULL,
    `code` VARCHAR(10) NOT NULL,
    `flag` VARCHAR(255) NULL,
    `is_extra_id` INTEGER NULL,
    `file` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `medal` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(145) NOT NULL,
    `icon_img` VARCHAR(255) NULL,
    `image` VARCHAR(255) NULL,
    `condition` VARCHAR(1000) NOT NULL,
    `created_by` INTEGER NOT NULL,
    `created_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `modified_by` INTEGER NULL,
    `modified_at` DATETIME(0) NULL,

    INDEX `fk_medal_admin_idx`(`created_by`),
    INDEX `fk_medal_user_idx`(`modified_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `option_item` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `color` VARCHAR(45) NULL,
    `price` INTEGER NOT NULL,
    `image` VARCHAR(255) NULL,
    `id_option` INTEGER NULL,

    INDEX `fk_option_item_option_product_idx`(`id_option`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `state` INTEGER NOT NULL DEFAULT 1,
    `total_price` INTEGER NOT NULL,
    `total_promo_price` INTEGER NOT NULL DEFAULT 0,
    `total_with_promo` INTEGER NOT NULL,
    `total_shipping` INTEGER NULL,
    `total_tax` INTEGER NULL,
    `total_amount` INTEGER NULL,
    `website_comission` INTEGER NULL,
    `customer_name` VARCHAR(255) NULL,
    `customer_country` VARCHAR(45) NULL,
    `customer_phone` VARCHAR(45) NULL,
    `customer_email` VARCHAR(45) NULL,
    `comment` VARCHAR(255) NULL,
    `id_customer` INTEGER NULL,
    `id_vendor` INTEGER NULL,
    `created_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `Finished_at` DATETIME(0) NULL,

    INDEX `fk_order_customer_idx`(`id_customer`),
    INDEX `fk_order_vendor_idx`(`id_vendor`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `order_item` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `product_name` VARCHAR(255) NOT NULL,
    `quantity` INTEGER NOT NULL,
    `price` INTEGER NOT NULL,
    `total_price` INTEGER NOT NULL,
    `comment` VARCHAR(255) NULL,
    `id_product` INTEGER NULL,
    `id_order` INTEGER NULL,

    INDEX `fk_order_item_order_idx`(`id_order`),
    INDEX `fk_order_item_product_idx`(`id_product`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `page` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(145) NULL,
    `subtitle` VARCHAR(145) NULL,
    `slug` VARCHAR(145) NOT NULL,
    `content_html` TEXT NOT NULL,
    `created_by` INTEGER NOT NULL,
    `created_at` DATETIME(0) NULL,
    `modified_by` INTEGER NULL,
    `modified_at` DATETIME(0) NULL,

    INDEX `fk_page_user01_idx`(`created_by`),
    INDEX `fk_page_user02_idx`(`modified_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `parametres` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `homepage_json` TEXT NULL,
    `product_json` TEXT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `image` VARCHAR(255) NULL,
    `sku` VARCHAR(45) NULL,
    `slug` VARCHAR(145) NOT NULL,
    `weight` VARCHAR(45) NULL,
    `length` VARCHAR(45) NULL,
    `width` VARCHAR(45) NULL,
    `height` VARCHAR(45) NULL,
    `short_description` VARCHAR(255) NULL,
    `long_description` TEXT NULL,
    `price` INTEGER NOT NULL,
    `promo` INTEGER NOT NULL DEFAULT 0,
    `wholesale_price` INTEGER NOT NULL,
    `initial_quantity` INTEGER NOT NULL DEFAULT 0,
    `quantity` INTEGER NOT NULL DEFAULT 0,
    `is_stock` TINYINT NULL,
    `state` INTEGER NOT NULL DEFAULT 1,
    `id_vendor` INTEGER NULL,
    `id_brand` INTEGER NULL,
    `id_cat1` INTEGER NULL,
    `id_cat2` INTEGER NULL,
    `id_cat3` INTEGER NULL,
    `id_cat_store` INTEGER NULL,
    `created_by` INTEGER NOT NULL,
    `created_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `modified_by` INTEGER NULL,
    `modified_at` DATETIME(0) NULL,

    INDEX `fk_product_brand_idx`(`id_brand`),
    INDEX `fk_product_category01_idx`(`id_cat1`),
    INDEX `fk_product_category02_idx`(`id_cat2`),
    INDEX `fk_product_category03_idx`(`id_cat3`),
    INDEX `fk_product_category_store_idx`(`id_cat_store`),
    INDEX `fk_product_user01_idx`(`created_by`),
    INDEX `fk_product_user02_idx`(`modified_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_category` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(145) NOT NULL,
    `image` VARCHAR(255) NULL,
    `icon_img` VARCHAR(255) NULL,
    `slug` VARCHAR(145) NOT NULL,
    `desciption` VARCHAR(500) NULL,
    `created_by` INTEGER NOT NULL,
    `created_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `modified_by` INTEGER NULL,
    `modified_at` DATETIME(0) NULL,

    INDEX `fk_product_category_admin01_idx`(`created_by`),
    INDEX `fk_product_category_admin02_idx`(`modified_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_gallery` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `image` VARCHAR(255) NOT NULL,
    `id_product` INTEGER NOT NULL,

    INDEX `fk_product_gallery_product_idx`(`id_product`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_option` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `is_multi` TINYINT NULL,
    `is_required` TINYINT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `province` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `id_country` INTEGER NULL,
    `Provincecol` VARCHAR(45) NULL,

    INDEX `fk_province_country_idx`(`id_country`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `response` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `message` VARCHAR(255) NOT NULL,
    `id_complaint` INTEGER NOT NULL,
    `id_admin` INTEGER NOT NULL,
    `id_user` INTEGER NOT NULL,
    `created_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),

    INDEX `fk_response_admin_idx`(`id_admin`),
    INDEX `fk_response_complaint_idx`(`id_complaint`),
    INDEX `fk_response_user_idx`(`id_user`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `store_category` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `id_vendor` INTEGER NULL,

    INDEX `fk_store_category_vendor_idx`(`id_vendor`),
    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `translation` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name_ar` VARCHAR(255) NULL,
    `name_fr` VARCHAR(255) NULL,
    `name_en` VARCHAR(255) NULL,
    `name_de` VARCHAR(255) NULL,
    `name_it` VARCHAR(255) NULL,
    `name_ch` VARCHAR(255) NULL,
    `name_jp` VARCHAR(255) NULL,
    `name_kr` VARCHAR(255) NULL,
    `name_es` VARCHAR(255) NULL,
    `name_extra_1` VARCHAR(255) NULL,
    `name_extra_2` VARCHAR(255) NULL,
    `name_extra_3` VARCHAR(255) NULL,
    `id_object` INTEGER NULL,
    `type` VARCHAR(45) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `last_name` VARCHAR(100) NOT NULL,
    `first_name` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(15) NULL,
    `password` VARCHAR(45) NOT NULL,
    `password_salt` VARCHAR(45) NULL,
    `email` VARCHAR(45) NULL,
    `adresse` VARCHAR(155) NULL,
    `adresse2` VARCHAR(155) NULL,
    `aff_code` VARCHAR(45) NULL,
    `aff_by` INTEGER NULL,
    `type` INTEGER NULL,
    `is_active` TINYINT NOT NULL DEFAULT 1,
    `is_confirmed_email` TINYINT NULL,
    `is_confirmed_phone` TINYINT NULL,
    `id_customer_category` INTEGER NULL,
    `created_at` DATETIME(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
    `modifed_by` INTEGER NULL,
    `modified_at` DATETIME(0) NULL,

    UNIQUE INDEX `aff_code_UNIQUE`(`aff_code`),
    INDEX `fk_user_affuser_idx`(`aff_by`),
    INDEX `fk_user_modify_user_idx`(`modifed_by`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user_medal` (
    `id_user` INTEGER NOT NULL AUTO_INCREMENT,
    `id_medal` INTEGER NULL,
    `expiry` DATETIME(0) NOT NULL,
    `is_active` TINYINT NULL,

    INDEX `fk_user_medal_idx`(`id_medal`),
    PRIMARY KEY (`id_user`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `vendor` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `slug` VARCHAR(45) NOT NULL,
    `short_description` VARCHAR(150) NULL,
    `long_description` TEXT NULL,
    `phone1` VARCHAR(15) NULL,
    `phone2` VARCHAR(15) NULL,
    `phone3` VARCHAR(15) NULL,
    `email` VARCHAR(45) NULL,
    `website` VARCHAR(45) NULL,
    `icon_img` VARCHAR(255) NULL,
    `cover_img` VARCHAR(255) NULL,
    `social_fb` VARCHAR(145) NULL,
    `social_yt` VARCHAR(145) NULL,
    `social_tw` VARCHAR(145) NULL,
    `social_tk` VARCHAR(145) NULL,
    `social_ig` VARCHAR(145) NULL,
    `is_active` TINYINT NOT NULL DEFAULT 1,
    `is_page_visible` TINYINT NOT NULL DEFAULT 0,
    `is_product_visible` TINYINT NOT NULL DEFAULT 0,
    `is_maintenance` TINYINT NOT NULL DEFAULT 0,
    `id_admin` INTEGER NOT NULL,
    `id_vendor_category` INTEGER NULL,

    INDEX `fk_vendor_admin_idx`(`id_admin`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `vendor_category` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(145) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `wishlist` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `id_customer` INTEGER NOT NULL,
    `id_product` INTEGER NOT NULL,

    INDEX `fk_wishlist_customer_idx`(`id_customer`),
    INDEX `fk_wishlist_product_idx`(`id_product`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `brand` ADD CONSTRAINT `fk_brand_user01` FOREIGN KEY (`created_by`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `brand` ADD CONSTRAINT `fk_brand_user02` FOREIGN KEY (`modified_by`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `city` ADD CONSTRAINT `fk_city_country` FOREIGN KEY (`id_country`) REFERENCES `country`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `complaint` ADD CONSTRAINT `fk_complaint_customer` FOREIGN KEY (`id_customer`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `complaint` ADD CONSTRAINT `fk_complaint_vendor` FOREIGN KEY (`id_vendor`) REFERENCES `vendor`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `discount` ADD CONSTRAINT `fk_discount_product` FOREIGN KEY (`id_product`) REFERENCES `product`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `discount` ADD CONSTRAINT `fk_discount_product_cateegory` FOREIGN KEY (`id_category_product`) REFERENCES `product_category`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `discount` ADD CONSTRAINT `fk_discount_customer` FOREIGN KEY (`id_customer`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `discount` ADD CONSTRAINT `fk_discount_vendor` FOREIGN KEY (`id_vendor`) REFERENCES `vendor`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `feedback` ADD CONSTRAINT `fk_feedback_order` FOREIGN KEY (`id_order`) REFERENCES `order`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `feedback` ADD CONSTRAINT `fk_feedback_customer` FOREIGN KEY (`id_customer`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `feedback` ADD CONSTRAINT `fk_feedback_vendor` FOREIGN KEY (`id_vendor`) REFERENCES `vendor`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `medal` ADD CONSTRAINT `fk_medal_admin` FOREIGN KEY (`created_by`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `medal` ADD CONSTRAINT `fk_medal_user` FOREIGN KEY (`modified_by`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `option_item` ADD CONSTRAINT `fk_option_item_option_product` FOREIGN KEY (`id_option`) REFERENCES `product_option`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `order` ADD CONSTRAINT `fk_order_customer` FOREIGN KEY (`id_customer`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `order` ADD CONSTRAINT `fk_order_vendor` FOREIGN KEY (`id_vendor`) REFERENCES `vendor`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `order_item` ADD CONSTRAINT `fk_order_item_order` FOREIGN KEY (`id_order`) REFERENCES `order`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `order_item` ADD CONSTRAINT `fk_order_item_product` FOREIGN KEY (`id_product`) REFERENCES `product`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `page` ADD CONSTRAINT `fk_page_user01` FOREIGN KEY (`created_by`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `page` ADD CONSTRAINT `fk_page_user02` FOREIGN KEY (`modified_by`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `product` ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`id_brand`) REFERENCES `brand`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `product` ADD CONSTRAINT `fk_product_category01` FOREIGN KEY (`id_cat1`) REFERENCES `product_category`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `product` ADD CONSTRAINT `fk_product_category02` FOREIGN KEY (`id_cat2`) REFERENCES `product_category`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `product` ADD CONSTRAINT `fk_product_category03` FOREIGN KEY (`id_cat3`) REFERENCES `product_category`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `product` ADD CONSTRAINT `fk_product_category_store` FOREIGN KEY (`id_cat_store`) REFERENCES `store_category`(`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `product` ADD CONSTRAINT `fk_product_user01` FOREIGN KEY (`created_by`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `product` ADD CONSTRAINT `fk_product_user02` FOREIGN KEY (`modified_by`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `product_category` ADD CONSTRAINT `fk_product_category_admin01` FOREIGN KEY (`created_by`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `product_category` ADD CONSTRAINT `fk_product_category_admin02` FOREIGN KEY (`modified_by`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `product_gallery` ADD CONSTRAINT `fk_product_gallery_product` FOREIGN KEY (`id_product`) REFERENCES `product`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `province` ADD CONSTRAINT `fk_province_country` FOREIGN KEY (`id_country`) REFERENCES `country`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `response` ADD CONSTRAINT `fk_response_comlaint` FOREIGN KEY (`id_complaint`) REFERENCES `complaint`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `response` ADD CONSTRAINT `fk_response_admin` FOREIGN KEY (`id_admin`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `response` ADD CONSTRAINT `fk_response_user` FOREIGN KEY (`id_user`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `store_category` ADD CONSTRAINT `fk_store_category_vendor` FOREIGN KEY (`id_vendor`) REFERENCES `vendor`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `fk_user_affuser` FOREIGN KEY (`aff_by`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `fk_user_modify_user` FOREIGN KEY (`modifed_by`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `user_medal` ADD CONSTRAINT `fk_user_medal` FOREIGN KEY (`id_medal`) REFERENCES `medal`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `vendor` ADD CONSTRAINT `fk_vendor_admin` FOREIGN KEY (`id_admin`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `wishlist` ADD CONSTRAINT `fk_wishlist_product` FOREIGN KEY (`id_product`) REFERENCES `product`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `wishlist` ADD CONSTRAINT `fk_wishlist_customer` FOREIGN KEY (`id_customer`) REFERENCES `user`(`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

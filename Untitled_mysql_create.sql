CREATE TABLE `orders` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`address_id` INT NOT NULL,
	`sending_id` INT NOT NULL,
	`status_id` DATETIME NOT NULL,
	`created_at` DATETIME NOT NULL,
	`updated_at` DATETIME NOT NULL,
	`deleted_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `baskets_info` (
	`order_id` INT NOT NULL,
	`product_id` INT NOT NULL,
	`count` INT NOT NULL
);

CREATE TABLE `addresses` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL,
	`country_id` INT NOT NULL,
	`region_id` INT NOT NULL,
	`sity_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `statuses_log` (
	`order_id` INT NOT NULL,
	`status_id` INT NOT NULL,
	`started_at` DATETIME NOT NULL
);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`address_id`) REFERENCES `addresses`(`id`);

ALTER TABLE `baskets_info` ADD CONSTRAINT `baskets_info_fk0` FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`);

ALTER TABLE `statuses_log` ADD CONSTRAINT `statuses_log_fk0` FOREIGN KEY (`order_id`) REFERENCES `orders`(`id`);


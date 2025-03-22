-- -----------------------------------------------------
-- Schema railway
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `railway` DEFAULT CHARACTER SET utf8 ;
USE `railway` ;

-- -----------------------------------------------------
-- Table `railway`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `name` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(45) NULL,
  `role` VARCHAR(10) NULL,
  `is_active` CHAR(1) NULL DEFAULT 'Y',
  PRIMARY KEY (`id`))
;


-- -----------------------------------------------------
-- Table `railway`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway`.`items` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` VARCHAR(255) NULL,
  `price` INT NULL,
  `is_active` CHAR(1) NULL,
  PRIMARY KEY (`id`))
;


-- -----------------------------------------------------
-- Table `railway`.`stocks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway`.`stocks` (
  `id` INT NOT NULL,
  `size` VARCHAR(1) NULL,
  `number` INT NULL,
  `items_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_stocks_items_idx` (`items_id` ASC),
  CONSTRAINT `fk_stocks_items`
    FOREIGN KEY (`items_id`)
    REFERENCES `railway`.`items` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `railway`.`staffs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway`.`staffs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `is_active` CHAR(1) NULL,
  PRIMARY KEY (`id`))
;


-- -----------------------------------------------------
-- Table `railway`.`order_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway`.`order_details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `stocks_id` INT NOT NULL,
  `number_order` INT NULL,
  `price_per_item` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_details_stocks1_idx` (`stocks_id` ASC),
  CONSTRAINT `fk_order_details_stocks1`
    FOREIGN KEY (`stocks_id`)
    REFERENCES `railway`.`stocks` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `railway`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `railway`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_details_id` INT NOT NULL,
  `users_id` INT NOT NULL,
  `staffs_id` INT NOT NULL,
  `is_active` CHAR(1) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_users1_idx` (`users_id` ASC),
  INDEX `fk_orders_staffs1_idx` (`staffs_id` ASC),
  INDEX `fk_orders_order_details1_idx` (`order_details_id` ASC),
  CONSTRAINT `fk_orders_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `railway`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_staffs1`
    FOREIGN KEY (`staffs_id`)
    REFERENCES `railway`.`staffs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_order_details1`
    FOREIGN KEY (`order_details_id`)
    REFERENCES `railway`.`order_details` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
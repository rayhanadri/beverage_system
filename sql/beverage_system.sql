-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema beverage_system
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema beverage_system
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `beverage_system` DEFAULT CHARACTER SET utf8 ;
USE `beverage_system` ;

-- -----------------------------------------------------
-- Table `beverage_system`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beverage_system`.`users` (
  `id` INT ZEROFILL NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `name` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `password` VARCHAR(45) NULL,
  `role` VARCHAR(10) NULL,
  `is_active` CHAR(1) NULL DEFAULT 'Y',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beverage_system`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beverage_system`.`items` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` VARCHAR(255) NULL,
  `price` INT NULL,
  `is_active` CHAR(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beverage_system`.`stocks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beverage_system`.`stocks` (
  `id` INT NOT NULL,
  `size` VARCHAR(1) NULL,
  `number` INT NULL,
  `items_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_stocks_items_idx` (`items_id` ASC),
  CONSTRAINT `fk_stocks_items`
    FOREIGN KEY (`items_id`)
    REFERENCES `beverage_system`.`items` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beverage_system`.`staffs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beverage_system`.`staffs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `is_active` CHAR(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beverage_system`.`order_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beverage_system`.`order_details` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `stocks_id` INT NOT NULL,
  `number_order` INT NULL,
  `price_per_item` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_details_stocks1_idx` (`stocks_id` ASC),
  CONSTRAINT `fk_order_details_stocks1`
    FOREIGN KEY (`stocks_id`)
    REFERENCES `beverage_system`.`stocks` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beverage_system`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `beverage_system`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_details_id` INT NOT NULL,
  `users_id` INT ZEROFILL NOT NULL,
  `staffs_id` INT NOT NULL,
  `is_active` CHAR(1) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_users1_idx` (`users_id` ASC),
  INDEX `fk_orders_staffs1_idx` (`staffs_id` ASC),
  INDEX `fk_orders_order_details1_idx` (`order_details_id` ASC),
  CONSTRAINT `fk_orders_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `beverage_system`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_staffs1`
    FOREIGN KEY (`staffs_id`)
    REFERENCES `beverage_system`.`staffs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_order_details1`
    FOREIGN KEY (`order_details_id`)
    REFERENCES `beverage_system`.`order_details` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

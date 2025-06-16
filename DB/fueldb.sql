-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema fueldb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `fueldb` ;

-- -----------------------------------------------------
-- Schema fueldb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fueldb` DEFAULT CHARACTER SET utf8 ;
USE `fueldb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(47) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `email` VARCHAR(100) NULL,
  `enabled` TINYINT NOT NULL,
  `role` VARCHAR(46) NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `image_url` VARCHAR(2000) NULL,
  `biography` TEXT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `usernam_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(100) NULL,
  `street2` VARCHAR(100) NULL,
  `city` VARCHAR(43) NULL,
  `state` VARCHAR(2) NULL,
  `zip_code` CHAR(5) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gas_station`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gas_station` ;

CREATE TABLE IF NOT EXISTS `gas_station` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `address_id` INT NOT NULL,
  `image_url` VARCHAR(2000) NULL,
  `create_date` DATETIME NULL,
  `update_date` DATETIME NULL,
  `remarks` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_gas_station_address1_idx` (`address_id` ASC) VISIBLE,
  CONSTRAINT `fk_gas_station_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_favorite_gas_stations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_favorite_gas_stations` ;

CREATE TABLE IF NOT EXISTS `user_has_favorite_gas_stations` (
  `user_id` INT NOT NULL,
  `gas_station_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `gas_station_id`),
  INDEX `fk_user_has_gas_station_gas_station1_idx` (`gas_station_id` ASC) VISIBLE,
  INDEX `fk_user_has_gas_station_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_gas_station_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_gas_station_gas_station1`
    FOREIGN KEY (`gas_station_id`)
    REFERENCES `gas_station` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tag` ;

CREATE TABLE IF NOT EXISTS `tag` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(43) NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gas_station_has_tag`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gas_station_has_tag` ;

CREATE TABLE IF NOT EXISTS `gas_station_has_tag` (
  `gas_station_id` INT NOT NULL,
  `tag_id` INT NOT NULL,
  PRIMARY KEY (`gas_station_id`, `tag_id`),
  INDEX `fk_gas_station_has_tag_tag1_idx` (`tag_id` ASC) VISIBLE,
  INDEX `fk_gas_station_has_tag_gas_station1_idx` (`gas_station_id` ASC) VISIBLE,
  CONSTRAINT `fk_gas_station_has_tag_gas_station1`
    FOREIGN KEY (`gas_station_id`)
    REFERENCES `gas_station` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gas_station_has_tag_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `saved_address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `saved_address` ;

CREATE TABLE IF NOT EXISTS `saved_address` (
  `user_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  `enabled` TINYINT NOT NULL,
  `name` VARCHAR(44) NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  PRIMARY KEY (`user_id`, `address_id`),
  INDEX `fk_user_has_address_address1_idx` (`address_id` ASC) VISIBLE,
  INDEX `fk_user_has_address_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_has_address_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_address_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fuel_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fuel_type` ;

CREATE TABLE IF NOT EXISTS `fuel_type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(42) NULL,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `price_report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `price_report` ;

CREATE TABLE IF NOT EXISTS `price_report` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `price_per_gallon` DECIMAL(5,3) NOT NULL,
  `user_id` INT NOT NULL,
  `gas_station_id` INT NOT NULL,
  `fuel_type_id` INT NOT NULL,
  `enabled` TINYINT NOT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `remarks` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_price_report_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_price_report_gas_station1_idx` (`gas_station_id` ASC) VISIBLE,
  INDEX `fk_price_report_fuel_type1_idx` (`fuel_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_price_report_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_price_report_gas_station1`
    FOREIGN KEY (`gas_station_id`)
    REFERENCES `gas_station` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_price_report_fuel_type1`
    FOREIGN KEY (`fuel_type_id`)
    REFERENCES `fuel_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gas_station_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `gas_station_review` ;

CREATE TABLE IF NOT EXISTS `gas_station_review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rating` INT NULL,
  `comment` TEXT NULL,
  `create_date` DATETIME NULL,
  `last_update` DATETIME NULL,
  `gas_station_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_gas_station_review_gas_station1_idx` (`gas_station_id` ASC) VISIBLE,
  INDEX `fk_gas_station_review_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_gas_station_review_gas_station1`
    FOREIGN KEY (`gas_station_id`)
    REFERENCES `gas_station` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gas_station_review_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `report_vote`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `report_vote` ;

CREATE TABLE IF NOT EXISTS `report_vote` (
  `price_report_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `vote` TINYINT NOT NULL,
  `create_date` DATETIME NULL,
  PRIMARY KEY (`price_report_id`, `user_id`),
  INDEX `fk_price_report_has_user_user1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_price_report_has_user_price_report1_idx` (`price_report_id` ASC) VISIBLE,
  CONSTRAINT `fk_price_report_has_user_price_report1`
    FOREIGN KEY (`price_report_id`)
    REFERENCES `price_report` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_price_report_has_user_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS fueluser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'fueluser'@'localhost' IDENTIFIED BY 'fueluser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'fueluser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `fueldb`;
INSERT INTO `user` (`id`, `username`, `password`, `email`, `enabled`, `role`, `first_name`, `last_name`, `image_url`, `biography`, `create_date`, `last_update`) VALUES (1, 'test', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 'test@test.test', 1, 'admin', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `email`, `enabled`, `role`, `first_name`, `last_name`, `image_url`, `biography`, `create_date`, `last_update`) VALUES (2, 'miles', '$2a$10$Iuktd0XQOv.XO3J6iGmGn.ErR9GlL6CVg1ObqaGGvrkG40JbZ7ASK', 'miles@miles.miles', 1, 'standard', 'miles', 'porter', 'no', 'n/a', '2025:06:12', '2025:06:12');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `enabled`, `role`, `first_name`, `last_name`, `image_url`, `biography`, `create_date`, `last_update`) VALUES (3, 'mike', '$2a$10$NMM2vYSKpXttrXWw5k1pG.4IBNc4mEYufDULfGiqB7bVa4F0DXD.G', 'mike@mike.mike', 1, 'standard', 'mike', 'francavilla', 'yes', 'n/a', '2025:06:12', '2025:06:12');
INSERT INTO `user` (`id`, `username`, `password`, `email`, `enabled`, `role`, `first_name`, `last_name`, `image_url`, `biography`, `create_date`, `last_update`) VALUES (4, 'jay', '$2a$10$1zQ8gbQOf3zRFFhmzdAZoOfkQR5zn1EC8WVLwzdptd1grVnlPWAxO', 'jay@jay.jay', 1, 'standard', 'jay', 'yoon', 'maybe', 'n/a', '2025:06:12', '2025:06:12');

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `fueldb`;
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (1, '800 W Hampden Ave', NULL, 'Englewood', 'CO', '80110');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (2, '181 West Littleton Blvd', NULL, 'Littleton', 'CO', '80121');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (3, '10185 Park Meadows Dr', NULL, 'Lone Tree', 'CO', '80124');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (4, '900 Englewood Parkway', NULL, 'Englewood', 'CO', '80100');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (5, '6200 S Santa Fe Dr.', NULL, 'Littleton', 'CO', '80120');

COMMIT;


-- -----------------------------------------------------
-- Data for table `gas_station`
-- -----------------------------------------------------
START TRANSACTION;
USE `fueldb`;
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (1, 'Stinker', 1, 'https://a.mktgcdn.com/p/MOQBu9QL_-Z0jxH_p_eNZQrKkqVxrxFtMfg6sPjW-IE/1809x1809.png', '2025:06:12', '2025:06:12', 'Some remarks');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (2, 'Murphy USA', 2, 'https://www.scrapehero.com/store/wp-content/uploads/2020/11/Murphy_USA_USA.png', '2025:06:12', '2025:06:12', 'Other remarks');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (3, 'Shell', 5, 'https://northwoodsinnpickerel.com/wp-content/uploads/2016/03/Shell-gas-station-logo-trans.png', '2025:06:12', '2025:06:12', 'Even more remarks');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_has_favorite_gas_stations`
-- -----------------------------------------------------
START TRANSACTION;
USE `fueldb`;
INSERT INTO `user_has_favorite_gas_stations` (`user_id`, `gas_station_id`) VALUES (2, 1);
INSERT INTO `user_has_favorite_gas_stations` (`user_id`, `gas_station_id`) VALUES (3, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `fueldb`;
INSERT INTO `tag` (`id`, `name`, `description`, `image_url`) VALUES (1, 'EV Charger', NULL, NULL);
INSERT INTO `tag` (`id`, `name`, `description`, `image_url`) VALUES (2, 'Good Lighting', NULL, NULL);
INSERT INTO `tag` (`id`, `name`, `description`, `image_url`) VALUES (3, 'Free Air', NULL, NULL);
INSERT INTO `tag` (`id`, `name`, `description`, `image_url`) VALUES (4, 'Clean Bathrooms', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `gas_station_has_tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `fueldb`;
INSERT INTO `gas_station_has_tag` (`gas_station_id`, `tag_id`) VALUES (1, 1);
INSERT INTO `gas_station_has_tag` (`gas_station_id`, `tag_id`) VALUES (1, 2);
INSERT INTO `gas_station_has_tag` (`gas_station_id`, `tag_id`) VALUES (1, 3);
INSERT INTO `gas_station_has_tag` (`gas_station_id`, `tag_id`) VALUES (2, 1);
INSERT INTO `gas_station_has_tag` (`gas_station_id`, `tag_id`) VALUES (2, 2);
INSERT INTO `gas_station_has_tag` (`gas_station_id`, `tag_id`) VALUES (2, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `saved_address`
-- -----------------------------------------------------
START TRANSACTION;
USE `fueldb`;
INSERT INTO `saved_address` (`user_id`, `address_id`, `enabled`, `name`, `create_date`, `last_update`) VALUES (2, 3, 1, 'home', '2025:06:12', '2025:06:12');
INSERT INTO `saved_address` (`user_id`, `address_id`, `enabled`, `name`, `create_date`, `last_update`) VALUES (2, 4, 1, 'work', '2025:06:12', '2025:06:12');

COMMIT;


-- -----------------------------------------------------
-- Data for table `fuel_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `fueldb`;
INSERT INTO `fuel_type` (`id`, `name`, `image_url`) VALUES (1, 'Unleaded', NULL);
INSERT INTO `fuel_type` (`id`, `name`, `image_url`) VALUES (2, 'Plus', NULL);
INSERT INTO `fuel_type` (`id`, `name`, `image_url`) VALUES (3, 'Premium', NULL);
INSERT INTO `fuel_type` (`id`, `name`, `image_url`) VALUES (4, 'Diesel', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `price_report`
-- -----------------------------------------------------
START TRANSACTION;
USE `fueldb`;
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (1, 2.78, 2, 1, 1, 1, '2025:06:12', '2025:06:12', 'these prices stink');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (2, 2.77, 3, 2, 1, 1, '2025:06:12', '2025:06:12', 'these prices smell good');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (3, 2.88, 4, 3, 1, 1, '2025:06:12', '2025:06:12', 'very fragrant pricing');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (4, 2.81, 3, 1, 1, 1, '2025:06:14', '2025:06:14', 'this place DOES stink');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (5, 2.92, 3, 1, 2, 1, '2025:06:14', '2025:06:14', 'phew');

COMMIT;


-- -----------------------------------------------------
-- Data for table `gas_station_review`
-- -----------------------------------------------------
START TRANSACTION;
USE `fueldb`;
INSERT INTO `gas_station_review` (`id`, `rating`, `comment`, `create_date`, `last_update`, `gas_station_id`, `user_id`) VALUES (1, 4, 'this place stinks', '2025:06:12', '2025:06:12', 1, 2);
INSERT INTO `gas_station_review` (`id`, `rating`, `comment`, `create_date`, `last_update`, `gas_station_id`, `user_id`) VALUES (2, 5, 'i like the smell', '2025:06:12', '2025:06:12', 2, 3);
INSERT INTO `gas_station_review` (`id`, `rating`, `comment`, `create_date`, `last_update`, `gas_station_id`, `user_id`) VALUES (4, 3, 'this place doesnt smell like anything', '2025:06:12', '2025:06:12', 3, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `report_vote`
-- -----------------------------------------------------
START TRANSACTION;
USE `fueldb`;
INSERT INTO `report_vote` (`price_report_id`, `user_id`, `vote`, `create_date`) VALUES (2, 2, 0, '2025:06:12');
INSERT INTO `report_vote` (`price_report_id`, `user_id`, `vote`, `create_date`) VALUES (1, 3, 1, '2025:06:12');
INSERT INTO `report_vote` (`price_report_id`, `user_id`, `vote`, `create_date`) VALUES (3, 4, 1, '2025:06:12');

COMMIT;


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
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (3, '6200 S Santa Fe Dr.', NULL, 'Littleton', 'CO', '80120');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (4, '10200 Federal Blvd', NULL, 'Denver', 'CO', '80260');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (5, '1280 E Evans Ave', NULL, 'Denver', 'CO', '80210');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (6, '2797 S Monaco Pkwy', NULL, 'Denver', 'CO', '80222');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (7, '2995 W 26th Ave', NULL, 'Denver', 'CO', '80211');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (8, '3600 W 44th Ave', NULL, 'Denver', 'CO', '80211');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (9, '6130 E 14th Ave', NULL, 'Denver', 'CO', '80220');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (10, '9180 W Colfax Ave', NULL, 'Denver', 'CO', '80215');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (11, '9640 Washington St', NULL, 'Denver', 'CO', '80229');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (12, '3100 S Sheridan Blvd', NULL, 'Denver', 'CO', '80227');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (13, '2984 N Havana St.', NULL, 'Denver', 'CO', '80238');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (14, '18605 Green Valley Ranch Blvd', NULL, 'Denver', 'CO', '80249');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (15, '2810 Quebec St', NULL, 'Denver', 'CO', '80207');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (16, '6470 E Hampden Ave', NULL, 'Denver', 'CO', '80222');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (17, '2727 W Evans Ave', NULL, 'Denver', 'CO', '80219');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (18, '5125 W Florida Ave', NULL, 'Denver', 'CO', '80219');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (19, '6390 E Colfax Ave', NULL, 'Denver', 'CO', '80220');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (20, '6504 E Alameda Ave', NULL, 'Denver', 'CO', '80224');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (21, '1301 W 38th Ave', NULL, 'Denver', 'CO', '80211');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (22, '11005 E Briarwood Ave', NULL, 'Denver', 'CO', '80220');
INSERT INTO `address` (`id`, `street`, `street2`, `city`, `state`, `zip_code`) VALUES (23, 'Denver I-70 Pilot Stop', NULL, 'Denver', 'CO', '80239');

COMMIT;


-- -----------------------------------------------------
-- Data for table `gas_station`
-- -----------------------------------------------------
START TRANSACTION;
USE `fueldb`;
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (1, 'Stinker', 1, 'https://a.mktgcdn.com/p/MOQBu9QL_-Z0jxH_p_eNZQrKkqVxrxFtMfg6sPjW-IE/1809x1809.png', '2025:06:12', '2025:06:12', 'Some remarks');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (2, 'Murphy USA', 2, 'https://www.scrapehero.com/store/wp-content/uploads/2020/11/Murphy_USA_USA.png', '2025:06:12', '2025:06:12', 'Other remarks');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (3, 'Shell', 3, 'https://northwoodsinnpickerel.com/wp-content/uploads/2016/03/Shell-gas-station-logo-trans.png', '2025:06:12', '2025:06:12', 'Even more remarks');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (4, 'Safeway Fuel Federal Blvd', 4, 'https://play-lh.googleusercontent.com/kHP7uqO73fW3L2jBTNxGR-Tg4JYLpPiFW9i8eO6nX6S2Ugy6cKTn05-_GgAu2O9EvcU', '2025:06:19', '2025:06:19', 'NULL');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (5, 'Safeway Fuel E Evans', 5, 'https://play-lh.googleusercontent.com/kHP7uqO73fW3L2jBTNxGR-Tg4JYLpPiFW9i8eO6nX6S2Ugy6cKTn05-_GgAu2O9EvcU', '2025:06:19', '2025:06:19', 'NULL');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (6, 'Safeway Fuel S Monaco', 6, 'https://play-lh.googleusercontent.com/kHP7uqO73fW3L2jBTNxGR-Tg4JYLpPiFW9i8eO6nX6S2Ugy6cKTn05-_GgAu2O9EvcU', '2025:06:19', '2025:06:19', 'NULL');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (7, 'Safeway Fuel W 26th', 7, 'https://play-lh.googleusercontent.com/kHP7uqO73fW3L2jBTNxGR-Tg4JYLpPiFW9i8eO6nX6S2Ugy6cKTn05-_GgAu2O9EvcU', '2025:06:19', '2025:06:19', 'NULL');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (8, 'Safeway Fuel W 44th', 8, 'https://play-lh.googleusercontent.com/kHP7uqO73fW3L2jBTNxGR-Tg4JYLpPiFW9i8eO6nX6S2Ugy6cKTn05-_GgAu2O9EvcU', '2025:06:19', '2025:06:19', 'NULL');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (9, 'Safeway Fuel E 14th', 9, 'https://play-lh.googleusercontent.com/kHP7uqO73fW3L2jBTNxGR-Tg4JYLpPiFW9i8eO6nX6S2Ugy6cKTn05-_GgAu2O9EvcU', '2025:06:19', '2025:06:19', 'NULL');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (10, 'Safeway Fuel W Colfax', 10, 'https://play-lh.googleusercontent.com/kHP7uqO73fW3L2jBTNxGR-Tg4JYLpPiFW9i8eO6nX6S2Ugy6cKTn05-_GgAu2O9EvcU', '2025:06:19', '2025:06:19', 'NULL');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (11, 'Safeway Fuel Washington St', 11, 'https://play-lh.googleusercontent.com/kHP7uqO73fW3L2jBTNxGR-Tg4JYLpPiFW9i8eO6nX6S2Ugy6cKTn05-_GgAu2O9EvcU', '2025:06:19', '2025:06:19', '');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (12, 'King Soopers Bear Valley', 12, 'https://denver.cbslocal.com/wp-content/uploads/sites/15909806/2019/12/GAS-STATION-MIX-UP-PKG_frame_871.jpg', '2025:06:12', '2025:06:12', 'Some remarks');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (13, 'King Soopers Central Park', 13, 'https://denver.cbslocal.com/wp-content/uploads/sites/15909806/2019/12/GAS-STATION-MIX-UP-PKG_frame_871.jpg', '2025:06:12', '2025:06:12', 'Other remarks');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (14, 'King Soopers Green Valley Ranch', 14, 'https://denver.cbslocal.com/wp-content/uploads/sites/15909806/2019/12/GAS-STATION-MIX-UP-PKG_frame_871.jpg', '2025:06:12', '2025:06:12', 'Even more remarks');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (15, 'King Soopers Quebec St', 15, 'https://denver.cbslocal.com/wp-content/uploads/sites/15909806/2019/12/GAS-STATION-MIX-UP-PKG_frame_871.jpg', '2025:06:19', '2025:06:19', 'NULL');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (16, 'King Soopers Southmoor', 16, 'https://denver.cbslocal.com/wp-content/uploads/sites/15909806/2019/12/GAS-STATION-MIX-UP-PKG_frame_871.jpg', '2025:06:19', '2025:06:19', 'NULL');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (17, 'King Soopers W Evans', 17, 'https://denver.cbslocal.com/wp-content/uploads/sites/15909806/2019/12/GAS-STATION-MIX-UP-PKG_frame_871.jpg', '2025:06:19', '2025:06:19', 'NULL');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (18, 'King Soopers W Florida', 18, 'https://denver.cbslocal.com/wp-content/uploads/sites/15909806/2019/12/GAS-STATION-MIX-UP-PKG_frame_871.jpg', '2025:06:19', '2025:06:19', 'NULL');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (19, 'Sinclair Colfax', 19, 'https://a.mktgcdn.com/p/Tx91OM14rsV4DOtNbg0W2avNGOsRndvHPAPoGdt_jUQ/659x507.png', '2025:06:19', '2025:06:19', 'NULL');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (20, 'Shell Federal & Alameda', 20, 'https://www.siliconvalley.com/wp-content/uploads/2024/05/OCR-L-SFORZA-ANAHEIM-0802-JG-06.jpg?fit=620%2C9999px&ssl=1', '2025:06:19', '2025:06:19', 'NULL');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (21, '7-Eleven Sunnyside', 21, 'https://d3ghupt9z9s6o0.cloudfront.net/app/uploads/2020/06/13094932/7-eleven-digital.jpg', '2025:06:19', '2025:06:19', 'NULL');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (22, 'Murphy Express Briarwood', 22, 'https://s3-media0.fl.yelpcdn.com/bphoto/q9YnWed56tiO6gYwacYcww/348s.jpg', '2025:06:19', '2025:06:19', 'NULL');
INSERT INTO `gas_station` (`id`, `name`, `address_id`, `image_url`, `create_date`, `update_date`, `remarks`) VALUES (23, 'Pilot Flying J', 23, 'https://dynl.mktgcdn.com/p/qwiEMNbkkep8VGIrcKuS0a-uRDKYLxwpBEAp0WFuiro/1440x446.jpg', '2025:06:19', '2025:06:19', 'NULL');

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
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (1, 2.780, 2, 1, 1, 1, '2025-06-12 00:00:00', '2025-06-12 00:00:00', 'these prices stink');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (2, 2.85, 2, 1, 2, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'phew');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (3, 2.98, 2, 1, 3, 1, '2025-06-12 00:00:00', '2025-06-12 00:00:00', 'very fragrant pricing');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (4, 2.82, 2, 1, 4, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'this place DOES stink');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (5, 2.76, 3, 2, 1, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'phew');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (6, 2.82, 3, 2, 2, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'it is gas');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (7, 2.95, 3, 2, 3, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (8, 2.79, 3, 2, 4, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (9, 2.77, 4, 3, 1, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (10, 2.83, 4, 3, 2, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (11, 2.99, 4, 3, 3, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (12, 2.85, 4, 3, 4, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (13, 2.69, 2, 4, 1, 1, '2025-06-12 00:00:00', '2025-06-12 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (14, 2.89, 2, 4, 2, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (15, 3.01, 2, 4, 3, 1, '2025-06-12 00:00:00', '2025-06-12 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (16, 2.90, 2, 4, 4, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (17, 2.81, 3, 5, 1, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (18, 2.89, 3, 5, 2, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (19, 2.98, 3, 5, 3, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (20, 2.84, 3, 5, 4, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (21, 2.780, 4, 6, 1, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (22, 2.85, 4, 6, 2, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (23, 2.98, 4, 6, 3, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (24, 2.82, 4, 6, 4, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (25, 2.76, 2, 7, 1, 1, '2025-06-12 00:00:00', '2025-06-12 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (26, 2.82, 2, 7, 2, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (27, 2.95, 2, 7, 3, 1, '2025-06-12 00:00:00', '2025-06-12 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (28, 2.79, 2, 7, 4, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (29, 2.77, 3, 8, 1, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (30, 2.83, 3, 8, 2, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (31, 2.99, 3, 8, 3, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (32, 2.85, 3, 8, 4, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (33, 2.69, 4, 9, 1, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (34, 2.89, 4, 9, 2, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (35, 3.01, 4, 9, 3, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (36, 2.90, 4, 9, 4, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (37, 2.81, 2, 10, 1, 1, '2025-06-12 00:00:00', '2025-06-12 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (38, 2.89, 2, 10, 2, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (39, 2.98, 2, 10, 3, 1, '2025-06-12 00:00:00', '2025-06-12 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (40, 2.84, 2, 10, 4, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (41, 2.780, 3, 11, 1, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (42, 2.85, 3, 11, 2, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (43, 2.98, 3, 11, 3, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (44, 2.82, 3, 11, 4, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (45, 2.76, 4, 12, 1, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (46, 2.82, 4, 12, 2, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (47, 2.95, 4, 12, 3, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (48, 2.79, 4, 12, 4, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (49, 2.77, 2, 13, 1, 1, '2025-06-12 00:00:00', '2025-06-12 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (50, 2.83, 2, 13, 2, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (51, 2.99, 2, 13, 3, 1, '2025-06-12 00:00:00', '2025-06-12 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (52, 2.85, 2, 13, 4, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (53, 2.69, 3, 14, 1, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (54, 2.89, 3, 14, 2, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (55, 3.01, 3, 14, 3, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (56, 2.90, 3, 14, 4, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (57, 2.81, 4, 15, 1, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (58, 2.89, 4, 15, 2, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (59, 2.98, 4, 15, 3, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (60, 2.84, 4, 15, 4, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (61, 2.780, 2, 16, 1, 1, '2025-06-12 00:00:00', '2025-06-12 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (62, 2.85, 2, 16, 2, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (63, 2.98, 2, 16, 3, 1, '2025-06-12 00:00:00', '2025-06-12 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (64, 2.82, 2, 16, 4, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (65, 2.76, 3, 17, 1, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (66, 2.82, 3, 17, 2, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (67, 2.95, 3, 17, 3, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (68, 2.79, 3, 17, 4, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (69, 2.77, 4, 18, 1, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (70, 2.83, 4, 18, 2, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (71, 2.99, 4, 18, 3, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (72, 2.85, 4, 18, 4, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (73, 2.69, 2, 19, 1, 1, '2025-06-12 00:00:00', '2025-06-12 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (74, 2.89, 2, 19, 2, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (75, 3.01, 2, 19, 3, 1, '2025-06-12 00:00:00', '2025-06-12 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (76, 2.90, 2, 19, 4, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (77, 2.81, 3, 20, 1, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (78, 2.89, 3, 20, 2, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (79, 2.98, 3, 20, 3, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (80, 2.84, 3, 20, 4, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (81, 2.780, 4, 21, 1, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (82, 2.85, 4, 21, 2, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (83, 2.98, 4, 21, 3, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (84, 2.82, 4, 21, 4, 1, '2025-06-16 00:00:00', '2025-06-16 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (85, 2.76, 2, 22, 1, 1, '2025-06-12 00:00:00', '2025-06-12 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (86, 2.82, 2, 22, 2, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (87, 2.95, 2, 22, 3, 1, '2025-06-12 00:00:00', '2025-06-12 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (88, 2.79, 2, 22, 4, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (89, 2.77, 3, 23, 1, 1, '2025-06-14 00:00:00', '2025-06-14 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (90, 2.83, 3, 23, 2, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (91, 2.99, 3, 23, 3, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');
INSERT INTO `price_report` (`id`, `price_per_gallon`, `user_id`, `gas_station_id`, `fuel_type_id`, `enabled`, `create_date`, `last_update`, `remarks`) VALUES (92, 2.85, 3, 23, 4, 1, '2025-06-15 00:00:00', '2025-06-15 00:00:00', 'NULL');

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


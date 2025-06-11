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
  PRIMARY KEY (`id`),
  UNIQUE INDEX `usernam_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS fueluser;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'fueluser' IDENTIFIED BY 'fueluser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'fueluser';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `fueldb`;
INSERT INTO `user` (`id`, `username`, `password`, `email`, `enabled`, `role`) VALUES (1, 'test', '$2a$10$nShOi5/f0bKNvHB8x0u3qOpeivazbuN0NE4TO0LGvQiTMafaBxLJS', 'test@test.test', 1, 'admin');

COMMIT;


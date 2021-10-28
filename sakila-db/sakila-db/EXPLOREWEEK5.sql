-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema temples
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema temples
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `temples` DEFAULT CHARACTER SET utf8 ;
USE `temples` ;

-- -----------------------------------------------------
-- Table `temples`.`locations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `temples`.`locations` ;

CREATE TABLE IF NOT EXISTS `temples`.`locations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `suburb` VARCHAR(50) NULL DEFAULT NULL,
  `city` VARCHAR(25) NOT NULL,
  `district` VARCHAR(25) NULL DEFAULT NULL,
  `zip_code` VARCHAR(11) NULL DEFAULT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `temples`.`phases`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `temples`.`phases` ;

CREATE TABLE IF NOT EXISTS `temples`.`phases` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `phase_no` VARCHAR(2) NOT NULL,
  `phase_desc` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `temples`.`temples`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `temples`.`temples` ;

CREATE TABLE IF NOT EXISTS `temples`.`temples` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(65) NOT NULL,
  `phone` VARCHAR(16) NULL DEFAULT NULL,
  `street_address` VARCHAR(255) NULL DEFAULT NULL,
  `locations_id` INT NULL DEFAULT NULL,
  `phases_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_temples_cities1_idx` (`locations_id` ASC) VISIBLE,
  INDEX `fk_temples_phases1_idx` (`phases_id` ASC) VISIBLE,
  CONSTRAINT `fk_temples_cities1`
    FOREIGN KEY (`locations_id`)
    REFERENCES `temples`.`locations` (`id`),
  CONSTRAINT `fk_temples_phases1`
    FOREIGN KEY (`phases_id`)
    REFERENCES `temples`.`phases` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 29
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `temples`.`closures`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `temples`.`closures` ;

CREATE TABLE IF NOT EXISTS `temples`.`closures` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start_date` DATE NOT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `temples_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_closures_temples1_idx` (`temples_id` ASC) VISIBLE,
  CONSTRAINT `fk_closures_temples1`
    FOREIGN KEY (`temples_id`)
    REFERENCES `temples`.`temples` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 53
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `temples`.`milestones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `temples`.`milestones` ;

CREATE TABLE IF NOT EXISTS `temples`.`milestones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `temples`.`services`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `temples`.`services` ;

CREATE TABLE IF NOT EXISTS `temples`.`services` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `service` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `temples`.`temples_milestones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `temples`.`temples_milestones` ;

CREATE TABLE IF NOT EXISTS `temples`.`temples_milestones` (
  `temples_id` INT NOT NULL,
  `milestones_id` INT NOT NULL,
  `date` DATE NOT NULL,
  `dedicatory_prayer` TEXT NULL,
  PRIMARY KEY (`temples_id`, `milestones_id`),
  INDEX `fk_temples_milestones_milestones1_idx` (`milestones_id` ASC) VISIBLE,
  INDEX `fk_temples_milestones_temples1_idx` (`temples_id` ASC) VISIBLE,
  CONSTRAINT `fk_temples_milestones_milestones1`
    FOREIGN KEY (`milestones_id`)
    REFERENCES `temples`.`milestones` (`id`),
  CONSTRAINT `fk_temples_milestones_temples1`
    FOREIGN KEY (`temples_id`)
    REFERENCES `temples`.`temples` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `temples`.`temples_services`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `temples`.`temples_services` ;

CREATE TABLE IF NOT EXISTS `temples`.`temples_services` (
  `temples_id` INT NOT NULL,
  `services_id` INT NOT NULL,
  PRIMARY KEY (`temples_id`, `services_id`),
  INDEX `fk_temples_services_services1_idx` (`services_id` ASC) VISIBLE,
  INDEX `fk_temples_services_temples_idx` (`temples_id` ASC) VISIBLE,
  CONSTRAINT `fk_temples_services_services1`
    FOREIGN KEY (`services_id`)
    REFERENCES `temples`.`services` (`id`),
  CONSTRAINT `fk_temples_services_temples`
    FOREIGN KEY (`temples_id`)
    REFERENCES `temples`.`temples` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

USE temples;
INSERT into locations
-- POPULATE TEMPLES
VALUES (DEFAULT, NULL, 'Albuquerque', 'New Mexico', '87122', 'United States');
-- I have to asusme that I will never know where the foreign key in going to be assing on :O? 
SET @ALBUQUERQUE = last_insert_id();

INSERT into locations
VALUES (DEFAULT, NULL, 'Anchorage', 'Alaska', '99516', 'United States');
SET @ALASKA = last_insert_id();

INSERT into locations
VALUES (DEFAULT, 'Carmen Alto Distrito De Cayma', 'Arequipa', 'Arequipa', NULL, 'Peru');
SET @AREQUIPA = last_insert_id();

-- POPULATE PHASES
INSERT INTO phases
VALUES (DEFAULT, '3', 'All living ordinances and limited proxy ordinances');
SET @PHASE3 = last_insert_id();

INSERT INTO phases
VALUES (DEFAULT, '2B', 'Living Ordinances and Limited Proxy Baptisms');
SET @PHASE2B = last_insert_id();

INSERT INTO phases
VALUES (DEFAULT, 'A', 'Temple announced but location TBD');
SET @PHASEA = last_insert_id();

INSERT INTO phases
VALUES (DEFAULT, 'C', 'Construction');
SET @PHASEC = last_insert_id();

-- POPULATE TEMPLES TABLE
INSERT INTO temples
VALUES(DEFAULT, 'Albuquerque New Mexico', '1 505 822 5110', '10301 San Francisco Rd NE', @ALBUQUERQUE, @PHASE3);
SET @T_ALBUQUERQUE = last_insert_id();

INSERT INTO temples
VALUES(DEFAULT, 'Anchorage Alaska', '1 907 348 7890', '13161 Brayton Dr', @ALASKA, @PHASE3);
SET @T_ALASKA = last_insert_id();

INSERT INTO temples
VALUES(DEFAULT, 'Arequipa Peru', '51 54 640 300', 'Calle Cusco 380	Carmen Alto Distrito De Cayma', @AREQUIPA, @PHASE2B);
SET @T_AREQUIPA = last_insert_id();

INSERT INTO temples
VALUES(DEFAULT, 'Antananarivo Madagascar', NULL, NULL, NULL, @PHASEA);
SET @T_MADAGASCAR = last_insert_id();

INSERT INTO temples
VALUES(DEFAULT, 'Antofagasta Chile', NULL, NULL, NULL, @PHASEC);
SET @T_CHILE = last_insert_id();

-- POPULATING SERVICES.
INSERT INTO services
VALUES(DEFAULT, 'distribution center');
SET @DIS_CENTER = last_insert_id();
INSERT INTO services
VALUES(DEFAULT, 'clothing rental');
SET @CLOTHING = last_insert_id();
INSERT INTO services
VALUES(DEFAULT, 'cafeteria');
SET @CAFETERIA = last_insert_id();
INSERT INTO services
VALUES(DEFAULT, 'housing');
SET @HOUSING = last_insert_id();

-- POPULATING SERVICES FOR ALBUQUERQUE-------------------------------------------------------------------------------------------------
INSERT INTO temples_services
VALUES(@T_ALBUQUERQUE, @DIS_CENTER),
(@T_ALBUQUERQUE, @CLOTHING);

INSERT INTO temples_services
VALUES(@T_AREQUIPA, @CLOTHING);


-- POPULATNG MILESTONES
INSERT INTO milestones
VALUES(DEFAULT, 'announcement');
SET @ANNOUNCEMENT = last_insert_id();

INSERT INTO milestones
VALUES(DEFAULT, 'groundbreaking');
SET @GROUNDBREAKING = last_insert_id();

INSERT INTO milestones
VALUES(DEFAULT, 'dedication');
SET @DEDICATION = last_insert_id();

INSERT INTO milestones
VALUES(DEFAULT, 'rededication');
SET @REDEDICATION = last_insert_id();

-- POPULATING temples-milestone for ALBUQUERQUE ------------------------------------------------------------------
INSERT INTO temples_milestones
VALUES(@T_ALBUQUERQUE, @ANNOUNCEMENT,'1997-04-04', NULL),
(@T_ALBUQUERQUE, @GROUNDBREAKING, '1998-06-20', NULL),
(@T_ALBUQUERQUE, @DEDICATION, '2000-03-05', 'albuquerque.txt');
-- POPULATING temples-milestone for ALASKA ------------------------------------------------------------------
INSERT INTO temples_milestones
VALUES(@T_ALASKA, @ANNOUNCEMENT,'1997-10-04', NULL),
(@T_ALASKA, @GROUNDBREAKING, '1998-04-17', NULL),
(@T_ALASKA, @DEDICATION, '1999-01-09', 'anchorage.txt'),
(@T_ALASKA, @REDEDICATION, '2004-02-08', 're_anchorage.txt');
-- POPULATING temples-milestone for AREQUIPA ------------------------------------------------------------------
INSERT INTO temples_milestones
VALUES(@T_AREQUIPA, @ANNOUNCEMENT,'2012-10-06', NULL),
(@T_AREQUIPA, @GROUNDBREAKING, '2017-03-04', NULL),
(@T_AREQUIPA, @DEDICATION, '2019-12-15', 'arequipa.txt');
-- POPULATING temples-milestone for MADAGASCAR ------------------------------------------------------------------
INSERT INTO temples_milestones
VALUES(@T_MADAGASCAR, @ANNOUNCEMENT,'2021-10-03', NULL);
-- POPULATING temples-milestone for CHILE ------------------------------------------------------------------
INSERT INTO temples_milestones
VALUES(@T_CHILE, @ANNOUNCEMENT,'2019-04-07', NULL),
(@T_CHILE, @GROUNDBREAKING, '2020-11-27', NULL);


-- POPULATING closures FOR ALBUQUERQUE
INSERT INTO closures VALUES
(DEFAULT, '2021-10-04', '2021-10-18', @T_ALBUQUERQUE),
(DEFAULT, '2021-11-24',	'2021-11-25', @T_ALBUQUERQUE),
(DEFAULT, '2021-12-24',	'2021-12-25', @T_ALBUQUERQUE),
(DEFAULT, '2021-12-31',	'2022-01-01', @T_ALBUQUERQUE),
(DEFAULT, '2022-04-02',	NULL, @T_ALBUQUERQUE),
(DEFAULT, '2022-04-04',	'2022-04-18', @T_ALBUQUERQUE),
(DEFAULT, '2022-09-19',	'2022-10-03', @T_ALBUQUERQUE),
(DEFAULT, '2022-11-23',	'2022-11-24', @T_ALBUQUERQUE),
(DEFAULT, '2022-12-24',	NULL, @T_ALBUQUERQUE),
(DEFAULT, '2022-12-31',	NULL, @T_ALBUQUERQUE);
-- POPULATING CLOSURES fOR ALASKA -----------
INSERT INTO closures VALUES
(DEFAULT, '2021-11-24', '2021-11-25', @T_ALASKA),
(DEFAULT, '2021-12-24',	'2021-12-25', @T_ALASKA),
(DEFAULT, '2021-12-31',	'2022-01-01', @T_ALASKA),
(DEFAULT, '2022-03-21',	'2022-05-16', @T_ALASKA);
-- POPULATING CLOSURES FOR AREQUIPA---------
INSERT INTO closures VALUES
(DEFAULT, '2021-12-24',	'2021-12-25', @T_AREQUIPA),
(DEFAULT, '2021-12-31','2021-01-01', @T_AREQUIPA),
(DEFAULT, '2022-02-14',	'2022-02-28', @T_AREQUIPA),
(DEFAULT, '2022-07-28',	'2022-07-29', @T_AREQUIPA),
(DEFAULT, '2022-08-01',	'2022-08-15', @T_AREQUIPA),
(DEFAULT, '2022-12-24', NULL, @T_AREQUIPA),
(DEFAULT, '2022-12-31', NULL, @T_AREQUIPA);

SELECT * FROM temples;


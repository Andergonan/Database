CREATE SCHEMA IF NOT EXISTS `property_register` DEFAULT CHARSET utf8 COLLATE utf8_czech_ci;

USE `property_register`;

CREATE TABLE IF NOT EXISTS `property_register`.`property_type` (
    `id` INT NOT NULL,
    `type` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB;

INSERT INTO `property_register`.`property_type` (`id`, `type`) VALUES
(0, 'DHM'),
(1, 'DNM');

CREATE TABLE IF NOT EXISTS `property_register`.`property_state` (
    `id` INT NOT NULL,
    `state` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB;


INSERT INTO `property_register`.`property_state` (`id`, `state`) VALUES
(0, 'v evidenci'),
(1, 'k odpisu'),
(2, 'odepsáno');

CREATE TABLE IF NOT EXISTS `property_register`.`property` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `purchace_price` DECIMAL NOT NULL,
    `purchace_date` DATE NOT NULL,
    `property_type_id` INT NOT NULL,
    `property_state_id` INT NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB;

INSERT INTO `property_register`.`property` (`name`, `purchace_price`, `property_type_id`, `property_state_id`) VALUES
('Gandalfův krumpáč', 600, 0, 0),
('Batmanova zahradní hadice', 390, 0, 0);

CREATE TABLE IF NOT EXISTS `property_register`.`workers` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `surename` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB;

INSERT INTO `property_register`.`workers` (`name`, `surename`) VALUES
('Petr', 'Parketa');

CREATE TABLE IF NOT EXISTS `property_register`.`workplace` (
    `id` INT NOT NULL,
    `property_id` INT NOT NULL,
    `workers_id` INT NOT NULL
) ENGINE = InnoDB;

INSERT INTO `property_register`.`workplace` (`property_id`, `workers_id`) VALUES
(0, 1);
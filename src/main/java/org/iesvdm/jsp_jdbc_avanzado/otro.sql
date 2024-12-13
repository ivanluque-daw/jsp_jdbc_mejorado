USE `baloncesto`;

CREATE TABLE IF NOT EXISTS `entrenamiento` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `tipo` ENUM('fisico', 'tecnico') NOT NULL,
    `ubicacion` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
    `fecha` DATETIME DEFAULT NULL,

    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

INSERT INTO `entrenamiento` (`tipo`, `ubicacion`, `fecha`) VALUES
('tecnico', 'Málaga', NOW());
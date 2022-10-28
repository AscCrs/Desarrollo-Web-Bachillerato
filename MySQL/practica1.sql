-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 15-11-2020 a las 19:14:53
-- Versión del servidor: 10.4.10-MariaDB
-- Versión de PHP: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `practica1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

DROP TABLE IF EXISTS `proyecto`;
CREATE TABLE IF NOT EXISTS `proyecto` (
  `Id_pro` int(11) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `Fecha_inicio` datetime DEFAULT NULL,
  `Fecha_termino` datetime DEFAULT NULL,
  `Presupuesto` decimal(18,2) DEFAULT NULL,
  `Id_sede` int(11) DEFAULT NULL,
  `responsable` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id_pro`),
  KEY `Id_sede` (`Id_sede`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`Id_pro`, `nombre`, `Fecha_inicio`, `Fecha_termino`, `Presupuesto`, `Id_sede`, `responsable`) VALUES
(8990, 'No más guerra', '2004-04-03 00:00:00', '2008-04-03 00:00:00', '50000.00', 237, 'Amaal Azhar'),
(2655, 'Alas rotas', '2004-04-03 00:00:00', '2008-04-03 00:00:00', '50000.00', 238, 'Mohamed salah'),
(2886, 'Agua para todos', '2004-04-03 00:00:00', '2008-04-03 00:00:00', '50000.00', 246, 'Abdul Nahilia'),
(8863, 'Turismo amigable', '2000-05-04 00:00:00', '2017-06-05 00:00:00', '10000.00', 237, 'Filoppo Rossi'),
(9864, 'Educación para todos', '2000-05-02 00:00:00', '2017-06-05 00:00:00', '10000.00', 245, 'Luciano Gruper'),
(7765, 'Salud para los niños', '2000-05-02 00:00:00', '2017-06-05 00:00:00', '10000.00', 243, 'Chiara novak');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

DROP TABLE IF EXISTS `sede`;
CREATE TABLE IF NOT EXISTS `sede` (
  `Id_sede` int(11) NOT NULL,
  `Ciudad` varchar(40) DEFAULT NULL,
  `pais` varchar(40) DEFAULT NULL,
  `nom_sede` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Id_sede`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sede`
--

INSERT INTO `sede` (`Id_sede`, `Ciudad`, `pais`, `nom_sede`) VALUES
(237, 'Kabul', 'Afganistán', 'hamid jaan'),
(238, 'Tirana', 'Albania', 'Barrio Bam'),
(239, 'Viena', 'Austria', 'Herrengasse'),
(241, 'La Habana', 'Cuba', 'El prado'),
(242, 'Liubliana', 'Eslovenia', 'Vilna'),
(243, 'Atenas', 'Grecia', 'Ermou'),
(244, 'Managua', 'Nicaragua', 'PRF'),
(245, 'Panamá', 'Panamá', 'Central-Cod'),
(246, 'Saná', 'Yemen', 'Soqatra');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

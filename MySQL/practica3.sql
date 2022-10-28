-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 15-11-2020 a las 22:55:05
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
-- Base de datos: `practica3`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `Id_cat` int(11) NOT NULL,
  `nom_cat` varchar(40) DEFAULT NULL,
  `num_horas` char(15) DEFAULT NULL,
  `salario` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`Id_cat`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

DROP TABLE IF EXISTS `curso`;
CREATE TABLE IF NOT EXISTS `curso` (
  `cod_curso` varchar(20) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `Max_alumnos` int(11) DEFAULT NULL,
  `Fecha_inicio` date DEFAULT NULL,
  `Fecha_termino` date DEFAULT NULL,
  `horas` char(15) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `id_grupo` char(15) DEFAULT NULL,
  PRIMARY KEY (`cod_curso`),
  KEY `id_grupo` (`id_grupo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`cod_curso`, `nombre`, `Max_alumnos`, `Fecha_inicio`, `Fecha_termino`, `horas`, `descripcion`, `id_grupo`) VALUES
('A45-3', 'Habilidades socioemocionales', 150, '2021-10-20', '2021-11-30', '40Hrs', 'Curso de habilidades sociemocionales aplicaciones de fichas', NULL),
('B59-4', 'Trabajo en equipo', 120, '2021-03-10', '2021-06-05', '120Hrs', 'Curso de actividades recreativas asociadas con el trabajo en equipo', NULL),
('B57-6', 'Normas ISO', 40, '2021-05-04', '2021-07-30', '80Hrs', 'Curso acerca de la Norma ISO 9001/Auditorias internas en la organización', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

DROP TABLE IF EXISTS `direccion`;
CREATE TABLE IF NOT EXISTS `direccion` (
  `Id_dir` int(11) NOT NULL,
  `nom_calle` varchar(40) DEFAULT NULL,
  `numero` char(15) DEFAULT NULL,
  `CP` int(11) DEFAULT NULL,
  `Colonia` varchar(25) DEFAULT NULL,
  `Municipio` varchar(35) DEFAULT NULL,
  `Estado` varchar(35) DEFAULT NULL,
  `Referencias` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Id_dir`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `Cod_Empleado` int(11) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `RFC` varchar(25) DEFAULT NULL,
  `Telefono` char(15) DEFAULT NULL,
  `Email` varchar(25) DEFAULT NULL,
  `id_dire` int(11) DEFAULT NULL,
  `id_cat` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cod_Empleado`),
  KEY `id_dire` (`id_dire`),
  KEY `id_cat` (`id_cat`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`Cod_Empleado`, `nombre`, `apellidos`, `RFC`, `Telefono`, `Email`, `id_dire`, `id_cat`) VALUES
(198930, 'José', 'Mora Luna', 'MOLJ860204VC4', '3335682435', 'Jose_m@gmail.com', NULL, NULL),
(198931, 'Dania', 'Mejia Khan', 'MEKD891105MC9', '2235904488', 'dan_mk@gmail.com', NULL, NULL),
(198932, 'Arnold', 'Hernández Gómez', 'HEGA870716PP3', '2298775100', 'Arn_hg@gmail.com', NULL, NULL),
(198933, 'Ignacio', 'Aguilar Jiménez', 'AGJI911024YY3', '5537749002', 'nachito_aj@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

DROP TABLE IF EXISTS `grupo`;
CREATE TABLE IF NOT EXISTS `grupo` (
  `Id_cat` int(11) DEFAULT NULL,
  `Id_grupo` char(15) NOT NULL,
  `Turno` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Id_grupo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscribe`
--

DROP TABLE IF EXISTS `inscribe`;
CREATE TABLE IF NOT EXISTS `inscribe` (
  `Id_insc` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `pago` decimal(18,2) DEFAULT NULL,
  `anotaciones` varchar(15) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `cod_curso` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id_insc`),
  KEY `id_empleado` (`id_empleado`),
  KEY `cod_curso` (`cod_curso`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

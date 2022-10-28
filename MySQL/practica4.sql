-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 15-11-2020 a las 19:31:10
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
-- Base de datos: `practica4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adquisicion_v`
--

DROP TABLE IF EXISTS `adquisicion_v`;
CREATE TABLE IF NOT EXISTS `adquisicion_v` (
  `Id_adq` int(11) DEFAULT NULL,
  `Fecha_com` datetime DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Descuento` decimal(18,2) DEFAULT NULL,
  `Precio_neto` decimal(18,2) DEFAULT NULL,
  `Id_auto` int(11) DEFAULT NULL,
  `RFC_cliente` varchar(30) DEFAULT NULL,
  `Id_vendedor` int(11) DEFAULT NULL,
  KEY `Id_auto` (`Id_auto`),
  KEY `RFC_cliente` (`RFC_cliente`),
  KEY `Id_vendedor` (`Id_vendedor`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autos`
--

DROP TABLE IF EXISTS `autos`;
CREATE TABLE IF NOT EXISTS `autos` (
  `Id_auto` int(11) NOT NULL,
  `Marca` varchar(20) DEFAULT NULL,
  `Modelo` varchar(40) DEFAULT NULL,
  `Precio` decimal(18,2) DEFAULT NULL,
  `Version` varchar(30) DEFAULT NULL,
  `Color` varchar(20) DEFAULT NULL,
  `Unidades` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_auto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `Id_cargo` int(11) NOT NULL,
  `Nombre_c` char(10) DEFAULT NULL,
  `Sueldo` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`Id_cargo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `RFC` varchar(30) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellidos` varchar(45) DEFAULT NULL,
  `Telefono` varchar(25) DEFAULT NULL,
  `Correo_e` varchar(35) DEFAULT NULL,
  PRIMARY KEY (`RFC`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

DROP TABLE IF EXISTS `grupo`;
CREATE TABLE IF NOT EXISTS `grupo` (
  `Id_grupo` int(11) NOT NULL,
  `Nombre` char(10) DEFAULT NULL,
  PRIMARY KEY (`Id_grupo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
CREATE TABLE IF NOT EXISTS `vendedor` (
  `Id_vendedor` int(11) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellidos` varchar(45) DEFAULT NULL,
  `Fecha_alta` datetime DEFAULT NULL,
  `Comision` decimal(18,2) DEFAULT NULL,
  `Id_grupo` int(11) DEFAULT NULL,
  `Id_cargo` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id_vendedor`),
  KEY `Id_grupo` (`Id_grupo`),
  KEY `Id_cargo` (`Id_cargo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

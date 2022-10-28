-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 15-11-2020 a las 21:33:27
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
-- Base de datos: `practica2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

DROP TABLE IF EXISTS `articulos`;
CREATE TABLE IF NOT EXISTS `articulos` (
  `idArticulo` int(11) NOT NULL,
  `Descripcion` varchar(100) DEFAULT NULL,
  `Existencias` int(11) DEFAULT NULL,
  `idFabrica` int(11) DEFAULT NULL,
  PRIMARY KEY (`idArticulo`),
  KEY `idFabrica` (`idFabrica`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
CREATE TABLE IF NOT EXISTS `ciudades` (
  `idCiudad` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCiudad`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`idCiudad`, `Nombre`) VALUES
(239, 'Xalapa'),
(240, 'Boca del Río'),
(242, 'Veracruz de Ignacio de la Llave'),
(243, 'Papantla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `Nombre` varchar(100) DEFAULT NULL,
  `idCliente` int(11) NOT NULL,
  `RFC` varchar(13) DEFAULT NULL,
  `Saldo` decimal(18,2) DEFAULT NULL,
  `Credito` decimal(18,2) DEFAULT NULL,
  `Descuento` int(11) DEFAULT NULL,
  `Fecha_ingreso` date DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`Nombre`, `idCliente`, `RFC`, `Saldo`, `Credito`, `Descuento`, `Fecha_ingreso`) VALUES
('Juan Campos Gil', 3490, 'CAGJ900302BT2', '300.00', '10000.00', 10, '2020-11-15'),
('Soledad Machado Darner', 3491, 'MASD960209MN7', '500.00', '7000.00', 10, '2020-11-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

DROP TABLE IF EXISTS `detalles`;
CREATE TABLE IF NOT EXISTS `detalles` (
  `idPedido` int(11) DEFAULT NULL,
  `idArticulo` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  KEY `idPedido` (`idPedido`),
  KEY `idArticulo` (`idArticulo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
CREATE TABLE IF NOT EXISTS `direcciones` (
  `idDireccion` int(11) NOT NULL,
  `NumExterior` varchar(10) DEFAULT NULL,
  `Calle` varchar(100) DEFAULT NULL,
  `CP` int(11) DEFAULT NULL,
  `Ciudad` int(11) DEFAULT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDireccion`),
  KEY `Ciudad` (`Ciudad`),
  KEY `IdCliente` (`IdCliente`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `direcciones`
--

INSERT INTO `direcciones` (`idDireccion`, `NumExterior`, `Calle`, `CP`, `Ciudad`, `IdCliente`) VALUES
(109, '503', 'Ávila Camacho', 91200, 239, 3490),
(110, '21', 'Gabriela Mistral', 93400, 243, 3491);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabricas`
--

DROP TABLE IF EXISTS `fabricas`;
CREATE TABLE IF NOT EXISTS `fabricas` (
  `Nombre` varchar(35) DEFAULT NULL,
  `IdFabrica` int(11) NOT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`IdFabrica`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `fabricas`
--

INSERT INTO `fabricas` (`Nombre`, `IdFabrica`, `Telefono`) VALUES
('HASSRT', 1905, '8885475300'),
('TRPM', 8534, '9949687490'),
('Miclert', 8544, '4451653456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `idPedido` int(11) NOT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `idDireccion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `idDireccion` (`idDireccion`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

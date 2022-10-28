-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 17-12-2020 a las 09:31:30
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
-- Base de datos: `clinica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cama_paciente`
--

DROP TABLE IF EXISTS `cama_paciente`;
CREATE TABLE IF NOT EXISTS `cama_paciente` (
  `ID_Cama` varchar(50) NOT NULL,
  `num_cama` varchar(50) DEFAULT NULL,
  `piso` varchar(5) DEFAULT NULL,
  `seccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Cama`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cama_paciente`
--

INSERT INTO `cama_paciente` (`ID_Cama`, `num_cama`, `piso`, `seccion`) VALUES
('008', '08', '01', 'General'),
('048', '48', '02', 'Urgencias'),
('045', '45', '02', 'General'),
('025', '25', '02', 'Oncología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto_emergencia`
--

DROP TABLE IF EXISTS `contacto_emergencia`;
CREATE TABLE IF NOT EXISTS `contacto_emergencia` (
  `nom_Contacto` varchar(120) NOT NULL,
  `edad_C` varchar(5) DEFAULT NULL,
  `num_INE` varchar(50) DEFAULT NULL,
  `parent` varchar(50) DEFAULT NULL,
  `ocup_Cont` varchar(100) DEFAULT NULL,
  `dir_Contacto` varchar(120) DEFAULT NULL,
  `telContacto` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`nom_Contacto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `contacto_emergencia`
--

INSERT INTO `contacto_emergencia` (`nom_Contacto`, `edad_C`, `num_INE`, `parent`, `ocup_Cont`, `dir_Contacto`, `telContacto`) VALUES
('Luis Javier Acosta Vargas', '37', 'S/I', 'Hermano', 'EMPLEADO DE GOBIERNO', 'S/I', '229-528-8389'),
('Lisset Moreno Diaz', '22', 'S/I', 'Hija', 'ABOGADA', 'S/I', '249-172-6923'),
('Eduardo Sanchez Marin', '56', 'S/I', 'Padre', 'OBRERO', 'S/I', '229-335-4555'),
('Marta Carrera Leal', '56', 'S/I', 'Madre', 'LABOR DEL HOGAR', 'S/I', '229-235-0857');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
CREATE TABLE IF NOT EXISTS `especialidad` (
  `codigo_Esp` varchar(50) NOT NULL,
  `nom_Esp` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo_Esp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`codigo_Esp`, `nom_Esp`) VALUES
('89993', 'Medicina familiar'),
('89992', 'Cardiología'),
('89991', 'Oncología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_clinico`
--

DROP TABLE IF EXISTS `historial_clinico`;
CREATE TABLE IF NOT EXISTS `historial_clinico` (
  `fecha_adm` datetime NOT NULL,
  `padecim` varchar(150) DEFAULT NULL,
  `tratam` varchar(150) DEFAULT NULL,
  `observ_gen` varchar(255) DEFAULT NULL,
  `fecha_alt` datetime DEFAULT NULL,
  `clave_visit` varchar(50) DEFAULT NULL,
  `id_cama` varchar(50) DEFAULT NULL,
  `nom_contacto` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`fecha_adm`),
  KEY `clave_visit` (`clave_visit`),
  KEY `id_cama` (`id_cama`),
  KEY `nom_contacto` (`nom_contacto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historial_clinico`
--

INSERT INTO `historial_clinico` (`fecha_adm`, `padecim`, `tratam`, `observ_gen`, `fecha_alt`, `clave_visit`, `id_cama`, `nom_contacto`) VALUES
('2019-03-12 00:00:00', 'S/P', 'Cirugía/Medicación', 'Operación programada para el 13-03', '2019-03-22 00:00:00', '3008945', '025', 'Marta Carrera Leal'),
('2020-04-16 00:00:00', 'S/P', 'Amikacina aplicar una ampolleta intramuscular/Eritromicina cada 6 horas/ Bromexina cada 8 horas', 'En aislamiento, chequeo de signos vitales', NULL, '3009900', '048', 'Lisset Moreno Diaz'),
('2020-05-14 00:00:00', 'Hipertensa', 'Telmisartan tabletas cada 12 horas/suero', 'Chequeo de signos vitales', '2020-05-16 00:00:00', '3009901', '008', 'Luis Javier Acosta Vargas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

DROP TABLE IF EXISTS `medicos`;
CREATE TABLE IF NOT EXISTS `medicos` (
  `cedula` varchar(50) NOT NULL,
  `nomMed` varchar(120) DEFAULT NULL,
  `dirMedico` varchar(150) DEFAULT NULL,
  `telMedico` varchar(20) DEFAULT NULL,
  `RFC_Med` varchar(50) DEFAULT NULL,
  `horario` varchar(15) DEFAULT NULL,
  `especialidad` varchar(80) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cedula`),
  KEY `codigo` (`codigo`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`cedula`, `nomMed`, `dirMedico`, `telMedico`, `RFC_Med`, `horario`, `especialidad`, `codigo`) VALUES
('3396821', 'NAYADE MIRANDA FLORES', NULL, 'SN', 'MIFN861105KL2', '06:00-14:30', 'Medico familiar', '89993'),
('3422883', 'NOE AGUILAR SANTOS', NULL, '229-005-6991', 'AGSN900812LD8', '14:30-21:00', 'Medico familiar', '89993'),
('7783327', 'LILIANA CASTILLO ROSAS', NULL, '227-322-9870', 'CARL750405MB4', '14:30-21:00', 'Oncóloga', '89991'),
('3458849', 'MARIO REYES CRUZ', NULL, '399-456-6434', 'RECM800204RT3', '06:00-14:30', 'Oncólogo', '89991');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
  `num_Seg` varchar(50) NOT NULL,
  `RFC_Pac` varchar(50) DEFAULT NULL,
  `cp` varchar(10) DEFAULT NULL,
  `nomComp` varchar(120) DEFAULT NULL,
  `sexo` varchar(20) DEFAULT NULL,
  `grupoSan` varchar(50) DEFAULT NULL,
  `peso` int(11) DEFAULT NULL,
  `telPaciente` varchar(20) DEFAULT NULL,
  `diPaciente` varchar(100) DEFAULT NULL,
  `ocupacionPac` varchar(120) DEFAULT NULL,
  `estatura` int(11) DEFAULT NULL,
  `fdh` datetime DEFAULT NULL,
  PRIMARY KEY (`num_Seg`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`num_Seg`, `RFC_Pac`, `cp`, `nomComp`, `sexo`, `grupoSan`, `peso`, `telPaciente`, `diPaciente`, `ocupacionPac`, `estatura`, `fdh`) VALUES
('8929600', 'MODI740205RC8', NULL, 'ALEXA MORENO DIAZ', 'F', 'O +', 65, '229-7750-834', NULL, 'SECRETARIA', 2, '1974-02-05 00:00:00'),
('8956304', 'SAMS850705ZP4', NULL, 'SERGIO SANCHEZ MARIN', 'M', 'A +', 87, '227-455-8402', NULL, 'ABOGADO', 2, '1985-07-05 00:00:00'),
('8978458', 'CALC900402ML9', NULL, 'CARMINA CARRERA LEAL', 'F', 'O +', 100, 'S/T', NULL, 'LABORES DEL HOGAR', 2, '1990-04-02 00:00:00'),
('8928905', 'ACVJ931203PR3', NULL, 'JUAN ACOSTA VARGAS', 'M', 'O +', 90, 'S/T', NULL, 'PERITO', 2, '1992-12-03 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita_medica`
--

DROP TABLE IF EXISTS `visita_medica`;
CREATE TABLE IF NOT EXISTS `visita_medica` (
  `clave_visit` varchar(50) NOT NULL,
  `fecha_V` datetime DEFAULT NULL,
  `diagnost` varchar(200) DEFAULT NULL,
  `sign_vit` varchar(100) DEFAULT NULL,
  `observ` varchar(255) DEFAULT NULL,
  `num_seg` varchar(50) DEFAULT NULL,
  `cedula` varchar(50) DEFAULT NULL,
  `medico` varchar(50) DEFAULT NULL,
  `paciente` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`clave_visit`),
  KEY `num_seg` (`num_seg`),
  KEY `cedula` (`cedula`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `visita_medica`
--

INSERT INTO `visita_medica` (`clave_visit`, `fecha_V`, `diagnost`, `sign_vit`, `observ`, `num_seg`, `cedula`, `medico`, `paciente`) VALUES
('3009901', '2020-05-14 00:00:00', 'Hipertensión', '160/100- 74- 37.0C', 'Ingreso a clínica por urgencias', '8978458', '3396821', 'Nayade', 'CARMINA'),
('3009900', '2020-04-16 00:00:00', 'Covid-19', '140/90- 70- 37.9C', 'Aislamiento y tratamiento', '8956304', '3422883', 'Noe', 'SERGIO'),
('3008946', '2019-03-15 00:00:00', 'Diabetes', '150/90- 74- 37.0CC', 'Consulta general', '8929600', '3422883', 'Noe', 'JUAN'),
('3008945', '2019-03-12 00:00:00', 'Quistes abdominales', '120/80– 62– 36.0C', 'Dolor abdominal, sangrado', '8929600', '3458849', 'Mario', 'ALEXA');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

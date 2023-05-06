-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2022 a las 04:34:38
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `problema8`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chofer`
--

CREATE TABLE `chofer` (
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `cedula` varchar(20) NOT NULL,
  `grado_licencia` varchar(20) DEFAULT NULL,
  `fecha_expiracion_licencia` date DEFAULT NULL,
  `nombreLT` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `choque`
--

CREATE TABLE `choque` (
  `idc` int(4) NOT NULL,
  `valor` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `descripcion` varchar(20) DEFAULT NULL,
  `cedula` varchar(20) NOT NULL,
  `placa` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conduce`
--

CREATE TABLE `conduce` (
  `cedula` varchar(20) NOT NULL,
  `placa` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea_transporte`
--

CREATE TABLE `linea_transporte` (
  `nombreLT` varchar(20) NOT NULL,
  `dueño` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multa`
--

CREATE TABLE `multa` (
  `idm` int(4) NOT NULL,
  `valor` float DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `descripcion` varchar(40) DEFAULT NULL,
  `cedula` varchar(20) NOT NULL,
  `placa` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `nombreLT` varchar(20) NOT NULL,
  `ruta` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `placa` varchar(20) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `año` date NOT NULL,
  `color` varchar(20) NOT NULL,
  `capacidad` int(3) NOT NULL,
  `nombreLT` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `chofer`
--
ALTER TABLE `chofer`
  ADD PRIMARY KEY (`cedula`),
  ADD KEY `nombreLT` (`nombreLT`);

--
-- Indices de la tabla `choque`
--
ALTER TABLE `choque`
  ADD PRIMARY KEY (`idc`,`cedula`,`placa`) USING BTREE,
  ADD KEY `cedula` (`cedula`),
  ADD KEY `placa` (`placa`);

--
-- Indices de la tabla `conduce`
--
ALTER TABLE `conduce`
  ADD PRIMARY KEY (`cedula`,`placa`),
  ADD KEY `placa` (`placa`);

--
-- Indices de la tabla `linea_transporte`
--
ALTER TABLE `linea_transporte`
  ADD PRIMARY KEY (`nombreLT`);

--
-- Indices de la tabla `multa`
--
ALTER TABLE `multa`
  ADD PRIMARY KEY (`idm`,`cedula`,`placa`) USING BTREE,
  ADD KEY `placa` (`placa`),
  ADD KEY `cedula` (`cedula`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD PRIMARY KEY (`ruta`,`nombreLT`) USING BTREE,
  ADD KEY `nombreLT` (`nombreLT`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `nombreLT` (`nombreLT`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `chofer`
--
ALTER TABLE `chofer`
  ADD CONSTRAINT `chofer_ibfk_1` FOREIGN KEY (`nombreLT`) REFERENCES `linea_transporte` (`nombreLT`);

--
-- Filtros para la tabla `choque`
--
ALTER TABLE `choque`
  ADD CONSTRAINT `choque_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `chofer` (`cedula`),
  ADD CONSTRAINT `choque_ibfk_2` FOREIGN KEY (`placa`) REFERENCES `unidades` (`placa`);

--
-- Filtros para la tabla `conduce`
--
ALTER TABLE `conduce`
  ADD CONSTRAINT `conduce_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `chofer` (`cedula`),
  ADD CONSTRAINT `conduce_ibfk_2` FOREIGN KEY (`placa`) REFERENCES `unidades` (`placa`);

--
-- Filtros para la tabla `multa`
--
ALTER TABLE `multa`
  ADD CONSTRAINT `multa_ibfk_1` FOREIGN KEY (`placa`) REFERENCES `unidades` (`placa`),
  ADD CONSTRAINT `multa_ibfk_2` FOREIGN KEY (`cedula`) REFERENCES `chofer` (`cedula`);

--
-- Filtros para la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD CONSTRAINT `ruta_ibfk_1` FOREIGN KEY (`nombreLT`) REFERENCES `linea_transporte` (`nombreLT`);

--
-- Filtros para la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD CONSTRAINT `unidades_ibfk_1` FOREIGN KEY (`nombreLT`) REFERENCES `linea_transporte` (`nombreLT`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

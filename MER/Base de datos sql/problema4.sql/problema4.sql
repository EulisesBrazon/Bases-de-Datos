-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2022 a las 04:33:45
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
-- Base de datos: `problema4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `nomCliente` varchar(20) NOT NULL,
  `propietario` varchar(20) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispone`
--

CREATE TABLE `dispone` (
  `IDI` int(4) NOT NULL,
  `cedula` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guardia`
--

CREATE TABLE `guardia` (
  `IDT` int(4) NOT NULL,
  `cedula` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `guardian100`
--

CREATE TABLE `guardian100` (
  `contador` int(4) DEFAULT NULL,
  `nomCliente` varchar(20) DEFAULT NULL,
  `NS` int(4) NOT NULL,
  `descripcion` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `implementos`
--

CREATE TABLE `implementos` (
  `IDI` int(4) NOT NULL,
  `pistola` tinyint(1) DEFAULT NULL,
  `escopeta` tinyint(1) DEFAULT NULL,
  `rolo` tinyint(1) DEFAULT NULL,
  `manoplas` tinyint(1) DEFAULT NULL,
  `esposas` tinyint(1) DEFAULT NULL,
  `gasPimienta` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `telefono` varchar(20) NOT NULL,
  `nomCliente` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `turno`
--

CREATE TABLE `turno` (
  `IDT` int(4) NOT NULL,
  `descripcion` varchar(40) DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vigilante`
--

CREATE TABLE `vigilante` (
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `NS` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`nomCliente`);

--
-- Indices de la tabla `dispone`
--
ALTER TABLE `dispone`
  ADD PRIMARY KEY (`IDI`,`cedula`) USING BTREE,
  ADD KEY `IDI` (`IDI`),
  ADD KEY `cedula` (`cedula`);

--
-- Indices de la tabla `guardia`
--
ALTER TABLE `guardia`
  ADD PRIMARY KEY (`IDT`,`cedula`),
  ADD KEY `IDT` (`IDT`),
  ADD KEY `cedula` (`cedula`);

--
-- Indices de la tabla `guardian100`
--
ALTER TABLE `guardian100`
  ADD PRIMARY KEY (`NS`),
  ADD KEY `nomCliente` (`nomCliente`);

--
-- Indices de la tabla `implementos`
--
ALTER TABLE `implementos`
  ADD PRIMARY KEY (`IDI`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`telefono`,`nomCliente`),
  ADD KEY `nomCliente` (`nomCliente`);

--
-- Indices de la tabla `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`IDT`);

--
-- Indices de la tabla `vigilante`
--
ALTER TABLE `vigilante`
  ADD PRIMARY KEY (`cedula`),
  ADD KEY `NS` (`NS`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dispone`
--
ALTER TABLE `dispone`
  ADD CONSTRAINT `dispone_ibfk_1` FOREIGN KEY (`IDI`) REFERENCES `implementos` (`IDI`),
  ADD CONSTRAINT `dispone_ibfk_2` FOREIGN KEY (`cedula`) REFERENCES `vigilante` (`cedula`);

--
-- Filtros para la tabla `guardia`
--
ALTER TABLE `guardia`
  ADD CONSTRAINT `guardia_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `vigilante` (`cedula`),
  ADD CONSTRAINT `guardia_ibfk_2` FOREIGN KEY (`IDT`) REFERENCES `turno` (`IDT`);

--
-- Filtros para la tabla `guardian100`
--
ALTER TABLE `guardian100`
  ADD CONSTRAINT `guardian100_ibfk_1` FOREIGN KEY (`nomCliente`) REFERENCES `cliente` (`nomCliente`);

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`nomCliente`) REFERENCES `cliente` (`nomCliente`);

--
-- Filtros para la tabla `vigilante`
--
ALTER TABLE `vigilante`
  ADD CONSTRAINT `vigilante_ibfk_1` FOREIGN KEY (`NS`) REFERENCES `guardian100` (`NS`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

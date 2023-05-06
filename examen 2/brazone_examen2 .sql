-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-07-2022 a las 20:22:39
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `brazone_examen2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuerpo_tecnico`
--

CREATE TABLE `cuerpo_tecnico` (
  `CIP` int(8) NOT NULL,
  `IDE` int(5) NOT NULL,
  `Cargo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuerpo_tecnico`
--

INSERT INTO `cuerpo_tecnico` (`CIP`, `IDE`, `Cargo`) VALUES
(10000000, 20000, 'Entrenador'),
(20000000, 40000, 'Entrenador'),
(30000000, 50000, 'Representante'),
(40000000, 30000, 'Entrenador'),
(50000000, 10000, 'Entrenador'),
(60000000, 50000, 'Entrenador'),
(70000000, 20000, 'Representante'),
(80000000, 10000, 'Organizador'),
(90000000, 30000, 'Representante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `IDE` int(5) NOT NULL,
  `Deporte` varchar(20) DEFAULT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `F_Creacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`IDE`, `Deporte`, `Nombre`, `F_Creacion`) VALUES
(10000, 'Beisbol', 'Bisontes', '2021-01-12'),
(20000, 'Footbool', 'Vikingos', '2021-01-13'),
(30000, 'Natacion', 'Tiburones', '2021-01-14'),
(40000, 'Ciclismo', 'Gepardo', '2021-01-15'),
(50000, 'Karate', 'Familia Marcial', '2021-01-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `CIE` int(8) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Apellido` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`CIE`, `Nombre`, `Apellido`) VALUES
(10000100, 'Álvaro', 'Ortiz'),
(10000110, 'Adrián', 'Salazar'),
(10000120, 'David', 'Guzman'),
(10000130, 'Mario', 'Henrrique'),
(10000140, 'Enzo', 'Navarro'),
(10000150, 'Diego', 'Aguilera'),
(10000160, 'Marcos', 'Parra'),
(10000170, 'Izan', 'Romero'),
(10000180, 'Javier', 'Ruiz'),
(10000190, 'Marco', 'Lagos'),
(10000200, 'Álex', 'Pina'),
(10000210, 'Bruno', 'Moreno'),
(10000220, 'Oliver', 'Alvarado'),
(10000230, 'Miguel', 'Mendoza'),
(10000240, 'Thiago', 'Fariaz'),
(10000250, 'Antonio', 'Soto'),
(10000260, 'Marc', 'Silva');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `integrante`
--

CREATE TABLE `integrante` (
  `CIE` int(8) NOT NULL,
  `IDE` int(5) NOT NULL,
  `Posicion` varchar(20) DEFAULT NULL,
  `F_Ingreso` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `integrante`
--

INSERT INTO `integrante` (`CIE`, `IDE`, `Posicion`, `F_Ingreso`) VALUES
(10000100, 10000, 'Lanzador', '2022-01-01'),
(10000110, 50000, 'Cinta Negra', '2022-01-02'),
(10000120, 20000, 'Portero', '2022-01-03'),
(10000130, 30000, 'Braza', '2022-01-04'),
(10000140, 40000, 'Ciclista', '2022-01-05'),
(10000150, 20000, 'Centrocampista', '2022-01-06'),
(10000160, 40000, 'Ciclista', '2022-01-07'),
(10000170, 10000, 'Receptor', '2022-01-08'),
(10000180, 50000, 'Cinta Naranja', '2022-01-09'),
(10000190, 20000, 'Delantero', '2022-01-10'),
(10000200, 30000, 'Espalda', '2022-01-11'),
(10000210, 10000, 'Primera Base', '2022-01-12'),
(10000220, 20000, 'Defensa', '2022-01-13'),
(10000230, 40000, 'Ciclista', '2022-01-14'),
(10000240, 10000, 'Tercera Base', '2022-01-15'),
(10000250, 30000, 'Mariposa', '2022-01-16'),
(10000260, 10000, 'Segunda base', '2022-01-17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participacion`
--

CREATE TABLE `participacion` (
  `IDE` int(5) NOT NULL,
  `IDT` int(5) NOT NULL,
  `Resultado` varchar(20) DEFAULT NULL,
  `F_Participacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `participacion`
--

INSERT INTO `participacion` (`IDE`, `IDT`, `Resultado`, `F_Participacion`) VALUES
(10000, 40000, 'No Clasifico', '2021-02-12'),
(20000, 10000, 'ganador', '2021-02-13'),
(30000, 30000, 'Primer Lugar', '2021-02-14'),
(40000, 30000, 'Segundo Lugar', '2021-02-15'),
(50000, 20000, 'Tercer Lugar', '2021-02-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `CIP` int(8) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Apllido` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`CIP`, `Nombre`, `Apllido`) VALUES
(10000000, 'Hugo', 'Molina'),
(20000000, 'Martín', 'Cega'),
(30000000, 'Lucas', 'Campos'),
(40000000, 'Mateo', 'Sandocal'),
(50000000, 'Leo', 'Orellana'),
(60000000, 'Daniel', 'Cardenas'),
(70000000, 'Alejandro', 'Olivares'),
(80000000, 'Pablo', 'Alarcon'),
(90000000, 'Manuel', 'Gallardo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tle_p`
--

CREATE TABLE `tle_p` (
  `CIP` int(8) NOT NULL,
  `telefono` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tle_p`
--

INSERT INTO `tle_p` (`CIP`, `telefono`) VALUES
(10000000, 12345610),
(20000000, 12345620),
(30000000, 12345630),
(40000000, 12345640),
(50000000, 12345650),
(60000000, 12345660),
(70000000, 12345670),
(80000000, 12345680),
(90000000, 12345690);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tlf_e`
--

CREATE TABLE `tlf_e` (
  `CIE` int(8) NOT NULL,
  `telefono` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tlf_e`
--

INSERT INTO `tlf_e` (`CIE`, `telefono`) VALUES
(10000100, 1004567),
(10000110, 1104568),
(10000120, 1204569),
(10000130, 1304570),
(10000140, 1404571),
(10000150, 1504572),
(10000160, 1604573),
(10000170, 1704574),
(10000180, 1804575),
(10000190, 1904576),
(10000200, 2004577),
(10000210, 2104578),
(10000220, 2204579),
(10000230, 2304580),
(10000240, 2404581),
(10000250, 2504582),
(10000260, 2604583);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneo`
--

CREATE TABLE `torneo` (
  `IDT` int(5) NOT NULL,
  `Nombre` varchar(20) DEFAULT NULL,
  `Ubicación` varchar(20) DEFAULT NULL,
  `Premio` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `torneo`
--

INSERT INTO `torneo` (`IDT`, `Nombre`, `Ubicación`, `Premio`) VALUES
(10000, 'Torneo sin fronteras', 'Guanta', 'Copa sin Fronteras'),
(20000, 'Concurso regional', 'Lecheria', 'Copa Regional'),
(30000, 'Copa de la victoria', 'BNA', 'Medalla de la Victoria'),
(40000, 'Torneo Casa Real', 'PLC', 'Copa Casa Real');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cuerpo_tecnico`
--
ALTER TABLE `cuerpo_tecnico`
  ADD PRIMARY KEY (`CIP`,`IDE`),
  ADD KEY `CIP` (`CIP`),
  ADD KEY `IDE` (`IDE`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`IDE`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`CIE`);

--
-- Indices de la tabla `integrante`
--
ALTER TABLE `integrante`
  ADD PRIMARY KEY (`CIE`,`IDE`),
  ADD KEY `CIE` (`CIE`),
  ADD KEY `IDE` (`IDE`);

--
-- Indices de la tabla `participacion`
--
ALTER TABLE `participacion`
  ADD PRIMARY KEY (`IDE`,`IDT`),
  ADD KEY `IDE` (`IDE`),
  ADD KEY `IDT` (`IDT`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`CIP`);

--
-- Indices de la tabla `tle_p`
--
ALTER TABLE `tle_p`
  ADD PRIMARY KEY (`CIP`,`telefono`),
  ADD KEY `CIP` (`CIP`);

--
-- Indices de la tabla `tlf_e`
--
ALTER TABLE `tlf_e`
  ADD PRIMARY KEY (`CIE`,`telefono`),
  ADD KEY `CIE` (`CIE`);

--
-- Indices de la tabla `torneo`
--
ALTER TABLE `torneo`
  ADD PRIMARY KEY (`IDT`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cuerpo_tecnico`
--
ALTER TABLE `cuerpo_tecnico`
  ADD CONSTRAINT `cuerpo_tecnico_ibfk_1` FOREIGN KEY (`CIP`) REFERENCES `profesor` (`CIP`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`IDE`) REFERENCES `cuerpo_tecnico` (`IDE`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`CIE`) REFERENCES `tlf_e` (`CIE`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `integrante`
--
ALTER TABLE `integrante`
  ADD CONSTRAINT `integrante_ibfk_1` FOREIGN KEY (`CIE`) REFERENCES `estudiante` (`CIE`) ON UPDATE CASCADE,
  ADD CONSTRAINT `integrante_ibfk_2` FOREIGN KEY (`IDE`) REFERENCES `equipo` (`IDE`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `participacion`
--
ALTER TABLE `participacion`
  ADD CONSTRAINT `participacion_ibfk_1` FOREIGN KEY (`IDE`) REFERENCES `equipo` (`IDE`) ON UPDATE CASCADE,
  ADD CONSTRAINT `participacion_ibfk_2` FOREIGN KEY (`IDT`) REFERENCES `torneo` (`IDT`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`CIP`) REFERENCES `tle_p` (`CIP`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

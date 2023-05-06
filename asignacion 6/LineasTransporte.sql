-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2022 a las 07:41:44
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
-- Base de datos: `brazonbaezasignacion_06`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `chofer_choque` ()   BEGIN
	DECLARE  Nombre, Apellido, Placa, Marca, Modelo TEXT;
    DECLARE salida BOOLEAN DEFAULT FALSE;
	DECLARE cursor2 CURSOR FOR SELECT chofer.Nombre, chofer.Apellido, unidades.Placa, unidades.Marca, unidades.Modelo 
    	FROM chofer, unidades, choque WHERE choque.Placa = unidades.Placa AND choque.Cedula = chofer.Cedula;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET salida = TRUE; 
    OPEN cursor2;
    cursor2: LOOP
    FETCH FROM cursor2 INTO Nombre, Apellido, Placa, Marca, Modelo;
        IF salida THEN
        	LEAVE cursor2;
    	END  IF;
    SELECT Nombre, Apellido, Placa, Marca, Modelo;
    END LOOP cursor2;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `chofer_Multa` ()   BEGIN
	DECLARE Nombre, Apellido, Multa TEXT;
    DECLARE salida BOOLEAN DEFAULT FALSE;
	DECLARE cursor4 CURSOR FOR SELECT chofer.Nombre, chofer.Apellido, multa.Descripcion FROM chofer,multa WHERE 		multa.Cedula = chofer.Cedula;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET salida = TRUE; 
    OPEN cursor4;
    cursor4: LOOP
    FETCH FROM cursor4 INTO Nombre, Apellido, Multa;
        IF salida THEN
        	LEAVE cursor4;
    	END  IF;
    SELECT Nombre, Apellido, Multa;
    END LOOP cursor4;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `chofe_conduce` ()   BEGIN
	DECLARE Nombre, Apellido, Marca, Modelo TEXT;
    DECLARE salida BOOLEAN DEFAULT FALSE;
	DECLARE cursor5 CURSOR FOR SELECT chofer.Nombre, chofer.Apellido, unidades.Marca, unidades.Modelo FROM chofer, unidades, conduce 			WHERE conduce.Cedula = chofer.Cedula AND conduce.Placa = unidades.Placa;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET salida = TRUE; 
    OPEN cursor5;
    cursor5: LOOP
    FETCH FROM cursor5 INTO Nombre, Apellido, Marca, Modelo;
        IF salida THEN
        	LEAVE cursor5;
    	END  IF;
    SELECT Nombre, Apellido, Marca, Modelo;
    END LOOP cursor5;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `linea_ruta` ()   BEGIN
	DECLARE NombreLT, Ruta TEXT;
    DECLARE salida BOOLEAN DEFAULT FALSE;
	DECLARE cursor3 CURSOR FOR SELECT linea_transporte.NombreLT, ruta.Ruta FROM linea_transporte,ruta 
    	WHERE ruta.RIF_LT = linea_transporte.RIF;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET salida = TRUE; 
    OPEN cursor3;
    cursor3: LOOP
    FETCH FROM cursor3 INTO NombreLT, Ruta ;
        IF salida THEN
        	LEAVE cursor3;
    	END  IF;
    SELECT NombreLT, Ruta ;
    END LOOP cursor3;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nombrePLT` ()   BEGIN
	DECLARE nombre TEXT;
    DECLARE apellido TEXT;
    DECLARE linea TEXT;
    DECLARE salida BOOLEAN DEFAULT FALSE;
	DECLARE cursor1 CURSOR FOR SELECT propietario.Nombre, propietario.Apellido, linea_transporte.NombreLT FROM	propietario, linea_transporte, junta WHERE 							junta.CI_Propietario = propietario.CI_Propietario AND junta.RIF_LT = linea_transporte.RIF;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET salida = TRUE; 
    OPEN cursor1;
    cursor1: LOOP
    FETCH FROM cursor1 INTO nombre, apellido, linea;
        IF salida THEN
        	LEAVE cursor1;
    	END  IF;
    SELECT nombre, apellido, linea;
    END LOOP cursor1;
	END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chofer`
--

CREATE TABLE `chofer` (
  `Cedula` int(8) NOT NULL,
  `Nombre` varchar(7) DEFAULT NULL,
  `Apellido` varchar(9) DEFAULT NULL,
  `Grado_Licencia` int(1) DEFAULT NULL,
  `Fecha_Expiracion_Licencia` varchar(10) DEFAULT NULL,
  `RIF_LT` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `chofer`
--

INSERT INTO `chofer` (`Cedula`, `Nombre`, `Apellido`, `Grado_Licencia`, `Fecha_Expiracion_Licencia`, `RIF_LT`) VALUES
(10000100, 'Álvaro', 'Ortiz', 5, '2023-01-01', 'R100010'),
(10000110, 'Adrián', 'Salazar', 5, '2023-01-02', 'R100020'),
(10000120, 'David', 'Guzman', 5, '2023-01-03', 'R100030'),
(10000130, 'Mario', 'Henrrique', 5, '2023-01-04', 'R100040'),
(10000140, 'Enzo', 'Navarro', 5, '2023-01-05', 'R100050'),
(10000150, 'Diego', 'Aguilera', 5, '2023-01-06', 'R100010'),
(10000160, 'Marcos', 'Parra', 5, '2023-01-07', 'R100020'),
(10000170, 'Izan', 'Romero', 5, '2023-01-08', 'R100030'),
(10000180, 'Javier', 'Ruiz', 5, '2023-01-09', 'R100040'),
(10000190, 'Marco', 'Lagos', 5, '2023-01-10', 'R100050'),
(10000200, 'Álex', 'Pina', 5, '2023-01-11', 'R100010'),
(10000210, 'Bruno', 'Moreno', 5, '2023-01-12', 'R100020'),
(10000220, 'Oliver', 'Alvarado', 5, '2023-01-13', 'R100030'),
(10000230, 'Miguel', 'Mendoza', 5, '2023-01-14', 'R100040'),
(10000240, 'Thiago', 'Fariaz', 5, '2023-01-15', 'R100050'),
(10000250, 'Antonio', 'Soto', 5, '2023-01-16', 'R100010'),
(10000260, 'Marc', 'Silva', 5, '2023-01-17', 'R100020');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `choque`
--

CREATE TABLE `choque` (
  `IDC` int(1) NOT NULL,
  `Placa` varchar(8) DEFAULT NULL,
  `Valor` int(2) DEFAULT NULL,
  `Fecha` varchar(10) DEFAULT NULL,
  `Descripcion` varchar(19) DEFAULT NULL,
  `Cedula` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `choque`
--

INSERT INTO `choque` (`IDC`, `Placa`, `Valor`, `Fecha`, `Descripcion`, `Cedula`) VALUES
(1, '3215 NGP', 10, '2022-07-14', 'accidente', 10000100),
(2, '7577 KRU', 20, '2022-07-15', 'estado de ebriedad', 10000110),
(3, '7917 XRU', 30, '2022-07-16', 'falta en semaforo', 10000120),
(4, '3580 UGT', 40, '2022-07-17', 'falla en los frenos', 10000130),
(5, '7268 IEY', 50, '2022-07-18', 'accdente', 10000140);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `conduce`
--

CREATE TABLE `conduce` (
  `Cedula` int(8) NOT NULL,
  `Placa` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `conduce`
--

INSERT INTO `conduce` (`Cedula`, `Placa`) VALUES
(10000100, '3646 KCY'),
(10000110, '5040 KUJ'),
(10000120, '5040 KUJ'),
(10000130, '3130 NIP'),
(10000140, '3215 NGP'),
(10000150, '7577 KRU'),
(10000160, '7917 XRU'),
(10000170, '3580 UGT'),
(10000180, '7268 IEY'),
(10000190, '9913 UEY'),
(10000200, '5577 TWL'),
(10000210, '6654 HRO'),
(10000220, '4076 CRS'),
(10000230, '3929 YVY'),
(10000240, '0130 XPH'),
(10000250, '2050 PQJ'),
(10000260, '7678 MEQ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `junta`
--

CREATE TABLE `junta` (
  `CI_Propietario` int(8) DEFAULT NULL,
  `RIF_LT` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `junta`
--

INSERT INTO `junta` (`CI_Propietario`, `RIF_LT`) VALUES
(10000000, 'R100010'),
(20000000, 'R100020'),
(30000000, 'R100030'),
(40000000, 'R100040'),
(50000000, 'R100050'),
(60000000, 'R100010'),
(70000000, 'R100020'),
(80000000, 'R100030'),
(90000000, 'R100040');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea_transporte`
--

CREATE TABLE `linea_transporte` (
  `RIF` varchar(7) NOT NULL,
  `NombreLT` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `linea_transporte`
--

INSERT INTO `linea_transporte` (`RIF`, `NombreLT`) VALUES
('R100010', 'Flota de Transportes Andinos.'),
('R100020', 'Grupo de Transporte Multidestino'),
('R100030', 'Staff de Expertos en Transportes'),
('R100040', 'Servicio de Cargas Nacional'),
('R100050', 'Todo Terreno en Transportes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `multa`
--

CREATE TABLE `multa` (
  `IDM` int(1) NOT NULL,
  `Placa` varchar(8) DEFAULT NULL,
  `Valor` int(2) DEFAULT NULL,
  `Fecha` varchar(10) DEFAULT NULL,
  `Descripcion` varchar(18) DEFAULT NULL,
  `Cedula` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `multa`
--

INSERT INTO `multa` (`IDM`, `Placa`, `Valor`, `Fecha`, `Descripcion`, `Cedula`) VALUES
(1, '6654 HRO', 12, '2022-01-01', 'exeso de caga', 10000220),
(2, '4076 CRS', 15, '2022-01-02', 'exeso de velocidad', 10000230),
(3, '3929 YVY', 20, '2022-01-03', 'cruce no perminito', 10000240),
(4, '0130 XPH', 25, '2022-01-04', 'sentido contrario', 10000250);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `CI_Propietario` int(8) NOT NULL,
  `Nombre` varchar(9) DEFAULT NULL,
  `Apellido` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`CI_Propietario`, `Nombre`, `Apellido`) VALUES
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
-- Estructura de tabla para la tabla `ruta`
--

CREATE TABLE `ruta` (
  `RIF_LT` varchar(7) DEFAULT NULL,
  `Ruta` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ruta`
--

INSERT INTO `ruta` (`RIF_LT`, `Ruta`) VALUES
('R100010', 'Alterna'),
('R100020', 'Intercomunal'),
('R100030', 'naricual'),
('R100040', 'el tigre'),
('R100050', 'pLc'),
('R100010', 'cajigal'),
('R100020', 'alterna'),
('R100030', 'intercomunal'),
('R100040', 'la costanera'),
('R100050', 'la asuncion'),
('R100010', 'tronconal'),
('R100020', 'mayorquin'),
('R100030', 'Avenida caracas'),
('R100040', 'Intercomunal'),
('R100050', 'Alterna');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

CREATE TABLE `unidades` (
  `Placa` varchar(8) NOT NULL,
  `Marca` varchar(13) DEFAULT NULL,
  `Modelo` varchar(16) DEFAULT NULL,
  `Fecha` int(4) DEFAULT NULL,
  `Color` varchar(8) DEFAULT NULL,
  `Capacidad` int(2) DEFAULT NULL,
  `RIF_LT` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`Placa`, `Marca`, `Modelo`, `Fecha`, `Color`, `Capacidad`, `RIF_LT`) VALUES
('0130 XPH', 'Mercedez Benz', 'Sprinter', 2012, 'Verde', 30, 'R100050'),
('2050 PQJ', 'Mercedes Benz', 'Ch1636l', 2008, 'Azul', 50, 'R100010'),
('3130 NIP', 'Fiat', 'Ducato Maxicargo', 2006, 'Azul', 20, 'R100040'),
('3215 NGP', 'Mercedez Benz', 'Sprinter', 2005, 'Verde', 30, 'R100050'),
('3580 UGT', 'Fiat', 'Ducato Maxicargo', 2008, 'Rojo', 20, 'R100030'),
('3646 KCY', 'Toyota', 'Coaster ', 2009, 'Azul', 30, 'R100010'),
('3929 YVY', 'Fiat', 'Ducato Maxicargo', 2011, 'Morado', 20, 'R100040'),
('4076 CRS', 'Toyota', 'Coaster ', 2009, 'Negro', 30, 'R100030'),
('5040 KUJ', 'Mercedes Benz', 'Ch1636l', 2008, 'Rojo', 50, 'R100020'),
('5080 KUF', 'Ford', '7000', 2007, 'Amarillo', 40, 'R100030'),
('5577 TWL', 'Toyota', 'Coaster ', 2009, 'Verde', 30, 'R100010'),
('6654 HRO', 'Ford', '7000', 2010, 'Blano', 40, 'R100020'),
('7268 IEY', 'Mercedes Benz', 'Ch1636l', 2008, 'Morado', 50, 'R100040'),
('7577 KRU', 'Toyota', 'Coaster ', 2006, 'Blano', 30, 'R100010'),
('7678 MEQ', 'Ford', '7000', 2013, 'Amarillo', 40, 'R100020'),
('7917 XRU', 'Ford', '7000', 2007, 'Negro', 40, 'R100020'),
('9913 UEY', 'Mercedez-Benz', 'Sprinter', 2009, 'Azul', 30, 'R100050');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `chofer`
--
ALTER TABLE `chofer`
  ADD PRIMARY KEY (`Cedula`),
  ADD KEY `RIF_LT` (`RIF_LT`);

--
-- Indices de la tabla `choque`
--
ALTER TABLE `choque`
  ADD PRIMARY KEY (`IDC`),
  ADD KEY `Cedula` (`Cedula`),
  ADD KEY `Placa` (`Placa`);

--
-- Indices de la tabla `conduce`
--
ALTER TABLE `conduce`
  ADD PRIMARY KEY (`Cedula`,`Placa`),
  ADD KEY `Placa` (`Placa`),
  ADD KEY `Cedula` (`Cedula`);

--
-- Indices de la tabla `junta`
--
ALTER TABLE `junta`
  ADD KEY `CI_Propietario` (`CI_Propietario`),
  ADD KEY `RIF_LT` (`RIF_LT`);

--
-- Indices de la tabla `linea_transporte`
--
ALTER TABLE `linea_transporte`
  ADD PRIMARY KEY (`RIF`);

--
-- Indices de la tabla `multa`
--
ALTER TABLE `multa`
  ADD PRIMARY KEY (`IDM`),
  ADD KEY `Cedula` (`Cedula`),
  ADD KEY `Placa` (`Placa`);

--
-- Indices de la tabla `propietario`
--
ALTER TABLE `propietario`
  ADD PRIMARY KEY (`CI_Propietario`);

--
-- Indices de la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD KEY `RIF_LT` (`RIF_LT`),
  ADD KEY `Ruta` (`Ruta`);

--
-- Indices de la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD PRIMARY KEY (`Placa`),
  ADD KEY `RIF_LT` (`RIF_LT`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `chofer`
--
ALTER TABLE `chofer`
  ADD CONSTRAINT `chofer_ibfk_1` FOREIGN KEY (`RIF_LT`) REFERENCES `linea_transporte` (`RIF`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `choque`
--
ALTER TABLE `choque`
  ADD CONSTRAINT `choque_ibfk_1` FOREIGN KEY (`Cedula`) REFERENCES `chofer` (`Cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `choque_ibfk_2` FOREIGN KEY (`Placa`) REFERENCES `unidades` (`Placa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `conduce`
--
ALTER TABLE `conduce`
  ADD CONSTRAINT `conduce_ibfk_1` FOREIGN KEY (`Cedula`) REFERENCES `chofer` (`Cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `conduce_ibfk_2` FOREIGN KEY (`Placa`) REFERENCES `unidades` (`Placa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `junta`
--
ALTER TABLE `junta`
  ADD CONSTRAINT `junta_ibfk_1` FOREIGN KEY (`CI_Propietario`) REFERENCES `propietario` (`CI_Propietario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `junta_ibfk_2` FOREIGN KEY (`RIF_LT`) REFERENCES `linea_transporte` (`RIF`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `multa`
--
ALTER TABLE `multa`
  ADD CONSTRAINT `multa_ibfk_1` FOREIGN KEY (`Cedula`) REFERENCES `chofer` (`Cedula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `multa_ibfk_2` FOREIGN KEY (`Placa`) REFERENCES `unidades` (`Placa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ruta`
--
ALTER TABLE `ruta`
  ADD CONSTRAINT `ruta_ibfk_1` FOREIGN KEY (`RIF_LT`) REFERENCES `linea_transporte` (`RIF`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `unidades`
--
ALTER TABLE `unidades`
  ADD CONSTRAINT `unidades_ibfk_1` FOREIGN KEY (`RIF_LT`) REFERENCES `linea_transporte` (`RIF`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

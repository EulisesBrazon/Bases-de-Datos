-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-07-2022 a las 00:42:59
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
-- Base de datos: `electronicasuper`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `NOMBRE` varchar(20) DEFAULT NULL,
  `APELLIDO` varchar(20) DEFAULT NULL,
  `CEDULA` varchar(20) NOT NULL,
  `DIRECCION` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`NOMBRE`, `APELLIDO`, `CEDULA`, `DIRECCION`) VALUES
('CLAUDIA', 'GONZALES', '15254889', 'BNA'),
('MARIO', 'CASAS', '17895469', 'GUANTA'),
('PATRICIA', 'RODRIGUEZ', '19548663', 'PLC'),
('MANDUH', 'EL GHOUL', '23548796', 'LECHERIA'),
('JOSE', 'MENDEZ', '24568996', 'BNA'),
('LUIS', 'TORREALBA', '25897554', 'LECHERIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componente`
--

CREATE TABLE `componente` (
  `CODIGO` varchar(4) NOT NULL,
  `MARCA` varchar(20) DEFAULT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `PRECIO` float DEFAULT NULL,
  `STOCK` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `componente`
--

INSERT INTO `componente` (`CODIGO`, `MARCA`, `DESCRIPCION`, `PRECIO`, `STOCK`) VALUES
('001', 'SEAGATE', 'DISCO DURO BARRACUDA 1 TB', 65, 40),
('002', 'CORSAIR', 'MEMORIA RAM DDR4 16 GB 3200MHZ', 120, 20),
('003', 'G.SKILL', 'MEMORIA RAM G.SKILL TRIDENTZ RGB 16GB 2X 8GB DDR4 3200HZ', 100, 35),
('004', 'MSI', 'MONITOR MSI 24 75HZ 1 MS 1920 X 1080 HD CURVED', 229, 8),
('005', 'LOGITECH', 'MOUSE DE ALTO RENDIMIENTO GAMING LOGITECH G502 HERO', 60, 50),
('006', 'RAZER', 'TECLADO GAMING RGB CYNOSA CHROMA', 77, 40),
('007', 'INTEL', 'PROCESADOR INTEL CORE I9 11900K 11VA GENERACIÓN', 620, 15),
('008', 'AMD', 'PROCESADOR AMD RYZEN 5 5600G 3.9GHZ AM4', 235, 25),
('009', 'EVGA', 'RTX 3060 EVGA XC GAMING 12 GB GDDR6 DUAL FAN', 680, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componentesolicitados`
--

CREATE TABLE `componentesolicitados` (
  `NF` varchar(4) NOT NULL,
  `CANTIDAD` int(4) DEFAULT NULL,
  `CODIGO` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `componentesolicitados`
--

INSERT INTO `componentesolicitados` (`NF`, `CANTIDAD`, `CODIGO`) VALUES
('0100', 2, '001'),
('0100', 2, '002'),
('0100', 1, '005'),
('0100', 1, '009'),
('0101', 4, '003'),
('0101', 1, '004'),
('0101', 1, '006'),
('0102', 1, '008'),
('0102', 1, '009'),
('0103', 4, '001'),
('0103', 2, '007');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `CEDULA` varchar(20) NOT NULL,
  `NF` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`CEDULA`, `NF`) VALUES
('17895469', '0100'),
('19548663', '0102'),
('23548796', '0103'),
('25897554', '0101');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `contactar_cliente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `contactar_cliente` (
`CEDULA` varchar(20)
,`NOMBRE` varchar(20)
,`TELEFONOCLIENTE` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `NF` varchar(4) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `MONTO` float DEFAULT NULL,
  `MONTO_CON_IVA` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`NF`, `FECHA`, `MONTO`, `MONTO_CON_IVA`) VALUES
('0100', '2022-07-26', 1110, 1287.6),
('0101', '2022-07-26', 706, 818.96),
('0102', '2022-07-27', 915, 1061.4),
('0103', '2022-07-28', 1500, 1740);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `promedio_dia`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `promedio_dia` (
`AVG(MONTO)` double
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono`
--

CREATE TABLE `telefono` (
  `TELEFONOCLIENTE` varchar(20) NOT NULL,
  `CEDULA` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `telefono`
--

INSERT INTO `telefono` (`TELEFONOCLIENTE`, `CEDULA`) VALUES
('02814568090', '23548796'),
('02815462056', '17895469'),
('04125689964', '15254889'),
('04125896880', '24568996'),
('04145056980', '19548663'),
('04165878069', '25897554'),
('04248659084', '23548796');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ver_facturas_hoy`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ver_facturas_hoy` (
`NF` varchar(4)
,`FECHA` date
,`MONTO` float
,`MONTO_CON_IVA` float
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ver_stock`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ver_stock` (
`CODIGO` varchar(4)
,`DESCRIPCION` varchar(100)
,`STOCK` int(3)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ver_stock_min`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ver_stock_min` (
`CODIGO` varchar(4)
,`DESCRIPCION` varchar(100)
,`STOCK` int(3)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `contactar_cliente`
--
DROP TABLE IF EXISTS `contactar_cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `contactar_cliente`  AS SELECT `cliente`.`CEDULA` AS `CEDULA`, `cliente`.`NOMBRE` AS `NOMBRE`, `telefono`.`TELEFONOCLIENTE` AS `TELEFONOCLIENTE` FROM (`cliente` join `telefono`) WHERE `cliente`.`CEDULA` = `telefono`.`CEDULA``CEDULA`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `promedio_dia`
--
DROP TABLE IF EXISTS `promedio_dia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `promedio_dia`  AS SELECT avg(`factura`.`MONTO`) AS `AVG(MONTO)` FROM `factura` WHERE `factura`.`FECHA` = curdate()  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ver_facturas_hoy`
--
DROP TABLE IF EXISTS `ver_facturas_hoy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_facturas_hoy`  AS SELECT `factura`.`NF` AS `NF`, `factura`.`FECHA` AS `FECHA`, `factura`.`MONTO` AS `MONTO`, `factura`.`MONTO_CON_IVA` AS `MONTO_CON_IVA` FROM `factura` WHERE `factura`.`FECHA` = curdate()  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ver_stock`
--
DROP TABLE IF EXISTS `ver_stock`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_stock`  AS SELECT `componente`.`CODIGO` AS `CODIGO`, `componente`.`DESCRIPCION` AS `DESCRIPCION`, `componente`.`STOCK` AS `STOCK` FROM `componente``componente`  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ver_stock_min`
--
DROP TABLE IF EXISTS `ver_stock_min`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ver_stock_min`  AS SELECT `componente`.`CODIGO` AS `CODIGO`, `componente`.`DESCRIPCION` AS `DESCRIPCION`, `componente`.`STOCK` AS `STOCK` FROM `componente` WHERE `componente`.`STOCK` < 2020  ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CEDULA`);

--
-- Indices de la tabla `componente`
--
ALTER TABLE `componente`
  ADD PRIMARY KEY (`CODIGO`);

--
-- Indices de la tabla `componentesolicitados`
--
ALTER TABLE `componentesolicitados`
  ADD PRIMARY KEY (`NF`,`CODIGO`),
  ADD KEY `NF` (`NF`),
  ADD KEY `CODIGO` (`CODIGO`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`CEDULA`,`NF`),
  ADD KEY `CEDULA` (`CEDULA`),
  ADD KEY `NF` (`NF`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`NF`);

--
-- Indices de la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD PRIMARY KEY (`TELEFONOCLIENTE`,`CEDULA`),
  ADD KEY `TELEFONOCLIENTE` (`TELEFONOCLIENTE`),
  ADD KEY `CEDULA` (`CEDULA`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `componente`
--
ALTER TABLE `componente`
  ADD CONSTRAINT `componente_ibfk_1` FOREIGN KEY (`CODIGO`) REFERENCES `componentesolicitados` (`CODIGO`);

--
-- Filtros para la tabla `componentesolicitados`
--
ALTER TABLE `componentesolicitados`
  ADD CONSTRAINT `componentesolicitados_ibfk_1` FOREIGN KEY (`NF`) REFERENCES `factura` (`NF`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`CEDULA`) REFERENCES `cliente` (`CEDULA`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`NF`) REFERENCES `compra` (`NF`);

--
-- Filtros para la tabla `telefono`
--
ALTER TABLE `telefono`
  ADD CONSTRAINT `telefono_ibfk_1` FOREIGN KEY (`CEDULA`) REFERENCES `cliente` (`CEDULA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

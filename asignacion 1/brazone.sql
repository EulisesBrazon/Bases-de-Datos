-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-05-2022 a las 03:53:10
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
-- Base de datos: `brazone`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_cargo` (`cedula_e` INT(5), `NewCargo` VARCHAR(10))   UPDATE empleado SET cargo=NewCargo WHERE cedulae= cedula_e$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_sueldo` (`cedula_e` INT(4), `NewSueldo` INT(4))   UPDATE empleado SET sueldo=NewSueldo WHERE cedulae=cedula_e$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_empleado` (`cedula_B` INT(5))   SELECT * FROM empleado WHERE cedulae= cedula_B$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_negocio` (`rif_B` VARCHAR(4))   SELECT * FROM negocio WHERE rif= rif_B$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_negociosPorUbicacion` (`direccion_B` VARCHAR(10))   SELECT * FROM negocio WHERE direccion= direccion_B$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_propietario` (`cedula_p` INT(4))   SELECT * FROM propietario WHERE cedulap= cedula_p$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `cedulae` int(5) DEFAULT NULL,
  `nombre` varchar(10) DEFAULT NULL,
  `rif` varchar(5) DEFAULT NULL,
  `cargo` varchar(10) DEFAULT NULL,
  `sueldo` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`cedulae`, `nombre`, `rif`, `cargo`, `sueldo`) VALUES
(1000, 'maria', 'J100', 'cajera', 80),
(2000, 'luis', 'J100', 'panadero', 85),
(3000, 'antonio', 'J100', 'vendedor', 50),
(4000, 'carmen', 'J200', 'cajero', 70),
(5000, 'teresa', 'J200', 'pastelero', 120),
(6000, 'ana', 'J300', 'ayudante', 70),
(7000, 'carolina', 'J300', 'sastre', 150),
(8000, 'hector', 'J400', 'vendedor', 60),
(9000, 'luis', 'J400', 'cajero', 70),
(9500, 'manuel', 'J500', 'almecen', 90),
(9600, 'jacson', 'J500', 'cajero', 80),
(9700, 'andres', 'J500', 'vendedor', 70),
(9800, 'gerardo', 'J600', 'encargado', 100),
(8100, 'miguel', 'J600', 'tecnico', 80),
(8200, 'sonia', 'J700', 'tecnico', 90),
(8500, 'dario', 'J700', 'tecnico', 90);

--
-- Disparadores `empleado`
--
DELIMITER $$
CREATE TRIGGER `emplado_BD` BEFORE DELETE ON `empleado` FOR EACH ROW INSERT INTO reg_empleado_D (cedulae, nombren, fecha_D) VALUES (old.cedulae, old.nombre, now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validar_SUELDO` BEFORE UPDATE ON `empleado` FOR EACH ROW BEGIN 	
	IF  (NEW.sueldo < 0) THEN
    SET NEW.sueldo = old.sueldo;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `negocio`
--

CREATE TABLE `negocio` (
  `rif` varchar(4) DEFAULT NULL,
  `cedulap` int(4) DEFAULT NULL,
  `nombren` varchar(15) DEFAULT NULL,
  `direccion` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `negocio`
--

INSERT INTO `negocio` (`rif`, `cedulap`, `nombren`, `direccion`) VALUES
('J100', 100, 'Pastelaria XXX', 'plc'),
('J200', 100, 'Pastelaria YYY', 'bna'),
('J300', 200, 'Sastreria AAA', 'plc'),
('J400', 300, 'Quincalla PPP', 'guanta'),
('J500', 400, 'Libreria CCC', 'bna'),
('J600', 400, 'vyber NNN', 'bna'),
('J700', 500, 'cyber OOO', 'lecheria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `new_propietario`
--

CREATE TABLE `new_propietario` (
  `cedulap` int(4) DEFAULT NULL,
  `nombre` varchar(10) DEFAULT NULL,
  `fecha_I` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propietario`
--

CREATE TABLE `propietario` (
  `cedulap` int(4) DEFAULT NULL,
  `nombre` varchar(10) DEFAULT NULL,
  `direccion` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `propietario`
--

INSERT INTO `propietario` (`cedulap`, `nombre`, `direccion`) VALUES
(100, 'pedro', 'plc'),
(200, 'juan', 'bna'),
(300, 'chan', 'plc'),
(400, 'jose', 'guanta'),
(500, 'joan', 'lecheria');

--
-- Disparadores `propietario`
--
DELIMITER $$
CREATE TRIGGER `reg_propietario_I` AFTER INSERT ON `propietario` FOR EACH ROW INSERT INTO new_propietario (cedulap. nombre, fecha_I) VALUES (new.cedulap, new.nombre, now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validar_cedula_p` BEFORE INSERT ON `propietario` FOR EACH ROW BEGIN 	
	IF(new.cedulap<0) THEN
    set new.cedulap=0;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reg_empleado_d`
--

CREATE TABLE `reg_empleado_d` (
  `cedulae` varchar(5) DEFAULT NULL,
  `nombren` varchar(10) DEFAULT NULL,
  `fecha_D` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DELIMITER $$
--
-- Eventos
--
CREATE DEFINER=`root`@`localhost` EVENT `insertion_event` ON SCHEDULE AT '2022-05-20 11:00:00' ON COMPLETION NOT PRESERVE ENABLE DO INSERT INTO propietario (cedulap, nombre, direccion) VALUES (1234, 'prueba', 'insertando')$$

CREATE DEFINER=`root`@`localhost` EVENT `UPDATE_event` ON SCHEDULE AT '2022-05-20 11:01:00' ON COMPLETION PRESERVE ENABLE DO UPDATE propietario set direccion = 'actualizando' where cedulap = 1234$$

CREATE DEFINER=`root`@`localhost` EVENT `UPDATE_nombrep_event` ON SCHEDULE AT '2022-05-20 11:02:00' ON COMPLETION PRESERVE ENABLE DO UPDATE propietario set nombrep = 'modificado' where cedulap = 1234$$

CREATE DEFINER=`root`@`localhost` EVENT `DELETE_event` ON SCHEDULE AT '2022-05-20 11:03:00' ON COMPLETION PRESERVE ENABLE DO DELETE FROM propietario where cedulap = 1234$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

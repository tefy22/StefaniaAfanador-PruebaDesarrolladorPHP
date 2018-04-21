-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.30-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para almacen
CREATE DATABASE IF NOT EXISTS `almacen` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `almacen`;

-- Volcando estructura para procedimiento almacen.actualizarMarca
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarMarca`(in ref int(10),
	in nomb varchar(45))
begin
	update marca set nombre=nomb where referencia=ref;
end//
DELIMITER ;

-- Volcando estructura para procedimiento almacen.borrarMarca
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarMarca`(in cod int(10))
begin 
	delete from marca where referencia=cod;
end//
DELIMITER ;

-- Volcando estructura para procedimiento almacen.borrarProducto
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `borrarProducto`(in cod int(10))
begin 
	delete from producto where codigo=cod;
end//
DELIMITER ;

-- Volcando estructura para tabla almacen.marca
CREATE TABLE IF NOT EXISTS `marca` (
  `referencia` int(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`referencia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla almacen.marca: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` (`referencia`, `nombre`) VALUES
	(100, 'Azucar'),
	(101, 'Armi'),
	(102, 'ELA');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;

-- Volcando estructura para procedimiento almacen.newMarca
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `newMarca`(
	in ref int(10),
	in nomb varchar(50))
begin
	insert into marca values (ref, nomb);
end//
DELIMITER ;

-- Volcando estructura para procedimiento almacen.newProducto
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `newProducto`(
	in cod int(10),
	in nombre varchar(45),
	in talla varchar(4),
	in mark int(10),
	in cantidad int(10),
	in fecha date)
begin
	insert into producto values (cod, nombre, talla, mark, cantidad, fecha);
end//
DELIMITER ;

-- Volcando estructura para tabla almacen.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `codigo` int(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `talla` varchar(4) NOT NULL,
  `marca` int(10) NOT NULL,
  `cantidad` int(10) NOT NULL,
  `fecha_empaque` date NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `foranea_marca` (`marca`),
  CONSTRAINT `foranea_marca` FOREIGN KEY (`marca`) REFERENCES `marca` (`referencia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla almacen.producto: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`codigo`, `nombre`, `talla`, `marca`, `cantidad`, `fecha_empaque`) VALUES
	(122, 'Camisa en Chifon', 'L', 102, 100, '2018-04-20'),
	(123, 'Pantalon', 'S', 100, 100, '2018-04-16');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

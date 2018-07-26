/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.6.38 : Database - maquinan_magel
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`maquinan_magel` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `maquinan_magel`;

/*Table structure for table `loggin` */

DROP TABLE IF EXISTS `loggin`;

CREATE TABLE `loggin` (
  `ID` int(11) NOT NULL,
  `USR` varchar(25) DEFAULT NULL,
  `PASS` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `USO_LIBRE` */

DROP TABLE IF EXISTS `USO_LIBRE`;

CREATE TABLE `USO_LIBRE` (
  `NUM_REGISTRO` int(11) NOT NULL AUTO_INCREMENT,
  `TIPO_PERSONA` varchar(25) CHARACTER SET latin1 NOT NULL,
  `ID_PERSONA` varchar(11) CHARACTER SET latin1 NOT NULL,
  `PROGRAMA` varchar(25) CHARACTER SET latin1 NOT NULL,
  `SALA` int(1) NOT NULL,
  `EQUIPO` int(2) NOT NULL,
  `HORA_INICIO` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `OBSERVACIONES` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `HORA_SALIDA` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ESTADO` int(1) DEFAULT '1',
  `DURACION` time DEFAULT NULL,
  KEY `NUM_REGISTRO` (`NUM_REGISTRO`)
) ENGINE=InnoDB AUTO_INCREMENT=1294 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

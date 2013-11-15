CREATE DATABASE  IF NOT EXISTS `redhospitalaria` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `redhospitalaria`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: redhospitalaria
-- ------------------------------------------------------
-- Server version	5.5.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta` (
  `CONSULTA` int(11) NOT NULL AUTO_INCREMENT,
  `FECHA_CONSULTA` datetime NOT NULL,
  `FECHA_PROXIMA_CONSULTA` datetime DEFAULT NULL,
  `PACIENTE` int(11) NOT NULL,
  `TIPO_CONSULTA` int(11) NOT NULL,
  `ENFERMEDAD` int(11) NOT NULL,
  PRIMARY KEY (`CONSULTA`),
  KEY `fk_CONSULTA_PACIENTE1_idx` (`PACIENTE`),
  KEY `fk_CONSULTA_TIPO_CONSULTA1_idx` (`TIPO_CONSULTA`),
  KEY `fk_CONSULTA_ENFERMEDAD1_idx` (`ENFERMEDAD`),
  CONSTRAINT `fk_CONSULTA_ENFERMEDAD1` FOREIGN KEY (`ENFERMEDAD`) REFERENCES `enfermedad` (`ENFERMEDAD`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTA_PACIENTE1` FOREIGN KEY (`PACIENTE`) REFERENCES `paciente` (`PACIENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTA_TIPO_CONSULTA1` FOREIGN KEY (`TIPO_CONSULTA`) REFERENCES `tipo_consulta` (`TIPO_CONSULTA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (1,'2013-10-04 00:00:00','2013-11-14 00:00:00',2,1,1);
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datos_personales`
--

DROP TABLE IF EXISTS `datos_personales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_personales` (
  `DATOS_PERSONALES` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(150) NOT NULL,
  `APELLIDO` varchar(160) NOT NULL,
  `DPI` varchar(60) NOT NULL,
  `TELEFONO` varchar(40) NOT NULL,
  `DIRECCION` varchar(150) NOT NULL,
  `PAIS` int(11) NOT NULL,
  `DEPARTAMENTO` int(11) NOT NULL,
  `MUNICIPIO` int(11) NOT NULL,
  `TITULO` int(11) NOT NULL,
  `GENERO` char(1) NOT NULL,
  `FECHA_INGRESO` datetime NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`DATOS_PERSONALES`),
  KEY `fk_DATOS_PERSONALES_DEPARTAMENTO1_idx` (`DEPARTAMENTO`),
  KEY `fk_DATOS_PERSONALES_PAIS1_idx` (`PAIS`),
  KEY `fk_DATOS_PERSONALES_TITULO1_idx` (`TITULO`),
  KEY `fk_DATOS_PERSONALES_MUNICIPIO1_idx` (`MUNICIPIO`),
  CONSTRAINT `fk_DATOS_PERSONALES_DEPARTAMENTO1` FOREIGN KEY (`DEPARTAMENTO`) REFERENCES `departamento` (`DEPARTAMENTO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DATOS_PERSONALES_MUNICIPIO1` FOREIGN KEY (`MUNICIPIO`) REFERENCES `municipio` (`MUNICIPIO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DATOS_PERSONALES_PAIS1` FOREIGN KEY (`PAIS`) REFERENCES `pais` (`PAIS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DATOS_PERSONALES_TITULO1` FOREIGN KEY (`TITULO`) REFERENCES `titulo` (`TITULO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_personales`
--

LOCK TABLES `datos_personales` WRITE;
/*!40000 ALTER TABLE `datos_personales` DISABLE KEYS */;
INSERT INTO `datos_personales` VALUES (10,'IVAN','HERNANDEZ','A-1123455','44445566','AMATITLAN',1,1,1,2,'M','2001-01-01 00:00:00','A'),(11,'MARIO','SOLIS','123405050505','44332233','SAN JOSE PINULA',1,1,1,2,'F','2012-01-01 00:00:00','A'),(12,'color1','color','color2','color3','color4',1,3,1,1,'M','2001-01-01 00:00:00','A'),(13,'JOSE ','BERNABE','1234556','55667788','ESCUINTLA',1,2,4,2,'M','2013-11-02 00:00:00','A');
/*!40000 ALTER TABLE `datos_personales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `DEPARTAMENTO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_DEPARTAMENTO` varchar(100) NOT NULL,
  `PAIS` int(11) NOT NULL,
  PRIMARY KEY (`DEPARTAMENTO`),
  KEY `fk_DEPARTAMENTO_PAIS1_idx` (`PAIS`),
  CONSTRAINT `fk_DEPARTAMENTO_PAIS1` FOREIGN KEY (`PAIS`) REFERENCES `pais` (`PAIS`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Guatemala',1),(2,'Escuintla',1),(3,'Peten',1),(4,'Jutiapa',1),(5,'Jalapa',1),(6,'Zacapa',1);
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depto_area`
--

DROP TABLE IF EXISTS `depto_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depto_area` (
  `DEPTO_AREA` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`DEPTO_AREA`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depto_area`
--

LOCK TABLES `depto_area` WRITE;
/*!40000 ALTER TABLE `depto_area` DISABLE KEYS */;
INSERT INTO `depto_area` VALUES (1,'Gerencia','A'),(2,'Contabilidad','A'),(3,'Pediatria','A'),(4,'Cirugia de Hombres','A'),(5,'Cirugia de Mujeres','A'),(6,'Maternidad','A');
/*!40000 ALTER TABLE `depto_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `EMPLEADO` int(11) NOT NULL AUTO_INCREMENT,
  `DATOS_PERSONALES` int(11) NOT NULL,
  `HOSPITAL` int(11) NOT NULL,
  `DEPTO_AREA` int(11) NOT NULL,
  `PUESTO` int(11) NOT NULL,
  PRIMARY KEY (`EMPLEADO`),
  KEY `fk_EMPLEADO_HOSPITAL1_idx` (`HOSPITAL`),
  KEY `fk_EMPLEADO_DEPTO_AREA1_idx` (`DEPTO_AREA`),
  KEY `fk_EMPLEADO_PUESTO1_idx` (`PUESTO`),
  KEY `fk_EMPLEADO_DATOS_PERSONALES1_idx` (`DATOS_PERSONALES`),
  CONSTRAINT `fk_EMPLEADO_DATOS_PERSONALES1` FOREIGN KEY (`DATOS_PERSONALES`) REFERENCES `datos_personales` (`DATOS_PERSONALES`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLEADO_DEPTO_AREA1` FOREIGN KEY (`DEPTO_AREA`) REFERENCES `depto_area` (`DEPTO_AREA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLEADO_HOSPITAL1` FOREIGN KEY (`HOSPITAL`) REFERENCES `hospital` (`HOSPITAL`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLEADO_PUESTO1` FOREIGN KEY (`PUESTO`) REFERENCES `puesto` (`PUESTO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (7,11,1,4,5),(8,12,4,1,1),(10,10,2,1,1);
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedad`
--

DROP TABLE IF EXISTS `enfermedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermedad` (
  `ENFERMEDAD` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_ENFERMEDAD` varchar(100) NOT NULL,
  `TRATAMIENTO` text,
  `INGRESO_SALA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ENFERMEDAD`),
  KEY `fk_ENFERMEDAD_INGRESO_SALA1_idx` (`INGRESO_SALA`),
  CONSTRAINT `fk_ENFERMEDAD_INGRESO_SALA1` FOREIGN KEY (`INGRESO_SALA`) REFERENCES `ingreso_sala` (`INGRESO_SALA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedad`
--

LOCK TABLES `enfermedad` WRITE;
/*!40000 ALTER TABLE `enfermedad` DISABLE KEYS */;
INSERT INTO `enfermedad` VALUES (1,'Sarampion','Acetaminofen',NULL);
/*!40000 ALTER TABLE `enfermedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `FACTURA` int(11) NOT NULL,
  `CONSULTA` int(11) NOT NULL,
  `SERIE` varchar(10) NOT NULL,
  `NUMERO_FACTURA` int(11) NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`FACTURA`,`SERIE`),
  KEY `fk_FACTURA_CONSULTA1_idx` (`CONSULTA`),
  CONSTRAINT `fk_FACTURA_CONSULTA1` FOREIGN KEY (`CONSULTA`) REFERENCES `consulta` (`CONSULTA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historia`
--

DROP TABLE IF EXISTS `historia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historia` (
  `HISTORIA` int(11) NOT NULL,
  `PACIENTE` int(11) NOT NULL,
  `FECHA` datetime NOT NULL,
  `TIPO_CONSULTA` int(11) NOT NULL,
  PRIMARY KEY (`HISTORIA`,`PACIENTE`,`TIPO_CONSULTA`),
  KEY `fk_HISTORIA_PACIENTE1_idx` (`PACIENTE`),
  KEY `fk_HISTORIA_TIPO_CONSULTA1_idx` (`TIPO_CONSULTA`),
  CONSTRAINT `fk_HISTORIA_PACIENTE1` FOREIGN KEY (`PACIENTE`) REFERENCES `paciente` (`PACIENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_HISTORIA_TIPO_CONSULTA1` FOREIGN KEY (`TIPO_CONSULTA`) REFERENCES `tipo_consulta` (`TIPO_CONSULTA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historia`
--

LOCK TABLES `historia` WRITE;
/*!40000 ALTER TABLE `historia` DISABLE KEYS */;
/*!40000 ALTER TABLE `historia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `HOSPITAL` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(150) NOT NULL,
  `DIRECCION` varchar(100) NOT NULL,
  `TELEFONO` varchar(25) NOT NULL,
  `MAIL` varchar(75) NOT NULL,
  `NIT` varchar(20) NOT NULL,
  `ESTATUS` char(1) NOT NULL,
  `PAIS` int(11) NOT NULL,
  `DEPARTAMENTO` int(11) NOT NULL,
  `MUNICIPIO` int(11) NOT NULL,
  PRIMARY KEY (`HOSPITAL`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,'SAN JUAN  DE DIOS','SAN JOSE PINULA','66330000','hospitalsanjuan@gmail.com','12345','A',1,1,1),(2,'SAN PEDRO LAGUNA','SANTA CATARINA','66400000','hospitalsanpedro@gmail.com','23456','A',1,1,1),(3,'Nuevo San Pedro','San Pedro Sacatepequez','56434563','dominicrep@gmail.com','12345-7','A',1,1,1),(4,'nuevo Amanecer','Villa Nueva','12341234','newmanece@hotmail.com','13412341','A',1,1,1),(5,'San Jose Nuevo','SAN JOSE PINULA','44556677','nuevosan@gmail.com','123415452','B',1,1,1),(6,'San Jose de las Rosas','zona 3 Barrio la Ferro','788990909','lasrosas@gmail.com','2345678','A',1,2,2);
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingreso_sala`
--

DROP TABLE IF EXISTS `ingreso_sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingreso_sala` (
  `INGRESO_SALA` int(11) NOT NULL,
  `NOMBRE_SALA` varchar(100) NOT NULL,
  `OPERACION` int(11) DEFAULT NULL,
  `ENCAMAMIENTO` int(11) DEFAULT NULL,
  `TRATAMIENTO` int(11) DEFAULT NULL,
  `CONSULTA` int(11) DEFAULT NULL,
  PRIMARY KEY (`INGRESO_SALA`),
  KEY `fk_INGRESO_SALA_CONSULTA1_idx` (`CONSULTA`),
  CONSTRAINT `fk_INGRESO_SALA_CONSULTA1` FOREIGN KEY (`CONSULTA`) REFERENCES `consulta` (`CONSULTA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingreso_sala`
--

LOCK TABLES `ingreso_sala` WRITE;
/*!40000 ALTER TABLE `ingreso_sala` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingreso_sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipio` (
  `MUNICIPIO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_MUNICIPIO` varchar(100) NOT NULL,
  `DEPARTAMENTO` int(11) NOT NULL,
  PRIMARY KEY (`MUNICIPIO`),
  KEY `fk_MUNICIPIO_DEPARTAMENTO1_idx` (`DEPARTAMENTO`),
  CONSTRAINT `fk_MUNICIPIO_DEPARTAMENTO1` FOREIGN KEY (`DEPARTAMENTO`) REFERENCES `departamento` (`DEPARTAMENTO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,'Guatemala',1),(2,'Villa Nueva',1),(3,'San Jose Pinula',1),(4,'Atescatempa',4);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `PACIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(150) NOT NULL,
  `APELLIDO` varchar(150) NOT NULL,
  `DPI` varchar(100) NOT NULL,
  `DIRECCION` varchar(150) NOT NULL,
  `MAIL` varchar(75) DEFAULT NULL,
  `TELEFONO` varchar(25) NOT NULL,
  `GENERO` char(1) NOT NULL,
  `NIT` varchar(20) NOT NULL,
  `PAIS` int(11) NOT NULL,
  `DEPARTAMENTO` int(11) NOT NULL,
  `MUNICIPIO` int(11) NOT NULL,
  `SEGURO` char(1) NOT NULL,
  `FECHA_NACIMIENTO` datetime NOT NULL,
  `HOSPITAL` int(11) NOT NULL,
  PRIMARY KEY (`PACIENTE`),
  KEY `fk_PACIENTE_PAIS1_idx` (`PAIS`),
  KEY `fk_PACIENTE_DEPARTAMENTO1_idx` (`DEPARTAMENTO`),
  KEY `fk_PACIENTE_MUNICIPIO1_idx` (`MUNICIPIO`),
  KEY `fk_PACIENTE_HOSPITAL1_idx` (`HOSPITAL`),
  CONSTRAINT `fk_PACIENTE_DEPARTAMENTO1` FOREIGN KEY (`DEPARTAMENTO`) REFERENCES `departamento` (`DEPARTAMENTO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PACIENTE_HOSPITAL1` FOREIGN KEY (`HOSPITAL`) REFERENCES `hospital` (`HOSPITAL`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PACIENTE_MUNICIPIO1` FOREIGN KEY (`MUNICIPIO`) REFERENCES `municipio` (`MUNICIPIO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PACIENTE_PAIS1` FOREIGN KEY (`PAIS`) REFERENCES `pais` (`PAIS`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'IVAN','HERNANDEZ','1234-3-3-3-3-','guatemala','mail@gmail.com','44556677','M','2343234',1,1,1,'A','1975-05-24 00:00:00',1),(2,'Carlos','Herrera','1234-4-5-34','guatemala','herrera@gmail.com','66334576','M','asd2345',1,1,1,'A','1998-01-01 00:00:00',2),(3,'andres','aderes','1233445','san jose','andres@gmail.com','67856785678','M','2452452452345234',1,1,1,'A','2013-11-22 00:00:00',1);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `PAIS` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_PAIS` varchar(100) NOT NULL,
  PRIMARY KEY (`PAIS`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Guatemala'),(2,'Mexico'),(3,'El Salvador'),(4,'Jamaicas');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `PERMISOS` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_PERMISO` varchar(100) NOT NULL,
  PRIMARY KEY (`PERMISOS`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
INSERT INTO `permisos` VALUES (1,'TOTAL'),(2,'CONSULTAR');
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto`
--

DROP TABLE IF EXISTS `puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puesto` (
  `PUESTO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`PUESTO`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto`
--

LOCK TABLES `puesto` WRITE;
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
INSERT INTO `puesto` VALUES (1,'Gerente General','A'),(2,'Administrador','A'),(3,'Medico obstetra','A'),(4,'Medico','A'),(5,'Enfermera','A'),(6,'Contador','A'),(7,'Concerje','A'),(8,'Medico Cirujanos','A'),(9,'Medico Ginecolo','A'),(10,'Laboratorista 1','A'),(11,'Laboratorista 2','A'),(12,'Medico Odontologo','A');
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_consulta`
--

DROP TABLE IF EXISTS `tipo_consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_consulta` (
  `TIPO_CONSULTA` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(200) NOT NULL,
  `ESTATUS` char(1) NOT NULL,
  PRIMARY KEY (`TIPO_CONSULTA`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_consulta`
--

LOCK TABLES `tipo_consulta` WRITE;
/*!40000 ALTER TABLE `tipo_consulta` DISABLE KEYS */;
INSERT INTO `tipo_consulta` VALUES (1,'Odontologicas','A'),(2,'Ginecologia','A');
/*!40000 ALTER TABLE `tipo_consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulo`
--

DROP TABLE IF EXISTS `titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulo` (
  `TITULO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_TITULO` varchar(150) NOT NULL,
  PRIMARY KEY (`TITULO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulo`
--

LOCK TABLES `titulo` WRITE;
/*!40000 ALTER TABLE `titulo` DISABLE KEYS */;
INSERT INTO `titulo` VALUES (1,'Secretaria'),(2,'Contador'),(3,'Auxiliar de Enfermeria prof'),(4,'Medico Cirujano'),(5,'Medico Recidente'),(6,'Medico Forence');
/*!40000 ALTER TABLE `titulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(100) NOT NULL,
  `CLAVE` varchar(45) NOT NULL,
  `HOSPITAL` int(11) NOT NULL,
  `STATUS` char(1) NOT NULL,
  `PERMISOS` int(11) NOT NULL,
  PRIMARY KEY (`USUARIO`),
  KEY `fk_USUARIO_HOSPITAL1_idx` (`HOSPITAL`),
  KEY `fk_USUARIO_PERMISOS1_idx` (`PERMISOS`),
  CONSTRAINT `fk_USUARIO_HOSPITAL1` FOREIGN KEY (`HOSPITAL`) REFERENCES `hospital` (`HOSPITAL`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIO_PERMISOS1` FOREIGN KEY (`PERMISOS`) REFERENCES `permisos` (`PERMISOS`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3',1,'A',1),(2,'ihernandez','f303ea6b6c0e238a01c971291f35f497',2,'A',1),(3,'donde','a93bda156370e30bbcf7c21e85b03aba',1,'A',1),(4,'carlos','dc599a9972fde3045dab59dbd1ae170b',1,'A',1),(5,'adios','6e6e2ddb6346ce143d19d79b3358c16a',2,'A',1),(6,'hola','4d186321c1a7f0f354b297e8914ab240',1,'A',1),(7,'ramiro','49bbccc812370520878c7f343d48900b',2,'A',1),(8,'hernandez','f57661026a1df28b21b4d6c200d63a60',5,'A',1),(10,'nuevo','e26c062fedf6b32834e4de93f9c8b644',1,'A',1),(12,'hey','6057f13c496ecf7fd777ceb9e79ae285',1,'A',1),(13,'versionamiento','2af72f100c356273d46284f6fd1dfc08',1,'A',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-14 21:00:16

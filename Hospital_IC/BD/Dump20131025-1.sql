CREATE DATABASE  IF NOT EXISTS `redhospitalaria` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `redhospitalaria`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
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
-- Table structure for table `depto_area`
--

DROP TABLE IF EXISTS `depto_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `depto_area` (
  `DEPTO_AREA` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`DEPTO_AREA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depto_area`
--

LOCK TABLES `depto_area` WRITE;
/*!40000 ALTER TABLE `depto_area` DISABLE KEYS */;
/*!40000 ALTER TABLE `depto_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `PACIENTE` int(11) NOT NULL,
  `NOMBRE` varchar(150) NOT NULL,
  `APELLIDO` varchar(150) NOT NULL,
  `DPI` int(11) NOT NULL,
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
  KEY `fk_PACIENTE_PAIS1` (`PAIS`),
  KEY `fk_PACIENTE_DEPARTAMENTO1` (`DEPARTAMENTO`),
  KEY `fk_PACIENTE_MUNICIPIO1` (`MUNICIPIO`),
  CONSTRAINT `fk_PACIENTE_PAIS1` FOREIGN KEY (`PAIS`) REFERENCES `pais` (`PAIS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PACIENTE_DEPARTAMENTO1` FOREIGN KEY (`DEPARTAMENTO`) REFERENCES `departamento` (`DEPARTAMENTO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PACIENTE_MUNICIPIO1` FOREIGN KEY (`MUNICIPIO`) REFERENCES `municipio` (`MUNICIPIO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `DEPARTAMENTO` int(11) NOT NULL,
  `NOMBRE_DEPARTAMENTO` varchar(100) NOT NULL,
  PRIMARY KEY (`DEPARTAMENTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
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
  KEY `fk_FACTURA_CONSULTA1` (`CONSULTA`),
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
-- Table structure for table `datos_personales`
--

DROP TABLE IF EXISTS `datos_personales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datos_personales` (
  `DATOS_PERSONALES` int(11) NOT NULL,
  `NOMBRE` varchar(150) NOT NULL,
  `APELLIDO` varchar(160) NOT NULL,
  `DPI` int(11) NOT NULL,
  `TELEFONO` varchar(40) NOT NULL,
  `DIRECCION` varchar(150) NOT NULL,
  `PAIS` int(11) NOT NULL,
  `DEPARTAMENTO` int(11) NOT NULL,
  `TITULO` int(11) NOT NULL,
  `GENERO` char(1) NOT NULL,
  `FECHA_INGRESO` date NOT NULL,
  `FECHA_EGRESO` date NOT NULL,
  `MUNICIPIO` int(11) NOT NULL,
  PRIMARY KEY (`DATOS_PERSONALES`),
  KEY `fk_DATOS_PERSONALES_DEPARTAMENTO1` (`DEPARTAMENTO`),
  KEY `fk_DATOS_PERSONALES_PAIS1` (`PAIS`),
  KEY `fk_DATOS_PERSONALES_TITULO1` (`TITULO`),
  KEY `fk_DATOS_PERSONALES_MUNICIPIO1` (`MUNICIPIO`),
  CONSTRAINT `fk_DATOS_PERSONALES_DEPARTAMENTO1` FOREIGN KEY (`DEPARTAMENTO`) REFERENCES `departamento` (`DEPARTAMENTO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DATOS_PERSONALES_PAIS1` FOREIGN KEY (`PAIS`) REFERENCES `pais` (`PAIS`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DATOS_PERSONALES_TITULO1` FOREIGN KEY (`TITULO`) REFERENCES `titulo` (`TITULO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DATOS_PERSONALES_MUNICIPIO1` FOREIGN KEY (`MUNICIPIO`) REFERENCES `municipio` (`MUNICIPIO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datos_personales`
--

LOCK TABLES `datos_personales` WRITE;
/*!40000 ALTER TABLE `datos_personales` DISABLE KEYS */;
/*!40000 ALTER TABLE `datos_personales` ENABLE KEYS */;
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
  KEY `fk_HISTORIA_PACIENTE1` (`PACIENTE`),
  KEY `fk_HISTORIA_TIPO_CONSULTA1` (`TIPO_CONSULTA`),
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
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta` (
  `CONSULTA` int(11) NOT NULL,
  `FECHA_CONSULTA` datetime NOT NULL,
  `FECHA_PROXIMA_CONSULTA` datetime DEFAULT NULL,
  `PACIENTE` int(11) NOT NULL,
  `TIPO_CONSULTA` int(11) NOT NULL,
  `ENFERMEDAD` int(11) NOT NULL,
  PRIMARY KEY (`CONSULTA`),
  KEY `fk_CONSULTA_PACIENTE1` (`PACIENTE`),
  KEY `fk_CONSULTA_TIPO_CONSULTA1` (`TIPO_CONSULTA`),
  CONSTRAINT `fk_CONSULTA_PACIENTE1` FOREIGN KEY (`PACIENTE`) REFERENCES `paciente` (`PACIENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTA_TIPO_CONSULTA1` FOREIGN KEY (`TIPO_CONSULTA`) REFERENCES `tipo_consulta` (`TIPO_CONSULTA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `PAIS` int(11) NOT NULL,
  `NOMBRE_PAIS` varchar(100) NOT NULL,
  PRIMARY KEY (`PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permisos` (
  `PERMISOS` int(11) NOT NULL,
  `NOMBRE_PERMISO` varchar(100) NOT NULL,
  PRIMARY KEY (`PERMISOS`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipio` (
  `MUNICIPIO` int(11) NOT NULL,
  `NOMBRE_MUNICIPIO` varchar(100) NOT NULL,
  PRIMARY KEY (`MUNICIPIO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `EMPLEADO` int(11) NOT NULL,
  `DATOS_PERSONALES` int(11) NOT NULL,
  `HOSPITAL` int(11) NOT NULL,
  `DEPTO_AREA` int(11) NOT NULL,
  `PUESTO` int(11) NOT NULL,
  PRIMARY KEY (`EMPLEADO`),
  KEY `fk_EMPLEADO_HOSPITAL1` (`HOSPITAL`),
  KEY `fk_EMPLEADO_DEPTO_AREA1` (`DEPTO_AREA`),
  KEY `fk_EMPLEADO_PUESTO1` (`PUESTO`),
  KEY `fk_EMPLEADO_DATOS_PERSONALES1` (`DATOS_PERSONALES`),
  CONSTRAINT `fk_EMPLEADO_HOSPITAL1` FOREIGN KEY (`HOSPITAL`) REFERENCES `hospital` (`HOSPITAL`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLEADO_DEPTO_AREA1` FOREIGN KEY (`DEPTO_AREA`) REFERENCES `depto_area` (`DEPTO_AREA`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLEADO_PUESTO1` FOREIGN KEY (`PUESTO`) REFERENCES `puesto` (`PUESTO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLEADO_DATOS_PERSONALES1` FOREIGN KEY (`DATOS_PERSONALES`) REFERENCES `datos_personales` (`DATOS_PERSONALES`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `HOSPITAL` int(11) NOT NULL,
  `NOMBRE` varchar(150) NOT NULL,
  `DIRECCION` varchar(100) NOT NULL,
  `TELEFONO` varchar(25) NOT NULL,
  `MAIL` varchar(75) NOT NULL,
  `NIT` varchar(20) NOT NULL,
  `ESTATUS` char(1) NOT NULL,
  PRIMARY KEY (`HOSPITAL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,'SAN JUAN','SAN JOSE PINULA','66330000','hospitalsanjuan@gmail.com','12345','A'),(2,'SAN PEDRO','SANTA CATARINA','66400000','hospitalsanpedro@gmail.com','23456','A');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `USUARIO` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `CLAVE` varchar(45) NOT NULL,
  `HOSPITAL` int(11) NOT NULL,
  `STATUS` char(1) NOT NULL,
  `PERMISOS` int(11) NOT NULL,
  PRIMARY KEY (`USUARIO`),
  KEY `fk_USUARIO_HOSPITAL1` (`HOSPITAL`),
  KEY `fk_USUARIO_PERMISOS1` (`PERMISOS`),
  CONSTRAINT `fk_USUARIO_HOSPITAL1` FOREIGN KEY (`HOSPITAL`) REFERENCES `hospital` (`HOSPITAL`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_USUARIO_PERMISOS1` FOREIGN KEY (`PERMISOS`) REFERENCES `permisos` (`PERMISOS`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'admin','admin',1,'A',1),(2,'hola','hola',1,'A',1),(3,'donde','donde',1,'A',2),(4,'carlos','carlos',1,'A',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puesto`
--

DROP TABLE IF EXISTS `puesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puesto` (
  `PUESTO` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `STATUS` char(1) NOT NULL,
  PRIMARY KEY (`PUESTO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puesto`
--

LOCK TABLES `puesto` WRITE;
/*!40000 ALTER TABLE `puesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `puesto` ENABLE KEYS */;
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
  KEY `fk_INGRESO_SALA_CONSULTA1` (`CONSULTA`),
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
-- Table structure for table `titulo`
--

DROP TABLE IF EXISTS `titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulo` (
  `TITULO` int(11) NOT NULL,
  `NOMBRE_TITULO` varchar(150) NOT NULL,
  PRIMARY KEY (`TITULO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulo`
--

LOCK TABLES `titulo` WRITE;
/*!40000 ALTER TABLE `titulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `titulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_consulta`
--

DROP TABLE IF EXISTS `tipo_consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_consulta` (
  `TIPO_CONSULTA` int(11) NOT NULL,
  `DESCRIPCION` varchar(200) NOT NULL,
  `ESTATUS` char(1) NOT NULL,
  PRIMARY KEY (`TIPO_CONSULTA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_consulta`
--

LOCK TABLES `tipo_consulta` WRITE;
/*!40000 ALTER TABLE `tipo_consulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedad`
--

DROP TABLE IF EXISTS `enfermedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermedad` (
  `ENFERMEDAD` int(11) NOT NULL,
  `NOMBRE_ENFERMEDAD` varchar(100) NOT NULL,
  `TRATAMIENTO` text,
  `INGRESO_SALA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ENFERMEDAD`),
  KEY `fk_ENFERMEDAD_INGRESO_SALA1` (`INGRESO_SALA`),
  CONSTRAINT `fk_ENFERMEDAD_INGRESO_SALA1` FOREIGN KEY (`INGRESO_SALA`) REFERENCES `ingreso_sala` (`INGRESO_SALA`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedad`
--

LOCK TABLES `enfermedad` WRITE;
/*!40000 ALTER TABLE `enfermedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfermedad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-25 21:01:37

CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: hospital
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
-- Table structure for table `ajuste_d`
--

DROP TABLE IF EXISTS `ajuste_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ajuste_d` (
  `Corporacion` int(11) NOT NULL,
  `Ajuste_h` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio` decimal(18,2) DEFAULT NULL,
  `Total` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`Corporacion`,`Ajuste_h`,`Id`),
  KEY `fk_AJUSTE_D_PRODUCTO1_idx` (`Corporacion`,`Producto`),
  KEY `fk_AJUSTE_D_AJUSTE_H1_idx` (`Corporacion`,`Ajuste_h`),
  CONSTRAINT `fk_AJUSTE_D_AJUSTE_H1` FOREIGN KEY (`Corporacion`, `Ajuste_h`) REFERENCES `ajuste_h` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_AJUSTE_D_PRODUCTO1` FOREIGN KEY (`Corporacion`, `Producto`) REFERENCES `producto` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajuste_d`
--

LOCK TABLES `ajuste_d` WRITE;
/*!40000 ALTER TABLE `ajuste_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajuste_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ajuste_h`
--

DROP TABLE IF EXISTS `ajuste_h`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ajuste_h` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Usuario` int(11) NOT NULL,
  `Estatus` char(1) DEFAULT NULL,
  PRIMARY KEY (`Corporacion`,`Id`),
  KEY `fk_AJUSTE_H_USUARIO1_idx` (`Corporacion`,`Usuario`),
  CONSTRAINT `fk_AJUSTE_H_USUARIO1` FOREIGN KEY (`Corporacion`, `Usuario`) REFERENCES `usuario` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajuste_h`
--

LOCK TABLES `ajuste_h` WRITE;
/*!40000 ALTER TABLE `ajuste_h` DISABLE KEYS */;
/*!40000 ALTER TABLE `ajuste_h` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aseguradora`
--

DROP TABLE IF EXISTS `aseguradora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aseguradora` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `Observacion` text,
  `Estatus` char(1) DEFAULT NULL,
  PRIMARY KEY (`Corporacion`,`Id`),
  CONSTRAINT `fk_ASEGURADORA_CORPORACION1` FOREIGN KEY (`Corporacion`) REFERENCES `corporacion` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aseguradora`
--

LOCK TABLES `aseguradora` WRITE;
/*!40000 ALTER TABLE `aseguradora` DISABLE KEYS */;
INSERT INTO `aseguradora` VALUES (1,1,'No Asegurado','-','A'),(1,2,'Pan American Life','-','A');
/*!40000 ALTER TABLE `aseguradora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aseguradora_contacto`
--

DROP TABLE IF EXISTS `aseguradora_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aseguradora_contacto` (
  `Corporacion` int(11) NOT NULL,
  `Aseguradora` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Contacto` varchar(150) DEFAULT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `Observacion` text,
  `Estatus` char(1) DEFAULT NULL,
  PRIMARY KEY (`Corporacion`,`Id`,`Aseguradora`),
  KEY `fk_ASEGURADORA_CONTACTO_ASEGURADORA1_idx` (`Corporacion`,`Aseguradora`),
  CONSTRAINT `fk_ASEGURADORA_CONTACTO_ASEGURADORA1` FOREIGN KEY (`Corporacion`, `Aseguradora`) REFERENCES `aseguradora` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aseguradora_contacto`
--

LOCK TABLES `aseguradora_contacto` WRITE;
/*!40000 ALTER TABLE `aseguradora_contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `aseguradora_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Padre` int(11) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  `Estatus` char(1) NOT NULL,
  PRIMARY KEY (`Corporacion`,`Id`),
  KEY `fk_CATEGORIA_CORPORACION1_idx` (`Corporacion`),
  CONSTRAINT `fk_CATEGORIA_CORPORACION1` FOREIGN KEY (`Corporacion`) REFERENCES `corporacion` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `NombreComercial` varchar(100) NOT NULL,
  `Nit` varchar(25) NOT NULL,
  `Direccion` text NOT NULL,
  `FechaCreacion` datetime DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Estatus` char(1) NOT NULL,
  PRIMARY KEY (`Corporacion`,`Id`),
  KEY `fk_CLIENTE_CORPORACION1_idx` (`Corporacion`),
  CONSTRAINT `fk_CLIENTE_CORPORACION1` FOREIGN KEY (`Corporacion`) REFERENCES `corporacion` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,1,'Mario Solis','7550383-2','Guatemala','2010-01-01 00:00:00','42111634','A'),(1,2,'123','123','123','2013-11-09 00:00:00','123','A');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_paciente`
--

DROP TABLE IF EXISTS `cliente_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_paciente` (
  `Corporacion` int(11) NOT NULL,
  `Cliente` int(11) NOT NULL,
  `Paciente` int(11) NOT NULL,
  PRIMARY KEY (`Corporacion`,`Cliente`,`Paciente`),
  KEY `fk_CLIENTE_PACIENTE_PACIENTE1_idx` (`Corporacion`,`Paciente`),
  CONSTRAINT `fk_CLIENTE_PACIENTE_CLIENTE1` FOREIGN KEY (`Corporacion`, `Cliente`) REFERENCES `cliente` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLIENTE_PACIENTE_PACIENTE1` FOREIGN KEY (`Corporacion`, `Paciente`) REFERENCES `paciente` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_paciente`
--

LOCK TABLES `cliente_paciente` WRITE;
/*!40000 ALTER TABLE `cliente_paciente` DISABLE KEYS */;
INSERT INTO `cliente_paciente` VALUES (1,1,1);
/*!40000 ALTER TABLE `cliente_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_d`
--

DROP TABLE IF EXISTS `compra_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra_d` (
  `Corporacion` int(11) NOT NULL,
  `Compra_h` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Producto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio` decimal(18,2) NOT NULL,
  `Total` decimal(18,2) NOT NULL,
  PRIMARY KEY (`Id`,`Corporacion`,`Compra_h`),
  KEY `fk_COMPRA_D_COMPRA_H1_idx` (`Corporacion`,`Compra_h`),
  KEY `fk_COMPRA_D_PRODUCTO1_idx` (`Corporacion`,`Producto`),
  CONSTRAINT `fk_COMPRA_D_COMPRA_H1` FOREIGN KEY (`Corporacion`, `Compra_h`) REFERENCES `compra_h` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMPRA_D_PRODUCTO1` FOREIGN KEY (`Corporacion`, `Producto`) REFERENCES `producto` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_d`
--

LOCK TABLES `compra_d` WRITE;
/*!40000 ALTER TABLE `compra_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_h`
--

DROP TABLE IF EXISTS `compra_h`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra_h` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Proveedor` int(11) DEFAULT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `Usuario` int(11) NOT NULL,
  `Estatus` char(1) NOT NULL,
  PRIMARY KEY (`Corporacion`,`Id`),
  KEY `fk_COMPRA_H_PROVEEDOR1_idx` (`Corporacion`,`Proveedor`),
  KEY `fk_COMPRA_H_USUARIO1_idx` (`Corporacion`,`Usuario`),
  CONSTRAINT `fk_COMPRA_H_PROVEEDOR1` FOREIGN KEY (`Corporacion`, `Proveedor`) REFERENCES `proveedor` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_COMPRA_H_USUARIO1` FOREIGN KEY (`Corporacion`, `Usuario`) REFERENCES `usuario` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_h`
--

LOCK TABLES `compra_h` WRITE;
/*!40000 ALTER TABLE `compra_h` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_h` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta_medica`
--

DROP TABLE IF EXISTS `consulta_medica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta_medica` (
  `Corporacion` int(11) NOT NULL,
  `Hospital` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Tipo_Consulta` int(11) DEFAULT NULL,
  `Medico` int(11) NOT NULL,
  `Paciente` int(11) DEFAULT NULL,
  `Fecha` datetime NOT NULL,
  `Estatus` char(1) DEFAULT NULL,
  PRIMARY KEY (`Corporacion`,`Hospital`,`Id`),
  KEY `fk_CONSULTA_MEDICA_MEDICO1_idx` (`Corporacion`,`Medico`),
  KEY `fk_CONSULTA_MEDICA_PACIENTE1_idx` (`Corporacion`,`Paciente`),
  KEY `fk_CONSULTA_MEDICA_HOSPITAL1_idx` (`Corporacion`,`Hospital`),
  CONSTRAINT `fk_CONSULTA_MEDICA_HOSPITAL1` FOREIGN KEY (`Corporacion`, `Hospital`) REFERENCES `hospital` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTA_MEDICA_MEDICO1` FOREIGN KEY (`Corporacion`, `Medico`) REFERENCES `medico` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTA_MEDICA_PACIENTE1` FOREIGN KEY (`Corporacion`, `Paciente`) REFERENCES `paciente` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta_medica`
--

LOCK TABLES `consulta_medica` WRITE;
/*!40000 ALTER TABLE `consulta_medica` DISABLE KEYS */;
/*!40000 ALTER TABLE `consulta_medica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta_medica_enfermedad`
--

DROP TABLE IF EXISTS `consulta_medica_enfermedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta_medica_enfermedad` (
  `Corporacion` int(11) NOT NULL,
  `Hospital` int(11) NOT NULL,
  `Consulta_Medica` int(11) NOT NULL,
  `Enfermedad` int(11) NOT NULL,
  `Observacion` text,
  `Fecha_registro` datetime DEFAULT NULL,
  `Estatus` char(1) DEFAULT NULL,
  PRIMARY KEY (`Enfermedad`,`Consulta_Medica`,`Hospital`,`Corporacion`),
  KEY `fk_CONSULTA_MEDICA_ENFERMEDAD_CONSULTA_MEDICA1_idx` (`Corporacion`,`Hospital`,`Consulta_Medica`),
  CONSTRAINT `fk_CONSULTA_MEDICA_ENFERMEDAD_CONSULTA_MEDICA1` FOREIGN KEY (`Corporacion`, `Hospital`, `Consulta_Medica`) REFERENCES `consulta_medica` (`Corporacion`, `Hospital`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta_medica_enfermedad`
--

LOCK TABLES `consulta_medica_enfermedad` WRITE;
/*!40000 ALTER TABLE `consulta_medica_enfermedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `consulta_medica_enfermedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta_medica_sintoma`
--

DROP TABLE IF EXISTS `consulta_medica_sintoma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta_medica_sintoma` (
  `Corporacion` int(11) NOT NULL,
  `Hospital` int(11) NOT NULL,
  `Consulta_Medica` int(11) NOT NULL,
  `Sintoma` int(11) NOT NULL,
  `Observacion` text,
  `Fecha_registro` datetime DEFAULT NULL,
  `Estatus` char(1) DEFAULT NULL,
  PRIMARY KEY (`Corporacion`,`Hospital`,`Consulta_Medica`,`Sintoma`),
  KEY `fk_CONSULTA_MEDICA_SINTOMA_CONSULTA_MEDICA1_idx` (`Corporacion`,`Hospital`,`Consulta_Medica`),
  CONSTRAINT `fk_CONSULTA_MEDICA_SINTOMA_CONSULTA_MEDICA1` FOREIGN KEY (`Corporacion`, `Hospital`, `Consulta_Medica`) REFERENCES `consulta_medica` (`Corporacion`, `Hospital`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta_medica_sintoma`
--

LOCK TABLES `consulta_medica_sintoma` WRITE;
/*!40000 ALTER TABLE `consulta_medica_sintoma` DISABLE KEYS */;
/*!40000 ALTER TABLE `consulta_medica_sintoma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corporacion`
--

DROP TABLE IF EXISTS `corporacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `corporacion` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Direccion` text,
  `Correo` varchar(150) DEFAULT NULL,
  `Smtp_port` int(11) DEFAULT NULL,
  `Sendmail_from` varchar(150) DEFAULT NULL,
  `Sendmail_password` varchar(45) DEFAULT NULL,
  `Smtp` varchar(100) DEFAULT NULL,
  `Pais` int(11) NOT NULL,
  `Departamento` int(11) NOT NULL,
  `Estatus` char(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_CORPORACION_DEPARTAMENTO1_idx` (`Pais`,`Departamento`),
  CONSTRAINT `fk_CORPORACION_DEPARTAMENTO1` FOREIGN KEY (`Pais`, `Departamento`) REFERENCES `departamento` (`Pais`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corporacion`
--

LOCK TABLES `corporacion` WRITE;
/*!40000 ALTER TABLE `corporacion` DISABLE KEYS */;
INSERT INTO `corporacion` VALUES (1,'Corporacion WS','Guatemala','solis.mario91@gmail.com',123,'123','123','123',1,1,'A');
/*!40000 ALTER TABLE `corporacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `Pais` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `Estatus` char(1) NOT NULL,
  PRIMARY KEY (`Pais`,`Id`),
  KEY `fk_DEPARTAMENTO_PAIS_idx` (`Pais`),
  CONSTRAINT `fk_DEPARTAMENTO_PAIS` FOREIGN KEY (`Pais`) REFERENCES `pais` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,1,'Guatemala','A'),(1,2,'Chiquimula','A');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domitorio`
--

DROP TABLE IF EXISTS `domitorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domitorio` (
  `Corporacion` int(11) NOT NULL,
  `Hospital` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Nivel` int(11) DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` text,
  `Estatus` char(1) DEFAULT NULL,
  `DOMITORIOcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Corporacion`,`Hospital`,`Id`),
  KEY `fk_DOMITORIO_NIVEL1_idx` (`Corporacion`,`Hospital`,`Nivel`),
  CONSTRAINT `fk_DOMITORIO_NIVEL1` FOREIGN KEY (`Corporacion`, `Hospital`, `Nivel`) REFERENCES `nivel` (`Corporacion`, `Hospital`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domitorio`
--

LOCK TABLES `domitorio` WRITE;
/*!40000 ALTER TABLE `domitorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `domitorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedad`
--

DROP TABLE IF EXISTS `enfermedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermedad` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Descripcion` text NOT NULL,
  `Diagnostrico` text,
  `FechaCreacion` datetime DEFAULT NULL,
  `Estatus` char(1) NOT NULL,
  PRIMARY KEY (`Id`,`Corporacion`),
  KEY `fk_ENFERMEDAD_CORPORACION1_idx` (`Corporacion`),
  CONSTRAINT `fk_ENFERMEDAD_CORPORACION1` FOREIGN KEY (`Corporacion`) REFERENCES `corporacion` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedad`
--

LOCK TABLES `enfermedad` WRITE;
/*!40000 ALTER TABLE `enfermedad` DISABLE KEYS */;
INSERT INTO `enfermedad` VALUES (1,1,'123123','descasdfasdf','1','2013-11-09 00:00:00','A');
/*!40000 ALTER TABLE `enfermedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedad_foto`
--

DROP TABLE IF EXISTS `enfermedad_foto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermedad_foto` (
  `Corporacion` int(11) NOT NULL,
  `Enfermedad` int(11) NOT NULL,
  `Item` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Foto` blob,
  `TipoFoto` varchar(45) DEFAULT NULL,
  `Estatus` char(1) NOT NULL,
  PRIMARY KEY (`Enfermedad`,`Item`,`Corporacion`),
  KEY `fk_ENFERMEDAD_FOTO_ENFERMEDAD1_idx` (`Corporacion`,`Enfermedad`),
  CONSTRAINT `fk_ENFERMEDAD_FOTO_ENFERMEDAD1` FOREIGN KEY (`Corporacion`, `Enfermedad`) REFERENCES `enfermedad` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedad_foto`
--

LOCK TABLES `enfermedad_foto` WRITE;
/*!40000 ALTER TABLE `enfermedad_foto` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfermedad_foto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedad_sintoma`
--

DROP TABLE IF EXISTS `enfermedad_sintoma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermedad_sintoma` (
  `Corporacion` int(11) NOT NULL,
  `Enfermedad` int(11) NOT NULL,
  `Sintoma` int(11) NOT NULL,
  `Observacion` text,
  `Fecha_creacion` datetime DEFAULT NULL,
  PRIMARY KEY (`Corporacion`,`Enfermedad`,`Sintoma`),
  KEY `fk_ENFERMEDAD_SINTOMA_ENFERMEDAD1_idx` (`Corporacion`,`Enfermedad`),
  KEY `fk_ENFERMEDAD_SINTOMA_SINTOMA1_idx` (`Corporacion`,`Sintoma`),
  CONSTRAINT `fk_ENFERMEDAD_SINTOMA_ENFERMEDAD1` FOREIGN KEY (`Corporacion`, `Enfermedad`) REFERENCES `enfermedad` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ENFERMEDAD_SINTOMA_SINTOMA1` FOREIGN KEY (`Corporacion`, `Sintoma`) REFERENCES `sintoma` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedad_sintoma`
--

LOCK TABLES `enfermedad_sintoma` WRITE;
/*!40000 ALTER TABLE `enfermedad_sintoma` DISABLE KEYS */;
INSERT INTO `enfermedad_sintoma` VALUES (1,1,1,'prueba','2010-01-01 00:00:00'),(1,1,2,'asdfasf','2013-11-09 00:00:00');
/*!40000 ALTER TABLE `enfermedad_sintoma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidad`
--

DROP TABLE IF EXISTS `especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especialidad` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Descripcion` text,
  `Estatus` char(1) NOT NULL,
  PRIMARY KEY (`Id`,`Corporacion`),
  KEY `fk_ESPECIALIDAD_CORPORACION1_idx` (`Corporacion`),
  CONSTRAINT `fk_ESPECIALIDAD_CORPORACION1` FOREIGN KEY (`Corporacion`) REFERENCES `corporacion` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidad`
--

LOCK TABLES `especialidad` WRITE;
/*!40000 ALTER TABLE `especialidad` DISABLE KEYS */;
INSERT INTO `especialidad` VALUES (1,1,'Especialidad 1','Especialidad 1asdfadsf','A');
/*!40000 ALTER TABLE `especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_civil`
--

DROP TABLE IF EXISTS `estado_civil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_civil` (
  `Corporacion` int(11) NOT NULL,
  `id` char(1) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `Estatus` char(1) NOT NULL,
  PRIMARY KEY (`Corporacion`,`id`),
  KEY `fk_ESTADO_CIVIL_CORPORACION1_idx` (`Corporacion`),
  CONSTRAINT `fk_ESTADO_CIVIL_CORPORACION1` FOREIGN KEY (`Corporacion`) REFERENCES `corporacion` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_civil`
--

LOCK TABLES `estado_civil` WRITE;
/*!40000 ALTER TABLE `estado_civil` DISABLE KEYS */;
INSERT INTO `estado_civil` VALUES (1,'1','Soltero','A'),(1,'2','Casado','A');
/*!40000 ALTER TABLE `estado_civil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estatus_paciente`
--

DROP TABLE IF EXISTS `estatus_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estatus_paciente` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `Observacion` text,
  `Estatus` char(1) NOT NULL,
  PRIMARY KEY (`Id`,`Corporacion`),
  KEY `fk_ESTATUS_PACIENTE_CORPORACION1_idx` (`Corporacion`),
  CONSTRAINT `fk_ESTATUS_PACIENTE_CORPORACION1` FOREIGN KEY (`Corporacion`) REFERENCES `corporacion` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estatus_paciente`
--

LOCK TABLES `estatus_paciente` WRITE;
/*!40000 ALTER TABLE `estatus_paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `estatus_paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genero` (
  `Corporacion` int(11) NOT NULL,
  `Id` char(1) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `Estatus` char(1) NOT NULL,
  PRIMARY KEY (`Id`,`Corporacion`),
  KEY `fk_GENERO_CORPORACION1_idx` (`Corporacion`),
  CONSTRAINT `fk_GENERO_CORPORACION1` FOREIGN KEY (`Corporacion`) REFERENCES `corporacion` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'1','Masculino','A'),(1,'2','Fenemino','A');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hospital` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Direccion` text,
  `Nit` varchar(20) DEFAULT NULL,
  `RazonSocial` varchar(150) DEFAULT NULL,
  `Pais` int(11) NOT NULL,
  `Departamento` int(11) NOT NULL,
  `Sendmail_from` varchar(150) DEFAULT NULL,
  `Smtp` varchar(100) DEFAULT NULL,
  `Sendmail_password` varchar(45) DEFAULT NULL,
  `Smtp_port` int(11) DEFAULT NULL,
  `Estatus` char(1) NOT NULL,
  `Venta_Correlativo` int(11) NOT NULL,
  `Venta_Correlativo_Autonumerico` char(1) NOT NULL,
  `Venta_Serie` char(3) NOT NULL,
  PRIMARY KEY (`Corporacion`,`Id`),
  KEY `fk_HOSPITAL_CORPORACION1_idx` (`Corporacion`),
  KEY `fk_HOSPITAL_DEPARTAMENTO1_idx` (`Pais`,`Departamento`),
  CONSTRAINT `fk_HOSPITAL_CORPORACION1` FOREIGN KEY (`Corporacion`) REFERENCES `corporacion` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_HOSPITAL_DEPARTAMENTO1` FOREIGN KEY (`Pais`, `Departamento`) REFERENCES `departamento` (`Pais`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (1,1,'Hospital 1','guatemala','7550383-2','Hospital 1',1,2,NULL,NULL,NULL,NULL,'A',1,'S','A'),(1,2,'asdf','','asdf','asdf',1,1,NULL,NULL,NULL,NULL,'A',1,'S','A');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medico` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL COMMENT '	',
  `Nombre` varchar(150) NOT NULL,
  `Direccion` text,
  `Pais` int(11) DEFAULT NULL,
  `Depto` int(11) DEFAULT NULL,
  `Nacionalidad` int(11) DEFAULT NULL,
  `FechaRegistro` datetime NOT NULL,
  `FechaNacimiento` datetime NOT NULL,
  `Genero` varchar(45) DEFAULT NULL,
  `Estado_Civil` char(1) DEFAULT NULL,
  `Imagen` varchar(45) DEFAULT NULL,
  `Estatus` char(1) NOT NULL,
  `Correo` varchar(150) DEFAULT NULL,
  `Telefono` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Corporacion`,`Id`),
  KEY `fk_MEDICO_CORPORACION1_idx` (`Corporacion`),
  KEY `fk_MEDICO_PAIS1_idx` (`Nacionalidad`),
  KEY `fk_MEDICO_GENERO1_idx` (`Corporacion`,`Genero`),
  KEY `fk_MEDICO_DEPARTAMENTO1_idx` (`Pais`,`Depto`),
  CONSTRAINT `fk_MEDICO_CORPORACION1` FOREIGN KEY (`Corporacion`) REFERENCES `corporacion` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MEDICO_DEPARTAMENTO1` FOREIGN KEY (`Pais`, `Depto`) REFERENCES `departamento` (`Pais`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MEDICO_GENERO1` FOREIGN KEY (`Corporacion`, `Genero`) REFERENCES `genero` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MEDICO_PAIS1` FOREIGN KEY (`Nacionalidad`) REFERENCES `pais` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,1,'Mario Solis','Guatemala',1,1,1,'2010-01-01 00:00:00','2010-01-01 00:00:00','1','1','doctor_1.jpg','A',NULL,NULL);
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico_especialidad`
--

DROP TABLE IF EXISTS `medico_especialidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medico_especialidad` (
  `Corporacion` int(11) NOT NULL,
  `Medico` int(11) NOT NULL,
  `Especialidad` int(11) NOT NULL,
  `Item` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Observacion` text,
  `FechaRegistro` datetime NOT NULL,
  `Pais` int(11) NOT NULL,
  `Lugar` text NOT NULL,
  PRIMARY KEY (`Medico`,`Especialidad`,`Item`,`Corporacion`),
  KEY `fk_MEDICO_ESPECIALIDAD_MEDICO1_idx` (`Corporacion`,`Medico`),
  KEY `fk_MEDICO_ESPECIALIDAD_ESPECIALIDAD1_idx` (`Corporacion`,`Especialidad`),
  CONSTRAINT `fk_MEDICO_ESPECIALIDAD_ESPECIALIDAD1` FOREIGN KEY (`Corporacion`, `Especialidad`) REFERENCES `especialidad` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MEDICO_ESPECIALIDAD_MEDICO1` FOREIGN KEY (`Corporacion`, `Medico`) REFERENCES `medico` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico_especialidad`
--

LOCK TABLES `medico_especialidad` WRITE;
/*!40000 ALTER TABLE `medico_especialidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `medico_especialidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nivel`
--

DROP TABLE IF EXISTS `nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivel` (
  `Corporacion` int(11) NOT NULL,
  `Hospital` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Descripcion` text,
  `Estatus` char(1) DEFAULT NULL,
  PRIMARY KEY (`Hospital`,`Id`,`Corporacion`),
  KEY `fk_NIVEL_HOSPITAL1_idx` (`Corporacion`,`Hospital`),
  CONSTRAINT `fk_NIVEL_HOSPITAL1` FOREIGN KEY (`Corporacion`, `Hospital`) REFERENCES `hospital` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel`
--

LOCK TABLES `nivel` WRITE;
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Direccion` text,
  `Dpi` varchar(25) DEFAULT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Pais` int(11) NOT NULL COMMENT '	',
  `Departamento` int(11) NOT NULL,
  `Estado_Civil` char(1) NOT NULL,
  `FechaRegistro` datetime NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Clave` varchar(25) NOT NULL,
  `Genero` char(1) NOT NULL,
  `Estatus` char(1) NOT NULL,
  `Aseguradora` int(11) NOT NULL,
  `Poliza` varchar(45) DEFAULT NULL,
  `Poliza_Expiracion` date DEFAULT NULL,
  `Poliza_Certificado` varchar(50) DEFAULT NULL,
  `Poliza_Observacion` text,
  PRIMARY KEY (`Corporacion`,`Id`),
  KEY `fk_PACIENTE_CORPORACION1_idx` (`Corporacion`),
  KEY `fk_PACIENTE_ESTADO_CIVIL1_idx` (`Corporacion`,`Estado_Civil`),
  KEY `fk_PACIENTE_GENERO1_idx` (`Corporacion`,`Genero`),
  KEY `fk_PACIENTE_DEPARTAMENTO1_idx` (`Pais`,`Departamento`),
  KEY `fk_PACIENTE_ASEGURADORA1_idx` (`Corporacion`,`Aseguradora`),
  CONSTRAINT `fk_PACIENTE_ASEGURADORA1` FOREIGN KEY (`Corporacion`, `Aseguradora`) REFERENCES `aseguradora` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PACIENTE_CORPORACION1` FOREIGN KEY (`Corporacion`) REFERENCES `corporacion` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PACIENTE_DEPARTAMENTO1` FOREIGN KEY (`Pais`, `Departamento`) REFERENCES `departamento` (`Pais`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PACIENTE_ESTADO_CIVIL1` FOREIGN KEY (`Corporacion`, `Estado_Civil`) REFERENCES `estado_civil` (`Corporacion`, `id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PACIENTE_GENERO1` FOREIGN KEY (`Corporacion`, `Genero`) REFERENCES `genero` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,1,'asdfasdf','Guatemala','123','1991-07-13',1,1,'1','2010-01-01 00:00:00','solis.mario91@gmail.com','23','2','A',1,'','1900-01-01','',''),(1,2,'ASDFASDFASDFASFD','asdf','123','2013-11-03',1,1,'1','2013-11-12 00:00:00','solis.mario91@gmail.com','23','1','A',2,'1','2013-01-01','1','1');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_dormitorio`
--

DROP TABLE IF EXISTS `paciente_dormitorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente_dormitorio` (
  `Corporacion` int(11) NOT NULL,
  `Hospital` int(11) NOT NULL,
  `Consulta_Medica` int(11) NOT NULL,
  `Dormitorio` int(11) NOT NULL,
  `Paciente` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Descripcion` text,
  `Estatus` char(1) DEFAULT NULL,
  `Fecha_Alta` datetime DEFAULT NULL,
  PRIMARY KEY (`Corporacion`,`Hospital`,`Consulta_Medica`,`Dormitorio`),
  KEY `fk_PACIENTE_DORMITORIO_DOMITORIO1_idx` (`Corporacion`,`Hospital`,`Dormitorio`),
  CONSTRAINT `fk_PACIENTE_DORMITORIO_CONSULTA_MEDICA1` FOREIGN KEY (`Corporacion`, `Hospital`, `Consulta_Medica`) REFERENCES `consulta_medica` (`Corporacion`, `Hospital`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PACIENTE_DORMITORIO_DOMITORIO1` FOREIGN KEY (`Corporacion`, `Hospital`, `Dormitorio`) REFERENCES `domitorio` (`Corporacion`, `Hospital`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_dormitorio`
--

LOCK TABLES `paciente_dormitorio` WRITE;
/*!40000 ALTER TABLE `paciente_dormitorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `paciente_dormitorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_dormitorio_medicamento`
--

DROP TABLE IF EXISTS `paciente_dormitorio_medicamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente_dormitorio_medicamento` (
  `Corporacion` int(11) NOT NULL,
  `Hospital` int(11) NOT NULL,
  `Dormitorio` int(11) NOT NULL,
  `Consulta_Medica` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Usuario` int(11) DEFAULT NULL,
  `Producto` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio` decimal(18,2) DEFAULT NULL,
  `Descuento` decimal(18,2) DEFAULT NULL,
  `Total` decimal(18,2) DEFAULT NULL,
  `Descripcion` text,
  `Estatus` char(1) DEFAULT NULL,
  PRIMARY KEY (`Hospital`,`Corporacion`,`Dormitorio`,`Consulta_Medica`,`Id`),
  KEY `fk_PACIENTE_DORMITORIO_MEDICAMENTO_PRODUCTO1_idx` (`Corporacion`,`Producto`),
  KEY `fk_PACIENTE_DORMITORIO_MEDICAMENTO_PACIENTE_DORMITORIO1_idx` (`Corporacion`,`Hospital`,`Consulta_Medica`,`Dormitorio`),
  CONSTRAINT `fk_PACIENTE_DORMITORIO_MEDICAMENTO_PACIENTE_DORMITORIO1` FOREIGN KEY (`Corporacion`, `Hospital`, `Consulta_Medica`, `Dormitorio`) REFERENCES `paciente_dormitorio` (`Corporacion`, `Hospital`, `Consulta_Medica`, `Dormitorio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PACIENTE_DORMITORIO_MEDICAMENTO_PRODUCTO1` FOREIGN KEY (`Corporacion`, `Producto`) REFERENCES `producto` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_dormitorio_medicamento`
--

LOCK TABLES `paciente_dormitorio_medicamento` WRITE;
/*!40000 ALTER TABLE `paciente_dormitorio_medicamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `paciente_dormitorio_medicamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_foto`
--

DROP TABLE IF EXISTS `paciente_foto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente_foto` (
  `Corporacion` int(11) NOT NULL,
  `Paciente` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Foto` blob,
  `TipoFoto` varchar(45) DEFAULT NULL,
  `FechaRegistro` datetime NOT NULL,
  `Estatus` char(1) NOT NULL,
  PRIMARY KEY (`Paciente`,`Id`,`Corporacion`),
  KEY `fk_PACIENTE_FOTO_PACIENTE1_idx` (`Corporacion`,`Paciente`),
  CONSTRAINT `fk_PACIENTE_FOTO_PACIENTE1` FOREIGN KEY (`Corporacion`, `Paciente`) REFERENCES `paciente` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_foto`
--

LOCK TABLES `paciente_foto` WRITE;
/*!40000 ALTER TABLE `paciente_foto` DISABLE KEYS */;
INSERT INTO `paciente_foto` VALUES (1,1,1,'2013-11-13 00:00:00','����\0JFIF\0\0\0\0\0\0��\0�\0	\Z\Z\Z\Z\Z( %!1!%)+...383,7(-.+\n\n\n+++++++++++++++++++++++++++++++++++++++++++++++++++��\0\0\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\09\0\0\0\0\0!1AQa\"q�2���B����Rb�#r3$C���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0?\0̒��{Tp�����pj�9H�r=F���κ����	�ylD�H������\n�IL.\\�r/M֙)������\Z�9��v�IA)zn��M�{��9\\�RB��R�)\Z���jR�+]�����d�A6@��yDr��Z�m���?��G�e��@-1�~��7)�f�& \Z\"nL��V�e�Z�e7�������̧Q�o��,�t��sq�n2���Q��{����r�3&�F����?�{5P9�2D�.{��Y-hi�N�\'����s�$���t��Lo�S>��,~QSLh�[m�B�O�@��+��Z|GA\ZE������G�ä:�e����7���K�C*\"��򺔼N��$`��6)�ޤI<\r�q\n2�աȓ誸�l��u�	@�9p+�⃉M�� @�W&��r\r[ܙ�LX��w@�J���6Q�����A\'���\r������O�����y��䙎6�S��Kj0����E��A��G��g�������=F2=��\\������P]\'�6��Z�H�[~�H&���G�2z\r����xl�F�<�.�Ԅ���k�h7Q��^D�6����\0t�\0�n�b0�o���n&<�\n:�W����c2�UWU0	�=,m?�S��\r`\Zc���{��nXӰ�Ef��\'�a3\\���q	�y~r�DC�3�>��=���\0���-β_��K�h�>�7A�q\n�l8� �§�a4�%D�B<��I�6P<w\\�p\\�r����(\ZҟA�\'�$&�����b�x@qq�����9^\\��V�f6O������s��O촹M<4o�d}-�!�E�:�s����+�\\y~�p���{��=Ğ��}��`�$M��aj����.\'�˷T��4��\0�\0E��\0�2y�\Z|>.Gp-߲e{�޳Ǫ̻0\'h�П�\'�A�!����ȁc�	�ĳ���4��D�Ld�$�4ۘ�\"S)fwA����L�+�W�yA=���KŻ�|�8Ovd��q����x�P	:��v�=Z�[��,G��}2�׭�A���t���c��y�bxp�q�w�BOr���rc�p7K�3�n��Q���i�)��� �i�����y�s�!r���H���耶W�5]������!Ϛ8�`g��$\r��.Vu��7�?!�k��੽�I�{vA>?7�m��[�>}�l&yxK���h����ˎ��\Zmۑ)rܒ�Zt��M�CD�m�33Œ�y=\0�Y�x����gF���3�c0�:��A��V>��3&�;E��6a�ܢ8<T��������҈�\n�^�2;OP� 7��+����!��>��v!9���Oȧ{�D\0}D}�R�\"z(��r\\c����t+��}P_�=�$8�ϗP\'�����υ�{��x�@p��	�!���.ˁ��?dC��[󏒬�Y�&��#r� [��㕝���jm�\'il~H*�5��M&���k���	 �*�i��ӓ��]�3��Xf�����䠔4��Ĵ�������uYכ���*�q���~@r{������\rh��\\��ܶO�c���{����>j\\]V�I������V��lX8��}�� %��Ѿ��e��!���ns�u�S�z�6`c�����Q��D���@���v@0�.���d����S��b5 ��lz6�D���Ƞ�[p=%y�]�=��e��~��r��\0�tkxD��H��?�;Sl{!���Z{ %���6>�\n��!CCڪu�\n�\Z�/c���	q�4���AU\'��:���ODM���r6�\'��=׶�Y�nqD��A���C�Lt+u�˵����H�䳏x����N�[[��>� �E��l<�y�Y��*D�i$��M.@��I�I�|�*X\"\\�\Z#�&v���<�n@��\'�L��>=v@D\r-�o#��H\r�i�,f����<�6�\'�#^[bL�i*<�4�|�B�Y��Y�\0�@�Y^��w���j���ظ�\0���a���Z,�2\ZX��}�>�3h\n�h����w�@F�!Z̪����0c�O_����M�,�\"\Zv#����eY�O�\0hc��t�G>c��/)��#�lIݮ����tqO�SF�h;��\\쮅j4��/`�Կ�Ï����i�m7��P�L�n�~�N�:�w�W�\0p\Z���W���ڸ@�q\0���G[�\Z�&L_��th�醿SK	��gO�A�m���\r\'v��U�C��iVy��EI$�6�Z�eZM*nu�H����l���9T���K��|�)1�����dz�T� ��>@��\0uw4���Ў�~5��1���hռ��we���KM�H�0lz!X\\��{�,ooȔ\0�X2v�PG��.}b\ZC&��N�@�A�rP��\n���rYA&�y^��Rƽ�;E�p\n,.j��� 5I�:e�\\�kr�1|�����A���c�m*,άS.�duX�{�W��G�ĸ�ǗN��~��!�#�>�����D;��+�.U���������*6M��0�y�-h����ge�.���Y���?B�ReX��_q���D���ZPW���%�$n>�d=�ć��V�S�2�\\�/̱��\0xA�t��=r�.��G0�kf�gK��?�á�=T�~�l���Q��\0��#���7l�e6�k�\0s ؓ�m�EJ<@\\s��i����� ���jV��%����؈>�����l�n}���,h?�\03�k7p�3e��q\"fl�8��\\ڃT��(^&�&5��W�m<[��\0���\r0A2��D�&:wB!Y����i@�I+�zZP���\Z�^�iM�Ҁ�ǽ��#��m6C=��ї\\;�J�^��su��N�24�*�q姞c���Q�4u�e����ix&\0�A�@�����@�(���7Y\"�L!�v$J\r6�	����y|�򱹽x�v��j��P�pL E��@;��y��2�\'��䰘��H�^��Qk��m~no���=���\Z@�I���t�_�#H�N�-n#7��w�s�F��%e2�d�p��X�ߕ��tS\Z\0�#��ܯ*��昍0\0����e�v\\�|�t<� �Ө��v��1TP�8�wdg66m�\0(A����vu8k�=v�-��f%��I���� ��5�@���&����Z	� v�o���c�`\0R\"x����<����.R=D�@W$��=Kܩ4)�KI�*2��1Zm0�����J��Vh��f+�1�t@u�ٖ(���M���|ȖCL6c̃x�XG9�VjZB�J�:���J5���R��Qܿ2kfL�\0��,�G��\rj��l��\\�K�i\'�qꖯ�,��$x�6Y�\0v\\S�\0�$٨5����ɴ��{�\0.�/�C��z\r�P<�,&`�����\\:�� �eX�P�\"ߪ��_��\0��\0��E2��- �kD��r���Y����\"J	h�K63�岴s���=o��R����\'�V��u&�\rrh	II(9�r�+�zĩi��t��A(���!�caS���I;�0ʹ��4�����7q�M�e-h�^�o���`��5�w9����}\'b���n9�kA2���AY�I��7�����	���tAd�Hʀ��R��Hנ?�ȕ�ɰ�c��W���EѬ�:-0�c�R�a�7f�(1��i\",s�}�c�W)殪����}=��@k\r���\\j�T�\r7w>g�5�!�E��\0��ߺ/��\Z2`_`\'���H��]�&|^Zb�Py~+\0�F*5�=ª\\�xץT��0n\Z�\'���B�^��\Z������Py�����}��OW�sjG��vY���å����)�)rIA��bR ���\0B�����2S0yi��t�ug��|%LC�h��vQ�eM�<%�Ų\\�<�x�<)��\Z�\Z��DD4�1mW��\\�F���@U��.qn��V�m��kν��TmSX6�����s�[V0�	��\0�#��@1��.����0�!�t�h���`\0�i\"Ǘ\0.������:.��4���Z	�k�\"�g��5KŴ��_��dڔ�^;#��\r�L��	��z����1%��삈iR>���\rk���$��;�>���kc�@K����?�4���U>��o93��D���S�O�IG��N6[}�\0�����s����We�K<$����7;L?\r�h�S#N�\0]�ܑ�\'�O�,��\Zyh� �vi�k�j-��.���q��՜C�Ǵ45�\0��܎AUp�����m2<��t�K��\\v��\Z:D�֨��p\\~bۦ��2��E cg{�p��0�n�wm��n�F��\\H���#��U��o��dkQs	k� �R�N�&�v����({�j�/.q�:��.I���C��yPؖ���{\"��4�d:\03ck%�M��5���tR����mo���\0w2H��@��k~�؛\\�<L�EFS��.\r$�6��\Zb#���z�j��hp��4�6��r��)k~�B��	pC���A|��/�Z�-1:���t(Ev���Ll��D��\'k�h����g4�RcU�l`���5��&`���{��� �⨏�v������?$2��A�͐;L����v_%��H�w\"L^\r��*Ϥ*9�w���N����~H��u�5<7����&=U�F\r�XK�B\'������7�R:�Iۃ�|���?��%���n��I\"m�A������N�����f�N��8�\\&�����=��D�h����S?�����DA��0n��OXAV�\n@�h�������\ZZ����\'�Ϣ�1,�����GoR�1h,o/����{o׭��ٴ��=��wf��Q�Z�i�U�dCI��@�HhH#h�@���:��<ni��lz��?-�^�{�h�9��;��H25�R���#�|��\'�Z�Z�\Z�~+���W�|����N�\'U�	�@��Y�\\�Gy\"?��6��U��\0�{w~�%-F�t�N��Zǐy��\'�gwPL���v���m��A�J��y��1���\0��y`v�$H������\Z��I.-�\0��\"Ž�S(���\r���}��ECcf�i\r��v�j�=ނ�	�A���cxT����M�ž|�>\\)�&���4;i�G�C�*�sY[I 4;�ϴQ�R���ݗ-^`B�������aR������6��&��B��\"�	$ln@���W���{G��|@䯜As_�9�Q�.�m�\'�`P�f.k�}�� �\\��ߢ\\Xu:�L��B]� �hC1�����	\0O��eg��l\r?�i�2�~�\n�\Z4�s���\0��>pWe�$� �.�x�w()�e���\"e�����mM�K@��:�z�(5ؚM\Z.u�\\,  ����%�C�\\�pLGߤ�泃Z�]���&��6?������~��Q�����	�\Z�V�8|Di���on��d�^trl8�=�����\0Hѻ\\O�n%��S}%����:��W���y�blA��\0:�f�yN��_O�>���S�]M��x�F�E�x��o��N��o�]�0c@�09�-�ߕ[]ѩ��Kw�	���2}2�D����\0��<\r\0�b�o(#����8�^����_�v�Q�\0��qv��ƛM���U�+>�HkC�%�H�y��E�^����&\"�D��0b�i��I�� �c��窉�oL���t�����\\[����u\\�w<��B��Ă��8��!���{q(*�r�$�ƛŏ(�X^\0k�\r�c��y�:�{[y.ܘ��F��N�D�m7�cC[m��;Z�&��T�b\r��pm�#�G��\\4�:���n1��:�ھ2�va����5�Z?��M�D������C{�����P�(�U���I�g�e2/3�������D�p�kDĠ/K˂�J�3\ZE��F�.nwH�9L��+����e����Pr���JX�:�41�Ć��<�\0\rŖi���f�t�st�>n�Rq ��ǒ�fXf�a�R7{&�;� t=8��8�NẌ�2m�������\0�1�@��^�k�N����UVV �������m� ��Vrz��$�4�s�	<�����%�.\'��֒:�F��\ZX��$�h�tql8h�&�s�l~jOv$Y�D��2.����,n�\Z G�\"��>��i�0� A6���OȠ���t�ptB\"�Z~�T���$�\0i=$@����c�f����j:\\|���G^đ\'�c���Pf18I#�/�I�GW)s|L:�I�ŧ��=����c�qpI��#}�M�9��I\"m�{�$�5rځ���Z�Uv�D�$	;�x�Ylվ2�mD�����ǅ�w��y����(Cfoc�V��U��LH�\\�~ݑ\\Xi�� :z ���A+7I0@�8;��W�4��7o����I�W1U<E�5\0@=�\'�IԠ���������<C�9���\r��]���f��qsd2��䝄H�`�?IӨ�[��؂&�F� ye���e�D$fނEf�v{����2D��������ܸY��tUq.��/������e=6��ӤD�����!�����5�ؐz��~�Q�b�\"\n��c%���\"��n�t��iW�H��M��۝��*7��O�t��L��Z�߱P�bA=&t\n|s�֓\"7�A���*$���?�͖a���a�iիUȎA��ج�eOK�y���� m\Z��y�\0H�D�d�D�3FȆ��� R̑?�ۻo�}��l(�?����c��8����m�tW�n�Aﰴo��L[�Yߑ \r�G)}�4���ffu��v5��<f�������H�l���� ۍ�AN�=@��n��ɒ��LX\\�\"\Zz�m�E�oy\0܂$��AV�T�� j3$_ű����`5̝Q�f���C��F�`H���(�8��đ�i�3>HkD0@<O?��	SlH٠�Ŷ#��S�� �@����wRЪ*�N�����\0!袪�Lƙ�a��P^��[�$zD��e�ψ�I�����P�vd�A��a�õ�LG��GN>H-�2>�����[�����f\r7\r�D���[��vN�q�A�.m]Y��^HٺN�\'�>�\n��:����s>~fm*&�C���\Z�o��<�\0&S�9�Ap؋m�Vŵ���@�-�����xt�A?�M�$��\\ǸxN�� ��','image/jpeg','2013-11-13 00:00:00','A'),(1,1,2,'2013-11-13 00:00:00','����\0JFIF\0\0\0\0\0\0��\0�\0	\Z\Z\Z\Z\Z( %!1!%)+...383,7(-.+\n\n\n+++++++++++++++++++++++++++++++++++++++++++++++++++��\0\0\0�\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\09\0\0\0\0\0!1AQa\"q�2���B����Rb�#r3$C���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0\0\0?\0̒��{Tp�����pj�9H�r=F���κ����	�ylD�H������\n�IL.\\�r/M֙)������\Z�9��v�IA)zn��M�{��9\\�RB��R�)\Z���jR�+]�����d�A6@��yDr��Z�m���?��G�e��@-1�~��7)�f�& \Z\"nL��V�e�Z�e7�������̧Q�o��,�t��sq�n2���Q��{����r�3&�F����?�{5P9�2D�.{��Y-hi�N�\'����s�$���t��Lo�S>��,~QSLh�[m�B�O�@��+��Z|GA\ZE������G�ä:�e����7���K�C*\"��򺔼N��$`��6)�ޤI<\r�q\n2�աȓ誸�l��u�	@�9p+�⃉M�� @�W&��r\r[ܙ�LX��w@�J���6Q�����A\'���\r������O�����y��䙎6�S��Kj0����E��A��G��g�������=F2=��\\������P]\'�6��Z�H�[~�H&���G�2z\r����xl�F�<�.�Ԅ���k�h7Q��^D�6����\0t�\0�n�b0�o���n&<�\n:�W����c2�UWU0	�=,m?�S��\r`\Zc���{��nXӰ�Ef��\'�a3\\���q	�y~r�DC�3�>��=���\0���-β_��K�h�>�7A�q\n�l8� �§�a4�%D�B<��I�6P<w\\�p\\�r����(\ZҟA�\'�$&�����b�x@qq�����9^\\��V�f6O������s��O촹M<4o�d}-�!�E�:�s����+�\\y~�p���{��=Ğ��}��`�$M��aj����.\'�˷T��4��\0�\0E��\0�2y�\Z|>.Gp-߲e{�޳Ǫ̻0\'h�П�\'�A�!����ȁc�	�ĳ���4��D�Ld�$�4ۘ�\"S)fwA����L�+�W�yA=���KŻ�|�8Ovd��q����x�P	:��v�=Z�[��,G��}2�׭�A���t���c��y�bxp�q�w�BOr���rc�p7K�3�n��Q���i�)��� �i�����y�s�!r���H���耶W�5]������!Ϛ8�`g��$\r��.Vu��7�?!�k��੽�I�{vA>?7�m��[�>}�l&yxK���h����ˎ��\Zmۑ)rܒ�Zt��M�CD�m�33Œ�y=\0�Y�x����gF���3�c0�:��A��V>��3&�;E��6a�ܢ8<T��������҈�\n�^�2;OP� 7��+����!��>��v!9���Oȧ{�D\0}D}�R�\"z(��r\\c����t+��}P_�=�$8�ϗP\'�����υ�{��x�@p��	�!���.ˁ��?dC��[󏒬�Y�&��#r� [��㕝���jm�\'il~H*�5��M&���k���	 �*�i��ӓ��]�3��Xf�����䠔4��Ĵ�������uYכ���*�q���~@r{������\rh��\\��ܶO�c���{����>j\\]V�I������V��lX8��}�� %��Ѿ��e��!���ns�u�S�z�6`c�����Q��D���@���v@0�.���d����S��b5 ��lz6�D���Ƞ�[p=%y�]�=��e��~��r��\0�tkxD��H��?�;Sl{!���Z{ %���6>�\n��!CCڪu�\n�\Z�/c���	q�4���AU\'��:���ODM���r6�\'��=׶�Y�nqD��A���C�Lt+u�˵����H�䳏x����N�[[��>� �E��l<�y�Y��*D�i$��M.@��I�I�|�*X\"\\�\Z#�&v���<�n@��\'�L��>=v@D\r-�o#��H\r�i�,f����<�6�\'�#^[bL�i*<�4�|�B�Y��Y�\0�@�Y^��w���j���ظ�\0���a���Z,�2\ZX��}�>�3h\n�h����w�@F�!Z̪����0c�O_����M�,�\"\Zv#����eY�O�\0hc��t�G>c��/)��#�lIݮ����tqO�SF�h;��\\쮅j4��/`�Կ�Ï����i�m7��P�L�n�~�N�:�w�W�\0p\Z���W���ڸ@�q\0���G[�\Z�&L_��th�醿SK	��gO�A�m���\r\'v��U�C��iVy��EI$�6�Z�eZM*nu�H����l���9T���K��|�)1�����dz�T� ��>@��\0uw4���Ў�~5��1���hռ��we���KM�H�0lz!X\\��{�,ooȔ\0�X2v�PG��.}b\ZC&��N�@�A�rP��\n���rYA&�y^��Rƽ�;E�p\n,.j��� 5I�:e�\\�kr�1|�����A���c�m*,άS.�duX�{�W��G�ĸ�ǗN��~��!�#�>�����D;��+�.U���������*6M��0�y�-h����ge�.���Y���?B�ReX��_q���D���ZPW���%�$n>�d=�ć��V�S�2�\\�/̱��\0xA�t��=r�.��G0�kf�gK��?�á�=T�~�l���Q��\0��#���7l�e6�k�\0s ؓ�m�EJ<@\\s��i����� ���jV��%����؈>�����l�n}���,h?�\03�k7p�3e��q\"fl�8��\\ڃT��(^&�&5��W�m<[��\0���\r0A2��D�&:wB!Y����i@�I+�zZP���\Z�^�iM�Ҁ�ǽ��#��m6C=��ї\\;�J�^��su��N�24�*�q姞c���Q�4u�e����ix&\0�A�@�����@�(���7Y\"�L!�v$J\r6�	����y|�򱹽x�v��j��P�pL E��@;��y��2�\'��䰘��H�^��Qk��m~no���=���\Z@�I���t�_�#H�N�-n#7��w�s�F��%e2�d�p��X�ߕ��tS\Z\0�#��ܯ*��昍0\0����e�v\\�|�t<� �Ө��v��1TP�8�wdg66m�\0(A����vu8k�=v�-��f%��I���� ��5�@���&����Z	� v�o���c�`\0R\"x����<����.R=D�@W$��=Kܩ4)�KI�*2��1Zm0�����J��Vh��f+�1�t@u�ٖ(���M���|ȖCL6c̃x�XG9�VjZB�J�:���J5���R��Qܿ2kfL�\0��,�G��\rj��l��\\�K�i\'�qꖯ�,��$x�6Y�\0v\\S�\0�$٨5����ɴ��{�\0.�/�C��z\r�P<�,&`�����\\:�� �eX�P�\"ߪ��_��\0��\0��E2��- �kD��r���Y����\"J	h�K63�岴s���=o��R����\'�V��u&�\rrh	II(9�r�+�zĩi��t��A(���!�caS���I;�0ʹ��4�����7q�M�e-h�^�o���`��5�w9����}\'b���n9�kA2���AY�I��7�����	���tAd�Hʀ��R��Hנ?�ȕ�ɰ�c��W���EѬ�:-0�c�R�a�7f�(1��i\",s�}�c�W)殪����}=��@k\r���\\j�T�\r7w>g�5�!�E��\0��ߺ/��\Z2`_`\'���H��]�&|^Zb�Py~+\0�F*5�=ª\\�xץT��0n\Z�\'���B�^��\Z������Py�����}��OW�sjG��vY���å����)�)rIA��bR ���\0B�����2S0yi��t�ug��|%LC�h��vQ�eM�<%�Ų\\�<�x�<)��\Z�\Z��DD4�1mW��\\�F���@U��.qn��V�m��kν��TmSX6�����s�[V0�	��\0�#��@1��.����0�!�t�h���`\0�i\"Ǘ\0.������:.��4���Z	�k�\"�g��5KŴ��_��dڔ�^;#��\r�L��	��z����1%��삈iR>���\rk���$��;�>���kc�@K����?�4���U>��o93��D���S�O�IG��N6[}�\0�����s����We�K<$����7;L?\r�h�S#N�\0]�ܑ�\'�O�,��\Zyh� �vi�k�j-��.���q��՜C�Ǵ45�\0��܎AUp�����m2<��t�K��\\v��\Z:D�֨��p\\~bۦ��2��E cg{�p��0�n�wm��n�F��\\H���#��U��o��dkQs	k� �R�N�&�v����({�j�/.q�:��.I���C��yPؖ���{\"��4�d:\03ck%�M��5���tR����mo���\0w2H��@��k~�؛\\�<L�EFS��.\r$�6��\Zb#���z�j��hp��4�6��r��)k~�B��	pC���A|��/�Z�-1:���t(Ev���Ll��D��\'k�h����g4�RcU�l`���5��&`���{��� �⨏�v������?$2��A�͐;L����v_%��H�w\"L^\r��*Ϥ*9�w���N����~H��u�5<7����&=U�F\r�XK�B\'������7�R:�Iۃ�|���?��%���n��I\"m�A������N�����f�N��8�\\&�����=��D�h����S?�����DA��0n��OXAV�\n@�h�������\ZZ����\'�Ϣ�1,�����GoR�1h,o/����{o׭��ٴ��=��wf��Q�Z�i�U�dCI��@�HhH#h�@���:��<ni��lz��?-�^�{�h�9��;��H25�R���#�|��\'�Z�Z�\Z�~+���W�|����N�\'U�	�@��Y�\\�Gy\"?��6��U��\0�{w~�%-F�t�N��Zǐy��\'�gwPL���v���m��A�J��y��1���\0��y`v�$H������\Z��I.-�\0��\"Ž�S(���\r���}��ECcf�i\r��v�j�=ނ�	�A���cxT����M�ž|�>\\)�&���4;i�G�C�*�sY[I 4;�ϴQ�R���ݗ-^`B�������aR������6��&��B��\"�	$ln@���W���{G��|@䯜As_�9�Q�.�m�\'�`P�f.k�}�� �\\��ߢ\\Xu:�L��B]� �hC1�����	\0O��eg��l\r?�i�2�~�\n�\Z4�s���\0��>pWe�$� �.�x�w()�e���\"e�����mM�K@��:�z�(5ؚM\Z.u�\\,  ����%�C�\\�pLGߤ�泃Z�]���&��6?������~��Q�����	�\Z�V�8|Di���on��d�^trl8�=�����\0Hѻ\\O�n%��S}%����:��W���y�blA��\0:�f�yN��_O�>���S�]M��x�F�E�x��o��N��o�]�0c@�09�-�ߕ[]ѩ��Kw�	���2}2�D����\0��<\r\0�b�o(#����8�^����_�v�Q�\0��qv��ƛM���U�+>�HkC�%�H�y��E�^����&\"�D��0b�i��I�� �c��窉�oL���t�����\\[����u\\�w<��B��Ă��8��!���{q(*�r�$�ƛŏ(�X^\0k�\r�c��y�:�{[y.ܘ��F��N�D�m7�cC[m��;Z�&��T�b\r��pm�#�G��\\4�:���n1��:�ھ2�va����5�Z?��M�D������C{�����P�(�U���I�g�e2/3�������D�p�kDĠ/K˂�J�3\ZE��F�.nwH�9L��+����e����Pr���JX�:�41�Ć��<�\0\rŖi���f�t�st�>n�Rq ��ǒ�fXf�a�R7{&�;� t=8��8�NẌ�2m�������\0�1�@��^�k�N����UVV �������m� ��Vrz��$�4�s�	<�����%�.\'��֒:�F��\ZX��$�h�tql8h�&�s�l~jOv$Y�D��2.����,n�\Z G�\"��>��i�0� A6���OȠ���t�ptB\"�Z~�T���$�\0i=$@����c�f����j:\\|���G^đ\'�c���Pf18I#�/�I�GW)s|L:�I�ŧ��=����c�qpI��#}�M�9��I\"m�{�$�5rځ���Z�Uv�D�$	;�x�Ylվ2�mD�����ǅ�w��y����(Cfoc�V��U��LH�\\�~ݑ\\Xi�� :z ���A+7I0@�8;��W�4��7o����I�W1U<E�5\0@=�\'�IԠ���������<C�9���\r��]���f��qsd2��䝄H�`�?IӨ�[��؂&�F� ye���e�D$fނEf�v{����2D��������ܸY��tUq.��/������e=6��ӤD�����!�����5�ؐz��~�Q�b�\"\n��c%���\"��n�t��iW�H��M��۝��*7��O�t��L��Z�߱P�bA=&t\n|s�֓\"7�A���*$���?�͖a���a�iիUȎA��ج�eOK�y���� m\Z��y�\0H�D�d�D�3FȆ��� R̑?�ۻo�}��l(�?����c��8����m�tW�n�Aﰴo��L[�Yߑ \r�G)}�4���ffu��v5��<f�������H�l���� ۍ�AN�=@��n��ɒ��LX\\�\"\Zz�m�E�oy\0܂$��AV�T�� j3$_ű����`5̝Q�f���C��F�`H���(�8��đ�i�3>HkD0@<O?��	SlH٠�Ŷ#��S�� �@����wRЪ*�N�����\0!袪�Lƙ�a��P^��[�$zD��e�ψ�I�����P�vd�A��a�õ�LG��GN>H-�2>�����[�����f\r7\r�D���[��vN�q�A�.m]Y��^HٺN�\'�>�\n��:����s>~fm*&�C���\Z�o��<�\0&S�9�Ap؋m�Vŵ���@�-�����xt�A?�M�$��\\ǸxN�� ��','image/jpeg','2013-11-13 00:00:00','A'),(1,1,3,'2013-11-13 00:00:00','����\0JFIF\0\0\0\0\0\0��\0�\0	( %!1\"%)+...383,7(-.+\n\n\n\r\Z,$ $,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,��\0\0�!\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0:\0\0\0\0\0!1A\"Qaq�2B��R�����#b�$�r���\0\0\0\0\0\0\0\0\0\0\0\0\0��\0 \0\0\0\0\0\0\0\0!1AQqa��\0\0\0?\0��0�\"-\'L d����) I�`�\"�$O�(�2���G�M�yX�S��l<�T��eϿE��o�8�K�Xr3����:�gC`�u�4�}�n__^���.(�����\\�/�Xʳ����Ϲ�I����1�@c��9Pm�15�]�$��W1qO6_;�b�\\����m:4�6���{,���-\'��V,�mK�Xq\n�j8��߱�v��뵶����B�c��E�`e3�\0��ls��M�\ZO�VDۺ��λbK\\ ]�5�+s�Jo�1����^}B�0������S$-�� ��A*�G��q��	c��\r��r���H�gf	���.�����#8���?_�k��;dʶN�e�����\n�����\"N�I$��$�hDК�*T�Bt��P(����(J)A(� H�.O�^#��R?�;R>Q���Sx��MÇS��v�g�W�⸓���8���3�����O�Ue	���J�����dܓ�R=�\ZI��>Ѕ����4H���\0�dluPF��\'��3��ڟ[@��T�Q�.����ЮѪ�27��tp=�m� (S���P�� GBu\'C�(U�ִf�\ZA�֕>���i�ki�&;�a��Mm��ݤ�6Er�R\081�d��\n��4���ѠD�>��<)�?RM�8�h�z�r�	�\0h\0	��\0 �����\ra���/\Z�,�B��#b\0ױ:�ѠX�i�AN&ְ�,c�^�+Xj��	h�m�:tS�e���@�@����eq�8�Ԁ��I�f����m*X�,�]��0\"};���&��۶�F�y�P5Z32=41�ĭ.��$�.PZ�阛���̬i�)�⍩�<�?��Z!v�l�(I$\n��@�$���\"jI2t�0DS��SH2Y����&� ��j.|��\rr�G����8̒L�����q�V�V�̰�����\\-g>�Ϫ�Nc}4�^Ӫ��z+����\Z��~J��x�uV]�hT�v�#~���8=��k�� X��u��1~��N�Ae@�a��y���\0�K?�]ð�\0X߇$���>�g�xKsf���L���㦓�©�Q�x8ΐf&��G��Z�V�Im�PZN����������Ü\0����C�l@\"g���^�@\0���9Il`���ݚ�=�O-���s)��*������/w\Ze���-�͑�0N �f�c\0�\\sH#������#��C\\�C�~bۏB��p�I��*��X�kZ����i\"���c��/iv�4D�	�pp24]7�LzS��!���8D4�h�/6�E%(-9��h�&O5�R�k\Z�y:�Hp�u���t��朧��|Dj��mm՝�M��<�-|�ţ`�\n��w�f��X�&d����x2iM����~\"\']n�e�y\\ی���}�-i���@�\nPN�O����AŠ�u� ^ٽV�+	s&7�\'{^�wQbk��I�:�z������\r�H�8H&���T%�0��r\\-�\0���6��%tXz�T��v��;�c�����	�4$�!�(L�	Bd�8�\"j	!$� �TO(B$	$�@�G���F�Mi��-u�U1�p�f�|�4O�E��Lw���Le.{F~k�؛,���\0����*ie[�b\ZꄷH�Xj~� �����f������Rq\Z�!�2!��]x�	�̺�l��\ZF�f��j��;�xp�Ȫ���.h�V��_b]�����ȗ	˨.�c��E��N��[�쭲��&�\'�\0�st��t�SnpHD�DL���~@�L�@�m��w��٥�kR\rp�0Alؒ3ht��k`��� \\3	\"�a��	��\\��e���p�4�q�\"L�k�Z8luj-��\r!��L0���d�\0�X�ޚֽ�1x6�ô;.5�i�H}S#�wr�&#E���ub.\0��̤�9Z$��Z�Z�j��o��^Ge-�Hb(q5s�����c��H�}�%\\e�ٺl�SP5�@c\\r�s�1:�6lB����L\\\r��v���r�/��5�\r���@\r$�dN��\r�<��(��\Z��	Ԁ	p���,WNi9幃\\�nP�Ol�}�հ%ǘ��! �K�Y>c��5��P���k[�9��\"�\0֪X�Y���)�@<�4��l2_E�$�����p��{�a9A	���bpB����i*�ؓ��m�g�)�-�8���˴�O��Z�&.KH~{��$ìw��ݬ]�i�ͱ�F�o�¡J�j��-�@��Q��6���sX��mm�.GH�T���\"�WP��9OP{�P��w6�)JP�-)�$����Pr�d�(��\0�`\'����	BiJP(^U�]�5)3��{�B�Y^K�I�_�܀�:�X��,�����5\Z\\��I���/�\0.2u(*�\Z����}Vyw�����-\0���$���,�\'�9�$O3�A��\0���C��\0ZC�]�i�D�[t�h�ݯ��%ƺ�%�c��ְ��3�Јa��\'M�C��r��$Hm����\0E���H}�$��h�\\߈[M��)1����;�3E���p�[�a��a�@�������J��i-d=�k8���y�]�\\=7��͝H���2���x?5\Z�4��&`��\0}D�eu�fw�_������-p��#�=F�Snjc)->���p�t�sf�	�c�=�V%�\0��H���/<I%�. ;MEǺ�e7��+;�9�[��$�� D���}�L8�K�L��{D���5h����\\ٖ��7$�4u|?�����\Z�\ZO3e��Ή;EƗZ�I�\Z�R��7�������>�O�%��\0�i4��\0 q�Ы�8f0�H:�br��d;[�F7K��	�3CX�PEZou7eqe<�1�+C[��{���r�6p�U�\"�Zu�A?��h�Zn{)1���-�fK�t<&�u�e7��.����$�v���%i�h�l������_��c��₭6|M�wgcbf~l�7�>����#v�!�3�6���[�U�4��Y�A���L�[���N� \'3�8�����MCҳe��b�+D\0�j{Ym�,p���s��V�ր ���&Gn�8�n��\"[��~�\Z����4�I�fn���Vm��xKݚ��$��\"\"J�X|7�V\rА[��\0LB݅���I<%a�J�Bچ4\"�:d�3� PaD(�N��)L���~3ŷ�{^KAt� v^��OǕ�1�\Zn�	�`���YU����:|\"Di}<�u�&��k,�mg��N�A\0�\"�+2�3GkH��u�o���Znth���6�To�Si!�:��\0 ��\"ed`1����t���V�f�kNX�yb\";~��N���e���1 9��$���؆���hD5�{d�Z&g�v�i4�S�3�w#k�?ug��U�\Z��Ł#G��z;V������s���L����ӤԳ`h�I��2�x^2�Yn`I��[����\0O��HS/\'3�KL5����Rԑ�V�d7���˚${G�,/��8��\0Qi�cs�f��P����`�]3��&��Zu<�hY����\n�Gk�>f1�̓r��`�D�,�\"9�o7�z�r�F7#Lfs���:SҮp�#�p���iA#-��t=V�V��P5\rx��6����p,�U�Ҩ�M��p%�@q���N�ٞ�P�i��������)��-˴�\0��V�L�*\\.�9�Ǵ��Ӝ��4�h��F�UH{Ih\rt��Z#C=.Tt��V�ŴLK[�dـ&n=՜_�ĖM�w($F��ny��<#U��MĹ�����x�q���U\r>�曄e������C�\n���j�Nv��-&���o=�S��N��p\0�H�q&�~��I#0S�O/��8�nYt{��*�\Z�T��H1��������Ti���\0M�����,��z.l�2�Ik��H�2غ��w��\n�&�`��6������|?D�\0p�5yC�*9�t�w�P�E�E)J���R�$\n&�PI)!I�\0�����)JR�\nW��\0T�����L8�Yz���\0�x)�G�Q��$~J^��lMl���U\Z$��e=Z�T��ub�Qq����V��u���@X��>�V)�+��H��r�+��9�$hr��9�������i�h�&L�p���־�I���z\\��+���\roc6����y��э��U�i��q�h��PO�{{�1ڍ����ȗ9���:ItoZXV��5��3{�u���L������CL^v�5���֋,����]���Xf󐑤U�������ϳ�_\\�Pep�;TT��)��p\Z��GX]��=�lma�dh��LoI�߶�Hߠ��~J\\k^w�M\"�/)�76q$����\n�Z�9�4���s@�7�M�u�#~�f��[uB���)��1�Z$Hih�_����ת���s����\'����/K^k1�&j9�>f��prm�\r��)]�\'f��ԋ\0�_��L1�q�P\0Ƌ\\��ހ���E�C��7�x�C�V�9�����7��վTe�{�\03����ǩ�Zǫ�_L��\\���1�h�\0m>��w��T�.<��Lt��n$5�Z�,AnbĆ��i��͵\"� ����������!\r�:H7�s���8���pN�����x��S\Z�\\C[:�nbw�m��x�Hiy�/h��pŜ�[�U���vͧ\ZE��}�]��|	�\r���8��G�J�.�$�̔�4�G�,�$�AB	D	A4��1L��r0��U�\'̢\"�2Y�BP��.�8r��D�s���Vꎣ�i� �;)������^�~�o�$�)��oBá�tYu-=���� �߯��&UH�t:�G]/;�6�A��Ƕ��f$�p\'��L؉�t�?Q�ֽ�q��q�����6�:CD�k�}U�%<��,��F����X�	}�2���8�ݵ\0-������W�5�Q�g���ō�s�E��q�0E�&-��>ğJ�sn� X}{I�V2�Mt��﷫`(N�ç�O�i\0�v\\��*�k�p� �9Du�B���3+͔�N���Q�yoAp5-�S����\0�:�@�ZHp����N� �`�N�t1��)�Q&Ah����>�*�8:\rF�� �0z;]9����\0l�5>�&�w(5�I9��66���X�i?ӝ%��s\\�m��pq�֋����E7�� D�:���C��K>k��O��H$Doh�4�6o���&t�:��(·]�鈴��c���Pmhq��CZ�6@�D�zX�:����d�����H�4�&?���K�\0r��cA;�WS�9�9������\Z�����갱�3�:��\0�\rF��*��q��ڜ�6��+\\�6�v�X\0s�܃9�i6^�c�v��a��O��V�����)JJ)�$��C�&�BI(Ipj �@T��S�B1�\rT����K����*`����W\n�r^?���Z��\0r������y5{\"��_D��y�������w�|�RGe�>��K��&��}��h���\0&\0�U���@Ʒ���1�Pu�IPe�Jp�u\"ݕ�/t 4�̃$���&�L_O�Wmi���.�����M+N�,�����\0���w>�b�Cj6�,�XŶ6:Yy���7�:�������%���\0l�:D�݉m\Z�\\�Ôk���sA�>����<�y�7��\Z:ͭy�������17 �����7,N�\\\"\0����DYX��Yse]���[�!n,o��}g]?u�{J�	�Iq���׼�����3I3h\Z��+E���\nP�խ5\Z���i��#�o��[uR�ˀ�v���8�^��0��7ͥ����B�a�LC�9�3�\0��Ԭgӆ�k�w��eI���0��\'y\Z��w�\Z�F�!��u�۲������\0�PM��j?�GU֮�b#ȟ�F�SJ��M�e4�����R�I�����\"jhD��&�\Z*�U0�A듲ߚ��U��EZ�R�U\\�gAk�L+[:QtbJ#����j�5�f���<*�MZ\r��`ۻe����b�x����0�T�@X�\0�͏8���=�dG��ZX�J.��:��B�Ծ�UX\0�\0X��!J@��@�6��-���Ӌ��^��i*�)����Y����Pt\\��A�&F�Ӗ��H�^�.׀q�VA\0��d����Cb4�M�\n����Ac�b�˞^)�S;�N���*�Z�$eh#rLn;N��\\?	�eJ�I�9\\@�@�����\0T.t�LL�{.�t�n��\Z��&ەG\\�����Zb�ߢ��Qs�b��m�^ڕ���T�y]#rE���k~3lc`�X��,曓mh���]��XC�C�2��S�ip�i\rs;s�\r�����=�t�R�d�lI)����)B���R�60��D\nL�	L��̟�i�z�8�X��6g2~e�8i��4�S�͕̗2��\0M=R�\0M=S�̢͕{���\0M=TN�������-���vUj�t	§8Ʃ�U*�lV�����!;}Ӆ9F.3\Z!�v+��a���خ¿�\\�,��~���d��9?9�ҤN�\0�ڭ�*���W�\0�x��P��/�yFsj�U+^ ��+��+�~��/	b�p��.s������p��~�l�<X�\rV��?�ӣ���3���sœ7ɋ�`=��k��z��\r�u��]6�So��?5�C��}c�/�>��\rB^zI��WOF�\0\0\0�K\r\n�)+f3�RՖ�R�YML�CD\n�ʐ(�\ntS�R�$\nSJI yDҁQ)$�+��','image/jpeg','2013-11-13 00:00:00','A'),(1,1,4,'2013-11-13 00:00:00','����\0JFIF\0\0d\0d\0\0��\0C\0	\n\n			\n\n		\r\r\n��\0C	��\0�@\0��\0\0\0\0\0\0\0\0\0\0\0\0	\n��\0Y\0\0!	1\"AQ#2Baq�$3Rb�7Cv��%48Scru�&w�����ETUXh������������\0\0\0\0\0\0\0\0\0\0\0\0\0\0	��\0:\0\0\0\0\0\0\0!1AQa�\"2q��B��#R�����$4Cr���\0\0\0?\0�0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�ٱk�|�i�:��{�\"��G����D@0^[�݉�o�9޾�㯯�}G��q�\0��l���`�񞣽<�y�W���n��E���W�4r��ǘ��3�c�6�ξ�\Zl��ǛH�L�������ă�\0\0\0\0\0\0\0\0û��Y�o��W�48���9����3�������i����3��|�Zd�ݏZ���{����W[hq1����2uW+�����1�e�}�kE�����+�\Z�󎔵)>�����{���c{{�u7+���>���ww0a�,y�e��{ޔ�DEfm><DG��?\0�@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���/���\r�\\�\0jWo��v�0M��dǆׯ��c�G�<�w��Uܮ����wVu�5�;�2򛜷RNƆŦֶ8���bqM+����Dy�mk ���w?�y~���>���k񗮕9}]ZSkKO%�~\n�.jV#���b|x�L�\"뮐�Km��\'ԝ����6�ɥ^��0�&ǈ��r�Y�x�y���L�����$�k����֘v����m���o�5x�_{��9����i\\�-H��zf��ͽ�2l쟯�WS��~�l[�8N3��y�7�t���\\e�ә��/>\'����j|Ek��ֈ��=�������~��&�;�rx�.��O}/�O�[D�Z���f&&\"b`\0\0\0\0\0\0\0\"��{�}m����s�lQ�O;�,�KV#5�6�+�ſ3�6��fԬ|y�}(}8�3��މ�~��Լ�=�\'cNq�Vj�k��ys���ݗ�˗��%�g��7���X�HY\'@�W	�~��;}�U�^\'���n\'F3圹#u�Ou��S�|�\0��;�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0p9�O��NC���y=\\�y���o���Kx��|L�\"i�\'}%�ս8�~�ծJޗ�=I��j޳KD�����՟�1?+�����on}.��-�ݲ˃��^\"�8�S�Gk.�M�}c\rm��y��Zx�x�o���0;���������n���\0G��G���j�̓Z6�ޞ��ӓ�R-�}���E���,ӽ�GOO�sM�K���-��R�kS^��!�����-��<�������� +�}>z���c�:c��9ރ��]n���omr=?�a�/��y\r^����h���R�4�c�砾�q��58���o�;w�~���:��ڵ��+��[�ۚ�vs���1�l�o=\"�m[^���p=C�u.�M�\'f2W�M\\ԟ�b�I�j�?����j��ՙ�\0\0\0\0\0y�a��\0��>�t_�k[?5^r4��_ݛ������bkǻ�}��<����\0�ޜ:V:��m�G��/�����\'ϙ�]\\rg��7�O��\0�l`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��EԜ�KzG�~S�Ծ��9N\n��[�~qr������Lb�����3�$+��E��_z��^�q�O��t���}�u�rr1��g�=��\0G�Y�����|���<��5+|w��մy�D�bc��R�ԣҗ!�.��۴y�x���oz�~y������~�i1�o�m��կ�T�޾��g��_u��cO��^K[�7��G�|{��x�����_M����qլ����ˀUԝS������������\0���1������&+�������Q�H�������j��K�q\\�֥fm���6��������D����������zC�c/)�Z������8��ַ�s~�k<�o�ǿ����<��\0��\0��~�K�}U�8�nښ�;:ZV��<���\\T����m�ω�G���Y�u�����\\x�R)���Z�x����\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0a����������ɟPuF��:�\"����jy��ǻ|�����_E>{����zK%l|>�Iߘ�ՌX�3mj�`Â�i�޾�olǊ�D��|��s`A���,z����]�����,?�=?�9#�։�:R��_����� ����ϸ}W�.����O��˩�=���ώ\"��5/�.�=��g?����������V����ڎ���l:O�<}iLQ���եg�c��k�i���Mg�bA�=]z��Iݧ���w�m�Ο�E���ܚ��fc渫��\0���6�bB�=Gz�����9�~~��=�C/P�_�hM�^58�j��x�U�}�}��\0�Vf�j�\0p4���}8:˺\\#�q����\\�Y�R֧��Ǘ;��Ec%\"\"b\"c�O���=y��<�\0LsZ=���������\0�NG6\r~3�����l����/jf������zC��s[}G��{՟N��L�9�S5����?f��옟�Wf�4�ǋ�f-{��Pz��C�/J���{��7�ٮL|7����Sb�����k���O�L~fk[��|;��+ԧH�_���W71���jƵ�j��q��<z�1��S/�+��i��������\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��G9�\0��\0j��x�={����3��e�?��\\?F]�ھ��l���Ί�0��>��ӿ��������\0v;��]w����v�/��s��Yt�8\"#>���W�-=�ÿZǏ�ߏo�X�fn��MѴ��3~c��-�$�wM������<���\0:\n���\0�S[ԇ���9���Cpk��u~�aɗ��e�nb���~���[M|}���ϏK������OR���m|�]K|����]�|o6��6���~\\��K�c�����o�Y6����\Zkj�Ǉ8�Lx��c�DG�Q�����T=�������k����?;�N��՘���ls?�3�|�������u}5c����tNg�\r��=�x5�\\���>��;S���5�����1�G�q�,e賽��ga�n[�y�I�\Z��6u��͛Kf��s_V2䟹��c=1W%������\0�S����w��K��wz������7��ng��?�����ZiZ��1kE/kV���I�����A(>���;i�m��Wn����\r���7�Za����x�]��;�o�Y�1V։���H�V��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���>S�;!��e1^��̵��|Z�N���\0;���� �HL�)�B���:{���\'�Z=���c�D�\0�z@\0?>�{��=w��ѽ��k�ֽg��ZR��vy.[,a��Mk�����\"c�h�?�bv�[�9�K�\0K���^�㮮M�^C�ᵾ����Cz5���s�.Z_��)�-���=�ۍ��^�t5��{���1�ojڞ�lj�V���?��E��d�q�Ǉp�i���ֵ�X��D�\0�ﭥ2�~:%��n��[x�l�73���\0__?�\0�C�V��g�-0�S��\r�6ɗ݊���r��W���a�m3�\'�D�@K�[>�z_էj2���l<wTpUͻӜ���klM?v,������_��{kx��DHC�/\\g�����w���k��y�o��J͸.SG>���--5ͯ��g�x����>ɵ��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	>��!�u�ޡޥ�\0Y����j�b\"�r~��h�LM3[���\r�8L{~����~�������N+{�ό4����~����Aw�W����ؾ���t7��/���M�N]��z���m�����g�,��ѧQ��9�~�uWMjt�%�ym���\0/���NCG��lt�}olb֜�rZ�ii�l�rVm����������\n����V����n��])��\0����i���ov-[dԏǙçf�&A\0�����zW�/�������Ź�Ԛo���Ê��8����33jG���\0\0������{�ѝ����w/ҼNJ��=���̔�-�7�c���j�\0>A2��}1�Oӭ:�Cc����Xq�Vi~G��\r[nd��-�f�S�{->mkL��B}#��?�{ѹ��͏[�:�:���p��H�������ן��/��~���-�J������\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z��C�_�=K=!��}��r����õ�,W��_s�$ViL~�Y\"mkDG�|�F��z��7w�\Z�n�n���K�%��}>7��m���/u�\r�<KEf?��L�k��\r�u�.����;oK�����p���Zd�\r���q��Y���_�\"�6�?�Z00���=��m�}���+�u}�lX�2��6|�\ny˚~?���=U���O�λ�~��{g�ߢ8�Vw:K���K���\r�����kFO��ZmkM뎟g?g�b�2X&�oJ��H�;��O�3r��<�>w��۽pf�+��9b?��\Z����Rk���E�LV����K������){�}G�mq��om�_c�d���}���y��������y:�Ύ�	�};�������8��)��]}~[Z��%ui|�ɟfY�O��q����n���gC�sD��-jb˳�g�>3��X���g�����}��|��[\\�|��gj_\r��J�&��ǘ�O�c��}�7�7��N}7����q}_�M�wũ���W>�y����zL�}��b}�����*��c{��C��7��{��;��Wu%2ڛ��=�\0�,x�g�x�c��_�h��9���>�8]���7��Zش��0R)�u�S\"?�b\"#�@:����C���59I�s�|6�-��8�Z�0^��-5�������)��%ӻ:�+�\\���W{������o;�ӥ|��Q�\0W1�f���LG�Z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�>�ٽBc�/S_��{z[���<�5�S<�ǩ�o����q��Ly�_��G����M�d /O��W��ǃ�k��Ә>qi��WJ�#ͦ���ŋ���i��+>���@\Z��iz�����R�s�\'���N����\nVf#���3L��i����3��\"|�r�[����C\'	��?ގ�\0��s|}��_��?�wf��������˖��7�c�����ǰ>��Rw7��9���N^�3�r����{Z��։��\r�N<�j[���[DGܯ��!g�������ml�nm�W�;��R+�u�Q睮Kg�~�c����>|��O��Z��\r�\05��M��\'�pjs�gN��~�~���r��zMm\\�3��͆��|v���&�)L�\n���_R��vz��^���/e�N^�Ͽ�K,L|f�>����4~���?�~d47G�[��%��ћ���V�Kl�rZ�GL�;oZmr�ԟe2�D���Չ�6��6�M�4���N��x~��n��:z�8q�s=k����&#��φs�%=�?���������P��I^��7�oj�v�\0���#����g7�d���S<�cϷ#�Ҟg�G����i\r��Lx�c�ԭ�޳[V��-����Q\\oR�/��^�	���)�véy��[V�W�1�_��~3wS,��x�{N�j���\\U�|DZ�q�Ǜsa�o���V՟1h����\00�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:�k��[��i�]3�r������Ǟ&#��\'��?1ѝ�:Y8��>��˓����W��Ǻk��>?�A܀\0\0\0\0\0\0\0+�ׯ���仵^�v����*�q�?\r��k�z�w}���g[5rW\r�0�^k���I�5�E�#,t����q:��7���V+[q���Չ��F\n��X�x�R��g���6�h:�CԜ���N��w��0r�����\r;�|������;�<t��&#ͭ_�����-t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\07ԝ�����.�ꮱ�8�[���G�im��m��<�1Rgͧ���?6���\0\0\0\0\0\0\0����ȷhx��w:�<��������jE�زޑ4ś�K�0�ђk����ii�΀\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�q���Dr�w��˧����c[�>�kZ)�_\r͗.[��J�\07�c�.z���X��>c�]u����\0Gm�|�\\�l�ѭ��8�3WDe͟M}�|R�-8�f��\\�������������\\�F�1���lq�rW%�re�[�ڿ���y�����\0\0\0\0\0������Nk��9]�/s���55������2c�k�I�◬�L[�o>���z��7r=<u��T��|�_toT�_����Ɋ��:��]]����ޮj�7��3j�����7���\0t:w�=�����h�Լ~-�U�l7��\r��H�;ޤ�1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�ԯu��=��n��GS�?���?�uΆ==lt�Ծl��\\��|�����,Vi�5�������=wz��n?�z�=N`�7�Ю\\��c����ӎ~ޮ��\r:���j[��?��>r�5���O��>���AuW��k��zc���3�b�]�����J�EbokO�\"\"<��\0���9��8m��.SW������������H�Z���+X����C~�}Z=6�%����^�sz֟�rZ�&-}m�Q5���a�zMm��{m��3${����zp�U�O!�[,���͏�l�lDD�|s�K�LO�k115�Dăc\0\0\0\0\0\0\0\0\0\0\0\0\0\n3�W�N�t/�u�C���7:�sg��֯Z�|���l��ka�YдRԏnjG���3����W����.��\r�R�4��>��n?��룵���ͷ����ku��>پO�7�y��}�v`�Osz������M^��kYϷ���i�ZR���K�g�iX�L�\"Az����ǣz�N�]	���kk�f�u�E1L�c$�ɳ\\�k��E�|�O�HK����;�ќWp{}��s]?�`�F��1\\��5���E�j�-[V���11\0��\0\0\0\0\0\0\0\0FUZ�{�n��oi{s��imp\\n�\0_m��#W_oZ�����<����g>]�g�ӣX���E�@��ެ�۫���s��ּOM\r�)���سrۺZ�o3m?�pi�����#�9�jO���D_�u��F�?ԼƗ�ic��;���\ZG�ֽ�\"#����>�ފzs���l��Ss&Y���������q��\0�2\r�ۏV��;������y�c���8��Y6o���/��?��l^K��m\r�W��5�t�1�\\�;9k�*G��״�V#�̂����#��|�/�uG[f�f\\�5��6\Z�ϙ��p����i6��<���)�T�j���ݵL�>Q�����՛�?\\���n_��~�˚�N���\r�|x�ɯ�5i_>c��\'��=�����nX��v���>�y�u�|V{�9�[�گ�ގ�3���oI���^��U�\0���#���%�^��7��y�}+���b�eڵ�������o�g�V�`�!��(��g�����/+�7�&>���k��p�ŵH��ҹ#�#�ٯ?��Y�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�}e���pz�������\\�_����2���=�_w��{g�G�||��~A�#6\nbÃ-v�d�jͭ���v/��o1�|y�����O�=<v��\0%��\0��w�͌X!�Ջ�:��=s�zc&���yMG���6��\0F���2V\'�c��,����Qi���G�]�����I��~Ok����u׊֖���E\'|����^m?��j?EN��x��u~�3�\0�����q��}�ngծy�O��R�o>)�E��\"g��p\0\0\0\0\0\0\0\0\0\0\0\0\0 ���E��:��r:��{+�q<��_sK{^2�\\c-f-[M�\0�c���Ǐ\0��J�i�꯳X��b؉�Κ����M���4�����~<y����!�8\0V��:�w����n?.��{��w��<8�ӯ9�b�\\�\"\'�Z+�f����rb&=�$*�^�|����/S��8Z_�%��l�;7�6�-��3Dd��E#��W�����ϤgL�gO�H��Siή�Pu&�\0/�ᘘ��^�q��O�Vr��j���՟3�X�q{�ѽ��[����0q	�;�y�|R�b+Z�|���ֵ�D�ִDD������1���w7oj#�x���E���1��\r�lە��˽���ɓ���*Z��{b��{�Y�z�[�z���M|��1�\'���v66�\r��Y��ٶzD��M��ͭo�|@H�\0O�QN�������y:���t1b���I���}�5�e����j�b��,���-H�����c��Tv���7M[��|j�|W��d㷫7�?���Kx�՘�LL@n@\0\0\0K�U~��$���.�t�m��8~����ּ���b���ᙯ�2_��6���8���x�z�z~���}��9�����M|_��?�d��\0�M0�����������~��B�<?��wb�\0�xq�mi�\0Y����\0��wS���:�c�����;g��x������[c��E��l���>|L�S�C���σg}|�G�nN�{-���Fg�Lц�tF��w��O-x��4��qݟ��\Zx:/��H�l�>/�{G���e�\\�q�j�Ur}\'O����X+>\r���銦~3V�>��:�ӧo��7��kf�y\nǻ}\\��R��4����bU�]��a����S�^,o>�gskU}�߁sM�Q�\"|��f:�Ӝ%��\0[���>�j�`�7�����pEzk�w�\"o�b�4ß=���bk[^}յb�3������������}�ٌn��e��&x�Tp���1ӄ����\ZL�P]���\0[���>�;�q]���h�<F�Y��JO�lf�ϋͦ<ǟ>��\"<O�f՝���͟~~_՟vaٵW��s-cL�\Z��<��8L����ƒ���9�t��8������\"���y�\0Y������~����*��7W`2�Wb0�;T�Dp�b\">O�1�}=�:���x]=��\\��>?�1?��E�w��1>O3��Y�>6�7(�UDL|دj;�ܿA������m���6鋛��4�Z~f�?�_�fH��[y��w�gQ���wu_���{3�ef��=�,�	�D����\'��x����T�}q��GYt��78�sK!��I�0�^��\0�a�5�Eқ�c���[�>kG��5��űr�3zw��<l`���<������i~��/�:�����/wc�͏=v8���q���q�}�l������\\��X���[\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�WS����KSSbǃs>*�\'��d�G��#�@�����to�����60e`����kMm�4ˇ-gLy+��1�k1?�4�3�w�\'?�d��O=����η]jL����b��ϙ���\r��=�]���)��3�p6�f��n�5�b�>fb���3333�����2�\0\0\0\0\0\0\0\0\0\0\0\0\0i[��v}\"ww|qz�Ir\"\'��qM�?��\0�(wҕ�oU=��t���?��3��\0�8?�zQ\0w�������:�������}��-�jlk租>��Mmb>&?�i{z�}}�\0�)���w������(�g�����\0@n�7��n?[��45�tt�S_[[[qbÊ�ZR����\"\"\"\"\"\" �W��/;��]���#����ԙ���K�c͛�ֶ^?35����~����_���a�������1��yM�SgGOC��:Zx�Mc���|e��g���Dx��|̅�t�Dt_A��t7Hp�;�<j�<~-L1���1V���\0`V����@�l��~#[�O6��\0���|_�oF�\\�e�Ҟ?nLԾ�g�Ɏ~}�Y����/+��V=?�u�o������ͧٓ,��Կ���x�bߘ�\\��!}\0\0\0\0������\0z��*q����w/�4:rk��{ی�+�4�KDx��4�ͧϟ�����_�+�\0��ܾF��>��s����q9o��F<�\'�?Zb}��϶�mK�٘��l^\"0�*�?�?��={A���h�<J�&zG\Z��\"ex�+K���^7c���L�����g�g��\06��r�����|�w�g.�[�a�J(��#�DiZ`=t=[ќGV�e�֮�7�[6�����&M_�Y��|�\0���\0��b�a��\'��&c]Ӥ�a��.wjb�1b�����MTw�3N��_���=>��}���l���19m\'%�i��1�y�y��U��U���ݜ��l�Yg,�δۍ5�3333>�3.�N����ǀ��=+�t�ǈ���Lu���o��m�\0+DJ~���v�11+6}��β��}�)��zk���c�!�|�XzH��r���螢���9>��r�aڬ�������G��\"���+�*�o���Շ�U���3��43aű��3�LY+4�/X�ڳ&&\'�������9N��@�G���r���vx�~�p�&=]|��5�Y�G���|sy��k����Ӏ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0<�uOp:���.9̷�9y�e��M�l��qO�Ŧ�\0k��\"+|��������\0䳣���\0ٱ�&؜���mz���-4�>m���f\"~�?�? �����\r��?�~��Cw.ccs.�r�[��͒ojy��v�ߺ���)jŦk�><�a���|�[��.�����r9��^C\'�hkb�9v3����͎��ff��1�|�}�o7/�7S�3r7ş���z���7kh�`ϛ&�˒կ���V�kV�k?5��z���s���ӧ���q���hy����nf�[d����;O�Ϗ3!�O�s���X�^�u9�t�<�y\\�[Ͽ��u-��#�|G��\0�?����z���ޅ���\0R��m�>C_J5��mL�v��klw����7�d�\'�#W����m�9�<��T靝��aǵ{�㍋bÛj�_w[&<ؿSmX������L�L�$��.���p]�I�N=�ޔ����h��s�ͼ|ͭ3>|�\0�pz;�:�W����.�Ḟ���<<w���mnZrG�1a�צ��3>���Z�>&-Cч3��WEv�7r{�l]1��qQ����\\��1�-���c%�o4�g�}�E|��T�r>�����h��>��y��냧x^#[5�p��L��nZ3g�U�{fc<tǎ��}�}�\Z���i�;��Ng���&���ӛ6�����nSf��\0m�L��Nf}���\"����~�{�z������{��דݾ��Ǉ6�?�O=�w-o��&��]�\\����#��\0�\0��H���O���~��^�x�q����ܱm��������|{�\"bf=����BC\0\0\0\0\rC�K!�K�X2�Պt77�&��8����\0i����%�,z���u������>�ɩ�5&������KDE�g}��j�}���bb�i�=V����ٽ8w3[���w:�c��~\ryϱ�-�Z�\\T����L���|�����d(s��zcS��;���۔�pΖB�E��Ny���O�-����I�1_��#� �:��5������f�������X�kh���l{�\'+�mx������Zk��DЏ�����O���]�y)���n3o=r^oh�mj{�\0t���{�g�c�|c�������_�0���`��㑮�֊�?����ן��f�r|�\0I����<O�	�\r[�s�����u?g���ns)�ݾ/��]�Yi�O13lq1�h�d��\0H����\r������~{_��}G�#��6���3Fh�L��k9?�1_�c�}��z���׃�Wv��\\�ކ.������/����\\�x�0�6-��jR�h�O���&�1�bb��ޯ�T�G/N��?t3�ǜ�М���\'%���k���5�)|m1�ft�����\0�����������Z���7=�-��ؿ�A�r������l�Ǘg&��w�&,4���m_���>��������u8�N��ٌZY1e��i�c�k��Y�W�h�Ǌ�mh�\'P0���ַl;?ֽ��ǟ&.��w�)����o8��խ-�[L�DO���)?����w�o`:#Ljhb���[�k7��lEww#>i��o�?O���1j\'����_(*��Ӝ���.���l��r8�#${�>���L���b\"�Xf\'�>g��V�����O�3�˧M���j�\n�3Z;��<\"�D\0\08���.7���3Z#��\\��O��ZL�Qۦk�)�r��ߧ\r��z��LL��#T��A��!�ޒ���1^��G�פ�k4���j��?��m[[�|~��m�Or����&��/Wz��s�n�IPo�����=p�uQ��3��=U�r<~�=}�l���\Zsh���ϻ�31�海����wCW�ݟ��m���z_���)�������x���ֳo3?�)߯=bz�׾>�a�WW�ty?����~���W�|xu60��[g����kO39mi���oN���.�����~��8�����8N����7�����˩���|�L�u�V�fbd0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����<_x��|Z�i���\\�[���_�?>}��G}���k�:��������?��T�֦��j������yi��O���?1�\0 Q�v����a�äz����Y����p��c�\"#6	���b���j^i�4-8���JVf�_1!a�Jn?C�3���o{��z��)�̸\'Ǐ���?���jT�I��jv���ӲZ��ԜF�NO��\'j���1L�͂�8��K䧺���o��H��$*ò|Fu?{����>_�[��~7C��6�6�,�T�I������O��L��bg�=��ӗd�!�r\\�i{���ƶ���t2��x&�o�o8��������t���d��Oj�w���Jw;�x������r�{ԛ�ԋEo��|�^����:ӡ{9����������������{�\r�k{�N:2[��\0���ԟ3�?>|D��=\n�b�ۨ�Qvc��ޥ�1��<v�n?_b�;��d��\ZZ�\'~�Sۼ�)��^m}���_����˳���{,h��7�T���9���WZ����O�&&&ra��5��_����I�\'�~�z__�:ד��\\�N�}�n��LNխiL�&���Nz�����Y��tp;��+�b�z_��~;xũ��M|8�\0�ZR\"����B���u�}���>c��N��6�L�����S����ڻ��5�F||����V���k`�zjuϣ~�p]ٶ�>��N����]-M��.�0��{G��i�mm�|�\'_�����m`��=G�u�Nq][ӛ��⹭,���?�f�_�����Aـ\0\0\\��ѧ)��<fZ^���o�O�L[G5f#�~A��ҿ��ꃱ�:צ=�����kO�sr��ͣ��Œ?������P����r\\��-�q��mҷ�[LZ�����-���N�tB�g��5b��m�C���4�����f�ɳO�jŶmm���䌑���G��09�/����h���2b��ky��䶖+^>?�� ��\0S�Z����לo�Q՛\\��\0N�-u�t3�r�ܶ8�����6�c��Z��}�ֵ���\n���?�������x�δ�5�uy����x���ˆ}��c�9�Z��fb-�f+�d;oL��;��K�x�u��qQ{�\'7�;:�ە�b�a�Rf�f����1���ff)\0�^���]��ox�s����^��ວo	������<�9<��5�4���I��>و�ھ��&$-�m�Sg��m�;���uo]�	���n]|>؝����&��)���69������N���;��-m�tn�����7[<�e�71[��ϛ>:�7��|Q�/�����p�ރ�Wl�]�<on:��g^��޼W�Zr��J��g���ff~fA�wk�]��?l_Ӹ��ؿ��^_���3��R#.+�b�\'�>\"-�0\nZ���[�����\'p����+����.+�w63N^��xqd�NL�v�����\Z���I�y��p��B=��\0���ҽk��������7�~�V��o�ˎqf�������՗����{��h��N�Gr�\"��}뫒կ����\0�Ϥm:���7�ܼ=9�_��?����W^�\0���LJ�O�|�,��3���D�݂}]���k:\'��>����Ρ��{+�ѧ����\0�ݦ*�\0��>*�blWfyƋ���dy��Ɵ�ꊧ�5���\"����\'���id���x������&?�KT�D�T�To��5�x�4_�:�TD����b_d*�\0\0\07p���/ӽ��v�Խ{��F��y�:�|���H����\0٭��d;;��F#ƪ=�>��V��j)�2o�,ե�F��O���:p]/l{�����9�~���Λ�pq����1�\"o?�֟6��fe���wҵ�d��K�ƝmҼ�N�ψ�����~<{?������/�α�7@w�����-.�Ó���]|S�jd��6����|4��l����`]y{g�w��=Wھgk&��Tq[m�qǛ`��1L�����x�����AMq�+֞^�r}K�M���9\nr:�C�cK���)��sg��l����9mh��ffB�=6vs7b;7�v�濶�������{���|�9�~f\'&KEf~}���l�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0o�V��Q���p�˛����������������y��W^�?f?��D=�����������_�����{}�io~<����\0<ޥ�=�݂����m��3�\\�1j����ɹ����8��V��\"���om�x��.��G菵���ؽ�;�^�O������������\00Ipy���؍oN�������˃�������q��^?g�x��>k8�D�>~ݧ�|D���F������{ܜ�s����ذ�Y-o6��86f��ز[����\0pm�j�U=��{#�߯{��F	�.#&M�h�u��5ņ���^2d��������}(zv���N���~��\\�����Mɜz�����Ӛ�~�d͋7��o�\0��\"\"ְ_�up����LXqV1�ǎ�Zұ\"�������Gs}F_�z�0�����sm�����~C5��&9�V����=x��m�#�1�vc�}���S�V�����L����x3��F,�׮~&b=��dD��`$~/Rޮ��S[C��S��۞ܷɏ?ux����o3�\0F�j��\0k�?���/�#���������tz���\\�y^����f�⑎tc�y��h��žA�Q�����n��oRt�:K�����oq3����^��ih�X�m3Ky���|���<�]�GX��Yۺu���}����M�g�g,�{��?dǶ#�����\0\0\0)ݏ��u����?�6@y���sV�1�NCc[.�����a����y^��D|��&{�O������F�M���ͣ�7��LE��\\��nM\\����H)�v|��-.v��a��+�x�ǒ��m8}[Z/�\0���홙��~}��#��GE�ц�cC���o�i�4�kc��g�Ǐ\0�>�}t����l��P��~.7:[_��kb�u�o�_��Flr��9���������m�!o�?��`}7vG�6�o��z���ǎ�1���زM�6,���k���b1�\0#Ϗ>~��<}v?�W���������z�_�6x]-�7~1Ʈ,Z���h�jڗ��{Ž�>k�#�?�#�?L���w��s��{��o�ћ��t��nF>\'���M�f���v/k^&&#�33��LpS���\\/��tN�<�����k4қ�cgr����E�W7��؈��Ǚ�L@B�����g?���=M��c.��q����ñ�*E/�t旛޾ٶkL^�i������}Xw�w���Fuo[O1z`������ncɗ��\0��:��r�������i��8]C��Y��\06�N�u�Wo7���~;ci�汛^�o���#�2֏�n�z��:���k5:C��k��jl����������6,;>f1qo��-���ϐ��\0D��s��ݾ[$ߧ77x�ŭ>؞Nc5��:D{c�;c����\0����k�p��C�r<���rz���x���d���?�2\n��=�W[������sWW��ouf�jFL�w���;�����_Sy�c�?j+?�ր\\1~��炙��Ρ�U���WQ�����jE��/_?歼Z��k\0����z�����}4w7�>W��[�j�5�#�33����k5����3Y������|*��n7O)����������v�mQ�[�������M���;b��\0\0\0�����:[������WK����������G��ر^&�6�Ƴ+fk�a�\\�~.��\"fg��:����;�����vt��]�#F��>��}n���Y��x�>=��l���?�\"\'�\090�,f�\\|眸Ojv��9���������c�>�����X\n��5o�<�{�1�v�ŋ&�_s���se�c��q��ߥ��\0������1�/3?0����h��m�k����k��\0Iu^�?��y�c�+�nOVژ�pZ\"�ruu�rZ������5�Հ�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���#�{���2bٮN\'��b��uo\\|��_tOϙ�_1?��/ˠ��q�\rӼv^��x�<�ϛMk��|> �:^��š����|�k��������+L����@<�u�\0Y��7ѝ;Ӝ�}m��!ڽN?���-[r{<�mf���|z���3���<���\rh��� v�+��n���3oϜ����M��W�[n����o����ǖ����^�ܚὫ�_%/��mx�m=��h���o�><�g�p>�������_�}O\\���o���z[j��M�81[O��c��LEf#<��Ă�V�\0Y�P\Zڙ�/Ӿ��M�k�R�>��jr᭦���x����g������o�\r�\0����N��W���)�Uw3�1��$����c�\rjͦm�+{�gϜ�ߘ�d���\0bx^�j���.|~�P�|�\0#�������鿛f5�W%m>gۖ#$�߶&�!~��\'j�V��vˤ�[Dū<.������r>�}5���z{�߶�Z�n�м�\'��g��\0�1���v�����1���+^6���\0<q�\'���9?���\0�ܻ�\0�<��6�	�p�5�ht�Oq��w��b���������X�<t�|V��DDG�\"�\0\0\0���M/O���˞0�GsYm�m�Et������ǟ �_D|>Rz4DSS�=_u|{�ߧ�2�#�O������}�=�@��i�3�l�~�m�N(���_6:V>?��#�`�OR�g�]i���m�[{����n+o�շ����re��f�L�M;���\0��L���7����x�7�驂�+k~f+X������\n������&.�v��ϯ��\'[N=��rW��#�mj�+h���&bb<|ă9�W�U�~��s���m��{����kD��Z�T�LL���o����� �����OK��-ܮv7��I���ڗ֛ϛ�d��+S$V~<W.,����\0w�Al^�{s�Nk��ly�N����.K��m��+I����{�my�o�Zf�>ffffA��~��?�_r9�����Z-��]1���1���c�2G��C����oӧBc���I�bՏ?���x�\0O�>���=b+���||�g�\0����k�s�n7N�ˢxn��66m��S�Ӧ�,��Z�rZ���i�)g��b?�e\0������\0HS��ǟr8�\'���#�k��8~G{|q3�>�W��V<���ŧ�^\0\0�?POG�}F�6�Zv������~v�m��R��k��ӽ��v9�������R�[��n��\'����e��1xZ���LLLr����8�*��q1u��mS^�oRqW�~W��IǗZ϶���G��1����kl�,��]�w�<\'��흄�|&��\"�3ߦ\"+��OX�L�I��lg�\0�Zեf�/�bmkZ|DD~fg����1Lk<��.�n����>�ҙ��@������\r��4�_���b���O��H�2<�0v�k����:|z�NA�Wo�iqv�j�\0Mnyp����L~��饿`��W=ml4Ç\r#<x��+�+� j���?�}N��޼�:����5x^f�f��<m����N7lX��������{<|����o�k�0v�S��G��]s�5钸k{��\r*k���o?4�j^-�cŭ�b��3z� &�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ϟB߃�����/;��v��ڧٶ?�ld�u�}6�\0���~�������\0�o��\Z<nK�����-5�W���)�����\\�����������\\Xu����/{LEkZ���g�DL�,w���[��]������^Og��pi��W>y��8/Zb��ikLDL�Gϟ><�(g�NwC&�;of��͇bq��*S<d�[�kd�3�L�#ū호\\\'����b����:�ԼVn#��Rw��㫆v�\\Z����r���k�;Mb}֬G���@a]��/I�϶=Aھ����WPj[^����_\'��g���/��[��`w���_��d�x��`�z�1�gԴMq������1?�ڷ͎Չ�j��h����oP��;�Ԇ>S�����l�1l��S�.|NZڶ�4���_o�����o�\'�=έ�nW~�Gּ�\\�v����d���#�|�-.^����k��b�E�f�x�w���kq\\n�=mM,4��Î�)�+�k�DDD�9 ��K���w�;�\Zg%M[�z�%�k��NL�y�m�l�y��j����ǛNo��V�P���w{����^��K��ɫ�hcϛ2��Sgǌ�������E�?�?��g��~��P������5�N����3�S7#�:3��O5�r{p�-&���ێ��\0㶽��Jϼ$������^���z���>��g��֙�-�i���I�5�w�\"f+ol���b\\�\0\0Oz��+�zP�ͱ����k��{~r������{���|xTz%�8z�|_\r��������A�[Z�?[��C��<�j߻�\"��|���\0��t}k�=ێ���.��n;���������p���R�6���kZ�����Dy�����]�Y����v8΢�>o_O_OGK{{�\0�o{}����+��������0\n��~�ӎ���C���!lx�e�ԟ�����������9&f׋DP/Cӟԫ�^�������E��|�M�:�gК�Ƀ�޶Ǐf��敷��k�i��w��	r\n����^��vߩ���Ֆ���[{#�ս�}��:���1�����*s���e��������X~�.\\�&����0ů6���L��3��~Ab��>����=C�]���ǡ���K��ra�H�%����������h���f|Dy�Kߥx��zk����!�z��6���׶J���O����Ǌ{f���fg�@&�\0��Q�W�A铠x���\Z=U�ѵ]^cgF����xqͼ�{f�ϒ��c��ֿ�����h�ԗ����{��ÿ��������}��?�Ofc�okG�Ǔ��h���6���Vg�/�z/�ޢ��=[����?}{}��_v-������־��d��(��S�O��y�>&-=wÑ裏�#��_W��l�/�rO��������\0{%\'I�\"״G��\0A�\0]�3�Sv���<<Ou8���\Z��q����&�<��g��E���[��N�.�ڻ\ZĮ�.u���m����)�q1�\'�~ZN���ܜ<���HuG���Ǌ�mnG���8�S5\'��o�����c�\0[^fyE쾮����^���~�2���bb=�\'�4�8��8�j��1?\"{��{־����\0�Olv-����r��P־qi�{�[\r-��Kx���o?学3�\'ዿ����~no�o�g�����:\"���].+������\r�~���p|�u��Gͭ��Y/o�d���֟ͦe�9ŕ\0\nL�w��׬�GS�Ṏ���f0�Kq���u�~jٳE\'.�\'كZ٧>K^-�/�^\"��3|An}��\r�n�t�i�<�{O��}���������>�����?�w��oRu\'��!�]S���|G�}��ݬ�LX0�<����\"\"��Gd���x�;��w��3ަ�1�~2��8�ŧGpf���l��k`���>h������������/��✺���K�մ���I���zڶ��Y�ǉ�ˀ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���\0�׳]s�ڍ|�;Ӽ�%�$�c�\\Z��8�tLL��1>fb<O���z���׼��!����rz��mh�����q���(�9=�7�M�6���������Q�r�z_�׾��������W��{�>#�g�O����ԇ��4�9��t�9�ͼe���p:���\'����2E�&c�V|���`����[п^w/���\\:E�rۜkҺ���3�*�ӗه$y��z^#�@*sb;/��5�8>��O_R�8�~g���CvԘ������-<G��|��A��1p;��)�?��d�˚�v߶|Xm�4�������Y���H9�)��3�}\'�:{=���^Fui��9�r�xz��rdņ��[N:V/kx�mx����鷈޷\'��rV��o_y�O�o��><�\0��sQ�VoL�#���P4�9=.���8�����R�5���[_n���Ϛ���{Dږ��CA�Uwg����=��;��������^�ç�5���}��7���3Fm�x~�	��V���f���\0�dv������Z��xy]m�C�Û~il���]��7�Zk6������KV���\0?���\0�>�ޘz�c��Pt�}�\"�x~��*���J^c_j����1L�+4��\0o�4��ַ5��y���mtOPmV9;N���)8����f\"�ɏ�֭i1�i�\\_D�����]*�t{:;v-_u�_�ů��?�&�Y�\\s���O�jTQ��v����[��gZ槳W���;:ږ��˹�Z)H���g%�ǈ���B�6�����;���]S��ֽ[�?��#���-�g%���5���\Zڱ1�p�G��6���쏬^�z�鎁�n��t�pm�����K��<<FL9��l9o�t�Vm}��|T��d����ӯ�\r���/��[sG^3���/���tv��;����ˋ͢=��Z<Ǻd�oX���\0�5�L~�{�[�Z��T�_���^��1?�f���A��P/S�{�����,y=���|��K��Ͼf���\'�b������y����S�����������.?�5�m�[O�ϯ�KVcY�*��Z��_��m��$&wW���m>���u��.�sT�uuy���oc&Ko��i��ޙomL9bb�1�3��:��\'��v�����u?)�rx����;��O�,��a�6�\\X����b�1k�H��i>��g_vϕ����gG�����9<��4�L9��q���|���Y���\">->Bht���ևLq{|�X��Gu\Zi[&�F�\\��q�L:���O��J��\0�Y�����[t�y��������}��<\'O��o׆˵\Z�W���[N�9�}�e���\0�~g�d*c��n����G���.�������u�3���/t���M��bc���j^_K���q[:<��nqZ�X5�s����-���(����1Zc�y�3>d7��޼������#�u��6^��W��K�e�|�ysWZ�����x��ϒ���k�q��Ef,\'�׽}��\0�g9�.��h��|f�*[sR61�m�b�{fb\"|_ϟ�����Sz���u�z����[�9\\|//��Y��ˣ������T������rZ�y�<�����}}B�҇��\'����y\r>���\0��\0[����5�8�O�2�\"կ�f��G��<G��?T/L]����5o�_��\'��Ҷ�\0��ɷ�kZ��83e���jǺ1�|�>A.�>���z�ԗ���кS�՝�����V<�{۵65��\0~՘�c���Z�\0��)�ӟ|���K��v�w�٭b2`��؋���hM���M�>c�O�DO�&:ω���v{�o�>�p�;�os����71S%�N�����b���V+��\\���-�׬����߼��=9v7�ru\'YwC��i��W������n^#������{��y�u�����Y��묺�~��;X��8���W��\\W�S�G��2M��^0��lx�I�#�!�u�\0���\0�ǌ�~�mzu����r�����[o��v|V����]�mD��≥+�~ɏud/_Ӿ>�a�G�ﵵm�T�1�1:��{�_�1�g/���&���{���������.�\'�k�^���\0�xo��|�Դ����L�H�>=�������_1�^��]1Ԛ�5螼��῵��Pڙ�i��~\'c=�|y��p���\0\0F�W��cꏊ�1�1��p4�㺣G��j�\0��1Y����3��g�\rT�\\M5F�)�1p�i�b���w���LOX����>�vW-�c��;:���N����\0{��㈏�Տm/>c���{y�\0İL�%�W���f�~_�GXvi�m���e���i�F�fwx�Ǉv*�;��q����z��;�{�ڽ��\0Pҳ:�F���{��\01�>m1�����#���T{<����}~m���N+��:��»��z�L��{�=�v۽7zr��\0�.��v��g$������R#g�ۘ�|�f?�|��|D39�9����������/�����N=�vӢ�X��?�lZ������,x�^i�\0-��3��������a�M.�p�����W�ϡ�}9�����{����9,խ9^4��jζ���1Z<D�fB���}j�������{[��1G;�jk�ѦL�n��k�a��>����3�&f+���b<�([�9�~�����z7�x^_SSkG�ӵ�&]ke�ҽ�+�ٱx�5�Ot����V1��}\Z���à{�����^3�����/(���\\Z��x�\"}�6�x�{DD������*\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\01���㤻���n��G>���=�873j�S%rW�\\6������Z\"|x�13_��H�6孓&��}�+>��A���L�������������]Q�J��n���Z�i��1j�V�?��S���#���??�k������&��k=DioWgZ�6t曜�Sg_%�d��m�\'�~<���==���ߧN��O\'������,������63ů�>-6�|�r�����D�5/1���E���z��ϡl�f����C9�?��是�W��1�}\"=L���1��d��\0�g���i�f�{t�QmZԚDf��\"+�&&c�5�>&`��tx#G��1N=>;[��-i��:�k3�?2h1n�vۤ����w��u��{��\r;�mc��V\'�)?�-�m�Z�?�*��>�>�z��|��}���;��xΡ�d��l�o�m(�|�Vb�=���ݎ<��$-����ۮ����؍��\\n���c�vrR�3Z<���u��f|�ffg� \0�r�_�q�|/5��o���o�����2bϊ�5�/KDū13&$�G.�u�\0;�ԝ��7P�^��G�K>8������Ҙb��Zc�DDVrZ\"\"\"�\"\" #4�!�H����z�/\r�\\>�&_��l�o��{o��\Zy��>k��1��\0�7�I}�,�\Z�]U~����ŗ.����9���z�k��MJżMgݧ�=�����h	����?c�3����^�����9���m���{��zִŎf\"~�*c��\"}�b$�1㌖��^���|�G���G��\0�A�wW�}��Fmv��}-���y1�ɫ�&Ls)>kzd�j��h��ԴO����f$0�Iݭ�iM>��z���Yb�����.O���X�c�-<آ����<_>~A��=z{���\0ƽ)��\\jg�F�N��yxœ��V6��x��>?��_ѧ��=������}֋��5�b�i���qS<R~#��~�s;��;�=����~���z[�-6�x�3��Ѧ��W�1g%}�8�d����-�d\Z��@�:�)��<wW���6��fӏ�����������>�����-�_��S�U��dr�^���<Ϗ3��<�x���_��\0}:{N���ߎ�:7��מS��F�H���7��5g&�iZO��������D�uOk{{�ݽ�ڎ��MO����ҿ��8g��x�1�t��O������F�G�I�{&k��˒�����u��~c���s-�|����?Ǐ�t�\0��ލ����_����\0ރ\"菥�^��t:���Nw/#�����ͱ��[ٗZe��k5��/���1>|x�|v���OG���g)�>�����[&�l�Vlx���je���)��3H��I����|Lv��������ޣ;�\0�n������\\���jM-��N~�;R֭�_�L���1^��=vO���n�ổ�\Z\Z�������8\\�So6���a�ß%|[�V�&#�H�/e~��?f{�ӝs����ux^cK�����=y��ML�wb؜�}i����y�Dx���``\"z��g�3�g/����<�Es�rl�f�&������ߟ6���9m�����&�i��S�/����ЧDu�\r�=7��)LY���ob�6�^��J�ŏϛDZ�������\0�=��D�OWt�K���bb��T��Yuc�F-,m-??9����$��ߧ���r�WX���U��1���\\i�R��1��:�#\'��FL��,[�/\0��ǎ���v�Rf<�g�ǘ���f?� ��\n���o�Z���kv���8���F����9��lpy뚹�_6x2Wr��eǎ��+�ӊ���m�,��z=m��?	����庛SOO���lX6��<Nj��5�x�L~\"f||xF\0\0�:�����zg�8}^S��p�֦�8�<��x����S1��W����`�7Lv���:o���;�7ɗ>O��2嵲d���{�>����\0t�g��vz[���|���3�{q��{fՍ��4����i�3[{f&\"fc��+�=%�]��绛�}�螡�}N/6~{3?��{1�h�x��h��dǖ�Ǘ�Y�ςk�q���/Ӝ>�Opn��q�����5��<Z�1�+Lt�|V��DDG� �>���>�D��O{cz��:�?�p��z��e�h��+W�w5����\0�����Cb�5��]��?1�u��e�y���763f��|��^�x���M/\Z���1�i����Y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�=�i�� ��\0#�}�*r��\0��>��?XgtWli<����ɏw���o3l�pֺ����$�܈����\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0>;{z�\Z�ww��kk`��˛-��H�3kZ~\"\"?��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��Zz���k��>��2��q��m�Np�1[-��ɟk-k�\Z���\0��i���S�NJ��~�����k��;��Լ�>���ɫ�o�>H����9k�}�~����{+Z�b��혀�0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T_S�k��-.�q�Y��=^R���S��cVѓo�8�m��s��O�4�R+�Ou��$~�������	鎩䫳�}��N+n֟�3�ڳ:y���o���8<�̂f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���������;����{�6��<y��ͦ><πu�]���%��C�������of,89\\�{J�-�g���\0\0\0\0\0\0��.��讐�:˒Ǔ&����{��{c���-�\0_�\0���n��K\'\\�z~�\\F=��Z��<����c[&�-���o��16���������8�����>���y\\&��2���}�մ���Ǜ����c�}���-h�\0\0\0=����N�p��N���	�<U-��[{�)��)�1i��X�3�@0��y雺=S��z�=3����,{^̛�c�+m���i3>\"g�ăpz��i�����8�����=5��<�n[��O�]���\Z��wV�oZm�L�Y˓[���{f$#J�]=K���W����s�9V��8��O����_�9�����6���u��X���\'��O�9�Ϋ����2��˭��rk�������L�D�)�������\0��\0\0\0\0\0+oԏ���t?U��y{u�Y�uvww�k���}n_��_koR?�˗w�7��1���� �~�;<�M􏩮����<��Op�:�3W��Xš6m�3DΝb������{Vmh�����uꧢ�\'��g�:�6�sz�5z{���\0y�����>��I��%��5���kV�AПToW�;֜v�P�KC�����k�����Xsj���ز�׮zE�6��Dھ\"}�3�B�zK��ε�N��[^x�{����\'%}��9��%<��>�@;p\0\0\0\0\0\0\0\0\0U?�著Wq�����K�����t��b�y�\Z8w_�6�j����c�|3X���\'%�DV-J��m��g�.����z������9~w�Կ)��8�Զ֮,��f���J��E�0L{|O�[�|DL��\0\0G/^~�����-�q:8�u�L��1�i��0Ǻ�#���5\"����}ӎ���\0�/�w|�{\rꯥ��r��ຳb�7���W�mZ��$��}��g\'�ǟd^#�RA@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�OZ��.w�\'qmҽ/�n�+���C������[�ӌX�j��g%2W4M�{�3y�m}���+u7ם����iڞ?��<�e���k6/��{��f���/�klqj�)�\"�30���{��ˣ�������{_6�]{3Ƶ������̓7���[{�3i�y��\r�\0\0\0\0\0�J�\0�]Խ����<>���g����7�����>=�|y��\n������׬��\0��,�;.���}�լ�N,��6&�ͫ��f)i��D^f?\n}\'m��=Tvk-�W�[�>�f�lF��bm>4�ϟ�>A�4\0\0\0]�3�t�z��x�w�9LwH�O�G4���O>��/�o��[���3�G�X��o��G��osC��3���1���s^o|Y~�iKe�oOu�Sb\'�5�Vd=0v�{��;w�ܟT�����]����������[G��͢A��Dz�>�f�V���}�	���ܦ\r]m������Ƀ$���$LL���G����>���x��۞��������l���޵3{��b���3�ky��+6��ǈ����Ë�>��*c����b������f���33?�fA&\0\0\0\0\0.g���x��s���W��˵�b>c:ͭ1�\0(�QG�?�ް;��K|\'SrZ����c��֊�ϖ6�9}��k��77����x�$��q�<N���������M}|8�☱ұZֱ�DDDG�6z����zE�㴹>�u1�u���r1���Zg��g��M������Lx�i�Ǐ��V�����n�`�/Vn�����U�<�WG����x�?��r\\�;��F�>�Zy}����/��\Z[�]�����Wq�]׹c��99^O��M�cC�r�qe��x�5�V�lV����Ɉ�^��ًzX���b�@����\0�v\0m`\0\0\0\0\0\0\0�ܷ�mr��۝\\�\Z�Ջf��ϲ�36�\"&c�c�T��>�]K�{�\0c;3���|ѫ��ufI�)׏w���6ŧ��)5�X�m�־<T���Y��~�z�c�/�~���^��5�_/#�\\�[3�y�L�����:xm�g	�V����\'��m���\0������p\\m�zk�z��zv��ϗC!](�j�K�sN],���y�Ek1X�\0\0IP����FW��x�m�/��.���5/����}�������i���[>��\n����DD�b���n�u������mn���?��־��lk�,Ǐ�����~�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�~�ܝp����D�Y\'k��6#n��v0}�8�َ�>\"���o�q㟏o�n?�v��F<.\\����7���>�4��ٟ��շ�\0��\0\0\0\0�R?D�\0s6���Ó[��L�O!�սgţŵ�1��6�_X>������=�N����o\\z�V�i�cb���<y}�����ko��ă\n��s�z%��y�����\0������\0�??�����ꎛ�U��#�jb��qa���Ź���>��H�i���{#��=���`=$\0\0\0@���=��\0�6�7ܾ{;���L<���m���F;����V&gǾ�����c��\rc��/�������z��[~�ˋ?��1�6�c������♬^\"��w�g�Y�����Ώ��n?��\0vp�ɖֿS�f�^#�}�nI�1�\0z��>\"#�|�.g��\0�K���g��\0��\0��\0\0\0\0\r듯5{q�#�}E���[?Nmq:���~�v?I��X�z��DL�\"A^�\0G��9��r]Q��ǯ~�蜚y�ڵ�ln��V�v\"c�|ka�>&~=������t�Y�+ל�J��Nq���OfΏ!�M�c��R�1�\'�\'��\0׽���ؿN|�Qr���\\~�ˎ��������O�)�k[?u�odO�3�\"�W>��>��������n7uv|R+�����\0o&|�������,��5�Hݡ�-��6�b|��\Z���?\0݀\0\0\0\0\0\0\0\04�{��p�\r�^[����yzM?�-�k��޵��3a��-|G��tDL��>&����/�N�qk[��4�n5u0�����믊��X��:W��~<Gǀ@�)���3�z�6)l�]��sW�y�Y�g,W���+o��\\H\0\0\'�\'��;U������j��sؿ����Hŗ������ZE�b�m]�s���\nͦ\"\"`6�ӗ�-�>��[�^�kkq����?1�]�����\0.(���?\0�@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����\'���rڗ��ϊpͼZ��KϘ�\0H�|�\0�o�\'�\0��zC�\0���ݔ7�;��3��\'ھ/_����A��Ogn���u�/��[>Lu�8/���k[2G��3��\'��\'/Y��+��|~��˥��v���bֈ�d�y�~�O��><x��m����n�t��]���mlq�|^^S=�r�M\\��6�7�O�\'���\'���/�\0��뎶ɒ�Z�&mi��dX7�3r;�<�Ƕ2�e�k�c�{�33��<�%�Bkwǻ=��g��p�S�9����|�]��z��L9cn��Dcؘ�Y�\"�����_\0�o��3���ے����_�8�?�����l�������`���O�w��G�Vo��sp��o�lZre�ikF-{���6���7�O��ϟ �ο��k{U�M����:_ZͱO-��՜��eoh���V&A�x�_>�9�S\'���m�\r}�r��u���Z���&:�}׬{��f>A�x^s��N/_���cK���5�4�)�jO�Խ&kh�\0X�s�\n��ޤ;��ߢ{y��n����\\�S�o�k�Ó4�a�o�����ˊb�v��j[ű��m�||���>��_��?��Yg�i���>N2׷�5�����>g�a�G��A��&z���/����\'�n\'�8~��#ҟ�V�%��ɏ���\ri�}��&�X��\0YZ��\0=�\0P����#�y2d��{�K\\8��ֳ7����\'�Z��i�g�ω�	��Ԯ��~�h�$d����*޶���1�\'���07X��M��\0�9n��[�pzyw���y��Î�kO��3>#�3331\0�^��`ux��!����p�����~�yncK�1_kJ�up`�o6�һYmZ����?3�+�a�t��p��txka��9�l{ڕ����������_9\"i��M�~bd3���u?oz�;�˴�d���\0������H��gOr#-��\0[V�m�R߀XWo�����-���Sis�%O~���շ��f\'ũx��R��ǉ��d`��W���>#�}��n��v5������r��ՙϛ��ǒv�O�f�˭1��\'�i�x-��=y�<M��#��}M\rK���[[3eŊfff}�ۊ��|~d<\0\0�����;��_���T���o�ɞ=�8�9��X�������f&||�.+�\r�F���/[G�+�\'��d�L�|�$\0\0\0\0\0\0\0\0\0!�Ջ��蟫4�{V9^G�Ԙ��żn���|�#��>c�D2\n��ctw!Ҟ�{E��;:���]1��:��uqRy)���\0��h淈��f��|�\0\0\0�߭��wk�\Z��g6>���j�\05���+?��Z?� ��E8:�����S������<���b�;����8�1DF;�h����ܛͧ��@hoT���ߥ{��=��>��w�;��C����w-����j�cT����ˆ�����5�V��`2@�yoU����ލ��uG��k!�c�g+�\r��<���g\\s��7����K|y�	�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�/��M��M������t�m�����.H��6��pD���LW4�\0��\rq��[���-�I�}�����Ͻ���LV)���ƍ��&���O�ђ��Rl����u)��c�:�0��=�Z���f���j������\0`R_��K�>�{w��9k�CW��Ӷ[L��ۊ�/3�3ofj�3�\0����ַm}���N����gg�o�\Z��L�NLu���_%r奢��\"\"k[G����ǐ�zP���_W�w3���������hq|�t�\\y=�o--����3KG�����G�̓m�+��	۞��rN8��	��i�om\")�����G�̃��A���\0^��N�/���G�jq:�+�~��j����x����Θ�xޚ�5���q:�tu0�<F<8��c�\"���\0� �֯�\0�c����h�\0���S��7r�:��\0;�|�z\\�\0Rp��c�˯�i�ɟ[[Z}��m���մDy�>&�ޠ�~��}�k�����v3�7y\r���͖�>&g,�~���}���|��}W��T�8-���m����E\"qWc�ڸ�{f~�KV��V�&�5��C�O���zi��z6�6�x�����Ԝ���\\9|Ͱ�x��l�ȼ��17��?5��Яn���@��q�c%���7�����ld�,��x��1���j�����~��~����׽�u/�#/�~?�|D�[�孫���Ϗ�A=sz3��<�g��?�\\L�q���/�k�N�x���;T�>1c��c�uk[y�>� ��#��9_Z���>��u�1to[q�W��:kژ��lE|�c>\\շ�Ǔ&k䙚Ƕb���\0<��K���>���\\;��g�ڌ����rq��#�?&����-��œ&oE=�˛%�{���ִ��L�ly���A$�R?W�S��I�z�:3����la��_�o�\Z߼{�u/>b&����1?�����\r���o��t������S���mצx:�8�V���/��߷K�m�%q_���k�Qj}>�ip���}>�յb<}��{.����\0_$����~A=h��x��S\'g8���Jp��\\�1���������x-��ǚ�>t�f�;�bkb+!��]��L���G�y�ggm;�X��g͏�圙�����+k�Z�`���l{��1Z�/i���2���gW[??��\'����]R?����\r��b⭡�K�޿��K���+>���?��v���z�\0<�����k��X�ǖ�3kf���/U�ɒ����ccc^����[�[�����}��.���.7b+���9�����FͿ��sO�\0��\r�\00n��d{w��\0`w���<�ۮo�sC���������+ol�����m�����p�e��={ӝK�i|���L��ok6�V��������\0�u�q;�n73�^������|[|�\'�G\r��L�+|֭f�\"g�O� �z_�=���\\WEw��z�w=�-n/����俏>��I��>\"?\0��\0\0A��v��}\"���q��Wq�-Y���#�Oly�\0ZE�?��\0�!Wһ���^��r���=���c_��u�������i���o��l|Ƿ��c���\0\0I�T��7��7x�n{��x�oS�ϭ\\�}=j�f�}Տ}q�.M�_��������q����:��Ob�s�L���&\"��d��瘘�ݚ��k��?��+[�_ۮ�v��<�8+צz���x������e��œV��[�8�kS%k��Z�_��@H��i{�E����CcKt�����l���=G���\Z�v�+M�X�N*`���3jx�Jy���b�e \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\rS�{��W���}��ގ;sj1�q�Rm~;��o~��1?��13K�\"c�<�w�������.G�:�j4z�����Sw������s`�Ŗ�-1j^&}�����L@^�����ǨM};�n�pѧ�[.~;.�b+���{}��R���-[V>=���1ߩ���;��d�޺���c�m��o�\0�(���~w����ֶnG�;��Z9�\"}�/��6�,S3�W�6����<�> �A�o��\0}�}@z��>�Ѽ���Z8����8�l���q���FL��I��>sZ�����.���S�E���1������\"���k^���ϊNo���\0pZ��.g���ݾZ/4��櫊�\"|e��Z���u�\nF�o�W�s�C��Y0NM~/77��<�?�k�͎��\0�i�?��B ���v�,~�:?������l�����i��D��|��_� ��O�:���%�tgk�&n��н���y�a�ⸯm#׶o��~�\0��S�I��kf�@\\�c~����?��<o9��#�9�Q7��:�J�_��h�>�{��c�?m|L�y�kL��d=��|z<�N�]NK��=�e�&���w�N\\6��-X��R���h�� ��\0P]���?Rg�n��~��>��νqa�}�Կ�6&�☫������Z��|7��e�d\'O��|�T�c�{}�h�n�嵲h���ŋk\r�Տ}�1˃.I��_v[�b\"|@X�#�}����\0��;��O���L���ۭ�l�խb<������TG�Jߨ�sv�g<~������V#϶���/���k���}R�o�X���4�V�������SW_\'��ϛb��?�8�Z��.�oEݩ��8�8�KDW�����\'�w�O��ϐo�g���8}�s������l�{�\0��f֟�DH<��;��FϨ�����-�me��;6��6��e��8���5�/�<y�=x��=�5	I��ϫ�n����w���\ZՊ����g��Ǿ������H�3h�������>�>�;u�Z��[����c�[n�g1�g����v�c�3��-�����߷�[�>�`�b�t�b\"m��r�����>0g�8���\0[�\0�ww�\\7p����O�z�8�s�����پL6�gۜ�l8q��x��Wţ�L�\0�\"��}9u�Qw�}�뎮�˭�s�5����-}��{��\'��/?�#��@\"7֋�r򾙺s��V&�W�NY����������������yz��x}9�i~����g�q�:�6>��55�kg�j�+\\~�;Z�g�&���M�F�\0<�w�g�};����2a�՜�Lw���[ne�����z*�����������c����+Z�4�DDD~\" \0R7����V��š�?�[[|1��r6���s⮆\rl3������r�M�\0�7�o�t�hΎ�7���ɳ�<j��~�<�q����n__�>\'&9�+�oY���՟�5�}�7���?��ӝ���?��L���-��^��ӓY�\\y\'ǉ���Ǐl�Ą������GPz���mw�D��G�|���8l�uo�����l��{lq��b��r�\'����P��WW��\0�;��������9�3���wg�ԝ���w�Qx�ϳߋ�x���#�o��\0�N\'�}2rZܗѼ9}<�rN��S��+1KSSj2��o��Mo��tO�m�wWտAuL���ܞ�����6����x�c���aǗc$��kx������<O�1!��Y>��#���o���.CK����uV��7w3�~��;<U�x���ݳM��}����v���^_�=����g�\rޞ�9l��\\Q�r����J~�y�6�m~#�\0�_Zݜ���Zv��/^jd�<|�k��ŧ�Sz�\0���XË/����LT��t��6�L���|y��>&c��Au�\0\0*O��ͽS�W�~��ӽC���]q���*nb��ǵ��h�jཫXɟW/��x��O�_��[&�lF��maŋ<a�dǋ�����\0H��?{:�۸/����>�ǖ�j�?�\'�A�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0���W�s~��~������?o�x���><�����<�t�Mu���V8�B�_��9z����:�~b�Ŋ�u���\\T���0c�|z�i��)>�Z��t7E��n:;��.��q��\'��CGZ��b�X�y�ͭ><���i���32_RpoUt�)���͡�ig���1�/�-&���\0�m0;���y����Ov���א�t:Rvk�֗�3l��g�G�~�Ǚ�3�f~|�羡���\0�ҿV�����Q�|7��o�mE�{��c��D�\0\\u���OFޘ0��Ǩ��ohW&�#�Ο	i���<\\S�����.Z�����c�����w��Yݔ�|�ǥ�\\&��?r����KG�ϋl��\'���w�ǶAg�Rޣ�M�&�^�Z>���?����c��?�Z��\0/��K��T������ˎ/^���n??�˻�����i������Z[���v۶�\r;���6yj቟}pa�8���M�\"#������|�:��?T�s�>?�Z>�����M��?���\0��[H\0��8��N�d�8?�m��و������_�j��?���g�1�)c�7ܾW�<w۬�k[������~����������\0H����B��GW�]��Q�N�\r��y�����x�\"#�ϟ�>m�\r����3���ٹ�ygݷNr<�/K޶����﵏�>#��um1i��Z�\0?��^�\0�OV�uz���}7�j���lZZx���>�ۧ�Z+>f}�������X�\0ӻF�w���k�$^o�d��#�ɳ�$G���?���>�}/L]����8�`�>�Ɏ��x���\0��=$vc���׮�i����\\��.B�ϭ�lk��<u�)\\��W-+8}�i��\0t�+�ki���.��&^��������\0��{�����y������1 �z_���^��[vǪ���vˆ0��^�٤ұ�\0g�{�y����ҋ��>����p����;v��e��]�}�_l�ӛNּ��\0�3���G�����#ͽ��:�~|�l`���5�8�t�8�-~;C0kj�8�+Lu���?�\"\">�]\'n��S�\\0N]�/�-��y�F����\0������\r+�l�6�S�K��֮���E�_wV�ۭ�m�m��{���\0��o\'ǻ�h�O5����\0����d���\\nx��t�����ls3�v���y�\0�G�~�����@�i�\0��7�ň\0\0E���D�4�{�y>���I����;v�./�ɱ�60�Ǔg����{bǛ�Em>ؼy����r�1{�]�uw�\\vo�b�n��Kf��\0��������16���1��r�����M>�q��|�_s���5�D��z��|�|ǉ�x����]G�_���ћ���Ru/Yi�\0i��Mnk��x|�ڻ�מBmX��G�����L@i��\0���禜\Z�;���T͹�}�kq�nm֦̔\\Xm�\'�=�����i����+�~c�I���7~\'�=+���%�>�Stn<���h�nO������������������ke��q]����b�8�\Z�rZ�\0>3SR/������u=CտL>s�y����S�t�Ƶm�����TS��^�K_V�8i_tV+1ZǙ�\0`O�;�����Fi:��[a�G��&#��?���pW�ֻO%�:tg\'��`�\\Z���|��hnMf<O�?����ǐF/���\0?T�\0�?��\0��\0\0t�c��/Is|���w{C�������92��LV�1ґ6��33�\0���5���F�c9.6��+��c�������6��ˡ���v��\"�#�j�ֵ�>-x��N��~3��K��s���n��;\'&Y��q��y�����3���;�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0u]S{��c&;�o]\r���|LLc���>��.nk��֛�;9�~�����1i�\\���+g�x��V<G�G�1���@D���^���u/R����O���ͳ�׷݋r�o�Rԧ�3H�,�|~=Ԉ��-����;�����\0W李��\'@���]:g�u��3lZڶ��L_&\\z��<Ž�7��L��������R����vÓ\'O�y�q���r�˷Y���zD��Z�\0O\0���k�}����<?3�o������<G���*��X�����o�y�?���B����U�}��s�4�ng{��[�-������������N,U����\"&f<��\"��]n���f\'��]I��V|�y�ծI�\0ڠJ\n����]+��;]��51ORj��;�;��,�1W\r-�|�}�Y�<ǈ��?� ��\rr�W��.\na�վ�rx��H��R<�\0�[\'��_�B׀�a��/=��xKd��鮙�+O3�d��31?3�??����:>�]1�q�Q��������t�At��Ǉ��]�n��-���ֶ�bq���o���}a�lrݟ��ޢ�}�M^�����D�\r�����|�oZf���LE�|ǐFϧ�q�1ٯVZ}y����8�j����ɱ��ɯLV���3|�_����y��i��W{;U��\'k��W[hu��Z�ڝo}o���Z��ⷧ���<�y��3�Stx��>��:��Z�59���c�\\��zd���W\'���frW�3�/����\r�ϧ�ﴸvi콺o_,G��5������[D�\0�g����]�ꎁ��\\x:��������Ei����f?��py�������\0R]�n��W�+\\٢�u��jm�k��q�ٯ�f\"��k_>�D��9�lb�|i�J��zZ&��ǘ�����?`�=Y�Vm�^�`�N���<W����m��F#.l���W[;{��&����KR�)����ݤ?�]��OQݰ����ͬ��yv<��Z�ilR|d�����޾b~&bkj�&b�2_Yt��=!�tW9��q�A���{���������[�)�җV���\'q����˧�:K��Ϻ��LӋ���t9�bq�2ұ���1_���\0s{���_�}]�w��o�ş.>��M�l;V�km}+�罫j�Lڴ��5�>ٽ\"-�=�����t�\0Q�q��Lu>�����./�S)ŏk6�8��h��\0���9#���P\0S���\0�G���z��WS[�\0��K���񜆦9�ɖv�9-�����FJ��o|�J��|Z|Ҳ��ӣ�]+��:��}�ӯ\'�0���t^֞=�q��2�7&/�|E�c�\0�:s���s[��\'�=��}=L;�\0G���k�eˊ�>\'&\Z�cˋ�ֱ����3_!\'�\'�V뮇�{���۽����d�;�v�	�ɗ�̓/;i�-|��q�������Zh+��u��~����9��i�nib����ɵ\\?��l���=�v\\Qjy�㭯�|V�1�\"_O}4{��m�s|wWw��t�90l�\r�[a�|E�捬w������ꏧ���K�-��\0u�Tq���w�M�,X�m�k�5���K晊�&����!�u?���kt�7\r���IԮ1��;�6?1�z��pRc�L{�X���v�V�q|f�\\��50c���6��+����,K�)�W�wx�|�5:�GcR&f�\Z��kLG����\0H��>��^����I�q�>>��+��\Z�[�/1��o���L��\Z�1���R\"=�o!s\0\0{�G�v>��e�:K��#K�����\'��&����c���1�\Z�)�M�c���0\r+������u7U�w��u�x����O�=�v�󿵆�\0��`�Kkc�35��۵<E�B��{��W���������\r+��&����&������}�l5�Y�Z=�oo��ǐs;M�n���9|�����6+���<��]�;Z�|vɃ5koe�1j^<��?3\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�}R�U:#�ot:��=���.R�g�G��ֽqG���j���\0����ƿLwk��O�9\r�#��i������D�\0��?1���\0E�\0U�m�/Ur�9��~WgK������_�3MY�l�3}ȵrS�b�x�otd����=��I座��F:Ǫ�.�����7:�.�8x�^��2Sg<�4�Ŷ3�ja�Jֱ\\qot��LP.��\0��;�~����q9��=i�����o`�˞����ɇ[Gߚ�S5f��^gǊϙ���ꯂﾎ�Uv�y��\'�t��5�m��jb���o�V��J}Ȟ?Gb�k-홉���O�j���/o��`�=���R��[>�Fjţ���,~?�|��aꟿ������\Z�Q]nKOC>��=���:��4�9��􈌗��\"\"���b��,���OFw߽=U�^���#��\\�\r���uzK���gSNذ�:�k>,v�X�X��VԽkoo�|����\0K?R���7���)�U�r�m��W������࿻��3��X��.]�1>\"+Y�6���\0{�}�߬�Z���v7\'8�o�-��ѱ}lxugoZ�+5�/t��b><̂i})}M���{u��<��G-��Gԛ\\�#|v]����p�&L�3o�U�O��33?�y�j�o3�n��~7�����y,��	��8�w69���o[�x����\\w����Y��螅�o����L��?���-�n����żǺ��T�������|������O����7��ljr+�%�r\Z��ؾ3�L^�F;L��k{m�gǐZ��g�z[[�����Bu�R�\r��������+K[{_$��q���X�����������A�������:�\0����e����]�]jrTݶ^Sn[8�ђ�p���嵯j�\"&}����\0u�)��O�5gCS�w9����\r>�,����H�����ly��D|�\0 ���~����wl�c�{���?K����nin�����ҵ��o����\0o���\0��H~��s�|�v��jpܗHl�������ٮ�2��i����bԵ\'ߊ���\0������b���z��nw�.�zw�v/�\\V�c���2���<�\"�ضI��}��?h��^z��Β����Ω��r�G�_��nG<S��SJ�/>+���~f\"���<Z�8��Q��~��?k��\r�nO�r�d����-�Sgrk1{��\0��9->=���kI\n#���?�}��{����n7Q�D��ฌ?[�ޘ����q}���{���͒��&�%��$��/�]{�oQ<izS������G>�R�Y�RcC\"��z�j�q�׏����\"��DV-��,}Z�S�]���\0p:f��z[�|n*��X�97�2a�\\v��3�[4[�f������,s�7u�Azk�sor�:�����u<�������o?3�N<�o��KD�A������>�:���N��~����y��O���ka���f�+^�)jL����ˎ�i�bff|6���.���]���o	��M�[g��yHŵ1��W��qoh��6�\0~?��|y{��w��vN����y�c��)��^u�y��SX��?�+���_t[�������w����{qҝ��^��x��sr�K���˗,����qbͳ���-�3jǛDL�����Eݽ�{O�]��^ocgf�����[�\'o%��qc�+�ִ�DVk3��]�>�q���M�K��Jb�5�NLy5/�ly�e���w�Z�ܸ�_��1bf&�\0\0\0\0\0\0��\nq<V�+���Z�6-_}i�Vm1��c������AU��գ��-����L�|ە���3.���մm�9��oK^��[����b+5���0������wFW�]qѝ3�h�9,��>/o���\\���g6|���ݷ���}�3����>�:��]G۽Ψ�	�ߠ�9��ɓc7�]�������8�m�����d����[��\0Y>��﹫н��������y,����sF�u�������\0,�\0�����~�]U�7�|wA��m5zoG�ɛO����l�a��ǂ���L�1Z1c��b�c�폐O^o��k�����u8�3��}��ͼ�Ň_\r#ͯ{�b+X����Fw�\\��T�\\�Id��f��ף�i����0���Mޤ��?�|�e�KDN[����T�ڞ���f�s����I��sJ�Zշ�}�|�-�\"\"o{ͯi��k��e��/W�z���m�Y����r\\N�7����8�m��5��q��z�Z�����\\y1}�s3��\0vy.�z��>3���;}m��t�����ܗ��5�KVc�|����`�ǟ�3�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�k[b�q��Ŗ�o��Z^-4��>-��??�z�U�Qv���>��s����s�s��x�اg[C�L:�kZ#L�1�Ϗu醹o4�x���Pv�c��pۻ�����_���b�I����kS���MZ[��\0�����g�>�ۺ9�����}�]]nKK_C�-��ũ�,Lޞ��;M|�/��>bC;��_�} m�<�F��y����=}�NGc\rt&ԴMsW<u����i��V����$�!G�\'�e�So��\0q�_kRt��N/>��,�GRol��sd�\\S���?>�ݘ��<�\r�J�SY�uxn���#��.����.��sa��5�W[k����Ӓ~&Ո�>d.Ê�4�^3O��F-]\r|z�1��qұZ��� \Z���Ύ�9����u�!����y���g��Jgś�Ԙ��՘��15����`\"�\0���p��Z�����hŞ�\'�Of��Z䶖���?c������C돣�\r�:�:/\'���Z�ͷ<��\Zb��k���l���-����3��1I�?5�Z)\\u�<u�ֱZ�x���\0���T�==V�Kջ����9>�����W�������n����<~Lx��%)j�׶|���Y���*����Ϫn�Gny=��u�Nh�=E����\\�N�k������3��͎1��)j�b|ͭ_oω�z��!ۏXY�._������g������㩆�ˇ%�i�Z^�6��fk���﷟>~\'�}\r�l��o�=�����Ҕ��\"�t�?��?���\0J/�\0r�\0|�_Ӈ_җQuS���巹���m��5um�.\\�/M�yϒ�q�\r����\0�O��� \Zw�z�7��;Ꟛ�O[����z~�[��\\�ݥ�kD��1>\'�h���\0�}o�Z�����+����z�og%����F�l�-�kZ�L��M�~mo���y��u��޸�_��#�v��\\^�få�XcX�h�N;���y���c�����,/����h����ק�����>�Ʒ#�:�xtpL��ŗ��i�~�H���ۚ>g�\r��~�v��GBߡ{���\\8�1�q�������1��y�����G����kj�մLL�*��HOR�\'�<�Uvǜ莴֦\\�:ږ��G>Y���~�>9Ԭx����d~\"+\0�ݴ�ׯΜ����Y=Bt$`�k���N�[O�5��3cץ#�������<l�J~�w���no��[�m�}�c���kk_s�-�����������m�֬[�c���N�H?O���L�nsO-����q���E��\\v�I��z�|�����}ֽ�o+��~�v�\0��~w�<7H�S�������?U�L4�1�ן�lW#�\"}�31�8#���M{���;���z�3ug�3�і��6�y�`��b+�q_%\"m1X��6���N�;��;Y�+{��E�OO���z;�q~�C����N>���\'ޭ9b�5�e�[���S��HX�N^��uלwqy�s}5�hqX����V�z�Ï.L��R֬��s_ϋx������G}���7Ԧ�D����u��ۧ��`��3��՝\r�fzs�gQq\Z��n���.��־}��jo��u�&\'�S�ǐl>��euWt�Ot^����_�錵����o�pq��j�5��[c����X�Er^ֵ}֘�6��a�o���zڝ���I��\\�NΟ!�p9�mirb�ߦZo�o����o�1����	��^�q=��Mvτ�˳�Ӝv-���\0Y�z�����?�%�׷����\0\0\0\0\0\0\'[���^t_?�ܮ�޾�Qq{\\N�mL�o><[�����V�1>\'���W���-�����b�3�)��Œ��h�X�� >O��9�i��դ��kn��LG�?��3�� ���M��~OK�9_Ty�Ǘ�_���J��.+�&��6�2S\r���>\'�����s�H���팜��~�ϗ�ܞO��3l[[��us��Q�m�bg�<DDǈ�_җ������:�o�3�:=?��m3�O\r�M�WnO,_k4}�֬k�)Z�+3o!�~����c��{%�]���~J���nR�ǥ���ν>�\\��&��+d�\'Z���H�����T$��_I����ܾ�t�=��u��;�CI�!�^-k�[b�D�{Mojx��LQ��`h\0k��v�����NcC������q������v2jZq[��7�Y�W�1j�����P�N������r�8��#����m��;S:�6:�5���u�_����-�Y�6��_w�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����鮋纋�ж���l����lӟ6<V�1���[��Dx�K^|�Dψ�Iw���y9.�t�p��gwf:c�\"�܎��%��y+�[b����kl8�[x�\0�&<�����+�7��L�ԿX�n�H�FJ�V����L�g&�x�<Տ���m|qO��m�k��s]��?������4G��ZXx�,�^i�b����mi�6����332�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�p{S�~��iq����5�ݘ������4k���~�<���&~c�?�+\0\0k/S�����3�=���[����Z�2S��׍x���+�,噴�x�>A��.���gb:g���8mި�ŵ}��h�m�s}��Y�~J��\"m>=ӎ��\"+X\r�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?��','image/jpeg','2013-11-13 00:00:00','A');
/*!40000 ALTER TABLE `paciente_foto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pais` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(45) NOT NULL,
  `Estatus` char(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Guatemala','A'),(2,'USA','A');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Tipo_Producto` int(11) NOT NULL,
  `Categoria` int(11) NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Descripcion` text,
  `Observacion` text,
  `FechaRegistro` datetime DEFAULT NULL,
  `Precio` decimal(18,2) DEFAULT NULL,
  `Estatus` char(1) NOT NULL,
  PRIMARY KEY (`Corporacion`,`Id`),
  KEY `fk_MEDICAMENTO_TIPO_MEDICAMENTO1_idx` (`Corporacion`,`Tipo_Producto`),
  KEY `fk_MEDICAMENTO_CORPORACION1_idx` (`Corporacion`),
  KEY `fk_PRODUCTO_CATEGORIA1_idx` (`Corporacion`,`Categoria`),
  CONSTRAINT `fk_MEDICAMENTO_CORPORACION1` FOREIGN KEY (`Corporacion`) REFERENCES `corporacion` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_MEDICAMENTO_TIPO_MEDICAMENTO1` FOREIGN KEY (`Corporacion`, `Tipo_Producto`) REFERENCES `tipo_ producto` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUCTO_CATEGORIA1` FOREIGN KEY (`Corporacion`, `Categoria`) REFERENCES `categoria` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_foto`
--

DROP TABLE IF EXISTS `producto_foto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto_foto` (
  `Corporacion` int(11) NOT NULL,
  `Producto` int(11) NOT NULL,
  `Item` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Foto` blob,
  `TipoFoto` varchar(45) DEFAULT NULL,
  `Estatus` char(1) NOT NULL,
  PRIMARY KEY (`Corporacion`,`Producto`,`Item`),
  KEY `fk_PRODUCTO_FOTO_PRODUCTO1_idx` (`Corporacion`,`Producto`),
  CONSTRAINT `fk_PRODUCTO_FOTO_PRODUCTO1` FOREIGN KEY (`Corporacion`, `Producto`) REFERENCES `producto` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_foto`
--

LOCK TABLES `producto_foto` WRITE;
/*!40000 ALTER TABLE `producto_foto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto_foto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `Direccion` text,
  `Nit` varchar(20) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Celucar` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Corporacion`,`Id`),
  KEY `fk_PROVEEDOR_CORPORACION1_idx` (`Corporacion`),
  CONSTRAINT `fk_PROVEEDOR_CORPORACION1` FOREIGN KEY (`Corporacion`) REFERENCES `corporacion` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor_contacto`
--

DROP TABLE IF EXISTS `proveedor_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor_contacto` (
  `Corporacion` int(11) NOT NULL,
  `Proveedor` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Direccion` text,
  `Telefono` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Corporacion`,`Proveedor`,`Id`),
  KEY `fk_PROVEEDOR_CONTACTO_PROVEEDOR1_idx` (`Corporacion`,`Proveedor`),
  CONSTRAINT `fk_PROVEEDOR_CONTACTO_PROVEEDOR1` FOREIGN KEY (`Corporacion`, `Proveedor`) REFERENCES `proveedor` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor_contacto`
--

LOCK TABLES `proveedor_contacto` WRITE;
/*!40000 ALTER TABLE `proveedor_contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor_contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta`
--

DROP TABLE IF EXISTS `receta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receta` (
  `Corporacion` int(11) NOT NULL,
  `Hospital` int(11) NOT NULL,
  `Consulta_Medica` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  `Producto` int(11) DEFAULT NULL,
  `Descripcion` text,
  `Estatus` char(1) DEFAULT NULL,
  PRIMARY KEY (`Corporacion`,`Id`,`Consulta_Medica`,`Hospital`),
  KEY `fk_RECETA_PRODUCTO1_idx` (`Corporacion`,`Producto`),
  KEY `fk_RECETA_CONSULTA_MEDICA1_idx` (`Corporacion`,`Hospital`,`Consulta_Medica`),
  CONSTRAINT `fk_RECETA_CONSULTA_MEDICA1` FOREIGN KEY (`Corporacion`, `Hospital`, `Consulta_Medica`) REFERENCES `consulta_medica` (`Corporacion`, `Hospital`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RECETA_CONSULTA_MEDICA2` FOREIGN KEY (`Corporacion`, `Hospital`, `Consulta_Medica`) REFERENCES `consulta_medica` (`Corporacion`, `Hospital`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_RECETA_PRODUCTO1` FOREIGN KEY (`Corporacion`, `Producto`) REFERENCES `producto` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta`
--

LOCK TABLES `receta` WRITE;
/*!40000 ALTER TABLE `receta` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sintoma`
--

DROP TABLE IF EXISTS `sintoma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sintoma` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(150) DEFAULT NULL,
  `Observacion` text,
  `Estatus` char(1) DEFAULT NULL,
  PRIMARY KEY (`Corporacion`,`Id`),
  KEY `fk_SINTOMA_CORPORACION1_idx` (`Corporacion`),
  CONSTRAINT `fk_SINTOMA_CORPORACION1` FOREIGN KEY (`Corporacion`) REFERENCES `corporacion` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sintoma`
--

LOCK TABLES `sintoma` WRITE;
/*!40000 ALTER TABLE `sintoma` DISABLE KEYS */;
INSERT INTO `sintoma` VALUES (1,1,'asf','asdfasdf','A'),(1,2,'asdf','asf','A');
/*!40000 ALTER TABLE `sintoma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_ producto`
--

DROP TABLE IF EXISTS `tipo_ producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_ producto` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(150) NOT NULL,
  `Observacion` text,
  `Estatus` char(1) NOT NULL,
  PRIMARY KEY (`Corporacion`,`Id`),
  KEY `fk_TIPO_MEDICAMENTO_CORPORACION1_idx` (`Corporacion`),
  CONSTRAINT `fk_TIPO_MEDICAMENTO_CORPORACION1` FOREIGN KEY (`Corporacion`) REFERENCES `corporacion` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_ producto`
--

LOCK TABLES `tipo_ producto` WRITE;
/*!40000 ALTER TABLE `tipo_ producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_ producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_consulta_medica`
--

DROP TABLE IF EXISTS `tipo_consulta_medica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_consulta_medica` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Nombre` varchar(150) DEFAULT NULL,
  `Descripcion` text,
  `Estatus` char(1) DEFAULT NULL,
  PRIMARY KEY (`Corporacion`,`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_consulta_medica`
--

LOCK TABLES `tipo_consulta_medica` WRITE;
/*!40000 ALTER TABLE `tipo_consulta_medica` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_consulta_medica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traslado_d`
--

DROP TABLE IF EXISTS `traslado_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traslado_d` (
  `Corporacion` int(11) NOT NULL,
  `Traslado_h` int(11) NOT NULL,
  `Producto` int(11) NOT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio` decimal(18,2) DEFAULT NULL,
  `Total` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`Corporacion`,`Traslado_h`,`Producto`),
  KEY `fk_TRASLADO_D_TRASLADO_H1_idx` (`Corporacion`,`Traslado_h`),
  KEY `fk_TRASLADO_D_PRODUCTO1_idx` (`Corporacion`,`Producto`),
  CONSTRAINT `fk_TRASLADO_D_PRODUCTO1` FOREIGN KEY (`Corporacion`, `Producto`) REFERENCES `producto` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TRASLADO_D_TRASLADO_H1` FOREIGN KEY (`Corporacion`, `Traslado_h`) REFERENCES `traslado_h` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traslado_d`
--

LOCK TABLES `traslado_d` WRITE;
/*!40000 ALTER TABLE `traslado_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `traslado_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `traslado_h`
--

DROP TABLE IF EXISTS `traslado_h`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `traslado_h` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Usuario` int(11) NOT NULL,
  `Origen` int(11) NOT NULL,
  `Destino` int(11) NOT NULL,
  `Descripcion` text,
  `Estatus` char(1) DEFAULT NULL,
  PRIMARY KEY (`Corporacion`,`Id`),
  KEY `fk_TRASLADO_H_USUARIO1_idx` (`Corporacion`,`Usuario`),
  CONSTRAINT `fk_TRASLADO_H_USUARIO1` FOREIGN KEY (`Corporacion`, `Usuario`) REFERENCES `usuario` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traslado_h`
--

LOCK TABLES `traslado_h` WRITE;
/*!40000 ALTER TABLE `traslado_h` DISABLE KEYS */;
/*!40000 ALTER TABLE `traslado_h` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Clave` varchar(75) DEFAULT NULL,
  `Estatus` char(1) NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Imagen` varchar(150) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Direccion` text,
  PRIMARY KEY (`Corporacion`,`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'solis.mario91@gmail.com','msolis','A','Wario Solis','user_1.jpg','123','123'),(1,2,'msolis_91@gmail.com','12345','A','Mario Solis',NULL,'123',''),(1,3,'info@gmail.com','','A','info',NULL,'123','123');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_d`
--

DROP TABLE IF EXISTS `venta_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_d` (
  `Corporacion` int(11) NOT NULL,
  `Venta_h` int(11) NOT NULL,
  `Producto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio` decimal(18,2) NOT NULL,
  `Total` decimal(18,2) NOT NULL,
  PRIMARY KEY (`Corporacion`,`Venta_h`,`Producto`),
  KEY `fk_VENTA_D_VENTA_H1_idx` (`Corporacion`,`Venta_h`),
  CONSTRAINT `fk_VENTA_D_VENTA_H1` FOREIGN KEY (`Corporacion`, `Venta_h`) REFERENCES `venta_h` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_d`
--

LOCK TABLES `venta_d` WRITE;
/*!40000 ALTER TABLE `venta_d` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_d` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_h`
--

DROP TABLE IF EXISTS `venta_h`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_h` (
  `Corporacion` int(11) NOT NULL,
  `Id` int(11) NOT NULL,
  `Cliente` int(11) NOT NULL,
  `Serie` char(3) NOT NULL,
  `Numero` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `Usuario` int(11) NOT NULL,
  `Estatus` char(1) NOT NULL,
  PRIMARY KEY (`Corporacion`,`Id`),
  KEY `fk_VENTA_H_CLIENTE1_idx` (`Corporacion`,`Cliente`),
  KEY `fk_VENTA_H_USUARIO1_idx` (`Corporacion`,`Usuario`),
  CONSTRAINT `fk_VENTA_H_CLIENTE1` FOREIGN KEY (`Corporacion`, `Cliente`) REFERENCES `cliente` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_VENTA_H_USUARIO1` FOREIGN KEY (`Corporacion`, `Usuario`) REFERENCES `usuario` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_h`
--

LOCK TABLES `venta_h` WRITE;
/*!40000 ALTER TABLE `venta_h` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_h` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-14 21:14:34

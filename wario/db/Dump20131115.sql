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
  KEY `fk_CONSULTA_MEDICA_TIPO_CONSULTA_MEDICA1_idx` (`Corporacion`,`Tipo_Consulta`),
  CONSTRAINT `fk_CONSULTA_MEDICA_TIPO_CONSULTA_MEDICA1` FOREIGN KEY (`Corporacion`, `Tipo_Consulta`) REFERENCES `tipo_consulta_medica` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
  `FechaNacimiento` date NOT NULL,
  `Genero` varchar(45) DEFAULT NULL,
  `Estado_Civil` char(1) DEFAULT NULL,
  `Imagen` blob,
  `Estatus` char(1) NOT NULL,
  `Correo` varchar(150) DEFAULT NULL,
  `Telefono` varchar(25) DEFAULT NULL,
  `Usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`Corporacion`,`Id`),
  KEY `fk_MEDICO_CORPORACION1_idx` (`Corporacion`),
  KEY `fk_MEDICO_PAIS1_idx` (`Nacionalidad`),
  KEY `fk_MEDICO_GENERO1_idx` (`Corporacion`,`Genero`),
  KEY `fk_MEDICO_DEPARTAMENTO1_idx` (`Pais`,`Depto`),
  KEY `fk_MEDICO_USUARIO1_idx` (`Corporacion`,`Usuario`),
  CONSTRAINT `fk_MEDICO_USUARIO1` FOREIGN KEY (`Corporacion`, `Usuario`) REFERENCES `usuario` (`Corporacion`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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
INSERT INTO `medico` VALUES (1,1,'asdf','asdf',1,1,1,'2013-11-15 00:00:00','2013-10-30','1','1',NULL,'A','solis.mario91@gmail.com','123123',1),(1,2,'Mario Solis','1',1,1,1,'2013-11-15 00:00:00','2013-11-01','1','1','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	( %!1\"%)+...383,7(-.+\n\n\n\r\Z,$ $,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,ÿÀ\0\0¯!\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0:\0\0\0\0\0!1A\"Qaq2B‘¡R±ÁÑğá#bñ$’r‚ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0 \0\0\0\0\0\0\0\0!1AQqaÿÚ\0\0\0?\0îÂ0„\"-\'L d“¤) IÂ`Š\"œ$Oñ(ç2èÆüGöMyXüSÄØl<‡TÃåeÏ¿EæÜoÆ8œK‹Xr3ğ´À®:®gC`æu¦4ï}Ön__^ƒÅ©.(Ó»¤Ÿ \\Æ/ÆXÊ³şë½Ëô…Ï¹ıIõú¢Ã1Ç@c­¿9Pmà15«]ï©$Ÿ¹W1qO6_;”bë\\Àõî¹Êm:4é6ºµ†{,“­İ-\'¤ìV,ïmKÓXq\nÂj8Üß±…v‡‰ëµ¶¨ğïùBÁcäüE²`e3ÿ\0µÔls‰ÊMô\ZOùVDÛºÃøÎ»bK\\ ]Â5ô+sãJo1…³¸¸^}B”0»…íê¦ÃS$-ÎÖ ˜êA*òG®áq´ê	cƒ½\rşŠr¼ŸÄHÎgf	°š.†øª¨#8ÎÓé?_İk—ê;dÊ¶N³e†ûƒ¨õ\nÒÒ„ \"N™I$•š$ hDĞš´*T‘Btà¢€P(¥¡”¥(J)A(á H“.OÇ^#òåR?î;R>Qû¥ºSx»ÆMÃ‡S£©v­gîW‘â¸“ò÷8—Îò–3ç˜¾úÄOÕUe	÷ÖÛJÏõ‚¦âdÜ“¹R=±\ZI™Ş>Ğ…“ ±Ú4î¦§H‹¼Ä\0ádluPF‘ê\'Ú•3¼¼ÚŸ[@ô±TÙQ³.°ëÜŞĞ®ÑªÒ27”Ëtp=Ümè• (SµâÛP§¦ GBu\'C§(UëÖ´f\ZAÖ•>ËËikiĞ&;©a°ùMmåÑİ¤Ş6Er•R\081×d¦ú\n«é4“ÌãÑ Dî€>’•<)?RMû8Âh•z¥rò	¨\0h\0	ßÿ\0 “Öğ®Ôˆ\raÌã¯Ä/\ZÄ,±Båæ#b\0×±:ğ¬Ñ Xè‰iŞAN&Ö°,c×^¦+XjĞâ	hˆm‰:tS¤eù›Ê@€@±Âßeq 8‡Ô€ÙŞIfû‹¦“m*Xß,‡]¦Ç0\"};•Ûğ&ÚÍÛ¶½FÅyíP5Z32=41¥Ä­.ò$¿.PZÆé˜›ë§ı¬Ì¬iè)–â©Ë<Ñ?à÷Z!v—l™(I$\n„’@“$’š„\"jI2tà¢0DS‚ŠSH2Y“¤³& Ìñj.|ŒÑ\rr¼GˆãÜç8Ì’L÷Úë¥ş¡qÁV¶VºÌ° ş§ò\\-g>¿Ïªçî¯£Nc}4·^Óªè›úz+¸§¶Ñ\Z»í¬~J³ˆxşuV]–hT«vÚ#~¿öµ8=úkˆÓ XÖuÏË1~ãİNÜAe@úa¼y†½ÿ\0…K?ï]Ã°à\0Xß‡$“´Ñ>¡gâxKsf£·ÍL™›²ã¦“²Â©ÅQÌx8Îf&¶‹G‹¦ZãV“ImÆPZNº¦§ê¸ñÏöŞñ¡­Ãœ\0¥¹‰øCæl@\"gî¡­‚ªĞ^ğ@\0Éçâ9Il`¸èÊİš˜=ĞO-¦Âñs)¸Ş*³¦“€Êâ/w\ZeíºÔË-öÍ‘˜0N °fÍc\0€\\sH#¼”°”ƒÙ#Î‚C\\öC¯~bÛBµªpÑI¥õ*´ºXØkZÒÌÃçi\"öéc±€/iv„4D‹	®pp24]7¿LzS¡!¤±¤8D4óhæ/6ÓE%(-9¼Öh&O5´RĞk\ZØy:òHpĞuµ•ºt²Áæœ§œ‡|DjÙåmmÕ¥M‚Â<²-|¥Å£`á\nØw†f™ÒXÙ&d™­°x2iMõ€¹ ~\"\']neÒy\\ÛŒ®ĞĞ}à-i £@–\nPNO¦†ãî‡AÅ ’uƒ ^Ù½Vƒ+	s&7™\'{^àwQbkµµIÂ:Ëz…‹Úß§ñ€\rƒHƒ8H&æë°ÂT%£0æİr\\-™\0’ÒÙ6˜ë%tXz„TÔåvÇå;¬c–®šöÒ	á4$»!á(L’	Bd8š\"j	!$É ¢TO(B$	$’@–G‰ñŞF­MiÔØ-uÄU1™p­fï|û4Oì¥E‹ÅLwıÔÔLe.{F~kêØ›,ú¦ÿ\0²‰Çù*ie[Çb\Zê„·H»Xj~ª ÛşÊÎ‡f´½ƒ±Rq\ZÌ!–2!Òƒ]x	²ÌºélÜÚ\ZFùf¹Ôj­å;ïxp·ÈªõëµÏ.hV†‹_b]ş¦ öÈ—	Ë¨.cªµEÄ¬NäŸ[Ûì­²£€&í\'å\0åst±“t©SnpHDDLöÒŒ~@ÒLË@±mõ´w½ÔÙ¥kR\rpæ0AlØ’3htêk`üÆÅ \\3	\"ÙaÀ°	ê–\\çÃe©šÌp—4˜q˜\"LÌk¡Z8luj-ÌÁ\r! ÃL0´ò†—¦dƒ\0×X½ŞšÖ½·1x6ÑÃ´;.5®iÊH}S#Ÿwræ&#E‘Äñub.\0ÅÜÌ¤‘9Z$¢¡Z½Z’j¹îo™ç^Ge-ÌHb(q5s·™î†èÊcœHË}õ%\\eÙºlšSP5„@c\\r˜sš1:Ø6lBÔÃÒ›L\\\rúˆv¾¡rÜ/‰–5Ñ\rÓòà@\r$‰dNŠï\rÇ<¿›(–\Zòç	Ô€	pêé®,WNi9å¹ƒ\\ÑnPàOlÀ}”Õ°%Ç˜¹²! ¯KõY>cÚç5®©P¸Üîk[è9‡Ú\"Æ\0ÖªXêY™òµÕ)´@<÷4ÒËl2_EÌ$¸êö–¸p‡Ñ{Èa9A	®°¬bpB¡‚èÎi*æØ“¹ím•gá)ä-—8æåÎË´»O²çZ&.KH~{´Ú$Ã¬w·ºİ¬]æiÍÍ±ÊFÇo¢Â¡J›jµ®-Ì@«Qôê¼6­»sX¸¶mmÔ.GHè©T–ƒÔ\"•WPÆí9OP{«P»ãw6…)JP”-)¥$”‰¨µPr’dè(€ˆ\0¢`\'„À§”	BiJP(^Uı]­5)3ğ±Ç{’BõY^KıI¤_ŠÜ€Ğ:î¥XóÏ,¸À½§Ù5\Z\\×ØI½–/è\0.2u(*´\Z‡Ëˆ}Vyw¦¸õµŒ-\0†™$äş½,–\'‡9Ï$O3ÛA™ô\0À¾ËC‡´\0ZC®]Íi¼Dõ[tˆh¶İ¯è¸ß%ÆºÌ%cÂŞÖ°ÁÌ3çĞˆa¶’\'M¡C„¤r“š$HmÍöµÿ\0EİáËH}á·$ïíhö\\ßˆ[M…™)1 ¹Àå;ê3E†ö•pò[Óa®Ğa¨@ÊÛÌ‰‰˜ÖJ™­i-d=Ñk8©°y¯]•\\=7ù„ÍHÔ³±2Á‚·x?5\Zç4–&`Şî\0}D­euİfwé_ÁÒƒÚé‰ù-p…¸#—=FüSnjc)->ßöºpŠtËsf‡	Íc=ìV%ÿ\0øşH¸†·/<I%Ì. ;MEÇº˜e7Òå+;‡9[šš$’à D¾Ú}§L8ÃKãLÙ€{D«á5hœ¯¢Ì\\Ù–è’ã7$è4u|?Á”®ç¹å•\ZÂ\ZO3e¼ÁÎ‰;EÆ—Z¹IÛ\Z®R–“7ÂòøĞòê>ËO‚%ÁÒ\0™i4ò“ÿ\0 qëĞ«•8f0£H:­bråÎd;[¿F7KÁé	ø3CXáPEZou7eqe<Ì1“+C[®‘{®˜Ör6pöU¨\"›Zu‚A?ˆæhï¸Zn{)1¡•Ñ-ÉfKÀt<&ÙuÕe7òğ.×ÇÂá$‚v±µ%iâhÔl‡ƒÊë¦Ä_¢éc›–â‚­6|MÉwgcbf~lÆ7ƒ>ê°ÎÖä#v!à3›6—Ş÷[ÜUŸ4–ÄYÍAÙÀ€LÏ[¬œ™N \'38“Øú¢ÆMCÒ³e ’bÃ+D\0Øj{Ymğ,p¥™¯sÜîVêÖ€ ¼¸˜&Gnë8ĞnÍô\"[­ã~ª\Z˜Òç4ºIâfnƒ¤®Vm¸íxKİš¤€$‡±\"\"JÒX|7×V\rĞ[®¤\0LBİ…¯¥¦I<%a’J„BÚ†4\"‰:dè3Â PaD(¥Nå)L’•å~3Å·Ï{^KAt¨ v^¦¼OÇ•‹1µ\Znó	è`¥›YUéåšç“:|\"Di}< uÓ&Âçk,œmg†’NäA\0ˆ\"×+2”3GkHãuo–¶Znthƒñè6ÖToÄSi!„:÷—\0 ìÙ\"ed`1­‡Íàt²ÛÁV¥fÈkNXøyb\";~ëÇN’ì›Çe‚“‰1 9€›$™ì´ğØ†¹¥ÕhD5­{d€Z&g¢vãi4›S3Ğw#k?ugûªUØ\ZæÉÅ#GÚız;Vá¢÷‡Œís‹¥ÀLœğ±ÚÓ¤Ô³`hIµí2°x^2Yn`I´€[˜–¶ÿ\0OºµHS/\'3®KL5˜ƒµ·RÔ‘­Vƒd7˜µßËš${GÙ,/šÖ8Âö\0QiËcs¸fÒÀP¦ÜíÎ`Ş]3­¦&Ú÷Zu<hY†­“Ö\nÏGk˜>f1åÌ“ræÚ`ØD,\"9¹o7z®r­F7#Lfs¦à‘:SÒ®p©#Ëp†‹˜iA#-öøt=V¢V‰ÀP5\rx§æ6¥‰˜Êp,®UÀÒ¨ÑMĞúp%²@qÌ™ÙN²ÙåPÊi™¦ƒÄÍõ˜)ªâ«-Ë´‹\0à˜Vç“Lñ*\\.­9í¨Ç´—ÓœÒÖ4¸hÓÙFúUH{Ih\rtÏÄZ#C=.Tt¸•V½Å´LK[ËdÙ€&n=Õœ_òÄ–M‰w($FƒÕny·Ó<#UùMÄ¹îµ¡’Ãxæq™ƒÜU\r>™æ›„e–æÌÖÌÀCÒ\nÛáüjNvÓˆ-&ÀÀ¹o=¸S‡¨Næp\0´H“q&ı~Šå•I#0S§O/šë8änYt{†é¢*¾\Z£T€ç€H1üÀ›ú«¸ŠTi°± \0Mâ÷ï÷ú,Š˜z.l¸2á¹IkóõH2Øº‰¸w‡\nÌ&¦`ÓÊ6‹û•ÕÊâ|?Dÿ\0pÁ5yC‰*9ÀtwÓP»E×E)J–ƒÊR™$\n&”PI)!Iˆ\0¢„ò„òå)JR”\nWÿ\0Tğ¿ù€ÇÅL8ûYzúàÿ\0©x)êGËQ“ê$~J^ˆòlMlíÖöU\Z$éße=ZòTíÏub¬QqíÁ‘ìV¶­uäóÔ@X´ê˜>×V)»+„ÜHë§èr‹+¤À9$hrº‘9ˆ‘®òÛ•¶i¼h€&LÉpúºÖ¾ëI¦ú‹z\\Ûò+§ÀĞ\roc6Ü×ŞÅy²®Ñ‰ÅU€iµÎqÍh™§POâ{{©1Ú–èÈ›È—9¡ ¸:ItoZXV¶™5Œ÷3{ëuˆ°ï©L±¡·–¹ÚCL^v€5‚’ËÖ‹,íŠ°Ğ]™×ÌXfó‘¤UĞğú®ŒŒÏ³º_\\§Pepü;TT¤Ï)á°Ûp\Z¼ÚGX]øÂ=¦lmadh§’LoIß¶¾Hß ˜Ğ~J\\k^wM\"ê–/)76q$‚àÅÀ\nµZì9Ç4¶€™s@¶7×Mïu#~…f“Ü[uB§§æ·)‘˜1ÄZ$HihĞ_âØÌê©×ªÌí¤çs†€ƒœ\'­µöí/K^k1™&j9°>fœÍprmÜ\r÷Ö)]­\'fˆƒÔ‹\0¹_ÔËL1ÏqÏP\0Æ‹\\ˆÎŞ€‰¾¿E±Cˆ—7àx€CşV‘9ÆÕÀ±‰7è¥şÕ¾Te®{ÿ\03˜»¼Ç©í°ZÇ«Ú_L¾Â\\Á˜Ç1„hÿ\0m>ˆøw–çTÏ.<×ËLt€ün$5¹Zì,AnbÄ†ÏÑi¨üÍµ\"Ø ´æü²ßŞ·õ¸†!\r‰:H7¿s¢Ââ8ğÁ˜pNúÂİãx°×S\ZË\\C[:ÈnbwßmŠåx¥Hiy×/h¬pÅœ«[ÀU¼ÊÏvÍ§\ZEÜë}]Âå|	‡\r¢çñ8ˆøGîJé³.é$£Ì” 4¥G™,È$”AB	D	A4¤ƒ1L‚ˆr0å€U‡\'Ì¢\"2YBP€ó.Ç8rüËD–sé¯ÚVê£i¸ ‚;)¡ó‹Œú¨ŞÏ^»~‹oÄ$á±)€éoBÃ¡ştYu-=¯íúì‚ öß¯§¢&UH›t:•G]/;6ôA³€Ç¶›¤f$™p\'•ÄLØ‰Ùtø?QÊÖ½Çq™­qúÀ¶ÛÃ6¬:CD‘k}Uœ%<Á×,’ã¤F—ĞôõXË	}µ2±Öâ8¥İµ\0-™Ì½„·öWğ5›Q€g°˜µÅÛs¿EÄÔq“0E‰&-·¢>ÄŸJ snİ X}{I€V2ñMtÔÎï·«`(NÚÃ§×OÕi\0şv\\¯ñ*˜kpÙ ˆ9Du‚BİÃâ3+Í”×N“µáQyoAp5-õS»‡±í\0‹:Ä@şZHp‰ÇçÕNé €`ÄN¤t1º±)éQ&Ah–úõ>ª*¸8:\rF¦Ö É0z;]9ÌÀˆÊ\0lî5>¥&Öw(5ÊI9²óƒ66°½½X§i?Ó%à˜s\\ÈmŒÈpqÕÖ‹ìéÚŒE7¹¹ D°:ú°êC­öî£¯K>k¼ÃO•ÄH$Doh”4Ç6o˜€Ù&tÚ:®“(Î‡]´éˆ´Óc¦§ê©Pmhq–ŞCZû6@DzX€:”øòçd†“ÎÒèH‚4è&?ˆ²ƒKê\0r‰œcA;şWSÚ9¿9ùòç´äÍ\Zå¼ÂÜÄúê°±µ3Ö:Ù\0‡\rFªİ*¼ÏqçÚœ·6õÔ+\\†6¥v´X\0s‰Üƒ9£i6^¬cvœåaé´ë–O«®V„¦”ò´¥)JJ)¥$’…CÊ& BI(Ipj Ô@TĞÃSåB1÷\rT²¥ıÀKû€†‹*`Ÿû€„W\nšr^?ğñ®ÁZ˜ÿ\0r˜¿ü™ÓÙy5{\"÷ö_DŠy‡¼”»‡Ãw°|§RGe›>«ÏK†¤&€‘}”µhœ¡Ò\0&\0ôU²¦æ @Æ·¾½Œ1×PuIPeşJpòu\"İ•Ò/t 4’Ìƒ$€“&ã–L_OİWmi¿óÚ.˜´¹ş¡M+N†,Òö¹¢›\0ûÉÑw>ãb«Cj6Ò,×XÅ¶6:YyëàĞ7ü:Øæª½Äù%¦ ÿ\0l¼:D‚İ‰m\Z÷\\óÃ”kªõœsA¸>Ñù«§<¿yÖ7¬\Z:Í­y´ƒ¸ºÛÃÔ17 ¯©¦´Ü7,Nò\\\"\0½¿ÙDYX½‚Yse]²ÚÃ[Êï™´!n,o–Ã}g]?u¬{JŸ	Iq‘°é×¼›¦«ˆØ3I3h\Z¹Ç+E…¤˜\nPğ©Õ­5\Zƒºˆiüæ#ÑoúÅ[uRÖË€Ùvë…â8Ã^ Ô0ÈÊ7Í¥Ïè‡ñB÷aÛLCš9Ü3É\0ëÓÔ¬gÓ†ÆkôwÃ¬eIõë0ƒ \'y\ZÉwş\ZáF…!›ãuİÛ²Ìğ‡òÿ\0½PMØ×j?äGUÖ®úb#ÈŸËFSJËMå©e4«¡–›ËRÊI¡¦‰´Ñ\"jhD”©&‡\Z*¢U0ôAë“²ßš‹ÍUÓçEZóRóU\\égAkÍL+[:QtbJ#ŠØÜœj¦5“fœ·Š<*ÒMZ\r¶®`Û»eÃâÆãb½xâà”±0†Tü@Xÿ\0öÍ8ªŞÒ=ÔdGóóZXÌJ.‡‚:–ŸB¨Ô¾¿UX\0ÿ\0XêÍ!J@¶@ƒ6ı×-¯®ÊÓ‹œ®^Ûûi*‹)ˆëÛÑY¸Ò–ˆPt\\‹ùAÌ&F¬Ó–ëH›^ú.×€qÆVA\0–dÂòÜãCb4ŸMÑ\nÍÌàğAc™b¶Ë^)“S;ÙN½í¸*½Zï$eh#rLn;N“ö\\?	ñeJ™IÌ9\\@€@ù¯ºÖÿ\0T.tŞLL’{.t—n›Ä\ZØ×&Û•G\\¶›²Á¨Zbàß¢ÆÃQsbâ×m¼^Ú•©ÁT¨y]#rE‡©İk~3lc`ğXš®,æ›“mh¾€]ğËXCëCˆ2ÖìSÕipìi\rs;sû\r•àåëÇ=¹t–R•d¥lI)¥¤€¥)B’¤‚R”60ªD\nL’	L†ÜÌŸ™iz§8õXàß6g2~e¨8iêŸı4õSÍ•Ì—2Õÿ\0M=Rÿ\0M=S‰Í•Ì¢{ÊÚÿ\0M=TNáÎêœ›õ”Ä-·ğ×vUjğ§t	Â§8Æ©‹U*ã¡lVá úªø!;}Ó…9F.3\Z!Àv+™Æaš°‘Ø®Â¿‡\\ì,úŞ~Çî˜dÍÊ9?9ÂÒ¤Nÿ\0ºÚ­á*½¾¡Wÿ\0âx¡PµÇ/ÆyFsjúU+^ òí¨›+­ğ®+«~ªÅ/	bºpËñ.sõ˜Çæ¹•špÄ~¡lá<X\rV‹ì?ÊÓ£áµÇ3ÜëösÅ“7É‹˜`=şëk‡ğz¯Ë\ræu£÷]6ƒSoÂĞ?5­C¿Æ}cı/Å>Àé²\rB^zIËşWOF¨\0\0\0¥K\r\nÛ)+f3ÓRÕ–ÕR¨YMLËCD\nÂÊ(¥\ntSÊR™$\nSJI yDÒQ)$’+ÿÙ','A','solis.mario91@gmail.com','123',1);
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
  `Fecha` date NOT NULL,
  `Observacion` text,
  `FechaRegistro` datetime NOT NULL,
  `Pais` int(11) NOT NULL,
  `Lugar` text NOT NULL,
  PRIMARY KEY (`Medico`,`Especialidad`,`Corporacion`),
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
INSERT INTO `medico_especialidad` VALUES (1,1,1,'2011-01-01','asdfasdf','2010-01-01 00:00:00',1,'asdfasdf'),(1,2,1,'2013-11-01','123123','2013-11-15 00:00:00',1,'123123');
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
INSERT INTO `paciente_foto` VALUES (1,1,1,'2013-11-13 00:00:00','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	\Z\Z\Z\Z\Z( %!1!%)+...383,7(-.+\n\n\n+++++++++++++++++++++++++++++++++++++++++++++++++++ÿÀ\0\0\0Å\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\09\0\0\0\0\0!1AQa\"q2‘¡±BÁÑáğRbñ#r3$C‚ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0?\0Ì’š¥{Tp„¤”¥pj×9Hà¡r=FÔç¹Îº„„ö”	ŠylDò’HÀ£¨äâø\n½IL.\\â£r/MÖ™)²‚Ã’£Ô\Z’9È­vµIA)zn´ÉM”{ÕÊ9\\ƒRBÌRÔ)\ZÔò¦¦ÔjR¢+]Š›¨ÏÂdôA6@¦ÂyDrÜªZÚmøá?ïÑG—e®¨@-1ç~¾7)Ñf­& \Z\"nL¥ĞVÂeôZÈe7¿¬‚ÛõãÌ§QöoŞÒ,ætÁƒsqÙn2¼ª QğÓ{Ÿ ØÇrŠ3&¢FóÔÉú?™{5P9Î2Dî.{¤ØY-hiòNı\'€½ÑùsÓ$ô›Çt¿³LoŒS>Ÿš,~QSLhÔ[môBİOÄ@ãù+ÕÎZ|GA\ZE¸æàó²ÌûGìÃ¤:“e‘À¸‘7Ÿ’KÇC*\"¯âòº”¼Nˆ˜$`ÆÆ6)„Ş¤I<\rì€q\n2­Õ¡È“èª¸ l®ÕuÉ	@×9p+Šâƒ‰M•Å @àW&ƒİr\r[Ü™­LX£÷w@¥JÇÂí6QƒŒ¸ÃA\' º›\r”¾¡ÂÛŞOÒÊşæµÍyËÆä™6SÛKj0ÁàßêE…ÂA¬‚Gö‚g´Ìú­¯³Ù=F2=Ø›\\ˆõ¤ÉòÆP]\'©6ô°Z»H·[~¾H&£•ËG½2z\r•·áxl•F®<.èÔ„À·’kÛh7Q²¿^D¦6½ûıÿ\0tš\0‹nªb0Àoëåä§n&<ø\n:çWÛı Íc2ŠUWU0	á°=,m?ªSÙÁ\r`\Zc˜ÄÉ{•»nXÓ°ç¿Ef‚\'a3\\š‘q	Ùy~rÀDC3ò>‹Ü=¥Ã‚\0ƒ´¯-Î²_ˆºK‡h>æ7Aq\nål8Ó íÂ§­a4¥%DçB<¦êI©6P<w\\¡p\\ƒrâÔö®(\ZÒŸA·\' $&¤ñü”¨bªx@qq˜¹°ùîµ9^\\á«Vçf6O‘…–ÃÓÀsÛåOì´¹M<4oÖd}-ä!›E¬:ÉsõØ+¸\\y~Ìp½ì†{¨‡=Ä‘´}•œ`À$MÏîaj˜ƒ¯.\'äË·TìÃ4’â\0ÿ\0EŸÿ\0Ê2yò”\Z|>.Gp-ß²e{ºŞ³ÇªÌ»0\'hĞŸÑ\'şAò!ÇÉ«úÈc÷	íÄ³¬†Ë4Úç‚DïLd™$Ÿ4Û˜\"S)fwAœÄÆøL„+WyA=£¤ÓKÅ»Œ|¶8Ovdæßqöı•ªxÑP	: ñ¬v¥=ZØ[¿Š,G§Í}2İ×­ûA”‘â¢t›‘±c¼åybxp‡qŞwBOrŒ”¯rcp7K©3ºn¤®Q‚¹¡i•)¢–µ ®i©©ÒÓÂy¯sÙ!r™•šHâÑ×è€¶W€5]ª¦ÑÖß!Ïš8Ü`g†$\rÎß.Vu¸‡7Ã?!Ûkíèˆà©½àI¹{vA>?7÷mˆ[õ>}l&yxKºƒÏh²³ŠÁË¹ñ\ZmÛ‘)rÜ’›Zt¼’MŞCDömĞ33Å’Ãy=\0°YÊx÷¤gFĞ„ó3İc0®:ÌõA­ÃV>ˆ3&Ë;Eçâ6aüÜ¢8<TŸ…Ä÷°ú ĞÒˆ¹\nÓ^Ø2;OPº 7çû+áæÓë!´ò>©Ğv!9ÕÅßOÈ§{àD\0}D}ĞR®\"z(òãr\\c½Ëıªt+–¸}P_Å=Ì$8İÏ—P\'Û”ë÷”Ï…ã{Ëxü@p¾á	Ì!ôœÀ.ËØî?dCˆ [ó’¬âµYµ&éñ#rØ [¡¸ã•Äààjm½\'il~H*¹5©ÎM&Êäšk“Êç	 ‰*ÓiÃÓ“è“À]3õáXfà‚ï‘öä ”4¹ÁÄ´„ñüİËÚuY×›™µº*øqŞÑñ~@r{¦šĞèŸ¢\rhê\\ÀøÜ¶OÍc°øÇ{Èı‡>j\\]VºI‘ÅÍÏÎÈV´ÖlX8ß}¶û %›êÑ¾ç¥Ïe®!Óüİns¦uÜSØz¬6`cçÇàêÛQùôDğÁÆ@æşv@0.ğ‹€d÷·ÍS«˜b5 Ğlz6DèùşÈ ¤[p=%y†]=¶¨eÀì~ËĞrŒí¯\0ÂtkxDƒÕHÒè°?Ù;Sl{!Ìù”Z{ %‰˜ñ6>¡\nÓâ!CCÚªuÏ\nÕ\Z/c…Áº	qÔ4€ù‹AU\'Ââ:°‰æODM¶·r6èƒ\'šé—=×¶ÀYÀnqDô„ÃAĞáÏCøLt+uËµÜ§ñ»Hçä³x¤òæ·ÂNŞ[[Ù>³ ÇE±l<Şy•Y€‘*D¬i$úì¦M.@”¨I³Iş|‘*X\"\\ò\Z#“&vĞ×<€n@íÊ\'‘L™Ÿ>=v@D\r-€o#î„æH\rëiñ,f™¾¨<‚6ˆ\'äƒ#^[bLßi*<ª4ï|ÈBñY£Yÿ\0Ú@ØY^Êë‰wŸ•Ğjı¦æØ¸ÿ\0õ¿ÑañíöZ,û2\ZXÙØ}¬>ˆ3h\n®h½şº²w@Fğ!ZÌª±ïÒêÂ•0cÃO_º±˜àM®,¹\"\Zv#·ŸÕeY•Oÿ\0hcˆtG>cè€Ş/)¦Ò#ïlIİ®ïĞùªtqO¡SF©h;‹\\ì®…j4À©/`‡Ô¿ŒÃâ½ú¬Æi„m7§P‚L›nƒ~ÌNš:ÜwíWº\0p\ZºÚİW¢àÚÚ¸@Ãq\0«í²G[‹\ZŞ&L_’thäµé†¿SK	»˜gOŸAİm²–¸\r\'v‘½U¹C˜ĞiVy÷­EI$ì6óZ¿eZM*nuçH™™ÙlÃµ¬9T±„·KÛğ¸|)1õ‹æîÒdz«T† ìÓ>@ş…\0uw4—°ÁĞè~5ÍÄ1à³İÕhÕ¼ÅÌweÙÓËKMËH·0lz!X\\àµì¨{¶,ooÈ”\0±X2vİPG±Ï.}b\ZC&ÆÀN@éAÁrP¹ª\n‹œårYA&»y^ı’RÆ½û;E¡p\n,.jÒã¤ñ 5IÎ:eÄ\\êkr»1|·±Â™‡ÀüA®–ƒcØm*,Î¬S.ãduXè{ÏWóÙG†Ä¸ƒÇ—NŠş~Áï!»#ì>Š¥­ÒD;òÕ+’.U¬¦´½¡Ñøõ›*6M¢ï0ƒyı-h¾©ÈgeÇ.÷„’Y«®ƒ?BóReX‘¤_qõƒôDšà„ZPW£…Ó%Î$n>d=¡Ä‡ÃêVßSş2ä\\¯/Ì±úŸ\0xA·t—ì=rê.¤„G0ÃkfºgKÆè?±Ã¡’=Tè~’lí¼Ğ¡QÀÿ\0ÈÑ#–ıÈ7l¥e6Ñkˆ\0s Ø“Ğm¿EJ<@\\sÊœi€ßîŸÌú ­‹ÅjVöº%‚Äé§âØˆ>¼úù¬ëªlÃn}œ¾ ,h?ˆ\03¨k7p³3e¹q\"fl·8Úì¦\\ÚƒTìô(^&½&5àŠWğm<[Ÿš\0ìÁÚ\r0A2èüD¿&:wB!YÄõµÕi@æ®I+zZPå¤æ\Zœ^£iM¨Ò€¨Ç½ÍÓ#¦Üm6C=¤ÄÑ—\\;ò’“J·^´ÓsuøNˆ24Ş*Ğqå§cŸº§QÀ4uÖe–¸¦æix&\0ÒA—@ˆî³µ¢Æö@Ç(éÌÙ7Y\"ÊL!ñ¶v$J\r6 	èõçä´y|ºò±¹½x¨vóÑj²ÜP÷pL EÏú@;ÚÌyĞæ2Í\'©éä°˜Š¢H¸^™Qk¤Ìm~noĞş«=šä¥Ï\Z@¿Işßçtö_Ú#H€NÛ-n#7ş wâs¨FÂæ%e2ÏdÈp÷›Xöß•¶ÊtS\Z\0æ#ëİÜ¯*Òì‡æ˜0\0™Ÿ •e˜v\\æ|¼t<ú ÔÓ¨ğßv‰Õ1TP¡8éwdg66mÿ\0(A½Ÿ¬Ïvu8k°=vŸ-®Œf%¬ÒIµ§íú œÓ5Ú@Õ˜ê&‚±¸ÊZ	ä v‘o’Øûc‹`\0R\"xïûÊÆ<ö‚³Ô.R=Dë @W$…È=KÜ©4)áKIˆ*2šœ1Zm0‚»—ÜJ°ØVh€€f+Ö1Ît@uåÙ–(½äğM–¿Û|È–CL6cÌƒxòXG9êVjZBşJ½:¶ÊJ5  ·R´ºQÜ¿2kfLÿ\0õã¤,ÅG‰•\rj†Æl€õ\\÷K¯i\'Ôqê–¯´,÷$xä6Yÿ\0v\\Sÿ\0¡$Ù¨5ìö„É´ÈÇ{ÿ\0.—/ÎCª°z\r½P<¿,&`½å¡ø\\:ôû ÙeXÁPí\"ßªÄû_‹ÿ\0‘Ì\0·¨E2—Š- ˜kDÑr°øüY¨÷¼ş\"J	hâK63×å²´s§Àü=oè‚ÊRä±’ó\'…V«Óu&”\rrh	II(9¡rí+zÄ©i”Út“ªA(¨†¶!ÅcaSÂ÷¶I;0Ê¹ŸÖ4°¥Àç7qöMÂe-h×^ oøş§`‚ç5w9¬û­ï}\'b´„Ìn9ÏkA2°şªAY¯I ‘7èªƒ…—í	¤¦¼tAd¹HÊ€ˆî©R©ÕH× ?–È•´É°´cÄĞW˜²¼EÑ¬»:-0òc²RÃa¨7f´(1Œi\",s¹}c‰W)æ®ªğÉğî}=¦¨@k\r–¶»\\jÌT°\r7w>g„5ö!íEÚÿ\0ÄÙßº/–æ\Z2`_`\'§ÒŞH‘Å]¯&|^ZbİPy~+\0úF*5Í=Âª\\½x×¥Tı0n\Zè\'½×B±^Íá±\Zƒ œÛêPyœ®•£Ì}«OW»sjGÎÚvYÊôÜÃ¥À´º)¡)rIAÓ“bR öš•\0Bñø°¦2S0yi¬ét†ugªØ|%LCá–høœvQ”eM¤<%¥Å²\\á<ïx·<)½ó\ZÍ\Z˜ÉDD4º1mW°Ã\\»Fí¶Ö@UÔÛ.qn§›Vó€mÄşkÎ½¢ÅTmSX6šáÁÔsô[V0†	—â\0À#é½ã¸@1Şê£.“¹·Å0ß!Çtëh¬×Ô`\0’i\"Ç—\0.Š”õäÛø:.ÄĞ4©¦Z	ëk‘\"øg²³5KÅ´Æü_é×dÚ”Ó^;#™†\r‚Lôú	˜ìzò†âèÁ1% Øì‚ˆiR>™šÄ\rk”´Û$©†;¢>Íáµ×kcõ@K—¶Ï? 4ª¾ÏU>ôÃo93÷ôDıºğS§O€IG÷N6[}ÿ\0÷¬‚¨sôâÑÚWeµK<$ÙÆçñ7;L?\rh—S#N‘\0]ÖÜ‘ç\'ÕOâ,‡º\ZyhÕ ‰vi”k´j-‹ê.›ƒğ“qµ¼ÕœCÜÇ´45â\0˜¹ÜAUpï ‘³ûm2<ÄÛtÜKƒî\\v‹ô\Z:DğÖ¨³›p\\~bÛ¦ãè2´ŒE cg{ùp„¿0÷nÄwm¸”nµFû²\\H´Óäƒ#›ûUÌşo¡ådkQs	kÁ ¯R¢N&‡vÜö·({Új˜/.qÒ:„Æ.Iê‘§ä¹CŞßyPØ–‹¾{\"î©¢4Ëd:\03ck%«M¥®5îé‡tR„İàŠmo‰¿Ü\0w2H™@¸×k~Ø›\\ğ<LÏEFSÔÃ.\r$ 6÷\Zb#²²ÏzÒj‚Ñhp¨4¶6˜·r«â)k~ªBÒ 	pC¹ÚöA|ÒÕ/ÔZØ-1:³»t(EvøÀÓLlíúD›ö\'k©h±ÎÔÃg4RcU»l`Á§5¡°&`·›ï{»ü Îâ¨ñv­æäÜËì?$2ËßAÁÍ;L´ï•°v_%¾ìH¼w\"L^\ràí´*Ï¤*9Ìw„—çN˜ÓÚâ~Hå˜Êu¼5<7ÕÔíé&=UŒF\r†XKB\'¬ãÓó²à7—R:˜IÛƒ¼|•œ»?ğèª%±¡ënÈüI\"mæA¹·˜°ÛÉNü¡º˜fÚNûÚ8ı\\&¦åÁ¤=¥€D“h±ŞS?ª¹ÖDA“°0nã¹îOXAV–\n@¸h¶âãµû¢¡”\ZZê¬Å¦­\'ĞÏ¢¤1,à’‹‹GoR—1h,o/ø¤–É{o×­¥œÙ´ª—=Òïwf´ÏQñZãióU«dCIŞï@ĞHhH#hÜ@ûªø:à<niÁØlzïÙ?-Ì^Ç{»hÒ9ƒ¸;üşH25™R“áÖ#ä|–—\'ÏZğZğ\Zò~+Á°ˆWó|¡•´ºN“\'U¤	ø@²Y†\\êGy\"?‘õ6ÌÄUš\0ø{w~Ÿ%-F˜tÃN¦¸ZÇyâË\'•gwPL‘¥Óv‘ÏÙmòüA«Jşy¾“1ØÛÕ\0 ñy`v©$H´ƒÇÑÃâ\Zö‡I.-ÿ\0Öî\"Å½½S(éÑ¦\r¦ö¿}·ECcféi\rÎüvájµ=Ş‚Œ	‚A–ÚcxT²úáõMåÅ¾|ö>\\)Í&ºœ—4;iÄGŸCÈ*¡sY[I 4;‰Ï´Q¥RÃÂëİ—-^`BĞ†¬óä¹ŠµaR›µ¥¦ñ6Äü&öòBóŒ¹Ì\"£	$ln@‰˜üW¿’{G¤é|@ä¯œAs_ 9ÃQ‚.Òmá\'¯`PÄf.k™}íâ¸ ¸\\÷Üß¢\\Xu:£L–üB]¹ ÉhC1Äé‚£Àñ	\0O™¿egúíl\r?„iõ2æ~è\n³\Z4Ës½À\0öü>pWeï$Ë È.Ôxâw()Ãe·è\"e·²±ƒÄmMÆK@Ñƒ:¦zÇ(5ØšM\Z.u’\\,  ü÷ù %’CŒ\\æ™pLGß¤«æ³ƒZÛ]¤´ş&»ñ6?şªƒØç´ê~±§QàÚöı	è‚\Z˜Væ8|Di‚ºúonãªœdº^trl8ò=Ö­¤ò×\0HÑ»\\O¢n%ÁíS}%‰ƒÔ:–˜W«‡yÒblAØÿ\0:„f–yN£š_OÅ>“Áò¹Sâ]MÔÁxĞFÆE¢xµÖo‚ĞN“¨oÜ]§0c@™09-Ïß•[]Ñ©°ğKw	Ğ¬ö2}2ÚD´ÌÅÿ\0Ëë¨<\r\0¾bäo(#ÆÕÔÇ8´^«¶¶_¬vQ‡\0² qv©¼Æ›M·ŸÉUË+>«HkC‰%¤HàyíöEÛ^ÔÚ¤™&\"ÜDö0bÀi–øI›Á c±âçª‰úoLø²t»¾Î‘²\\[‰÷€€u\\€w<ÄìB¥‡Ä‚àç8’Ø!üÚĞ{q(*âr€$´Æ›Å(şX^\0kˆ\rcĞÌyò:­{[y.Ü˜ˆFÛİNÚDÔm7cC[m¢÷;Zè&¤ñT»b\rù‘pmÒ#ÕGƒ¬\\4Õ:šïın1—Ù:¥Ú¾2ãvaÀÌ±¨5ºZ?¾ÚM„D›„êÕĞÑC{Íà‘ù÷Pã(“UŞÚIägÑe2/3¼™‚ÓÕÇşDÉp‰kDÄ /KË‚–J…3\ZEšĞFı.nwHƒ9LÁº+’æî¦æ‚eº®ÁˆPrú¸JXŠ:©41áÄ†¸î<ÿ\0\rÅ–i„åºfİtşst¹>núRq ÁíÇ’ÒfXfÖaÄR7{&à;â t=8”º8ÃNáºŒê2mºªøšäÃÛ\0ë1Ø@—^ÊküN½äü¬UVV ÕŸŒ»·™¿mÁ ÷°Vrz Ë$‡4˜sŒ	<ˆŸªÎÒ%Í.\'ˆÖ’:”F˜Ô\ZXƒã$ÇhŸtql8hş&ósäl~jOv$Y¤Dˆü2.Ãæø,n£\Z Gá\"àı>ªŞiÉ0à A6ˆàùOÈ £˜átÔptB\"äZ~·Têáİ$é\0i=$@Ÿ©á÷cÂfáäÄÌj:\\|†ãÕG^Ä‘\'“c¤™ìPf18I#Â/ÈIåGW)s|L:„IÅ§íÊ=„­©cÙqpIâğ#}ùMÃ9À·I\"m‡{ß$¬5rÚİïöZÌUv»DŸ$	;èxóYlÕ¾2ámDüåËñ²ÖÇ…Íwáïyƒ¾Åµ(CfocüV—ôUğûLHí\\Ş~İ‘\\Xi’İ :z ôØÉA+7I0@€8;ÂøWÓ4ä×7o ™ IòW1U<EÂ5\0@=¢\'ÏIÔ øšÁÚûæû¢ø<C‹9›ÈØ\r¼]Âà…f‡êqsd2íä„H·`ˆ?IÓ¨[ÎÛØ‚&ÆFû ye––ÉeõD$fŞ‚Ef•v{¡áñÔ2DÉµ÷ºµíÖ«Ü¸YŸÔtUq.†’/¥À‰à´ïe=6ãÓ¤D˜»¼ïÇ!ø—¹Şğ´‡5¶ØzƒÒ~ˆQ‚bÒ\"\näÆc%­Ô×\"ö›n‘t·²iWé€H¹MÄá€Ûºè*7¤­O‹tµ¢L›´ZÖß±PêbA=&t\n|sÒÖ“\"7‚Aİ¼×*$—ÏÄ?´Í–aÀ…±añiÕ«UÈAØôØ¬ÆeOKİy¹úş› m\Z÷ƒyÿ\0HD€dDÖ3FÈ†¤‹Â RÌ‘?„Û»oÔ}Ôøl(¹?¥­ï¨Úc á8¡¢àémÛtW‰n’Aï°´oÍáL[…Yß‘ \rúG)}Ğ4Ş¨¾ffuîáºv5¡Õ<f€Ş×àÏÛÉHĞlßÅ½­ ÛöAN=@¸»nÀµÉ’¤£LX\\“\"\ZzmÑEîœoy\0Ü‚$ÄÚAVêTøš j3$_Å±şÈãğ`5ÌQÚfÑôõCò‡ÅF‚`HŸ×å(óŒ8ÆäÄ‘Óió3>HkD0@<O?¾è	SlHÙ ÜÅ¶#½¡SÄé €@™üıwRĞª*·NÏàõ½ÿ\0!è¢ªğLÆ™éaĞòP^Ëê¶[ª$zD˜ßeŞÏˆÒIÁ¯ÒPÏvd‚A‡aæ¦ÃµÇLGŠÀGN>H-»2>óÄÙûÜ[±¾ó•†f\r7\r‹D´Ï[ƒÕvNˆq¼AŞ.m]YÂâ^HÙºN\'é>¨\nàñ:¥ú›¨s>~fm*&áCšòé\ZoÀé<‘\0&SÂ9®ApØ‹m§VÅµ…­¨@Ô-çßç²´xt¸A?ÜM’$Äâ\\Ç¸xNÇæ ÿÙ','image/jpeg','2013-11-13 00:00:00','A'),(1,1,2,'2013-11-13 00:00:00','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	\Z\Z\Z\Z\Z( %!1!%)+...383,7(-.+\n\n\n+++++++++++++++++++++++++++++++++++++++++++++++++++ÿÀ\0\0\0Å\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\09\0\0\0\0\0!1AQa\"q2‘¡±BÁÑáğRbñ#r3$C‚ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÚ\0\0\0?\0Ì’š¥{Tp„¤”¥pj×9Hà¡r=FÔç¹Îº„„ö”	ŠylDò’HÀ£¨äâø\n½IL.\\â£r/MÖ™)²‚Ã’£Ô\Z’9È­vµIA)zn´ÉM”{ÕÊ9\\ƒRBÌRÔ)\ZÔò¦¦ÔjR¢+]Š›¨ÏÂdôA6@¦ÂyDrÜªZÚmøá?ïÑG—e®¨@-1ç~¾7)Ñf­& \Z\"nL¥ĞVÂeôZÈe7¿¬‚ÛõãÌ§QöoŞÒ,ætÁƒsqÙn2¼ª QğÓ{Ÿ ØÇrŠ3&¢FóÔÉú?™{5P9Î2Dî.{¤ØY-hiòNı\'€½ÑùsÓ$ô›Çt¿³LoŒS>Ÿš,~QSLhÔ[môBİOÄ@ãù+ÕÎZ|GA\ZE¸æàó²ÌûGìÃ¤:“e‘À¸‘7Ÿ’KÇC*\"¯âòº”¼Nˆ˜$`ÆÆ6)„Ş¤I<\rì€q\n2­Õ¡È“èª¸ l®ÕuÉ	@×9p+Šâƒ‰M•Å @àW&ƒİr\r[Ü™­LX£÷w@¥JÇÂí6QƒŒ¸ÃA\' º›\r”¾¡ÂÛŞOÒÊşæµÍyËÆä™6SÛKj0ÁàßêE…ÂA¬‚Gö‚g´Ìú­¯³Ù=F2=Ø›\\ˆõ¤ÉòÆP]\'©6ô°Z»H·[~¾H&£•ËG½2z\r•·áxl•F®<.èÔ„À·’kÛh7Q²¿^D¦6½ûıÿ\0tš\0‹nªb0Àoëåä§n&<ø\n:çWÛı Íc2ŠUWU0	á°=,m?ªSÙÁ\r`\Zc˜ÄÉ{•»nXÓ°ç¿Ef‚\'a3\\š‘q	Ùy~rÀDC3ò>‹Ü=¥Ã‚\0ƒ´¯-Î²_ˆºK‡h>æ7Aq\nål8Ó íÂ§­a4¥%DçB<¦êI©6P<w\\¡p\\ƒrâÔö®(\ZÒŸA·\' $&¤ñü”¨bªx@qq˜¹°ùîµ9^\\á«Vçf6O‘…–ÃÓÀsÛåOì´¹M<4oÖd}-ä!›E¬:ÉsõØ+¸\\y~Ìp½ì†{¨‡=Ä‘´}•œ`À$MÏîaj˜ƒ¯.\'äË·TìÃ4’â\0ÿ\0EŸÿ\0Ê2yò”\Z|>.Gp-ß²e{ºŞ³ÇªÌ»0\'hĞŸÑ\'şAò!ÇÉ«úÈc÷	íÄ³¬†Ë4Úç‚DïLd™$Ÿ4Û˜\"S)fwAœÄÆøL„+WyA=£¤ÓKÅ»Œ|¶8Ovdæßqöı•ªxÑP	: ñ¬v¥=ZØ[¿Š,G§Í}2İ×­ûA”‘â¢t›‘±c¼åybxp‡qŞwBOrŒ”¯rcp7K©3ºn¤®Q‚¹¡i•)¢–µ ®i©©ÒÓÂy¯sÙ!r™•šHâÑ×è€¶W€5]ª¦ÑÖß!Ïš8Ü`g†$\rÎß.Vu¸‡7Ã?!Ûkíèˆà©½àI¹{vA>?7÷mˆ[õ>}l&yxKºƒÏh²³ŠÁË¹ñ\ZmÛ‘)rÜ’›Zt¼’MŞCDömĞ33Å’Ãy=\0°YÊx÷¤gFĞ„ó3İc0®:ÌõA­ÃV>ˆ3&Ë;Eçâ6aüÜ¢8<TŸ…Ä÷°ú ĞÒˆ¹\nÓ^Ø2;OPº 7çû+áæÓë!´ò>©Ğv!9ÕÅßOÈ§{àD\0}D}ĞR®\"z(òãr\\c½Ëıªt+–¸}P_Å=Ì$8İÏ—P\'Û”ë÷”Ï…ã{Ëxü@p¾á	Ì!ôœÀ.ËØî?dCˆ [ó’¬âµYµ&éñ#rØ [¡¸ã•Äààjm½\'il~H*¹5©ÎM&Êäšk“Êç	 ‰*ÓiÃÓ“è“À]3õáXfà‚ï‘öä ”4¹ÁÄ´„ñüİËÚuY×›™µº*øqŞÑñ~@r{¦šĞèŸ¢\rhê\\ÀøÜ¶OÍc°øÇ{Èı‡>j\\]VºI‘ÅÍÏÎÈV´ÖlX8ß}¶û %›êÑ¾ç¥Ïe®!Óüİns¦uÜSØz¬6`cçÇàêÛQùôDğÁÆ@æşv@0.ğ‹€d÷·ÍS«˜b5 Ğlz6DèùşÈ ¤[p=%y†]=¶¨eÀì~ËĞrŒí¯\0ÂtkxDƒÕHÒè°?Ù;Sl{!Ìù”Z{ %‰˜ñ6>¡\nÓâ!CCÚªuÏ\nÕ\Z/c…Áº	qÔ4€ù‹AU\'Ââ:°‰æODM¶·r6èƒ\'šé—=×¶ÀYÀnqDô„ÃAĞáÏCøLt+uËµÜ§ñ»Hçä³x¤òæ·ÂNŞ[[Ù>³ ÇE±l<Şy•Y€‘*D¬i$úì¦M.@”¨I³Iş|‘*X\"\\ò\Z#“&vĞ×<€n@íÊ\'‘L™Ÿ>=v@D\r-€o#î„æH\rëiñ,f™¾¨<‚6ˆ\'äƒ#^[bLßi*<ª4ï|ÈBñY£Yÿ\0Ú@ØY^Êë‰wŸ•Ğjı¦æØ¸ÿ\0õ¿ÑañíöZ,û2\ZXÙØ}¬>ˆ3h\n®h½şº²w@Fğ!ZÌª±ïÒêÂ•0cÃO_º±˜àM®,¹\"\Zv#·ŸÕeY•Oÿ\0hcˆtG>cè€Ş/)¦Ò#ïlIİ®ïĞùªtqO¡SF©h;‹\\ì®…j4À©/`‡Ô¿ŒÃâ½ú¬Æi„m7§P‚L›nƒ~ÌNš:ÜwíWº\0p\ZºÚİW¢àÚÚ¸@Ãq\0«í²G[‹\ZŞ&L_’thäµé†¿SK	»˜gOŸAİm²–¸\r\'v‘½U¹C˜ĞiVy÷­EI$ì6óZ¿eZM*nuçH™™ÙlÃµ¬9T±„·KÛğ¸|)1õ‹æîÒdz«T† ìÓ>@ş…\0uw4—°ÁĞè~5ÍÄ1à³İÕhÕ¼ÅÌweÙÓËKMËH·0lz!X\\àµì¨{¶,ooÈ”\0±X2vİPG±Ï.}b\ZC&ÆÀN@éAÁrP¹ª\n‹œårYA&»y^ı’RÆ½û;E¡p\n,.jÒã¤ñ 5IÎ:eÄ\\êkr»1|·±Â™‡ÀüA®–ƒcØm*,Î¬S.ãduXè{ÏWóÙG†Ä¸ƒÇ—NŠş~Áï!»#ì>Š¥­ÒD;òÕ+’.U¬¦´½¡Ñøõ›*6M¢ï0ƒyı-h¾©ÈgeÇ.÷„’Y«®ƒ?BóReX‘¤_qõƒôDšà„ZPW£…Ó%Î$n>d=¡Ä‡ÃêVßSş2ä\\¯/Ì±úŸ\0xA·t—ì=rê.¤„G0ÃkfºgKÆè?±Ã¡’=Tè~’lí¼Ğ¡QÀÿ\0ÈÑ#–ıÈ7l¥e6Ñkˆ\0s Ø“Ğm¿EJ<@\\sÊœi€ßîŸÌú ­‹ÅjVöº%‚Äé§âØˆ>¼úù¬ëªlÃn}œ¾ ,h?ˆ\03¨k7p³3e¹q\"fl·8Úì¦\\ÚƒTìô(^&½&5àŠWğm<[Ÿš\0ìÁÚ\r0A2èüD¿&:wB!YÄõµÕi@æ®I+zZPå¤æ\Zœ^£iM¨Ò€¨Ç½ÍÓ#¦Üm6C=¤ÄÑ—\\;ò’“J·^´ÓsuøNˆ24Ş*Ğqå§cŸº§QÀ4uÖe–¸¦æix&\0ÒA—@ˆî³µ¢Æö@Ç(éÌÙ7Y\"ÊL!ñ¶v$J\r6 	èõçä´y|ºò±¹½x¨vóÑj²ÜP÷pL EÏú@;ÚÌyĞæ2Í\'©éä°˜Š¢H¸^™Qk¤Ìm~noĞş«=šä¥Ï\Z@¿Işßçtö_Ú#H€NÛ-n#7ş wâs¨FÂæ%e2ÏdÈp÷›Xöß•¶ÊtS\Z\0æ#ëİÜ¯*Òì‡æ˜0\0™Ÿ •e˜v\\æ|¼t<ú ÔÓ¨ğßv‰Õ1TP¡8éwdg66mÿ\0(A½Ÿ¬Ïvu8k°=vŸ-®Œf%¬ÒIµ§íú œÓ5Ú@Õ˜ê&‚±¸ÊZ	ä v‘o’Øûc‹`\0R\"xïûÊÆ<ö‚³Ô.R=Dë @W$…È=KÜ©4)áKIˆ*2šœ1Zm0‚»—ÜJ°ØVh€€f+Ö1Ît@uåÙ–(½äğM–¿Û|È–CL6cÌƒxòXG9êVjZBşJ½:¶ÊJ5  ·R´ºQÜ¿2kfLÿ\0õã¤,ÅG‰•\rj†Æl€õ\\÷K¯i\'Ôqê–¯´,÷$xä6Yÿ\0v\\Sÿ\0¡$Ù¨5ìö„É´ÈÇ{ÿ\0.—/ÎCª°z\r½P<¿,&`½å¡ø\\:ôû ÙeXÁPí\"ßªÄû_‹ÿ\0‘Ì\0·¨E2—Š- ˜kDÑr°øüY¨÷¼ş\"J	hâK63×å²´s§Àü=oè‚ÊRä±’ó\'…V«Óu&”\rrh	II(9¡rí+zÄ©i”Út“ªA(¨†¶!ÅcaSÂ÷¶I;0Ê¹ŸÖ4°¥Àç7qöMÂe-h×^ oøş§`‚ç5w9¬û­ï}\'b´„Ìn9ÏkA2°şªAY¯I ‘7èªƒ…—í	¤¦¼tAd¹HÊ€ˆî©R©ÕH× ?–È•´É°´cÄĞW˜²¼EÑ¬»:-0òc²RÃa¨7f´(1Œi\",s¹}c‰W)æ®ªğÉğî}=¦¨@k\r–¶»\\jÌT°\r7w>g„5ö!íEÚÿ\0ÄÙßº/–æ\Z2`_`\'§ÒŞH‘Å]¯&|^ZbİPy~+\0úF*5Í=Âª\\½x×¥Tı0n\Zè\'½×B±^Íá±\Zƒ œÛêPyœ®•£Ì}«OW»sjGÎÚvYÊôÜÃ¥À´º)¡)rIAÓ“bR öš•\0Bñø°¦2S0yi¬ét†ugªØ|%LCá–høœvQ”eM¤<%¥Å²\\á<ïx·<)½ó\ZÍ\Z˜ÉDD4º1mW°Ã\\»Fí¶Ö@UÔÛ.qn§›Vó€mÄşkÎ½¢ÅTmSX6šáÁÔsô[V0†	—â\0À#é½ã¸@1Şê£.“¹·Å0ß!Çtëh¬×Ô`\0’i\"Ç—\0.Š”õäÛø:.ÄĞ4©¦Z	ëk‘\"øg²³5KÅ´Æü_é×dÚ”Ó^;#™†\r‚Lôú	˜ìzò†âèÁ1% Øì‚ˆiR>™šÄ\rk”´Û$©†;¢>Íáµ×kcõ@K—¶Ï? 4ª¾ÏU>ôÃo93÷ôDıºğS§O€IG÷N6[}ÿ\0÷¬‚¨sôâÑÚWeµK<$ÙÆçñ7;L?\rh—S#N‘\0]ÖÜ‘ç\'ÕOâ,‡º\ZyhÕ ‰vi”k´j-‹ê.›ƒğ“qµ¼ÕœCÜÇ´45â\0˜¹ÜAUpï ‘³ûm2<ÄÛtÜKƒî\\v‹ô\Z:DğÖ¨³›p\\~bÛ¦ãè2´ŒE cg{ùp„¿0÷nÄwm¸”nµFû²\\H´Óäƒ#›ûUÌşo¡ådkQs	kÁ ¯R¢N&‡vÜö·({Új˜/.qÒ:„Æ.Iê‘§ä¹CŞßyPØ–‹¾{\"î©¢4Ëd:\03ck%«M¥®5îé‡tR„İàŠmo‰¿Ü\0w2H™@¸×k~Ø›\\ğ<LÏEFSÔÃ.\r$ 6÷\Zb#²²ÏzÒj‚Ñhp¨4¶6˜·r«â)k~ªBÒ 	pC¹ÚöA|ÒÕ/ÔZØ-1:³»t(EvøÀÓLlíúD›ö\'k©h±ÎÔÃg4RcU»l`Á§5¡°&`·›ï{»ü Îâ¨ñv­æäÜËì?$2ËßAÁÍ;L´ï•°v_%¾ìH¼w\"L^\ràí´*Ï¤*9Ìw„—çN˜ÓÚâ~Hå˜Êu¼5<7ÕÔíé&=UŒF\r†XKB\'¬ãÓó²à7—R:˜IÛƒ¼|•œ»?ğèª%±¡ënÈüI\"mæA¹·˜°ÛÉNü¡º˜fÚNûÚ8ı\\&¦åÁ¤=¥€D“h±ŞS?ª¹ÖDA“°0nã¹îOXAV–\n@¸h¶âãµû¢¡”\ZZê¬Å¦­\'ĞÏ¢¤1,à’‹‹GoR—1h,o/ø¤–É{o×­¥œÙ´ª—=Òïwf´ÏQñZãióU«dCIŞï@ĞHhH#hÜ@ûªø:à<niÁØlzïÙ?-Ì^Ç{»hÒ9ƒ¸;üşH25™R“áÖ#ä|–—\'ÏZğZğ\Zò~+Á°ˆWó|¡•´ºN“\'U¤	ø@²Y†\\êGy\"?‘õ6ÌÄUš\0ø{w~Ÿ%-F˜tÃN¦¸ZÇyâË\'•gwPL‘¥Óv‘ÏÙmòüA«Jşy¾“1ØÛÕ\0 ñy`v©$H´ƒÇÑÃâ\Zö‡I.-ÿ\0Öî\"Å½½S(éÑ¦\r¦ö¿}·ECcféi\rÎüvájµ=Ş‚Œ	‚A–ÚcxT²úáõMåÅ¾|ö>\\)Í&ºœ—4;iÄGŸCÈ*¡sY[I 4;‰Ï´Q¥RÃÂëİ—-^`BĞ†¬óä¹ŠµaR›µ¥¦ñ6Äü&öòBóŒ¹Ì\"£	$ln@‰˜üW¿’{G¤é|@ä¯œAs_ 9ÃQ‚.Òmá\'¯`PÄf.k™}íâ¸ ¸\\÷Üß¢\\Xu:£L–üB]¹ ÉhC1Äé‚£Àñ	\0O™¿egúíl\r?„iõ2æ~è\n³\Z4Ës½À\0öü>pWeï$Ë È.Ôxâw()Ãe·è\"e·²±ƒÄmMÆK@Ñƒ:¦zÇ(5ØšM\Z.u’\\,  ü÷ù %’CŒ\\æ™pLGß¤«æ³ƒZÛ]¤´ş&»ñ6?şªƒØç´ê~±§QàÚöı	è‚\Z˜Væ8|Di‚ºúonãªœdº^trl8ò=Ö­¤ò×\0HÑ»\\O¢n%ÁíS}%‰ƒÔ:–˜W«‡yÒblAØÿ\0:„f–yN£š_OÅ>“Áò¹Sâ]MÔÁxĞFÆE¢xµÖo‚ĞN“¨oÜ]§0c@™09-Ïß•[]Ñ©°ğKw	Ğ¬ö2}2ÚD´ÌÅÿ\0Ëë¨<\r\0¾bäo(#ÆÕÔÇ8´^«¶¶_¬vQ‡\0² qv©¼Æ›M·ŸÉUË+>«HkC‰%¤HàyíöEÛ^ÔÚ¤™&\"ÜDö0bÀi–øI›Á c±âçª‰úoLø²t»¾Î‘²\\[‰÷€€u\\€w<ÄìB¥‡Ä‚àç8’Ø!üÚĞ{q(*âr€$´Æ›Å(şX^\0kˆ\rcĞÌyò:­{[y.Ü˜ˆFÛİNÚDÔm7cC[m¢÷;Zè&¤ñT»b\rù‘pmÒ#ÕGƒ¬\\4Õ:šïın1—Ù:¥Ú¾2ãvaÀÌ±¨5ºZ?¾ÚM„D›„êÕĞÑC{Íà‘ù÷Pã(“UŞÚIägÑe2/3¼™‚ÓÕÇşDÉp‰kDÄ /KË‚–J…3\ZEšĞFı.nwHƒ9LÁº+’æî¦æ‚eº®ÁˆPrú¸JXŠ:©41áÄ†¸î<ÿ\0\rÅ–i„åºfİtşst¹>núRq ÁíÇ’ÒfXfÖaÄR7{&à;â t=8”º8ÃNáºŒê2mºªøšäÃÛ\0ë1Ø@—^ÊküN½äü¬UVV ÕŸŒ»·™¿mÁ ÷°Vrz Ë$‡4˜sŒ	<ˆŸªÎÒ%Í.\'ˆÖ’:”F˜Ô\ZXƒã$ÇhŸtql8hş&ósäl~jOv$Y¤Dˆü2.Ãæø,n£\Z Gá\"àı>ªŞiÉ0à A6ˆàùOÈ £˜átÔptB\"äZ~·Têáİ$é\0i=$@Ÿ©á÷cÂfáäÄÌj:\\|†ãÕG^Ä‘\'“c¤™ìPf18I#Â/ÈIåGW)s|L:„IÅ§íÊ=„­©cÙqpIâğ#}ùMÃ9À·I\"m‡{ß$¬5rÚİïöZÌUv»DŸ$	;èxóYlÕ¾2ámDüåËñ²ÖÇ…Íwáïyƒ¾Åµ(CfocüV—ôUğûLHí\\Ş~İ‘\\Xi’İ :z ôØÉA+7I0@€8;ÂøWÓ4ä×7o ™ IòW1U<EÂ5\0@=¢\'ÏIÔ øšÁÚûæû¢ø<C‹9›ÈØ\r¼]Âà…f‡êqsd2íä„H·`ˆ?IÓ¨[ÎÛØ‚&ÆFû ye––ÉeõD$fŞ‚Ef•v{¡áñÔ2DÉµ÷ºµíÖ«Ü¸YŸÔtUq.†’/¥À‰à´ïe=6ãÓ¤D˜»¼ïÇ!ø—¹Şğ´‡5¶ØzƒÒ~ˆQ‚bÒ\"\näÆc%­Ô×\"ö›n‘t·²iWé€H¹MÄá€Ûºè*7¤­O‹tµ¢L›´ZÖß±PêbA=&t\n|sÒÖ“\"7‚Aİ¼×*$—ÏÄ?´Í–aÀ…±añiÕ«UÈAØôØ¬ÆeOKİy¹úş› m\Z÷ƒyÿ\0HD€dDÖ3FÈ†¤‹Â RÌ‘?„Û»oÔ}Ôøl(¹?¥­ï¨Úc á8¡¢àémÛtW‰n’Aï°´oÍáL[…Yß‘ \rúG)}Ğ4Ş¨¾ffuîáºv5¡Õ<f€Ş×àÏÛÉHĞlßÅ½­ ÛöAN=@¸»nÀµÉ’¤£LX\\“\"\ZzmÑEîœoy\0Ü‚$ÄÚAVêTøš j3$_Å±şÈãğ`5ÌQÚfÑôõCò‡ÅF‚`HŸ×å(óŒ8ÆäÄ‘Óió3>HkD0@<O?¾è	SlHÙ ÜÅ¶#½¡SÄé €@™üıwRĞª*·NÏàõ½ÿ\0!è¢ªğLÆ™éaĞòP^Ëê¶[ª$zD˜ßeŞÏˆÒIÁ¯ÒPÏvd‚A‡aæ¦ÃµÇLGŠÀGN>H-»2>óÄÙûÜ[±¾ó•†f\r7\r‹D´Ï[ƒÕvNˆq¼AŞ.m]YÂâ^HÙºN\'é>¨\nàñ:¥ú›¨s>~fm*&áCšòé\ZoÀé<‘\0&SÂ9®ApØ‹m§VÅµ…­¨@Ô-çßç²´xt¸A?ÜM’$Äâ\\Ç¸xNÇæ ÿÙ','image/jpeg','2013-11-13 00:00:00','A'),(1,1,3,'2013-11-13 00:00:00','ÿØÿà\0JFIF\0\0\0\0\0\0ÿÛ\0„\0	( %!1\"%)+...383,7(-.+\n\n\n\r\Z,$ $,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,ÿÀ\0\0¯!\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0:\0\0\0\0\0!1A\"Qaq2B‘¡R±ÁÑğá#bñ$’r‚ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0ÿÄ\0 \0\0\0\0\0\0\0\0!1AQqaÿÚ\0\0\0?\0îÂ0„\"-\'L d“¤) IÂ`Š\"œ$Oñ(ç2èÆüGöMyXüSÄØl<‡TÃåeÏ¿EæÜoÆ8œK‹Xr3ğ´À®:®gC`æu¦4ï}Ön__^ƒÅ©.(Ó»¤Ÿ \\Æ/ÆXÊ³şë½Ëô…Ï¹ıIõú¢Ã1Ç@c­¿9Pmà15«]ï©$Ÿ¹W1qO6_;”bë\\Àõî¹Êm:4é6ºµ†{,“­İ-\'¤ìV,ïmKÓXq\nÂj8Üß±…v‡‰ëµ¶¨ğïùBÁcäüE²`e3ÿ\0µÔls‰ÊMô\ZOùVDÛºÃøÎ»bK\\ ]Â5ô+sãJo1…³¸¸^}B”0»…íê¦ÃS$-ÎÖ ˜êA*òG®áq´ê	cƒ½\rşŠr¼ŸÄHÎgf	°š.†øª¨#8ÎÓé?_İk—ê;dÊ¶N³e†ûƒ¨õ\nÒÒ„ \"N™I$•š$ hDĞš´*T‘Btà¢€P(¥¡”¥(J)A(á H“.OÇ^#òåR?î;R>Qû¥ºSx»ÆMÃ‡S£©v­gîW‘â¸“ò÷8—Îò–3ç˜¾úÄOÕUe	÷ÖÛJÏõ‚¦âdÜ“¹R=±\ZI™Ş>Ğ…“ ±Ú4î¦§H‹¼Ä\0ádluPF‘ê\'Ú•3¼¼ÚŸ[@ô±TÙQ³.°ëÜŞĞ®ÑªÒ27”Ëtp=Ümè• (SµâÛP§¦ GBu\'C§(UëÖ´f\ZAÖ•>ËËikiĞ&;©a°ùMmåÑİ¤Ş6Er•R\081×d¦ú\n«é4“ÌãÑ Dî€>’•<)?RMû8Âh•z¥rò	¨\0h\0	ßÿ\0 “Öğ®Ôˆ\raÌã¯Ä/\ZÄ,±Båæ#b\0×±:ğ¬Ñ Xè‰iŞAN&Ö°,c×^¦+XjĞâ	hˆm‰:tS¤eù›Ê@€@±Âßeq 8‡Ô€ÙŞIfû‹¦“m*Xß,‡]¦Ç0\"};•Ûğ&ÚÍÛ¶½FÅyíP5Z32=41¥Ä­.ò$¿.PZÆé˜›ë§ı¬Ì¬iè)–â©Ë<Ñ?à÷Z!v—l™(I$\n„’@“$’š„\"jI2tà¢0DS‚ŠSH2Y“¤³& Ìñj.|ŒÑ\rr¼GˆãÜç8Ì’L÷Úë¥ş¡qÁV¶VºÌ° ş§ò\\-g>¿Ïªçî¯£Nc}4·^Óªè›úz+¸§¶Ñ\Z»í¬~J³ˆxşuV]–hT«vÚ#~¿öµ8=úkˆÓ XÖuÏË1~ãİNÜAe@úa¼y†½ÿ\0…K?ï]Ã°à\0Xß‡$“´Ñ>¡gâxKsf£·ÍL™›²ã¦“²Â©ÅQÌx8Îf&¶‹G‹¦ZãV“ImÆPZNº¦§ê¸ñÏöŞñ¡­Ãœ\0¥¹‰øCæl@\"gî¡­‚ªĞ^ğ@\0Éçâ9Il`¸èÊİš˜=ĞO-¦Âñs)¸Ş*³¦“€Êâ/w\ZeíºÔË-öÍ‘˜0N °fÍc\0€\\sH#¼”°”ƒÙ#Î‚C\\öC¯~bÛBµªpÑI¥õ*´ºXØkZÒÌÃçi\"öéc±€/iv„4D‹	®pp24]7¿LzS¡!¤±¤8D4óhæ/6ÓE%(-9¼Öh&O5´RĞk\ZØy:òHpĞuµ•ºt²Áæœ§œ‡|DjÙåmmÕ¥M‚Â<²-|¥Å£`á\nØw†f™ÒXÙ&d™­°x2iMõ€¹ ~\"\']neÒy\\ÛŒ®ĞĞ}à-i £@–\nPNO¦†ãî‡AÅ ’uƒ ^Ù½Vƒ+	s&7™\'{^àwQbkµµIÂ:Ëz…‹Úß§ñ€\rƒHƒ8H&æë°ÂT%£0æİr\\-™\0’ÒÙ6˜ë%tXz„TÔåvÇå;¬c–®šöÒ	á4$»!á(L’	Bd8š\"j	!$É ¢TO(B$	$’@–G‰ñŞF­MiÔØ-uÄU1™p­fï|û4Oì¥E‹ÅLwıÔÔLe.{F~kêØ›,ú¦ÿ\0²‰Çù*ie[Çb\Zê„·H»Xj~ª ÛşÊÎ‡f´½ƒ±Rq\ZÌ!–2!Òƒ]x	²ÌºélÜÚ\ZFùf¹Ôj­å;ïxp·ÈªõëµÏ.hV†‹_b]ş¦ öÈ—	Ë¨.cªµEÄ¬NäŸ[Ûì­²£€&í\'å\0åst±“t©SnpHDDLöÒŒ~@ÒLË@±mõ´w½ÔÙ¥kR\rpæ0AlØ’3htêk`üÆÅ \\3	\"ÙaÀ°	ê–\\çÃe©šÌp—4˜q˜\"LÌk¡Z8luj-ÌÁ\r! ÃL0´ò†—¦dƒ\0×X½ŞšÖ½·1x6ÑÃ´;.5®iÊH}S#Ÿwræ&#E‘Äñub.\0ÅÜÌ¤‘9Z$¢¡Z½Z’j¹îo™ç^Ge-ÌHb(q5s·™î†èÊcœHË}õ%\\eÙºlšSP5„@c\\r˜sš1:Ø6lBÔÃÒ›L\\\rúˆv¾¡rÜ/‰–5Ñ\rÓòà@\r$‰dNŠï\rÇ<¿›(–\Zòç	Ô€	pêé®,WNi9å¹ƒ\\ÑnPàOlÀ}”Õ°%Ç˜¹²! ¯KõY>cÚç5®©P¸Üîk[è9‡Ú\"Æ\0ÖªXêY™òµÕ)´@<÷4ÒËl2_EÌ$¸êö–¸p‡Ñ{Èa9A	®°¬bpB¡‚èÎi*æØ“¹ím•gá)ä-—8æåÎË´»O²çZ&.KH~{´Ú$Ã¬w·ºİ¬]æiÍÍ±ÊFÇo¢Â¡J›jµ®-Ì@«Qôê¼6­»sX¸¶mmÔ.GHè©T–ƒÔ\"•WPÆí9OP{«P»ãw6…)JP”-)¥$”‰¨µPr’dè(€ˆ\0¢`\'„À§”	BiJP(^Uı]­5)3ğ±Ç{’BõY^KıI¤_ŠÜ€Ğ:î¥XóÏ,¸À½§Ù5\Z\\×ØI½–/è\0.2u(*´\Z‡Ëˆ}Vyw¦¸õµŒ-\0†™$äş½,–\'‡9Ï$O3ÛA™ô\0À¾ËC‡´\0ZC®]Íi¼Dõ[tˆh¶İ¯è¸ß%ÆºÌ%cÂŞÖ°ÁÌ3çĞˆa¶’\'M¡C„¤r“š$HmÍöµÿ\0EİáËH}á·$ïíhö\\ßˆ[M…™)1 ¹Àå;ê3E†ö•pò[Óa®Ğa¨@ÊÛÌ‰‰˜ÖJ™­i-d=Ñk8©°y¯]•\\=7ù„ÍHÔ³±2Á‚·x?5\Zç4–&`Şî\0}D­euİfwé_ÁÒƒÚé‰ù-p…¸#—=FüSnjc)->ßöºpŠtËsf‡	Íc=ìV%ÿ\0øşH¸†·/<I%Ì. ;MEÇº˜e7Òå+;‡9[šš$’à D¾Ú}§L8ÃKãLÙ€{D«á5hœ¯¢Ì\\Ù–è’ã7$è4u|?Á”®ç¹å•\ZÂ\ZO3e¼ÁÎ‰;EÆ—Z¹IÛ\Z®R–“7ÂòøĞòê>ËO‚%ÁÒ\0™i4ò“ÿ\0 qëĞ«•8f0£H:­bråÎd;[¿F7KÁé	ø3CXáPEZou7eqe<Ì1“+C[®‘{®˜Ör6pöU¨\"›Zu‚A?ˆæhï¸Zn{)1¡•Ñ-ÉfKÀt<&ÙuÕe7òğ.×ÇÂá$‚v±µ%iâhÔl‡ƒÊë¦Ä_¢éc›–â‚­6|MÉwgcbf~lÆ7ƒ>ê°ÎÖä#v!à3›6—Ş÷[ÜUŸ4–ÄYÍAÙÀ€LÏ[¬œ™N \'38“Øú¢ÆMCÒ³e ’bÃ+D\0Øj{Ymğ,p¥™¯sÜîVêÖ€ ¼¸˜&Gnë8ĞnÍô\"[­ã~ª\Z˜Òç4ºIâfnƒ¤®Vm¸íxKİš¤€$‡±\"\"JÒX|7×V\rĞ[®¤\0LBİ…¯¥¦I<%a’J„BÚ†4\"‰:dè3Â PaD(¥Nå)L’•å~3Å·Ï{^KAt¨ v^¦¼OÇ•‹1µ\Znó	è`¥›YUéåšç“:|\"Di}< uÓ&Âçk,œmg†’NäA\0ˆ\"×+2”3GkHãuo–¶Znthƒñè6ÖToÄSi!„:÷—\0 ìÙ\"ed`1­‡Íàt²ÛÁV¥fÈkNXøyb\";~ëÇN’ì›Çe‚“‰1 9€›$™ì´ğØ†¹¥ÕhD5­{d€Z&g¢vãi4›S3Ğw#k?ugûªUØ\ZæÉÅ#GÚız;Vá¢÷‡Œís‹¥ÀLœğ±ÚÓ¤Ô³`hIµí2°x^2Yn`I´€[˜–¶ÿ\0OºµHS/\'3®KL5˜ƒµ·RÔ‘­Vƒd7˜µßËš${GÙ,/šÖ8Âö\0QiËcs¸fÒÀP¦ÜíÎ`Ş]3­¦&Ú÷Zu<hY†­“Ö\nÏGk˜>f1åÌ“ræÚ`ØD,\"9¹o7z®r­F7#Lfs¦à‘:SÒ®p©#Ëp†‹˜iA#-öøt=V¢V‰ÀP5\rx§æ6¥‰˜Êp,®UÀÒ¨ÑMĞúp%²@qÌ™ÙN²ÙåPÊi™¦ƒÄÍõ˜)ªâ«-Ë´‹\0à˜Vç“Lñ*\\.­9í¨Ç´—ÓœÒÖ4¸hÓÙFúUH{Ih\rtÏÄZ#C=.Tt¸•V½Å´LK[ËdÙ€&n=Õœ_òÄ–M‰w($FƒÕny·Ó<#UùMÄ¹îµ¡’Ãxæq™ƒÜU\r>™æ›„e–æÌÖÌÀCÒ\nÛáüjNvÓˆ-&ÀÀ¹o=¸S‡¨Næp\0´H“q&ı~Šå•I#0S§O/šë8änYt{†é¢*¾\Z£T€ç€H1üÀ›ú«¸ŠTi°± \0Mâ÷ï÷ú,Š˜z.l¸2á¹IkóõH2Øº‰¸w‡\nÌ&¦`ÓÊ6‹û•ÕÊâ|?Dÿ\0pÁ5yC‰*9ÀtwÓP»E×E)J–ƒÊR™$\n&”PI)!Iˆ\0¢„ò„òå)JR”\nWÿ\0Tğ¿ù€ÇÅL8ûYzúàÿ\0©x)êGËQ“ê$~J^ˆòlMlíÖöU\Z$éße=ZòTíÏub¬QqíÁ‘ìV¶­uäóÔ@X´ê˜>×V)»+„ÜHë§èr‹+¤À9$hrº‘9ˆ‘®òÛ•¶i¼h€&LÉpúºÖ¾ëI¦ú‹z\\Ûò+§ÀĞ\roc6Ü×ŞÅy²®Ñ‰ÅU€iµÎqÍh™§POâ{{©1Ú–èÈ›È—9¡ ¸:ItoZXV¶™5Œ÷3{ëuˆ°ï©L±¡·–¹ÚCL^v€5‚’ËÖ‹,íŠ°Ğ]™×ÌXfó‘¤UĞğú®ŒŒÏ³º_\\§Pepü;TT¤Ï)á°Ûp\Z¼ÚGX]øÂ=¦lmadh§’LoIß¶¾Hß ˜Ğ~J\\k^wM\"ê–/)76q$‚àÅÀ\nµZì9Ç4¶€™s@¶7×Mïu#~…f“Ü[uB§§æ·)‘˜1ÄZ$HihĞ_âØÌê©×ªÌí¤çs†€ƒœ\'­µöí/K^k1™&j9°>fœÍprmÜ\r÷Ö)]­\'fˆƒÔ‹\0¹_ÔËL1ÏqÏP\0Æ‹\\ˆÎŞ€‰¾¿E±Cˆ—7àx€CşV‘9ÆÕÀ±‰7è¥şÕ¾Te®{ÿ\03˜»¼Ç©í°ZÇ«Ú_L¾Â\\Á˜Ç1„hÿ\0m>ˆøw–çTÏ.<×ËLt€ün$5¹Zì,AnbÄ†ÏÑi¨üÍµ\"Ø ´æü²ßŞ·õ¸†!\r‰:H7¿s¢Ââ8ğÁ˜pNúÂİãx°×S\ZË\\C[:ÈnbwßmŠåx¥Hiy×/h¬pÅœ«[ÀU¼ÊÏvÍ§\ZEÜë}]Âå|	‡\r¢çñ8ˆøGîJé³.é$£Ì” 4¥G™,È$”AB	D	A4¤ƒ1L‚ˆr0å€U‡\'Ì¢\"2YBP€ó.Ç8rüËD–sé¯ÚVê£i¸ ‚;)¡ó‹Œú¨ŞÏ^»~‹oÄ$á±)€éoBÃ¡ştYu-=¯íúì‚ öß¯§¢&UH›t:•G]/;6ôA³€Ç¶›¤f$™p\'•ÄLØ‰Ùtø?QÊÖ½Çq™­qúÀ¶ÛÃ6¬:CD‘k}Uœ%<Á×,’ã¤F—ĞôõXË	}µ2±Öâ8¥İµ\0-™Ì½„·öWğ5›Q€g°˜µÅÛs¿EÄÔq“0E‰&-·¢>ÄŸJ snİ X}{I€V2ñMtÔÎï·«`(NÚÃ§×OÕi\0şv\\¯ñ*˜kpÙ ˆ9Du‚BİÃâ3+Í”×N“µáQyoAp5-õS»‡±í\0‹:Ä@şZHp‰ÇçÕNé €`ÄN¤t1º±)éQ&Ah–úõ>ª*¸8:\rF¦Ö É0z;]9ÌÀˆÊ\0lî5>¥&Öw(5ÊI9²óƒ66°½½X§i?Ó%à˜s\\ÈmŒÈpqÕÖ‹ìéÚŒE7¹¹ D°:ú°êC­öî£¯K>k¼ÃO•ÄH$Doh”4Ç6o˜€Ù&tÚ:®“(Î‡]´éˆ´Óc¦§ê©Pmhq–ŞCZû6@DzX€:”øòçd†“ÎÒèH‚4è&?ˆ²ƒKê\0r‰œcA;şWSÚ9¿9ùòç´äÍ\Zå¼ÂÜÄúê°±µ3Ö:Ù\0‡\rFªİ*¼ÏqçÚœ·6õÔ+\\†6¥v´X\0s‰Üƒ9£i6^¬cvœåaé´ë–O«®V„¦”ò´¥)JJ)¥$’…CÊ& BI(Ipj Ô@TĞÃSåB1÷\rT²¥ıÀKû€†‹*`Ÿû€„W\nšr^?ğñ®ÁZ˜ÿ\0r˜¿ü™ÓÙy5{\"÷ö_DŠy‡¼”»‡Ãw°|§RGe›>«ÏK†¤&€‘}”µhœ¡Ò\0&\0ôU²¦æ @Æ·¾½Œ1×PuIPeşJpòu\"İ•Ò/t 4’Ìƒ$€“&ã–L_OİWmi¿óÚ.˜´¹ş¡M+N†,Òö¹¢›\0ûÉÑw>ãb«Cj6Ò,×XÅ¶6:YyëàĞ7ü:Øæª½Äù%¦ ÿ\0l¼:D‚İ‰m\Z÷\\óÃ”kªõœsA¸>Ñù«§<¿yÖ7¬\Z:Í­y´ƒ¸ºÛÃÔ17 ¯©¦´Ü7,Nò\\\"\0½¿ÙDYX½‚Yse]²ÚÃ[Êï™´!n,o–Ã}g]?u¬{JŸ	Iq‘°é×¼›¦«ˆØ3I3h\Z¹Ç+E…¤˜\nPğ©Õ­5\Zƒºˆiüæ#ÑoúÅ[uRÖË€Ùvë…â8Ã^ Ô0ÈÊ7Í¥Ïè‡ñB÷aÛLCš9Ü3É\0ëÓÔ¬gÓ†ÆkôwÃ¬eIõë0ƒ \'y\ZÉwş\ZáF…!›ãuİÛ²Ìğ‡òÿ\0½PMØ×j?äGUÖ®úb#ÈŸËFSJËMå©e4«¡–›ËRÊI¡¦‰´Ñ\"jhD”©&‡\Z*¢U0ôAë“²ßš‹ÍUÓçEZóRóU\\égAkÍL+[:QtbJ#ŠØÜœj¦5“fœ·Š<*ÒMZ\r¶®`Û»eÃâÆãb½xâà”±0†Tü@Xÿ\0öÍ8ªŞÒ=ÔdGóóZXÌJ.‡‚:–ŸB¨Ô¾¿UX\0ÿ\0XêÍ!J@¶@ƒ6ı×-¯®ÊÓ‹œ®^Ûûi*‹)ˆëÛÑY¸Ò–ˆPt\\‹ùAÌ&F¬Ó–ëH›^ú.×€qÆVA\0–dÂòÜãCb4ŸMÑ\nÍÌàğAc™b¶Ë^)“S;ÙN½í¸*½Zï$eh#rLn;N“ö\\?	ñeJ™IÌ9\\@€@ù¯ºÖÿ\0T.tŞLL’{.t—n›Ä\ZØ×&Û•G\\¶›²Á¨Zbàß¢ÆÃQsbâ×m¼^Ú•©ÁT¨y]#rE‡©İk~3lc`ğXš®,æ›“mh¾€]ğËXCëCˆ2ÖìSÕipìi\rs;sû\r•àåëÇ=¹t–R•d¥lI)¥¤€¥)B’¤‚R”60ªD\nL’	L†ÜÌŸ™iz§8õXàß6g2~e¨8iêŸı4õSÍ•Ì—2Õÿ\0M=Rÿ\0M=S‰Í•Ì¢{ÊÚÿ\0M=TNáÎêœ›õ”Ä-·ğ×vUjğ§t	Â§8Æ©‹U*ã¡lVá úªø!;}Ó…9F.3\Z!Àv+™Æaš°‘Ø®Â¿‡\\ì,úŞ~Çî˜dÍÊ9?9ÂÒ¤Nÿ\0ºÚ­á*½¾¡Wÿ\0âx¡PµÇ/ÆyFsjúU+^ òí¨›+­ğ®+«~ªÅ/	bºpËñ.sõ˜Çæ¹•špÄ~¡lá<X\rV‹ì?ÊÓ£áµÇ3ÜëösÅ“7É‹˜`=şëk‡ğz¯Ë\ræu£÷]6ƒSoÂĞ?5­C¿Æ}cı/Å>Àé²\rB^zIËşWOF¨\0\0\0¥K\r\nÛ)+f3ÓRÕ–ÕR¨YMLËCD\nÂÊ(¥\ntSÊR™$\nSJI yDÒQ)$’+ÿÙ','image/jpeg','2013-11-13 00:00:00','A'),(1,1,4,'2013-11-13 00:00:00','ÿØÿà\0JFIF\0\0d\0d\0\0ÿÛ\0C\0	\n\n			\n\n		\r\r\nÿÛ\0C	ÿÀ\0°@\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0Y\0\0!	1\"AQ#2Baq$3Rb‘7Cv¡´%48Scru‚&wƒ•µÑÒETUXh’“¦±ÁÂÃáäğÿÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0	ÿÄ\0:\0\0\0\0\0\0\0!1AQa\"2q¡±B‘Ñ#R²Ááğñ$4Cr‚ÿÚ\0\0\0?\0µ0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ŒÙ±kâ¾|ùi:Íï{Ú\"µ¬G™™™üD@0^[¿İ‰ào›9Ş¾ƒã¯¯óš»}G§†qÿ\0òÑl‘ãş`ãñ£½<óyçW…ïÇn÷óE¢³Wª4rÛÌÇ˜Ë3æcÈ6¾Î¾Ş\ZlêçÇ›HóL˜í­£úÄÇÄƒê\0\0\0\0\0\0\0\0Ã»»×YûoÛÎW«48úò–9×Ñâ´í3Úä¶óãÕÓÃi˜­ö3á¤Ì|ÄZdÕİZıİâ{åÉìôW[hq1ÆòÖã2uW+³³¹µš1ìeÃ}‹kE­Ššö¶+äŒ\Zšó”µ)>ûùµ‚â{Êó¼ïc{{Ïu7+ƒ“å¹>—â÷ww0a®,yóeÕÇ{Ş”¬DEfm><DGâ?\0Ï@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ğõï/»Óİ\rÔ\\ÿ\0jWoâv÷0Mëî¬dÇ†×¯˜şcÌGÀ<àw»½UÜ®œÇÈõwVuß5Ô;Ù2ò›œ·RNÆ†Å¦Ö¶8Á©öbqM+ãÌıÛDymk İÎúw?®y~œÖë>æïèkñ—®•9}]ZSkKO%«~\nÓ.jV#İæób|x›Lƒ\"ë®ìKmáê\'Ôû½³6ØÉ¥^ä0ß&Çˆ·³rûY°xÇy™¬ßL—™öş$çk»Á×İÖ˜vº¹œ§mô¶÷o›5xŞ_{¾9´Ûíûi\\ù-HÙzfŸğÍ½ß2lìŸ¯WS‡Ë~âl[¬8N3¿ëyŞ7Ùtş÷ı\\eÛÓ™ãö/>\'û»ş‡j|Ek©’Öˆš=×İÜş•Ğë~ßõ&;Árxã.®îO}/ÌOó[DüZ–ˆµf&&\"b`\0\0\0\0\0\0\0\"·Ô{¹}mÚîÁêsılQÊO;,ÎKV#5µ6·+›Å¿36®‘fÔ¬|yó}(}8º3Ô§Ş‰î~û™Ô¼ö=\'cNq¼VjêkğúysäÉãİ—ÜË—îÛ%ægû¿7˜ˆÉX‹HY\'@ôW	Û~ˆà;}ÓUÏ^\'¦¸İn\'F3åœ¹#uÇOu§üSí¬|ÿ\0êÀ;ğ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0p9ŞO¨¸NC§ùéy=\\Úyı–ño·’“KxŸâ|L‚\"iı\'}%ñÕ½8í~µÕ®JŞ—Œ=Iš‘jŞ³KDø˜šÚÕŸë1?+Ô÷ÓÃÒon}.õ¯-Ñİ²Ëƒ¨ø^\"Ù8SûGk.æMß}c\rm“Ùy½íZxöxñoˆ‰ñ0;éùÙÎÚ÷÷ÕÎnîÿ\0Gá¯‹Gä©ÀjäÍƒZ6ğŞÜıÓ“íR-’}³™¤E¦Ñæ,Ó½ŸGOOİsMK´œ×-ÛŞRñkS^··!ÆÚÓóó‹-¾í<Ïıœ¾ÚÇâ³â +«}>zÕô“cª:c¤µ9Şƒ¦†]n¥ÅÆomr=?Íaµ/ùy\r^™±ùÅh÷ÛÄR³4½càç ¾úqşŸ58®­ê®o¦;wÜ~£¾¥:‹‹Úµøş+“Ç[ñÛšÙvsÚúó1ä¦l¿o=\"Ùm[^éÁp=CÅu.¦MÎ\'f2WÆM\\ÔŸ‹bËIñjÚ?ğ˜˜ó­«jÌÖÕ™Ì\0\0\0\0\0yıaúÿ\0Œé>ßt_½k[?5^r4±×_İ›ô¸õ¦ÓæbkÇ»’}Ñæ<ø‰‰ó\0˜Şœ:V:Ó÷mºGíÍ/Äô§«–\'Ï™Ë]\\rgÏó7÷Oüÿ\0€l`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0‹êEÔœ—KzGê~SˆÔ¾Æå9N\nø©[û~qrº¹§ÏÄüLbšÏñâÓ3ñ$+ûéEÁõ_z¾ê^óqÜOÛát«»„}Ïuµrr1±“gâ=Ñÿ\0GËY·ˆùöü|üÏñ“<Øí‡5+|w¬ÖÕ´y‹Dşbcù€RŸÔ£Ò—!Ø.âèÛ´yöxîİ÷oz“~yÅÇéó­æ¾~İi1šoŠmşœÕ¯ŠTé‡Ş¾£ágí_uº£cO“é^K[¤7¸¾G¯|{’Øxü‘—Ïí´_MÄÄÄÄqÕ¬×ÄûÂË€UÔSÓÄåçú¿¨ø¾Œ×ÿ\0­İä·1êàÇüşì™&+‰üÏğõÕßQïHİõû‹»ÊjÖñKîq\\öÖ¥fmôŠâû6üùı··ãúÌD†ßèøö·¹»×âzCªc/)Z›¶â÷´ö8íøÖ·øs~—k<ßoÏÇ¿Ùíóæ<ù\0ÎÀ\0ƒõ~èK¸}UĞ8ğnÚš;:ZVÃş<ÜÎŞ\\T˜™ŸŸmüÏ‰üGŸãÀYÖu°ãÖ×Å\\x±R)•ZÄxˆôˆĞ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0aú„ôÏ×–áú“ÖÉŸPuF®¦:Ò\"½®¶Öjy‰üÇ»|¯ñù€€_E>{œÇê¬zK%l|>çIß˜ÚÕŒXæ3mjí`Ã‚ói¬Ş¾ÊolÇŠÌDûş|øs`Aúäì,zŠôÛÕ]£§÷ùı,?Û=?í9#‘Ö‰¶:R‰É_¹‡ÏôË ¨Şİ÷Ï¸}Wê.½ÊìçOãåºË©ú=º«ŒÏ\"–ä´5/“.İ=õµg?İãõ·ñÌÖÑú‹V³óä‡Ú½Òî—l:O¹<}iLQÂéòÕ¥gÌcûøk’işõ›MgıbA¯=]z¤éIİ§Úëîwùm»ÎŸÄEı·ßÜšÌÅfcæ¸«î½ÿ\0ˆø6µbBš=Gz¸êî¿çô9­~~ÜÇ=›C/Pì_òhMü^58İjÚøxÌUñ}³}›ÿ\0ç²Vføjÿ\0p4ú›¸}8:Ëº\\#–qÖõº\\ŸYîRÖ§ìñ‹‡Ç—;ù¬Ec%\"\"b\"cÄO€ÔÛ=yİÌ<ÿ\0LsZ=ÄŞêşÛëÆïÿ\0¹NG6\r~3ÄûñÓölèáñâ/jf­šı¯ˆ‘zCú˜s[}GÅö{ÕŸN‘æ«L½9ÕS5®ö³?f¹ïì˜ŸğWf“4´Ç‹ûf-{ƒPz›õCÛ/Jİ“­{…¿7ÚÙ®L|7‚ßô®Sb±öñÇùkêûòOí¤L~fk[õß|;§ê+Ô§H÷_º±›W71Êñ“ÂjÆµ±jããqò¦<zÓ1ûñS/ê+ïóiœ‘—Ìû½ÑèŒ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0›×G9ÿ\0ôÿ\0j÷òxı={‡†Û3ÊeŸ?‰ó\\?F]ÌÚ¾¬¹l¢¾İÎŠä0äó>ØÚÓ¿Çúù¥õ‚íÀ\0v;³Ó]wéó¹ü¯vú/—sõÏYtÏ8\"#>¥´òWÅ-=±Ã¿ZÇûßoúXõfn¢ôMÑ´ŞË3~c’ã-—$ÄwM¼·§Ïô®<”¯ÿ\0:\nºõÿ\0êS[Ô‡¨ªó9§˜¯Cpkáu~ÔaÉ—Ÿeònb÷ù~ÄÍï[M|}¸ÁçÏKé…è£ñôŞOR½Ğèm|Û]K|—é•Å]œ|o6ı›6Œ•~\\‘ñKÍcû¸‹ÇıoÀY6¾¶¾¦\ZkjàÇ‡8ñLxë­cúDGÄQú›ôÁÛT=¿Üèş³ãñkò•Á–¼?;‹NßÕ˜‹Òßls?Å3½|ÇÄø´úí¯u}5c§§ïtNg\r»ò½=Ôx5­\\Ùõ¯>ÎÆ;SîáÉ5ıØóÖÙ1ÌG¶qş,eè³½¹ïgaøn[¶y¹Iã¸\Zâá6uù·Í›KfšØs_V2äŸ¹š˜c=1W%üÚñÌÚÿ\0ã°S§¯Øwç£ıKìô‡wz÷˜êÚòÛ7Øéngšä?¸ÉÇììZiZÍæ1kE/kVøëÇI¯˜ˆ¤ÖA(>˜ş‡;iÜmÔ×Wnòü¾¯\r±†œ7»ZaÅı©­x¾]‰®;ŞoƒY­1VÖ‰¼â½ïH‹VÄ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0õ…ë>S£;!ÑÜe1^÷êÌµˆÉ|ZüNş·ÿ\0;Ÿ‰˜ „HL™)ëB´½«:{“­â\'ÄZ=”ŸıcÌDÿ\0Êz@\0?>³{ÑÒ=w¯£Ñ½³‡kÛÖ½gÖ®ZRÑövy.[,a×÷Mköêëà¼Ú\"cÎh?¶bvú[ä9ßKÿ\0K¬ë^áã®®M­^C•áµ¾÷÷ÎCz5¿œs“.Z_Çæ)’-ü‚¶=öÛîçª^Ût5Ç×{ßç1ìojÚêljëVÛ±Ú?ìÛE¿ÒdqãÇ‡pá¥i•ŠÖµXÄDØ\0¦ï­¥2Ç~:%©µn‘ñ[xŸlÚ73ùˆÿ\0__?ï\0ÚCŞVùúg»-0íS×\r³6É—İŠù²×r¶šWÛÙöaÅm3â\'ÌDÄ@K[>’z_Õ§j2ôöîl<wTpUÍ»ÓœµãÄklM?v,³ãÏØËí¬_ÇÌ{kx‰šDHC¤/\\géî¬ÜíÕwåøÎkŠäyo‡ËJÍ¸.SG>®¿ƒ--5Í¯µ‹g‹x¯îÃí>ÉµÂÕ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0	>¯!Äu¤Ş¡Ş¥ÿ\0YÓç»£jŞb\"ùr~ñhüLM3[óüÄ\rı8L{~«©ÉÓ~±³ÇğòêN+{¾ÏŒ4ûïÄ~üµâAwàWú›îçØ¾Âõ·t7¶ëƒ/ÄçıM¼N]ì•ûz¸ãımšøããñgø,ö›Ñ§Qõç9Û~ÕuWMjt¿%ÔymÔüÿ\0/Ÿ¶NCG€Éltë}olbÖœùrZ˜ii¶l™rVmé÷şúŠöªõ½\nçÃÃéV¶áùn¡ê])ˆÿ\0£ı¼˜i†–ñov-[dÔÇ™Ã§f¾&A\0şš—Ñ·zW¯/ŸˆËîßĞÓÅ¹†ÔšoìéäÃŠ“ñ8í“ß‰ñ33jGæı\0\0×õœëş¬{íÑ´éÈıw/Ò¼NJò‚=öÌ”¶-ó7Šc¥üòjÿ\0>A2ş–}1ƒOÓ­:ßCcé¯ø’úXqÄVi~G–\r[nd¯â-“f›Sê{->mkL„ÉB}#µú?§{Ñ¹ÎäÍ[©::¦òpöÍHÍÇá×şÌÜ×Ÿµâ/¿·~–·â-­Jø‰Ÿ·°\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Zç®ıCö_¶=K=!×İ}¡Ârµã±ò÷Ãµ,W•ò_sß$ViL~üY\"mkDG¶|øFú‰z†ì7w½\Zõn—n»±ÓK›%ÄÎ}>7–ÁmÊã®ş/uã\r­<KEf?ŸÄLÀk¥\rÄuï©.şú‚é®;oK§¶öóépøö©Zd®\rıü›qÑYšÅé_º\"Ó6?Z00î÷ã´=‡àmÔ}Úëî+§u}³lXö2û¶6|—\nyËš~?¬‚ª=UúïO¨Î»è~³à{gÉß¢8îVw:K£ºƒKìãê\r¨ˆ®®ÔkFO¿ÉZmkMëŸg?g¾bù2X&¢oJÓèHå;ÅêO¬3rıÖ<–>w¯Û½pf¦+ãÁ9b?½¶\ZåÉöñRk‡ßÌEíLVÆ¯­ºKˆëşŒçº¨){ñ}GÆmqµÇom§_c±dˆŸâ}·ŸyúõÑıĞíÏy:õÎ¯	Ô};­ÃêâßÓÏ8¿¶)­­]}~[Z¿ç%ui|ÉŸfY´O‰óqèûêÚnôñügC÷sDõÎ-jbË³Èg¦>3”ÍXˆµñgŸŠ÷˜÷}«Ä|ÛÛ[\\“|°×gj_\ré®JÚ&¶¬Ç˜´OâcÇò}ë7ê7ÚÏN}7·ÓıÍq}_ÜM¬wÅ©ÇéìW>·y‰½¹zLÅ}³ób}öŸá¬ûà*ßÒc{ëCÔÍ7ù{—¶;ßñWu%2Ú›©÷=ÿ\0³,xögËxöcñó_İh‰®9ˆşà¸>¦8]›éş7ÅñZØ´´µ0R)‹uŠS\"?­b\"#ú@:ÎâğûCÛî§à59Iãsò|6î-ØÉ8çZù0^‘–-5öÌû¼ÇãÀ)Óé%Ó»:¬+Ô\\¯³W{‰çøİäÃo;šÓ¥|ÕûQÿ\0W1‹f¿ˆ÷LGàZ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0®>¥Ù½Bcï/S_´Õ{z[İÀğ<§5ÀS<æÇ©›o•´êÍqÄÎLy²_ÅüGˆû¬ÌMâd /Oö¯W‡ÕÇƒÔk»»Ó˜>qiòÜWJ×#Í¦·ÕØÅ‹ïÛİiŸê+>ßãÄ@\Z¼î—iz“·§¿Rİs“\'³ŞNŠÚáù\nVf#ş¢›3L÷ñiˆ§Şñ3ñæ\"|ƒr÷[½¾µúC\'	Ñİ?Şÿ\0îìs|}¶§_šà?²wfèıÚö×ÛÙË–ŸŸ7›c˜ñãÇôÇ°>›ıRw7“ã9œìN^©3ÍróÊîû{Z¹¢Ö‰¾\r»N<“j[ô×É[DGÜ¯¹!gı†ô£ÛşÇmlõnmşW­;ƒÊR+ËuŸQç®KgÌ~êcµ¼ıŒ>|øÇOãÄZ×ñ\rØ\05¨ïMê\'¦pjs¼gN¡á~î~–Şâ°rÒÍzMm\\˜3ÖÔÍ†ññ|vş•½&™)L•\nœïç _Rºævz“¦^–êı/eñN^‹Ï¿—K,L|f>™«µ4~»şâ?Ë~d47Gö[Ôç%±«Ñ›½ºïV§Klç¬rZ¼GLò;oZmrôÔŸe2ÌDùŠÚÕ‰Ÿ6È6‡Mı4»ıÜNµäx~‰èn°â:z›8qès=kÃâá½Ø&#îåÏ†sß%=³?¶¸«šÖøóıÑP·ïI^–ú7Òojğvÿ\0¦³Ï#Èìåıg7ÌdÅòòS<ûcÏ·#öÒgÄG™™µ­i\rØÆLxóc¶Ô­ñŞ³[VÑæ-ù‰æQ\\oRô/¤Ÿ^½	£ÓØ)ÃvÃ©yŞ[VûWŒ1Å_Å~3wS,Ç÷xéƒ{N“jùˆÇ\\U‹|DZİqäÇ›sa½oõ‹VÕŸ1hŸÄÄÿ\00Ø\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:k¤ú[¨âiÔ]3År•˜ˆ˜İÓÇ&#ñ¾\'úÈ?1ÑÑ:Y8îŒé>€ÔË“îß£‹WïãÇºk±>?ŸAÜ€\0\0\0\0\0\0\0+—×¯¤ş¼ä»µ^öv¯çù*ìqñ—?\r¥Àkóz™w}õ¦Õg[5rW\rö0×^k³“ßIË5÷E¤#,t—®®×q:œ§7ÔçÇV+[qœ×ÔÕ‰‰÷F\nã½éX÷xüR‘âgñãä6¿h:êCÔœï»ŞNè÷wˆã0rúÙ÷¸­\r;Æ|ú¸òÄäÇ;¶<t÷Ö&#Í­_İû£ãÀ-t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\07ÔÈèæø.šê®±â8[©ö¿GÃimíÓmìŞ<û1RgÍ§ñÌÖ?6ˆÉ\0\0\0\0\0\0\0©ßÑòÈ·hxî¿âw:¿<—ÍÅêæû×ÁjE¦Ø²Ş‘4Å›ÛKÚ0ŞÑ’köŠÍii€Î€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0×qºó…íDrıwÔØË§ÄàûŸc[¿>ÖkZ)‡_\rÍ—.[ãÇJÿ\07½cù.z¤èßXŸ¨>c¿]uÂêñœÿ\0Gmñ|ç\\ŒlâÑ­ï÷8î3WDeÍŸM}Ÿ|R-8³fó­\\·©è£İêş‡éş«äø\\¼Fß1ÅêïlqùrW%µreÅ[ÛÚ¿öÌÌy‰ñäø\0\0\0\0\0£«øî éNkã9]Î/s‘ãö55÷´óÆúÙ2cµk—I¥â—¬ÌL[Ùo>Ùñàzº‹7r=<u†§Tãê|œ_toTÓ_˜éÈÕÉŠúû:¶¾]]­Œ¿àŞ®jÛ7ŒŸ3jÍüø­é7ûìÿ\0t:w½=¯ééô¦h¿Ô¼~-ìUól7˜ñ“\r¼ŸH¾;Ş¤ƒ1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ë“Ô¯uº¼=Ãên…ïGSñ?Îêğ?ÆuÎ†==ltĞÔ¾l¹ø\\•¶|şì÷Ïã,Vió5™¯³÷†•â=wzÍën?¨zº=N`é7Ğ®\\µåcûûûÓ~Ş®¦¶\r:ŞöËj[ÄÆ?·Š>rå5›ÓöO›ê>¥ìÏAuWíÓkåzc‹İå3Ób®]¼º˜ïšñJÄEbokO¶\"\"<øñ\0ÍÀç9Î¦8mî¢ê.SWâøÜÚÜÜÚËğàÃH›Z÷µ¾+Xˆ™™C~à}Z=6ô%õ²ãé^ãszÖŸÑrZœ&-}m¼Q5ó—êóaÉzMmæ¶ö{møó3${êµş¤zp»UÏO!Ç[,ëìáÍílélDDÛ|sóKÄLOæk115›DÄƒc\0\0\0\0\0\0\0\0\0\0\0\0\0\n3îW­Nıt/Æu÷C÷çªö7:¯sg•ÜÖ¯Zñ|ß«­l¶škaã§YĞ´RÔnjGâ·ñ3Üö§ÖW¬¾¤ê.ê\rßRÚ4Òê>±ã¸n?¦¶ë£µÈïàÍ·òÚø°kuŠ‘>Ù¾O³7›yÅâ}¡v`îOsz´¿×İÈêM^‚ãkYÏ·±îŸİiñZR•‰¶KÚgÅiX›Lş\"Az³êíéÇ£z“Nó]	Üü’kkìfáuğE1LÍc$âÉ³\\ÑkøšE¼|ÄOÄHKşŞ÷£;­ÑœWp{}Ïës]?Í`ıF–î1\\•ó5˜˜´E©jÚ-[VÑ­«11\0ÈÀ\0\0\0\0\0\0\0\0FUZı{Ünãôoi{sÈèimp\\nÿ\0_mìò#W_oZøµ¸¬¹<Äû«‹g>]¿gâÓ£XŸÏÀE¯@İ×Ş¬úÛ«»©ês¨©Ö¼OM\r)Á–ºØ³rÛºZ™o3m?·piâÁ¯“Å#õ9éjOÜËîD_ÏuÒÜF×?Ô¼Æ—Æicœ»;›™ë‡\ZGæÖ½¦\"#ıä¿¨>¥ŞŠzs•ÅÄl÷«Ss&YˆœÜ¹·ƒŸæÙqâšÿ\0á2\r‹ÛV›;·»‹í÷yúc•ßÍ8ô¿Y6oçñ‹/¶ó?éäl^K’ã¸m\rW˜ä5´tµ1Î\\û;9k‹*GÌÚ×´ÄV#úÌ‚÷êËé#¡¹|¼/ÈuG[fÁf\\½5ÅÓ6\ZÏÏ™Œ›pÖõ‰ñi6‰ó<ÇÊª)ßTè™jÅÛóİµLÕ>Q¯ÑüíïÕ›Ò?\\òØøn_‘ê~‰ËšñN¥âé‹\r¦|x™É¯—5i_>cÍæ±\'ÌÄ=Š¢¨Ö¶nX«»v™‰ó>©yÀuÕ|V{¦9Í[Ú¯»ŞÅ3áÉ÷oI˜Ÿü^¥»Uÿ\0ÖÒß#ÔÛı%ß^Şğ7İæyŒ}+Ìêëb‹eÚµ¢×ÒËüßÍo†güV÷`¤!ıú(÷Ÿg‘éş·ì/+µ7&>£áëkÌÍpå˜ÅµHòÒ¹#¢#üÙ¯?ÏÈYø\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ò}eè³ÒÏpz—–ë³ì¯Êó\\æ_¿¿»2ıÌÙ=±_w˜¼{gÄGÍ||üş~Aç#6\nbÃƒ-v±d¶jÍ­ïv/˜ño1æ|yø™ø˜üOÀ=<vŸÿ\0%ÿ\0£üwşÍŒX!ÏÕ‹§:¯¨=sÙzc&÷ÚâyMG•Á«6şÿ\0F—šŞ2V\'÷c¥ï‹,ù‰ˆûQiñíóGœ]­Ëğ–éüIÔÏ~Ok•ŠÛõu×ŠÖ–Çû²E\'|û¢µ¬^m?™j?EN•ç´xşíu~¥3ÿ\0Áü–ïÆq›ğ}›ngÕ®y¾O·î¼Rßo>)¼Eíì\"gÛğp\0\0\0\0\0\0\0\0\0\0\0\0\0 §¬ÏE–:ÒÏr:·£{+Àq<ÏÄ_sK{^2Æ\\c-f-[Mÿ\0ÖcÇãÇÇ\0©ÏJøi¯ê¯³XñíbØ‰ëÎš¿¿»ÄM·õí4ıÑî¬ÌÖ~<y¬ø™!é8\0VÖë§:¯w·´ên?.õº{Œåwõ¹<8æÓ¯9±b\\¹\"\'ÄZ+‹fµ´Çşrb&=Ş$*·^º|÷¡úî/S‡ã8Z_ç%¡¯lÛ;7É6½-’™3Dd¼ÌE#Ûì¬Wóø™ºÏ¤gLõgOúH¦÷SiÎ®·Pu&ÿ\0/Âá˜˜öè^˜qÄÄOÌVrâÏjùüÖÕŸ3äXßq{‡Ñ½§è®[¸Àç0q	¯;›y¦|R¾b+ZÄ|Úö´Öµ¬DÚÖ´DDÌÄ”û÷õ1ëÎów7oj#ªx¾ÙëE°ñı1Âõ\r¸lÛ•‰øË½³†—É“ßù¶*Zµ¬{b¶ó{„YçzÇ[¨z—ëM|›½1³\'‰Ôãv66ã\r£óYØÙÙ¶zDù›MüßÍ­o¬|@Hÿ\0OßQNúö›¥ù¬Ÿy:ƒ˜ät1bÉÁñI­Ï»}¹5óeµ«·¯jÖbØí,ÓöÍ-Hƒô¥êc£ıTv“î7M[®ı|jó|WÜ÷dã·«7Ç?ÌÒÅKxıÕ˜üLL@n@\0\0\0K¿U~öõ$úŒë.Ûtşm¬ô8~ÕŞÚÖ¼Òø°b¦ÖÌá™¯ù2_•Å6™˜ó8ñÇÌx•zì„z~ôËÑ}·§9œÚÚÜÜM|_õû?Şd¥ÿ\0×M0ùş˜ ¬º»§ú¤ù~·ê¾Bš<?¥—wbÿ\0ŒxqÖmiÿ\0Yñù™ñ\0¥ìwSº»:Ïc«úã™Şá;g£¹xéşÁ“Û[c­¼Eïñl“âÉ>|LÌSÄCÍó¸ÀÏƒg}|úGõnNÎ{-¹´ôFg™LÑ†×tFê«ÒwïåO-xÎı4âûqİŸí«\Zx:/ÉHlÛ>/»{GúÚŞeˆ\\Íq—jïUr}\'O£¢ğ›³X+>\r¼¹éŠ¦~3V³>²Ç:›Ó§oùŒ7ÍÁkfày\nÇ»}\\–šRñó4™ş¿ÒbU¸] ÆaêöêïSÒ^,o>ì‡gskU}–ßsMÕQº\"|é÷f:î‰Óœ% ÿ\0[İÀè>ãjú`õ7Ôø·´öpEzk©w¶\"ob³4ÃŸ=ç÷ã½bk[^}Õµb³3Üã·µâÚõ’å}©ÙŒnÉæeøİ&xÓTpª™á1Ó„ÄÄğ˜ç\ZLêP]ñêÿ\0[½Êæ>ç;Éq]Ÿé½Ûhñ<F¶YÇ¶JO‹lfšÏ‹Í¦<ÇŸ>ÊÚ\"<OºfÕç€ÒÍŸ~~_ÕŸvaÙµWŞÌs-cLé\ZÄ×<÷ò¦8LÆùÚÆ’øğİ9Àtö•8î‡ÔÓ×Ç\"˜°Äyÿ\0YŸÌÏúË»~åú»÷*™Ÿ7W`2¼Wb0Ø;TÑDpŠb\">Oç1Ó}=Ô:–Ñçx]=ì\\¸«>?Ú1?ë¬EÛwíÕ1>O3«šYœ>6Õ7(UDL|Ø¯j;¯Ü¿AİÄÃÖİÈmó²å6é‹›éì»4öZ~f±?Ë_ŸfHùŸ[y‰–w“gQˆ³wu_êåÒ{3¯ef¬Ë=ì,Ï	ãDÏ´ëº\'xÍÛô—Tğ}qÒüGYtÎõ78sK!¥±Ió0å¤^–ÿ\0Âa5õEÒ›ıcØ·ã¸[Î>kG‹¿5Âå¯Å±rš3zw‰ş<l`Åóı<‚¼»Óü¿i~¥İ/×:±ÒİŞŞ/wcŠÍ=v8ı¯Ôqñ¹“ô¹qü}»lÓ«õ­©\\´óXˆ¬È[\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ËWSàÕÕêKSSbÇƒs>*Ö\'ãÄd´Gé#ş@ôÕÚü–toşñßû60e`ùçÁ‡kMmœ4Ë‡-gLy+­ë1âk1?À43èwÒ\'?ÈdäùO=÷òù›Î·]jLù™™öbö×Ï™üøò\r³Ò=Ò]Óú½)Ğı3Æp6fºún­5ğbó>fb”ˆ3333ù™™™ó2ä\0\0\0\0\0\0\0\0\0\0\0\0\0i[ºøv}\"ww|qzÇIr\"\'şÕqM«?ò˜‰ÿ\0(wÒ•©oU=›œtš×ş?éß3çÿ\0Â8?zQ\0wàú£‰Ùà:›…Ğåø½Ú}½-íjlkç§Ÿ>Ûã¼Mmb>&?€i{zô}}ÿ\0í)ôïÑwßöÇ‹Ìò(Ÿgôöøÿ\0@nî7ã¸n?[ˆâ45´tt±S_[[[qbÃŠ±ZR•ˆŠÖ\"\"\"\"\"\" WÖÛ/;³]¾®¯#±‹‰ËÔ™©»­KÄcÍ›ôÖ¶^?35Šæñü~éóóà_ÒãÑa»Ú÷¿º1«yMŞSgGOCó:ZxğMcİö¢|e½¦gÌßÌDxˆ¬|Ì…œt§Dt_Añ±Ãt7Hp;¡<jñ<~-L1ãñû1Vµøÿ\0`V¯ÕÓÓ@ëlô·~#[ûO6¾ÿ\0Ììñœ|_îoF¶\\üe²Ò?nLÔ¾™gæµÉ~}±Y¹ô±ï/+ÚïV=?Óuäo‹‚ëè¿ÉëÍ§Ù“,Ò×Ô¿·ñï®x¥bß˜®\\‘âŸ!}\0\0\0\0ù¾µÿ\0zôê*q¿¤ÍÆw/¯4:rk’³{ÛŒ§+«4ÍKDx¬û4°Í§ÏŸ˜ˆ·ÌÀ_À+ÿ\0êßÜ¾F½Ñ>ºs’¶¶÷q9o½ÉF<\'û?Zb}¶Ï¶ÙmK¯Ù˜şªl^\"0–*¿?†?Âó³¹={AšØËh<J¢&zG\Z§Ò\"ex+K‚â´ø^7cÕÑÃL«ãüµgıgóÿ\06«»r«ÕÍÊç|ïwÖg.Ã[ÂaãJ(ˆ¦#¤DiZ`=t=[ÑœGVée¦Ö®½7ã[6¾¦õ°×&M_¹Y¬Í|ÿ\0¿ãÿ\0à©Ãb®aª\'ÙÖ&c]Ó¤ë½aÎò.wjbí1bš©¢¾ìMTwã»3N±ş_®‰é=>ˆé}˜ÑÍlØô©19m\'%íiµ­1üy™yŒÅUŒ¿UúøËİœÈìlŞYg,ÃÎ´Û53333>³3.ñN¾€éúÇ€ÁÕ=+ËtşÇˆ®ö®Lu´ÇøoãÍmÿ\0+DJ~üá¯Ñv11+6}•ÛÎ²Ëù}Ş)ªzk§ã¾cé!×|¯XzHÃÁr¸½¶è¢ßéÌ9>ìŞrâŠaÚ¬üÇíñú¹¤GÏÅ\"Ÿµéª+¦*oŸ·ìÕ‡»UšøÓ3ñ‰Ñ43aÅ±Šø3â¦LY+4½/XšÚ³&&\'ó’”·Ã÷Ö9Nëú@íG·»ÊrçvxÎ~Øpß&=]|œ­5ëY´G›ı­|syŠûkñùö…Ó€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0<ËuOp:Èê.9Ì·Œ9yÛeÒM§lµöqOÄÅ¦ÿ\0kÍâ\"+|ù‰¬Ì£îÓÿ\0ä³£ôÿ\0Ù±ƒ&ØœÕ×Ëmzû²Å-4>mããâf\"~Ö?Ş? óÁÔÜ×\rÅòœ?©~É÷Cw.ccs.ärø[ëæÍ’ojyÚãv¾ßºöµ¦)jÅ¦kñ><Èa±Ñ|‡[òâ¸.æèô–¶r9µø^C\'Èhkbñ9v3ÏéğáÍ±æff˜«1æ|å}÷o7/è7S¬3r7ÅŸ¥°ózÔŞç7kh´`Ï›&çË’Õ¯ˆ¥ñVÓkV¾k?5ºzê‡ës©±òÓ§Üî™éºqÕó—ÇhyËæşÏnf®[dŸİçÎ;Oí¯»Ï3!‰OÔsÔüñXë^äu9¼tñ<­y\\“[Ï¿İæu-­ı#ã|Gˆñ\0±?¦­®âzœÕêŞ…ïî–ÿ\0RôÖmı>C_J5í»©’mL¿v¸«klwŒáŠû£7ÅdÈ\'#WÔ¸œ‡mı9ò<¯ÖTé½ÚaÇµ{ìã‹bÃ›jº_w[&<Ø¿SmX×÷ÒõŸï¼LÄLÌ$õ©.±å³ç¤p]±I¼N=Ş”ÓŞËñh¶ísßÍ¼|Í­3>|ÿ\0°pz;®:ëWñİØé.©á¸°áù<<wÁñ±ÆmnZrG¶1aÒ×¦½ë3>ÛÄÌZÑ>&-CÑ‡3×üWEvß7r{—l]1¥ÆqQÉóØÍ\\‘¡1-“ºc%«o4gŸ}¼E|ù€T÷r>©äîöhĞì®>¨áy¼İëƒ§x^#[5óp˜ñLûónZ3gıUò{fc<tÇ¶}æ}Ğ\Z»”õiê;¯¸Ng—Çê&½¼ÍÓ›6¶ï¥ÍõnSf˜ÿ\0m¯L™ï—Nf}Öñ‹õ\"ö§ˆ¤~È{ÁzÑõ«Ø˜à{­©×“İ¾ØòµÇ‡6Ç?‡O=µw-o­Ÿ&¦Î]\\±àûù#Ïÿ\0Ÿ\0±Hş¶»OêëÏ~–¶^ªxÜq—”éÍÜ±mŒ™ˆû¸¯Ÿº|{â\"bf=õ§º¾BC\0\0\0\0\rCëK!éK¼X2ŞÕŠt77&¿Ÿ8ô²äˆÿ\0išÄ‰ı%ñœ,z¦íåuù›ìãĞë>šÉ©š5&µÚÉıµ£KDE¢g}·ÉjÚ}¶˜­bb³i =Vú¤ÇÕÙ½8w3[ ´·w:ƒc¥¹~\ryÏ±“-ğZ±\\T‰‰µüLøñæ|ø˜­§Åd(sæzcS€á´;óÙçÛ”ãpÎ–BE¯ÄNy¯æ¶ıOŸ-¢±íñIË1_İâ#İ Ç:‘á5¸¥ç²áîf—Ãû¯Æìğ›XókhåËïl{™\'+mxˆûÕöÌÌZkÌDĞ¦ş°ËÜOı¸ë]Œy)Ÿ™én3o=r^ohËmj{ÿ\0tüÛ÷{¾gæcæ|c‚º¾¶Ÿùè_ı0ı‹`§Ñã‘®ï¤ÖŠÖ?³ú§’×Ÿóæf˜r|ÿ\0Işóñı<Oò	Â\r[ês±¼¨şÇu?g·÷é¡ns)Õİ¾/¹ú]œYi—O13lq1æ³hşdëµÿ\0Hı¾ƒõ\rÂ÷«œïö~{_…ê}Gö#„ı6ŞæÍ3Fh®L‘šk9?Å1_İcÅ}ßĞz«ú¨×ƒîWv«³\\ÖŞ†.ŸÑØÓÒê/ŒÖä²ò\\ôx­0Ò6-ö±jRóh¾O·–ù&1Åbbò¶Ş¯ıTõG/NŞõ?t3öÇœØĞœ±Ëõ\'%ÔÜÏkù¯¶5ô)|m1îµftéˆ™÷ÿ\0„ŞÙú‡õ¹¡ÓÜÏZö—Ô7=Ü-ş’Ø¿üAÀr“£¿£ÅŞlàÇ—g&ŞÆwç&,4ı¿ºm_˜€š>Œş¨ıê–Ñí¯u8­N‹ë­ÙŒZY1e´ñœ®iücÃkÌÛYüWíh´ÇŠŞmh \'P0®õõÖ·l;?Ö½ÄÜÇŸ&.œàw¹)¦½½¹o8°ÚÕ­-ş[LÄDOñçÈ)?éùÊëwÕo`:#Ljhbèºòû[¸k7ËÈlEww#>iˆo¶?O‚µó1j\'ÏïöÀ_(*—ê…Óœ®§­.ĞõlãŒäºr8Ì#${§>¾ÖÖLµšşb\"»Xf\'ñ>gÇâV¬ïı…ÏO¬3şË§M­Áüjş\n˜3Z;„ö<\"ğD\0\08œÆî.7ˆßä3Z#¶®\\¶›OˆñZLşQÛ¦k®)r£Æß§\r†¹z½ÑLLÏÂ#TÁúAôŸ!ÓŞ’òó›ó1^®ê¾G›×¤Òk4Åöğjøó?âóm[[Ì|~ïÃmÓOr˜§£ç&÷Ú/WzÌşsªn¢IPo£ş£àõ=péuQô¿3Èğ=UËr<~®=}¹l·äë±\ZshŸÛí´Ï»İ31í­§æµ·€»ùwCW²İŸëëmèÎíz_ˆØä)«šıü´¯÷xæË¼Ö³o3?À)ß¯=bz´×¾>éaï§WW¯ty?±ÌôÄ~—é¼WË|xu60æó[gš×íŞkO39mi˜€·oNËê.ëö£ê~´áµ8¨ÔÜä8N ÑÓÉ7Áƒ“ĞÛË©³­æ|ã¶L½u¼VÑfbd0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0™®üğ<_x»‹|Z™i¡§Ö\\¿[Ş®Ö_Ÿ?>}±òG}¨‰¯kº:¶‰‰‰‰ş?èÔTÖ¦®öjîêâØÃìyi­¼O˜óñ?1ÿ\0 Qvú‡§»aéÃ¤zƒŠéİYßîÆÏp±îcµ\"#6	æøÚbûöÇj^i4-8ëîšÆJVf³_1!a¿Jn?Cİ3ú¬¶o{˜ÍzÚß)úÌ¸\'Ç˜î¦?¯˜jT¿IîËjv§¬úÓ²ZÜïÔœF†NOŠâ\'j™ôæ1LåÍ‚‘8şşKä§º´œ™oâÑHæ$*Ã²|Fu?{º¥úß>_ø[–ê~7C”É6û6,»T¦Iµ¢ßİşËO™‹L×æbgÀ=ö¯Ó—d»!Êr\\¿i{£ÒûÆ¶¾¦ıt2å¦Œx&óŠoŠo8æõû—şóÛïŸtù´ƒdƒîOj»wŞŸ§Jw;¤xş£áñìÓrº{Ô›ãŒÔ‹EoãÌ|Ä^ßø‚‡:Ó¡{9Òş³ºæ•àæı¤è¤ÜØßÔÃ{Û\rñk{íN:2[Ìÿ\0±‹ôÔŸ3ş?>|DÚÓ=\núbíÛ¨ï‡Qvc¥øŞ¥î1±Ö<v¦n?_bı;Çìdûš\ZZÙ\'~ÔSÛ¼û)÷^m}µŠ„_úÉú•Ë³Îğ˜ú{,hè×7ÕTÁ—Û9²ßçWZÓóãÛOï¦&&&ra·5éô_ôÖíßIô\'×~¡z__©:×“ÒÇ\\œNİ}¼n†¤LNÕ­iLù&µ¥òNzßûÏãİY½‚tp;Óı+Æbáz_‚ã¸~;xÅ©¡«M|8ÿ\0ùZR\"±øÄBú‹ôuÓ}×àù>cµÎN×÷6®Lº§ıÚS½ÑâÚ»õÁ5ıF||ÛÍñÌVÕóâk`§zjuÏ£~øp]Ù¶–>ŸéN¯ÏÆó]-M›Û.½0ãÁ{GÜÉi¶mmÍ|ù\'_Äø¿ÏÅm`ôÓ=GÃuNq][Ó›´Üâ¹­,†Å?°f¤_ãÏõ­¢AÙ€\0\0\\úÑ§)éãº<fZ^ôÜè¾o«OñL[G5f#ı~AçïÒ¿½§êƒ±û:×¦=ş¹éıkOşsr¸ñÍ£ÇñÅ’?ùÙ¤ «ıPşƒ§ér\\††-ºqİÎmÒ·Ç[LZš­æ¾ñù-ú­å¸NÙtBög„á5büïmúC–äë4öãÖŞöfÙÉ³O·jÅ¶mmœ´›äŒ‘ö²ÌG‰ñ09é/‰ÒçhøËã½2bèÙky‰šä¶–+^>?¥­ ‡ÿ\0S¿Z½Úôë×œoûQÕ›\\îÿ\0NÇ-uõt3ÒräÜ¶8œôÚ×Í6¤c×ÍZ×âŸ}ıÖµ¢¾É\nãõê?¼İàãø™îx¹Î´ã5õuy˜ÃÈğ˜xØÕŞË†}õ¤c9«ZßÛfb-æf+âd;oL¯;ùé“K¨xÜu÷ÆqQ{ò›\'7§;:ûÛ•öb´ašRf¹f•¯Ÿï1ÖÕÇff)\0›^“¾¬]Ñîoxús·İêè^™×àº§o	¥Éôö–Ö<˜9<÷­5ã4åØËI¥í>ÙˆŠÚ¾è·â&$-êmêSgÓç§m®;¦¹êuo]ä¿	ÄäÅn]|>Ø­šÏæ&˜æ)šß69ş¾š‚¸N÷ôå;ËŞ-m«tn¶ôäéŞ7[<ëeä71[íçÏ›>:Ó7ÙÇ|Q­/ï›üÄÖÑpµŞƒíWlû]£<on:§úg^ÕöŞ¼W‹Zr­íJÄŞgÇÌÚff~fAÒwk°]°ï?l_Ó¸±òØ¿Ô^_‹Ïû3êîR#.+Öb³\'Û>\"-0\nZõ‹é[¹¥ëî\'púºü¯+©Æäê.+ªw63N^­Áxqd¤NL“võ©š¶¶\ZÌùÇI´yı³p¶B=ûÿ\0è‰ôÏÒ½k¿»÷‡ûŸ™Ÿ7ı~´V¶ÉoõËqføøş÷Çğ«Õ—µÔş˜{¯ÁhùıN×Grñ†\"¾ï}ë«’Õ¯üæ±óş\0©Ï¤m:³šõ7§Ü¼=9É_¦ø?‘×ÍËW^ÿ\0¥¦æLJà¶Oß|Ó,ÛÛ3ãçúD…İ‚}]ú¿k:\'½Ü>¬åÍÛÎ¡¤î{+æÑ§µí¤Ìÿ\0§İ¦*ÿ\0õÅ>*ÄblWfyÆ‹ÆÏæµdy¥ŒÆŸøêŠ§Î5ß±¬\"şö·\'¥¯ÉidŒšûx«Ÿ£ù¥¢&?õKT×DÑTÓTo‡Ğ5ûx«4_µ:ÓTDÄõ‰b_d*€\0\0\07pøî¤î/Ó½‡èvÏÔ½{½F”¬yŒ:¾|åËéHˆ™´ÿ\0Ù­çød;;‚ûF#Æª=š>¼¿V™í›j)Ê2o»,Õ¥ÜFï…ïO¯»ë:p]/l{Áö§·9Û~šÃ¸Î›ãpqÚñüÚ1Ò\"o?ÖÖŸ6™şfeŸ¹×wÒµ·d»ƒKîÆmÒ¼´NÌÏˆÃ¤Ëûæ~<{?ŸàÃôæí/¨Î±ï7@w¥¸ùè-.ªÃ“”æ³ã¦]|SÇjd‰Ã6·œ”ó¯»|4ñâ“lÑãÌãŸ`]y{gÆw›µ=WÚ¾gk&®§Tq[m¶qÇ›`µë1L±ÌÒŞÛxŸ‰öøşAMqè+Ö^ür}KÛMş¢ç´9\nr:C‹cK½š™)öösgËñl²·¶Ç9mhšÖffBŞ=6vs7b;7Ávëæ¿¶¹¿½Ìò“ç{’ÙÍ|û9¾~f\'&KEf~}µ¯lğ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0o½Våæ¹QæãpãË›áû…Ôüâ˜üÆ½Éı›ä´Äyˆ›W^¿?f?™ùD=½ŞşÔèšäş×Úı_¥ŸÙî÷{}øio~<øóı\0<Ş¥ù=¬İ‚ôßÅìmàË3Ó\\÷1jÖõŒ•É¹ÎíŞó8ã÷V¿²\"¶™ñom¼xöÈ.é·ÆGèµº±†Ø½ú;›^ÛO™Ÿ½¿±—İşÓïóÿ\00IpyÛõËØoN¤º»¢øéËƒÙÚÇÍôõqãˆÇ^?gßx§Ÿ>k8²Dá>~İ§Ì|D…âúFîÏşíş›{ÜœÛs³½ÈğØ°òY-o6¶ş86fŸœØ²[çø˜ÿ\0pmğjŸU=Õä{#éß¯{¥ÃF	ä¸.#&MÏhŒuÚÉ5Å†Óçü^2d¤ûÍãÛü‚–}(zvÜõŞNíî~©œ\\£«û‹MÉœzŸÙõ·İÓšÄ~ëdÍ‹7íÍoÿ\0¬Ö\"\"Ö°_ÆupãÖÖÃLXqV1ãÇ±ZÒ±\"±ñüÏª®çGs}F_«z¥0ääòòÛsmì¶¿µ¯~C5ôã&9›Vø«©ú=xÅmæ#ß1Ôvc¼}Ôí÷SÛVÃåøıL¿‡¬÷x3˜´F,š×®~&b=¶dDÏí`$~/RŞ®ú»S[C°ıSÖßÛÜ·É?ux¥Çö«o3ÿ\0Fjç¤ÿ\0kåŸ?ŠÇğ/õ#ú‚ö»®µº®µtz£šó\\áy^Ç÷öfÓâ‘tcïyñâ³h™üÅ¾AıQ÷ï«ûãßn¢îoRt•:KšİÖÅÄoq3½µ­‡^ºÙihËXµm3Ky‰ˆµ|øóæ<È]ÓGXàôYÛºuœÌå}«ñşûM²gÛg,ë{¼ş?dÇ¶#Ïìö´ \0\0\0)İü–u—şò?û6@yóôÊsVõ1ÙNCc[.ÏÄõ¯ÃaÉöÓêy^´›D|ÌÛ&{ÄOÌø˜øˆøFàMúÊÜÍ£é7¼ğLE­Ñ\\¾ónM\\”·ş«H)×v|‘ß-.v°ìaàú+¥xÜÇ’¶Ÿm8}[Z/ÿ\0½÷¿í™™ñâ~}£ã#…íGEğÑ†ØcC§¸ío·ió4ökc¯¶gúÇ\0Ñ>¦}t¿©®àlõÏPõ¶~.7:[_¤ókbâuöo_üîFlrùœ9¦öšûëà™¯âmä!o®?§Ï`}7vG¦6ºo¨¶z—¨ºÇà1ïòÛØ²M£6,ö¼Ík•­b1ÿ\0#Ï>~Òı<}v?ÕW§ªêîáåçõz‡_ª6x]-ş7~1Æ®,Zš™«hÇjÚ—™¾{Å½Ñ>kâ#Û?¸#±?LîÜöw¨úsç{§×o­Ñ›³ÉtïÊnF>\'Ü÷MãfšÕóv/k^&&#İ33ŸLpS¿Ö¹\\/ÜûtNÛ<§¯«¿–k4Ò›Ócgr˜ëî÷EóW7æŞØˆ®´Ç™÷L@B®ë¾éôg?Ãîñ=MŸ£c.¾¥qÇ»—ˆÃ±*E/štæ—›Ş¾Ù¶kL^Ói´ÛÏÌ¬â}Xw·w¾‡Fuo[O1z`®•õûçÆncÉ—øÿ\0¡ò:ù¶rÄÌüã‹ÖÑşiñà8]CëêYéÿ\06¦NæuçWo7œåø~;ci¯æ±›^‘oø‹ş#Ì2Ö¬nïz•á:ˆîÇk5:Càk±ËjlàÖÙÁ‹’Á³«6,;>f1qo÷Ş-çøöÏ–ÿ\0D¬İs¿­İ¾[$ß§77xûÅ­>ØNc5²Î:D{cÎ;c÷øñÿ\0šˆèkÏpú½CÁr<÷ŸÓrz™´óx™‰öd¤ÒŞ?å2\n‹ú=õW[ê÷¯¨»›sWW„á°oufîjFLÙw°ı®;íÖöùÅ_Syµcİ?j+?¶Ö€\\1~çöï§»µÛÎ¡í¯Uàû¼WQñù¸ıŸjEëâ/_?æ­¼Z³ık\0¥Ÿáz·±İÆç}4w7Æ>W¦ó[ûjÑ5¯#¥33øüşk5ıÕş‘3Yù¬°¢Ë|*ş×n7O)ëëõøº±¶ûvîmQâ[ÙÌñªİóš‡MŞÌË;bÍú\0\0\0ëú‡Ÿã:[„ÜçùŒñ‹WKä¼ÌüÚŠ×úÌÏÄGú¦Ø±^&å6­Æ³+fkša²\\Ì~.®íº\"fgáÊ:Ìğˆç;’‹é‹éÛvt÷½]÷#FÔê>²Å}nœÓÉYˆãxŸ>=ñşl¾Øñ?ö\"\'ÿ\090Ú,f\\|çœ¸Ojv‹µ9¥ÌË»½º˜ıÚc…>œúÌÌóX\n­5o¨<ú{ı1ÂvïÅ‹&§_súÜíseŠc¾…qåÜß¥üÿ\0Š·ÒÒÚÇ1ı/3?0ôÆëÚhõçmºk¦û—Íkó¼ÿ\0Iu^ï?Òûy²cã+½nOVÚ˜ôpZ\"ŸruuörZøæóìÁó5ıÕ€µ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0üØ#¨{·ê¢ø2bÙ®N\'¨·b÷Ÿuo\\|ş¦_tOÏ™ñ_1?×À/Ë ´±q½\rÓ¼v^Øõx<›Ï›Mk†±|> ğ:^µÚÅ¡ÑÜöö|¿k¿µ–÷ùıµ®+LÏÇÏÄ@<õuÿ\0Yô—7Ñ;ÓœÆ}m¬½!Ú½N?„öÚ-[r{<Ämfóí™ñ|zû›ñ3ùÃâ<Ìîı\rhããı v+ÚÑn–ÒÏ3oÏœ”÷Ì´M¦½Wß[nÕñÙúo·ıëÖÇ–¼†¦æ^™Üšá½«“_%/±†mxm=—¦hˆ™óo½><ûgÀp>ŒığÛâø¾_±}O\\¸øşo‘Úäz[jÓî¦MÌ81[OúÖc°æ¬LEf#<ÄÌÄ‚ÔVÿ\0YP\ZÚ™º/Ó¾†ÆMkå§Rõ>®ßjrá­¦šºóx‰öû¼g¼ÄÄø˜Ãoğ\rÿ\0ô½ôõNÑöW¸Üî)¿Uw3·1³“$ÚÖ×ãc\rjÍ¦mí®+{şgÏœß˜¤dƒÎÿ\0bx^İjú¦ì.|~§Pñ|ÿ\0#ÓÕå¸ı©œ˜é¿›f5³W%m>gÛ–#$Òß¶&“!~—í\'j²VØòvË¤í[DÅ«<.´ÄÇóûr>˜}5òñÊz{í®ß¶³ZÎn”Ğ¼Ö\'óâg˜ÿ\01‹úô“v›ÖôíÑ1–‘â+^6µÇÿ\0<qû\'óüÀ9?ı‘ÿ\0üÜ»ÿ\0Ø<ıè6ï	Âpı5ÃhtïOqšÜwÅëbÓÒÓÕÅğëàÇX®<t¤|Vµ¬DDGâ\"Î\0\0\0½õ³M/OıÍÜË0ÓGsYm–míŠEt²ÌÛÏñãÇŸ ¥_D|>Rz4DSS¿=_u|{âß§ä2Ö#ÌOí™×ıßíï}€=ı@¶±iú3î¾lÙ~İmÁN(ŸŸ›_6:V>?¬Ú#ş`¥ORıgÒ]iÖÁåmŸ[{œ¥â¸n+o¢Õ·Åñù´re¬Öf³LÓM;ÇÌÿ\0ÕüLüƒÑ7£ŒãµxÜ7µé©‚˜+k~f+Xˆ™ñüü’\nòú»ëêõ&.Ävã”ØÏ¯Æõ\'[N=¼ØrWñÒ#µmjÚ+h®Íæ&bb<|Äƒ9úWğUé~Ö÷s¦©³m˜â{ÁÏèÆkDÄåŒZúT÷LLÌùŸoŸ™ŸÏæ š€‹¾©OKäõ-Ü®v7¢½I¯ÏğÚ—Ö›Ï›èdéı+S$V~<W.,±æ¿Íÿ\0wùAl^œ{sÚNkÓßly½NÔô®®.K£ømÚá+I§İÓÅ{Ömyóo›ZfÓ>ffffA–ò~ı?ó_r9Åö÷ïZ-“õ]1¥—ß1ø™÷cŸ2G•ôCé™´ßoÓ§Bc™¿¾IÄbÕ?Æ¬xÿ\0OÀ>‘è£Ò=b+œºÄ||ğ˜gÿ\0éÄíïk»sÚn7NöË¢xn—ã66m¹›SŠÓ¦¾,™íZÖrZµˆói­)gçÅb?€e\0£ş‡ëÍÿ\0HS®®ÇŸr8\'’êí®#µk’™8~G{|q3æ>ÜW°å‹V<ùÇãÅ§À^\0\0‰?POGÙ}Fô6¯Zvö˜´û›Ñ~v¸mšÄRÛØkæÖÓ½¿Öv9Ÿˆ¿˜ø‹ÚRî[¢õn¸Ö\'Š«Äe¸š1xZ¦›”LLLr˜ş÷Ç8İ*ïí¯q1u®†mS^ÜoRqW~WÏIÇ—ZÏ¶Óì·ÌG˜Ÿ1ù¬ù‰klÓ,¹—]ÒwÓ<\'ûæí„Û|&Øà\"å3ß¦\"+£œOXëLòŸIßÍlg \0şZÕ¥fù/­bmkZ|DD~fgøƒä1Lk<—¥.ÄnúÍîş>œÒ™ìç@îÖû•Íê\røó4Á_âØâb³ŸŠOÎHñ°2<ª0vük±íÏÊ:|zşNAíWoçiqvàjÿ\0Mnyp®¨ççL~»êé¥¿`ÁƒW=ml4Ã‡\r#<xë­+â+Ã jĞ÷ê?İ}NÕöŞ¼Õ:‡Öå5x^fÜf…ö<mæİÛÃN7lXãó±ïìä›ÏÄ{<|û¼¬úoök¥0vßS¼½GÁñ]s½5é’¸k{ôî–\r*kéñØo?4¼j^-cÅ­“bõÉ3zÚ &¨\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÏŸBßƒÙêÎüò¼/;ÑÊvçœŞÚ§Ù¶?Òldäu­}6ÿ\0¬Šü~øø·Ÿãğÿ\0á´oÅñ\Z<nKÅí©­‹­â-5¬WÌà×)Êñœ¹Íó\\†¶‡ÇëäÚÛÛÙË\\Xuğã¬Úù/{LEkZÄÌÚgÄDL‚,wŸêé[¶½]Æñİîàù^Og‚äpiéèW>yÙÏ8/Zb­éikLDLÌGÏŸ><È(gçNwC&;ofÜÖÍ‡bqÌß*S<d¤[ßkdÅ3ËLû#Å«í˜¸\\\'¤Ÿ©¯b¿áÜö:ıÔ¼Vn#àºRw³çã«†v­\\ZµÉì¶Årßäókß;Mb}Ö¬G™€±@a]æí/I÷Ï¶=AÚ¾µÕûÜWPj[^÷ŠÄß_\'ø±gÇçâ/ñ[Ö­`wø·î_¦ìdâxíû`äz¬1îgÔ´MqäßãòåÃ1?æŠÚ·ÍÕ‰ñjäñhŸğ‚øoPºæ;‹Ô†>SÙÒéûõl±1l˜±SÛ.|NZÚ¶Ç4óçß_oäù³ÙÎoÖ\'¨=Î­ënW~GÖ¼\\¼vÖ³òïdœøõ#Í|Î-.^ù²Ûâk—íb´E¦fÁxœw£Äèkq\\n®=mM,4××Ã¾)‹+­kÄDDD°9 ó©êK¡òúwõ;×\Zg%M[¤z×%Âkı›NLšy­mÍlÑy‰ÅjŸ§‰¬Ç›Noˆ´VÑP¾ŞÄw{¦ûñÚ^™î¯KìâÉ«ÏhcÏ›2ÅçSgÇŒú÷˜ˆıøòE©?ş?‰€gÀ­~¤ßPéöû¸ùû5ÙN£Øé½3—S7#¿:3úO5âr{pÛ-&‘¯Û¶ÿ\0ã¶½ëóJÏ¼$Óë×¯«^İáz¿‡Ü>›­g‘ÕÖ™®-ıiñÜÃIŸ5wí½\"f+olùˆ½b\\€\0\0OzÅä+ÆzPïÍ±ûâıÍkø÷{~réäÇçÏú{üøş|xTz%á8zò|_\rÒü÷ö·¥ê¥AÉ[Zø?[«ƒCœ¶<ßjß»ä¥\"ŞÛ|×İâ\0»€t}k×=ÛšÜë.½ên;€àøø¬ìò†ÅpàÅî´R±6´øókZµˆüÌÌDy™õõëÓ]úYëÎİôv8Î¢ê>o_O_OGK{{ÿ\0é˜o{}ÉÇöâ+—´ù·ñãó0\ná¹~ŸÓ¼—£C—¾ß!lxüeØÔŸÓøÅîµæ³ãíæñÈñ9&f×‹DP/CÓŸÔ«³^£ºï‹íçÒİEÁò|ŞMœ:ÉgĞšäÉƒ³Ş¶ÇfÙéæ•·¶ßkÙi‰w˜ğ	r\næúÖñ^îĞvß©µí—ïÕ–ÔÁ³[{#ŞÕ½æ}ßåŸ:ô˜Ÿ1şşŸôú*s›œ—eû‹¡½µ±±ŸX~».\\¹&şü™õ0Å¯6™™›Láó3üü~Ab ›>±©Óá=Cğ]ÆÛÛÇ¡Çõ§Kæ§êra¾H·%ÇÖ»ˆÇó’—ÔÅh˜¬Şf|Dy¨Kß¥xŞëzkÑíîç!z·6şÉØ×¶JıÛèOîÕÍŠÇŠ{fØ™ó†fg÷@&°\0‡¿Q¿WıAé“ x¾ ï\Z=UÕÑµ]^cgFùõ¸ÜxqÍ¼Ä{f–Ï’şÚc­¼Ö¿¾öˆ°h§Ô—ªºïªô{ê›Ã¿½ÈÄâéî¤Ïã}?·OfcÅokG˜Ç“âÓhŠÛİ6‰€´VgÔ/¤z/·Ş¢íÖ=[ÑßÚÜ?}{}¹Ğ_v-±¥ÏâØÖ¾í²d˜®(§³S÷OŸÅyñ>&-=wÃ‘ï§§î#•êš_WôÆl½/ÕrOœ•ä´ı´½íÿ\0{%\'Iş\"×´Gàü\0Aÿ\0]ƒ3÷Svıûì<<Ou8ÚÖû\Zµµqëóø«&™<ø¬göüE§âñ[¬ŒNŞ.ÔÚ»\ZÄ®¹.uÙìm†¾íÊ)q1Î\'œ~ZN’‚ıÜœ<şşÏHuG›§úÇŠÉmnG‡ÜÇ8²S5\'Åâ±oŸ‰šşcÿ\0[^fyEì¾®öšÑÊ^ÅØ~Ñ2í°³µîbb=ª\'ç4Ï8ùÇ8á®j´¶1?\"{£»{Ö¾­û¥ÿ\0¸Olv-©ÀèûrõPÖ¾qië{¼[\r-ø¶KxšÅÍo?å­¦3ƒ\'á‹¿õçú~noío´g²ª¼®Õ:\"ŠóÇ].+¶³èîÎô\rÛ~â©Çp|µuµ±GÍ­ãüY/oód½¼ÚÖŸÍ¦e˜9Å•\0\nLõwÜÕ×¬GSˆá¹¢áúf0ôKqú•µuù~jÙ³E\'.Å\'ÙƒZÙ§>K^-÷/‡^\"¾ß3|An}‚í\rØnÏt·i¸<Ÿ{Oè×}™­«ÌäØÏ>œ™¯’ş?wàoRu\'ÑÜ!Õ]SËêñ|G¯}½İİ¬‘LX0Ò<Úö´ş\"\"ùï¬GdéÈòxº;¤÷w¸î3Ş¦×1·~2ü¦8´Å§Gpfû–lø®k`óøó>höŸº½ŞŞßğıÎí×/Íâœºù¦“KÖÕ´ÒøïIù­ézÚ¶ëYüÇ‰Ë€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ß·ÿ\0Ü×³]sÜÚ|;Ó¼‡%‡$ÍcÆ\\Z÷¶8tLLÍâ±1>fb<Oà…Àzßõ×¼–÷!§êªñrzº™mh¤ñšÚ§ŒqıÍç(É9=±7¬Mâ³6ˆ™‰‰­Çòü·QÅr›z_®×¾ÏéóÛßÁüWöÌ{©>#ÍgÌOˆøØíŸÔ‡Öæ4·9¾étß9ÃÍ¼eÅÈìp:›±\'Äø÷û2E¾&cîV|ùş“`‚õ½ê[Ğ¿^w/»´¿\\:EÆrÛœkÒº˜õï3Ÿ*ÚÓ—Ù‡$y˜ñz^#Ä@*sb;/ÑÜ5ô8>±íO_R±8ë~g¦ú‹CvÔ˜™óî×öÖ-<Gïş|ùşA¨·1p;üÏ)ƒ?ÆîdßËšœvß¶|Xmş4›Öø¾İ‰¾YÉóëH9)Õİ3Ó}\'Ô:{=ƒ‘ê^FuiÄó9·rÒxzãËrdÅ†‘¾[N:V/kx­mxöÛİæ¡é·ˆŞ·\'ÄérVÇço_y¤OŸoº±><ÿ\0§sQŸVoLİ#ÒÒé¯P4á9=.”êì™8ş®ÙáñRù5ù‰œ[_nó›å¤Ïšû«{DÚ–¿¾CAôUwg†ôãÔ= â;…Àğı´åø^µÃ§Õ5µ¶¹}œë7ÅÎµ3FmÌx~æ	˜šVÑöÌf÷„ÿ\0údvŸ”îçZğûxy]mCˆÃ›~ilûœ¦]ˆ·7ÈZk6¬ÍóáÁ§KVêøÿ\0?’À\0¨>±Ş˜z“cã½Pt¯}¾\"ºx~¦®*ù¶J^c_jßÌÒñ’1Lş+4Çÿ\0oà4ÓûÖ·5é®y€îÌmtOPmV9;Nß¿â)8°ÛÄÚf\"´ÉâÖ­i1æi°\\_Dú£ôçÜ]*ït{:;v-_u°_–Å¯³Š?ù&¾Y®\\sş–¬OjTQ®ÃvŒÏÃğ[ÄõgZæ§³WĞÏ;:Ú–˜øË¹—Z)Hóöâg%¼Çˆˆ™½B6º¿¸ş­;¿­Ô]SÓÑÖ½[»?¦#¶Æ-¾g%ï–Ôñ5Œ‘\ZÚ±1‹pá¬G¶Ó6Ûì¬^Éz²één×ét÷pm³«ÍáÏKıİ<<FL9şîl9ot²Vm}Şì“|TŠÌdŸúš÷Ó¯»\rÙçº/œä¸[sG^3Şã/›tv²Ó;äÇ·ïË‹Í¢=ŞÚZ<ÇºdıoXş©ÿ\0µ5ùL~£{[âšZô·Tí_­™û^èÇ1?öf³ş¾A™óŸP/Sû{ÙëÓïî,y=‘ƒõ|¶KûüÏ¾f¸õë\'ÍbµğøŸ›yˆ€ÎúS½ş´º«‰¤å»Ãİ.?ô5Ém«[OÏ¯³KVcYı*ãÃZøó_ıÓmçæ$&wWú›î—m>–İŞuÆŞ.àsTãuuy¬³oc&KoÍïiŠŞ™omL9bbÑ1ó3ü¼:§Õ\'ªèv¯©¿âöu?)Ârx±ëóú;¹ôOŸ,ç™öaÇ6®\\X¾ÜëübÇ1kÎHŸ€i>…îg_vÏ•ÓæºªùgGÁÊàŒ9<âÌ4ËL9íŠŞqŞô¦|õ­­Y˜Œ¹\">->Bht·ÔÛÖ‡Lq{|ŸXõ·Gu\Zi[&´FÇ\\ñŸâqÎL:ö­ïOŸÇJÖÿ\0Y‰ò—Ôç[t¿yş›•êÎéóû}§×<\'Oíîo×†Ëµ\Z›WÙÕÏ[N¾9›}›eÇîÿ\0â~gÅd*cª¹nÔô÷“G…ÉÚ.·˜¥¢¹«Ãu¿3˜öÛ/tÄû¼M½¾bcçãÈj^_K†ÅÂq[:<·—nqZ»X5£sõù´Ú-—îã®(˜­¢1ZcöyŸ3>d7Ÿ£Ş¼é®¼ı”éî#¡uñõ6^åñWßêKïe¶|šysWZº˜ğøŒx±øÏ’÷ŸßkÍqøšEf,\'ë×½}éÿ\0Óg9İ.Úîhëó|fî†*[sR61ÛmŠb¼{fb\"|_ÏŸŸÇãçÌSzƒú‘u÷z¥ú«º[¦9\\|//¡ÔYöç‡Ë£—õºşøœT¯êóÒôµrZ³y­<ÖÖşî È}}BºÒ‡Ôİ\'Öı¶åy\r>£æÿ\0µÿ\0[ÁäÃ÷5ë8ëO³2Í\"Õ¯¶f¿ŞGø¦<GäĞ?T/L]ÀÜáõ5oÕ_öï\'‹‡Ò¶ÿ\0†×É·’kZãû83eÍãİjÇº1Í|Ú>A.>¥ş™z‡Ô—§øÇĞºS¹Õ½ıµÆêV<ß{Ûµ65©ÿ\0~Õ˜½cüÖÅZÿ\0›È)¯ÓŸ|»‡éKºüvºwÙ­b2`ÛÑØ‹áÃËhMı™ğM¦>cİO‹DO³&:Ï‰šøåv{×o¦>òpº;üos¸å71S%øN¤ÙÇÆïbµ£ÌV+–Ñ\\Ñóæ-Š×¬Çóùˆß¼²=9v7¦ru\'YwC…Ïi­§Wâöñîïn^#ü°ã´ÏçÄ{íí¤yu ¿êËÖYú¿ë¬ºÎ~ŒéŒ;Xòğ8¯ú›WŒÅ\\W÷SÌGœ™2M£î^0ÍílxëI­#Û!Öuÿ\0¦Îÿ\0öÇŒé~âmzuÜéşªrÏÓúù³[oıv|VŒ’¸ï]ŠmDÓîâ‰¥+î¬~Éud/_Ó¾>îaìŸGâïµµm×Tã1Ç1:ö÷{ş_¹1ûg/³Û÷&¿·î{ı¿ª¾¢ƒ·ı.õ\'ÆkÆ^ éˆÿ\0‰xoİ|ÚÔ´äÅÌÎLÍH>=ö¤Ïàûô‡ï_1Û^ãó]1Ôš›5è¼ŞÒá¿µ²ğ¾§PÚ™òiâµæ~\'c=Š|y™½pùğ\0\0FW…»cêŠ·1Š1ô¯p4ëãº£GŒÓjÿ\0†›1Y¬æÇñ3î¯ùgó\rTÓ\\M5F±)¶1p·i½b©¦ºwÄÄÌLOX˜ß½Û>úvW-úc¿ı;:™±ìN¿Ïëÿ\0{¡ÊãˆŒÕm/>cößÙ{yÿ\0Ä°Lë%«W‡¦f~_ÏGXviÚm¬úÌeÙÅÚiÅFêfwx‘Ç‡v*ë;øÄqÓá¸şâzî;Ø{çÚ½ëÿ\0PÒ³:¼F¬ÛÛ{Íÿ\01ñ>m1í¯™ùŠŒ—#›“ŒT{<£¯œù}~m¦ö©N+Éò:õ»Â»‘øzÓLó«”Ì{¼=ïvÛ½7zríÿ\0¦.Úêvë õg$Äş£“äóR#g“Û˜ñ|ùf?ğ­|ø­|D39¬9Šª¦¹š§Œ¶¨ğ/úˆúëé¯N=ÉvÓ¢ùXÚî?£lZ¸µíı‹‡,xı^iÿ\0-ı³3ŠŸ™·¶ÓßÈa¿M.Ëp¼¯Â÷WÏ¡Ò}9«›èì{”öçå9,Õ­9^4ÚËjÎ¶™ı˜1Z<DÚfBÀ¤}jöªûëé¯{[ĞÙ1G;ÌjkäÑ¦L¿n¹²kíaØû>éø¬äŒ3&f+æñæb<È([º9Ü~”Óáú¬z7­x^_SSkGŸÓµ§&]ke®Ò½é+‡Ù±xû5óOtûâÖ÷V1…¡}\Zúç«úÃ {¥ÏíÆ^3Ùáøî/(öàÃ\\Z–Çx¥\"}±6Œxï{DDŞ÷µ§ÌØ*\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\01äöã¤»·Ñ§núëG>çÌã¦=¼873jä´S%rWÆ\\6­ëâô¬üZ\"|xŸ13_˜úHú6å­“&ê}™+>ìšıAö›LÌÍüæ÷ù·Ïóñş€Ö]QôJì–í­nîïZñióä1jïV¿?ˆöSøñæ#ÌÌş??Èk¯ıçööï&ş÷k=DioWgZø6tæ›œ¹Sg_%ğdËûmı\'Ì~<øşÂ==ö†ìß§N—ìO\'«¥Èëñü,èóŠûõ÷63Å¯¹>-6Ç|™rø‰ğÌDÀ5/1ô³ôEËîßz½¤Ï¡lføôùîC9Ÿ?˜¤æ˜¯ûWÄ 1Û}\"=LÌÇÕ1æÏdøÿ\0Ôgô˜ôiÆf¶{t§QmZÔšDfçö\"+æ&&cÙ5Ÿ>&`ï†âtx#G‚ã1N=>;[¦½-i´×:Åk3ó?2h1nèvÛ¤»ÁÛşw¶uÆ×{„ê\r;êmcŸñV\'æ¹)?å½-½müZ±?À*‡£>”>ªz¾ú|·Ô}±Âğ;ÖåxÎ¡å³dØÅl±oî¯m(|ìVb™=¶şëİ<Şñ$-¶İ­Û®€éî…ÕØŠğ\\n¾öc²vrR‘3Z<ÏîÉuíæf|Úffgä \0ârœ_Îq›|/5Çëoñûøo­µ«³Š2bÏŠñ5½/KDÅ«13&$½G.Ïuÿ\0;µÔºî7Pô^ÆÄG³K>8äôµıµŠÒ˜bö¦Zc¬DDVrZ\"\"\"¾\"\" #4ı!ıHéõ¦Õz£/\rÖ\\>Í&_Çõlñ¹o“Ì{o–Û\Zyíñ>kíó1âÿ\0ä7—I}ø,Ú\Zš]U~›à²ëäÅ—.ö–æ÷9½›ÙzÚkÍúMJÅ¼Mgİ§’=¶˜öùñh	é÷Ò?cı3áİÏÛ^˜ñÌò¾´9Íù®mı¨›{¦“zÖ´Åf\"~Ş*cÇæ\"}¾b$1ãŒ–Í¬^Ñµ¼|ÌGŸçúG™ÿ\0ÆA‰wW´}¹ïFmvûº}-­Ïğy1åÉ«›&Ls)>kzdÇjäÇhùıÔ´O‰˜óâf$0Iİ­ãiM>åzë¦øÌYbøø¾ë.O‡ÒÇXüc®-<Ø¢´ññâ<_>~Aòç=z{ê¿Óÿ\0Æ½)Íõ\\jgıFêN®æyxÅ“Ûí‹V6ö²x˜>?§™_Ñ§¦í=‰ØÒíÕõ}Ö‹Û¿5ÈbÃiˆñæqS<R~#çÍ~s;‹é;±=ĞíÏÚ~¥èì˜z[¦-6âxş3‘ÙÑ¦¯œWÅ1g%}Ñ8òd¤Åıß-ıd\Zšú@ú:å)–š<wWğó“ü6ÒçfÓãÇíûôÉëóççı>ªú£èƒÛ-»_şï§SñU™Ÿdrœ^¾üÖ<Ï3Ø<üxşŸò_£ÿ\0}:{NıÄ÷ßæ:7–ß×SıFçH§İÅ7Úı5g&ÙiZO¶·˜óí¬û¼ÄDuOk{{Öİ½ÍÚ«éMO¤³êàÒ¿³8g¤â¬xŸ1ìœtšÌO˜šÄÄù€FÎGéIè{&këöË’Ğûµ˜­uº‹~cøñæ¿s-¾|üüù?Ç€tÿ\0ûĞŞ¿ü‰Õ_ıÉÿ\0Şƒ\"è¥ï¤^çt:“†éNw/#ÆîàŞÖÍ±Îì[Ù—ZeÇûk5­¢/¶ñ1>|xü|vú‚ìOGú‘íg)Ú>»İå´ø[&¶l»Vlx¶±Ûje¬ÒÙ)’Ÿ3H‰óIø™ñâ|LvÏô¸í¦åø¬›Ş£;ÿ\0·nµø¹ØêÍ\\¿¡ÃjM-‹¿N~Ş;RÖ­©_´LÄÄÀ1^¥ú=vO•éİn˜á»•Õ\Z\Zš–Œ˜òæâ8\\›So6™÷íaÒÃŸ%|[ÄVù&#ÄHˆ/e~’¼?f{Ós§ŞÙæux^cK˜ØĞİé=y¾ÆML¿wbØœÓ}i‹ø™šy÷Dx˜Ÿ``\"zšúgö3Ôg/›ªğò<¿Esûrlìfâ&–ÓÚØÉãßŸ6­ãÛ9mí¯ºøç­â&óiˆ˜SÜ/£Ÿ¨œĞ§Duß\r×=7«š)LY·¯ÄobÁ6÷^•®JæÅÏ›DZ¶¿Ìû¦“ó\0Ù=¼úDç®OWtßKéş¦bbü¯TïóYucúF-,m-??9­ùüÀ$÷§ß§§ÎÄrüWXæã²õUğø1ãÓä¹\\i‡RôŸ1“¶:Å#\'»÷FL““,[æ/\0”÷Çö¥ï¶œv÷Rf<ÍgÄÇ˜ş“âf?ç ı€\nµîÒoºZ½Åêkvƒ¸Ø8ş‰ê®Fü†¥9œülpyëš¹ğ_6x2Wr˜¼eÇµ¶+ÖÓŠŞúûmä,Ÿ·z=mÅô?	Æ÷˜Ğåº›SOOĞÃlX6óÖ<NjÒß5›x‹L~\"f||xF\0\0ë:—¦¸±à·zgª8}^SŠäpÛÖ¦Î8¾<´´x˜˜ŸıS1ùW³ıˆí`º7Lvƒ¡´:oÙÍ;Á7É—>OâÙ2åµ²dñçÄ{­>Øøô\0tgƒ«vz[“ÅĞ|‡¥Ô3­{q¹¹{fÕˆ4Œ´­«iÇ3[{f&\"fcçÀ+±=%×]Éõç»›½}—è¡ê}N/6~{3?§Ò{1µh¾xœ‘häòdÇ–—Ç—ÎY˜Ï‚k—qü¤ğ¼/Óœ>Opn·ÆqšØôôõ5±Æ<Zø1Ö+Lt¬|Vµ¬DDGâ Ğ>­ºü>çDö·O{cz›ù:«?èpñózíîeıh¦¶+Wüw5µñÍÿ\0Ë™ùñâCbı5»Õ]ì?1ÆuÅóeçy®­å763fŒ‘|¸ğ^ºxïıç‹M/\Z³’“1æi–³ü‚Y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ç¶=Ñiˆó ş€\0#‡}ı*rİÿ\0õÛ>àõ?XgtWli<¦—ÇäÉw˜¶Åo3l‘pÖºúÓ¥§$ÏÜˆû‘à\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0>;{zº\Z¹ww¶±kk`¤äË›-â”ÇH3kZ~\"\"?™Ø\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¤½ZzÚìk÷¹>•á2óıqÉêmÇNpø1[-²ßÉŸk-kó\Zúøÿ\0¼Éi˜ğSÌNJ‚¾~˜½õîêkâ;··Ô¼®>ğàØÉ«Êo×>HÙä¸ùó9k­}˜~İòã÷{+ZÌbÇñí˜€·0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0T_SÎk¿ç¨-.Üq›Yö¸=^Rôç“Sâ¶cVÑ“oõ8ömíåsû±OŒ4šR+í¦OuæÁ$~–¾¥¶ûõØ	é©ä«³Õ}¿ÍN+nÖŸï3èÚ³:y­ü­o‹Ïó8<ÏÌ‚f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0®åú§ºŞç¹Ş;Çí÷{÷6©†<yñçÍ¦><Ï€uš]ËíÏ%·‹Cëş›ÚÙÏof,89\\É{JÖ-ægı’\0\0\0\0\0\0¦ë.¦Ñè®ç:Ë’Ç“&ŸÆìò{Çó{cÁŠÙ-ÿ\0_Ÿ\0¯¬n•úK\'\\íz~Œ\\F=êéZ•ë<»šÖŞc[&½-“âÑoî¦ñ16šùØìÕ²İôç8¾š“ê>›Şæy\\&¥·2éæÅ}ÌÕ´âÇíÇ›ïø·²cî}Ÿ·â-hÈ\0\0\0=ÖıÂèNÚp¶êNáõŸ	Ó<U-ìÎ[{®)¼ş)É1iññXó3ü@0õyé›º=S¢z½=3Ëó™¼ı,{^Ì›æc¾+mãÌûi3>\"gÇÄƒpzäõiİŞÃõÍ8®İòœÄğ=5¯Ô<¶n[¦¹Oæ]­œ\ZúŸwV¿oZmúL³YË“[Äø¼{f$#Jı]=K÷˜áºW¶½és¨9VûÚ8°îO²õ™÷_ß9âµÇíıÓ6ŸˆŸu¿ X¤÷õ\'¨¯Oı9İÎ«éİ‘æ2îáË­£šrkÌëíå×÷ã›LÌDÎ)ø™Ÿ˜Ÿ™\0ÜÀ\0\0\0\0\0+oÔ©¾ót?Uõßy{uÛYçuvwwûkÁò›ï}n_‹_koR?½Ë—wõ7˜1øªû¿ Û~†;<·Mô©®¾×öó<§Op›:¸3Wâ«XÅ¡6m3DÎbÓíšÖÖÛÏ{Vmhš„Éõuê§¢½\'ö·g­:ƒ6®sz¹5z{‡÷ÿ\0y¿¹íøó>èÃIšÛ%ãü5˜ˆókV²AĞŸToW½;Öœv×P÷KCªøìÜÅk·ÄìôşXsjÚôıØ²á×®zE«6ŠÄDÚ¾\"}“3âBîzK©¸ÎµéN¬¸[^xş{Öäõ\'%}¶œ9ñ×%<Çñ>Û@;p\0\0\0\0\0\0\0\0\0U?®ï©ŸWqİÆÅÛÏKıÅÁÃèt¶ÜbçyÌ\Z8w_±6ñjàû˜òc|3X­­æ\'%òDV-JÌÈm¯¦g®.ãúåz‹¶áäõ9~wŒÔ¿)Åò¸8øÔ¶Ö®,˜±fŒµÇJá÷E¶0L{|O‹[Í|DL„ş\0\0G/^~œ°úì-Åq:8²u‡LÄó½1ši¿ë0ÇºØ#ÏÄ×5\"Øı³û}ÓÓçÙ\0¨/§w|÷{\rê¯¥ö¶råÖàº³b7Ìà´ÌWìmZ±‡$ùü}¼ßg\'»ÇŸd^#üRA@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¥OZıİ.w×\'qmÒ½/Ænò¸+­µ½CÜãïÅ[ÓŒX°jîáµg%2W4M±{¯3ym}¶µ‚+u7×¬î×İiÚ?‰Œ<œeÖÑäºk6/˜{ÖÙfº»­/†klqjÖ)ñ’¾\"³30Ûèó¼¸{ûéË£»™‹ˆÇÄÛ{_6¦]{3Æµµ³ä×öıÌ“7¿˜Å[{­3i÷y™ò\rÎ\0\0\0\0\0îJÿ\0Ç]Ô½úÏÒÄ<>ïúg¿ìıü7Åïöù>=ş|yùğ\n¨õô©ã»é×¬úÿ\0ƒï,ó;.†ıÍ}î—Õ¬ìN,µó6&×Í«ÛÚf)i‹ÌD^f?\n}\'mçá=Tvk-£WÇ[ğ>ûflF›˜bm>4¼ÏŸé>Aé4\0\0\0]õ3î§t°zÖçx¾w©9LwH×O‹G4ëş—O>®Ù/¯o˜®[ÍíË3î¬Gâ‘X›Ÿo¹¾G­úosCı3éÎß1ü¥s^o|Y~åiKeµoOuòSb\'Û5›Vd=0vß{å;wÒÜŸTëä×æ¶ø]ü‘âøö¯‚–Ë[Gõ‹Í¢A¡ıDzí¯©>àfîV÷¸œ}®	µ¥ÓÜ¦\r]mœ¯–ÕûµÉƒ$ßş¿$LLøùüG™ò…ß>†Øì—x»‘Ûåù¯ìšÜé»läÍí¾Şµ3{©‹bØâ´É3öky¯¶+6ÇöÇˆğôÙÃ‹¢>ÖÓ*c¬èîŞbµˆ‰µ·öfÓşó33?ÖfA&\0\0\0\0\0.g•Ôàxîs´×WÖËµb>c:Í­1ÿ\0(QG÷?ºŞ°;‹ÛK|\'SrZ»»‹c“ÓÖŠâ™Ï–6¶9}¹½kï´Í77«âÓí´xó$ÁÇqú<N†·ÆêãÖÔÒÃM}|8ëâ˜±Ò±ZÖ±üDDDGû6zÊõÁÁzEÖã´¹>İu1Èu½­År1Š¸øZg‹ÍgÆÌM²Öõˆû“Lx¯i¬ÇÏÀVÌéõ¿¨nñ`î/Vné÷¯¹U“<ôWGêÚÔâx®?§ír\\†;ÏıF³>üZy}—ÍÏâ/íÌ\Z[»]˜êşîWqû]×¹cŸî‡99^O÷MôcC”röqeµ©xÍ5ŠV±lV­©’ÑÉˆ^¯¤Ù‹zXìÜÖbú@éèøÿ\0æv\0m`\0\0\0\0\0\0\0’Ü·ÇmrÒÙÛ\\Í\ZúÕ‹fÍí¬Ï²‘36Ÿ\"&cæcæTş¤> ]Kê{ÿ\0c;3Êåí|Ñ«ÏïufIã¹)×wê¾õé6Å§¯Š)5ÉXËmŒÖ¾<TÇû¯YñÖ~Ÿz·cÓ/Ü~Óô¾^³ı5—_/#Ô\\¤[3×yíµL¬¦¿‰û:xm’g	´V±½­“\'™ m¿¥ÿ\0£ÄúÍÁÏp\\môzkªz“äzv™«Ï—C!](¾jÆKÅsN],ó˜›y´Ek1X\0\0IPÏôßFWœäx½m/è.¸Øã5/­¡±ú}¾’Ç®¤ÎÍiö©—[>ÖÆ\nÖ÷‹ÛDDÌbˆ€¸nĞuœ÷´ıÜ½mn¥éş?—´Ö¾Ø÷lkÓ,ÇãæÓñü~—\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0³~·Üpö÷µüDñºY\'k˜ä6#nøæv0}¬8£ÙÑ>\"—û¾oæqãŸoÈn?¤v¶ÆF<.\\ô˜¦Ç7ÊäÃ>èŸ4ŒşÙŸôıÕ·ş\0™à\0\0\0\0ÑR?Dÿ\0s6õĞÃ“[áÉLÜO!Õ½gÅ£Åµâ1ùü6è_X>—û•Êêğ=ßNßä÷o\\zºVäiƒcböñí¦<y}¶½çÏøkoÏÇÄƒ\nú‘sÁz%î–ìyşóÔÓÿ\0ŸşŞ×Ãÿ\0÷??Çä›Ûîê›õUĞİ#ÊjbËÏqaÁñ–×Å¹úšÛ>Œ«HÉišÄ{#æ“û=µöû`=$\0\0\0@ú’ô=éÿ\0Õ6î§7Ü¾{;¥¯úL<Ï·úm¿±î›F;ÌÖØòV&gÇ¾–šû­âcÌù\rcÛï¥/¦¾„êş«÷zƒ¸[~™Ë‹?Çõ1ƒ6–c¿¾‘öğëâ™¬^\"ŞÏw²góY‰˜™€Î®ın?Õÿ\0vpàÉ–Ö¿Síf´^#Ä}ÏnIñ1ÿ\0zö>\"#æ|È.gé½ÿ\0ÄKÚßşgíÿ\0íÛ\0’ \0\0\0\0\rë“¯5{qé#º}EµŸí[?Nmq:öñ~£v?I‹ÄX¾zÏúDLş\"A^ÿ\0G›ã9Şñr]Q‚Ç¯~’èœšy³Úµ›lnîòV½v\"c÷|kaŒ>&~=¶øıÀ·ÀtıYÒ+×œßJõ·Nq¼ï½OfÎ!­MŒcø÷Rñ1æ\'æ\'óó\0×½ô­Ø¿N|—Qr½ èŒ\\~§Ëû³úŒ¹ıµ¤O·)Ëk[?u­odO3ı\"±W>¸ù>õïİíˆİÇî¿n7uv|R+ìÚÉÓÿ\0o&|şéšÛÏıïÀ,ÓÑ5ëHİ¡µ-ˆé6¾b|üÆ\ZÄÇş?\0İ€\0\0\0\0\0\0\0\04¯{½úpõ\r¹^[º²ã÷yzM?ø-©kéîŞµñâ™3ašÛ-|G·ÛtDLøñ>&õá£ÓÜ/¢Nçqk[ã4ún5u0ãÁ‹Öøë¯Š”X÷Æ:WÇø~<GÇ€@§)£·ê3°z˜6)lº]§çµsWÌy®Yêg,Wıı™+oö\\H\0\0\'ë\'¯´;UÖİñÖåójëñsØ¿¹õ‘HÅ—›Á·µ§­ZEâbùm]ìsíŠÏÆ\nÍ¦\"\"`6×Ó—©-Õ>Š»[È^ókkq¹øÙó?1ú]¼Úñ™ÿ\0.(ñş?\0’@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0®­¦µ\'´¹ärÚ—¦¦ÏŠpÍ¼ZşıKÏ˜ÿ\0Hö|ÿ\0¼oı\'ÿ\0ø‰zCÿ\0š¿şİ”7Ô;‹î·3éß\'Ú¾/_’œ¼ïA§ŸOgn™¸u£/¿¬[>LuË8/’˜ëk[2G¶Ñ3¯×\'Õù\'/Yóİ+»Ğ|~´âË¥Æôvß¯‚bÖˆ÷dñy´~ëOù¢><xÚúm÷¿¹«nßtÖ×]õ×Ímlq›|^^S=õrÆM\\µÇ6Å7öO·\'²Ñæ\'Ä×È/ \0ù½ë¶É’ÑZÖ&miŸıdX7÷3r;Û<†Ç¶2íe¾kûcÄ{­33ãı<È%·BkwÇ»=ıígÂôpúS 9§á÷¸|]ıİzêÆL9cnù³DcØ˜ÇYË\"µ¯‰øñ_\0±o«Ï3ı—èÛ’Ññçû_¨8½?ğùñíÉlß×ãş£ış`®¿§OÏwÓ×GõVoçåsp¯ÏoílZre¼ikF-{ÚÖó6·İı7›OÌüÏŸ »Î¿îßk{U©Mîå÷§:_ZÍ±O-ÉáÕœ±Ÿeoh›ÏúV&A«x_>9ÎS\'Ç÷ï§m›\r}ùråŒØuñ×İZû¯Ÿ&:â­}×¬{¦Ñf>A¼x^s…êN/_›éŞcK”ã¶é5÷4¶)ŸjOâÔ½&khÿ\0Xs\n¾§Ş¤;éß¢{y»Ûn¦ËÓû\\ÇSÌoïkãÃ“4éaÁo¹Š¸óáËŠbßv¶ój[Å±ÓÅmæ||õ¿­>îÓ_‘æº?ÖßYgÏiœš¼>N2×·º5Ÿ±ƒ>gÌa¬G˜Aµı&zİï÷/ŞØâî\'ªn\'ª8~¯ê#ÒŸÙV§%‚ûÉä´èÓ\rií‚}ø¶&ÓXñÿ\0YZ…Â\0=ÿ\0P—ßÁë#¹y2dÖû{ıK\\8§ïÖ³7¾¶“æ\'æ±ZæÇigãÏ‰ğ	ôòÔ®‡£~ÜhÓ$d®¾¶ş*Ş¶óŠò1æ\'ùóà07Xõ‡Möÿ\0¥9n·ë[Âpzyw·öóyöáÃ³kOˆó3>#â±3331\0®^èı`uxüœ!ÛÎ§ñpœÔíÚß~™yncKÅ1_kJ™up`¶o6šÒ»YmZÓİêÔ?3õ+õaÉtş¯pº¥txî¶kaÚç9ıl{Ú•µ¯ìÇî×ĞÅú_9\"iûå‹Mé~bd3îú¶u?ozÒ;êË´Äd‰Çÿ\0Á®×ÚÃH¥¿gOr#-±ÿ\0[Vşm¼Rß€XWo»‹ÑÕé-ºíßSisÜ%O~¶î¥ıÕ·Íf\'Å©xŸ‹RÑ¬Ç‰ˆd`¿W¾´é>#³}¾èn«åv5ôº—®´³ršúÕ™Ï›ˆÕÇ’víOâf–Ë­1ÖÕ\'ôiâx-½=yÓ<M¸Ş#œê}M\rKä÷Û[[3eÅŠfff}”ÛŠùş|~d<\0\0óéë‚å;§ë_½øíœT·³ËoæÉ=±8Í9µëXù™®¿²¿Öf&||È.+Ğ\réF½§µ/[Gö+æ\'ÏÌd¼LÊ|À$\0\0\0\0\0\0\0\0\0!ïÕ‹—·èŸ«4ë{V9^G‰Ô˜ŠÄÅ¼nâÍâ|ş#ûŸ>cúD2\n÷úctw!Ò°{EÍò;:öÃÖ]1Íó:¥¿uqRy)­¼ÿ\0›îhæ·ˆóûf³ı|å\0\0\0§ß­ÖÎwk·\Z•½g6>œÙÉjÿ\05­¶¦+?óöZ?å °ïE8:§ÍÛŞSİâö¸İ<ù³ób¾;“«‡õ8¢1DF;ÆhÉï¬ù·Ü›Í§ÌÌ@hoTş½úß¥{©Ô=Šì>ãwº;Cªº¿¬w-âéjÒcTıùòùË†±Œ¶µí5ŒVöÚ`2@½yoUøù‘ëŞÅÃuG­—k!ÇcÉg+‡\r°Ó<âûg\\sµ­7Çî·íÏK|yğ	˜\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0®/¬ïMóİMÑı âø¼tmşªÏÆÛ.H˜­6³â¥pDÛÇÄLW4ÿ\0ó¿è\rqô„õ[ƒ¦¹-¿Iı}Ÿô¿¯ÛÏ½ÒùóLV)µãÎÆ¼ş&ŞÙÉOûÑ’¿›Rl€Ôş­u)»éc¼:ù0ıï=ÏZ”ñæfõĞÍjøëˆ˜ÿ\0`R_¦şK·>¿{wÃñ9k—CWñôÓ¶[LùÖÛŠÎ/3ñ3ofjş3ü\0ôõê×Ö·m}êôöNºàù¾gg©o±\ZºÜLëNLuÃì÷_%rå¥¢³÷\"\"k[G˜˜™¯ÇûzPõ©Ú_W¼w3—·úÜÇÉôı±hq|¶tÍ\\y=ßo--÷¥é3KGÄÄÄÇÌGšÍƒm÷+”§	ÛªærN8®‡	½µiÉom\")‚öıÓüGÇÌƒÌÇAôÿ\0^õÇNô/çõ½GËjq:ş+æ~îÆjâ§Çóóx§¾Ÿà¸Î˜àxŞšá5«­Çq:˜tu0Ö<F<8©¥cı\"µˆÿ\0 ‡Ö¯ÿ\0‰c¥¿ú hÿ\0ö»‘SöÔ7r½:óÿ\0;Ú|úz\\ÿ\0Rpöàc‘Ë¯³iàÉŸ[[Z}‘’m†‘æÕ´Dyñ>&êŞ ê~©ê}îk®º‹›æv3Ú7y\rÍÉÜÍ–ñ>&g,Ú~çãâ}Óñâ|íµĞ}W¯ÒTî8-ËôÆmÙãéÊE\"qWcÄÚ¸²{f~ÖKV¶´VŞ&Ñ5óäCÓO©şêzië®z6û6àxİÈÁÌñÔœ˜ôù\\9|Í°ìxŸ·l¾È¼ãÉ17¯¶?5§¶Ğ¯nºïî‡@ôïqºc%ïÄõ7­ÊéıÏld®,Øëx¥â³1¯»ÛjùŸ‰à~¯è~Šîıƒ×½Âu/÷#/è¹~?æ|DÄ[íå­«çÄÏÏæA=sz3ôß<¿g´º?µ\\Lòqİ‚å/ÂkßN™x™Á±;T®>1c™ŠcŸuk[y>Å „#Ÿ£9_Z‘è>‰ãu´1to[qºWı¶:kÚ˜÷ñlE|ûc>\\Õ·İÇ“&kä™šÇ¶b±òÌ\0<üıKôòñ>¹»\\;›×gŒÚŒ•‰¬Òrqº™#ñ?&ñÓÏÀ-ÏéÅ“&oE=¯Ë›%¯{èíÚÖ´ù›Lïly™ŸæA$ÁR?WßS»ıIÖz•:3”šñÜlaßê_³oş\Zß¼{õu/>b&”¬ãÉ1?ü”™ùÆ\rééo¥Çtşã÷‹œä¸S¨õ±m×¦x:™8œV¯º¸/»—ß·KÍmã%q_ùı³kÄQj}>½ip‘Óø}>ôÕµb<}Ìß{.ÏãÇÿ\0_$æşíş~A=húçxşÚS\'g8ëõ‡Jp¸í\\1ÍãÉÊòœŸ˜œ™x-›å¦ÇšÖ>tòf¶;Íbkb+!¾]éê¿L¾ ºG¦yÎggm;¿X®¼gÍìåœ™òêêîÍ+k×Zì`¶±îl{½Ó1ZÈ/iõÊã·2ñ½›åé†gW[??­“\'ŠäË]R?ç²ú²\r­ôbâ­¡éKšŞ¿‰K­·ö+>ßí®¦?ŸœvŸù‚z€\0<åú‡ëşk¦½X÷Ç–â3kfÉÊõ/Uğ—É’¾úş“ccc^şÏçí[Ä[çúü‚ñ}ôö.˜ô‰Ú.7b+›¤ô9ùóû¶±FÍ¿ˆşsOÿ\0çò\rŞ\00n±ï·d{wËÿ\0`w¼Ó<§Û®oÑsC§¥±öíşı¼¹+oløŸãÄømÑıÈíçp±eÏĞ={ÓK‹i|·áùLµ¥ok6œV·ˆ˜‰ñçòŒ\0u¯q;Ûn73Ü^ºéî–ãóæ|[|×\'ƒG\ròÌLÅ+|Ö­fŞ\"gÄOŸ éz_¿=ëü\\WEwŸ¡zƒw=ç-n/¨´ö²ä¿>ÚÓI™Ÿ>\"?\0ÎÀ\0\0A¬víõ}\"ëà®ÅqÆçWqØ-Y˜şò#ÆOlyÿ\0ZE¾?ìÿ\0¸!WÒ»‘î«^ßërõ×û=²èŞc_‹œuöÛìåØÚÉi¿çßo¹Ël|Ç·öûcøù¼\0\0IŸT±ê7×Å7x½n{âxşoSÏ­\\‘}=jßfø}Õ}qÛ.M›_ÄÄø´ùŸÌıqü‡èãµ:œ§ObásÏL±«&\"Øòd½ñç˜˜İš–®kŞË?ŸÈ+[ê_Û®èv§¾<í8+×¦zŸªç«x©ÖÇ¹­ÈeÖ×Å“Vö¤[Û8òkS%kí÷Z±_™´@H¥ïi{ŸE‹®ú¯CcKt¿Ëâãùl´ÚÃ=GËòÛ\ZÙv·+M¬X³N*`ÓÖÅ3jx¶Jy­­âb¡e \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\rSê{°¼W©Ìó}¯ßŞ;sj1îqœRm~;‘Ão~õñ1?æ¶ñ13KŞ\"cÈ<ùw‡µİÊô×Ş.G¡:Ãj4z¯¦öğíSwİ÷ù´Ås`ÙÅ–¾-1j^&}·‰˜ó´L@^÷ ŞùõÇ¨M};ÜnápÑ§Ì[.~;.İb+”{}¿ÖR±÷Ú-[V>=ô¿1ß©êñœ;­Éd¤ŞºÎçµcâmĞÍoÿ\0€(ÃÒî~w¶½ÂÚÖ¶nG¦;ÍÒZ9¶\"}Ù/«³6¾,S3üWû6şÈóâ<Ú> †AçoÖÿ\0}·}@zë>»Ñ¼ìôüZ8ÖÇ­8Íl±™qÌùšFL´¾I˜ñ>sZ¿‰˜ùú.õøÏS½EÓ÷Ï1ƒšèí¯ıŞ\"Ùğík^“ãÏÏŠNoõùÿ\0pZŸ«.gşô½İ¾Z/4¾Šæ«ŠŞ\"|e¶ZÓâuª\nFúoôWüsëC¶ºY0NM~/77šŞ<Æ?ÒkäÍÓÿ\0×iŠ?ŞĞB ¯­vî,~š:?šßîçë­lõ˜ˆöÅiÇïDùş|ùÉ_í ¬¿O™:Ôï%Çtgkç&n¤şĞ½¹¼»yğaÒâ¸¯m#×¶o÷ó~ÿ\0»öSÛIŒókf¬@\\c~šş–û?Òú<o9ÛÎ#¯9ÜQ7Üæ:‹J›_¨Ëh>İ{û±cÇ?m|LÄyókLÌÈd=Äú|z<îN]NK±½=Ãe½&¸öºwöN\\6ñâ-XÖöRÓ÷ëhş± ¨ÿ\0P]¿·£?RgÚn§¾~¢è>©â¼Î½qaÅ}½Ô¿é6&˜â˜«µ«èÉZ×İ|7øŠeµd\'OÑ¹|—Töc¬{}»hnåµ²hã‹ŞÕÅ‹k\r¦Õ}­1Ëƒ.Iˆñ_v[ûb\"|@X€#«}Œ–îÿ\0¦¾;½²Oü±ÈL×ÌÛÛ­ÆlÚÕ­b<ÚÓŸëÏÀTG Jß¨½svÛg<~ùùıÛV#Ï¶ÕÁŸ/·çıkà„À}RùoìXİÉãµ4ñVüçÁâÙÍšSW_\'Ï›bÃó?Æ8€ZÓË.oEİ©¾8¦8á¯KDWÇ÷•ØË\'şw‹OŸçÏoŞg–Ñà8}îs’Ëöôøíl»{ÿ\0³fÖŸùDH<â÷;¹ÜFÏ¨ïñœŸ-ÈmeÅÔ;6Üû6ÇÏeÃï8­ìó5·/í­<y¾=xˆµ=ñ5	IØ¨Ï«şnÙéÕİwÏòÚ\ZÕŠâÚãûg­ÍÇ¾µ™šæœôíHñ3h›Ûùñùò¯>«>¡;uZøú[¤ú‹ñc¶[nôg1ÁgÃñîÉv²cŸ3ñû-ãİçÇğß·ß[Ş>Ô`îŸb÷tõb\"m·Àr´ÙÉçñ>0g®8Ÿëÿ\0[ÿ\0İwwãº\\7p»µÖıOÒz›8ús”ç·ùœ×Ù¾L6â±gÛœÓl8qäûx­óWÅ£÷Lÿ\0Š\"Ğ„}9uQw°}¼ë®ÔË­Ís5Çîï×-}¶¾{à¤ß\'â/?¾#ø‹@\"7Ö‹¦rò¾™ºs¨°V&ÜWëNYšüÆÚÛ™óãã÷ı¯éçúÄyzîçx}9ği~˜ÔàôgíqÚ:ø6>äŞ55°kgÉjû+\\~íœ;ZÖgÍ&–™‹M¢F€\0<Éwïgç};‹¹­’2aÏÕœ¾LwˆŸİ[ne˜ŸŸôz*ôë‡¿§ŞØàÁŠ˜ñcèŞ”¥+ZÖ4±DDD~\" \0R7Ôµúê¿VıÀÅ¡Ò?Ø[[|1­Ér6ÖÓãsâ®†\rl3ú­™¦öÍrãŠMÿ\0Å7oŸtÈhÎì7¨‚É³Õ<j©Ô~ı<˜qæáùËn__İ>\'&9â·+’oYˆ­¦ÕŸŸ5}º7Ô¬®?˜¯ÓÄîå?±ïL††§-Éæš^·ıÓ“YÍ\\y\'Ç‰şïÇÇlüÄ„·ôÇêÃÕGPzíÏmw½DêõGÔ|ôâä8l¼uo»­ÇãÃl·¦{lqºÙbñ¢rÓ\'‰™™ŠP¶ğWWÕÿ\0¤;½ÔÚªËÛ•æ9œ3—œâwgÔˆÁ—w®QxöÏ³ß‹õxâóâ#İo˜Ÿ\0­N\'Ó}2rZÜ—Ñ¼9}<˜rN–‡Sñ™í–+1KSSj2şïo‰šMoùŸtOîmÊwWÕ¿AuLôï½Üƒä÷³×6Ÿ¡Ëóxüc¯˜šaÇ—c$åÅkx´û¾äÌÖ<O1!¶¸Y>±º#¦¯Êoúå¸.CK½­ÃuVµö7w3Ä~ÙÃ;<Uñx˜ñıİ³M§æ}ñçÌÒv“‘ê^_µ=ÊõÄgê\rŞã¶9lµÃ\\Q“rúØíšÑJ~ÚyÉ6Ÿm~#ñ\0Ë_ZİœôÅÒZvÉ›/^jd¥<|ÍkÇïÅ§şSzÿ\0â¯ôXÃ‹/ª¦¾LTµ±tõé6¬LÒßÚ|yé>&cı¦Au€\0\0*O¼ûÍ½SõW©~†îÓ½C‡µÏ]q™¹*nbÙÕÇµ±Åhëjà½«XÉŸW/æñx‹ìOš_ÏÀ[&„lF†´maÅ‹<a¤dÇ‹ü·ˆóÿ\0HŸÀ?{:ÚÛ¸/«¹¯‹>ŸÇ–‘jÚ?Ö\'âAõ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ñÛıWés~‡í~§íÛìıï?oîxı¾ï><øóãçÀ<öt·Mu÷­V8úBı_Éò9zû•Õå:ƒ~b”ÅŠ˜u¼çÏ\\T½±Å0c¶|zñióµ)>ÛZÕşt7Eô×n:;†è.ãqñü\'¥‹CGZŸŠbÇX¬yŸÍ­><ÚÓói™™ó32_RpoUtï)ÒüÆÍ¡ÌigĞÚÇ1æ/‡-&—¬ÿ\0½m0;ı•æyœîçOv·Ÿ¬×¯t:RvkŠÖ—ã3lêûgÄGÌ~§Ç™3âf~|‚ç¾¡İòÿ\0ÜÒ¿Vóº‘ƒœêQÓ|7îñoÔmE«{Ö‹cÁòDÿ\0\\uş ®OFŞ˜0÷ĞÇ¨¾ãohW&÷#ÇÎŸ	i¯÷‘<\\S‘Éçóã.ZàÇş³cñä§Ó÷w‰èYİ”å¸|ÖÇ¥Ö\\&ÆÌ?rÖöç¾ÍKGçÏ‹lê×\'‰øwÇÇ¶AgŸRŞ£¯Mú&î^ÌZ>æî®—¾?Å÷÷°c·ñ?ŠZóÿ\0/ëàKè™ĞTåûÉ×İÆË/^›éün??äË»Ÿİõöiåö´‚âÁZ[¾«â°vÛ¶ı\r;ç’İç6yjá‰Ÿ}paÁ8¦ÓÄM¶\"#ÏçÄøóâ|ô:áã?T÷s¨>?èZ>Ÿø¿øöM«ş?úÇÿ\0÷[H\0©®8ˆëNÔdÃ8?µmÅòµÙˆÃ“ôñ—Ù÷_ójû§?ŠÏÅgİ1ş)cô7Ü¾W¼<wÛ¬×k[‚Ø÷ÅãÍ~İ÷«ãÇúıÉüÿ\0Hş µàB¨GWÁ]ÇìQç¼N¯\r­yœ¸øçéx¹\"#ÇÏŸè>mî\rôãèş3…õ½Ù¹ãygİ·Nr<Ç/KŞ¶®Ùøıïµ¶>#ôùum1i™÷Zÿ\0?ŠÀ^€\0¥OVüuz³ê§Ô}7ÉjÆö¾lZZxõı‘>êÛ§±Z+>f}÷™çÌÇô€Xÿ\0Ó»Füw¢ŞÕkß$^oÄdÏæ#øÉ³›$Gü¢Ş?äïÕ>Î}/L]ŞÜÖÉ8ó`è> Éñáµxüóÿ\0Œ›=$vc¤º£×®i»±Ïó\\æ®Ş.BôÏ­Èlkæä­<uö)\\Û²W-+8}Ói­ÿ\0tÖ+ækiœïı.ıò&^Íç®ÆÄÚ÷Øÿ\0‰ù{ä÷Ìù›y¾ÔÄÌÏó1 ìz_é÷Ù^ßÎ[vÇª»•ÑvË†0û¸^®Ù¤Ò±ÿ\0gî{üyøó‰ñÒ‹Óş>¹Ùîßp»ŸÉó;v½óeäù]ß}­_lÚÓ›NÖ¼øÿ\0µ3ãøüG€ê÷›ı#Í½Öä:ú~|Ìl`ˆŸü5Á8´tµ8İ-~;C0kjâ¦8©+LuˆŠÖ?Ò\"\">¦]\'n®ôSÜ\\0N]/Ÿ-‹ÄyšF¾æä·ÿ\0²Œ¿òŸçğ\r+ôlï6¿SöK•ì¾Ö®–¾çEí_wVôÛ­³mëmæÉ{Íğÿ\0ŠŸo\'Ç»ñhÉO5·°À\0˜¾õêdã»Å×\\nxÇ÷tú—”×Éls3µvòÄÌyÿ\0îGÄ~èÓÓ×ş@»iÿ\0¡ü7şÅˆ\0\0EŞóıD½4ö{¨y>‰êŒİIÌîñû;vî./‚É±‚60ãÇ“gİÉìÅ{bÇ›²Em>Ø¼yñø°á½rı1{¡]›uwÓ\\vo÷bên‡®Kf­ÿ\0ÇâØğå¤ù™ñ16‰Ÿé1òçrş‘¼¶æ¾M>ßq»ñ|àº_s‹Úñ5÷DÖúzøò|Ö|Ç‰üxŸè·³]Gè_ªûËÑ›·îŸRu/Yiÿ\0iãéMnkœç¹x|êÚ»µ×BmXñ†–÷G»ãÇõL@iîÿ\0ú®ìç¦œ\Z¹;ÊòTÍ¹¯}ÚkqÜnmÌ”Ö¦\\XmŸ\'²=¸±ıÜøi½«îµâ+æ~cêIôøî7~\'¸=+±£“%í>ÇStn<ô¥ëhŸnO·¯îóù¯ÄÄÌøüƒ‘Ê÷—éÌkeÉÈq]£šìŞbû8º\ZØrZÿ\0>3SR/ù‰ø·Ÿu=CÕ¿L>s§y–Øî×SétîÆµmÈğúüïTS¾^±K_VÓ8i_tV+1ZÇ™ÿ\0`O­;êåÓÁ—Fi:×Ç[aöGŠû&#Ûâ?ˆñàpWŸÖ»O%½:tg\'ã±`ë\\Zö­¦|û²hnMf<O·?ÏçÇÄÇF/¢§ÿ\0?Tÿ\0õ?Şÿ\0í©\0\0tıcÉò/Is|Ï¡Ÿw{CÙÙÕÖ×Å92çËLVµ1Ò‘6µ­33â\0©¾µ5êÏÕFÏc9.6ÏÛ+‚é¾c•‰­²êñü6¯ÙË¡­—ñv¹™\"Ù#ÛjáÖµ«>-x€¶Né~3¡úK„è®sÏÓün·©;\'&YÁƒqÓßyùµ½µ3üÏÈ;€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0u]S{ãéc&;Ío]\r‰­¢|LLc·Ì¤>Šœ.nk½Ö›ó;9¸~•Õâ±åÉ1iÇ\\¹ñÅ+gÌx¦¤V<GÄG1ø¸@D½ñí^…ú„u/RÚúúÜOİşŸÍ³×·İ‹rÙoÈRÔ§3H®,¾|~=Ôˆóæ-ş¢·â;¥êíÿ\0Wæ„í\'@ò½Èê]:gœuÚË3lZÚ¶šÌL_&\\zØâ<Å½›7öÌLù³ô³ØÍÖúRèşÍòºvÃ“\'Oûy¬qÛş¯r¶Ë·YŸëÍzDÏñZÿ\0O\0¢şÓkò}’õ…Ò<?3–oµĞİÄÔã·<Gˆ·é¹*ãÍX‰‰öÄûoüy?ÔáõBşÍçûUÒ}¹åsÍ4¹ng{ä«[Í-“áøİüô¬øø›N,UóùıŞ\"&f<ªú\"ôî]nĞ÷«f\'íò]I¯ÇV|üyÖÕ®Iÿ\0Ú J\n–úßó]+›ª;]ÓØ51ORjèò;›;ñï,¹1W\r-â|Ì}ÌY¦<ÇˆıŞ?Å åı\rrîW’ï.\na‰Õ¾ùrxù®H¶üR<ÿ\0¬[\'ñş_üB×€ıaº«/=êîxKd¼âé®™ã´+O3í‹dœ»31?3ó??ˆùøñ:>]1ÅqıQ×ü—Æà×ÁÄt·At¤äÇ‡íÎ]½n¹÷-“îíÖ¶şbqÇüÂo§ş¶}aÆlrİŸĞéŞ¢Å}ıM^£ªéíDß\r˜ÒÅí´Ö|ÅoZf¤ÄüLE¢|ÇFÏ§Ïqû1Ù¯VZ}yÜ±§8®jšû»´É±ïÜÉ¯LV§÷Ÿ3|Ó_‰ˆŠÄy™ñi»íW{;UŞş\'k›íW[hu¦–ZáÚo}o‚ö¬Z±“â·§º³æ<ÄyÀ3€StxÜÙ>ª™:²»Z¹59­ÏÇcÇ\\õ¶zdÔâğW\'ÜÇî¥frWÛ3ş/ñøú\rÕÏ§èï´¸viì½ºo_,G˜Ÿ5¼ÚõŸë[Dÿ\0Ìg¸ıƒ¸]½êÚÉ\\x:—†İáòŞÕ÷Ei±‚ø¦f?˜ñpyôôÛ×§¦ÿ\0R]İn°›WÔ+\\Ù¢Ùu©jmÒk›ûqàÙ¯¶f\"³âk_>ËD¢¬9±lb¦|i“JÅézZ&¶¬Ç˜˜˜üÄÀ?`»=YıVmÙ^í`èNÕô‡Õ<WÉäĞêm½®F#.lø¢¿W[;{ğû&õ¯ßÉKRÙ)’•­¾İ¤?°]õèOQİ°âû©ÛÍ¬·ãyv<ºûZìilR|dÁšµ™ŠŞ¾b~&bkjÚ&bÑ2_Yt·×=!ÎtW9‹îq½AÆìñ{”ñîÁŸ±äñó[È)ûÒ—VöçÒ\'qº•ÜßË§Õ:KÎöÏºš±LÓ‹µöât9Úbqâ­2Ò±ù‰½1_Ûí´‚æ€\0s{ÍÛÎ_ª}]÷w¤ºoŠÅŸ.>¥ëMİl;V½km}+ïç½«jÌLÚ´ÖÉ5ó>Ù½\"-æ=ĞŞô±Ïtÿ\0Qúqí¾ïLu>¢ĞÕéÍ./ûS)Åk6¦8ÖÏh¤ÿ\0‡ûÜ9#ÇñàP\0S¿©ÿ\0§G¨ÎàzîWS[ÿ\0¤K–ÏÌñœ†¦9İÉ–vï9-†š˜§îFJÛÍo|‘Jø¥|Z|Ò²¾ŸÓ£¼]+Æò:½×}ĞÓ¯\'Š0îêët^Ö=ÌqçÅ2û7&/æ|E¢cæ\0Á:séáês[Ÿ¯\'Õ=¹ë}=L;ÿ\0G½«ÆkïeËŠ±>\'&\ZïcË‹öÖ±ùñçÛ3_!\'½\'úVë®‡õ{ÛîµÁÛ½½§©Ìdä¹;ôvï	íÉ—Íƒ/;i–-|³âqÌø˜ùø·ÀZh+ëêué¾~¢ú¯¡9¾ĞiënibÓÏÂó•Éµ\\?¥ÃløóÓ=âv\\Qjyšã­¯î¥|VÓ1à\"_O}4{ŸÀmës|wWw‰ætï90lñ\r³[a¼|E±æ¬w÷öÄüƒê§—ªÎK©-±ÿ\0u×Tq—µöw¹M,Xömškó5Á³·Kæ™ŠÒ&ŞèŸ÷ñ!”u?¡şìktö7\rÛœêIÔ®1¿Ğ;¸6?1·z›¹pRc÷L{ëXñ‰v¼VŒq|fŸ\\³’50cÁ˜ñ6ŠÖ+çÇñø,Kë)ÇWÒwxÁ|¹5:ËGcR&f³\Z›‘kLGñµüÿ\0Hùş>’¼^…ïïÕIÍqü>>àô‡+Åğ\Zñ[ß/1›ıoš¶›L×©\Z“1ãÛŠR\"=Óo!s\0\0{õGïv>Ôúeä:Kˆç#Kª»…šœ\'™&™¯ƒîc¶åë1ş\ZÆ)öM¦cÄæ¯ó0\r+ô¨ôû·Åu7U÷w¬²u§xãõ¶±O=şvôó¿µ†ÿ\0Š`¦KkcÏ35¼æÛµ<EşBË¬{»êW±ıŠØĞãûÜ\r+“å&µĞâ±Ó&ÖşÔÚŞÚ}½l5¾Y‹Z=±oo·ÏÇs;Mßnİ÷9|¿½’à6+­Êñ<¦†]ı;Z±|vÉƒ5koeé1j^<ÒÑ?3\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0«}RõU:#Óot:¦Ù=—Ğé.RØgÌGœöÖ½qGÏõÉjÇüÿ\0øúôæÆ¿Lwk«¯Oî9\rş#Åi¯ùõñìä¼Dÿ\0¶Î?1şÀ´\0Eÿ\0U­mÖ/Ur˜9İ~WgKİ×Á¯­_µ3MYÇl™3}ÈµrSíböxÇotd·™§²=á“úIåº§Õ¨F:Çªù.§ê»æô7:Ï.§8x­^â2Sg<“4¬Å¶3ëjaÇJÖ±\\qotÍòLP.¤õ\0ì×;Ğ~®û¡Îq9¸½=iŞÖêÍÕo`ÖË»´œ×É‡[GßšìS5f”÷^gÇŠÏ™ğŸêê¯‚ï¾—Uvºy¼İ\'Ãt¬ñ5åmÅìjbÅÌóo›VÖÏJ}È?Gb¾k-í™‰™€ŸOÕjö—Ò/oøº`¶=Ş§Rò‹[>ìFjÅ£øšâ¶,~?î|üùaêŸ¿¯§Óåî‡Ñ\ZQ]nKOC>¦Ï=‹ˆ¦:ìåŒ4Ë9òÒôˆŒ—Çæ\"\"¶µæbµ™,ú¨ïOFwß½=UÜ^ïôŸ#Äò\\\r«‹§uzK«¸¾gSNØ°Î:×k>,v®X¶X›ÌVÔ½koo¶|ÖÀİÿ\0K?R½½ì7Ìô÷)ÒUËr½mÔüW¿Èèêá¯Äà¿»¶3äËX¯».]1>\"+Yñ6ŸÚ–\0{ı}íß¬ıZ÷›«v7\'8Şo†-­–Ñ±}lxugoZÍ+5®/tûíb><Ì‚i})}Mö¿¦{u“´<„õG-×İGÔ›\\Ï#|v]Èşö¸pÓ&L±3oÜU÷O‰ñ33?™yõjío3Ün¤í~7‡ÜÑâõy,œ§	›­8îw69¶·›o[Ûx‰‹×İ\\w˜ŸºYİÉè…ào§ÁôßLõ¯?³¸-­n«âùêÅ¼ÇºµT´Ìû«óí÷|øóø€×ıOÀìôß7µÅljr+%§r\ZŸ¥Ø¾3ì¶L^ëF;LŠ±k{mæ¾gÇZ‡Òg«z[[¼½Âí÷BuRõ\r“¤¸ìûœİ+K[{_$ãËqÖ÷ŒX«ú¯·÷ßÏÛóšûA‰õïÕû½¸:ÿ\0–àº§»eƒáù]]jrTİ¶^Sn[8ûÑ’˜pÏÚöåµ¯jÒ\"&}ş»êÿ\0u÷)ßşOÔ5gCSªw9œü¿·\r>î®,—™‰ÇHµ­îÇŸly´üD|ÿ\0 ˜¾~«Ïíwlúc·{¡ÔÜ?KèàáğninìêŞøğÒµ¹oµš¾ÿ\0o‰Ÿş\0°ŸH~²ºsÕ|õv—ÁjpÜ—HlëáØ×ÃÈåÙ®Å2ÖÓiõµòÅbÔµ\'ßŠ³î¬ÿ\0§©©×bùÏz¨ênwû.Øzw¯v/Ô\\VÕcû¼¹2ø¶İ<ş\"õØ¶Išş}·Ç?h»ú^zùé½Î’ÑôãŞÎ©ÁÇrÜG·_¥¹nG<Sî¬üSJù/>+—şÜ~f\"ôšÒ<Z‘8ŠõQêó¶~–ú?k’ê\rınOªrêdÏÄôŞ-ªSgrk1{ùÿ\0ªÃ9->=´‹ŞkI\n#êİî?½}Éæ{‹Ÿ§¹n7QìDàĞà¸Œ?[ÌŞ˜æúšøq}ºâÇ{ÚÓˆÍ’•µ&ñŸ%¼Ü$—Ó/½]{ÚoQ<izS£úŸ‘ÓëG>—RğYòRcC\"³ƒz±jÒqå×½÷¦Ş\"øüDV-ˆ¿,}Z»SÔ]¢ïÿ\0p:fùõz[¼|n*ò´ÅXû97µ2a¶\\vŸ3‹[4[âfÖÉããİä,sĞ7u½AzkésorÙ:€ÖÅÁu<¶™Ëú¼ëÏo?3±N<ÑoÄÎKD†A†úßõ¯×>™:ƒéNƒí~¤ÍÈñy¹¾O“ØÍkaâô±f®+^ø)jLüÛâ×Ë³i­bff|6ê«ç¬.ãù]îÄôo	¥ÈMã[g”áyHÅµ1™ûWœqoh™ñ6ÿ\0~?‡|y{«ÁwïvN–Ôßçyíc’ä)µÅ^uæyšûSX¦?›+öû«_t[ÙàçÓÇÔ×w³ı£â{qÒ«è^›âx›æµsrK½–Ë—,åÍöõqbÍ³““-­3jÇ›DLøŸ‘×ëEİ½¾{Oğ]’é^ocgfšºŸÙÛ[Ù\'o%í¥qc½+’Ö´ÌDVk3ñà]Ø>ìqığíM÷K¦Jbç5òNLy5/­lyñe¾Ôûw›Z¾Ü¸¯_™Ÿ1bf&°\0\0\0\0\0\0Äå¹\nq<Vï+“¾šZù6-_}iîŠVm1î´Åcñù™ˆæAUü—Õ£Ô÷-ÈéâèŸL¼|Û•Ãúí3.®ööÕ´míŒ9ıØoK^·›[ÄıšÖb+5›û¾0ú˜õûêÕwFWµ]qÑ3Æhñ¼¥9,ø¸>/o×İÅ\\˜¢™g6|¾ÚÇİ·˜ŠÖ}Ñ3ù‰Ÿ³>«:ƒµ]GÛ½Î¨í	Ìß ö9®É“c7—]Üñ–öœµŸ³8¢m’¾ÉÇìŠd˜ø˜‹[óÿ\0Y>ºâ´ï¹«Ğ½·ÙÏˆşË×åy,û‰öşsFµuïãÌùöäÿ\0,ÿ\0§Úş~¦]Uê7º|wAõÇm5zoG™É›OßãğlíaØŞÇ‚ùç³LÅ1Z1cµşbŞcóíO^o›áºk‡İê¡åu8Ş3Á}ÍÍ¼ÕÅ‡_\r#Í¯{Úb+Xˆ™™™Fw¹\\®¿Tû\\—IdÁÍfãò×£»iÂçÅ÷0ãø¾MŞ¤ŞÅ?|÷eÇKDN[ş“òT«ÚÙô·fûsÓı¯è­I×áºsJšZÕ·}ü|ß-æ\"\"o{Í¯iñókÚe€ /WØz‡‚õmŞYïÚØæ²r\\N·7©šõå8ŠmÅõ5µöqşızßZ¸ëÇíó\\y1}Ìs3¦ÿ\0vy.Øz”é>3„âë;}mÍètşÎıíøÜ—·ê5ëKVcİ|“©¹¬`šÇŸ¹3 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0å‡k[bÙqàØÅ–ØoìËZ^-4·>-ãñ??‰zıUıQvûˆè¼>œğsöİÛæsÓsªõx¬Ø§g[CÆL:ÓkZ#LÛ1ƒÏué†¹o4´x‹ÉúPvïc ½pÛ»ú—ÖÜê¾_‘æóbÉI­ëıäkSİóóMZ[ı­\0˜Àú°úgô‡ª>éÛº9»¥Ëô¾}Í]]nKK_CÆ-›ëÅ©,LŞÛÆ;M|Ú/ş>bC;ôè_¡} mó<‡F÷¬y¬¼ş¶=}íNGc\rt&Ô´MsW<u˜É¾±i½¼VöçÈ$¨!GÔ\'ĞeıSoôÿ\0qú_kRtş–N/>¾,îGRol˜«sdÇ\\S÷Ë?>è·İ˜ı¾<‚\rò¿JÏSYõuxnšíÇ#¡ƒ.ÎÛù¹.²ãsa·5÷W[kû«µ¢Ó’~&Õˆó>d.ÃŠã4ø^3O‡ã±F-]\r|zØ1ÇùqÒ±ZÇü¢ \ZëÔ§Îõ9ÚİîÔuÇ!ÊèñÛyğíÓgŒËJgÅ›½Ô˜÷ÖÕ˜óñ15ù‰Ÿâ`\"ÿ\0Ò¢÷pÓÏZôæïééhÅı\'›OfóşZä¶–şë?cßççİãâCë£¦\r¼:Ø:/\'­šÛZµÍ·<öŞ\ZbÁ÷k÷íúlšÙç-§äöÖ3âñ1Ió?5°Z)\\u®<uŠÖ±ZÄxˆé\0ı©ıTı==Vò½KÕ»ı•æ÷9>¬ºƒ™êWÃÖ¤ÕÚınåóãÅ<~Lxñ×%)jÒ×¶|±“ÙYˆÇâ*ãè×ÒÏªnÕGny=ŞËu·Nhñ=E©¹Éò\\¿NìkéãÓÁ–¹3ÄæÍ1ùµ)jÖb|Í­_oÏ‰§zÁô!ÛXYø._©úŸšéîg§°åÕÖÛã©†ôË‡%«i¦Z^³6öÍfkâõñï·Ÿ>~\'ï}\r¸l˜ëo©=Ü‰ıÖÏÒ”ËÒ\"»tñ?ëä?ıãÿ\0J/ÿ\0rÿ\0|Ò_Ó‡_Ò—QuSğ½éßå·¹î›Úàm–œ5umƒ.\\˜/MšyÏ’¾qÛ\r¦µ˜ÿ\0ÎOºÓâ \ZwÑzü7ƒ©;êŸšéO[İö¶õz~ñ›[ÒÓ\\”İ¥ëkDÛİ1>\'İhˆˆŸ\0Õ}oôZïæÆæ×+À÷«¤zog%³çÍÌFæ¦lù-ókZÑLşëM¦~moŸÌÌyŸ®u¾™Ş¸û_ËÇ#Ävã†ê­\\^ëfÃ¥ÔXcXñh÷N;ç×Éyˆù­cù˜øüÀ,/ééóœì§hº‡¨ú×§÷ø§ë>öÆ·#­:ûxtpLâÕÅ—¯’iâ~şH‰½çÛš>gò\r÷ß~ÃvûÔGBß¡{ƒÇÎ\\8ö1ïqû˜¢¿¨ã÷1ùûyğÍâÕ÷G™‰­¢kjÚÕ´LLÀ*¯ºHORı\'Ô<‡UvÇœè´Ö¦\\»:Ú–Á‹G>Y™™ö~>9Ô¬xŸŠıÏd~\"+\0Öİ´ì×¯ÎœßŞèÌY=Bt$`½k‚œÊN†[OŸ5Œ˜3c×¥#öøšÌÇÌş<lñJ~ğwÖêno•ê[ímì}şcëÛkk_sÍ-æõ®ææÅçßìómŠÖ¬[÷c™‰¨NŸH?OşÑúLÁnsO-ú¯­¶qı¼ıE¿­\\vÃIøœz¸|ÛôôŸæ}Ö½¿o+¾¸~Ùvÿ\0€ë~w¹<7Hñš½SÔÔÁ–åé‚?U·L4­1Ò×ŸŸlW#Û\"}±31ä8#‡¯¿M{¾§ı;òİÓz˜3ugŸ3ÓÑ–õÇ6±y‹`÷Úb+÷q_%\"m1X½©6˜ŠùNô;Ñ·;Yß+{«ûEÉOOæâõz;¬q~C‹Á¥‡N>ß¹‹\'Ş­9bÅ5‹eÁ[Ìã÷S÷ä€HXŸN^‘õu×œwqyæs}5ÊhqXøµ‹V›zÖÃ.L•´RÖ¬ÒŞs_Ï‹xŸ‰ñçÌÈG}ï¡·’•7Ô¦æDşéÏÒuËéÛ§ı`íú3èßÕ\rŸfzsÖgQq\ZûôŠnãáú.„ìÖ¾}µÉjoşèu¾&\'üSãÇl>²úeuWt×Ot^¯¨ïø_€éŒµÙĞãúo£pqØçj±5®Ö[cØ÷æÏX›Er^Öµ}Ö˜ñ6´ÈaœoÒœázÚÁÕõIÈò\\öNÎŸ!Êp9òmirbÔß¦ZoÖo—¢¶­oæ³1û½Ñğ	çÚ^Üq=¡í§MvÏ„ØË³©Óœv-ÙÍÿ\0Y³zÇ÷™ïó?¿%æ×·ÏæÒ¸\0\0\0\0\0\0\'[ô‡^t_?ĞÜ®ÎŞ¾—Qq{\\NÎmL¿o><[­ŠöÇí¼Vó1>\'ÄøWÏĞó£-öÓõÍbÃ3û)—€Å’ÑëhÍXŸü >O¡–9ÉiÃê‚Õ¤Ìûkn‹÷LGñ?¯3ş¾ ·¿M¶è~OK¨9_TyúÇ—â°_Ÿ©úJ¼®.+İ&ú˜6·2S\r¦µÇ>\'ş®¿Šs¿H®£êíŒœ‡¬~±Ï—œÜOîñ3l[[¾ïusåÇQ½mâbgæ<DDÇˆğ_Ò—ÓÛ¦¾¯â:‹oº3Ô:=?­¹m3—O\rùMªWnO,_k4}ÙÖ¬kÅ)ZÖ+3o!¥~¨İÛëc„ä{%Ô]µåø~JÚü¾nRáÇ¥¿ÇÎÎ½>î\\‘‡&şÆ+d­\'Z·šã¾H½¢ñöòT$Ÿ£_Iıì¯§Ü¾Õt¯=©Èu­©;CI§!“^-kÎ[b´Dà¶{MojxÛLQí¤Ö`h\0kŞ÷v§¶İÒèNcC¸ÁóØğq»¦ËÈñøv2jZq[ûÌ7ÉYœW1jø˜˜‰şPŸNîĞóœïªîÖr»8Íî#ã÷¹mş;S:Ó6:Ş5¯—ıuñ_’Ñû™-è¾YÅ6Ÿ·_w \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0èúã›ßé®‹çº‹‰Ğ¶ö÷Ælíêê×lÓŸ6<Vµ1ı¼¾[ù´DxÇK^|üDÏˆğœ§Iw»œ§y9.ætÏp«Ÿgwf:c \"»ÜôÛ%¢¹y+í[böµ½¾kl8ë[xÿ\0¶&<ôûôúõ+ê7“éL½Ô¿Xôn¸HıFJõVÕòìÆL™g&Íxı<Õ·í’m|qOßæmškâÁs]Ñı?Ûş’áú¥4GÃğZXxı,û^i‡bµ‰µ¦miñ6™™™ó332è\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0§p{SÛ~ëéiq½Éè©5¸İ˜ÜÓÇÈê×4kçöÍ~å<üÖŞ&~cı?¤+\0\0k/SëÜıƒë®3¶=Ÿšê¾[‡ÍÄñZ˜2S¾ş×xËî¼Å+ã,å™´ÄxÇ>Aˆú.ôãŸÓgb:g º–8mŞ¨ĞÅµ}íıhm¶s}ëá®Y~JÄÅ\"m>=Ó³â\"+X\rö\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?ÿÙ','image/jpeg','2013-11-13 00:00:00','A');
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
INSERT INTO `tipo_consulta_medica` VALUES (1,1,'Consulta MÃ©dica','Consulta General','A');
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
INSERT INTO `usuario` VALUES (1,1,'solis.mario91@gmail.com','21232f297a57a5a743894a0e4a801fc3','A','Wario Solis','user_1.jpg','123','123'),(1,2,'msolis_91@gmail.com','21232f297a57a5a743894a0e4a801fc3','A','Mario Solis',NULL,'123',''),(1,3,'info@gmail.com','f4455f01b58a07f90b6567ef350c0901','A','info',NULL,'123','123');
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

-- Dump completed on 2013-11-15  5:02:32

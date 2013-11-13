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
INSERT INTO `cliente` VALUES (1,1,'Mario Solis','7550383-2','Guatemala','2010-01-01 00:00:00','42111634','A');
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
  `FechaNacimiento` datetime DEFAULT NULL,
  `Pais` int(11) NOT NULL COMMENT '	',
  `Departamento` int(11) NOT NULL,
  `Estado_Civil` char(1) NOT NULL,
  `FechaRegistro` datetime NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Clave` varchar(25) NOT NULL,
  `Genero` char(1) NOT NULL,
  `Estatus` char(1) NOT NULL,
  PRIMARY KEY (`Corporacion`,`Id`),
  KEY `fk_PACIENTE_CORPORACION1_idx` (`Corporacion`),
  KEY `fk_PACIENTE_ESTADO_CIVIL1_idx` (`Corporacion`,`Estado_Civil`),
  KEY `fk_PACIENTE_GENERO1_idx` (`Corporacion`,`Genero`),
  KEY `fk_PACIENTE_DEPARTAMENTO1_idx` (`Pais`,`Departamento`),
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
INSERT INTO `paciente` VALUES (1,1,'Mario Solis','Guatemala','123','1991-07-13 00:00:00',1,1,'1','2010-01-01 00:00:00','solis.mario91@gmail.com','123','1','A');
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
  CONSTRAINT `fk_PACIENTE_DORMITORIO_DOMITORIO1` FOREIGN KEY (`Corporacion`, `Hospital`, `Dormitorio`) REFERENCES `domitorio` (`Corporacion`, `Hospital`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_PACIENTE_DORMITORIO_CONSULTA_MEDICA1` FOREIGN KEY (`Corporacion`, `Hospital`, `Consulta_Medica`) REFERENCES `consulta_medica` (`Corporacion`, `Hospital`, `Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `Clave` varchar(20) DEFAULT NULL,
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

-- Dump completed on 2013-11-09 13:21:11

-- MySQL dump 10.13  Distrib 5.7.21, for Win64 (x86_64)
--
-- Host: localhost    Database: bdd_madera
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `cd_client` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `portable` varchar(255) DEFAULT NULL,
  `adresse_numero` int(11) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `Adresse_complementaire` varchar(255) DEFAULT NULL,
  `adresse_ville` varchar(255) DEFAULT NULL,
  `adresse_codepostale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cd_client`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Chaigneau','Gautier','gautier.chaigneau@gmail.Com','0562339547','0652458798',8,'rue dastes','','TARBES','65000'),(15,'Arnaune','Benjam','benji@gmail.com','05623131','066135435',7,'impasse des ecu','','Odos','65650'),(16,'Zoulou','Eric','azda@gmail.com','05643042','06354354',6,'rue du fouet','','TOULOUSE','31000'),(17,'Benabia','Chloé','dazdazd@gmail.com','05624354','06354354',18,'rue des pipelettes','','PAU','64000');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composant`
--

DROP TABLE IF EXISTS `composant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composant` (
  `cd_composant` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `caracteristique` varchar(255) DEFAULT NULL,
  `reference_fournisseur` varchar(255) DEFAULT NULL,
  `tarif` float DEFAULT NULL,
  `cd_famille_composant` int(11) DEFAULT NULL,
  PRIMARY KEY (`cd_composant`),
  KEY `FK_composant_cd_famille_composant` (`cd_famille_composant`),
  CONSTRAINT `FK_composant_cd_famille_composant` FOREIGN KEY (`cd_famille_composant`) REFERENCES `famille_composant` (`cd_famille_composant`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composant`
--

LOCK TABLES `composant` WRITE;
/*!40000 ALTER TABLE `composant` DISABLE KEYS */;
INSERT INTO `composant` VALUES (1,'vis à bois','vis pour le bois','DTR0021458',1,1),(5,'Bois','Fintion Bois sur bardage.',NULL,NULL,3),(6,'Crépis','Finition crepis sur bardage extérieur.',NULL,NULL,3),(7,'Ouate synthétique','',NULL,NULL,2),(8,'Ouate Minérale','',NULL,NULL,2),(10,'Tuile','Pour une couverture tuile.',NULL,NULL,5),(11,'Ardoise','Pour une couverture ardoise.',NULL,NULL,5),(12,'Blanc','',NULL,NULL,4),(13,'Gris','',NULL,NULL,4),(14,'Rouge','',NULL,NULL,4),(15,'Orange','',NULL,NULL,4),(16,'Vert','',NULL,NULL,4),(17,'Bleu','',NULL,NULL,4),(18,'Lisse',NULL,NULL,30,NULL),(19,'Contrefort',NULL,NULL,10,NULL),(20,'Sabot d\'assemblage',NULL,NULL,35,NULL),(21,'Goujons de fixation',NULL,NULL,20,NULL),(22,'Support de sol',NULL,NULL,65,NULL),(23,'Montant vertical',NULL,NULL,100,NULL),(24,'Bardage',NULL,NULL,500,NULL),(25,'Pare-pluie',NULL,NULL,400,NULL),(26,'Tasseau',NULL,NULL,250,NULL),(27,'Pare vapeur',NULL,NULL,600,NULL);
/*!40000 ALTER TABLE `composant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composant_taxe`
--

DROP TABLE IF EXISTS `composant_taxe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composant_taxe` (
  `cd_composant` int(11) NOT NULL,
  `cd_taxe` int(11) NOT NULL,
  PRIMARY KEY (`cd_composant`,`cd_taxe`),
  KEY `FK_composant_taxe_cd_taxe` (`cd_taxe`),
  CONSTRAINT `FK_composant_taxe_cd_composant` FOREIGN KEY (`cd_composant`) REFERENCES `composant` (`cd_composant`),
  CONSTRAINT `FK_composant_taxe_cd_taxe` FOREIGN KEY (`cd_taxe`) REFERENCES `taxe` (`cd_taxe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composant_taxe`
--

LOCK TABLES `composant_taxe` WRITE;
/*!40000 ALTER TABLE `composant_taxe` DISABLE KEYS */;
/*!40000 ALTER TABLE `composant_taxe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composant_unite`
--

DROP TABLE IF EXISTS `composant_unite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composant_unite` (
  `cd_composant` int(11) NOT NULL,
  `cd_unite` int(11) NOT NULL,
  PRIMARY KEY (`cd_composant`,`cd_unite`),
  KEY `FK_composant_unite_cd_unite` (`cd_unite`),
  CONSTRAINT `FK_composant_unite_cd_composant` FOREIGN KEY (`cd_composant`) REFERENCES `composant` (`cd_composant`),
  CONSTRAINT `FK_composant_unite_cd_unite` FOREIGN KEY (`cd_unite`) REFERENCES `unite_mesure` (`cd_unite`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composant_unite`
--

LOCK TABLES `composant_unite` WRITE;
/*!40000 ALTER TABLE `composant_unite` DISABLE KEYS */;
/*!40000 ALTER TABLE `composant_unite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `cd_contact` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `portable` varchar(255) DEFAULT NULL,
  `cd_fournisseur` int(11) DEFAULT NULL,
  PRIMARY KEY (`cd_contact`),
  KEY `FK_contact_cd_fournisseur` (`cd_fournisseur`),
  CONSTRAINT `FK_contact_cd_fournisseur` FOREIGN KEY (`cd_fournisseur`) REFERENCES `fournisseur` (`cd_fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devis`
--

DROP TABLE IF EXISTS `devis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devis` (
  `cd_devis` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) DEFAULT NULL,
  `remise_tarifaire` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `cd_projet` int(11) DEFAULT NULL,
  `cd_produit` int(11) DEFAULT NULL,
  PRIMARY KEY (`cd_devis`),
  KEY `FK_devis_cd_projet` (`cd_projet`),
  KEY `FK_devis_cd_produit` (`cd_produit`),
  CONSTRAINT `FK_devis_cd_produit` FOREIGN KEY (`cd_produit`) REFERENCES `produit` (`cd_produit`),
  CONSTRAINT `FK_devis_cd_projet` FOREIGN KEY (`cd_projet`) REFERENCES `projet` (`cd_projet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devis`
--

LOCK TABLES `devis` WRITE;
/*!40000 ALTER TABLE `devis` DISABLE KEYS */;
/*!40000 ALTER TABLE `devis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etat_devis`
--

DROP TABLE IF EXISTS `etat_devis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etat_devis` (
  `cd_etat` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cd_etat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etat_devis`
--

LOCK TABLES `etat_devis` WRITE;
/*!40000 ALTER TABLE `etat_devis` DISABLE KEYS */;
/*!40000 ALTER TABLE `etat_devis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `famille_composant`
--

DROP TABLE IF EXISTS `famille_composant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `famille_composant` (
  `cd_famille_composant` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cd_famille_composant`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `famille_composant`
--

LOCK TABLES `famille_composant` WRITE;
/*!40000 ALTER TABLE `famille_composant` DISABLE KEYS */;
INSERT INTO `famille_composant` VALUES (1,'visserie','ensemble de vis'),(2,'Isolation','Tous les isolants avec lesquels on rempli les modules.'),(3,'Finition extérieur','Toutes les finitions extérieures des maisons.'),(4,'Finition intérieur','Toutes les finitions intérieurs des maisons.'),(5,'Couverture','Tous les types de couvertures de maison.');
/*!40000 ALTER TABLE `famille_composant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseur`
--

DROP TABLE IF EXISTS `fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournisseur` (
  `cd_fournisseur` int(11) NOT NULL AUTO_INCREMENT,
  `raison_social` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `portable` varchar(255) DEFAULT NULL,
  `adresse_numeros` int(11) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `adresse_complementaire` varchar(255) DEFAULT NULL,
  `adresse_ville` varchar(255) DEFAULT NULL,
  `adresse_codepostale` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cd_fournisseur`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseur`
--

LOCK TABLES `fournisseur` WRITE;
/*!40000 ALTER TABLE `fournisseur` DISABLE KEYS */;
INSERT INTO `fournisseur` VALUES (1,'Mr Bricolage','mr.bricolage@gmail.com','0562857845','0652125489',5,'rue du moulin',NULL,'TOULOUSE','31000');
/*!40000 ALTER TABLE `fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseur_composant`
--

DROP TABLE IF EXISTS `fournisseur_composant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournisseur_composant` (
  `cd_composant` int(11) NOT NULL,
  `cd_fournisseur` int(11) NOT NULL,
  PRIMARY KEY (`cd_composant`,`cd_fournisseur`),
  KEY `FK_fournisseur_composant_cd_fournisseur` (`cd_fournisseur`),
  CONSTRAINT `FK_fournisseur_composant_cd_composant` FOREIGN KEY (`cd_composant`) REFERENCES `composant` (`cd_composant`),
  CONSTRAINT `FK_fournisseur_composant_cd_fournisseur` FOREIGN KEY (`cd_fournisseur`) REFERENCES `fournisseur` (`cd_fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseur_composant`
--

LOCK TABLES `fournisseur_composant` WRITE;
/*!40000 ALTER TABLE `fournisseur_composant` DISABLE KEYS */;
INSERT INTO `fournisseur_composant` VALUES (1,1);
/*!40000 ALTER TABLE `fournisseur_composant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gamme`
--

DROP TABLE IF EXISTS `gamme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gamme` (
  `cd_gamme` int(11) NOT NULL AUTO_INCREMENT,
  `finition_exterieur` int(11) DEFAULT NULL,
  `isolant` int(11) DEFAULT NULL,
  `couverture` int(11) DEFAULT NULL,
  `qualite_huisserie` varchar(255) DEFAULT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `finition_interieur` int(11) DEFAULT NULL,
  PRIMARY KEY (`cd_gamme`),
  KEY `FK_gamme_finition_exterieur_idx` (`finition_exterieur`),
  KEY `FK_gamme_finition_interieur_idx` (`finition_interieur`),
  KEY `FK_gamme_isolant_idx` (`isolant`),
  KEY `FK_gamme_couverture_idx` (`couverture`),
  CONSTRAINT `FK_gamme_couverture` FOREIGN KEY (`couverture`) REFERENCES `composant` (`cd_composant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_gamme_finition_exterieur` FOREIGN KEY (`finition_exterieur`) REFERENCES `composant` (`cd_composant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_gamme_finition_interieur` FOREIGN KEY (`finition_interieur`) REFERENCES `composant` (`cd_composant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_gamme_isolant` FOREIGN KEY (`isolant`) REFERENCES `composant` (`cd_composant`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gamme`
--

LOCK TABLES `gamme` WRITE;
/*!40000 ALTER TABLE `gamme` DISABLE KEYS */;
INSERT INTO `gamme` VALUES (3,5,8,11,'PVC','Nature',12),(4,6,8,10,'PVC','Moderne',12);
/*!40000 ALTER TABLE `gamme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marge`
--

DROP TABLE IF EXISTS `marge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marge` (
  `cd_marge` int(11) NOT NULL AUTO_INCREMENT,
  `pourcentage` float NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cd_marge`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marge`
--

LOCK TABLES `marge` WRITE;
/*!40000 ALTER TABLE `marge` DISABLE KEYS */;
/*!40000 ALTER TABLE `marge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modele`
--

DROP TABLE IF EXISTS `modele`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modele` (
  `cd_modele` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `nbre_etage` int(11) DEFAULT NULL,
  `lien_brochure` varchar(255) DEFAULT NULL,
  `cd_gamme` int(11) DEFAULT NULL,
  PRIMARY KEY (`cd_modele`),
  KEY `FK_modele_cd_gamme` (`cd_gamme`),
  CONSTRAINT `FK_modele_cd_gamme` FOREIGN KEY (`cd_gamme`) REFERENCES `gamme` (`cd_gamme`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modele`
--

LOCK TABLES `modele` WRITE;
/*!40000 ALTER TABLE `modele` DISABLE KEYS */;
INSERT INTO `modele` VALUES (4,'Wood','Maison style cabane',0,'www.google.fr',3),(5,'Elegance','Maison style moderne',0,'www.google.fr',4),(6,'City','Maison style moderne',1,'CityPlan.jpg',4);
/*!40000 ALTER TABLE `modele` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modele_module`
--

DROP TABLE IF EXISTS `modele_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modele_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantite` int(11) DEFAULT NULL,
  `cd_module` int(11) DEFAULT NULL,
  `cd_modele` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_modele_module_cd_modele_idx` (`cd_modele`),
  KEY `FK_modele_module_cd_module_idx` (`cd_module`),
  CONSTRAINT `FK_modele_module_cd_modele` FOREIGN KEY (`cd_modele`) REFERENCES `modele` (`cd_modele`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_modele_module_cd_module` FOREIGN KEY (`cd_module`) REFERENCES `module` (`cd_module`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modele_module`
--

LOCK TABLES `modele_module` WRITE;
/*!40000 ALTER TABLE `modele_module` DISABLE KEYS */;
INSERT INTO `modele_module` VALUES (1,1,3,6),(2,1,9,6),(3,1,4,6),(4,1,5,6),(5,1,6,6),(6,1,7,6),(7,1,8,6);
/*!40000 ALTER TABLE `modele_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modele_piece`
--

DROP TABLE IF EXISTS `modele_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modele_piece` (
  `superficie` float DEFAULT NULL,
  `cd_modele` int(11) NOT NULL,
  `cd_piece` int(11) NOT NULL,
  PRIMARY KEY (`cd_modele`,`cd_piece`),
  KEY `FK_modele_piece_cd_piece` (`cd_piece`),
  CONSTRAINT `FK_modele_piece_cd_modele` FOREIGN KEY (`cd_modele`) REFERENCES `modele` (`cd_modele`),
  CONSTRAINT `FK_modele_piece_cd_piece` FOREIGN KEY (`cd_piece`) REFERENCES `piece` (`cd_piece`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modele_piece`
--

LOCK TABLES `modele_piece` WRITE;
/*!40000 ALTER TABLE `modele_piece` DISABLE KEYS */;
/*!40000 ALTER TABLE `modele_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module` (
  `cd_module` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(255) DEFAULT NULL,
  `cctp` varchar(255) DEFAULT NULL,
  `coupe_principe` varchar(255) DEFAULT NULL,
  `longueur` float DEFAULT NULL,
  `hauteur` float DEFAULT NULL,
  `angle_1` float DEFAULT NULL,
  `angle_2` float DEFAULT NULL,
  `tarif` float DEFAULT NULL,
  `config` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cd_module`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (3,'1: Module nord-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'170'),(4,'3: Module nord-3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'120&entrant;490'),(5,'4: Module est-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'290&entrant;490'),(6,'5: Module sud-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'310'),(7,'6: Module sud-2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'380&entrant;250'),(8,'7: Module ouest-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'420&entrant;125'),(9,'2: Module nord-2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'170');
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_composant`
--

DROP TABLE IF EXISTS `module_composant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_composant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantite` int(11) DEFAULT NULL,
  `cd_composant` int(11) DEFAULT NULL,
  `cd_module` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_module_composant_cd_module_idx` (`cd_module`),
  KEY `FK_module_composant_cd_composant_idx` (`cd_composant`),
  CONSTRAINT `FK_module_composant_cd_composant` FOREIGN KEY (`cd_composant`) REFERENCES `composant` (`cd_composant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_module_composant_cd_module` FOREIGN KEY (`cd_module`) REFERENCES `module` (`cd_module`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_composant`
--

LOCK TABLES `module_composant` WRITE;
/*!40000 ALTER TABLE `module_composant` DISABLE KEYS */;
INSERT INTO `module_composant` VALUES (1,15,18,3),(2,18,19,3),(3,25,20,3),(4,35,21,3),(5,8,22,3),(6,4,23,3),(7,3,24,3),(8,3,25,3),(9,4,26,3),(10,4,27,3),(11,16,18,9),(12,17,19,9),(13,5,20,9),(14,26,21,9),(15,18,22,9),(16,32,23,9),(17,3,24,9),(18,3,25,9),(19,4,26,9),(20,4,27,9),(21,27,18,4),(22,41,19,4),(23,23,20,4),(24,29,21,4),(25,15,22,4),(26,10,23,4),(27,2,24,4),(28,2,25,4),(29,3,26,4),(30,3,27,4),(31,12,18,5),(32,16,19,5),(33,18,20,5),(34,12,21,5),(35,14,22,5),(36,3,23,5),(37,3,24,5),(38,3,25,5),(39,4,26,5),(40,5,27,5),(41,19,18,6),(42,21,20,6),(43,15,21,6),(44,8,22,6),(45,19,23,6),(46,4,24,6),(47,4,25,6),(48,5,26,6),(49,5,27,6),(50,15,18,7),(51,9,19,7),(52,36,20,7),(53,45,21,7),(54,16,22,7),(55,13,23,7),(56,5,24,7),(57,5,25,7),(58,4,26,7),(59,4,27,7),(60,16,18,8),(61,22,19,8),(62,16,20,8),(63,20,21,8),(64,23,22,8),(65,32,23,8),(66,3,24,8),(67,3,25,8),(68,3,26,8),(69,6,27,8),(70,19,18,5),(71,22,19,5),(72,16,20,5),(73,18,21,5),(74,26,22,5),(75,14,23,5),(76,4,24,5),(77,4,25,5),(78,5,26,5),(79,5,27,5);
/*!40000 ALTER TABLE `module_composant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paiement` (
  `cd_paiement` int(11) NOT NULL AUTO_INCREMENT,
  `etape` varchar(255) DEFAULT NULL,
  `pourcentage_paiement` float DEFAULT NULL,
  PRIMARY KEY (`cd_paiement`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paiement`
--

LOCK TABLES `paiement` WRITE;
/*!40000 ALTER TABLE `paiement` DISABLE KEYS */;
/*!40000 ALTER TABLE `paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piece`
--

DROP TABLE IF EXISTS `piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piece` (
  `cd_piece` int(11) NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cd_piece`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piece`
--

LOCK TABLES `piece` WRITE;
/*!40000 ALTER TABLE `piece` DISABLE KEYS */;
/*!40000 ALTER TABLE `piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit` (
  `cd_produit` int(11) NOT NULL AUTO_INCREMENT,
  `note` varchar(255) DEFAULT NULL,
  `nbr_etage` float DEFAULT NULL,
  `cd_devis` int(11) DEFAULT NULL,
  `cd_projet` int(11) NOT NULL,
  `cd_gamme` int(11) NOT NULL,
  `plan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cd_produit`),
  KEY `FK_produit_cd_devis` (`cd_devis`),
  KEY `FK_produit_cd_projet_idx` (`cd_projet`),
  KEY `FK_produit_cd_gamme_idx` (`cd_gamme`),
  CONSTRAINT `FK_produit_cd_devis` FOREIGN KEY (`cd_devis`) REFERENCES `devis` (`cd_devis`),
  CONSTRAINT `FK_produit_cd_gamme` FOREIGN KEY (`cd_gamme`) REFERENCES `gamme` (`cd_gamme`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_produit_cd_projet` FOREIGN KEY (`cd_projet`) REFERENCES `projet` (`cd_projet`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (38,'Maison 1',1,NULL,2,4,'CityPlan.jpg');
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit_module`
--

DROP TABLE IF EXISTS `produit_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantite` int(11) DEFAULT NULL,
  `cd_module` int(11) DEFAULT NULL,
  `cd_produit` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_produit_module_cd_produit_idx` (`cd_produit`),
  KEY `FK_produit_module_cd_module_idx` (`cd_module`),
  CONSTRAINT `FK_produit_module_cd_module` FOREIGN KEY (`cd_module`) REFERENCES `module` (`cd_module`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_produit_module_cd_produit` FOREIGN KEY (`cd_produit`) REFERENCES `produit` (`cd_produit`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit_module`
--

LOCK TABLES `produit_module` WRITE;
/*!40000 ALTER TABLE `produit_module` DISABLE KEYS */;
INSERT INTO `produit_module` VALUES (22,1,3,38),(23,1,7,38),(24,1,9,38),(25,1,4,38),(26,1,6,38),(27,1,5,38),(28,1,8,38);
/*!40000 ALTER TABLE `produit_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit_piece`
--

DROP TABLE IF EXISTS `produit_piece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit_piece` (
  `superficie` float DEFAULT NULL,
  `cd_produit` int(11) NOT NULL,
  `cd_piece` int(11) NOT NULL,
  PRIMARY KEY (`cd_produit`,`cd_piece`),
  KEY `FK_produit_piece_cd_piece` (`cd_piece`),
  CONSTRAINT `FK_produit_piece_cd_piece` FOREIGN KEY (`cd_piece`) REFERENCES `piece` (`cd_piece`),
  CONSTRAINT `FK_produit_piece_cd_produit` FOREIGN KEY (`cd_produit`) REFERENCES `produit` (`cd_produit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit_piece`
--

LOCK TABLES `produit_piece` WRITE;
/*!40000 ALTER TABLE `produit_piece` DISABLE KEYS */;
/*!40000 ALTER TABLE `produit_piece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projet`
--

DROP TABLE IF EXISTS `projet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projet` (
  `cd_projet` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `cd_client` int(11) DEFAULT NULL,
  PRIMARY KEY (`cd_projet`),
  KEY `FK_projet_cd_client` (`cd_client`),
  CONSTRAINT `FK_projet_cd_client` FOREIGN KEY (`cd_client`) REFERENCES `client` (`cd_client`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projet`
--

LOCK TABLES `projet` WRITE;
/*!40000 ALTER TABLE `projet` DISABLE KEYS */;
INSERT INTO `projet` VALUES (2,'Projet Maison PAU Chaigneau','2018-06-02',1);
/*!40000 ALTER TABLE `projet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projet_paiement`
--

DROP TABLE IF EXISTS `projet_paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projet_paiement` (
  `date_avancement` date DEFAULT NULL,
  `cd_paiement` int(11) NOT NULL,
  `cd_projet` int(11) NOT NULL,
  PRIMARY KEY (`cd_paiement`,`cd_projet`),
  KEY `FK_projet_paiement_cd_projet` (`cd_projet`),
  CONSTRAINT `FK_projet_paiement_cd_paiement` FOREIGN KEY (`cd_paiement`) REFERENCES `paiement` (`cd_paiement`),
  CONSTRAINT `FK_projet_paiement_cd_projet` FOREIGN KEY (`cd_projet`) REFERENCES `projet` (`cd_projet`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projet_paiement`
--

LOCK TABLES `projet_paiement` WRITE;
/*!40000 ALTER TABLE `projet_paiement` DISABLE KEYS */;
/*!40000 ALTER TABLE `projet_paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suivi_etat`
--

DROP TABLE IF EXISTS `suivi_etat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suivi_etat` (
  `date_suivi` date NOT NULL,
  `cd_devis` int(11) NOT NULL,
  `cd_etat` int(11) NOT NULL,
  PRIMARY KEY (`cd_devis`,`cd_etat`),
  KEY `FK_suivi_etat_cd_etat` (`cd_etat`),
  CONSTRAINT `FK_suivi_etat_cd_devis` FOREIGN KEY (`cd_devis`) REFERENCES `devis` (`cd_devis`),
  CONSTRAINT `FK_suivi_etat_cd_etat` FOREIGN KEY (`cd_etat`) REFERENCES `etat_devis` (`cd_etat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suivi_etat`
--

LOCK TABLES `suivi_etat` WRITE;
/*!40000 ALTER TABLE `suivi_etat` DISABLE KEYS */;
/*!40000 ALTER TABLE `suivi_etat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxe`
--

DROP TABLE IF EXISTS `taxe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxe` (
  `cd_taxe` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `taux` float DEFAULT NULL,
  PRIMARY KEY (`cd_taxe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxe`
--

LOCK TABLES `taxe` WRITE;
/*!40000 ALTER TABLE `taxe` DISABLE KEYS */;
/*!40000 ALTER TABLE `taxe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unite_mesure`
--

DROP TABLE IF EXISTS `unite_mesure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unite_mesure` (
  `cd_unite` int(11) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cd_unite`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unite_mesure`
--

LOCK TABLES `unite_mesure` WRITE;
/*!40000 ALTER TABLE `unite_mesure` DISABLE KEYS */;
/*!40000 ALTER TABLE `unite_mesure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `cd_utilisateur` int(11) NOT NULL,
  `identifiant` varchar(255) DEFAULT NULL,
  `mot_de_passe` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `acces` int(11) DEFAULT NULL,
  PRIMARY KEY (`cd_utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-07  2:53:44

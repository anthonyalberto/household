-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: household_development
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `balance_utilisateurs`
--

DROP TABLE IF EXISTS `balance_utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance_utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_id` int(11) NOT NULL,
  `montant_cents` int(11) NOT NULL,
  `mois` int(11) NOT NULL,
  `annee` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_balance_utilisateurs_on_utilisateur_id` (`utilisateur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balance_utilisateurs`
--

LOCK TABLES `balance_utilisateurs` WRITE;
/*!40000 ALTER TABLE `balance_utilisateurs` DISABLE KEYS */;
/*!40000 ALTER TABLE `balance_utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `balances`
--

DROP TABLE IF EXISTS `balances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `montant_cents` int(11) NOT NULL,
  `fini` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_balances_on_fini` (`fini`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `balances`
--

LOCK TABLES `balances` WRITE;
/*!40000 ALTER TABLE `balances` DISABLE KEYS */;
INSERT INTO `balances` VALUES (1,'Balance courante',0,0,'2012-10-21 14:38:00','2012-10-21 14:38:00');
/*!40000 ALTER TABLE `balances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
INSERT INTO `chats` VALUES (1,'Miniwu','miniwu.jpg','2012-10-21 14:37:58','2012-10-21 14:37:58'),(2,'Domino','domino.jpg','2012-10-21 14:37:58','2012-10-21 14:37:58');
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monnaies`
--

DROP TABLE IF EXISTS `monnaies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monnaies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pourcent_vers_cad` float NOT NULL DEFAULT '100',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_monnaies_on_iso` (`iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monnaies`
--

LOCK TABLES `monnaies` WRITE;
/*!40000 ALTER TABLE `monnaies` DISABLE KEYS */;
/*!40000 ALTER TABLE `monnaies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mouvement_recurrents`
--

DROP TABLE IF EXISTS `mouvement_recurrents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mouvement_recurrents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payeur_id` int(11) NOT NULL,
  `montant_cents` int(11) NOT NULL,
  `type_de_mouvement_id` int(11) NOT NULL,
  `pourcent_a_facturer_a_lautre` float NOT NULL DEFAULT '50',
  `frequence_manuelle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frequence_automatique` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mouvement_recurrents_on_payeur_id` (`payeur_id`),
  KEY `index_mouvement_recurrents_on_type_de_mouvement_id` (`type_de_mouvement_id`),
  KEY `index_mouvement_recurrents_on_payeur_id_and_type_de_mouvement_id` (`payeur_id`,`type_de_mouvement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mouvement_recurrents`
--

LOCK TABLES `mouvement_recurrents` WRITE;
/*!40000 ALTER TABLE `mouvement_recurrents` DISABLE KEYS */;
/*!40000 ALTER TABLE `mouvement_recurrents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mouvements`
--

DROP TABLE IF EXISTS `mouvements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mouvements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payeur_id` int(11) NOT NULL,
  `texte` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `montant_cents` int(11) NOT NULL,
  `type_de_mouvement_id` int(11) DEFAULT NULL,
  `balance_id` int(11) DEFAULT NULL,
  `fini` tinyint(1) NOT NULL DEFAULT '0',
  `pourcent_a_facturer_a_lautre` float NOT NULL DEFAULT '50',
  `revenu` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mouvements_on_payeur_id` (`payeur_id`),
  KEY `index_mouvements_on_balance_id` (`balance_id`),
  KEY `index_mouvements_on_type_de_mouvement_id` (`type_de_mouvement_id`),
  KEY `index_mouvements_on_fini` (`fini`),
  KEY `index_mouvements_on_payeur_id_and_fini` (`payeur_id`,`fini`),
  KEY `index_mouvements_on_payeur_id_and_type_de_mouvement_id` (`payeur_id`,`type_de_mouvement_id`),
  KEY `index_mouvements_on_payeur_id_and_type_de_mouvement_id_and_fini` (`payeur_id`,`type_de_mouvement_id`,`fini`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mouvements`
--

LOCK TABLES `mouvements` WRITE;
/*!40000 ALTER TABLE `mouvements` DISABLE KEYS */;
/*!40000 ALTER TABLE `mouvements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20121020191010'),('20121020200806'),('20121020201202'),('20121020201809'),('20121020202427'),('20121020203107'),('20121020203310'),('20121021124718'),('20121021125250');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `texte_de_chats`
--

DROP TABLE IF EXISTS `texte_de_chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `texte_de_chats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_de_texte` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `chat_id` int(11) DEFAULT NULL,
  `texte` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_texte_de_chats_on_chat_id` (`chat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `texte_de_chats`
--

LOCK TABLES `texte_de_chats` WRITE;
/*!40000 ALTER TABLE `texte_de_chats` DISABLE KEYS */;
INSERT INTO `texte_de_chats` VALUES (1,'Pensée',1,'Où sont mes croquettes ?','2012-10-21 14:37:58','2012-10-21 14:37:58'),(2,'Pensée',1,'Le jour où le Sumo sera un sport olympique, j\'aurais une chance de médaille.','2012-10-21 14:37:58','2012-10-21 14:37:58'),(3,'Pensée',1,'Qui est l\'enfoiré qui m\'a mis à la diète ?','2012-10-21 14:37:58','2012-10-21 14:37:58'),(4,'Pensée',1,'Moi, gros ? Tu t\'es pas vu toi.','2012-10-21 14:37:58','2012-10-21 14:37:58'),(5,'Pensée',1,'Aujourd\'hui je vais ... dormir, comme d\'habitude.','2012-10-21 14:37:58','2012-10-21 14:37:58'),(6,'Pensée',1,'Je serais propre à la litière quand l\'autre fatigant arrêtera de me casser les oreilles.','2012-10-21 14:37:58','2012-10-21 14:37:58'),(7,'Pensée',2,'Miawwwwwwwwwwwwww Miawwwwwwwwwwwwwwwww Miawwwwwwwwwwwwwwwwwww','2012-10-21 14:37:58','2012-10-21 14:37:58'),(8,'Pensée',2,'Cette nuit Domino le roi a joué à \'On connait la chanson\'. Cela n\'a pas plu à l\'autre rabat-joie à en croire le vol plané de Domino le roi du 3eme étage.','2012-10-21 14:37:58','2012-10-21 14:37:58'),(9,'Pensée',2,'A cause de l\'autre gros tas, Domino le roi mange des croquettes de régime. Le chef de meute est désemparé.','2012-10-21 14:37:58','2012-10-21 14:37:58'),(10,'Pensée',2,'Domino le roi aime tous les membres de sa meute, sauf un.','2012-10-21 14:37:58','2012-10-21 14:37:58'),(11,'Pensée',2,'Domino le roi a mangé une touffe de poil - et oui encore. Heureusement Domino le roi ne nettoie pas le plancher.','2012-10-21 14:37:58','2012-10-21 14:37:58'),(12,'Pensée',2,'Domino le roi n\'aime pas beaucoup que son larbin ne se ramasse pas dans la litière. Domino le roi va faire ailleurs puisque c\'est comme cela.','2012-10-21 14:37:58','2012-10-21 14:37:58');
/*!40000 ALTER TABLE `texte_de_chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_de_mouvements`
--

DROP TABLE IF EXISTS `type_de_mouvements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_de_mouvements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `revenu` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_type_de_mouvements_on_revenu` (`revenu`),
  KEY `index_type_de_mouvements_on_revenu_and_position` (`revenu`,`position`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_de_mouvements`
--

LOCK TABLES `type_de_mouvements` WRITE;
/*!40000 ALTER TABLE `type_de_mouvements` DISABLE KEYS */;
INSERT INTO `type_de_mouvements` VALUES (1,'Epicerie',1,'epicerie.jpg',0,'2012-10-21 14:37:59','2012-10-21 14:37:59'),(2,'Walmart',2,'walmart.jpg',0,'2012-10-21 14:37:59','2012-10-21 14:37:59'),(3,'jardin_bricolage_maison_etc',3,'jardin_bricolage.jpg',0,'2012-10-21 14:37:59','2012-10-21 14:37:59'),(4,'Chats',4,'chats.jpg',0,'2012-10-21 14:37:59','2012-10-21 14:37:59'),(5,'Scrapbooking',5,'scrapbooking.jpg',0,'2012-10-21 14:37:59','2012-10-21 14:37:59'),(6,'Taxes',7,'taxes.jpg',0,'2012-10-21 14:37:59','2012-10-21 14:37:59'),(7,'Custom',6,'custom.jpg',0,'2012-10-21 14:37:59','2012-10-21 14:37:59'),(8,'Hypotheque',100,'hypotheque.jpg',0,'2012-10-21 14:37:59','2012-10-21 14:37:59'),(9,'frais_de_condo',101,'frais_de_condo.jpg',0,'2012-10-21 14:37:59','2012-10-21 14:37:59'),(10,'assurance_condo',102,'assurance-condo.png',0,'2012-10-21 14:37:59','2012-10-21 14:37:59'),(11,'Videotron',103,'videotron.gif',0,'2012-10-21 14:38:00','2012-10-21 14:38:00'),(12,'Hydro',104,'hydro.jpg',0,'2012-10-21 14:38:00','2012-10-21 14:38:00'),(13,'Communauto',105,'communauto.jpg',0,'2012-10-21 14:38:00','2012-10-21 14:38:00'),(14,'Fido',106,'fido.png',0,'2012-10-21 14:38:00','2012-10-21 14:38:00'),(15,'Salaire',2,'salaire.jpg',1,'2012-10-21 14:38:00','2012-10-21 14:38:00'),(16,'Kijiji',1,'kijiji.jpg',1,'2012-10-21 14:38:00','2012-10-21 14:38:00'),(17,'retour_dimpot',3,'retour_impot.jpg',1,'2012-10-21 14:38:00','2012-10-21 14:38:00');
/*!40000 ALTER TABLE `type_de_mouvements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `chat_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_utilisateurs_on_email` (`email`),
  UNIQUE KEY `index_utilisateurs_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES (1,'alberto.anthony@gmail.com','$2a$10$urK3sFLKXYVsvNLeKZ/9d.DyKVYlTZxlUoO5FY7Bi5e1RkZ4geHLy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'Anthony',1,'2012-10-21 14:37:59','2012-10-21 14:37:59'),(2,'katwondoo@gmail.com','$2a$10$ZTuK4aPgNlXw58dWiFi/OuI/7LSXPpd0faXqgV8U2KQuErHf2yxlG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'Catherine',2,'2012-10-21 14:37:59','2012-10-21 14:37:59');
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-21  7:38:12

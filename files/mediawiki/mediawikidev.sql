-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: mediawikidev
-- ------------------------------------------------------
-- Server version	5.7.25-0ubuntu0.16.04.2

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
-- Table structure for table `devactor`
--

DROP TABLE IF EXISTS `devactor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devactor` (
  `actor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `actor_user` int(10) unsigned DEFAULT NULL,
  `actor_name` varbinary(255) NOT NULL,
  PRIMARY KEY (`actor_id`),
  UNIQUE KEY `actor_name` (`actor_name`),
  UNIQUE KEY `actor_user` (`actor_user`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devactor`
--

LOCK TABLES `devactor` WRITE;
/*!40000 ALTER TABLE `devactor` DISABLE KEYS */;
/*!40000 ALTER TABLE `devactor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devarchive`
--

DROP TABLE IF EXISTS `devarchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devarchive` (
  `ar_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ar_namespace` int(11) NOT NULL DEFAULT '0',
  `ar_title` varbinary(255) NOT NULL DEFAULT '',
  `ar_comment` varbinary(767) NOT NULL DEFAULT '',
  `ar_comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ar_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ar_user_text` varbinary(255) NOT NULL DEFAULT '',
  `ar_actor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ar_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ar_minor_edit` tinyint(4) NOT NULL DEFAULT '0',
  `ar_rev_id` int(10) unsigned NOT NULL,
  `ar_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ar_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ar_len` int(10) unsigned DEFAULT NULL,
  `ar_page_id` int(10) unsigned DEFAULT NULL,
  `ar_parent_id` int(10) unsigned DEFAULT NULL,
  `ar_sha1` varbinary(32) NOT NULL DEFAULT '',
  `ar_content_model` varbinary(32) DEFAULT NULL,
  `ar_content_format` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`ar_id`),
  UNIQUE KEY `ar_revid_uniq` (`ar_rev_id`),
  KEY `name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  KEY `ar_usertext_timestamp` (`ar_user_text`,`ar_timestamp`),
  KEY `ar_actor_timestamp` (`ar_actor`,`ar_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devarchive`
--

LOCK TABLES `devarchive` WRITE;
/*!40000 ALTER TABLE `devarchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `devarchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devbot_passwords`
--

DROP TABLE IF EXISTS `devbot_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devbot_passwords` (
  `bp_user` int(10) unsigned NOT NULL,
  `bp_app_id` varbinary(32) NOT NULL,
  `bp_password` tinyblob NOT NULL,
  `bp_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `bp_restrictions` blob NOT NULL,
  `bp_grants` blob NOT NULL,
  PRIMARY KEY (`bp_user`,`bp_app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devbot_passwords`
--

LOCK TABLES `devbot_passwords` WRITE;
/*!40000 ALTER TABLE `devbot_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `devbot_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devcategory`
--

DROP TABLE IF EXISTS `devcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devcategory` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_title` varbinary(255) NOT NULL,
  `cat_pages` int(11) NOT NULL DEFAULT '0',
  `cat_subcats` int(11) NOT NULL DEFAULT '0',
  `cat_files` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_title` (`cat_title`),
  KEY `cat_pages` (`cat_pages`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devcategory`
--

LOCK TABLES `devcategory` WRITE;
/*!40000 ALTER TABLE `devcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `devcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devcategorylinks`
--

DROP TABLE IF EXISTS `devcategorylinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devcategorylinks` (
  `cl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `cl_to` varbinary(255) NOT NULL DEFAULT '',
  `cl_sortkey` varbinary(230) NOT NULL DEFAULT '',
  `cl_sortkey_prefix` varbinary(255) NOT NULL DEFAULT '',
  `cl_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cl_collation` varbinary(32) NOT NULL DEFAULT '',
  `cl_type` enum('page','subcat','file') NOT NULL DEFAULT 'page',
  PRIMARY KEY (`cl_from`,`cl_to`),
  KEY `cl_sortkey` (`cl_to`,`cl_type`,`cl_sortkey`,`cl_from`),
  KEY `cl_timestamp` (`cl_to`,`cl_timestamp`),
  KEY `cl_collation_ext` (`cl_collation`,`cl_to`,`cl_type`,`cl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devcategorylinks`
--

LOCK TABLES `devcategorylinks` WRITE;
/*!40000 ALTER TABLE `devcategorylinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `devcategorylinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devchange_tag`
--

DROP TABLE IF EXISTS `devchange_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devchange_tag` (
  `ct_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ct_rc_id` int(11) DEFAULT NULL,
  `ct_log_id` int(10) unsigned DEFAULT NULL,
  `ct_rev_id` int(10) unsigned DEFAULT NULL,
  `ct_tag` varbinary(255) NOT NULL DEFAULT '',
  `ct_params` blob,
  `ct_tag_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ct_id`),
  UNIQUE KEY `change_tag_rc_tag_id` (`ct_rc_id`,`ct_tag_id`),
  UNIQUE KEY `change_tag_log_tag_id` (`ct_log_id`,`ct_tag_id`),
  UNIQUE KEY `change_tag_rev_tag_id` (`ct_rev_id`,`ct_tag_id`),
  KEY `change_tag_rc_tag_nonuniq` (`ct_rc_id`,`ct_tag`),
  KEY `change_tag_log_tag_nonuniq` (`ct_log_id`,`ct_tag`),
  KEY `change_tag_rev_tag_nonuniq` (`ct_rev_id`,`ct_tag`),
  KEY `change_tag_tag_id` (`ct_tag`,`ct_rc_id`,`ct_rev_id`,`ct_log_id`),
  KEY `change_tag_tag_id_id` (`ct_tag_id`,`ct_rc_id`,`ct_rev_id`,`ct_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devchange_tag`
--

LOCK TABLES `devchange_tag` WRITE;
/*!40000 ALTER TABLE `devchange_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `devchange_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devchange_tag_def`
--

DROP TABLE IF EXISTS `devchange_tag_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devchange_tag_def` (
  `ctd_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ctd_name` varbinary(255) NOT NULL,
  `ctd_user_defined` tinyint(1) NOT NULL,
  `ctd_count` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ctd_id`),
  UNIQUE KEY `ctd_name` (`ctd_name`),
  KEY `ctd_count` (`ctd_count`),
  KEY `ctd_user_defined` (`ctd_user_defined`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devchange_tag_def`
--

LOCK TABLES `devchange_tag_def` WRITE;
/*!40000 ALTER TABLE `devchange_tag_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `devchange_tag_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devcomment`
--

DROP TABLE IF EXISTS `devcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devcomment` (
  `comment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_hash` int(11) NOT NULL,
  `comment_text` blob NOT NULL,
  `comment_data` blob,
  PRIMARY KEY (`comment_id`),
  KEY `comment_hash` (`comment_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devcomment`
--

LOCK TABLES `devcomment` WRITE;
/*!40000 ALTER TABLE `devcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `devcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devcontent`
--

DROP TABLE IF EXISTS `devcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devcontent` (
  `content_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `content_size` int(10) unsigned NOT NULL,
  `content_sha1` varbinary(32) NOT NULL,
  `content_model` smallint(5) unsigned NOT NULL,
  `content_address` varbinary(255) NOT NULL,
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devcontent`
--

LOCK TABLES `devcontent` WRITE;
/*!40000 ALTER TABLE `devcontent` DISABLE KEYS */;
INSERT INTO `devcontent` VALUES (1,852,_binary '9glwn9v3j4u2b23d5u377n48nlobre1',1,_binary 'tt:1');
/*!40000 ALTER TABLE `devcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devcontent_models`
--

DROP TABLE IF EXISTS `devcontent_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devcontent_models` (
  `model_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `model_name` varbinary(64) NOT NULL,
  PRIMARY KEY (`model_id`),
  UNIQUE KEY `model_name` (`model_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devcontent_models`
--

LOCK TABLES `devcontent_models` WRITE;
/*!40000 ALTER TABLE `devcontent_models` DISABLE KEYS */;
INSERT INTO `devcontent_models` VALUES (1,_binary 'wikitext');
/*!40000 ALTER TABLE `devcontent_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devexternallinks`
--

DROP TABLE IF EXISTS `devexternallinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devexternallinks` (
  `el_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `el_from` int(10) unsigned NOT NULL DEFAULT '0',
  `el_to` blob NOT NULL,
  `el_index` blob NOT NULL,
  `el_index_60` varbinary(60) NOT NULL,
  PRIMARY KEY (`el_id`),
  KEY `el_from` (`el_from`,`el_to`(40)),
  KEY `el_to` (`el_to`(60),`el_from`),
  KEY `el_index` (`el_index`(60)),
  KEY `el_index_60` (`el_index_60`,`el_id`),
  KEY `el_from_index_60` (`el_from`,`el_index_60`,`el_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devexternallinks`
--

LOCK TABLES `devexternallinks` WRITE;
/*!40000 ALTER TABLE `devexternallinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `devexternallinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devfilearchive`
--

DROP TABLE IF EXISTS `devfilearchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devfilearchive` (
  `fa_id` int(11) NOT NULL AUTO_INCREMENT,
  `fa_name` varbinary(255) NOT NULL DEFAULT '',
  `fa_archive_name` varbinary(255) DEFAULT '',
  `fa_storage_group` varbinary(16) DEFAULT NULL,
  `fa_storage_key` varbinary(64) DEFAULT '',
  `fa_deleted_user` int(11) DEFAULT NULL,
  `fa_deleted_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted_reason` varbinary(767) DEFAULT '',
  `fa_deleted_reason_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fa_size` int(10) unsigned DEFAULT '0',
  `fa_width` int(11) DEFAULT '0',
  `fa_height` int(11) DEFAULT '0',
  `fa_metadata` mediumblob,
  `fa_bits` int(11) DEFAULT '0',
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') DEFAULT 'unknown',
  `fa_minor_mime` varbinary(100) DEFAULT 'unknown',
  `fa_description` varbinary(767) DEFAULT '',
  `fa_description_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fa_user` int(10) unsigned DEFAULT '0',
  `fa_user_text` varbinary(255) DEFAULT '',
  `fa_actor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `fa_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fa_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`fa_id`),
  KEY `fa_name` (`fa_name`,`fa_timestamp`),
  KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  KEY `fa_user_timestamp` (`fa_user_text`,`fa_timestamp`),
  KEY `fa_actor_timestamp` (`fa_actor`,`fa_timestamp`),
  KEY `fa_sha1` (`fa_sha1`(10))
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devfilearchive`
--

LOCK TABLES `devfilearchive` WRITE;
/*!40000 ALTER TABLE `devfilearchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `devfilearchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devimage`
--

DROP TABLE IF EXISTS `devimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devimage` (
  `img_name` varbinary(255) NOT NULL DEFAULT '',
  `img_size` int(10) unsigned NOT NULL DEFAULT '0',
  `img_width` int(11) NOT NULL DEFAULT '0',
  `img_height` int(11) NOT NULL DEFAULT '0',
  `img_metadata` mediumblob NOT NULL,
  `img_bits` int(11) NOT NULL DEFAULT '0',
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `img_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `img_description` varbinary(767) NOT NULL DEFAULT '',
  `img_description_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `img_user` int(10) unsigned NOT NULL DEFAULT '0',
  `img_user_text` varbinary(255) NOT NULL DEFAULT '',
  `img_actor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `img_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `img_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`img_name`),
  KEY `img_user_timestamp` (`img_user`,`img_timestamp`),
  KEY `img_usertext_timestamp` (`img_user_text`,`img_timestamp`),
  KEY `img_actor_timestamp` (`img_actor`,`img_timestamp`),
  KEY `img_size` (`img_size`),
  KEY `img_timestamp` (`img_timestamp`),
  KEY `img_sha1` (`img_sha1`(10)),
  KEY `img_media_mime` (`img_media_type`,`img_major_mime`,`img_minor_mime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devimage`
--

LOCK TABLES `devimage` WRITE;
/*!40000 ALTER TABLE `devimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `devimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devimagelinks`
--

DROP TABLE IF EXISTS `devimagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devimagelinks` (
  `il_from` int(10) unsigned NOT NULL DEFAULT '0',
  `il_from_namespace` int(11) NOT NULL DEFAULT '0',
  `il_to` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`il_from`,`il_to`),
  KEY `il_to` (`il_to`,`il_from`),
  KEY `il_backlinks_namespace` (`il_from_namespace`,`il_to`,`il_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devimagelinks`
--

LOCK TABLES `devimagelinks` WRITE;
/*!40000 ALTER TABLE `devimagelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `devimagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devinterwiki`
--

DROP TABLE IF EXISTS `devinterwiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devinterwiki` (
  `iw_prefix` varbinary(32) NOT NULL,
  `iw_url` blob NOT NULL,
  `iw_api` blob NOT NULL,
  `iw_wikiid` varbinary(64) NOT NULL,
  `iw_local` tinyint(1) NOT NULL,
  `iw_trans` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iw_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devinterwiki`
--

LOCK TABLES `devinterwiki` WRITE;
/*!40000 ALTER TABLE `devinterwiki` DISABLE KEYS */;
INSERT INTO `devinterwiki` VALUES (_binary 'acronym',_binary 'https://www.acronymfinder.com/~/search/af.aspx?string=exact&Acronym=$1','','',0,0),(_binary 'advogato',_binary 'http://www.advogato.org/$1','','',0,0),(_binary 'arxiv',_binary 'https://www.arxiv.org/abs/$1','','',0,0),(_binary 'c2find',_binary 'http://c2.com/cgi/wiki?FindPage&value=$1','','',0,0),(_binary 'cache',_binary 'https://www.google.com/search?q=cache:$1','','',0,0),(_binary 'commons',_binary 'https://commons.wikimedia.org/wiki/$1',_binary 'https://commons.wikimedia.org/w/api.php','',0,0),(_binary 'dictionary',_binary 'http://www.dict.org/bin/Dict?Database=*&Form=Dict1&Strategy=*&Query=$1','','',0,0),(_binary 'doi',_binary 'https://dx.doi.org/$1','','',0,0),(_binary 'drumcorpswiki',_binary 'http://www.drumcorpswiki.com/$1',_binary 'http://drumcorpswiki.com/api.php','',0,0),(_binary 'dwjwiki',_binary 'http://www.suberic.net/cgi-bin/dwj/wiki.cgi?$1','','',0,0),(_binary 'elibre',_binary 'http://enciclopedia.us.es/index.php/$1',_binary 'http://enciclopedia.us.es/api.php','',0,0),(_binary 'emacswiki',_binary 'https://www.emacswiki.org/cgi-bin/wiki.pl?$1','','',0,0),(_binary 'foldoc',_binary 'https://foldoc.org/?$1','','',0,0),(_binary 'foxwiki',_binary 'https://fox.wikis.com/wc.dll?Wiki~$1','','',0,0),(_binary 'freebsdman',_binary 'https://www.FreeBSD.org/cgi/man.cgi?apropos=1&query=$1','','',0,0),(_binary 'gentoo-wiki',_binary 'http://gentoo-wiki.com/$1','','',0,0),(_binary 'google',_binary 'https://www.google.com/search?q=$1','','',0,0),(_binary 'googlegroups',_binary 'https://groups.google.com/groups?q=$1','','',0,0),(_binary 'hammondwiki',_binary 'http://www.dairiki.org/HammondWiki/$1','','',0,0),(_binary 'hrwiki',_binary 'http://www.hrwiki.org/wiki/$1',_binary 'http://www.hrwiki.org/w/api.php','',0,0),(_binary 'imdb',_binary 'http://www.imdb.com/find?q=$1&tt=on','','',0,0),(_binary 'kmwiki',_binary 'https://kmwiki.wikispaces.com/$1','','',0,0),(_binary 'linuxwiki',_binary 'http://linuxwiki.de/$1','','',0,0),(_binary 'lojban',_binary 'https://mw.lojban.org/papri/$1','','',0,0),(_binary 'lqwiki',_binary 'http://wiki.linuxquestions.org/wiki/$1','','',0,0),(_binary 'meatball',_binary 'http://www.usemod.com/cgi-bin/mb.pl?$1','','',0,0),(_binary 'mediawikiwiki',_binary 'https://www.mediawiki.org/wiki/$1',_binary 'https://www.mediawiki.org/w/api.php','',0,0),(_binary 'memoryalpha',_binary 'http://en.memory-alpha.org/wiki/$1',_binary 'http://en.memory-alpha.org/api.php','',0,0),(_binary 'metawiki',_binary 'http://sunir.org/apps/meta.pl?$1','','',0,0),(_binary 'metawikimedia',_binary 'https://meta.wikimedia.org/wiki/$1',_binary 'https://meta.wikimedia.org/w/api.php','',0,0),(_binary 'mozillawiki',_binary 'https://wiki.mozilla.org/$1',_binary 'https://wiki.mozilla.org/api.php','',0,0),(_binary 'mw',_binary 'https://www.mediawiki.org/wiki/$1',_binary 'https://www.mediawiki.org/w/api.php','',0,0),(_binary 'oeis',_binary 'https://oeis.org/$1','','',0,0),(_binary 'openwiki',_binary 'http://openwiki.com/ow.asp?$1','','',0,0),(_binary 'pmid',_binary 'https://www.ncbi.nlm.nih.gov/pubmed/$1?dopt=Abstract','','',0,0),(_binary 'pythoninfo',_binary 'https://wiki.python.org/moin/$1','','',0,0),(_binary 'rfc',_binary 'https://tools.ietf.org/html/rfc$1','','',0,0),(_binary 's23wiki',_binary 'http://s23.org/wiki/$1',_binary 'http://s23.org/w/api.php','',0,0),(_binary 'seattlewireless',_binary 'http://seattlewireless.net/$1','','',0,0),(_binary 'senseislibrary',_binary 'https://senseis.xmp.net/?$1','','',0,0),(_binary 'shoutwiki',_binary 'http://www.shoutwiki.com/wiki/$1',_binary 'http://www.shoutwiki.com/w/api.php','',0,0),(_binary 'squeak',_binary 'http://wiki.squeak.org/squeak/$1','','',0,0),(_binary 'theopedia',_binary 'https://www.theopedia.com/$1','','',0,0),(_binary 'tmbw',_binary 'http://www.tmbw.net/wiki/$1',_binary 'http://tmbw.net/wiki/api.php','',0,0),(_binary 'tmnet',_binary 'http://www.technomanifestos.net/?$1','','',0,0),(_binary 'twiki',_binary 'http://twiki.org/cgi-bin/view/$1','','',0,0),(_binary 'uncyclopedia',_binary 'https://en.uncyclopedia.co/wiki/$1',_binary 'https://en.uncyclopedia.co/w/api.php','',0,0),(_binary 'unreal',_binary 'https://wiki.beyondunreal.com/$1',_binary 'https://wiki.beyondunreal.com/w/api.php','',0,0),(_binary 'usemod',_binary 'http://www.usemod.com/cgi-bin/wiki.pl?$1','','',0,0),(_binary 'wiki',_binary 'http://c2.com/cgi/wiki?$1','','',0,0),(_binary 'wikia',_binary 'http://www.wikia.com/wiki/$1','','',0,0),(_binary 'wikibooks',_binary 'https://en.wikibooks.org/wiki/$1',_binary 'https://en.wikibooks.org/w/api.php','',0,0),(_binary 'wikidata',_binary 'https://www.wikidata.org/wiki/$1',_binary 'https://www.wikidata.org/w/api.php','',0,0),(_binary 'wikif1',_binary 'http://www.wikif1.org/$1','','',0,0),(_binary 'wikihow',_binary 'https://www.wikihow.com/$1',_binary 'https://www.wikihow.com/api.php','',0,0),(_binary 'wikimedia',_binary 'https://foundation.wikimedia.org/wiki/$1',_binary 'https://foundation.wikimedia.org/w/api.php','',0,0),(_binary 'wikinews',_binary 'https://en.wikinews.org/wiki/$1',_binary 'https://en.wikinews.org/w/api.php','',0,0),(_binary 'wikinfo',_binary 'http://wikinfo.co/English/index.php/$1','','',0,0),(_binary 'wikipedia',_binary 'https://en.wikipedia.org/wiki/$1',_binary 'https://en.wikipedia.org/w/api.php','',0,0),(_binary 'wikiquote',_binary 'https://en.wikiquote.org/wiki/$1',_binary 'https://en.wikiquote.org/w/api.php','',0,0),(_binary 'wikisource',_binary 'https://wikisource.org/wiki/$1',_binary 'https://wikisource.org/w/api.php','',0,0),(_binary 'wikispecies',_binary 'https://species.wikimedia.org/wiki/$1',_binary 'https://species.wikimedia.org/w/api.php','',0,0),(_binary 'wikiversity',_binary 'https://en.wikiversity.org/wiki/$1',_binary 'https://en.wikiversity.org/w/api.php','',0,0),(_binary 'wikivoyage',_binary 'https://en.wikivoyage.org/wiki/$1',_binary 'https://en.wikivoyage.org/w/api.php','',0,0),(_binary 'wikt',_binary 'https://en.wiktionary.org/wiki/$1',_binary 'https://en.wiktionary.org/w/api.php','',0,0),(_binary 'wiktionary',_binary 'https://en.wiktionary.org/wiki/$1',_binary 'https://en.wiktionary.org/w/api.php','',0,0);
/*!40000 ALTER TABLE `devinterwiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devip_changes`
--

DROP TABLE IF EXISTS `devip_changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devip_changes` (
  `ipc_rev_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ipc_rev_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ipc_hex` varbinary(35) NOT NULL DEFAULT '',
  PRIMARY KEY (`ipc_rev_id`),
  KEY `ipc_rev_timestamp` (`ipc_rev_timestamp`),
  KEY `ipc_hex_time` (`ipc_hex`,`ipc_rev_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devip_changes`
--

LOCK TABLES `devip_changes` WRITE;
/*!40000 ALTER TABLE `devip_changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `devip_changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devipblocks`
--

DROP TABLE IF EXISTS `devipblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devipblocks` (
  `ipb_id` int(11) NOT NULL AUTO_INCREMENT,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by_text` varbinary(255) NOT NULL DEFAULT '',
  `ipb_by_actor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ipb_reason` varbinary(767) NOT NULL DEFAULT '',
  `ipb_reason_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `ipb_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ipb_auto` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_anon_only` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_create_account` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_enable_autoblock` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_expiry` varbinary(14) NOT NULL DEFAULT '',
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_block_email` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_allow_usertalk` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_parent_block_id` int(11) DEFAULT NULL,
  `ipb_sitewide` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ipb_id`),
  UNIQUE KEY `ipb_address` (`ipb_address`(255),`ipb_user`,`ipb_auto`,`ipb_anon_only`),
  KEY `ipb_user` (`ipb_user`),
  KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  KEY `ipb_timestamp` (`ipb_timestamp`),
  KEY `ipb_expiry` (`ipb_expiry`),
  KEY `ipb_parent_block_id` (`ipb_parent_block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devipblocks`
--

LOCK TABLES `devipblocks` WRITE;
/*!40000 ALTER TABLE `devipblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `devipblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devipblocks_restrictions`
--

DROP TABLE IF EXISTS `devipblocks_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devipblocks_restrictions` (
  `ir_ipb_id` int(11) NOT NULL,
  `ir_type` tinyint(1) NOT NULL,
  `ir_value` int(11) NOT NULL,
  PRIMARY KEY (`ir_ipb_id`,`ir_type`,`ir_value`),
  KEY `ir_type_value` (`ir_type`,`ir_value`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devipblocks_restrictions`
--

LOCK TABLES `devipblocks_restrictions` WRITE;
/*!40000 ALTER TABLE `devipblocks_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `devipblocks_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deviwlinks`
--

DROP TABLE IF EXISTS `deviwlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deviwlinks` (
  `iwl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `iwl_prefix` varbinary(20) NOT NULL DEFAULT '',
  `iwl_title` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`iwl_from`,`iwl_prefix`,`iwl_title`),
  KEY `iwl_prefix_title_from` (`iwl_prefix`,`iwl_title`,`iwl_from`),
  KEY `iwl_prefix_from_title` (`iwl_prefix`,`iwl_from`,`iwl_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deviwlinks`
--

LOCK TABLES `deviwlinks` WRITE;
/*!40000 ALTER TABLE `deviwlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `deviwlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devjob`
--

DROP TABLE IF EXISTS `devjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devjob` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_cmd` varbinary(60) NOT NULL DEFAULT '',
  `job_namespace` int(11) NOT NULL,
  `job_title` varbinary(255) NOT NULL,
  `job_timestamp` varbinary(14) DEFAULT NULL,
  `job_params` blob NOT NULL,
  `job_random` int(10) unsigned NOT NULL DEFAULT '0',
  `job_attempts` int(10) unsigned NOT NULL DEFAULT '0',
  `job_token` varbinary(32) NOT NULL DEFAULT '',
  `job_token_timestamp` varbinary(14) DEFAULT NULL,
  `job_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`job_id`),
  KEY `job_sha1` (`job_sha1`),
  KEY `job_cmd_token` (`job_cmd`,`job_token`,`job_random`),
  KEY `job_cmd_token_id` (`job_cmd`,`job_token`,`job_id`),
  KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`,`job_params`(128)),
  KEY `job_timestamp` (`job_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devjob`
--

LOCK TABLES `devjob` WRITE;
/*!40000 ALTER TABLE `devjob` DISABLE KEYS */;
/*!40000 ALTER TABLE `devjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devl10n_cache`
--

DROP TABLE IF EXISTS `devl10n_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devl10n_cache` (
  `lc_lang` varbinary(32) NOT NULL,
  `lc_key` varbinary(255) NOT NULL,
  `lc_value` mediumblob NOT NULL,
  PRIMARY KEY (`lc_lang`,`lc_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devl10n_cache`
--

LOCK TABLES `devl10n_cache` WRITE;
/*!40000 ALTER TABLE `devl10n_cache` DISABLE KEYS */;
INSERT INTO `devl10n_cache` VALUES (_binary 'fr',_binary 'messages:prefs-misc',_binary 's:22:\"Préférences diverses\";'),(_binary 'fr',_binary 'messages:prefs-namespaces',_binary 's:15:\"Espaces de noms\";'),(_binary 'fr',_binary 'messages:prefs-opt-out',_binary 's:26:\"Refuser les améliorations\";'),(_binary 'fr',_binary 'messages:prefs-personal',_binary 's:25:\"Informations personnelles\";'),(_binary 'fr',_binary 'messages:prefs-preview',_binary 's:7:\"Aperçu\";'),(_binary 'fr',_binary 'messages:prefs-rc',_binary 's:23:\"Modifications récentes\";'),(_binary 'fr',_binary 'messages:prefs-registration',_binary 's:20:\"Date d\'inscription :\";'),(_binary 'fr',_binary 'messages:prefs-registration-date-time',_binary 's:2:\"$1\";'),(_binary 'fr',_binary 'messages:prefs-rendering',_binary 's:9:\"Apparence\";'),(_binary 'fr',_binary 'messages:prefs-reset-intro',_binary 's:129:\"Vous pouvez utiliser cette page pour restaurer vos préférences aux valeurs par défaut du site. Ceci ne peut pas être défait.\";'),(_binary 'fr',_binary 'messages:prefs-resetpass',_binary 's:23:\"Changer de mot de passe\";'),(_binary 'fr',_binary 'messages:prefs-searchoptions',_binary 's:9:\"Recherche\";'),(_binary 'fr',_binary 'messages:prefs-setemail',_binary 's:32:\"Définir une adresse de courriel\";'),(_binary 'fr',_binary 'messages:prefs-signature',_binary 's:9:\"Signature\";'),(_binary 'fr',_binary 'messages:prefs-skin',_binary 's:9:\"Habillage\";'),(_binary 'fr',_binary 'messages:prefs-tabs-navigation-hint',_binary 's:98:\"Astuce : Vous pouvez utiliser les flèches de gauche et de droite pour naviguer entre les onglets.\";'),(_binary 'fr',_binary 'messages:prefs-timeoffset',_binary 's:17:\"Décalage horaire\";'),(_binary 'fr',_binary 'messages:prefs-tokenwatchlist',_binary 's:5:\"Jeton\";'),(_binary 'fr',_binary 'messages:prefs-user-pages',_binary 's:22:\"Pages d’utilisateurs\";'),(_binary 'fr',_binary 'messages:prefs-watchlist',_binary 's:14:\"Liste de suivi\";'),(_binary 'fr',_binary 'messages:prefs-watchlist-days',_binary 's:52:\"Nombre de jours à afficher dans la liste de suivi :\";'),(_binary 'fr',_binary 'messages:prefs-watchlist-days-max',_binary 's:33:\"(maximum $1 jour{{PLURAL:$1||s}})\";'),(_binary 'fr',_binary 'messages:prefs-watchlist-edits',_binary 's:68:\"Nombre maximum de modifications à afficher dans la liste de suivi :\";'),(_binary 'fr',_binary 'messages:prefs-watchlist-edits-max',_binary 's:21:\"Nombre maximum : 1000\";'),(_binary 'fr',_binary 'messages:prefs-watchlist-managetokens',_binary 's:17:\"Gérer les jetons\";'),(_binary 'fr',_binary 'messages:prefs-watchlist-token',_binary 's:30:\"Jeton pour la liste de suivi :\";'),(_binary 'fr',_binary 'messages:prefsnologintext2',_binary 's:56:\"Veuillez vous connecter pour modifier vos préférences.\";'),(_binary 'fr',_binary 'messages:prefswarning-warning',_binary 's:209:\"Vous avez effectué des modifications dans vos préférences qui n’ont pas encore été enregistrées.\nSi vous quittez cette page sans cliquer sur « $1 », vos préférences ne seront pas mises à jour.\";'),(_binary 'fr',_binary 'messages:prev-page',_binary 's:17:\"page précédente\";'),(_binary 'fr',_binary 'messages:preview',_binary 's:17:\"Prévisualisation\";'),(_binary 'fr',_binary 'messages:previewconflict',_binary 's:138:\"Cette prévisualisation montre le texte de la boîte supérieure de modification tel qu’il apparaîtra si vous choisissez de le publier.\";'),(_binary 'fr',_binary 'messages:previewerrortext',_binary 's:91:\"Une erreur s’est produite lors de la tentative de prévisualisation de vos modifications.\";'),(_binary 'fr',_binary 'messages:previewnote',_binary 's:132:\"<strong>Rappelez-vous que ce n’est qu’une prévisualisation.</strong>\nVos modifications n’ont pas encore été enregistrées !\";'),(_binary 'fr',_binary 'messages:previousdiff',_binary 's:29:\"← Modification précédente\";'),(_binary 'fr',_binary 'messages:previousrevision',_binary 's:24:\"← Version précédente\";'),(_binary 'fr',_binary 'messages:prevn',_binary 's:43:\"{{PLURAL:$1|précédente|$1 précédentes}}\";'),(_binary 'fr',_binary 'messages:prevn-title',_binary 's:62:\"$1 {{PLURAL:$1|résultat précédent|résultats précédents}}\";'),(_binary 'fr',_binary 'messages:prevpage',_binary 's:22:\"Page précédente ($1)\";'),(_binary 'fr',_binary 'messages:print',_binary 's:8:\"Imprimer\";'),(_binary 'fr',_binary 'messages:print.css',_binary 's:49:\"/* Le CSS placé ici affectera les impressions */\";'),(_binary 'fr',_binary 'messages:printableversion',_binary 's:18:\"Version imprimable\";'),(_binary 'fr',_binary 'messages:privacy',_binary 's:29:\"Politique de confidentialité\";'),(_binary 'fr',_binary 'messages:privacypage',_binary 's:38:\"Project: Politique de confidentialité\";'),(_binary 'fr',_binary 'messages:prot_1movedto2',_binary 's:25:\"[[$1]] renommé en [[$2]]\";'),(_binary 'fr',_binary 'messages:protect',_binary 's:9:\"Protéger\";'),(_binary 'fr',_binary 'messages:protect-badnamespace-text',_binary 's:67:\"Les pages dans cet espace de noms ne peuvent pas être protégées.\";'),(_binary 'fr',_binary 'messages:protect-badnamespace-title',_binary 's:31:\"Espace de noms non protégeable\";'),(_binary 'fr',_binary 'messages:protect-cantedit',_binary 's:116:\"Vous ne pouvez pas changer les niveaux de protection de cette page car vous n\'avez pas la permission de la modifier.\";'),(_binary 'fr',_binary 'messages:protect-cascade',_binary 's:66:\"Protéger les pages incluses dans celle-ci (protection en cascade)\";'),(_binary 'fr',_binary 'messages:protect-cascadeon',_binary 's:304:\"Cette page est protégée car elle est transcluse dans {{PLURAL:$1|la page suivante, qui a été protégée|les pages suivantes, qui ont été protégées}} avec l\'option « protection en cascade » activée.\nLa modification du niveau de protection de cette page n\'affectera pas la protection en cascade.\";'),(_binary 'fr',_binary 'messages:protect-default',_binary 's:31:\"Autoriser tous les utilisateurs\";'),(_binary 'fr',_binary 'messages:protect-dropdown',_binary 's:148:\"* Motifs de protection courants\n** Vandalisme excessif\n** Pourriels excessifs\n** Conflits de modifications contre-productives\n** Page à fort trafic\";'),(_binary 'fr',_binary 'messages:protect-edit-reasonlist',_binary 's:33:\"Modifier les motifs de protection\";'),(_binary 'fr',_binary 'messages:protect-existing-expiry',_binary 's:38:\"Date d\'expiration existante : $2 à $3\";'),(_binary 'fr',_binary 'messages:protect-existing-expiry-infinity',_binary 's:39:\"Délai d’expiration existant : infini\";'),(_binary 'fr',_binary 'messages:protect-expiring',_binary 's:18:\"expire le $1 (UTC)\";'),(_binary 'fr',_binary 'messages:protect-expiring-local',_binary 's:12:\"expire le $1\";'),(_binary 'fr',_binary 'messages:protect-expiry-indefinite',_binary 's:6:\"infini\";'),(_binary 'fr',_binary 'messages:protect-expiry-options',_binary 's:145:\"1 heure:1 hour,1 jour:1 day,1 semaine:1 week,2 semaines:2 weeks,1 mois:1 month,3 mois:3 months,6 mois:6 months,1 an:1 year,indéfiniment:infinite\";'),(_binary 'fr',_binary 'messages:protect-fallback',_binary 's:60:\"Autoriser uniquement les utilisateurs avec le droit « $1 »\";'),(_binary 'fr',_binary 'messages:protect-legend',_binary 's:23:\"Confirmer la protection\";'),(_binary 'fr',_binary 'messages:protect-level-autoconfirmed',_binary 's:52:\"Autoriser uniquement les utilisateurs autoconfirmés\";'),(_binary 'fr',_binary 'messages:protect-level-sysop',_binary 's:40:\"Autoriser uniquement les administrateurs\";'),(_binary 'fr',_binary 'messages:protect-locked-access',_binary 's:150:\"Vous n\'avez pas les droits nécessaires pour modifier les niveaux de protection des pages.\nVoici les réglages actuels de la page <strong>$1<strong> :\";'),(_binary 'fr',_binary 'messages:protect-locked-blocked',_binary 's:136:\"Vous ne pouvez pas modifier les niveaux de protection durant votre blocage.\nVoici les réglages actuels de la page <strong>$1</strong> :\";'),(_binary 'fr',_binary 'messages:protect-locked-dblock',_binary 's:159:\"Les niveaux de protection ne peuvent pas être modifiés car la base de données est verrouillée.\nVoici les réglages actuels de la page <strong>$1</strong> :\";'),(_binary 'fr',_binary 'messages:protect-norestrictiontypes-text',_binary 's:91:\"Cette page ne peut pas être protégée car il n\'y a pas de type de restriction disponible.\";'),(_binary 'fr',_binary 'messages:protect-norestrictiontypes-title',_binary 's:21:\"Page non protégeable\";'),(_binary 'fr',_binary 'messages:protect-otherreason',_binary 's:32:\"Motif autre ou supplémentaire :\";'),(_binary 'fr',_binary 'messages:protect-otherreason-op',_binary 's:11:\"Autre motif\";'),(_binary 'fr',_binary 'messages:protect-othertime',_binary 's:25:\"Autre date d\'expiration :\";'),(_binary 'fr',_binary 'messages:protect-othertime-op',_binary 's:23:\"autre date d\'expiration\";'),(_binary 'fr',_binary 'messages:protect-summary-cascade',_binary 's:21:\"protection en cascade\";'),(_binary 'fr',_binary 'messages:protect-summary-desc',_binary 's:12:\"[$1=$2] ($3)\";'),(_binary 'fr',_binary 'messages:protect-text',_binary 's:93:\"Ici vous pouvez consulter et modifier le niveau de protection de la page <strong>$1</strong>.\";'),(_binary 'fr',_binary 'messages:protect-title',_binary 's:45:\"Changer le niveau de protection pour « $1 »\";'),(_binary 'fr',_binary 'messages:protect-title-notallowed',_binary 's:40:\"Voir le niveau de protection de « $1 »\";'),(_binary 'fr',_binary 'messages:protect-unchain-permissions',_binary 's:50:\"Déverrouiller davantage d’options de protection\";'),(_binary 'fr',_binary 'messages:protect_change',_binary 's:8:\"modifier\";'),(_binary 'fr',_binary 'messages:protect_expiry_invalid',_binary 's:34:\"La date d\'expiration est invalide.\";'),(_binary 'fr',_binary 'messages:protect_expiry_old',_binary 's:40:\"La date d\'expiration est déjà passée.\";'),(_binary 'fr',_binary 'messages:protectcomment',_binary 's:7:\"Motif :\";'),(_binary 'fr',_binary 'messages:protectedarticle',_binary 's:26:\"a protégé « [[$1]] »\";'),(_binary 'fr',_binary 'messages:protectedarticle-comment',_binary 's:40:\"{{GENDER:$2|A protégé}} « [[$1]] »\";'),(_binary 'fr',_binary 'messages:protectedinterface',_binary 's:282:\"Cette page fournit du texte d’interface pour le logiciel sur ce wiki et est protégée pour éviter les abus.\nPour ajouter ou modifier des traductions sur tous les wikis, veuillez utiliser [https://translatewiki.net/ translatewiki.net], le projet de régionalisation de MediaWiki.\";'),(_binary 'fr',_binary 'messages:protectedpage',_binary 's:15:\"Page protégée\";'),(_binary 'fr',_binary 'messages:protectedpagemovewarning',_binary 's:228:\"<strong>Attention :</strong> Cette page a été protégée afin que seuls les utilisateurs possédant les droits d\'administrateur puissent la renommer. \nLa dernière entrée du journal est affichée ci-dessous pour référence :\";'),(_binary 'fr',_binary 'messages:protectedpages',_binary 's:17:\"Pages protégées\";'),(_binary 'fr',_binary 'messages:protectedpages-cascade',_binary 's:37:\"Uniquement les protections en cascade\";'),(_binary 'fr',_binary 'messages:protectedpages-expiry',_binary 's:9:\"Expire le\";'),(_binary 'fr',_binary 'messages:protectedpages-filters',_binary 's:9:\"Filtres :\";'),(_binary 'fr',_binary 'messages:protectedpages-indef',_binary 's:38:\"Uniquement les protections indéfinies\";'),(_binary 'fr',_binary 'messages:protectedpages-noredirect',_binary 's:24:\"Masquer les redirections\";'),(_binary 'fr',_binary 'messages:protectedpages-page',_binary 's:4:\"Page\";'),(_binary 'fr',_binary 'messages:protectedpages-params',_binary 's:25:\"Paramètres de protection\";'),(_binary 'fr',_binary 'messages:protectedpages-performer',_binary 's:29:\"Protection de l’utilisateur\";'),(_binary 'fr',_binary 'messages:protectedpages-reason',_binary 's:5:\"Motif\";'),(_binary 'fr',_binary 'messages:protectedpages-submit',_binary 's:18:\"Afficher les pages\";'),(_binary 'fr',_binary 'messages:protectedpages-summary',_binary 's:184:\"Cette page liste les pages existantes actuellement protégées. Pour une liste des titres protégés contre la création, voir [[{{#special:ProtectedTitles}}|{{int:protectedtitles}}]].\";'),(_binary 'fr',_binary 'messages:protectedpages-timestamp',_binary 's:10:\"Horodatage\";'),(_binary 'fr',_binary 'messages:protectedpages-unknown-performer',_binary 's:19:\"Utilisateur inconnu\";'),(_binary 'fr',_binary 'messages:protectedpages-unknown-reason',_binary 's:3:\"—\";'),(_binary 'fr',_binary 'messages:protectedpages-unknown-timestamp',_binary 's:7:\"Inconnu\";'),(_binary 'fr',_binary 'messages:protectedpagesempty',_binary 's:50:\"Aucune page n\'est protégée avec ces paramètres.\";'),(_binary 'fr',_binary 'messages:protectedpagetext',_binary 's:83:\"Cette page a été protégée pour empêcher sa modification ou d’autres actions.\";'),(_binary 'fr',_binary 'messages:protectedpagewarning',_binary 's:221:\"<strong>AVERTISSEMENT : cette page est protégée afin que seuls les utilisateurs ayant le statut d\'administrateur puissent la modifier.</strong>\nLa dernière entrée du journal est affichée ci-dessous pour référence :\";'),(_binary 'fr',_binary 'messages:protectedtitles',_binary 's:17:\"Titres protégés\";'),(_binary 'fr',_binary 'messages:protectedtitles-submit',_binary 's:19:\"Afficher les titres\";'),(_binary 'fr',_binary 'messages:protectedtitles-summary',_binary 's:182:\"Cette page liste les titres actuellement protégés contre la création. Pour une liste des pages protégées existantes, voir [[{{#special:ProtectedPages}}|{{int:protectedpages}}]].\";'),(_binary 'fr',_binary 'messages:protectedtitlesempty',_binary 's:62:\"Aucun titre n\'est actuellement protégé avec ces paramètres.\";'),(_binary 'fr',_binary 'messages:protectexpiry',_binary 's:21:\"Date d’expiration :\";'),(_binary 'fr',_binary 'messages:protectlogpage',_binary 's:23:\"Journal des protections\";'),(_binary 'fr',_binary 'messages:protectlogtext',_binary 's:188:\"Voici une liste des modifications des protections de pages.\nConsultez la [[Special:ProtectedPages|liste des pages protégées]] pour la liste des protections actuellement opérationnelles.\";'),(_binary 'fr',_binary 'messages:proxyblocker',_binary 's:23:\"Bloqueur de mandataires\";'),(_binary 'fr',_binary 'messages:proxyblockreason',_binary 's:215:\"Votre adresse IP a été bloquée car il s’agit d’un mandataire ouvert.\nVeuillez contacter votre fournisseur d’accès Internet ou votre soutien technique et l’informer de ce sérieux problème de sécurité.\";'),(_binary 'fr',_binary 'messages:pt-createaccount',_binary 's:16:\"Créer un compte\";'),(_binary 'fr',_binary 'messages:pt-login',_binary 's:12:\"Se connecter\";'),(_binary 'fr',_binary 'messages:pt-login-button',_binary 's:12:\"Se connecter\";'),(_binary 'fr',_binary 'messages:pt-login-continue-button',_binary 's:22:\"Continuer la connexion\";'),(_binary 'fr',_binary 'messages:pt-userlogout',_binary 's:15:\"Se déconnecter\";'),(_binary 'fr',_binary 'messages:publishchanges',_binary 's:25:\"Publier les modifications\";'),(_binary 'fr',_binary 'messages:publishchanges-start',_binary 's:28:\"Publier les modifications…\";'),(_binary 'fr',_binary 'messages:publishpage',_binary 's:15:\"Publier la page\";'),(_binary 'fr',_binary 'messages:publishpage-start',_binary 's:18:\"Publier la page…\";'),(_binary 'fr',_binary 'messages:pubmedurl',_binary 's:46:\"//www.ncbi.nlm.nih.gov/pubmed/$1?dopt=Abstract\";'),(_binary 'fr',_binary 'messages:querypage-disabled',_binary 's:71:\"Cette page spéciale est désactivée pour des raisons de performances.\";'),(_binary 'fr',_binary 'messages:querypage-no-updates',_binary 's:119:\"Les mises à jour pour cette page sont actuellement désactivées.\nLes données ci-dessous ne seront pas mises à jour.\";'),(_binary 'fr',_binary 'messages:quotation-marks',_binary 's:12:\"« $1 »\";'),(_binary 'fr',_binary 'messages:randomincategory',_binary 's:33:\"Page au hasard dans la catégorie\";'),(_binary 'fr',_binary 'messages:randomincategory-category',_binary 's:12:\"Catégorie :\";'),(_binary 'fr',_binary 'messages:randomincategory-invalidcategory',_binary 's:53:\"« $1 » n’est pas un nom de catégorie valide.\";'),(_binary 'fr',_binary 'messages:randomincategory-legend',_binary 's:34:\"Page aléatoire dans la catégorie\";'),(_binary 'fr',_binary 'messages:randomincategory-nopages',_binary 's:63:\"Il n’y a pas de pages dans la catégorie [[:Category:$1|$1]].\";'),(_binary 'fr',_binary 'messages:randomincategory-submit',_binary 's:6:\"Lancer\";'),(_binary 'fr',_binary 'messages:randompage',_binary 's:14:\"Page au hasard\";'),(_binary 'fr',_binary 'messages:randompage-nopages',_binary 's:82:\"Il n\'y a aucune page dans {{PLURAL:$2|l\'espace de noms|les espaces de noms}} : $1.\";'),(_binary 'fr',_binary 'messages:randompage-url',_binary 's:14:\"Special:Random\";'),(_binary 'fr',_binary 'messages:randomredirect',_binary 's:29:\"Page de redirection au hasard\";'),(_binary 'fr',_binary 'messages:randomredirect-nopages',_binary 's:67:\"Il n\'y a aucune page de redirection dans l\'espace de noms « $1 ».\";'),(_binary 'fr',_binary 'messages:randomrootpage',_binary 's:22:\"Page racine aléatoire\";'),(_binary 'fr',_binary 'messages:range_block_disabled',_binary 's:76:\"Le droit administrateur de créer des blocages de plages IP est désactivé.\";'),(_binary 'fr',_binary 'messages:rawhtml-notallowed',_binary 's:86:\"Les balises &lt;html&gt; ne peuvent pas être utilisées en dehors des pages normales.\";'),(_binary 'fr',_binary 'messages:rawmessage',_binary 's:2:\"$1\";'),(_binary 'fr',_binary 'messages:rc-change-size',_binary 's:2:\"$1\";'),(_binary 'fr',_binary 'messages:rc-change-size-new',_binary 's:47:\"$1 {{PLURAL:$1|octet|octets}} après changement\";'),(_binary 'fr',_binary 'messages:rc-enhanced-expand',_binary 's:17:\"Voir les détails\";'),(_binary 'fr',_binary 'messages:rc-enhanced-hide',_binary 's:20:\"Masquer les détails\";'),(_binary 'fr',_binary 'messages:rc-old-title',_binary 's:42:\"créé initialement avec le titre « $1 »\";'),(_binary 'fr',_binary 'messages:rcfilters-activefilters',_binary 's:14:\"Filtres actifs\";'),(_binary 'fr',_binary 'messages:rcfilters-activefilters-hide',_binary 's:7:\"Masquer\";'),(_binary 'fr',_binary 'messages:rcfilters-activefilters-hide-tooltip',_binary 's:34:\"Masquer la zone des Filtres actifs\";'),(_binary 'fr',_binary 'messages:rcfilters-activefilters-show',_binary 's:8:\"Afficher\";'),(_binary 'fr',_binary 'messages:rcfilters-activefilters-show-tooltip',_binary 's:35:\"Afficher la zone des Filtres actifs\";'),(_binary 'fr',_binary 'messages:rcfilters-advancedfilters',_binary 's:16:\"Filtres avancés\";'),(_binary 'fr',_binary 'messages:rcfilters-clear-all-filters',_binary 's:24:\"Effacer tous les filtres\";'),(_binary 'fr',_binary 'messages:rcfilters-date-popup-title',_binary 's:31:\"Période de temps à rechercher\";'),(_binary 'fr',_binary 'messages:rcfilters-days-show-days',_binary 's:27:\"$1 {{PLURAL:$1|jour|jours}}\";'),(_binary 'fr',_binary 'messages:rcfilters-days-show-hours',_binary 's:29:\"$1 {{PLURAL:$1|heure|heures}}\";'),(_binary 'fr',_binary 'messages:rcfilters-days-title',_binary 's:14:\"Derniers jours\";'),(_binary 'fr',_binary 'messages:rcfilters-empty-filter',_binary 's:61:\"Aucun filtre actif. Toutes les contributions sont affichées.\";'),(_binary 'fr',_binary 'messages:rcfilters-exclude-button-off',_binary 's:26:\"Exclure les sélectionnés\";'),(_binary 'fr',_binary 'messages:rcfilters-exclude-button-on',_binary 's:21:\"Sélectionnés exclus\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-bots-description',_binary 's:49:\"Modifications faites par des outils automatisés.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-bots-label',_binary 's:5:\"Robot\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-categorization-description',_binary 's:66:\"Enregistrements de pages ajoutées ou supprimées des catégories.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-categorization-label',_binary 's:27:\"Modifications de catégorie\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-editsbyother-description',_binary 's:41:\"Toutes les modifications sauf les votres.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-editsbyother-label',_binary 's:36:\"Modifications faites par les autres.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-editsbyself-description',_binary 's:26:\"Vos propres contributions.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-editsbyself-label',_binary 's:29:\"Modifications faites par vous\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-excluded',_binary 's:5:\"Exclu\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-humans-description',_binary 's:47:\"Modifications faites par des éditeurs humains.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-humans-label',_binary 's:18:\"Humain (non robot)\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-lastrevision-description',_binary 's:59:\"Uniquement la dernière modification apportée à une page.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-lastrevision-label',_binary 's:19:\"Dernière révision\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-logactions-description',_binary 's:92:\"Actions d’administration, créations de compte, suppression de pages, téléchargements…\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-logactions-label',_binary 's:16:\"Actions tracées\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-major-description',_binary 's:43:\"Modifications non marquées comme mineures.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-major-label',_binary 's:26:\"Modifications non mineures\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-minor-description',_binary 's:56:\"Modifications que l’auteur a marquées comme mineures.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-minor-label',_binary 's:22:\"Modifications mineures\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-newpages-description',_binary 's:41:\"Modifications créant de nouvelles pages.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-newpages-label',_binary 's:18:\"Créations de page\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-pageedits-description',_binary 's:86:\"Modifications du contenu du wiki, des discussions, des descriptions des catégories…\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-pageedits-label',_binary 's:21:\"Modifications de page\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-previousrevision-description',_binary 's:104:\"Toutes les modifications apportées à une page et qui ne concernent pas la « dernière version ».\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-previousrevision-label',_binary 's:24:\"Pas la dernière version\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-reviewstatus-auto-description',_binary 's:106:\"Modifications par des utilisateurs avancés dont le travail est marqué comme patrouillé automatiquement.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-reviewstatus-auto-label',_binary 's:27:\"Patrouillé automatiquement\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-reviewstatus-manual-description',_binary 's:57:\"Modifications manuellement marquées comme patrouillées.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-reviewstatus-manual-label',_binary 's:24:\"Patrouillé manuellement\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-reviewstatus-unpatrolled-description',_binary 's:81:\"Modifications non marquées comme patrouillées, manuellement ou automatiquement.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-reviewstatus-unpatrolled-label',_binary 's:15:\"Non patrouillé\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-showlinkedfrom-label',_binary 's:49:\"Montrer les modifications des pages liées depuis\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-showlinkedfrom-option-label',_binary 's:59:\"<strong>Pages liées depuis</strong> la page sélectionnée\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-showlinkedto-label',_binary 's:49:\"Montrer les modifications des pages pointant vers\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-showlinkedto-option-label',_binary 's:59:\"<strong>Pages pointant vers</strong> la page sélectionnée\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-user-experience-level-experienced-description',_binary 's:78:\"Éditeurs connectés avec plus de 500 modifications et 30 jours d’activité.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-user-experience-level-experienced-label',_binary 's:27:\"Utilisateurs expérimentés\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-user-experience-level-learner-description',_binary 's:129:\"Éditeurs connectés dont l’expérience se situe entre  « Nouveaux arrivants » et  « Utilisateurs expérimentés ».\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-user-experience-level-learner-label',_binary 's:9:\"Apprentis\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-user-experience-level-newcomer-description',_binary 's:98:\"Éditeurs connectés ayant fait moins de 10 modifications ou ayant moins de 4 jours d’activité.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-user-experience-level-newcomer-label',_binary 's:18:\"Nouveaux arrivants\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-user-experience-level-registered-description',_binary 's:21:\"Éditeurs connectés.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-user-experience-level-registered-label',_binary 's:9:\"Connecté\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-user-experience-level-unregistered-description',_binary 's:37:\"Éditeurs qui ne sont pas connectés.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-user-experience-level-unregistered-label',_binary 's:13:\"Non connecté\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-watchlist-notwatched-description',_binary 's:58:\"Tout sauf des modifications de pages de la liste de suivi.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-watchlist-notwatched-label',_binary 's:27:\"Absent de la liste de suivi\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-watchlist-watched-description',_binary 's:41:\"Pages de votre liste de suivi modifiées.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-watchlist-watched-label',_binary 's:21:\"Sur la liste de suivi\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-watchlist-watchednew-description',_binary 's:125:\"Changements sur les pages de la liste de suivi que vous n\'avez pas consultées depuis que ces modifications ont été faites.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-watchlist-watchednew-label',_binary 's:44:\"Nouvelles modifications de la liste de suivi\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-watchlistactivity-seen-description',_binary 's:59:\"Modifications sur les pages que vous avez visitées depuis.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-watchlistactivity-seen-label',_binary 's:25:\"Modifications déjà vues\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-watchlistactivity-unseen-description',_binary 's:67:\"Modifications sur les pages que vous n’avez pas visitées depuis.\";'),(_binary 'fr',_binary 'messages:rcfilters-filter-watchlistactivity-unseen-label',_binary 's:22:\"Modifications non vues\";'),(_binary 'fr',_binary 'messages:rcfilters-filtergroup-authorship',_binary 's:28:\"Paternité des contributions\";'),(_binary 'fr',_binary 'messages:rcfilters-filtergroup-automated',_binary 's:27:\"Contributions automatisées\";'),(_binary 'fr',_binary 'messages:rcfilters-filtergroup-changetype',_binary 's:20:\"Type de modification\";'),(_binary 'fr',_binary 'messages:rcfilters-filtergroup-lastRevision',_binary 's:21:\"Dernières révisions\";'),(_binary 'fr',_binary 'messages:rcfilters-filtergroup-reviewstatus',_binary 's:17:\"Etat de révision\";'),(_binary 'fr',_binary 'messages:rcfilters-filtergroup-significance',_binary 's:13:\"Signification\";'),(_binary 'fr',_binary 'messages:rcfilters-filtergroup-userExpLevel',_binary 's:46:\"Enregistrement des utilisateurs et expérience\";'),(_binary 'fr',_binary 'messages:rcfilters-filtergroup-watchlist',_binary 's:26:\"Pages de la liste de suivi\";'),(_binary 'fr',_binary 'messages:rcfilters-filtergroup-watchlistactivity',_binary 's:31:\"Activité sur la liste de suivi\";'),(_binary 'fr',_binary 'messages:rcfilters-filterlist-feedbacklink',_binary 's:55:\"Dites nous ce que vous pensez de ces outils de filtrage\";'),(_binary 'fr',_binary 'messages:rcfilters-filterlist-noresults',_binary 's:20:\"Aucun filtre trouvé\";'),(_binary 'fr',_binary 'messages:rcfilters-filterlist-title',_binary 's:7:\"Filtres\";'),(_binary 'fr',_binary 'messages:rcfilters-filterlist-whatsthis',_binary 's:20:\"Comment ça marche ?\";'),(_binary 'fr',_binary 'messages:rcfilters-group-results-by-page',_binary 's:31:\"Grouper les résultats par page\";'),(_binary 'fr',_binary 'messages:rcfilters-hideminor-conflicts-typeofchange',_binary 's:169:\"Certains types de modification ne peuvent pas être qualifiés de « mineurs », donc ce filtre est en conflit avec les filtres de Type de modification suivants : $1\";'),(_binary 'fr',_binary 'messages:rcfilters-hideminor-conflicts-typeofchange-global',_binary 's:274:\"Le filtre « Modifications mineures » est en conflit avec au moins un filtre de Type de modification, parce que certains types de modification ne peuvent être marqués comme « mineurs ». Les filtres en conflit sont marqués dans la zone Filtres actifs ci-dessus.\";'),(_binary 'fr',_binary 'messages:rcfilters-highlightbutton-title',_binary 's:31:\"Mettre en valeur les résultats\";'),(_binary 'fr',_binary 'messages:rcfilters-highlighted-filters-list',_binary 's:21:\"Mis en évidence : $1\";'),(_binary 'fr',_binary 'messages:rcfilters-highlightmenu-help',_binary 's:68:\"Sélectionner une couleur pour mettre en évidence cette propriété\";'),(_binary 'fr',_binary 'messages:rcfilters-highlightmenu-title',_binary 's:19:\"Choisir une couleur\";'),(_binary 'fr',_binary 'messages:rcfilters-hours-title',_binary 's:17:\"Dernières heures\";'),(_binary 'fr',_binary 'messages:rcfilters-invalid-filter',_binary 's:17:\"Filtre non valide\";'),(_binary 'fr',_binary 'messages:rcfilters-legend-heading',_binary 's:47:\"<strong>Liste des abréviations :&#32;</strong>\";'),(_binary 'fr',_binary 'messages:rcfilters-limit-and-date-label',_binary 's:35:\"$1 modification{{PLURAL:$1||s}}, $2\";'),(_binary 'fr',_binary 'messages:rcfilters-limit-title',_binary 's:22:\"Résultats à afficher\";'),(_binary 'fr',_binary 'messages:rcfilters-liveupdates-button',_binary 's:23:\"Mises à jour en direct\";'),(_binary 'fr',_binary 'messages:rcfilters-liveupdates-button-title-off',_binary 's:59:\"Afficher les nouveaux changements dès qu\'ils se produisent\";'),(_binary 'fr',_binary 'messages:rcfilters-liveupdates-button-title-on',_binary 's:38:\"Désactiver les mises à jour à chaud\";'),(_binary 'fr',_binary 'messages:rcfilters-noresults-conflict',_binary 's:70:\"Aucun résultat trouvé car les critères de recherche sont en conflit\";'),(_binary 'fr',_binary 'messages:rcfilters-other-review-tools',_binary 's:26:\"Autres outils de relecture\";'),(_binary 'fr',_binary 'messages:rcfilters-preference-help',_binary 's:96:\"Désactive la version 2017 de l\'interface ainsi que de tous les outils ajoutés alors et depuis.\";'),(_binary 'fr',_binary 'messages:rcfilters-preference-label',_binary 's:58:\"Masquer la version améliorée des modifications récentes\";'),(_binary 'fr',_binary 'messages:rcfilters-quickfilters',_binary 's:20:\"Filtres sauvegardés\";'),(_binary 'fr',_binary 'messages:rcfilters-quickfilters-placeholder-description',_binary 's:168:\"Pour sauvegarder la configuration de vos filtres pour la réutiliser ultérieurement, cliquez sur l’icône des raccourcis dans la zone des filtres actifs, ci-dessous.\";'),(_binary 'fr',_binary 'messages:rcfilters-quickfilters-placeholder-title',_binary 's:43:\"Aucun filtre n’a encore été sauvegardé\";'),(_binary 'fr',_binary 'messages:rcfilters-restore-default-filters',_binary 's:33:\"Rétablir les filtres par défaut\";'),(_binary 'fr',_binary 'messages:rcfilters-savedqueries-add-new-title',_binary 's:46:\"Sauvegarder la configuration du filtre courant\";'),(_binary 'fr',_binary 'messages:rcfilters-savedqueries-already-saved',_binary 's:105:\"Ces filtres sont déjà enregistrés. Modifiez vos paramètres pour créer un nouveau Filtre enregistré.\";'),(_binary 'fr',_binary 'messages:rcfilters-savedqueries-apply-and-setdefault-label',_binary 's:28:\"Créer le filtre par défaut\";'),(_binary 'fr',_binary 'messages:rcfilters-savedqueries-apply-label',_binary 's:16:\"Créer un filtre\";'),(_binary 'fr',_binary 'messages:rcfilters-savedqueries-cancel-label',_binary 's:7:\"Annuler\";'),(_binary 'fr',_binary 'messages:rcfilters-savedqueries-defaultlabel',_binary 's:20:\"Filtres sauvegardés\";'),(_binary 'fr',_binary 'messages:rcfilters-savedqueries-new-name-label',_binary 's:3:\"Nom\";'),(_binary 'fr',_binary 'messages:rcfilters-savedqueries-new-name-placeholder',_binary 's:26:\"Décrire l\'objet du filtre\";'),(_binary 'fr',_binary 'messages:rcfilters-savedqueries-remove',_binary 's:9:\"Supprimer\";'),(_binary 'fr',_binary 'messages:rcfilters-savedqueries-rename',_binary 's:8:\"Renommer\";'),(_binary 'fr',_binary 'messages:rcfilters-savedqueries-setdefault',_binary 's:19:\"Activer par défaut\";'),(_binary 'fr',_binary 'messages:rcfilters-savedqueries-unsetdefault',_binary 's:20:\"Supprime par défaut\";'),(_binary 'fr',_binary 'messages:rcfilters-search-placeholder',_binary 's:77:\"Filtrer les modifications (utiliser le menu ou rechercher le nom d\'un filtre)\";'),(_binary 'fr',_binary 'messages:rcfilters-show-new-changes',_binary 's:45:\"Afficher les modifications les plus récentes\";'),(_binary 'fr',_binary 'messages:rcfilters-state-message-fullcoverage',_binary 's:158:\"Sélectionner tous les filtres dans ce groupe est la même chose que de n’en sélectionner aucun, aussi ce filtre n’a aucun effet. Le groupe comprend : $1\";'),(_binary 'fr',_binary 'messages:rcfilters-state-message-subset',_binary 's:208:\"Ce filtre n\'a aucun effet, parce que ses résultats sont inclus dans ceux de la recherche suivante, {{PLURAL:$2|filtre plus étendu|filtres plus étendus}} (essayez la mise en forme pour le différencier): $1\";'),(_binary 'fr',_binary 'messages:rcfilters-tag-prefix-namespace',_binary 's:3:\":$1\";'),(_binary 'fr',_binary 'messages:rcfilters-tag-prefix-namespace-inverted',_binary 's:24:\"<strong>:not</strong> $1\";'),(_binary 'fr',_binary 'messages:rcfilters-tag-prefix-tags',_binary 's:3:\"#$1\";'),(_binary 'fr',_binary 'messages:rcfilters-tag-remove',_binary 's:18:\"Supprimer « $1 »\";'),(_binary 'fr',_binary 'messages:rcfilters-target-page-placeholder',_binary 's:41:\"Entrer un nom de page (ou une catégorie)\";'),(_binary 'fr',_binary 'messages:rcfilters-typeofchange-conflicts-hideminor',_binary 's:184:\"Ce filtre de Type de modification est en conflit avec le filtre « Modifications mineures ». Certains type sde modification ne peuvent pas être indiqués comme « mineurs ».\";'),(_binary 'fr',_binary 'messages:rcfilters-view-namespaces-tooltip',_binary 's:41:\"Résultats du filtrage par espace de noms\";'),(_binary 'fr',_binary 'messages:rcfilters-view-return-to-default-tooltip',_binary 's:34:\"Retour au menu principal du filtre\";'),(_binary 'fr',_binary 'messages:rcfilters-view-tags',_binary 's:23:\"Modifications marquées\";'),(_binary 'fr',_binary 'messages:rcfilters-view-tags-help-icon-tooltip',_binary 's:71:\"En apprendre plus concernant les modifications balisées (Tagged Edits)\";'),(_binary 'fr',_binary 'messages:rcfilters-view-tags-tooltip',_binary 's:44:\"Résultats du filtrage par balise d\'édition\";'),(_binary 'fr',_binary 'messages:rcfilters-watchlist-edit-watchlist-button',_binary 's:37:\"Modifier votre liste de pages suivies\";'),(_binary 'fr',_binary 'messages:rcfilters-watchlist-markseen-button',_binary 's:43:\"Marquer toutes les modifications comme vues\";'),(_binary 'fr',_binary 'messages:rcfilters-watchlist-preference-help',_binary 's:97:\"Annuler la nouvelle conception de l’interface 2017 et tous les outils ajoutés alors et depuis.\";'),(_binary 'fr',_binary 'messages:rcfilters-watchlist-preference-label',_binary 's:51:\"Masquer la version améliorée de la liste de suivi\";'),(_binary 'fr',_binary 'messages:rcfilters-watchlist-showupdated',_binary 's:160:\"Les modifications faites aux pages que vous n’avez pas visitées depuis qu’elles ont été modifiées sont en <strong>gras</strong>, avec des puces pleines.\";'),(_binary 'fr',_binary 'messages:rclinks',_binary 's:84:\"Afficher les $1 dernières modifications effectuées au cours des $2 derniers jours.\";'),(_binary 'fr',_binary 'messages:rclistfrom',_binary 's:55:\"Afficher les nouvelles modifications depuis le $3 à $2\";'),(_binary 'fr',_binary 'messages:rclistfromreset',_binary 's:39:\"Réinitialiser la sélection de la date\";'),(_binary 'fr',_binary 'messages:rcnotefrom',_binary 's:160:\"Ci-dessous {{PLURAL:$5|la modification effectuée|les modifications effectuées}} depuis le <strong>$3, $4</strong> (affichées jusqu’à <strong>$1</strong>).\";'),(_binary 'fr',_binary 'messages:rcpatroldisabled',_binary 's:72:\"La fonction de relecture des modifications récentes n\'est pas activée.\";'),(_binary 'fr',_binary 'messages:rcpatroldisabledtext',_binary 's:90:\"La fonctionnalité de relecture des modifications récentes est actuellement désactivée.\";'),(_binary 'fr',_binary 'messages:rcshowhideanons',_binary 's:28:\"$1 les utilisateurs anonymes\";'),(_binary 'fr',_binary 'messages:rcshowhideanons-hide',_binary 's:7:\"Masquer\";'),(_binary 'fr',_binary 'messages:rcshowhideanons-show',_binary 's:8:\"Afficher\";'),(_binary 'fr',_binary 'messages:rcshowhidebots',_binary 's:13:\"$1 les robots\";'),(_binary 'fr',_binary 'messages:rcshowhidebots-hide',_binary 's:7:\"Masquer\";'),(_binary 'fr',_binary 'messages:rcshowhidebots-show',_binary 's:8:\"Afficher\";'),(_binary 'fr',_binary 'messages:rcshowhidecategorization',_binary 's:31:\"$1 la catégorisation des pages\";'),(_binary 'fr',_binary 'messages:rcshowhidecategorization-hide',_binary 's:6:\"Cacher\";'),(_binary 'fr',_binary 'messages:rcshowhidecategorization-show',_binary 's:8:\"Afficher\";'),(_binary 'fr',_binary 'messages:rcshowhideliu',_binary 's:32:\"$1 les utilisateurs enregistrés\";'),(_binary 'fr',_binary 'messages:rcshowhideliu-hide',_binary 's:7:\"Masquer\";'),(_binary 'fr',_binary 'messages:rcshowhideliu-show',_binary 's:8:\"Afficher\";'),(_binary 'fr',_binary 'messages:rcshowhidemine',_binary 's:20:\"$1 mes modifications\";'),(_binary 'fr',_binary 'messages:rcshowhidemine-hide',_binary 's:7:\"Masquer\";'),(_binary 'fr',_binary 'messages:rcshowhidemine-show',_binary 's:8:\"Afficher\";'),(_binary 'fr',_binary 'messages:rcshowhideminor',_binary 's:29:\"$1 les modifications mineures\";'),(_binary 'fr',_binary 'messages:rcshowhideminor-hide',_binary 's:7:\"Masquer\";'),(_binary 'fr',_binary 'messages:rcshowhideminor-show',_binary 's:8:\"Afficher\";'),(_binary 'fr',_binary 'messages:rcshowhidepatr',_binary 's:33:\"$1 les modifications surveillées\";'),(_binary 'fr',_binary 'messages:rcshowhidepatr-hide',_binary 's:7:\"Masquer\";'),(_binary 'fr',_binary 'messages:rcshowhidepatr-show',_binary 's:8:\"Afficher\";'),(_binary 'fr',_binary 'messages:readonly',_binary 's:29:\"Base de données verrouillée\";'),(_binary 'fr',_binary 'messages:readonly_lag',_binary 's:133:\"La base de données a été automatiquement verrouillée pendant que les serveurs secondaires se réalignent sur le serveur principal\";'),(_binary 'fr',_binary 'messages:readonlytext',_binary 's:288:\"Les ajouts et mises à jour de la base de données sont actuellement bloqués, probablement pour permettre la maintenance de la base, après quoi, tout rentrera dans l’ordre.\n\nL’administrateur système ayant verrouillé la base de données a fourni l’explication suivante :<br /> $1\";'),(_binary 'fr',_binary 'messages:readonlywarning',_binary 's:382:\"<strong>AVERTISSEMENT : la base de données a été verrouillée pour des opérations de maintenance. Vous ne pouvez donc pas publier vos modifications pour l’instant.</strong>\nVous pouvez copier et coller votre texte dans un fichier texte et l’enregistrer pour plus tard.\n\nL’administrateur système ayant verrouillé la base de données a donné l’explication suivante : $1\";'),(_binary 'fr',_binary 'messages:reblock-logentry',_binary 's:76:\"a modifié les paramètres du blocage de [[$1]] avec une expiration au $2 $3\";'),(_binary 'fr',_binary 'messages:recentchanges',_binary 's:23:\"Modifications récentes\";'),(_binary 'fr',_binary 'messages:recentchanges-feed-description',_binary 's:57:\"Suivez les dernières modifications du wiki dans ce flux.\";'),(_binary 'fr',_binary 'messages:recentchanges-label-bot',_binary 's:51:\"Cette modification a été effectuée par un robot.\";'),(_binary 'fr',_binary 'messages:recentchanges-label-minor',_binary 's:31:\"Cette modification est mineure.\";'),(_binary 'fr',_binary 'messages:recentchanges-label-newpage',_binary 's:45:\"Cette modification a créé une nouvelle page\";'),(_binary 'fr',_binary 'messages:recentchanges-label-plusminus',_binary 's:55:\"La taille de la page a changé de ce nombre d’octets.\";'),(_binary 'fr',_binary 'messages:recentchanges-label-unpatrolled',_binary 's:48:\"Cette modification n’a pas encore été relue.\";'),(_binary 'fr',_binary 'messages:recentchanges-legend',_binary 's:35:\"Options des modifications récentes\";'),(_binary 'fr',_binary 'messages:recentchanges-legend-bot',_binary 's:31:\"{{int:recentchanges-label-bot}}\";'),(_binary 'fr',_binary 'messages:recentchanges-legend-heading',_binary 's:27:\"<strong>Légende :</strong>\";'),(_binary 'fr',_binary 'messages:recentchanges-legend-minor',_binary 's:33:\"{{int:recentchanges-label-minor}}\";'),(_binary 'fr',_binary 'messages:recentchanges-legend-newpage',_binary 's:99:\"{{int:recentchanges-label-newpage}} (voir aussi la [[Special:NewPages|liste des nouvelles pages]]).\";'),(_binary 'fr',_binary 'messages:recentchanges-legend-plusminus',_binary 's:11:\"(\'\'±123\'\')\";'),(_binary 'fr',_binary 'messages:recentchanges-legend-unpatrolled',_binary 's:39:\"{{int:recentchanges-label-unpatrolled}}\";'),(_binary 'fr',_binary 'messages:recentchanges-network',_binary 's:101:\"Aucun résultat ne peut être affiché du fait d’une erreur technique. Veuillez actualiser la page.\";'),(_binary 'fr',_binary 'messages:recentchanges-noresult',_binary 's:77:\"Aucune modification correspondant à ces critères sur la période indiquée.\";'),(_binary 'fr',_binary 'messages:recentchanges-notargetpage',_binary 's:84:\"Entrer un nom de page ci-dessus pour voir les modifications relatives à cette page.\";'),(_binary 'fr',_binary 'messages:recentchanges-page-added-to-category',_binary 's:32:\"[[:$1]] ajouté à la catégorie\";'),(_binary 'fr',_binary 'messages:recentchanges-page-added-to-category-bundled',_binary 's:101:\"[[:$1]] ajouté à la catégorie, [[Special:WhatLinksHere/$1|cette page est incluse dans d’autres]]\";'),(_binary 'fr',_binary 'messages:recentchanges-page-removed-from-category',_binary 's:34:\"[[:$1]] supprimé de la catégorie\";'),(_binary 'fr',_binary 'messages:recentchanges-page-removed-from-category-bundled',_binary 's:104:\"[[:$1]] supprimée de la catégorie, [[Special:WhatLinksHere/$1|cette page est incluse dans d’autres]]\";'),(_binary 'fr',_binary 'messages:recentchanges-submit',_binary 's:6:\"Lister\";'),(_binary 'fr',_binary 'messages:recentchanges-summary',_binary 's:64:\"Suivez les changements les plus récents du wiki sur cette page.\";'),(_binary 'fr',_binary 'messages:recentchanges-timeout',_binary 's:115:\"Cette recherche a dépassé le délai imparti. Vous pourriez essayer avec des paramètres de recherche différents.\";'),(_binary 'fr',_binary 'messages:recentchanges-url',_binary 's:21:\"Special:RecentChanges\";'),(_binary 'fr',_binary 'messages:recentchangescount',_binary 's:123:\"Nombre de modifications à afficher par défaut dans les modifications récentes, les historiques de page et les journaux :\";'),(_binary 'fr',_binary 'messages:recentchangesdays',_binary 's:62:\"Nombre de jours à afficher dans les modifications récentes :\";'),(_binary 'fr',_binary 'messages:recentchangesdays-max',_binary 's:33:\"(maximum $1 jour{{PLURAL:$1||s}})\";'),(_binary 'fr',_binary 'messages:recentchangeslinked',_binary 's:22:\"Suivi des pages liées\";'),(_binary 'fr',_binary 'messages:recentchangeslinked-feed',_binary 's:22:\"Suivi des pages liées\";'),(_binary 'fr',_binary 'messages:recentchangeslinked-page',_binary 's:16:\"Nom de la page :\";'),(_binary 'fr',_binary 'messages:recentchangeslinked-summary',_binary 's:305:\"Entrer un nom de page pour voir les modifications faites récemment sur des pages liées vers ou depuis cette page (pour voir les membres d’une catégorie, entrez {{ns:category}}:Nom de catégorie). Les modifications des pages de [[Special:Watchlist|votre liste de suivi]] sont <strong>en gras</strong>.\";'),(_binary 'fr',_binary 'messages:recentchangeslinked-title',_binary 's:38:\"Suivi des pages associées à « $1 »\";'),(_binary 'fr',_binary 'messages:recentchangeslinked-to',_binary 's:102:\"Afficher les modifications des pages qui comportent un lien vers la page donnée plutôt que l\'inverse\";'),(_binary 'fr',_binary 'messages:recentchangeslinked-toolbox',_binary 's:22:\"Suivi des pages liées\";'),(_binary 'fr',_binary 'messages:recentchangestext',_binary 's:1:\"-\";'),(_binary 'fr',_binary 'messages:recreate',_binary 's:8:\"Recréer\";'),(_binary 'fr',_binary 'messages:recreate-moveddeleted-warn',_binary 's:289:\"<strong>Attention : vous êtes en train de recréer une page qui a été précédemment supprimée.</strong>\n\nAssurez-vous qu\'il est pertinent de poursuivre les modifications sur cette page.\nLes journaux des suppressions et déplacements pour cette page sont fournis ici pour information :\";'),(_binary 'fr',_binary 'messages:red-link-title',_binary 's:21:\"$1 (page inexistante)\";'),(_binary 'fr',_binary 'messages:redirect',_binary 's:68:\"Rediriger par ID de fichier, utilisateur, page, révision ou journal\";'),(_binary 'fr',_binary 'messages:redirect-file',_binary 's:14:\"Nom du fichier\";'),(_binary 'fr',_binary 'messages:redirect-logid',_binary 's:13:\"ID de journal\";'),(_binary 'fr',_binary 'messages:redirect-lookup',_binary 's:11:\"Recherche :\";'),(_binary 'fr',_binary 'messages:redirect-not-exists',_binary 's:19:\"Valeur non trouvée\";'),(_binary 'fr',_binary 'messages:redirect-not-numeric',_binary 's:21:\"Valeur non numérique\";'),(_binary 'fr',_binary 'messages:redirect-page',_binary 's:10:\"ID de page\";'),(_binary 'fr',_binary 'messages:redirect-revision',_binary 's:20:\"Révision de la page\";'),(_binary 'fr',_binary 'messages:redirect-submit',_binary 's:7:\"Valider\";'),(_binary 'fr',_binary 'messages:redirect-summary',_binary 's:458:\"Cette page spéciale redirige vers un fichier (nom de fichier fourni), une page (ID de révision ou de page fourni), une page d’utilisateur (identifiant numérique de l’utilisateur fourni), ou une entrée de journal (ID du journal fourni). Utilisation : [[{{#Special:Redirect}}/file/Example.jpg]], [[{{#Special:Redirect}}/page/64308]], [[{{#Special:Redirect}}/revision/328429]], [[{{#Special:Redirect}}/user/101]], ou [[{{#Special:Redirect}}/logid/186]].\";'),(_binary 'fr',_binary 'messages:redirect-text',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:redirect-user',_binary 's:19:\"ID de l\'utilisateur\";'),(_binary 'fr',_binary 'messages:redirect-value',_binary 's:8:\"Valeur :\";'),(_binary 'fr',_binary 'messages:redirectedfrom',_binary 's:21:\"(Redirigé depuis $1)\";'),(_binary 'fr',_binary 'messages:redirectpagesub',_binary 's:19:\"Page de redirection\";'),(_binary 'fr',_binary 'messages:redirectto',_binary 's:16:\"Rediriger vers :\";'),(_binary 'fr',_binary 'messages:removecredentials',_binary 's:45:\"Supprimer les informations d’identification\";'),(_binary 'fr',_binary 'messages:removecredentials-invalidsubpage',_binary 's:65:\"$1 n’est pas un type d’information d’identification valide.\";'),(_binary 'fr',_binary 'messages:removecredentials-submit',_binary 's:43:\"Supprimer les informations d\'identification\";'),(_binary 'fr',_binary 'messages:removecredentials-success',_binary 's:58:\"Vos informations d’identification ont été supprimées.\";'),(_binary 'fr',_binary 'messages:removedwatchtext',_binary 's:117:\"La page « [[:$1]] » et sa page de discussion ont été retirées de votre [[Special:Watchlist|liste de suivi]].\";'),(_binary 'fr',_binary 'messages:removedwatchtext-short',_binary 's:64:\"La page « $1 » a été supprimée de votre liste de suivi.\";'),(_binary 'fr',_binary 'messages:removedwatchtext-talk',_binary 's:106:\"« [[:$1]] » et sa page associée ont été supprimés de votre [[Special:Watchlist|liste de suivi]].\";'),(_binary 'fr',_binary 'messages:removewatch',_binary 's:30:\"Supprimer de la liste de suivi\";'),(_binary 'fr',_binary 'messages:resetpass-abort-generic',_binary 's:67:\"La modification du mot de passe a été annulée par une extension.\";'),(_binary 'fr',_binary 'messages:resetpass-expired',_binary 's:81:\"Votre mot de passe a expiré. Veuillez en fournir un nouveau pour vous connecter.\";'),(_binary 'fr',_binary 'messages:resetpass-expired-soft',_binary 's:187:\"Votre mot de passe a expiré, et doit être modifié. Veuillez en choisir un nouveau maintenant ou cliquer sur « {{int:authprovider-resetpass-skip-label}} » pour le faire plus tard.\";'),(_binary 'fr',_binary 'messages:resetpass-no-info',_binary 's:70:\"Vous devez être connecté(e) pour accéder directement à cette page.\";'),(_binary 'fr',_binary 'messages:resetpass-recycled',_binary 's:69:\"Veuillez modifier votre mot de passe avec autre chose que l’actuel.\";'),(_binary 'fr',_binary 'messages:resetpass-submit-cancel',_binary 's:7:\"Annuler\";'),(_binary 'fr',_binary 'messages:resetpass-submit-loggedin',_binary 's:23:\"Changer de mot de passe\";'),(_binary 'fr',_binary 'messages:resetpass-temp-emailed',_binary 's:156:\"Vous êtes connecté{{GENDER:||e}} avec un code temporaire fourni par courriel.\nPour terminer la connexion, vous devez fournir un nouveau mot de passe ici :\";'),(_binary 'fr',_binary 'messages:resetpass-temp-password',_binary 's:25:\"Mot de passe temporaire :\";'),(_binary 'fr',_binary 'messages:resetpass-validity-soft',_binary 's:191:\"Votre mot de passe n’est pas valide : $1\n\nVeuillez choisir un nouveau mot de passe maintenant, ou cliquez sur « {{int:authprovider-resetpass-skip-label}} » pour le modifier plus tard.\";'),(_binary 'fr',_binary 'messages:resetpass-wrong-oldpass',_binary 's:146:\"Mot de passe actuel ou temporaire invalide.\nVous avez peut-être déjà changé votre mot de passe ou demandé un nouveau mot de passe temporaire.\";'),(_binary 'fr',_binary 'messages:resetpass_announce',_binary 's:76:\"Pour terminer votre inscription, vous devez fournir un nouveau mot de passe.\";'),(_binary 'fr',_binary 'messages:resetpass_forbidden',_binary 's:47:\"Les mots de passe ne peuvent pas être changés\";'),(_binary 'fr',_binary 'messages:resetpass_forbidden-reason',_binary 's:53:\"Les mots de passe ne peuvent pas être modifiés : $1\";'),(_binary 'fr',_binary 'messages:resetpass_header',_binary 's:33:\"Changer le mot de passe du compte\";'),(_binary 'fr',_binary 'messages:resetpass_submit',_binary 's:39:\"Changer le mot de passe et se connecter\";'),(_binary 'fr',_binary 'messages:resetpass_text',_binary 's:29:\"<!-- Ajoutez le texte ici -->\";'),(_binary 'fr',_binary 'messages:resettokens',_binary 's:25:\"Réinitialiser les jetons\";'),(_binary 'fr',_binary 'messages:resettokens-done',_binary 's:23:\"Jetons réinitialisés.\";'),(_binary 'fr',_binary 'messages:resettokens-no-tokens',_binary 's:41:\"Il n’y a aucun jeton à réinitialiser.\";'),(_binary 'fr',_binary 'messages:resettokens-resetbutton',_binary 's:40:\"Réinitialiser les jetons sélectionnés\";'),(_binary 'fr',_binary 'messages:resettokens-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:resettokens-text',_binary 's:249:\"Ici, vous pouvez réinitialiser les jetons qui permettent d’accéder à certaines données privées associées à votre compte.\n\nVous devriez le faire si vous les avez partagés accidentellement avec quelqu\'un ou si votre compte a été compromis.\";'),(_binary 'fr',_binary 'messages:resettokens-token-label',_binary 's:25:\"$1 (valeur actuelle : $2)\";'),(_binary 'fr',_binary 'messages:resettokens-tokens',_binary 's:8:\"Jetons :\";'),(_binary 'fr',_binary 'messages:resettokens-watchlist-token',_binary 's:105:\"Jeton pour le flux (Atom/RSS) web de [[Special:Watchlist|modifications de pages de votre liste de suivi]]\";'),(_binary 'fr',_binary 'messages:restore-count-files',_binary 's:35:\"{{PLURAL:$1|1 fichier|$1 fichiers}}\";'),(_binary 'fr',_binary 'messages:restore-count-revisions',_binary 's:39:\"{{PLURAL:$1|1 révision|$1 révisions}}\";'),(_binary 'fr',_binary 'messages:restorelink',_binary 's:66:\"{{PLURAL:$1|une modification effacée|$1 modifications effacées}}\";'),(_binary 'fr',_binary 'messages:restoreprefs',_binary 's:69:\"Restaurer tous les paramètres par défaut (dans toutes les sections)\";'),(_binary 'fr',_binary 'messages:restricted-displaytitle',_binary 's:136:\"<strong>Avertissement :</strong> le titre d’affichage \"$1\" a été ignoré car il n\'est pas équivalent au titre effectif de la page.\";'),(_binary 'fr',_binary 'messages:restricted-displaytitle-ignored',_binary 's:42:\"Pages avec des titres d\'affichage ignorés\";'),(_binary 'fr',_binary 'messages:restricted-displaytitle-ignored-desc',_binary 's:129:\"La page a un <code><nowiki>{{DISPLAYTITLE}}</nowiki></code> ignoré parce qu\'il n\'est pas équivalent au titre actuel de la page.\";'),(_binary 'fr',_binary 'messages:restriction-create',_binary 's:6:\"Créer\";'),(_binary 'fr',_binary 'messages:restriction-edit',_binary 's:8:\"Modifier\";'),(_binary 'fr',_binary 'messages:restriction-level',_binary 's:23:\"Niveau de restriction :\";'),(_binary 'fr',_binary 'messages:restriction-level-all',_binary 's:11:\"tout niveau\";'),(_binary 'fr',_binary 'messages:restriction-level-autoconfirmed',_binary 's:15:\"semi-protection\";'),(_binary 'fr',_binary 'messages:restriction-level-sysop',_binary 's:20:\"protection complète\";'),(_binary 'fr',_binary 'messages:restriction-move',_binary 's:8:\"Renommer\";'),(_binary 'fr',_binary 'messages:restriction-type',_binary 's:14:\"Autorisation :\";'),(_binary 'fr',_binary 'messages:restriction-upload',_binary 's:18:\"Import de fichiers\";'),(_binary 'fr',_binary 'messages:restrictionsfield-badip',_binary 's:35:\"Adresse IP ou plage non valide : $1\";'),(_binary 'fr',_binary 'messages:restrictionsfield-help',_binary 's:97:\"Une adresse IP ou une plage CIDR par ligne. Pour tout activer, utiliser <pre>0.0.0.0/0\n::/0</pre>\";'),(_binary 'fr',_binary 'messages:restrictionsfield-label',_binary 's:23:\"Plages IP autorisées :\";'),(_binary 'fr',_binary 'messages:retrievedfrom',_binary 's:24:\"Récupérée de « $1 »\";'),(_binary 'fr',_binary 'messages:returnto',_binary 's:22:\"Revenir à la page $1.\";'),(_binary 'fr',_binary 'messages:retypenew',_binary 's:35:\"Confirmer le nouveau mot de passe :\";'),(_binary 'fr',_binary 'messages:reuploaddesc',_binary 's:57:\"Annuler l\'importation et retourner au formulaire d\'import\";'),(_binary 'fr',_binary 'messages:rev-deleted-comment',_binary 's:34:\"(résumé de modification retiré)\";'),(_binary 'fr',_binary 'messages:rev-deleted-diff-view',_binary 's:218:\"Une des révisions de ce diff a été <strong>supprimée</strong>.\nVous pouvez voir ce diff ; des détails sont disponibles dans le [{{fullurl:{{#Special:Log}}/delete|page={{FULLPAGENAMEE}}}} journal des suppressions].\";'),(_binary 'fr',_binary 'messages:rev-deleted-event',_binary 's:37:\"(détails de l’historique retirés)\";'),(_binary 'fr',_binary 'messages:rev-deleted-no-diff',_binary 's:219:\"Vous ne pouvez pas voir ce diff parce qu\'une des versions a été <strong>supprimée</strong>.\nDes détails sont disponibles dans le [{{fullurl:{{#Special:Log}}/delete|page={{FULLPAGENAMEE}}}} journal des suppressions].\";'),(_binary 'fr',_binary 'messages:rev-deleted-text-permission',_binary 's:186:\"Cette version de la page a été <strong>supprimée</strong>.\nLes détails sont disponibles dans le [{{fullurl:{{#Special:Log}}/delete|page={{FULLPAGENAMEE}}}} journal des suppressions].\";'),(_binary 'fr',_binary 'messages:rev-deleted-text-unhide',_binary 's:250:\"Cette version de la page a été <strong>supprimée</strong>.\nDes détails sont disponibles dans [{{fullurl:{{#Special:Log}}/delete|page={{FULLPAGENAMEE}}}} le journal des suppressions].\nVous pouvez toujours [$1 voir cette version] si vous le voulez.\";'),(_binary 'fr',_binary 'messages:rev-deleted-text-view',_binary 's:214:\"Cette version de la page a été <strong>supprimée</strong>.\nVous pouvez la visualiser ; des détails sont disponibles dans le [{{fullurl:{{#Special:Log}}/delete|page={{FULLPAGENAMEE}}}} journal des suppressions].\";'),(_binary 'fr',_binary 'messages:rev-deleted-unhide-diff',_binary 's:269:\"Une des révisions de cette différence a été <strong>supprimée</strong>.\nDes détails sont disponibles dans le [{{fullurl:{{#Special:Log}}/delete|page={{FULLPAGENAMEE}}}} journal des suppressions].\nVous pouvez toujours [$1 voir cette différence] si vous le voulez.\";'),(_binary 'fr',_binary 'messages:rev-deleted-user',_binary 's:27:\"(nom d\'utilisateur retiré)\";'),(_binary 'fr',_binary 'messages:rev-deleted-user-contribs',_binary 's:92:\"[nom d’utilisateur ou adresse IP retiré – modification masquée dans les contributions]\";'),(_binary 'fr',_binary 'messages:rev-delundel',_binary 's:16:\"afficher/masquer\";'),(_binary 'fr',_binary 'messages:rev-showdeleted',_binary 's:8:\"afficher\";'),(_binary 'fr',_binary 'messages:rev-suppressed-diff-view',_binary 's:215:\"Une des révisions de ce diff a été <strong>masquée</strong>.\nVous pouvez voir ce diff ; des détails sont disponibles dans le [{{fullurl:{{#Special:Log}}/suppress|page={{FULLPAGENAMEE}}}} journal des masquages].\";'),(_binary 'fr',_binary 'messages:rev-suppressed-no-diff',_binary 's:99:\"Vous ne pouvez pas voir cette différence car une des révisions a été <strong>masquée</strong>.\";'),(_binary 'fr',_binary 'messages:rev-suppressed-text-permission',_binary 's:178:\"Cette version de la page a été <strong>masquée</strong>.\nLes détails se trouvent dans le [{{fullurl:{{#Special:Log}}/suppress|page={{FULLPAGENAMEE}}}} journal des masquages].\";'),(_binary 'fr',_binary 'messages:rev-suppressed-text-unhide',_binary 's:247:\"Cette version de la page a été <strong>masquée</strong>.\nDes détails sont disponibles dans [{{fullurl:{{#Special:Log}}/suppress|page={{FULLPAGENAMEE}}}} le journal des masquages].\nVous pouvez toujours [$1 voir cette version] si vous le voulez.\";'),(_binary 'fr',_binary 'messages:rev-suppressed-text-view',_binary 's:211:\"Cette version de la page a été <strong>masquée</strong>.\nVous pouvez la visualiser ; des détails sont disponibles dans le [{{fullurl:{{#Special:Log}}/suppress|page={{FULLPAGENAMEE}}}} journal des masquages].\";'),(_binary 'fr',_binary 'messages:rev-suppressed-unhide-diff',_binary 's:261:\"L’une des révisions de ce diff a été <strong>masquée</strong>.\nDes détails sont disponibles dans le [{{fullurl:{{#Special:Log}}/suppress|page={{FULLPAGENAMEE}}}} journal des masquages].\nVous pouvez toujours [$1 voir ce diff] si vous souhaitez poursuivre.\";'),(_binary 'fr',_binary 'messages:revdel-restore',_binary 's:23:\"modifier la visibilité\";'),(_binary 'fr',_binary 'messages:revdelete-concurrent-change',_binary 's:168:\"Erreur lors de la modification de l\'élément daté du $1 à $2 : son statut a été changé par quelqu\'un d\'autre pendant que vous le modifiez.\nVérifiez les journaux.\";'),(_binary 'fr',_binary 'messages:revdelete-confirm',_binary 's:169:\"Confirmez que vous voulez effectuer cette action, que vous en comprenez les conséquences, et que vous le faites en accord avec [[{{MediaWiki:Policy-url}}|les règles]].\";'),(_binary 'fr',_binary 'messages:revdelete-content-hid',_binary 's:15:\"contenu masqué\";'),(_binary 'fr',_binary 'messages:revdelete-content-unhid',_binary 's:16:\"contenu affiché\";'),(_binary 'fr',_binary 'messages:revdelete-edit-reasonlist',_binary 's:45:\"Modifier les motifs fréquents de suppression\";'),(_binary 'fr',_binary 'messages:revdelete-failure',_binary 's:69:\"\'\'\'La visibilité de la version n\'a pas pu être mise à jour :\'\'\'\n$1\";'),(_binary 'fr',_binary 'messages:revdelete-hide-comment',_binary 's:24:\"Résumé de modification\";'),(_binary 'fr',_binary 'messages:revdelete-hide-current',_binary 's:126:\"Erreur lors de la suppression de l\'élément daté du $1 à $2 : il est la révision courante.\nIl ne peut pas être supprimé.\";'),(_binary 'fr',_binary 'messages:revdelete-hide-image',_binary 's:29:\"Masquer le contenu du fichier\";'),(_binary 'fr',_binary 'messages:revdelete-hide-name',_binary 's:35:\"Masquer la cible et les paramètres\";'),(_binary 'fr',_binary 'messages:revdelete-hide-restricted',_binary 's:62:\"Supprimer ces données aux administrateurs ainsi qu\'aux autres\";'),(_binary 'fr',_binary 'messages:revdelete-hide-text',_binary 's:21:\"Texte de la révision\";'),(_binary 'fr',_binary 'messages:revdelete-hide-user',_binary 's:46:\"Nom d’utilisateur/Adresse IP de l’éditeur\";'),(_binary 'fr',_binary 'messages:revdelete-legend',_binary 's:47:\"Mettre en place des restrictions de visibilité\";'),(_binary 'fr',_binary 'messages:revdelete-log',_binary 's:7:\"Motif :\";'),(_binary 'fr',_binary 'messages:revdelete-modify-missing',_binary 's:103:\"Erreur lors de la modification de l\'élément avec l\'ID $1 : il est manquant dans la base de données !\";'),(_binary 'fr',_binary 'messages:revdelete-modify-no-access',_binary 's:129:\"Erreur lors de la modification de l\'élément daté du $1 à $2 : il est marqué comme « restreint ».\nVous n\'y avez pas accès.\";'),(_binary 'fr',_binary 'messages:revdelete-no-change',_binary 's:98:\"\'\'\'Attention :\'\'\' L\'élément daté du $1 à $2 a déjà les paramètres de visibilité demandés.\";'),(_binary 'fr',_binary 'messages:revdelete-no-file',_binary 's:35:\"Le fichier spécifié n\'existe pas.\";'),(_binary 'fr',_binary 'messages:revdelete-nooldid-text',_binary 's:176:\"Vous n’avez pas précisé de révision(s) cible(s) pour cette fonction, ou bien la révision spécifiée n’existe pas, ou bien vous tentez de masquer la révision actuelle.\";'),(_binary 'fr',_binary 'messages:revdelete-nooldid-title',_binary 's:24:\"Version cible non valide\";'),(_binary 'fr',_binary 'messages:revdelete-offender',_binary 's:24:\"Auteur de la révision :\";'),(_binary 'fr',_binary 'messages:revdelete-only-restricted',_binary 's:192:\"Erreur lors de la suppression de l\'entrée datée du $1 à $2 : vous ne pouvez pas supprimer ces éléments aux administrateurs sans également sélectionner les autres options de suppression.\";'),(_binary 'fr',_binary 'messages:revdelete-otherreason',_binary 's:39:\"Autre raison / raison supplémentaire :\";'),(_binary 'fr',_binary 'messages:revdelete-radio-same',_binary 's:16:\"(ne pas changer)\";'),(_binary 'fr',_binary 'messages:revdelete-radio-set',_binary 's:7:\"Masqué\";'),(_binary 'fr',_binary 'messages:revdelete-radio-unset',_binary 's:7:\"Visible\";'),(_binary 'fr',_binary 'messages:revdelete-reason-dropdown',_binary 's:210:\"* Raisons courantes de suppression \n** Violation des droits d\'auteurs \n** Commentaires ou renseignements personnels inappropriés \n** Nom d\'utilisateur inapproprié\n** Informations potentiellement diffamatoires\";'),(_binary 'fr',_binary 'messages:revdelete-reasonotherlist',_binary 's:12:\"Autre raison\";'),(_binary 'fr',_binary 'messages:revdelete-restricted',_binary 's:44:\"restrictions appliquées aux administrateurs\";'),(_binary 'fr',_binary 'messages:revdelete-selected-file',_binary 's:96:\"{{PLURAL:$1|Version de fichier sélectionnée|Versions de fichier sélectionnées}} de [[:$2]] :\";'),(_binary 'fr',_binary 'messages:revdelete-selected-text',_binary 's:78:\"{{PLURAL:$1|Révision sélectionnée|Révisions sélectionnées}} de [[:$2]] :\";'),(_binary 'fr',_binary 'messages:revdelete-show-file-confirm',_binary 's:127:\"Êtes-vous sûr{{GENDER:||e}} de vouloir voir la révision supprimée du fichier « <nowiki>$1</nowiki> » datant du $2 à $3 ?\";'),(_binary 'fr',_binary 'messages:revdelete-show-file-submit',_binary 's:3:\"Oui\";'),(_binary 'fr',_binary 'messages:revdelete-show-no-access',_binary 's:125:\"Erreur lors de l\'affichage de l\'élément daté du $1 à $2 : il est marqué comme « restreint ».\nVous n\'y avez pas accès.\";'),(_binary 'fr',_binary 'messages:revdelete-submit',_binary 's:85:\"Appliquer {{PLURAL:$1|à la révision sélectionnée|aux révisions sélectionnées}}\";'),(_binary 'fr',_binary 'messages:revdelete-success',_binary 's:38:\"Visibilité des versions mise à jour.\";'),(_binary 'fr',_binary 'messages:revdelete-summary-hid',_binary 's:32:\"résumé de modification masqué\";'),(_binary 'fr',_binary 'messages:revdelete-summary-unhid',_binary 's:33:\"résumé de modification affiché\";'),(_binary 'fr',_binary 'messages:revdelete-suppress',_binary 's:56:\"Masquer également les données pour les administrateurs\";'),(_binary 'fr',_binary 'messages:revdelete-suppress-text',_binary 's:251:\"La suppression ne doit être utilisée <strong>que</strong> dans les cas suivants :\n* informations potentiellement diffamatoires\n* informations personnelles inappropriées\n*: <em>adresse, numéro de téléphone, numéro de sécurité sociale, …</em>\";'),(_binary 'fr',_binary 'messages:revdelete-text-file',_binary 's:158:\"Les versions de fichier supprimées continueront à apparaître dans l’historique des fichiers, mais une partie de leur contenu sera indisponible au public.\";'),(_binary 'fr',_binary 'messages:revdelete-text-others',_binary 's:161:\"Les autres administrateurs seront toujours en mesure d\'accéder au contenu caché et le restaurer, à moins que des restrictions supplémentaires soient fixées.\";'),(_binary 'fr',_binary 'messages:revdelete-text-text',_binary 's:147:\"Les révisions supprimées continueront à apparaître dans l’historique de la page, mais une partie de leur contenu sera inaccessible au public.\";'),(_binary 'fr',_binary 'messages:revdelete-uname-hid',_binary 's:25:\"nom d\'utilisateur masqué\";'),(_binary 'fr',_binary 'messages:revdelete-uname-unhid',_binary 's:26:\"nom d\'utilisateur affiché\";'),(_binary 'fr',_binary 'messages:revdelete-unrestricted',_binary 's:47:\"restrictions retirées pour les administrateurs\";'),(_binary 'fr',_binary 'messages:revdelete-unsuppress',_binary 's:53:\"Enlever les restrictions sur les versions restaurées\";'),(_binary 'fr',_binary 'messages:reverted',_binary 's:30:\"Version précédente rétablie\";'),(_binary 'fr',_binary 'messages:revertmerge',_binary 's:8:\"Séparer\";'),(_binary 'fr',_binary 'messages:revertmove',_binary 's:9:\"rétablir\";'),(_binary 'fr',_binary 'messages:revertpage',_binary 's:138:\"Révocation des modifications de [[Special:Contributions/$2|$2]] ([[User talk:$2|discussion]]) vers la dernière version de [[User:$1|$1]]\";'),(_binary 'fr',_binary 'messages:revertpage-nouser',_binary 's:113:\"Révocation des modifications par un utilisateur masqué à la dernière version par {{GENDER:$1|[[User:$1|$1]]}}\";'),(_binary 'fr',_binary 'messages:revid',_binary 's:10:\"version $1\";'),(_binary 'fr',_binary 'messages:revision-info',_binary 's:45:\"Révision datée du $1 par {{GENDER:$6|$2}}$7\";'),(_binary 'fr',_binary 'messages:revision-info-current',_binary 's:1:\"-\";'),(_binary 'fr',_binary 'messages:revision-nav',_binary 's:65:\"($1) $2{{int:pipe-separator}}$3 ($4){{int:pipe-separator}}$5 ($6)\";'),(_binary 'fr',_binary 'messages:revisionasof',_binary 's:13:\"Version du $1\";'),(_binary 'fr',_binary 'messages:revisiondelete',_binary 's:39:\"Supprimer ou restaurer des événements\";'),(_binary 'fr',_binary 'messages:rfcurl',_binary 's:33:\"https://tools.ietf.org/html/rfc$1\";'),(_binary 'fr',_binary 'messages:right-apihighlimits',_binary 's:58:\"Utiliser des limites plus élevées dans les requêtes API\";'),(_binary 'fr',_binary 'messages:right-applychangetags',_binary 's:69:\"Appliquer [[Special:Tags|les balises]] avec ses propres modifications\";'),(_binary 'fr',_binary 'messages:right-autoconfirmed',_binary 's:74:\"Ne pas être affecté par les limitations de débit liées aux adresses IP\";'),(_binary 'fr',_binary 'messages:right-autocreateaccount',_binary 's:56:\"Connexion automatique avec un compte utilisateur externe\";'),(_binary 'fr',_binary 'messages:right-autopatrol',_binary 's:62:\"Avoir ses modifications automatiquement marquées comme relues\";'),(_binary 'fr',_binary 'messages:right-bigdelete',_binary 's:44:\"Supprimer des pages ayant un gros historique\";'),(_binary 'fr',_binary 'messages:right-block',_binary 's:42:\"Bloquer en écriture d\'autres utilisateurs\";'),(_binary 'fr',_binary 'messages:right-blockemail',_binary 's:48:\"Empêcher un utilisateur d\'envoyer des courriels\";'),(_binary 'fr',_binary 'messages:right-bot',_binary 's:44:\"Être traité comme un processus automatisé\";'),(_binary 'fr',_binary 'messages:right-browsearchive',_binary 's:32:\"Rechercher des pages supprimées\";'),(_binary 'fr',_binary 'messages:right-changetags',_binary 's:130:\"Ajouter et supprimer de façon arbitraire [[Special:Tags|des balises]] sur des révisions individuelles et des entrées de journal\";'),(_binary 'fr',_binary 'messages:right-createaccount',_binary 's:30:\"Créer des comptes utilisateur\";'),(_binary 'fr',_binary 'messages:right-createpage',_binary 's:58:\"Créer des pages (qui ne sont pas des pages de discussion)\";'),(_binary 'fr',_binary 'messages:right-createtalk',_binary 's:30:\"Créer des pages de discussion\";'),(_binary 'fr',_binary 'messages:right-delete',_binary 's:19:\"Supprimer des pages\";'),(_binary 'fr',_binary 'messages:right-deletechangetags',_binary 's:61:\"Supprimer des [[Special:Tags|balises]] de la base de données\";'),(_binary 'fr',_binary 'messages:right-deletedhistory',_binary 's:67:\"Voir les entrées des historiques supprimées, mais sans leur texte\";'),(_binary 'fr',_binary 'messages:right-deletedtext',_binary 's:74:\"Voir le texte supprimé et les différences entre les versions supprimées\";'),(_binary 'fr',_binary 'messages:right-deletelogentry',_binary 's:61:\"Supprimer et restaurer des entrées particulières du journal\";'),(_binary 'fr',_binary 'messages:right-deleterevision',_binary 's:59:\"Supprimer ou restaurer des versions particulières de pages\";'),(_binary 'fr',_binary 'messages:right-edit',_binary 's:18:\"Modifier les pages\";'),(_binary 'fr',_binary 'messages:right-editcontentmodel',_binary 's:43:\"Modifier le modèle de contenu d’une page\";'),(_binary 'fr',_binary 'messages:right-editinterface',_binary 's:32:\"Modifier l\'interface utilisateur\";'),(_binary 'fr',_binary 'messages:right-editmyoptions',_binary 's:26:\"Modifier vos préférences\";'),(_binary 'fr',_binary 'messages:right-editmyprivateinfo',_binary 's:78:\"Modifier vos données personnelles (par exemple votre adresse, votre vrai nom)\";'),(_binary 'fr',_binary 'messages:right-editmyusercss',_binary 's:45:\"Modifier vos propres fichiers CSS utilisateur\";'),(_binary 'fr',_binary 'messages:right-editmyuserjs',_binary 's:52:\"Modifier vos propres fichiers JavaScript utilisateur\";'),(_binary 'fr',_binary 'messages:right-editmyuserjson',_binary 's:46:\"Modifier vos propres fichiers utilisateur JSON\";'),(_binary 'fr',_binary 'messages:right-editmywatchlist',_binary 's:112:\"Modifier votre propre liste de suivi. Remarquez que certaines actions ajouteront encore des pages sans ce droit.\";'),(_binary 'fr',_binary 'messages:right-editprotected',_binary 's:69:\"Modifier les pages protégées avec « {{int:protect-level-sysop}} »\";'),(_binary 'fr',_binary 'messages:right-editsemiprotected',_binary 's:79:\"Modifier les pages protégées avec « {{int:protect-level-autoconfirmed}} »\";'),(_binary 'fr',_binary 'messages:right-editsitecss',_binary 's:23:\"Modifier le CSS du site\";'),(_binary 'fr',_binary 'messages:right-editsitejs',_binary 's:30:\"Modifier le JavaScript du site\";'),(_binary 'fr',_binary 'messages:right-editsitejson',_binary 's:24:\"Modifier le JSON du site\";'),(_binary 'fr',_binary 'messages:right-editusercss',_binary 's:47:\"Modifier les fichiers CSS d\'autres utilisateurs\";'),(_binary 'fr',_binary 'messages:right-edituserjs',_binary 's:54:\"Modifier les fichiers JavaScript d\'autres utilisateurs\";'),(_binary 'fr',_binary 'messages:right-edituserjson',_binary 's:51:\"Modifier les fichiers JSON d’un autre utilisateur\";'),(_binary 'fr',_binary 'messages:right-hideuser',_binary 's:52:\"Bloquer un utilisateur en masquant son nom au public\";'),(_binary 'fr',_binary 'messages:right-import',_binary 's:40:\"Importer des pages depuis d\'autres wikis\";'),(_binary 'fr',_binary 'messages:right-importupload',_binary 's:36:\"Importer des pages depuis un fichier\";'),(_binary 'fr',_binary 'messages:right-ipblock-exempt',_binary 's:100:\"Ne pas être affecté par les IP bloquées, les blocages automatiques et les blocages de plages d\'IP\";'),(_binary 'fr',_binary 'messages:right-managechangetags',_binary 's:52:\"Créer et (dés)activer des [[Special:Tags|balises]]\";'),(_binary 'fr',_binary 'messages:right-markbotedits',_binary 's:76:\"Marquer des modifications révoquées comme ayant été faites par un robot.\";'),(_binary 'fr',_binary 'messages:right-mergehistory',_binary 's:35:\"Fusionner les historiques des pages\";'),(_binary 'fr',_binary 'messages:right-minoredit',_binary 's:40:\"Marquer les modifications comme mineures\";'),(_binary 'fr',_binary 'messages:right-move',_binary 's:18:\"Renommer des pages\";'),(_binary 'fr',_binary 'messages:right-move-categorypages',_binary 's:32:\"Renommer des pages de catégorie\";'),(_binary 'fr',_binary 'messages:right-move-rootuserpages',_binary 's:46:\"Renommer la page principale d’un utilisateur\";'),(_binary 'fr',_binary 'messages:right-move-subpages',_binary 's:40:\"Renommer des pages avec leurs sous-pages\";'),(_binary 'fr',_binary 'messages:right-movefile',_binary 's:21:\"Renommer des fichiers\";'),(_binary 'fr',_binary 'messages:right-nominornewtalk',_binary 's:140:\"Ne pas déclencher la notification de nouveau message lorsqu\'on effectue une modification mineure sur la page de discussion d\'un utilisateur\";'),(_binary 'fr',_binary 'messages:right-noratelimit',_binary 's:45:\"Ne pas être affecté par les limites de taux\";'),(_binary 'fr',_binary 'messages:right-override-export-depth',_binary 's:84:\"Exporter les pages en incluant les pages liées jusqu\'à une profondeur de 5 niveaux\";'),(_binary 'fr',_binary 'messages:right-pagelang',_binary 's:28:\"Changer la langue de la page\";'),(_binary 'fr',_binary 'messages:right-patrol',_binary 's:56:\"Marquer les modifications des autres comme étant relues\";'),(_binary 'fr',_binary 'messages:right-patrolmarks',_binary 's:64:\"Voir les marquages de relecture dans les modifications récentes\";'),(_binary 'fr',_binary 'messages:right-protect',_binary 's:79:\"Modifier les niveaux de protection et modifier les pages protégées en cascade\";'),(_binary 'fr',_binary 'messages:right-purge',_binary 's:61:\"Effacer une page du cache local sans demander de confirmation\";'),(_binary 'fr',_binary 'messages:right-read',_binary 's:14:\"Lire les pages\";'),(_binary 'fr',_binary 'messages:right-reupload',_binary 's:28:\"Écraser un fichier existant\";'),(_binary 'fr',_binary 'messages:right-reupload-own',_binary 's:49:\"Écraser un fichier que l\'on a soi-même importé\";'),(_binary 'fr',_binary 'messages:right-reupload-shared',_binary 's:66:\"Écraser localement des fichiers présents sur un dépôt partagé\";'),(_binary 'fr',_binary 'messages:right-rollback',_binary 's:87:\"Révoquer rapidement les modifications du dernier contributeur d\'une page particulière\";'),(_binary 'fr',_binary 'messages:right-sendemail',_binary 's:43:\"Envoyer un courriel aux autres utilisateurs\";'),(_binary 'fr',_binary 'messages:right-siteadmin',_binary 's:49:\"Verrouiller ou déverrouiller la base de données\";'),(_binary 'fr',_binary 'messages:right-suppressionlog',_binary 's:25:\"Voir les journaux privés\";'),(_binary 'fr',_binary 'messages:right-suppressredirect',_binary 's:79:\"Ne pas créer de redirection depuis le titre d’origine en renommant les pages\";'),(_binary 'fr',_binary 'messages:right-suppressrevision',_binary 's:102:\"Afficher, masquer et démasquer des révisions spécifiques de pages pour n’importe quel utilisateur\";'),(_binary 'fr',_binary 'messages:right-unblockself',_binary 's:23:\"Se débloquer soi-même\";'),(_binary 'fr',_binary 'messages:right-undelete',_binary 's:29:\"Restaurer une page supprimée\";'),(_binary 'fr',_binary 'messages:right-unwatchedpages',_binary 's:35:\"Voir la liste des pages non suivies\";'),(_binary 'fr',_binary 'messages:right-upload',_binary 's:21:\"Importer des fichiers\";'),(_binary 'fr',_binary 'messages:right-upload_by_url',_binary 's:42:\"Importer un fichier depuis une adresse URL\";'),(_binary 'fr',_binary 'messages:right-userrights',_binary 's:41:\"Modifier tous les droits d\'un utilisateur\";'),(_binary 'fr',_binary 'messages:right-userrights-interwiki',_binary 's:64:\"Modifier les droits des utilisateurs qui sont sur d\'autres wikis\";'),(_binary 'fr',_binary 'messages:right-viewmyprivateinfo',_binary 's:74:\"Voir vos données personnelles (par exemple votre adresse, votre vrai nom)\";'),(_binary 'fr',_binary 'messages:right-viewmywatchlist',_binary 's:36:\"Afficher votre propre liste de suivi\";'),(_binary 'fr',_binary 'messages:right-viewsuppressed',_binary 's:67:\"Afficher les révisions masquées pour n’importe quel utilisateur\";'),(_binary 'fr',_binary 'messages:right-writeapi',_binary 's:38:\"Utiliser l\'API de modification du wiki\";'),(_binary 'fr',_binary 'messages:rightslog',_binary 's:52:\"Journal des modifications de droits d’utilisateurs\";'),(_binary 'fr',_binary 'messages:rightslogentry',_binary 's:45:\"changed group membership for $1 from $2 to $3\";'),(_binary 'fr',_binary 'messages:rightslogentry-autopromote',_binary 's:40:\"was automatically promoted from $2 to $3\";'),(_binary 'fr',_binary 'messages:rightslogentry-temporary-group',_binary 's:28:\"$1 (temporaire, jusqu\'au $2)\";'),(_binary 'fr',_binary 'messages:rightslogtext',_binary 's:67:\"Voici l’historique des modifications des droits des utilisateurs.\";'),(_binary 'fr',_binary 'messages:rightsnone',_binary 's:7:\"(aucun)\";'),(_binary 'fr',_binary 'messages:rollback',_binary 's:27:\"Révoquer les modifications\";'),(_binary 'fr',_binary 'messages:rollback-missingparam',_binary 's:49:\"Paramètres nécessaires à la demande manquants.\";'),(_binary 'fr',_binary 'messages:rollback-missingrevision',_binary 's:49:\"Impossible de charger les données de la version.\";'),(_binary 'fr',_binary 'messages:rollback-success',_binary 's:128:\"Révocation des modifications effectuées par {{GENDER:$3|$1}} ;\nrétablissement de la dernière version par {{GENDER:$4|$2}}.\";'),(_binary 'fr',_binary 'messages:rollback-success-notify',_binary 's:99:\"Modifications annulées par $1 ;\nretour à la dernière révision par $2. [$3 Voir les changements]\";'),(_binary 'fr',_binary 'messages:rollbackfailed',_binary 's:25:\"La révocation a échoué\";'),(_binary 'fr',_binary 'messages:rollbacklink',_binary 's:9:\"révoquer\";'),(_binary 'fr',_binary 'messages:rollbacklinkcount',_binary 's:53:\"révoquer $1 {{PLURAL:$1|modification|modifications}}\";'),(_binary 'fr',_binary 'messages:rollbacklinkcount-morethan',_binary 's:61:\"révoquer plus de $1 {{PLURAL:$1|modification|modifications}}\";'),(_binary 'fr',_binary 'messages:rotate-comment',_binary 's:89:\"Image pivotée de $1 {{PLURAL:$1|degré|degrés}} dans le sens des aiguilles d\'une montre\";'),(_binary 'fr',_binary 'messages:sat',_binary 's:4:\"Sam.\";'),(_binary 'fr',_binary 'messages:saturday',_binary 's:6:\"samedi\";'),(_binary 'fr',_binary 'messages:saturday-at',_binary 's:12:\"Samedi à $1\";'),(_binary 'fr',_binary 'messages:savearticle',_binary 's:11:\"Enregistrer\";'),(_binary 'fr',_binary 'messages:savearticle-start',_binary 's:22:\"Enregistrer la page…\";'),(_binary 'fr',_binary 'messages:savechanges',_binary 's:29:\"Enregistrer les modifications\";'),(_binary 'fr',_binary 'messages:savechanges-start',_binary 's:32:\"Enregistrer les modifications…\";'),(_binary 'fr',_binary 'messages:savedprefs',_binary 's:42:\"Les préférences ont été sauvegardées.\";'),(_binary 'fr',_binary 'messages:savedrights',_binary 's:73:\"Le groupes de l\'utilisat{{GENDER:$1|eur|rice}} $1 ont été sauvegardés.\";'),(_binary 'fr',_binary 'messages:savefile',_binary 's:22:\"Sauvegarder le fichier\";'),(_binary 'fr',_binary 'messages:saveprefs',_binary 's:29:\"Enregistrer les préférences\";'),(_binary 'fr',_binary 'messages:saveusergroups',_binary 's:61:\"Enregistrer les groupes de l’utilisat{{GENDER:$1|eur|rice}}\";'),(_binary 'fr',_binary 'messages:scarytranscludedisabled',_binary 's:44:\"[La transclusion interwiki est désactivée]\";'),(_binary 'fr',_binary 'messages:scarytranscludefailed',_binary 's:49:\"[La récupération de modèle a échoué pour $1]\";'),(_binary 'fr',_binary 'messages:scarytranscludefailed-httpstatus',_binary 's:61:\"[Échec de la récupération du modèle pour  $1 : HTTP  $2 ]\";'),(_binary 'fr',_binary 'messages:scarytranscludetoolong',_binary 's:23:\"[L\'URL est trop longue]\";'),(_binary 'fr',_binary 'messages:search',_binary 's:10:\"Rechercher\";'),(_binary 'fr',_binary 'messages:search-category',_binary 's:15:\"(catégorie $1)\";'),(_binary 'fr',_binary 'messages:search-error',_binary 's:45:\"Une erreur s\'est produite en recherchant : $1\";'),(_binary 'fr',_binary 'messages:search-external',_binary 's:17:\"Recherche externe\";'),(_binary 'fr',_binary 'messages:search-file-match',_binary 's:34:\"(correspond au contenu du fichier)\";'),(_binary 'fr',_binary 'messages:search-filter-title-prefix',_binary 's:69:\"Recherche seulement les pages dont le titre commence par « $1 »\";'),(_binary 'fr',_binary 'messages:search-filter-title-prefix-reset',_binary 's:27:\"Rechercher toutes les pages\";'),(_binary 'fr',_binary 'messages:search-ignored-headings',_binary 's:561:\" #<!-- ne pas modifier cette ligne --><pre>\n# Titres des sections qui seront ignorés par la recherche.\n# Les changements effectués ici prennent effet dès lors que la page avec le titre est indexée.\n# Vous pouvez forcer la réindexation de la page en effectuant une modification vide.\n# La syntaxe est la suivante :\n#   * Toute ce qui suit un « # » jusqu’à la fin de la ligne est un commentaire.\n#   * Toute ligne non-vide est le titre exact à ignorer, casse comprise.\nRéférences\nLiens externes\nVoir aussi\n #</pre><!-- ne pas modifier cette ligne -->\";'),(_binary 'fr',_binary 'messages:search-interwiki-caption',_binary 's:30:\"Résultats des projets frères\";'),(_binary 'fr',_binary 'messages:search-interwiki-custom',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:search-interwiki-default',_binary 's:18:\"Résultats de $1 :\";'),(_binary 'fr',_binary 'messages:search-interwiki-more',_binary 's:6:\"(plus)\";'),(_binary 'fr',_binary 'messages:search-interwiki-more-results',_binary 's:27:\"résultats supplémentaires\";'),(_binary 'fr',_binary 'messages:search-nonefound',_binary 's:54:\"Il n\'y a aucun résultat correspondant à la requête.\";'),(_binary 'fr',_binary 'messages:search-nonefound-thiswiki',_binary 's:70:\"Il n’y a pas de résultats correspondant à la requête sur ce site.\";'),(_binary 'fr',_binary 'messages:search-redirect',_binary 's:23:\"(redirection depuis $1)\";'),(_binary 'fr',_binary 'messages:search-relatedarticle',_binary 's:7:\"Reliés\";'),(_binary 'fr',_binary 'messages:search-result-category-size',_binary 's:90:\"$1 membre{{PLURAL:$1||s}} ($2 sous-catégorie{{PLURAL:$2||s}}, $3 fichier{{PLURAL:$3||s}})\";'),(_binary 'fr',_binary 'messages:search-result-size',_binary 's:27:\"$1 ($2 mot{{PLURAL:$2||s}})\";'),(_binary 'fr',_binary 'messages:search-rewritten',_binary 's:56:\"Résultats affichés pour $1. Rechercher $2 à la place.\";'),(_binary 'fr',_binary 'messages:search-section',_binary 's:12:\"(section $1)\";'),(_binary 'fr',_binary 'messages:search-showingresults',_binary 's:132:\"{{PLURAL:$4|Résultat <strong>$1</strong> parmi <strong>$3</strong>|Résultats <strong>$1 à $2</strong> parmi <strong>$3</strong>}}\";'),(_binary 'fr',_binary 'messages:search-suggest',_binary 's:35:\"Essayez avec cette orthographe : $1\";'),(_binary 'fr',_binary 'messages:search-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:search-warning',_binary 's:59:\"Un avertissement a été signalé lors de la recherche : $1\";'),(_binary 'fr',_binary 'messages:searchall',_binary 's:4:\"tout\";'),(_binary 'fr',_binary 'messages:searcharticle',_binary 's:9:\"Continuer\";'),(_binary 'fr',_binary 'messages:searchbutton',_binary 's:10:\"Rechercher\";'),(_binary 'fr',_binary 'messages:searchdisabled',_binary 's:207:\"La recherche sur {{SITENAME}} est désactivée. En attendant la réactivation, vous pouvez effectuer une recherche via Google. Attention, leur indexation du contenu de {{SITENAME}} peut ne pas être à jour.\";'),(_binary 'fr',_binary 'messages:searchmenu-exists',_binary 's:146:\"<strong>Il existe une page nommée « [[:$1]] » sur ce wiki.</strong> {{PLURAL:$2|0=|Voyez également les autres résultats de votre recherche.}}\";'),(_binary 'fr',_binary 'messages:searchmenu-new',_binary 's:192:\"<strong>Créer la page « [[:$1|$1]] » sur ce wiki !</strong> {{PLURAL:$2|0=Voyez également la page trouvée avec votre recherche.|Voyez également les résultats de votre recherche.}}\";'),(_binary 'fr',_binary 'messages:searchmenu-new-nocreate',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:searchprofile-advanced',_binary 's:18:\"Recherche avancée\";'),(_binary 'fr',_binary 'messages:searchprofile-advanced-tooltip',_binary 's:48:\"Chercher dans les espaces de noms personnalisés\";'),(_binary 'fr',_binary 'messages:searchprofile-articles',_binary 's:16:\"Pages de contenu\";'),(_binary 'fr',_binary 'messages:searchprofile-articles-tooltip',_binary 's:18:\"Rechercher dans $1\";'),(_binary 'fr',_binary 'messages:searchprofile-everything',_binary 's:4:\"Tout\";'),(_binary 'fr',_binary 'messages:searchprofile-everything-tooltip',_binary 's:69:\"Rechercher dans tout le site (y compris dans les pages de discussion)\";'),(_binary 'fr',_binary 'messages:searchprofile-images',_binary 's:11:\"Multimédia\";'),(_binary 'fr',_binary 'messages:searchprofile-images-tooltip',_binary 's:36:\"Rechercher des fichiers multimédias\";'),(_binary 'fr',_binary 'messages:searchrelated',_binary 's:7:\"reliés\";'),(_binary 'fr',_binary 'messages:searchresults',_binary 's:26:\"Résultats de la recherche\";'),(_binary 'fr',_binary 'messages:searchresults-title',_binary 's:37:\"Résultats de recherche pour « $1 »\";'),(_binary 'fr',_binary 'messages:searchresultshead',_binary 's:25:\"Filtrer avec cette valeur\";'),(_binary 'fr',_binary 'messages:searchsuggest-containing',_binary 's:12:\"contenant...\";'),(_binary 'fr',_binary 'messages:searchsuggest-search',_binary 's:28:\"Rechercher dans {{SITENAME}}\";'),(_binary 'fr',_binary 'messages:seconds',_binary 's:36:\"{{PLURAL:$1|$1 seconde|$1 secondes}}\";'),(_binary 'fr',_binary 'messages:seconds-abbrev',_binary 's:9:\"$1&nbsp;s\";'),(_binary 'fr',_binary 'messages:seconds-ago',_binary 's:40:\"il y a $1 {{PLURAL:$1|seconde|secondes}}\";'),(_binary 'fr',_binary 'messages:sectioneditnotsupported-text',_binary 's:76:\"La modification d’une section n’est pas prise en charge pour cette page.\";'),(_binary 'fr',_binary 'messages:sectioneditnotsupported-title',_binary 's:43:\"Modification de section non prise en charge\";'),(_binary 'fr',_binary 'messages:selfmove',_binary 's:73:\"Le titre est le même ;\nimpossible de renommer une page sur elle-même.\";'),(_binary 'fr',_binary 'messages:selfredirect',_binary 's:299:\"<strong>Attention :</strong> vous êtes en train de rediriger la page vers elle-même.\nIl se peut que vous ayez spécifié la mauvaise cible pour la redirection, ou que vous modifiez peut-être la mauvaise page.\nSi vous cliquez de nouveau sur « $1 », la redirection sera tout de même créée.\";'),(_binary 'fr',_binary 'messages:semicolon-separator',_binary 's:12:\"&nbsp;;&#32;\";'),(_binary 'fr',_binary 'messages:semiprotectedpagemovewarning',_binary 's:211:\"<strong>Note :</strong> Cette page a été protégée afin que seuls les utilisateurs confirmés automatiquement puissent la renommer. \nLa dernière entrée du journal est affichée ci-dessous pour référence :\";'),(_binary 'fr',_binary 'messages:semiprotectedpagewarning',_binary 's:211:\"<strong>Note :</strong>Cette page a été protégée pour que seuls les contributeurs confirmés automatiquement puissent la modifier. \nLa dernière entrée du journal est affichée ci-dessous pour référence :\";'),(_binary 'fr',_binary 'messages:sep',_binary 's:5:\"sept.\";'),(_binary 'fr',_binary 'messages:september',_binary 's:9:\"septembre\";'),(_binary 'fr',_binary 'messages:september-date',_binary 's:35:\"{{PLURAL:$1|1=1ᵉʳ|$1}} septembre\";'),(_binary 'fr',_binary 'messages:september-gen',_binary 's:9:\"septembre\";'),(_binary 'fr',_binary 'messages:servertime',_binary 's:18:\"Heure du serveur :\";'),(_binary 'fr',_binary 'messages:session_fail_preview',_binary 's:439:\"Désolé, nous ne pouvons enregistrer votre modification à cause d’une perte d’informations concernant votre session.\n\nVous avez peut-être été déconnecté. <strong>Veuillez vérifier que vous êtes toujours connecté et réessayer.</strong>\nSi cela échoue de nouveau, essayez en vous [[Special:UserLogout|déconnectant]], puis en vous reconnectant, et vérifiez que votre navigateur accepte les témoins (\'\'cookies\'\') de ce site.\";'),(_binary 'fr',_binary 'messages:session_fail_preview_html',_binary 's:520:\"Désolé, nous ne pouvons enregistrer votre modification à cause d’une perte d’informations concernant votre session.\n\n<em>Parce que {{SITENAME}} a activé le HTML brut, la prévisualisation est masquée afin de prévenir les attaques par JavaScript.</em>\n\n<strong>Si la tentative de modification est légitime, veuillez réessayer.</strong>\nSi cela échoue de nouveau, [[Special:UserLogout|déconnectez-vous]], puis reconnectez-vous, et vérifiez que votre navigateur accepte les témoins (\'\'cookies\'\') de ce site.\";'),(_binary 'fr',_binary 'messages:sessionfailure',_binary 's:172:\"Votre session de connexion semble avoir des problèmes ;\ncette action a été annulée en prévention d\'un piratage de session.\nVeuillez soumettre le formulaire de nouveau.\";'),(_binary 'fr',_binary 'messages:sessionfailure-title',_binary 's:17:\"Erreur de session\";'),(_binary 'fr',_binary 'messages:sessionmanager-tie',_binary 's:81:\"Impossible de combiner des types multiples de demandes d’authentification : $1.\";'),(_binary 'fr',_binary 'messages:sessionprovider-generic',_binary 's:11:\"sessions $1\";'),(_binary 'fr',_binary 'messages:sessionprovider-mediawiki-session-cookiesessionprovider',_binary 's:47:\"sessions basées sur les témoins (\'\'cookies\'\')\";'),(_binary 'fr',_binary 'messages:sessionprovider-nocookies',_binary 's:131:\"Il est possible que les témoins (\'\'cookies\'\') soient désactivés. Assurez-vous que vous avez activé les témoins et recommencez.\";'),(_binary 'fr',_binary 'messages:shared-repo',_binary 's:19:\"un dépôt partagé\";'),(_binary 'fr',_binary 'messages:shared-repo-from',_binary 's:7:\"de : $1\";'),(_binary 'fr',_binary 'messages:shared-repo-name-wikimediacommons',_binary 's:18:\"Wikimédia Commons\";'),(_binary 'fr',_binary 'messages:shareddescriptionfollows',_binary 's:1:\"-\";'),(_binary 'fr',_binary 'messages:sharedupload',_binary 's:73:\"Ce fichier provient de : $1. Il peut être utilisé par d\'autres projets.\";'),(_binary 'fr',_binary 'messages:sharedupload-desc-create',_binary 's:153:\"Ce fichier provient de : $1. Il peut être utilisé par d\'autres projets.\nVous voulez peut-être modifier la description sur sa [$2 page de description].\";'),(_binary 'fr',_binary 'messages:sharedupload-desc-edit',_binary 's:153:\"Ce fichier provient de : $1. Il peut être utilisé par d\'autres projets.\nVous voulez peut-être modifier la description sur sa [$2 page de description].\";'),(_binary 'fr',_binary 'messages:sharedupload-desc-here',_binary 's:144:\"Ce fichier provient de $1. Il peut être utilisé par d\'autres projets.\nSa description sur sa [$2 page de description] est affichée ci-dessous.\";'),(_binary 'fr',_binary 'messages:sharedupload-desc-there',_binary 's:146:\"Ce fichier provient de : $1. Il peut être utilisé par d\'autres projets.\nVeuillez consulter [$2 sa page de description] pour plus d\'informations.\";'),(_binary 'fr',_binary 'messages:shortpages',_binary 's:13:\"Pages courtes\";'),(_binary 'fr',_binary 'messages:shortpages-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:show',_binary 's:8:\"Afficher\";'),(_binary 'fr',_binary 'messages:show-big-image',_binary 's:19:\"Fichier d’origine\";'),(_binary 'fr',_binary 'messages:show-big-image-other',_binary 's:57:\"{{PLURAL:$2|Autre résolution|Autres résolutions}} : $1.\";'),(_binary 'fr',_binary 'messages:show-big-image-preview',_binary 's:27:\"Taille de cet aperçu : $1.\";'),(_binary 'fr',_binary 'messages:show-big-image-preview-differ',_binary 's:47:\"Taille de cet aperçu $3 de ce fichier $2 : $1.\";'),(_binary 'fr',_binary 'messages:show-big-image-size',_binary 's:15:\"$1 × $2 pixels\";'),(_binary 'fr',_binary 'messages:showdiff',_binary 's:22:\"Voir les modifications\";'),(_binary 'fr',_binary 'messages:showhideselectedlogentries',_binary 's:56:\"Afficher/masquer les entrées de journal sélectionnées\";'),(_binary 'fr',_binary 'messages:showhideselectedversions',_binary 's:45:\"Afficher/masquer les versions sélectionnées\";'),(_binary 'fr',_binary 'messages:showingresults',_binary 's:95:\"Affichage de <strong>$1</strong> résultat{{PLURAL:$1||s}} à partir du n°<strong>$2</strong>.\";'),(_binary 'fr',_binary 'messages:showingresultsinrange',_binary 's:165:\"Afficher ci-dessous jusqu’à {{PLURAL:$1|<strong>1</strong> résultat|<strong>$1</strong> résultats}} dans la série #<strong>$2</strong> à #<strong>$3</strong>.\";'),(_binary 'fr',_binary 'messages:shown-title',_binary 's:46:\"Afficher $1 résultat{{PLURAL:$1||s}} par page\";'),(_binary 'fr',_binary 'messages:showpreview',_binary 's:14:\"Prévisualiser\";'),(_binary 'fr',_binary 'messages:showtoc',_binary 's:8:\"afficher\";'),(_binary 'fr',_binary 'messages:sidebar',_binary 's:168:\"\n* navigation\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help-mediawiki\n* SEARCH\n* TOOLBOX\n* LANGUAGES\";'),(_binary 'fr',_binary 'messages:sig-text',_binary 's:4:\"--$1\";'),(_binary 'fr',_binary 'messages:sig_tip',_binary 's:28:\"Votre signature avec la date\";'),(_binary 'fr',_binary 'messages:signature',_binary 's:58:\"[[{{ns:user}}:$1|$2]] ([[{{ns:user_talk}}:$1|discussion]])\";'),(_binary 'fr',_binary 'messages:signature-anon',_binary 's:36:\"[[{{#special:Contributions}}/$1|$2]]\";'),(_binary 'fr',_binary 'messages:signupend',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:signupend-https',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:signupstart',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:simpleantispam-label',_binary 's:70:\"Vérification anti-pourriel.\nNe <strong>rien</strong> inscrire ici !\";'),(_binary 'fr',_binary 'messages:site-atom-feed',_binary 's:15:\"Flux Atom de $1\";'),(_binary 'fr',_binary 'messages:site-rss-feed',_binary 's:14:\"Flux RSS de $1\";'),(_binary 'fr',_binary 'messages:sitecsspreview',_binary 's:136:\"<strong>Rappelez-vous que vous ne faites que prévisualiser cette feuille de style. \nElle n’a pas encore été enregistrée !</strong>\";'),(_binary 'fr',_binary 'messages:sitecssprotected',_binary 's:102:\"Vous n’avez pas le droit de modifier cette page CSS parce que cela peut affecter tous les visiteurs.\";'),(_binary 'fr',_binary 'messages:sitejsonpreview',_binary 's:147:\"<strong>Souvenez-vous que vous ne faites que regarder un aperçu de cette configuration JSON.\nElle n’a pas encore été enregistrée !</strong>\";'),(_binary 'fr',_binary 'messages:sitejsonprotected',_binary 's:103:\"Vous n’avez pas le droit de modifier cette page JSON parce que cela peut affecter tous les visiteurs.\";'),(_binary 'fr',_binary 'messages:sitejspreview',_binary 's:129:\"<strong>Rappelez-vous que vous ne faites que prévisualiser ce code JavaScript. \nIl n’a pas encore été enregistré !</strong>\";'),(_binary 'fr',_binary 'messages:sitejsprotected',_binary 's:109:\"Vous n’avez pas le droit de modifier cette page JavaScript parce que cela peut affecter tous les visiteurs.\";'),(_binary 'fr',_binary 'messages:sitenotice',_binary 's:1:\"-\";'),(_binary 'fr',_binary 'messages:sitesubtitle',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:sitetitle',_binary 's:12:\"{{SITENAME}}\";'),(_binary 'fr',_binary 'messages:siteuser',_binary 's:75:\"{{GENDER:$2|l\'utilisateur|l\'utilisatrice|l\'utilisateur}} $1 de {{SITENAME}}\";'),(_binary 'fr',_binary 'messages:siteusers',_binary 's:128:\"{{PLURAL:$2|{{GENDER:$1|l’utilisateur|l’utilisatrice}}|{{GENDER:$1|les utilisateurs|les utilisatrices}}}} $1 de {{SITENAME}}\";'),(_binary 'fr',_binary 'messages:size-bytes',_binary 's:29:\"$1 {{PLURAL:$1|octet|octets}}\";'),(_binary 'fr',_binary 'messages:size-exabytes',_binary 's:6:\"$1 Eio\";'),(_binary 'fr',_binary 'messages:size-exapixel',_binary 's:5:\"$1 EP\";'),(_binary 'fr',_binary 'messages:size-gigabytes',_binary 's:11:\"$1&nbsp;Gio\";'),(_binary 'fr',_binary 'messages:size-gigapixel',_binary 's:5:\"$1 GP\";'),(_binary 'fr',_binary 'messages:size-kilobytes',_binary 's:11:\"$1&nbsp;Kio\";'),(_binary 'fr',_binary 'messages:size-kilopixel',_binary 's:5:\"$1 KP\";'),(_binary 'fr',_binary 'messages:size-megabytes',_binary 's:11:\"$1&nbsp;Mio\";'),(_binary 'fr',_binary 'messages:size-megapixel',_binary 's:5:\"$1 MP\";'),(_binary 'fr',_binary 'messages:size-petabytes',_binary 's:11:\"$1&nbsp;Pio\";'),(_binary 'fr',_binary 'messages:size-petapixel',_binary 's:5:\"$1 PP\";'),(_binary 'fr',_binary 'messages:size-pixel',_binary 's:29:\"$1 {{PLURAL:$1|pixel|pixels}}\";'),(_binary 'fr',_binary 'messages:size-terabytes',_binary 's:11:\"$1&nbsp;Tio\";'),(_binary 'fr',_binary 'messages:size-terapixel',_binary 's:5:\"$1 TP\";'),(_binary 'fr',_binary 'messages:size-yottabytes',_binary 's:6:\"$1 Yio\";'),(_binary 'fr',_binary 'messages:size-yottapixel',_binary 's:5:\"$1 YP\";'),(_binary 'fr',_binary 'messages:size-zetabytes',_binary 's:11:\"$1&nbsp;Zio\";'),(_binary 'fr',_binary 'messages:size-zetapixel',_binary 's:5:\"$1 ZP\";'),(_binary 'fr',_binary 'messages:skin-preview',_binary 's:14:\"Prévisualiser\";'),(_binary 'fr',_binary 'messages:skinname-monobook',_binary 's:8:\"Monobook\";'),(_binary 'fr',_binary 'messages:skinname-timeless',_binary 's:8:\"Timeless\";'),(_binary 'fr',_binary 'messages:skinname-vector',_binary 's:6:\"Vector\";'),(_binary 'fr',_binary 'messages:softblockrangesreason',_binary 's:111:\"Les contributions anonymes ne sont pas autorisées à partir de votre adresse IP ($1). Veuillez vous connecter.\";'),(_binary 'fr',_binary 'messages:sorbs',_binary 's:5:\"DNSBL\";'),(_binary 'fr',_binary 'messages:sorbs_create_account_reason',_binary 's:130:\"Votre adresse IP est listée comme mandataire ouvert dans le DNSBL utilisé par {{SITENAME}}.\nVous ne pouvez pas créer un compte.\";'),(_binary 'fr',_binary 'messages:sorbsreason',_binary 's:93:\"Votre adresse IP est listée comme mandataire ouvert dans le DNSBL utilisé par {{SITENAME}}.\";'),(_binary 'fr',_binary 'messages:sort-ascending',_binary 's:13:\"Tri croissant\";'),(_binary 'fr',_binary 'messages:sort-descending',_binary 's:16:\"Tri décroissant\";'),(_binary 'fr',_binary 'messages:sourcefilename',_binary 's:23:\"Nom du fichier source :\";'),(_binary 'fr',_binary 'messages:sourceurl',_binary 's:12:\"URL source :\";'),(_binary 'fr',_binary 'messages:sp-contributions-blocked-notice',_binary 's:131:\"Cet utilisateur est actuellement bloqué. \nLa dernière entrée du journal des blocages est affichée ci-dessous pour référence :\";'),(_binary 'fr',_binary 'messages:sp-contributions-blocked-notice-anon',_binary 's:132:\"Cette adresse IP est actuellement bloquée.\nLa dernière entrée du journal des blocages est affichée ci-dessous pour référence :\";'),(_binary 'fr',_binary 'messages:sp-contributions-blocklog',_binary 's:20:\"journal des blocages\";'),(_binary 'fr',_binary 'messages:sp-contributions-deleted',_binary 's:71:\"contributions de l’{{GENDER:$1|utilisateur|utilisatrice}} supprimées\";'),(_binary 'fr',_binary 'messages:sp-contributions-explain',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:sp-contributions-footer',_binary 's:1:\"-\";'),(_binary 'fr',_binary 'messages:sp-contributions-footer-anon',_binary 's:1:\"-\";'),(_binary 'fr',_binary 'messages:sp-contributions-footer-anon-range',_binary 's:1:\"-\";'),(_binary 'fr',_binary 'messages:sp-contributions-footer-newbies',_binary 's:1:\"-\";'),(_binary 'fr',_binary 'messages:sp-contributions-hideminor',_binary 's:34:\"Masquer les modifications mineures\";'),(_binary 'fr',_binary 'messages:sp-contributions-logs',_binary 's:8:\"journaux\";'),(_binary 'fr',_binary 'messages:sp-contributions-newbies',_binary 's:58:\"Ne montrer que les contributions des nouveaux utilisateurs\";'),(_binary 'fr',_binary 'messages:sp-contributions-newbies-sub',_binary 's:26:\"Parmi les nouveaux comptes\";'),(_binary 'fr',_binary 'messages:sp-contributions-newbies-title',_binary 's:55:\"Contributions d\'utilisateurs parmi les nouveaux comptes\";'),(_binary 'fr',_binary 'messages:sp-contributions-newonly',_binary 's:69:\"Afficher uniquement les modifications qui sont des créations de page\";'),(_binary 'fr',_binary 'messages:sp-contributions-outofrange',_binary 's:121:\"Impossible d’afficher un quelconque résultat. L’intervalle d’adresses IP est plus grand que la limite CIDR de /$1.\";'),(_binary 'fr',_binary 'messages:sp-contributions-search',_binary 's:28:\"Rechercher les contributions\";'),(_binary 'fr',_binary 'messages:sp-contributions-submit',_binary 's:10:\"Rechercher\";'),(_binary 'fr',_binary 'messages:sp-contributions-suppresslog',_binary 's:69:\"contributions de l\'{{GENDER:$1|utilisateur|utilisatrice}} supprimées\";'),(_binary 'fr',_binary 'messages:sp-contributions-talk',_binary 's:8:\"discuter\";'),(_binary 'fr',_binary 'messages:sp-contributions-toponly',_binary 's:69:\"Ne montrer que les contributions qui sont les dernières des articles\";'),(_binary 'fr',_binary 'messages:sp-contributions-uploads',_binary 's:7:\"imports\";'),(_binary 'fr',_binary 'messages:sp-contributions-username',_binary 's:33:\"Adresse IP ou nom d\'utilisateur :\";'),(_binary 'fr',_binary 'messages:sp-contributions-userrights',_binary 's:52:\"gérer les droits d’utilisat{{GENDER:$1|eur|rice}}\";'),(_binary 'fr',_binary 'messages:sp-deletedcontributions-contribs',_binary 's:13:\"contributions\";'),(_binary 'fr',_binary 'messages:sp-newimages-showfrom',_binary 's:52:\"Afficher les nouveaux fichiers à partir du $1 à $2\";'),(_binary 'fr',_binary 'messages:spam_blanking',_binary 's:62:\"Toutes les versions contenant des liens vers $1 sont blanchies\";'),(_binary 'fr',_binary 'messages:spam_deleting',_binary 's:62:\"Toutes les versions contenaient des liens vers $1, suppression\";'),(_binary 'fr',_binary 'messages:spam_reverting',_binary 's:72:\"Rétablissement de la dernière version ne contenant pas de lien vers $1\";'),(_binary 'fr',_binary 'messages:spambot_username',_binary 's:36:\"Nettoyage de pourriels par MediaWiki\";'),(_binary 'fr',_binary 'messages:spamprotectionmatch',_binary 's:77:\"Le texte suivant a déclenché notre filtre de protection anti-pourriels : $1\";'),(_binary 'fr',_binary 'messages:spamprotectiontext',_binary 's:199:\"La page que vous avez voulu sauvegarder a été bloquée par le filtre anti-pourriels. \nCeci est probablement dû à l’introduction d’un lien vers un site externe apparaissant sur la liste noire.\";'),(_binary 'fr',_binary 'messages:spamprotectiontitle',_binary 's:35:\"Filtre de protection anti-pourriels\";'),(_binary 'fr',_binary 'messages:special-characters-group-arabic',_binary 's:5:\"arabe\";'),(_binary 'fr',_binary 'messages:special-characters-group-arabicextended',_binary 's:13:\"arabe étendu\";'),(_binary 'fr',_binary 'messages:special-characters-group-bangla',_binary 's:8:\"bengalî\";'),(_binary 'fr',_binary 'messages:special-characters-group-canadianaboriginal',_binary 's:19:\"Aborigène canadien\";'),(_binary 'fr',_binary 'messages:special-characters-group-cyrillic',_binary 's:10:\"cyrillique\";'),(_binary 'fr',_binary 'messages:special-characters-group-devanagari',_binary 's:11:\"dévanagari\";'),(_binary 'fr',_binary 'messages:special-characters-group-greek',_binary 's:4:\"grec\";'),(_binary 'fr',_binary 'messages:special-characters-group-greekextended',_binary 's:12:\"Grec étendu\";'),(_binary 'fr',_binary 'messages:special-characters-group-gujarati',_binary 's:10:\"gujarâtî\";'),(_binary 'fr',_binary 'messages:special-characters-group-hebrew',_binary 's:7:\"hébreu\";'),(_binary 'fr',_binary 'messages:special-characters-group-ipa',_binary 's:3:\"API\";'),(_binary 'fr',_binary 'messages:special-characters-group-khmer',_binary 's:5:\"khmer\";'),(_binary 'fr',_binary 'messages:special-characters-group-lao',_binary 's:7:\"laotien\";'),(_binary 'fr',_binary 'messages:special-characters-group-latin',_binary 's:5:\"latin\";'),(_binary 'fr',_binary 'messages:special-characters-group-latinextended',_binary 's:13:\"latin étendu\";'),(_binary 'fr',_binary 'messages:special-characters-group-persian',_binary 's:6:\"persan\";'),(_binary 'fr',_binary 'messages:special-characters-group-sinhala',_binary 's:9:\"cingalais\";'),(_binary 'fr',_binary 'messages:special-characters-group-symbols',_binary 's:8:\"symboles\";'),(_binary 'fr',_binary 'messages:special-characters-group-tamil',_binary 's:6:\"tamoul\";'),(_binary 'fr',_binary 'messages:special-characters-group-telugu',_binary 's:9:\"télougou\";'),(_binary 'fr',_binary 'messages:special-characters-group-thai',_binary 's:5:\"thaï\";'),(_binary 'fr',_binary 'messages:special-characters-title-emdash',_binary 's:14:\"tiret cadratin\";'),(_binary 'fr',_binary 'messages:special-characters-title-endash',_binary 's:19:\"tiret demi-cadratin\";'),(_binary 'fr',_binary 'messages:special-characters-title-minus',_binary 's:11:\"signe moins\";'),(_binary 'fr',_binary 'messages:speciallogtitlelabel',_binary 's:48:\"Cible (titre ou {{ns:user}}:nom d\'utilisateur) :\";'),(_binary 'fr',_binary 'messages:specialloguserlabel',_binary 's:8:\"Auteur :\";'),(_binary 'fr',_binary 'messages:specialpage',_binary 's:14:\"Page spéciale\";'),(_binary 'fr',_binary 'messages:specialpage-empty',_binary 's:37:\"Il n\'y a aucun résultat à afficher.\";'),(_binary 'fr',_binary 'messages:specialpage-securitylevel-not-allowed',_binary 's:108:\"Désolé, vous n’êtes pas autorisé à utiliser cette page car votre identité n’a pu être vérifiée.\";'),(_binary 'fr',_binary 'messages:specialpage-securitylevel-not-allowed-title',_binary 's:8:\"Interdit\";'),(_binary 'fr',_binary 'messages:specialpages',_binary 's:16:\"Pages spéciales\";'),(_binary 'fr',_binary 'messages:specialpages-group-changes',_binary 's:35:\"Modifications récentes et journaux\";'),(_binary 'fr',_binary 'messages:specialpages-group-developer',_binary 's:22:\"Outils du développeur\";'),(_binary 'fr',_binary 'messages:specialpages-group-highuse',_binary 's:29:\"Pages d\'utilisation intensive\";'),(_binary 'fr',_binary 'messages:specialpages-group-login',_binary 's:25:\"S\'identifier / s\'inscrire\";'),(_binary 'fr',_binary 'messages:specialpages-group-maintenance',_binary 's:23:\"Rapports de maintenance\";'),(_binary 'fr',_binary 'messages:specialpages-group-media',_binary 's:38:\"Rapports et import de fichiers médias\";'),(_binary 'fr',_binary 'messages:specialpages-group-other',_binary 's:23:\"Autres pages spéciales\";'),(_binary 'fr',_binary 'messages:specialpages-group-pages',_binary 's:15:\"Listes de pages\";'),(_binary 'fr',_binary 'messages:specialpages-group-pagetools',_binary 's:21:\"Outils pour les pages\";'),(_binary 'fr',_binary 'messages:specialpages-group-redirects',_binary 's:28:\"Pages spéciales redirigées\";'),(_binary 'fr',_binary 'messages:specialpages-group-spam',_binary 's:20:\"Outils anti-pourriel\";'),(_binary 'fr',_binary 'messages:specialpages-group-users',_binary 's:33:\"Utilisateurs et droits rattachés\";'),(_binary 'fr',_binary 'messages:specialpages-group-wiki',_binary 's:18:\"Données et outils\";'),(_binary 'fr',_binary 'messages:specialpages-note-cached',_binary 's:1:\"-\";'),(_binary 'fr',_binary 'messages:specialpages-note-restricted',_binary 's:106:\"* Pages spéciales normales.\n* <span class=\"mw-specialpagerestricted\">Pages spéciales restreintes.</span>\";'),(_binary 'fr',_binary 'messages:specialpages-note-top',_binary 's:8:\"Légende\";'),(_binary 'fr',_binary 'messages:specialpages-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:statistics',_binary 's:12:\"Statistiques\";'),(_binary 'fr',_binary 'messages:statistics-articles',_binary 's:16:\"Pages de contenu\";'),(_binary 'fr',_binary 'messages:statistics-articles-desc',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:statistics-edits',_binary 's:60:\"Modifications de pages depuis l\'installation de {{SITENAME}}\";'),(_binary 'fr',_binary 'messages:statistics-edits-average',_binary 's:38:\"Nombre moyen de modifications par page\";'),(_binary 'fr',_binary 'messages:statistics-files',_binary 's:18:\"Fichiers importés\";'),(_binary 'fr',_binary 'messages:statistics-footer',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:statistics-header-edits',_binary 's:30:\"Statistiques des modifications\";'),(_binary 'fr',_binary 'messages:statistics-header-hooks',_binary 's:19:\"Autres statistiques\";'),(_binary 'fr',_binary 'messages:statistics-header-pages',_binary 's:22:\"Statistiques des pages\";'),(_binary 'fr',_binary 'messages:statistics-header-users',_binary 's:29:\"Statistiques des utilisateurs\";'),(_binary 'fr',_binary 'messages:statistics-pages',_binary 's:5:\"Pages\";'),(_binary 'fr',_binary 'messages:statistics-pages-desc',_binary 's:83:\"Toutes les pages du wiki, y compris les pages de discussion, les redirections, etc.\";'),(_binary 'fr',_binary 'messages:statistics-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:statistics-users',_binary 's:21:\"Utilisateurs inscrits\";'),(_binary 'fr',_binary 'messages:statistics-users-active',_binary 's:19:\"Utilisateurs actifs\";'),(_binary 'fr',_binary 'messages:statistics-users-active-desc',_binary 's:102:\"Utilisateurs ayant fait au moins une action {{PLURAL:$1|il y a un jour|pendant les $1 derniers jours}}\";'),(_binary 'fr',_binary 'messages:storedversion',_binary 's:23:\"La version enregistrée\";'),(_binary 'fr',_binary 'messages:stub-threshold',_binary 's:53:\"Seuil pour le formatage des liens d’ébauche ($1) :\";'),(_binary 'fr',_binary 'messages:stub-threshold-disabled',_binary 's:11:\"Désactivé\";'),(_binary 'fr',_binary 'messages:stub-threshold-sample-link',_binary 's:7:\"exemple\";'),(_binary 'fr',_binary 'messages:subcategories',_binary 's:16:\"Sous-catégories\";'),(_binary 'fr',_binary 'messages:subject',_binary 's:7:\"Sujet :\";'),(_binary 'fr',_binary 'messages:subject-preview',_binary 's:18:\"Aperçu du sujet :\";'),(_binary 'fr',_binary 'messages:summary',_binary 's:10:\"Résumé :\";'),(_binary 'fr',_binary 'messages:summary-preview',_binary 's:37:\"Aperçu du résumé de modification :\";'),(_binary 'fr',_binary 'messages:sun',_binary 's:4:\"Dim.\";'),(_binary 'fr',_binary 'messages:sunday',_binary 's:8:\"dimanche\";'),(_binary 'fr',_binary 'messages:sunday-at',_binary 's:14:\"Dimanche à $1\";'),(_binary 'fr',_binary 'messages:suppress',_binary 's:9:\"Supprimer\";'),(_binary 'fr',_binary 'messages:suppressedarticle',_binary 's:19:\"suppressed \"[[$1]]\"\";'),(_binary 'fr',_binary 'messages:suppressionlog',_binary 's:21:\"Journal des masquages\";'),(_binary 'fr',_binary 'messages:suppressionlogtext',_binary 's:225:\"Voici la liste des masquages et des blocages qui portent sur du contenu caché aux administrateurs.\nVoir la [[Special:BlockList|liste des blocages]] pour la liste des bannissements et des blocages actuellement opérationnels.\";'),(_binary 'fr',_binary 'messages:suspicious-userlogout',_binary 's:160:\"Votre demande de déconnexion a été refusée car elle paraît avoir été envoyée par un navigateur défectueux ou depuis le cache d’un service mandataire.\";'),(_binary 'fr',_binary 'messages:svg-long-desc',_binary 's:56:\"Fichier SVG, résolution de $1 × $2 pixels, taille : $3\";'),(_binary 'fr',_binary 'messages:svg-long-desc-animated',_binary 's:71:\"Fichier SVG animé, résolution $1 × $2 pixels, taille du fichier : $3\";'),(_binary 'fr',_binary 'messages:svg-long-error',_binary 's:27:\"Fichier SVG non valide : $1\";'),(_binary 'fr',_binary 'messages:systemblockedtext',_binary 's:358:\"Votre nom d\'utilisateur ou votre adresse IP ont été bloqués automatiquement par MediaWiki.\nLa raison donnée est la suivante:\n\n: <em>$2</em>.\n\n* Le début du blocage: $8\n* Expiration du délai de blocage: $6\n* Elément concerné: $7\n\nVotre adresse IP actuelle est $3.\nVeuillez inclure tous les détails ci-dessus dans chacune des requêtes que vous ferez.\";'),(_binary 'fr',_binary 'messages:table_pager_empty',_binary 's:15:\"Aucun résultat\";'),(_binary 'fr',_binary 'messages:table_pager_first',_binary 's:14:\"Première page\";'),(_binary 'fr',_binary 'messages:table_pager_last',_binary 's:14:\"Dernière page\";'),(_binary 'fr',_binary 'messages:table_pager_limit',_binary 's:31:\"Afficher $1 éléments par page\";'),(_binary 'fr',_binary 'messages:table_pager_limit_label',_binary 's:21:\"Résultats par page :\";'),(_binary 'fr',_binary 'messages:table_pager_limit_submit',_binary 's:7:\"Envoyer\";'),(_binary 'fr',_binary 'messages:table_pager_next',_binary 's:13:\"Page suivante\";'),(_binary 'fr',_binary 'messages:table_pager_prev',_binary 's:17:\"Page précédente\";'),(_binary 'fr',_binary 'messages:tag-filter',_binary 's:38:\"Filtrer les [[Special:Tags|balises]] :\";'),(_binary 'fr',_binary 'messages:tag-filter-submit',_binary 's:7:\"Filtrer\";'),(_binary 'fr',_binary 'messages:tag-list-wrapper',_binary 's:52:\"([[Special:Tags|{{PLURAL:$1|Balise|Balises}}]] : $2)\";'),(_binary 'fr',_binary 'messages:tag-mw-blank',_binary 's:11:\"Blanchiment\";'),(_binary 'fr',_binary 'messages:tag-mw-blank-description',_binary 's:49:\"Modifications qui suppriment le contenu des pages\";'),(_binary 'fr',_binary 'messages:tag-mw-changed-redirect-target',_binary 's:33:\"Cible de la redirection modifiée\";'),(_binary 'fr',_binary 'messages:tag-mw-changed-redirect-target-description',_binary 's:55:\"Modifications qui changent la cible d’une redirection\";'),(_binary 'fr',_binary 'messages:tag-mw-contentmodelchange',_binary 's:34:\"modification du modèle de contenu\";'),(_binary 'fr',_binary 'messages:tag-mw-contentmodelchange-description',_binary 's:135:\"Modifications qui [https://www.mediawiki.org/wiki/Special:MyLanguage/Help:ChangeContentModel changent le modèle de contenu] d\'une page\";'),(_binary 'fr',_binary 'messages:tag-mw-new-redirect',_binary 's:20:\"Nouvelle redirection\";'),(_binary 'fr',_binary 'messages:tag-mw-new-redirect-description',_binary 's:90:\"Modifications qui créent une nouvelle redirection ou transforment une page en redirection\";'),(_binary 'fr',_binary 'messages:tag-mw-removed-redirect',_binary 's:22:\"Redirection supprimée\";'),(_binary 'fr',_binary 'messages:tag-mw-removed-redirect-description',_binary 's:84:\"Modifications qui remplacent une redirection existante par une page sans redirection\";'),(_binary 'fr',_binary 'messages:tag-mw-replace',_binary 's:9:\"Remplacé\";'),(_binary 'fr',_binary 'messages:tag-mw-replace-description',_binary 's:60:\"Modifications qui enlèvent plus de 90% du contenu des pages\";'),(_binary 'fr',_binary 'messages:tag-mw-rollback',_binary 's:11:\"Révocation\";'),(_binary 'fr',_binary 'messages:tag-mw-rollback-description',_binary 's:106:\"Modifications qui annulent des modifications existantes en utilisant le lien de révocation (\'\'rollback\'\')\";'),(_binary 'fr',_binary 'messages:tag-mw-undo',_binary 's:7:\"Annuler\";'),(_binary 'fr',_binary 'messages:tag-mw-undo-description',_binary 's:73:\"Modifications qui annulent les précédentes en utilisant le lien annuler\";'),(_binary 'fr',_binary 'messages:tagline',_binary 's:15:\"De {{SITENAME}}\";'),(_binary 'fr',_binary 'messages:tags',_binary 's:33:\"Balises des modifications valides\";'),(_binary 'fr',_binary 'messages:tags-actions-header',_binary 's:7:\"Actions\";'),(_binary 'fr',_binary 'messages:tags-activate',_binary 's:7:\"activer\";'),(_binary 'fr',_binary 'messages:tags-activate-not-allowed',_binary 's:51:\"Il n\'est pas possible d\'activer la balise « $1 ».\";'),(_binary 'fr',_binary 'messages:tags-activate-not-found',_binary 's:32:\"La balise « $1 » n\'existe pas.\";'),(_binary 'fr',_binary 'messages:tags-activate-question',_binary 's:53:\"Vous êtes sur le point d\'activer la balise « $1 ».\";'),(_binary 'fr',_binary 'messages:tags-activate-reason',_binary 's:7:\"Motif :\";'),(_binary 'fr',_binary 'messages:tags-activate-submit',_binary 's:7:\"Activer\";'),(_binary 'fr',_binary 'messages:tags-activate-title',_binary 's:17:\"Activer la balise\";'),(_binary 'fr',_binary 'messages:tags-active-header',_binary 's:9:\"Actif ?\";'),(_binary 'fr',_binary 'messages:tags-active-no',_binary 's:3:\"Non\";'),(_binary 'fr',_binary 'messages:tags-active-yes',_binary 's:3:\"Oui\";'),(_binary 'fr',_binary 'messages:tags-apply-blocked',_binary 's:122:\"Vous ne pouvez pas appliquer les modifications de balises et vos modifications lorsque vous êtes bloqué{{GENDER:$1||e}}.\";'),(_binary 'fr',_binary 'messages:tags-apply-no-permission',_binary 's:104:\"Vous n’avez pas le droit d’appliquer des balises de changement en même temps que vos modifications.\";'),(_binary 'fr',_binary 'messages:tags-apply-not-allowed-multi',_binary 's:160:\"{{PLURAL:$2|La balise suivante n’est pas autorisée à être appliquée|Les balises suivantes ne sont pas autorisées à être appliquées}} manuellement : $1\";'),(_binary 'fr',_binary 'messages:tags-apply-not-allowed-one',_binary 's:79:\"La balise « $1 » n’est pas autorisée à être appliquée manuellement.\";'),(_binary 'fr',_binary 'messages:tags-create-already-exists',_binary 's:33:\"La balise « $1 » existe déjà.\";'),(_binary 'fr',_binary 'messages:tags-create-explanation',_binary 's:99:\"Par défaut, les nouvelles balises créées seront disponibles pour les utilisateurs et les robots.\";'),(_binary 'fr',_binary 'messages:tags-create-heading',_binary 's:26:\"Créer une nouvelle balise\";'),(_binary 'fr',_binary 'messages:tags-create-invalid-chars',_binary 's:151:\"Les noms de balise ne doivent pas contenir de virgules (<code>,</code>), de barres verticales (<code>|</code>), ni de barres obliques (<code>/</code>).\";'),(_binary 'fr',_binary 'messages:tags-create-invalid-title-chars',_binary 's:119:\"Les noms de balise ne doivent pas contenir de caractères qui ne peuvent pas être utilisés dans les titres des pages.\";'),(_binary 'fr',_binary 'messages:tags-create-no-name',_binary 's:39:\"Vous devez spécifier un nom de balise.\";'),(_binary 'fr',_binary 'messages:tags-create-reason',_binary 's:8:\"Raison :\";'),(_binary 'fr',_binary 'messages:tags-create-submit',_binary 's:6:\"Créer\";'),(_binary 'fr',_binary 'messages:tags-create-tag-name',_binary 's:18:\"Nom de la balise :\";'),(_binary 'fr',_binary 'messages:tags-create-warnings-above',_binary 's:145:\"{{PLURAL:$2|L\'avertissement suivant|Les avertissements suivants}} ont été rencontrés lors de la tentative de création de la balise « $1 » :\";'),(_binary 'fr',_binary 'messages:tags-create-warnings-below',_binary 's:48:\"Voulez-vous continuer la création de la balise?\";'),(_binary 'fr',_binary 'messages:tags-deactivate',_binary 's:11:\"désactiver\";'),(_binary 'fr',_binary 'messages:tags-deactivate-not-allowed',_binary 's:56:\"Il n\'est pas possible de désactiver la balise « $1 ».\";'),(_binary 'fr',_binary 'messages:tags-deactivate-question',_binary 's:58:\"Vous êtes sur le point de désactiver la balise « $1 ».\";'),(_binary 'fr',_binary 'messages:tags-deactivate-reason',_binary 's:7:\"Motif :\";'),(_binary 'fr',_binary 'messages:tags-deactivate-submit',_binary 's:11:\"Désactiver\";'),(_binary 'fr',_binary 'messages:tags-deactivate-title',_binary 's:21:\"Désactiver la balise\";'),(_binary 'fr',_binary 'messages:tags-delete',_binary 's:9:\"supprimer\";'),(_binary 'fr',_binary 'messages:tags-delete-explanation-active',_binary 's:212:\"<strong>La balise « $1 » est toujours active, et continuera à être appliquée dans le futur. </strong> Pour arrêter cela, allez à l\'endroit (ou aux endroits) où la balise est appliquée, et désactivez la.\";'),(_binary 'fr',_binary 'messages:tags-delete-explanation-in-use',_binary 's:177:\"Elle sera supprimée de {{PLURAL:$2|$2 révision ou entrée de journal à laquelle|toutes les $2 révisions ou entrées de journal auxquelles}} elle est actuellement appliquée.\";'),(_binary 'fr',_binary 'messages:tags-delete-explanation-initial',_binary 's:79:\"Vous êtes sur le point de supprimer la balise « $1 » de la base de données.\";'),(_binary 'fr',_binary 'messages:tags-delete-explanation-warning',_binary 's:214:\"Cette action est <strong>irréversible</strong> et <strong>ne peut pas être annulée</strong>, même pas par les administrateurs de base de données. Soyez certain que c\'est cette balise que vous voulez supprimer.\";'),(_binary 'fr',_binary 'messages:tags-delete-no-permission',_binary 's:66:\"Vous n’avez pas le droit de supprimer des balises de changement.\";'),(_binary 'fr',_binary 'messages:tags-delete-not-allowed',_binary 's:130:\"Les balises définies par une extension ne peuvent pas être supprimées, à moins que l\'extension ne le permette spécifiquement.\";'),(_binary 'fr',_binary 'messages:tags-delete-not-found',_binary 's:34:\"La balise « $1 » n’existe pas.\";'),(_binary 'fr',_binary 'messages:tags-delete-reason',_binary 's:7:\"Motif :\";'),(_binary 'fr',_binary 'messages:tags-delete-submit',_binary 's:48:\"Supprimer cette balise de manière irréversible\";'),(_binary 'fr',_binary 'messages:tags-delete-title',_binary 's:19:\"Supprimer la balise\";'),(_binary 'fr',_binary 'messages:tags-delete-too-many-uses',_binary 's:137:\"La balise « $1 » est appliquée à plus de $2 {{PLURAL:$2|révision|révisions}}, ce qui signifie qu\'elle ne peut pas être supprimée.\";'),(_binary 'fr',_binary 'messages:tags-delete-warnings-after-delete',_binary 's:152:\"La balise « $1 » a été supprimée, mais {{PLURAL:$2|l’avertissement suivant a|les avertissements suivants ont}} été rencontré{{PLURAL:$2||s}} :\";'),(_binary 'fr',_binary 'messages:tags-description-header',_binary 's:34:\"Description complète de la balise\";'),(_binary 'fr',_binary 'messages:tags-display-header',_binary 's:42:\"Apparence dans les listes de modifications\";'),(_binary 'fr',_binary 'messages:tags-edit',_binary 's:8:\"modifier\";'),(_binary 'fr',_binary 'messages:tags-edit-add',_binary 's:21:\"Ajouter ces balises :\";'),(_binary 'fr',_binary 'messages:tags-edit-chosen-no-results',_binary 's:37:\"Aucune balise correspondante trouvée\";'),(_binary 'fr',_binary 'messages:tags-edit-chosen-placeholder',_binary 's:31:\"Sélectionner certaines balises\";'),(_binary 'fr',_binary 'messages:tags-edit-existing-tags',_binary 's:20:\"Balises existantes :\";'),(_binary 'fr',_binary 'messages:tags-edit-existing-tags-none',_binary 's:14:\"<em>Aucun</em>\";'),(_binary 'fr',_binary 'messages:tags-edit-failure',_binary 's:55:\"Les modifications n’ont pas pu être appliquées :\n$1\";'),(_binary 'fr',_binary 'messages:tags-edit-logentry-explanation',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:tags-edit-logentry-legend',_binary 's:106:\"Ajouter ou enlever les balises de {{PLURAL:$1|cette entrée de journal|toutes les $1 entrées de journal}}\";'),(_binary 'fr',_binary 'messages:tags-edit-logentry-selected',_binary 's:91:\"{{PLURAL:$1|Événement de journal sélectionné|Événements de journal sélectionnés}} :\";'),(_binary 'fr',_binary 'messages:tags-edit-logentry-submit',_binary 's:92:\"Appliquer les modifications à {{PLURAL:$1|cette entrée de journal|$1 entrées de journal}}\";'),(_binary 'fr',_binary 'messages:tags-edit-manage-link',_binary 's:18:\"Gérer les balises\";'),(_binary 'fr',_binary 'messages:tags-edit-new-tags',_binary 's:19:\"Nouvelles balises :\";'),(_binary 'fr',_binary 'messages:tags-edit-none-selected',_binary 's:68:\"Veuillez sélectionner au moins une balise à ajouter ou à enlever.\";'),(_binary 'fr',_binary 'messages:tags-edit-nooldid-text',_binary 's:133:\"Vous n’avez soit pas spécifié de version cible sur laquelle exécuter cette fonction, soit la version spécifiée n’existe pas.\";'),(_binary 'fr',_binary 'messages:tags-edit-nooldid-title',_binary 's:24:\"Version cible non valide\";'),(_binary 'fr',_binary 'messages:tags-edit-reason',_binary 's:7:\"Motif :\";'),(_binary 'fr',_binary 'messages:tags-edit-remove',_binary 's:21:\"Enlever ces balises :\";'),(_binary 'fr',_binary 'messages:tags-edit-remove-all-tags',_binary 's:30:\"(supprimer toutes les balises)\";'),(_binary 'fr',_binary 'messages:tags-edit-revision-explanation',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:tags-edit-revision-legend',_binary 's:88:\"Ajouter ou enlever des balises de {{PLURAL:$1|cette révision|toutes les $1 révisions}}\";'),(_binary 'fr',_binary 'messages:tags-edit-revision-selected',_binary 's:77:\"{{PLURAL:$1|Révision sélectionnée|Révisions sélectionnées}} de [[:$2]]:\";'),(_binary 'fr',_binary 'messages:tags-edit-revision-submit',_binary 's:74:\"Appliquer les modifications à {{PLURAL:$1|cette révision|$1 révisions}}\";'),(_binary 'fr',_binary 'messages:tags-edit-success',_binary 's:40:\"Les modifications ont été appliquées.\";'),(_binary 'fr',_binary 'messages:tags-edit-title',_binary 's:20:\"Modifier les balises\";'),(_binary 'fr',_binary 'messages:tags-hitcount',_binary 's:31:\"$1 modification{{PLURAL:$1||s}}\";'),(_binary 'fr',_binary 'messages:tags-hitcount-header',_binary 's:23:\"Modifications balisées\";'),(_binary 'fr',_binary 'messages:tags-intro',_binary 's:130:\"Cette page liste les balises que le logiciel peut utiliser pour marquer une modification et la signification de chacune d’elles.\";'),(_binary 'fr',_binary 'messages:tags-manage-blocked',_binary 's:116:\"Vous ne pouvez pas accéder à l’interface de modification des balises lorsque vous êtes bloqué{{GENDER:$1||e}}.\";'),(_binary 'fr',_binary 'messages:tags-manage-no-permission',_binary 's:69:\"Vous n\'avez pas la permission de gérer les modifications de balises.\";'),(_binary 'fr',_binary 'messages:tags-source-extension',_binary 's:23:\"Défini par le logiciel\";'),(_binary 'fr',_binary 'messages:tags-source-header',_binary 's:6:\"Source\";'),(_binary 'fr',_binary 'messages:tags-source-manual',_binary 's:58:\"Appliquée manuellement par les utilisateurs et les robots\";'),(_binary 'fr',_binary 'messages:tags-source-none',_binary 's:8:\"Désuete\";'),(_binary 'fr',_binary 'messages:tags-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:tags-tag',_binary 's:16:\"Nom de la balise\";'),(_binary 'fr',_binary 'messages:tags-title',_binary 's:7:\"Balises\";'),(_binary 'fr',_binary 'messages:tags-update-add-not-allowed-multi',_binary 's:130:\"{{PLURAL:$2|La balise suivante ne peut pas être ajoutée|Les balises suivantes ne peuvent pas être ajoutées}} manuellement : $1\";'),(_binary 'fr',_binary 'messages:tags-update-add-not-allowed-one',_binary 's:63:\"La balise « $1 » ne peut pas être ajoutée manuellement.\";'),(_binary 'fr',_binary 'messages:tags-update-blocked',_binary 's:112:\"Vous ne pouvez pas ajouter ou supprimer des balises de modifications lorsque vous êtes bloqué{{GENDER:$1||e}}.\";'),(_binary 'fr',_binary 'messages:tags-update-no-permission',_binary 's:140:\"Vous n’avez pas le droit d’ajouter ou de supprimer \nles balises de modification des révisions individuelles ou des entrées de journal.\";'),(_binary 'fr',_binary 'messages:tags-update-remove-not-allowed-multi',_binary 's:130:\"{{PLURAL:$2|La balise suivante ne peut pas être enlevée|Les balises suivantes ne peuvent pas être enlevées}} manuellement : $1\";'),(_binary 'fr',_binary 'messages:tags-update-remove-not-allowed-one',_binary 's:50:\"La balise « $1 » ne peut pas être enlevée.\";'),(_binary 'fr',_binary 'messages:talk',_binary 's:10:\"Discussion\";'),(_binary 'fr',_binary 'messages:talkpageheader',_binary 's:1:\"-\";'),(_binary 'fr',_binary 'messages:talkpagelinktext',_binary 's:10:\"discussion\";'),(_binary 'fr',_binary 'messages:talkpagetext',_binary 's:31:\"<!-- MediaWiki:talkpagetext -->\";'),(_binary 'fr',_binary 'messages:template-loop-category',_binary 's:33:\"Pages avec des boucles de modèle\";'),(_binary 'fr',_binary 'messages:template-loop-category-desc',_binary 's:105:\"La page contient une boucle dans le modèle, c.à.d. un modèle qui s’appelle lui-même récursivement.\";'),(_binary 'fr',_binary 'messages:template-loop-warning',_binary 's:127:\"<strong>Avertissement :</strong> Cette page appelle [[:$1]] ce qui provoque une boucle de modèles (un appel récursif infini).\";'),(_binary 'fr',_binary 'messages:template-protected',_binary 's:11:\"(protégé)\";'),(_binary 'fr',_binary 'messages:template-semiprotected',_binary 's:16:\"(semi-protégé)\";'),(_binary 'fr',_binary 'messages:templatepage',_binary 's:23:\"Voir la page du modèle\";'),(_binary 'fr',_binary 'messages:templatesused',_binary 's:66:\"{{PLURAL:$1|Modèle utilisé|Modèles utilisés}} par cette page :\";'),(_binary 'fr',_binary 'messages:templatesusedpreview',_binary 's:80:\"{{PLURAL:$1|Modèle utilisé|Modèles utilisés}} dans cette prévisualisation :\";'),(_binary 'fr',_binary 'messages:templatesusedsection',_binary 's:70:\"{{PLURAL:$1|Modèle utilisé|Modèles utilisés}} dans cette section :\";'),(_binary 'fr',_binary 'messages:textmatches',_binary 's:39:\"Correspondances dans le texte des pages\";'),(_binary 'fr',_binary 'messages:thisisdeleted',_binary 's:40:\"Désirez-vous afficher ou restaurer $1 ?\";'),(_binary 'fr',_binary 'messages:throttled-mailpassword',_binary 's:293:\"Un courriel de réinitialisation de votre mot de passe a déjà été envoyé durant {{PLURAL:$1|la dernière heure|les $1 dernières heures}}. \nAfin d’éviter les abus, un seul courriel de réinitialisation de votre mot de passe sera envoyé par {{PLURAL:$1|heure|intervalle de $1 heures}}.\";'),(_binary 'fr',_binary 'messages:thu',_binary 's:4:\"Jeu.\";'),(_binary 'fr',_binary 'messages:thumbnail-dest-create',_binary 's:55:\"Impossible d\'enregistrer la vignette sur la destination\";'),(_binary 'fr',_binary 'messages:thumbnail-more',_binary 's:8:\"Agrandir\";'),(_binary 'fr',_binary 'messages:thumbnail-temp-create',_binary 's:54:\"Impossible de créer le fichier de vignette temporaire\";'),(_binary 'fr',_binary 'messages:thumbnail_dest_directory',_binary 's:50:\"Impossible de créer le répertoire de destination\";'),(_binary 'fr',_binary 'messages:thumbnail_error',_binary 's:48:\"Erreur lors de la création de la miniature : $1\";'),(_binary 'fr',_binary 'messages:thumbnail_error_remote',_binary 's:27:\"Message d\'erreur de $1 :\n$2\";'),(_binary 'fr',_binary 'messages:thumbnail_gd-library',_binary 's:74:\"Configuration incomplète de la bibliothèque GD : fonction $1 introuvable\";'),(_binary 'fr',_binary 'messages:thumbnail_image-failure-limit',_binary 's:131:\"Il y a eu récemment trop de tentatives échouées ($1 ou plus) pour restituer cette vignette. Veuillez réessayer ultérieurement.\";'),(_binary 'fr',_binary 'messages:thumbnail_image-missing',_binary 's:39:\"Le fichier suivant est introuvable : $1\";'),(_binary 'fr',_binary 'messages:thumbnail_image-size-zero',_binary 's:49:\"La taille du fichier image semble être à zéro.\";'),(_binary 'fr',_binary 'messages:thumbnail_image-type',_binary 's:33:\"Type d’image non pris en charge\";'),(_binary 'fr',_binary 'messages:thumbnail_invalid_params',_binary 's:38:\"Paramètres de la miniature incorrects\";'),(_binary 'fr',_binary 'messages:thumbnail_toobigimagearea',_binary 's:46:\"Fichier avec des dimensions supérieures à $1\";'),(_binary 'fr',_binary 'messages:thumbsize',_binary 's:24:\"Taille de la miniature :\";'),(_binary 'fr',_binary 'messages:thursday',_binary 's:5:\"jeudi\";'),(_binary 'fr',_binary 'messages:thursday-at',_binary 's:11:\"Jeudi à $1\";'),(_binary 'fr',_binary 'messages:timeless-anonymous',_binary 's:7:\"Anonyme\";'),(_binary 'fr',_binary 'messages:timeless-desc',_binary 's:125:\"Un habillage intemporel conçu d’après le prototype Winter par Brandon Harris, et divers styles de la Fondation Wikimédia\";'),(_binary 'fr',_binary 'messages:timeless-languages',_binary 's:7:\"Langues\";'),(_binary 'fr',_binary 'messages:timeless-loggedin',_binary 's:12:\"Votre compte\";'),(_binary 'fr',_binary 'messages:timeless-loggedinas',_binary 's:57:\"Connecté{{GENDER:$1||e}} en tant que <strong>$1</strong>\";'),(_binary 'fr',_binary 'messages:timeless-more',_binary 's:4:\"Plus\";'),(_binary 'fr',_binary 'messages:timeless-namespaces',_binary 's:15:\"Espaces de noms\";'),(_binary 'fr',_binary 'messages:timeless-notloggedin',_binary 's:16:\"Non connecté(e)\";'),(_binary 'fr',_binary 'messages:timeless-pageactions',_binary 's:14:\"Outils de page\";'),(_binary 'fr',_binary 'messages:timeless-pagelog',_binary 's:16:\"Journaux de page\";'),(_binary 'fr',_binary 'messages:timeless-pagemisc',_binary 's:4:\"Plus\";'),(_binary 'fr',_binary 'messages:timeless-pagetools',_binary 's:15:\"Actions de page\";'),(_binary 'fr',_binary 'messages:timeless-sitetitle',_binary 's:23:\"{{MediaWiki:Sitetitle}}\";'),(_binary 'fr',_binary 'messages:timeless-sitetools',_binary 's:11:\"Outils wiki\";'),(_binary 'fr',_binary 'messages:timeless-talkpage',_binary 's:58:\"Discussion avec l’{{GENDER:$1|utilisateur|utilisatrice}}\";'),(_binary 'fr',_binary 'messages:timeless-userpage',_binary 's:50:\"Page de l’{{GENDER:$1|utilisateur|utilisatrice}}\";'),(_binary 'fr',_binary 'messages:timeless-userpagetools',_binary 's:29:\"Outils de la page utilisateur\";'),(_binary 'fr',_binary 'messages:timeless.css',_binary 's:60:\"/* CSS placed here will affect users of the Timeless skin */\";'),(_binary 'fr',_binary 'messages:timeless.js',_binary 's:86:\"/* Tout JavaScript ici sera chargé pour les utilisateurs de l’habillage Timeless */\";'),(_binary 'fr',_binary 'messages:timezone-local',_binary 's:5:\"Local\";'),(_binary 'fr',_binary 'messages:timezone-utc',_binary 's:3:\"UTC\";'),(_binary 'fr',_binary 'messages:timezonelegend',_binary 's:16:\"Fuseau horaire :\";'),(_binary 'fr',_binary 'messages:timezoneregion-africa',_binary 's:7:\"Afrique\";'),(_binary 'fr',_binary 'messages:timezoneregion-america',_binary 's:9:\"Amérique\";'),(_binary 'fr',_binary 'messages:timezoneregion-antarctica',_binary 's:11:\"Antarctique\";'),(_binary 'fr',_binary 'messages:timezoneregion-arctic',_binary 's:8:\"Arctique\";'),(_binary 'fr',_binary 'messages:timezoneregion-asia',_binary 's:4:\"Asie\";'),(_binary 'fr',_binary 'messages:timezoneregion-atlantic',_binary 's:17:\"Océan atlantique\";'),(_binary 'fr',_binary 'messages:timezoneregion-australia',_binary 's:9:\"Australie\";'),(_binary 'fr',_binary 'messages:timezoneregion-europe',_binary 's:6:\"Europe\";'),(_binary 'fr',_binary 'messages:timezoneregion-indian',_binary 's:13:\"Océan indien\";'),(_binary 'fr',_binary 'messages:timezoneregion-pacific',_binary 's:16:\"Océan pacifique\";'),(_binary 'fr',_binary 'messages:timezoneuseoffset',_binary 's:31:\"Autre (spécifier le décalage)\";'),(_binary 'fr',_binary 'messages:timezoneuseserverdefault',_binary 's:43:\"Utiliser la valeur par défaut du wiki ($1)\";'),(_binary 'fr',_binary 'messages:title-invalid-characters',_binary 's:78:\"Le titre de la page demandée contient des caractères non valides : « $1 ».\";'),(_binary 'fr',_binary 'messages:title-invalid-empty',_binary 's:90:\"Le titre de la page demandée est vide ou contient seulement le nom d’un espace de noms.\";'),(_binary 'fr',_binary 'messages:title-invalid-interwiki',_binary 's:83:\"La page cible contient un lien interwiki ne pouvant être utilisé dans les titres.\";'),(_binary 'fr',_binary 'messages:title-invalid-leading-colon',_binary 's:73:\"Le titre de la page demandée contient un deux-points invalide au début.\";'),(_binary 'fr',_binary 'messages:title-invalid-magic-tilde',_binary 's:105:\"Le titre de la page demandée contient une séquence de tilde magiques non valide (<nowiki>~~~</nowiki>).\";'),(_binary 'fr',_binary 'messages:title-invalid-relative',_binary 's:199:\"Le titre contient un chemin relatif. Les titres référençant des pages relatives (./, ../) sont non valides car il seront souvent inaccessibles lorsque utilisés par le navigateur de l\'utilisateur.\";'),(_binary 'fr',_binary 'messages:title-invalid-talk-namespace',_binary 's:97:\"Le titre de la page demandée fait référence à une page de discussion qui peut ne pas exister.\";'),(_binary 'fr',_binary 'messages:title-invalid-too-long',_binary 's:124:\"La titre de la page demandée est trop long. Il ne doit pas dépasser $1 {{PLURAL:$1|octet|octets}} dans l’encodage UTF-8.\";'),(_binary 'fr',_binary 'messages:title-invalid-utf8',_binary 's:68:\"Le titre de la page demandée contient une séquence UTF-8 invalide.\";'),(_binary 'fr',_binary 'messages:titlematches',_binary 's:41:\"Correspondances dans les titres des pages\";'),(_binary 'fr',_binary 'messages:titleprotected',_binary 's:102:\"Ce titre a été protégé contre toute création par [[User:$1|$1]].\nLe motif fourni est <em>$2</em>.\";'),(_binary 'fr',_binary 'messages:titleprotectedwarning',_binary 's:245:\"<strong>ATTENTION : Cette page a été protégée de telle manière que des [[Special:ListGroupRights|droits spécifiques]] sont requis pour pouvoir la créer.</strong> \nLa dernière entrée du journal est affichée ci-dessous pour référence :\";'),(_binary 'fr',_binary 'messages:tmp-create-error',_binary 's:43:\"Impossible de créer le fichier temporaire.\";'),(_binary 'fr',_binary 'messages:tmp-write-error',_binary 's:41:\"Erreur d\'écriture du fichier temporaire.\";'),(_binary 'fr',_binary 'messages:toc',_binary 's:8:\"Sommaire\";'),(_binary 'fr',_binary 'messages:today-at',_binary 's:2:\"$1\";'),(_binary 'fr',_binary 'messages:tog-ccmeonemails',_binary 's:74:\"M’envoyer une copie des courriels que j’envoie aux autres utilisateurs\";'),(_binary 'fr',_binary 'messages:tog-diffonly',_binary 's:51:\"Ne pas afficher le contenu des pages sous les diffs\";'),(_binary 'fr',_binary 'messages:tog-editondblclick',_binary 's:38:\"Modifier les pages avec un double-clic\";'),(_binary 'fr',_binary 'messages:tog-editsectiononrightclick',_binary 's:80:\"Activer la modification des sections par un clic droit sur les titres de section\";'),(_binary 'fr',_binary 'messages:tog-enotifminoredits',_binary 's:93:\"M’avertir par courriel également lors des modifications mineures des pages ou des fichiers\";'),(_binary 'fr',_binary 'messages:tog-enotifrevealaddr',_binary 's:69:\"Afficher mon adresse électronique dans les courriels de notification\";'),(_binary 'fr',_binary 'messages:tog-enotifusertalkpages',_binary 's:68:\"M’avertir par courriel lorsque ma page de discussion est modifiée\";'),(_binary 'fr',_binary 'messages:tog-enotifwatchlistpages',_binary 's:90:\"M’avertir par courriel lorsqu’une page ou un fichier de ma liste de suivi est modifié\";'),(_binary 'fr',_binary 'messages:tog-extendwatchlist',_binary 's:102:\"Étendre la liste de suivi pour afficher toutes les modifications et pas uniquement les plus récentes\";'),(_binary 'fr',_binary 'messages:tog-fancysig',_binary 's:63:\"Traiter la signature comme du wikitexte (sans lien automatique)\";'),(_binary 'fr',_binary 'messages:tog-forceeditsummary',_binary 's:72:\"M’avertir lorsque je n’ai pas spécifié de résumé de modification\";'),(_binary 'fr',_binary 'messages:tog-hidecategorization',_binary 's:36:\"Masquer la catégorisation des pages\";'),(_binary 'fr',_binary 'messages:tog-hideminor',_binary 's:67:\"Masquer les modifications mineures dans les modifications récentes\";'),(_binary 'fr',_binary 'messages:tog-hidepatrolled',_binary 's:65:\"Masquer les modifications relues dans les modifications récentes\";'),(_binary 'fr',_binary 'messages:tog-minordefault',_binary 's:66:\"Marquer toutes mes modifications comme étant mineures par défaut\";'),(_binary 'fr',_binary 'messages:tog-newpageshidepatrolled',_binary 's:58:\"Masquer les pages relues dans la liste des nouvelles pages\";'),(_binary 'fr',_binary 'messages:tog-norollbackdiff',_binary 's:46:\"Ne pas afficher le diff après avoir révoqué\";'),(_binary 'fr',_binary 'messages:tog-numberheadings',_binary 's:48:\"Numéroter automatiquement les titres de section\";'),(_binary 'fr',_binary 'messages:tog-oldsig',_binary 's:26:\"Votre signature actuelle :\";'),(_binary 'fr',_binary 'messages:tog-prefershttps',_binary 's:69:\"Toujours utiliser une connexion sécurisée lorsque je suis connecté\";'),(_binary 'fr',_binary 'messages:tog-previewonfirst',_binary 's:63:\"Afficher la prévisualisation lors de la première modification\";'),(_binary 'fr',_binary 'messages:tog-previewontop',_binary 's:66:\"Afficher la prévisualisation au-dessus de la zone de modification\";'),(_binary 'fr',_binary 'messages:tog-showhiddencats',_binary 's:33:\"Afficher les catégories cachées\";'),(_binary 'fr',_binary 'messages:tog-shownumberswatching',_binary 's:44:\"Afficher le nombre d’utilisateurs en cours\";'),(_binary 'fr',_binary 'messages:tog-showtoolbar',_binary 's:41:\"Afficher la barre d’outils d’édition\";'),(_binary 'fr',_binary 'messages:tog-underline',_binary 's:26:\"Soulignement des liens :\";'),(_binary 'fr',_binary 'messages:tog-useeditwarning',_binary 's:84:\"M’avertir quand je quitte une page en cours de modification sans avoir sauvegardé\";'),(_binary 'fr',_binary 'messages:tog-uselivepreview',_binary 's:44:\"Afficher les aperçus sans recharger la page\";'),(_binary 'fr',_binary 'messages:tog-usenewrc',_binary 's:86:\"Grouper les changements par page dans les modifications récentes et la liste de suivi\";'),(_binary 'fr',_binary 'messages:tog-watchcreations',_binary 's:83:\"Ajouter à ma liste de suivi les pages que je crée et les fichiers que j’importe\";'),(_binary 'fr',_binary 'messages:tog-watchdefault',_binary 's:69:\"Ajouter à ma liste de suivi les pages et les fichiers que je modifie\";'),(_binary 'fr',_binary 'messages:tog-watchdeletion',_binary 's:70:\"Ajouter à ma liste de suivi les pages et les fichiers que je supprime\";'),(_binary 'fr',_binary 'messages:tog-watchlisthideanons',_binary 's:74:\"Masquer les modifications d’utilisateurs anonymes dans la liste de suivi\";'),(_binary 'fr',_binary 'messages:tog-watchlisthidebots',_binary 's:70:\"Masquer les modifications faites par des robots dans la liste de suivi\";'),(_binary 'fr',_binary 'messages:tog-watchlisthidecategorization',_binary 's:36:\"Masquer la catégorisation des pages\";'),(_binary 'fr',_binary 'messages:tog-watchlisthideliu',_binary 's:85:\"Masquer les modifications faites par des utilisateurs inscrits dans la liste de suivi\";'),(_binary 'fr',_binary 'messages:tog-watchlisthideminor',_binary 's:57:\"Masquer les modifications mineures dans la liste de suivi\";'),(_binary 'fr',_binary 'messages:tog-watchlisthideown',_binary 's:56:\"Masquer mes propres modifications dans la liste de suivi\";'),(_binary 'fr',_binary 'messages:tog-watchlisthidepatrolled',_binary 's:55:\"Masquer les modifications relues dans la liste de suivi\";'),(_binary 'fr',_binary 'messages:tog-watchlistreloadautomatically',_binary 's:111:\"Recharger automatiquement la liste de suivi lorsque les options de filtrage sont modifiées (JavaScript requis)\";'),(_binary 'fr',_binary 'messages:tog-watchlistunwatchlinks',_binary 's:194:\"Ajouter des marqueurs directs ({{int:Watchlist-unwatch}}/{{int:Watchlist-unwatch-undo}}) pour les pages suivies avec des changements (JavaScript est nécessaire pour utiliser la fonctionnalité)\";'),(_binary 'fr',_binary 'messages:tog-watchmoves',_binary 's:72:\"Ajouter les pages et les fichiers que je déplace dans ma liste de suivi\";'),(_binary 'fr',_binary 'messages:tog-watchrollback',_binary 's:86:\"Ajouter à ma liste de suivi les pages sur lesquelles j’ai effectué une révocation\";'),(_binary 'fr',_binary 'messages:tog-watchuploads',_binary 's:66:\"Ajouter les nouveaux fichiers que j’importe à ma liste de suivi\";'),(_binary 'fr',_binary 'messages:token_suffix_mismatch',_binary 's:355:\"<strong>Votre modification n’a pas été acceptée car votre navigateur a mal codé les caractères de ponctuation dans l’identifiant de modification.</strong>\nCe rejet est nécessaire pour empêcher la corruption du texte de la page.\nCe problème se produit parfois lorsque vous utilisez un serveur mandataire anonyme problématique basé sur le web.\";'),(_binary 'fr',_binary 'messages:tool-link-emailuser',_binary 's:71:\"Envoyer un courriel à {{GENDER:$1|cet utilisateur|cette utilisatrice}}\";'),(_binary 'fr',_binary 'messages:tool-link-userrights',_binary 's:58:\"Modifier les groupes de l’utilisat{{GENDER:$1|eur|rice}}\";'),(_binary 'fr',_binary 'messages:tool-link-userrights-readonly',_binary 's:54:\"Voir les groupes de l’utilisat{{GENDER:$1|eur|rice}}\";'),(_binary 'fr',_binary 'messages:toolbox',_binary 's:6:\"Outils\";'),(_binary 'fr',_binary 'messages:tooltip-ca-addsection',_binary 's:30:\"Commencer une nouvelle section\";'),(_binary 'fr',_binary 'messages:tooltip-ca-delete',_binary 's:20:\"Supprimer cette page\";'),(_binary 'fr',_binary 'messages:tooltip-ca-edit',_binary 's:20:\"Modifier le wikicode\";'),(_binary 'fr',_binary 'messages:tooltip-ca-history',_binary 's:37:\"Historique des versions de cette page\";'),(_binary 'fr',_binary 'messages:tooltip-ca-move',_binary 's:19:\"Renommer cette page\";'),(_binary 'fr',_binary 'messages:tooltip-ca-nstab-category',_binary 's:29:\"Voir la page de la catégorie\";'),(_binary 'fr',_binary 'messages:tooltip-ca-nstab-help',_binary 's:19:\"Voir la page d\'aide\";'),(_binary 'fr',_binary 'messages:tooltip-ca-nstab-image',_binary 's:23:\"Voir la page du fichier\";'),(_binary 'fr',_binary 'messages:tooltip-ca-nstab-main',_binary 's:26:\"Voir le contenu de la page\";'),(_binary 'fr',_binary 'messages:tooltip-ca-nstab-media',_binary 's:22:\"Voir la page du média\";'),(_binary 'fr',_binary 'messages:tooltip-ca-nstab-mediawiki',_binary 's:24:\"Voir le message système\";'),(_binary 'fr',_binary 'messages:tooltip-ca-nstab-project',_binary 's:22:\"Voir la page du projet\";'),(_binary 'fr',_binary 'messages:tooltip-ca-nstab-special',_binary 's:65:\"Ceci est une page spéciale, et elle ne peut pas être modifiée.\";'),(_binary 'fr',_binary 'messages:tooltip-ca-nstab-template',_binary 's:15:\"Voir le modèle\";'),(_binary 'fr',_binary 'messages:tooltip-ca-nstab-user',_binary 's:24:\"Voir la page utilisateur\";'),(_binary 'fr',_binary 'messages:tooltip-ca-protect',_binary 's:20:\"Protéger cette page\";'),(_binary 'fr',_binary 'messages:tooltip-ca-talk',_binary 's:44:\"Discussion au sujet de cette page de contenu\";'),(_binary 'fr',_binary 'messages:tooltip-ca-undelete',_binary 's:70:\"Rétablir les modifications faites sur cette page avant sa suppression\";'),(_binary 'fr',_binary 'messages:tooltip-ca-unprotect',_binary 's:35:\"Changer la protection de cette page\";'),(_binary 'fr',_binary 'messages:tooltip-ca-unwatch',_binary 's:42:\"Retirer cette page de votre liste de suivi\";'),(_binary 'fr',_binary 'messages:tooltip-ca-viewsource',_binary 's:73:\"Cette page est protégée.\nVous pouvez toutefois en visualiser la source.\";'),(_binary 'fr',_binary 'messages:tooltip-ca-watch',_binary 's:42:\"Ajouter cette page à votre liste de suivi\";'),(_binary 'fr',_binary 'messages:tooltip-compareselectedversions',_binary 's:79:\"Afficher les différences entre les deux versions sélectionnées de cette page\";'),(_binary 'fr',_binary 'messages:tooltip-diff',_binary 's:60:\"Afficher les modifications que vous avez apportées au texte\";'),(_binary 'fr',_binary 'messages:tooltip-feed-atom',_binary 's:25:\"Flux Atom pour cette page\";'),(_binary 'fr',_binary 'messages:tooltip-feed-rss',_binary 's:24:\"Flux RSS pour cette page\";'),(_binary 'fr',_binary 'messages:tooltip-invert',_binary 's:134:\"Cochez cette case pour cacher les modifications des pages dans l\'espace de noms sélectionné (et l\'espace de noms associé si coché)\";'),(_binary 'fr',_binary 'messages:tooltip-minoredit',_binary 's:39:\"Marquer ceci comme modification mineure\";'),(_binary 'fr',_binary 'messages:tooltip-n-currentevents',_binary 's:58:\"Trouver plus d’informations sur les actualités en cours\";'),(_binary 'fr',_binary 'messages:tooltip-n-help',_binary 's:18:\"Accès à l’aide\";'),(_binary 'fr',_binary 'messages:tooltip-n-mainpage',_binary 's:33:\"Visiter la page d\'accueil du site\";'),(_binary 'fr',_binary 'messages:tooltip-n-mainpage-description',_binary 's:17:\"Accueil général\";'),(_binary 'fr',_binary 'messages:tooltip-n-portal',_binary 's:75:\"À propos du projet, ce que vous pouvez faire, où trouver les informations\";'),(_binary 'fr',_binary 'messages:tooltip-n-randompage',_binary 's:27:\"Afficher une page au hasard\";'),(_binary 'fr',_binary 'messages:tooltip-n-recentchanges',_binary 's:45:\"Liste des modifications récentes sur le wiki\";'),(_binary 'fr',_binary 'messages:tooltip-namespace_association',_binary 's:132:\"Cochez cette case pour inclure également l’espace de noms de discussion ou du sujet, associé à l’espace de noms sélectionné\";'),(_binary 'fr',_binary 'messages:tooltip-p-logo',_binary 's:27:\"Visiter la page d’accueil\";'),(_binary 'fr',_binary 'messages:tooltip-preferences-save',_binary 's:29:\"Sauvegarder les préférences\";'),(_binary 'fr',_binary 'messages:tooltip-preview',_binary 's:62:\"Merci de prévisualiser vos modifications avant de les publier\";'),(_binary 'fr',_binary 'messages:tooltip-pt-anoncontribs',_binary 's:63:\"Une liste des modifications effectuées depuis cette adresse IP\";'),(_binary 'fr',_binary 'messages:tooltip-pt-anontalk',_binary 's:68:\"La page de discussion pour les contributions depuis cette adresse IP\";'),(_binary 'fr',_binary 'messages:tooltip-pt-anonuserpage',_binary 's:65:\"La page utilisateur avec l\'adresse IP de laquelle vous contribuez\";'),(_binary 'fr',_binary 'messages:tooltip-pt-createaccount',_binary 's:110:\"Nous vous encourageons à créer un compte utilisateur et vous connecter; ce n’est cependant pas obligatoire\";'),(_binary 'fr',_binary 'messages:tooltip-pt-login',_binary 's:79:\"Nous vous encourageons à vous connecter ; ce n’est cependant pas obligatoire\";'),(_binary 'fr',_binary 'messages:tooltip-pt-login-private',_binary 's:47:\"Vous devez vous connecter pour utiliser ce wiki\";'),(_binary 'fr',_binary 'messages:tooltip-pt-logout',_binary 's:15:\"Se déconnecter\";'),(_binary 'fr',_binary 'messages:tooltip-pt-mycontris',_binary 's:41:\"La liste de {{GENDER:|vos}} contributions\";'),(_binary 'fr',_binary 'messages:tooltip-pt-mytalk',_binary 's:24:\"Votre page de discussion\";'),(_binary 'fr',_binary 'messages:tooltip-pt-preferences',_binary 's:29:\"{{GENDER:|Vos}} préférences\";'),(_binary 'fr',_binary 'messages:tooltip-pt-userpage',_binary 's:51:\"Votre page d’{{GENDER:|utilisateur|utilisatrice}}\";'),(_binary 'fr',_binary 'messages:tooltip-pt-watchlist',_binary 's:54:\"Une liste des pages dont vous suivez les modifications\";'),(_binary 'fr',_binary 'messages:tooltip-publish',_binary 's:25:\"Publier vos modifications\";'),(_binary 'fr',_binary 'messages:tooltip-recreate',_binary 's:51:\"Recréer la page même si celle-ci a été effacée\";'),(_binary 'fr',_binary 'messages:tooltip-rollback',_binary 's:114:\"« Révoquer » annule en un clic la ou les modification(s) de cette page réalisées par son dernier contributeur\";'),(_binary 'fr',_binary 'messages:tooltip-save',_binary 's:29:\"Enregistrer vos modifications\";'),(_binary 'fr',_binary 'messages:tooltip-search',_binary 's:28:\"Rechercher dans {{SITENAME}}\";'),(_binary 'fr',_binary 'messages:tooltip-search-fulltext',_binary 's:41:\"Rechercher les pages comportant ce texte.\";'),(_binary 'fr',_binary 'messages:tooltip-search-go',_binary 's:48:\"Accédez à une page du même nom si elle existe\";'),(_binary 'fr',_binary 'messages:tooltip-summary',_binary 's:23:\"Entrez un bref résumé\";'),(_binary 'fr',_binary 'messages:tooltip-t-contributions',_binary 's:83:\"Voir la liste des contributions de {{GENDER:$1|cet utilisateur|cette utilisatrice}}\";'),(_binary 'fr',_binary 'messages:tooltip-t-emailuser',_binary 's:71:\"Envoyer un courriel à {{GENDER:$1|cet utilisateur|cette utilisatrice}}\";'),(_binary 'fr',_binary 'messages:tooltip-t-info',_binary 's:35:\"Plus d’information sur cette page\";'),(_binary 'fr',_binary 'messages:tooltip-t-permalink',_binary 's:46:\"Adresse permanente de cette version de la page\";'),(_binary 'fr',_binary 'messages:tooltip-t-print',_binary 's:32:\"Version imprimable de cette page\";'),(_binary 'fr',_binary 'messages:tooltip-t-recentchangeslinked',_binary 's:66:\"Liste des modifications récentes des pages appelées par celle-ci\";'),(_binary 'fr',_binary 'messages:tooltip-t-specialpages',_binary 's:36:\"Liste de toutes les pages spéciales\";'),(_binary 'fr',_binary 'messages:tooltip-t-upload',_binary 's:21:\"Importer des fichiers\";'),(_binary 'fr',_binary 'messages:tooltip-t-whatlinkshere',_binary 's:48:\"Liste des pages liées qui pointent sur celle-ci\";'),(_binary 'fr',_binary 'messages:tooltip-undo',_binary 's:173:\"« Annuler » rétablit la modification précédente et ouvre la fenêtre de modification en mode prévisualisation. Il est possible d’ajouter une raison dans le résumé.\";'),(_binary 'fr',_binary 'messages:tooltip-upload',_binary 's:18:\"Démarrer l\'import\";'),(_binary 'fr',_binary 'messages:tooltip-watch',_binary 's:42:\"Ajouter cette page à votre liste de suivi\";'),(_binary 'fr',_binary 'messages:tooltip-watchlistedit-normal-submit',_binary 's:18:\"Enlever les titres\";'),(_binary 'fr',_binary 'messages:tooltip-watchlistedit-raw-submit',_binary 's:33:\"Mise à jour de la liste de suivi\";'),(_binary 'fr',_binary 'messages:tooltip-whatlinkshere-invert',_binary 's:85:\"Cochez cette case pour cacher les liens des pages dans l\'espace de nom sélectionné.\";'),(_binary 'fr',_binary 'messages:trackingcategories',_binary 's:20:\"Catégories de suivi\";'),(_binary 'fr',_binary 'messages:trackingcategories-desc',_binary 's:39:\"Critère d’inclusion de la catégorie\";'),(_binary 'fr',_binary 'messages:trackingcategories-disabled',_binary 's:30:\"La catégorie est désactivée\";'),(_binary 'fr',_binary 'messages:trackingcategories-msg',_binary 's:19:\"Catégorie de suivi\";'),(_binary 'fr',_binary 'messages:trackingcategories-name',_binary 's:14:\"Nom du message\";'),(_binary 'fr',_binary 'messages:trackingcategories-nodesc',_binary 's:30:\"Aucune description disponible.\";'),(_binary 'fr',_binary 'messages:trackingcategories-summary',_binary 's:213:\"Cette page liste les catégories de suivi qui sont remplies automatiquement par [[MediaWiki]]. Leurs noms peuvent être changés en modifiant les messages systèmes correspondants dans l’espace de noms {{ns:8}}.\";'),(_binary 'fr',_binary 'messages:transaction-duration-limit-exceeded',_binary 's:344:\"Pour éviter une trop forte augmentation du délai de réplication, cette transaction a été annulée car la durée d’écriture ($1) a dépassé la limite de $2 seconde{{PLURAL:$2||s}}. Si vous cherchez à modifier un grand nombre d’éléments simultanément, essayez plutôt d’effectuer l’opération en plusieurs étapes plus petites.\";'),(_binary 'fr',_binary 'messages:translateinterface',_binary 's:180:\"Pour ajouter ou modifier des traductions pour tous les wikis, veuillez utiliser [https://translatewiki.net/ translatewiki.net], le projet de localisation linguistique de MediaWiki.\";'),(_binary 'fr',_binary 'messages:tue',_binary 's:4:\"Mar.\";'),(_binary 'fr',_binary 'messages:tuesday',_binary 's:5:\"mardi\";'),(_binary 'fr',_binary 'messages:tuesday-at',_binary 's:11:\"Mardi à $1\";'),(_binary 'fr',_binary 'messages:uctop',_binary 's:10:\"(actuelle)\";'),(_binary 'fr',_binary 'messages:unblock',_binary 's:26:\"Débloquer l’utilisateur\";'),(_binary 'fr',_binary 'messages:unblock-hideuser',_binary 's:91:\"Vous ne pouvez pas débloquer cet utilisateur, car son nom d’utilisateur a été masqué.\";'),(_binary 'fr',_binary 'messages:unblock-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:unblocked',_binary 's:49:\"[[User:$1|$1]] a été débloqué{{GENDER:$1||e}}\";'),(_binary 'fr',_binary 'messages:unblocked-id',_binary 's:29:\"Le blocage $1 a été enlevé\";'),(_binary 'fr',_binary 'messages:unblocked-ip',_binary 's:51:\"[[Special:Contributions/$1|$1]] a été débloqué.\";'),(_binary 'fr',_binary 'messages:unblocked-range',_binary 's:31:\"Le compte $1 a été débloqué\";'),(_binary 'fr',_binary 'messages:unblockip',_binary 's:25:\"Débloquer un utilisateur\";'),(_binary 'fr',_binary 'messages:unblockiptext',_binary 's:148:\"Utilisez le formulaire ci-dessous pour redonner les droits d’écriture à une adresse IP ou un nom d’utilisateur qui a été bloqué auparavant.\";'),(_binary 'fr',_binary 'messages:unblocklink',_binary 's:10:\"débloquer\";'),(_binary 'fr',_binary 'messages:unblocklogentry',_binary 's:15:\"a débloqué $1\";'),(_binary 'fr',_binary 'messages:uncategorized-categories-exceptionlist',_binary 's:280:\"# Contient une liste de catégories, qui ne devraient pas être mentionnées sur Spécial:UncategorizedCategories. Une par ligne, en commençant par \"*\". Les lignes qui commencent avec un autre caractère (y compris les espaces) sont ignorées. Utilisez \"#\" pour les commentaires.\";'),(_binary 'fr',_binary 'messages:uncategorizedcategories',_binary 's:28:\"Catégories sans catégories\";'),(_binary 'fr',_binary 'messages:uncategorizedcategories-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:uncategorizedimages',_binary 's:24:\"Fichiers sans catégorie\";'),(_binary 'fr',_binary 'messages:uncategorizedimages-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:uncategorizedpages',_binary 's:21:\"Pages sans catégorie\";'),(_binary 'fr',_binary 'messages:uncategorizedpages-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:uncategorizedtemplates',_binary 's:24:\"Modèles sans catégorie\";'),(_binary 'fr',_binary 'messages:uncategorizedtemplates-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:undelete',_binary 's:26:\"Voir les pages supprimées\";'),(_binary 'fr',_binary 'messages:undelete-bad-store-key',_binary 's:107:\"Impossible de restaurer la version du fichier datée du $1 : le fichier était absent avant la suppression.\";'),(_binary 'fr',_binary 'messages:undelete-cantcreate',_binary 's:144:\"Vous ne pouvez pas annuler la suppression de cette page car il n’existe pas de page avec ce nom, et vous n’êtes pas autorisé à la créer.\";'),(_binary 'fr',_binary 'messages:undelete-cantedit',_binary 's:104:\"Vous ne pouvez pas annuler la suppression de cette page car vous n’êtes pas autorisé à la modifier.\";'),(_binary 'fr',_binary 'messages:undelete-cleanup-error',_binary 's:73:\"Erreur lors de la suppression du fichier d’archive inutilisé « $1 ».\";'),(_binary 'fr',_binary 'messages:undelete-error',_binary 's:30:\"Page d’erreur d’annulation\";'),(_binary 'fr',_binary 'messages:undelete-error-long',_binary 's:75:\"Des erreurs ont été rencontrées lors de la restauration du fichier :\n\n$1\";'),(_binary 'fr',_binary 'messages:undelete-error-short',_binary 's:46:\"Erreur lors de la restauration du fichier : $1\";'),(_binary 'fr',_binary 'messages:undelete-fieldset-title',_binary 's:22:\"Restaurer les versions\";'),(_binary 'fr',_binary 'messages:undelete-filename-mismatch',_binary 's:97:\"Impossible de restaurer la version du fichier datée du $1 : le nom de fichier ne correspond pas.\";'),(_binary 'fr',_binary 'messages:undelete-header',_binary 's:106:\"Consultez le [[Special:Log/delete|journal des suppressions]] pour lister les pages récemment supprimées.\";'),(_binary 'fr',_binary 'messages:undelete-missing-filearchive',_binary 's:162:\"Impossible de restaurer le fichier d’archive avec l’identifiant $1 parce qu’il n’est pas dans la base de données.\nIl a peut-être déjà été restauré.\";'),(_binary 'fr',_binary 'messages:undelete-no-results',_binary 's:81:\"Aucune page correspondante n’a été trouvée dans les archives de suppression.\";'),(_binary 'fr',_binary 'messages:undelete-nodiff',_binary 's:37:\"Aucune version précédente trouvée.\";'),(_binary 'fr',_binary 'messages:undelete-revision',_binary 's:55:\"Version supprimée de $1 (version du $4 à $5) par $3 :\";'),(_binary 'fr',_binary 'messages:undelete-revision-row2',_binary 's:29:\"$1 ($2) $3 . . $4 $5 $6 $7 $8\";'),(_binary 'fr',_binary 'messages:undelete-search-box',_binary 's:32:\"Rechercher les pages supprimées\";'),(_binary 'fr',_binary 'messages:undelete-search-full',_binary 's:39:\"Afficher les pages de titre contenant :\";'),(_binary 'fr',_binary 'messages:undelete-search-prefix',_binary 's:35:\"Montrer les pages commençant par :\";'),(_binary 'fr',_binary 'messages:undelete-search-submit',_binary 's:10:\"Rechercher\";'),(_binary 'fr',_binary 'messages:undelete-search-title',_binary 's:32:\"Rechercher les pages supprimées\";'),(_binary 'fr',_binary 'messages:undelete-show-file-confirm',_binary 's:131:\"Êtes-vous sûr{{GENDER:||e}} de vouloir consulter une version supprimée du fichier « <nowiki>$1</nowiki> » datant du $2 à $3 ?\";'),(_binary 'fr',_binary 'messages:undelete-show-file-submit',_binary 's:3:\"Oui\";'),(_binary 'fr',_binary 'messages:undelete-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:undelete_short',_binary 's:57:\"Restaurer {{PLURAL:$1|une modification|$1 modifications}}\";'),(_binary 'fr',_binary 'messages:undeletebtn',_binary 's:9:\"Restaurer\";'),(_binary 'fr',_binary 'messages:undeletecomment',_binary 's:7:\"Motif :\";'),(_binary 'fr',_binary 'messages:undeletedarticle',_binary 's:17:\"restored \"[[$1]]\"\";'),(_binary 'fr',_binary 'messages:undeletedpage',_binary 's:176:\"<strong>La page $1 a été restaurée.</strong>\n\nConsultez le [[Special:Log/delete|journal des suppressions]] pour obtenir la liste des récentes suppressions et restaurations.\";'),(_binary 'fr',_binary 'messages:undeleteextrahelp',_binary 's:316:\"Pour restaurer l’historique complet de cette page, laissez toutes les cases décochées et cliquez sur <strong><em>{{int:undeletebtn}}</em></strong>.\nPour effectuer une restauration partielle, cochez les cases correspondant aux versions à rétablir, puis cliquez sur <strong><em>{{int:undeletebtn}}</em></strong>.\";'),(_binary 'fr',_binary 'messages:undeletehistory',_binary 's:236:\"Si vous restaurez la page, toutes les versions seront replacées dans l’historique.\nSi une nouvelle page avec le même nom a été créée depuis la suppression, les versions restaurées s’inséreront dans l’historique antérieur.\";'),(_binary 'fr',_binary 'messages:undeletehistorynoadmin',_binary 's:274:\"Cette page a été supprimée.\nLe motif de la suppression est indiqué dans le résumé ci-dessous, avec les détails des utilisateurs qui ont modifié la page avant sa suppression.\nLe contenu effectif de ces versions supprimées n’est accessible qu’aux administrateurs.\";'),(_binary 'fr',_binary 'messages:undeleteinvert',_binary 's:22:\"Inverser la sélection\";'),(_binary 'fr',_binary 'messages:undeletelink',_binary 's:14:\"voir/restaurer\";'),(_binary 'fr',_binary 'messages:undeletepage',_binary 's:39:\"Voir et restaurer des pages supprimées\";'),(_binary 'fr',_binary 'messages:undeletepagetext',_binary 's:290:\"{{PLURAL:$1|La page suivante a été supprimée et se trouve|Les pages suivantes ont été supprimées et se trouvent}} dans la base de données archive, d’où {{PLURAL:$1|elle peut|elles peuvent}} encore être restaurée{{PLURAL:$1||s}}.\nL’archive peut être nettoyée périodiquement.\";'),(_binary 'fr',_binary 'messages:undeletepagetitle',_binary 's:83:\"<strong>La liste suivante contient des versions supprimées de [[:$1|$1]]</strong>.\";'),(_binary 'fr',_binary 'messages:undeleterevdel',_binary 's:253:\"La restauration ne sera pas effectuée si, au final, la version la plus récente de la page ou du fichier reste partiellement supprimée.\nDans de tels cas, vous devez décocher ou démasquer les versions effacées les plus récentes (en tête de liste).\";'),(_binary 'fr',_binary 'messages:undeleterevision-duplicate-revid',_binary 's:166:\"{{PLURAL:$1|Une révision n\'a|$1 révisions n\'ont}} pas pu être restaurée{{PLURAL:$1|car son|s car leur}}  <code>rev_id</code> était déjà en cours d\'utilisation.\";'),(_binary 'fr',_binary 'messages:undeleterevision-missing',_binary 's:136:\"Version incorrecte ou manquante.\nVous avez peut-être un mauvais lien, ou la version a pu être restaurée ou supprimée de l’archive.\";'),(_binary 'fr',_binary 'messages:undeleterevisions',_binary 's:60:\"$1 {{PLURAL:$1|révision supprimée|révisions supprimées}}\";'),(_binary 'fr',_binary 'messages:undeleteviewlink',_binary 's:4:\"voir\";'),(_binary 'fr',_binary 'messages:underline-always',_binary 's:8:\"Toujours\";'),(_binary 'fr',_binary 'messages:underline-default',_binary 's:45:\"Valeur par défaut du thème ou du navigateur\";'),(_binary 'fr',_binary 'messages:underline-never',_binary 's:6:\"Jamais\";'),(_binary 'fr',_binary 'messages:undo-failure',_binary 's:113:\"Cette modification ne peut pas être défaite : cela entrerait en conflit avec les modifications intermédiaires.\";'),(_binary 'fr',_binary 'messages:undo-main-slot-only',_binary 's:106:\"La modification n\'a pas pu être annulée car elle implique un contenu en dehors de la tranche principale.\";'),(_binary 'fr',_binary 'messages:undo-nochange',_binary 's:60:\"Il semblerait que la modification ait déjà été annulée.\";'),(_binary 'fr',_binary 'messages:undo-norev',_binary 's:108:\"La modification n’a pas pu être défaite parce qu’elle est inexistante ou qu’elle a été supprimée.\";'),(_binary 'fr',_binary 'messages:undo-success',_binary 's:155:\"Cette modification va être annulée.\nVeuillez vérifier les différences ci-dessous, puis publier l’annulation si c’est bien ce que vous voulez faire.\";'),(_binary 'fr',_binary 'messages:undo-summary',_binary 's:96:\"Annulation des modifications $1 de [[Special:Contributions/$2|$2]] ([[User talk:$2|discussion]])\";'),(_binary 'fr',_binary 'messages:undo-summary-username-hidden',_binary 's:50:\"Annuler la révision $1 par un utilisateur masqué\";'),(_binary 'fr',_binary 'messages:unexpected',_binary 's:40:\"Valeur inattendue : « $1 » = « $2 ».\";'),(_binary 'fr',_binary 'messages:unicode-support-fail',_binary 's:159:\"Votre navigateur semble ne pas rendre en charge l\'Unicode. Ceci est nécessaire pour modifier les pages, aussi vos modifications n\'ont pas été sauvegardées.\";'),(_binary 'fr',_binary 'messages:unit-pixel',_binary 's:2:\"px\";'),(_binary 'fr',_binary 'messages:unknown-error',_binary 's:37:\"Une erreur inconnue s’est produite.\";'),(_binary 'fr',_binary 'messages:unlinkaccounts',_binary 's:21:\"Dissocier les comptes\";'),(_binary 'fr',_binary 'messages:unlinkaccounts-success',_binary 's:28:\"Le compte a été dissocié.\";'),(_binary 'fr',_binary 'messages:unlockbtn',_binary 's:34:\"Déverrouiller la base de données\";'),(_binary 'fr',_binary 'messages:unlockconfirm',_binary 's:68:\"Oui, je confirme que je souhaite déverrouiller la base de données.\";'),(_binary 'fr',_binary 'messages:unlockdb',_binary 's:34:\"Déverrouiller la base de données\";'),(_binary 'fr',_binary 'messages:unlockdbsuccesssub',_binary 's:45:\"Verrouillage de la base de données supprimé\";'),(_binary 'fr',_binary 'messages:unlockdbsuccesstext',_binary 's:44:\"La base de données a été déverrouillée.\";'),(_binary 'fr',_binary 'messages:unlockdbtext',_binary 's:335:\"Le déverrouillage de la base de données permettra à nouveau à tous les utilisateurs de modifier des pages, de changer leurs préférences, de modifier leur liste de suivi et d’effectuer les autres opérations nécessitant des changements dans la base de données.\nVeuillez confirmer que c’est bien là ce que vous voulez faire.\";'),(_binary 'fr',_binary 'messages:unpatrolledletter',_binary 's:1:\"!\";'),(_binary 'fr',_binary 'messages:unprotect',_binary 's:21:\"Changer la protection\";'),(_binary 'fr',_binary 'messages:unprotected-js',_binary 's:151:\"For security reasons JavaScript cannot be loaded from unprotected pages. Please only create javascript in the MediaWiki: namespace or as a User subpage\";'),(_binary 'fr',_binary 'messages:unprotectedarticle',_binary 's:41:\"a supprimé la protection de « [[$1]] »\";'),(_binary 'fr',_binary 'messages:unprotectedarticle-comment',_binary 's:59:\"{{GENDER:$2|A supprimé la protection}} de « [[$1]] »\";'),(_binary 'fr',_binary 'messages:unregistered-user-config',_binary 's:149:\"Pour des raisons de sécurité, les sous-pages utilisateur JavaScript, CSS et JSON ne peuvent pas être chargées pour les utilisateurs non inscrits.\";'),(_binary 'fr',_binary 'messages:unstrip-depth-category',_binary 's:66:\"Pages où la limite de profondeur de développement est dépassée\";'),(_binary 'fr',_binary 'messages:unstrip-depth-warning',_binary 's:51:\"Limite de récursion non dépilable dépassée ($1)\";'),(_binary 'fr',_binary 'messages:unstrip-size-category',_binary 's:62:\"Pages où la limite de taille de développement est dépassée\";'),(_binary 'fr',_binary 'messages:unstrip-size-warning',_binary 's:50:\"Limite de taille de développement dépassée ($1)\";'),(_binary 'fr',_binary 'messages:unusedcategories',_binary 's:24:\"Catégories inutilisées\";'),(_binary 'fr',_binary 'messages:unusedcategories-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:unusedcategoriestext',_binary 's:91:\"Les pages de catégories suivantes existent, mais aucune page ou catégorie ne les utilise.\";'),(_binary 'fr',_binary 'messages:unusedimages',_binary 's:18:\"Fichiers orphelins\";'),(_binary 'fr',_binary 'messages:unusedimages-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:unusedimagestext',_binary 's:263:\"Les fichiers suivants existent, mais ne sont inclus dans aucune page.\nVeuillez noter que d’autres sites peuvent accéder à ces fichiers à l’aide de liens directs (URLs), et donc qu’un fichier peut être listé ici alors qu’il est utilisé par ces sites.\";'),(_binary 'fr',_binary 'messages:unusedtemplates',_binary 's:20:\"Modèles inutilisés\";'),(_binary 'fr',_binary 'messages:unusedtemplates-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:unusedtemplatestext',_binary 's:229:\"Cette page liste toutes les pages de l’espace de noms « {{ns:template}} » qui ne sont incluses dans aucune autre page.\nN’oubliez pas de vérifier s’il n’y a pas d’autres liens vers les modèles avant de les supprimer.\";'),(_binary 'fr',_binary 'messages:unusedtemplateswlh',_binary 's:12:\"autres liens\";'),(_binary 'fr',_binary 'messages:unwatch',_binary 's:14:\"Ne plus suivre\";'),(_binary 'fr',_binary 'messages:unwatchedpages',_binary 's:49:\"Pages ne faisant partie d’aucune liste de suivi\";'),(_binary 'fr',_binary 'messages:unwatchedpages-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:unwatching',_binary 's:15:\"Fin du suivi…\";'),(_binary 'fr',_binary 'messages:unwatchthispage',_binary 's:14:\"Ne plus suivre\";'),(_binary 'fr',_binary 'messages:updated',_binary 's:13:\"(Mis à jour)\";'),(_binary 'fr',_binary 'messages:updatedmarker',_binary 's:35:\"modifié depuis ma dernière visite\";'),(_binary 'fr',_binary 'messages:upload',_binary 's:19:\"Importer un fichier\";'),(_binary 'fr',_binary 'messages:upload-copy-upload-invalid-domain',_binary 's:71:\"La copie des téléversements n’est pas disponible depuis ce domaine.\";'),(_binary 'fr',_binary 'messages:upload-curl-error28',_binary 's:39:\"Dépassement du délai lors de l\'import\";'),(_binary 'fr',_binary 'messages:upload-curl-error28-text',_binary 's:175:\"Le site a mis trop longtemps à répondre. \nVérifiez que le site est en ligne, attendez un peu et réessayez. \nVous pouvez aussi réessayer à une heure de moindre affluence.\";'),(_binary 'fr',_binary 'messages:upload-curl-error6',_binary 's:15:\"URL injoignable\";'),(_binary 'fr',_binary 'messages:upload-curl-error6-text',_binary 's:117:\"L’URL fournie ne peut pas être atteinte. \nVeuillez vérifier que l’URL est correcte et que le site est en ligne.\";'),(_binary 'fr',_binary 'messages:upload-default-description',_binary 's:1:\"-\";'),(_binary 'fr',_binary 'messages:upload-description',_binary 's:22:\"Description du fichier\";'),(_binary 'fr',_binary 'messages:upload-dialog-button-back',_binary 's:6:\"Retour\";'),(_binary 'fr',_binary 'messages:upload-dialog-button-cancel',_binary 's:7:\"Annuler\";'),(_binary 'fr',_binary 'messages:upload-dialog-button-done',_binary 's:8:\"Terminé\";'),(_binary 'fr',_binary 'messages:upload-dialog-button-save',_binary 's:11:\"Enregistrer\";'),(_binary 'fr',_binary 'messages:upload-dialog-button-upload',_binary 's:12:\"Téléverser\";'),(_binary 'fr',_binary 'messages:upload-dialog-disabled',_binary 's:97:\"Les téléversements de fichier utilisant cette boîte de dialogue sont désactivés sur ce wiki.\";'),(_binary 'fr',_binary 'messages:upload-dialog-title',_binary 's:23:\"Téléverser un fichier\";'),(_binary 'fr',_binary 'messages:upload-disallowed-here',_binary 's:40:\"Vous ne pouvez pas remplacer ce fichier.\";'),(_binary 'fr',_binary 'messages:upload-file-error',_binary 's:14:\"Erreur interne\";'),(_binary 'fr',_binary 'messages:upload-file-error-text',_binary 's:154:\"Une erreur interne est survenue en voulant créer un fichier temporaire sur le serveur. \nVeuillez contacter un [[Special:ListUsers/sysop|administrateur]].\";'),(_binary 'fr',_binary 'messages:upload-foreign-cant-load-config',_binary 's:118:\"Échec au chargement de la configuration du téléversement des fichiers vers le référentiel de fichiers étrangers.\";'),(_binary 'fr',_binary 'messages:upload-foreign-cant-upload',_binary 's:107:\"Ce wiki n’est pas configuré pour téléverser des fichiers vers le dépôt de fichiers externe demandé.\";'),(_binary 'fr',_binary 'messages:upload-form-label-infoform-categories',_binary 's:11:\"Catégories\";'),(_binary 'fr',_binary 'messages:upload-form-label-infoform-date',_binary 's:4:\"Date\";'),(_binary 'fr',_binary 'messages:upload-form-label-infoform-description',_binary 's:11:\"Description\";'),(_binary 'fr',_binary 'messages:upload-form-label-infoform-description-tooltip',_binary 's:175:\"Décrire brièvement tout ce qu’il y a de particulier concernant cette œuvre.\nPour une photo, mentionner les choses principales qui sont vues, l’occasion, ou l’endroit.\";'),(_binary 'fr',_binary 'messages:upload-form-label-infoform-name',_binary 's:3:\"Nom\";'),(_binary 'fr',_binary 'messages:upload-form-label-infoform-name-tooltip',_binary 's:176:\"Un titre descriptif unique pour le fichier, qui servira comme nom de fichier. Vous pouvez utiliser le langage courant avec des espaces. Ne pas inclure l’extension du fichier.\";'),(_binary 'fr',_binary 'messages:upload-form-label-infoform-title',_binary 's:8:\"Détails\";'),(_binary 'fr',_binary 'messages:upload-form-label-not-own-work-local-generic-foreign',_binary 's:165:\"Vous pouvez également essayer d’utiliser [[Special:Upload|la page de téléversement de {{SITENAME}}]], si leurs règles autorisent le téléversement du fichier.\";'),(_binary 'fr',_binary 'messages:upload-form-label-not-own-work-local-generic-local',_binary 's:84:\"Vous pouvez aussi essayer [[Special:Upload|la page de téléversement par défaut]].\";'),(_binary 'fr',_binary 'messages:upload-form-label-not-own-work-message-generic-foreign',_binary 's:185:\"Si vous n’êtes pas en mesure de téléverser ce fichier de façon conforme aux règles de ce dépôt partagé, veuillez fermer cette boîte de dialogue et essayer une autre méthode.\";'),(_binary 'fr',_binary 'messages:upload-form-label-not-own-work-message-generic-local',_binary 's:160:\"Si vous ne pouvez pas téléverser ce fichier d’après les politiques de {{SITENAME}}, veuillez fermer cette boîte de dialogue et essayer une autre méthode.\";'),(_binary 'fr',_binary 'messages:upload-form-label-own-work',_binary 's:34:\"Je suis l’auteur de cette œuvre\";'),(_binary 'fr',_binary 'messages:upload-form-label-own-work-message-generic-foreign',_binary 's:182:\"Je comprends que je téléverse ce fichier vers un dépôt partagé. Je confirme agir en accord avec les conditions d’utilisation et les règles relatives aux licences de celui-ci.\";'),(_binary 'fr',_binary 'messages:upload-form-label-own-work-message-generic-local',_binary 's:109:\"Je confirme que je téléverse ce fichier suivant les conditions et les politiques de licence de {{SITENAME}}\";'),(_binary 'fr',_binary 'messages:upload-form-label-usage-filename',_binary 's:14:\"Nom du fichier\";'),(_binary 'fr',_binary 'messages:upload-form-label-usage-title',_binary 's:11:\"Utilisation\";'),(_binary 'fr',_binary 'messages:upload-http-error',_binary 's:33:\"Une erreur HTTP est survenue : $1\";'),(_binary 'fr',_binary 'messages:upload-maxfilesize',_binary 's:31:\"Taille maximale du fichier : $1\";'),(_binary 'fr',_binary 'messages:upload-misc-error',_binary 's:26:\"Erreur d’import inconnue\";'),(_binary 'fr',_binary 'messages:upload-misc-error-text',_binary 's:217:\"Une erreur inconnue est survenue pendant l’import.\nVeuillez vérifier que l’URL est valide et accessible, puis essayer à nouveau.\nSi le problème persiste, contactez un [[Special:ListUsers/sysop|administrateur]].\";'),(_binary 'fr',_binary 'messages:upload-options',_binary 's:30:\"Options d’import de fichiers\";'),(_binary 'fr',_binary 'messages:upload-permitted',_binary 's:81:\"{{PLURAL:$2|Format|Formats}} de fichiers {{PLURAL:$2|autorisé|autorisés}} : $1.\";'),(_binary 'fr',_binary 'messages:upload-preferred',_binary 's:83:\"{{PLURAL:$2|Format|Formats}} de fichiers {{PLURAL:$2|préféré|préférés}} : $1.\";'),(_binary 'fr',_binary 'messages:upload-prohibited',_binary 's:82:\"‎{{PLURAL:$2|Format|Formats}} de fichiers {{PLURAL:$2|interdit|interdits}} : $1.\";'),(_binary 'fr',_binary 'messages:upload-proto-error',_binary 's:19:\"Protocole incorrect\";'),(_binary 'fr',_binary 'messages:upload-proto-error-text',_binary 's:103:\"L’import à distance requiert que les URL commencent par <code>http://</code> ou <code>ftp://</code>.\";'),(_binary 'fr',_binary 'messages:upload-recreate-warning',_binary 's:186:\"<strong>Attention : Un fichier portant ce nom a été supprimé ou déplacé.</strong>\n\nLes journaux des suppressions et déplacements pour cette page sont fournis ici pour information :\";'),(_binary 'fr',_binary 'messages:upload-scripted-dtd',_binary 's:97:\"Impossible de téléverser des fichiers SVG qui contiennent une déclaration de DTD non standard.\";'),(_binary 'fr',_binary 'messages:upload-scripted-pi-callback',_binary 's:101:\"Impossible de charger un fichier qui contient des instructions de traitement de feuille de style XML.\";'),(_binary 'fr',_binary 'messages:upload-source',_binary 's:14:\"Fichier source\";'),(_binary 'fr',_binary 'messages:upload-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:upload-too-many-redirects',_binary 's:38:\"L’URL contient trop de redirections.\";'),(_binary 'fr',_binary 'messages:upload-tryagain',_binary 's:43:\"Envoyer la description du fichier modifiée\";'),(_binary 'fr',_binary 'messages:upload-tryagain-nostash',_binary 's:75:\"Soumettre un fichier téléversé de nouveau avec une description modifiée\";'),(_binary 'fr',_binary 'messages:upload_directory_missing',_binary 's:106:\"Le répertoire d’import de fichier ($1) est introuvable et n’a pas pu être créé par le serveur web.\";'),(_binary 'fr',_binary 'messages:upload_directory_read_only',_binary 's:87:\"Le serveur web n’a pas accès en écriture au répertoire d’import de fichier ($1).\";'),(_binary 'fr',_binary 'messages:upload_source_file',_binary 's:46:\"(votre fichier choisi depuis votre ordinateur)\";'),(_binary 'fr',_binary 'messages:upload_source_url',_binary 's:82:\"(le fichier que vous avez choisi depuis une URL valide et accessible publiquement)\";'),(_binary 'fr',_binary 'messages:uploadbtn',_binary 's:19:\"Importer le fichier\";'),(_binary 'fr',_binary 'messages:uploaddisabled',_binary 's:49:\"Désolé, l’import de fichiers est désactivé.\";'),(_binary 'fr',_binary 'messages:uploaddisabledtext',_binary 's:51:\"L’import de fichiers est désactivé sur ce wiki.\";'),(_binary 'fr',_binary 'messages:uploaded-animate-svg',_binary 's:171:\"Balise « animate » trouvée, qui pourrait modifier le href en utilisant l’attribut « from » <code>&lt;$1 $2=\"$3\"&gt;</code> dans le fichier SVG téléversé.\";'),(_binary 'fr',_binary 'messages:uploaded-event-handler-on-svg',_binary 's:117:\"Fixer des attributs de gestionnaire d’événement <code>$1=\"$2\"</code> n’est pas autorisé dans les fichiers SVG.\";'),(_binary 'fr',_binary 'messages:uploaded-hostile-svg',_binary 's:78:\"CSS non sûr trouvé dans l’élément style d’un fichier SVG téléversé.\";'),(_binary 'fr',_binary 'messages:uploaded-href-attribute-svg',_binary 's:338:\"<a> les éléments ne peuvent être liés (href) qu’aux cibles de données : (fichier inclus), http:// ou https://, ou un fragment (#, même document). Pour les autres éléments, comme <image>, seuls data: et fragment sont autorisés. Essayez les images incluses lors de l’export de votre SVG. <code>&lt;$1 $2=\"$3\"&gt;</code> obtenu.\";'),(_binary 'fr',_binary 'messages:uploaded-href-unsafe-target-svg',_binary 's:130:\"Un href vers des données non sûres a été trouvé dans le fichier SVG téléversé : URI cible <code>&lt;$1 $2=\"$3\"&gt;</code>.\";'),(_binary 'fr',_binary 'messages:uploaded-image-filter-svg',_binary 's:101:\"Filtre d’image avec URL trouvé : <code>&lt;$1 $2=\"$3\"&gt;</code> dans le fichier SVG téléversé.\";'),(_binary 'fr',_binary 'messages:uploaded-remote-url-svg',_binary 's:145:\"Les SVG qui positionnent un attribut de style avec une URL distante sont bloqués. <code>$1=\"$2\"</code> trouvé dans le fichier SVG téléversé.\";'),(_binary 'fr',_binary 'messages:uploaded-script-svg',_binary 's:75:\"Élément scriptable « $1 » trouvé dans le fichier SVG téléversé.\";'),(_binary 'fr',_binary 'messages:uploaded-setting-event-handler-svg',_binary 's:152:\"Positionner les attributs du gestionnaire d’événements n\'est pas possible, <code>&lt;$1 $2=\"$3\"&gt;</code> trouvé dans le fichier SVG téléversé.\";'),(_binary 'fr',_binary 'messages:uploaded-setting-handler-svg',_binary 's:170:\"Les SVG qui positionnent l’attribut « handler » avec distant/données/script sont bloqués. <code>$1=\"$2\"</code> a été trouvé dans le fichier SVG téléversé.\";'),(_binary 'fr',_binary 'messages:uploaded-setting-href-svg',_binary 's:121:\"L’utilisation de la balise « set » pour ajouter un attribut « href » à l’élément parent est interdite.\";'),(_binary 'fr',_binary 'messages:uploaded-wrong-setting-svg',_binary 's:232:\"L’utilisation de la balise « set » pour ajouter une cible distante, de données ou de type script,  à un attribut quelconque, est interdite. <code>&lt;set to=\"$1\"&gt;</code> a été trouvé dans le fichier SVG téléversé.\";'),(_binary 'fr',_binary 'messages:uploadedimage',_binary 's:17:\"uploaded \"[[$1]]\"\";'),(_binary 'fr',_binary 'messages:uploaderror',_binary 's:25:\"Erreur lors de l’import\";'),(_binary 'fr',_binary 'messages:uploadfooter',_binary 's:1:\"-\";'),(_binary 'fr',_binary 'messages:uploadinvalidxml',_binary 's:60:\"Le XML dans le fichier importé n’a pas pu être analysé.\";'),(_binary 'fr',_binary 'messages:uploadjava',_binary 's:183:\"C’est un fichier ZIP qui contient un fichier Java .class.\nLe téléversement de fichiers Java n’est pas autorisé, car ils peuvent contourner certaines restrictions de sécurité.\";'),(_binary 'fr',_binary 'messages:uploadlogpage',_binary 's:30:\"Journal d’import de fichiers\";'),(_binary 'fr',_binary 'messages:uploadlogpagetext',_binary 's:142:\"Voici les derniers fichiers téléversés.\nVoyez la [[Special:NewFiles|galerie des nouveaux fichiers]] pour une représentation plus visuelle.\";'),(_binary 'fr',_binary 'messages:uploadnewversion-linktext',_binary 's:43:\"Importer une nouvelle version de ce fichier\";'),(_binary 'fr',_binary 'messages:uploadnologin',_binary 's:13:\"Non connecté\";'),(_binary 'fr',_binary 'messages:uploadnologintext',_binary 's:46:\"Vous devez vous $1 pour importer des fichiers.\";'),(_binary 'fr',_binary 'messages:uploadscripted',_binary 's:121:\"Ce fichier contient du code HTML ou un script qui pourrait être interprété de façon incorrecte par un navigateur web.\";'),(_binary 'fr',_binary 'messages:uploadscriptednamespace',_binary 's:78:\"Ce fichier SVG contient un espace de noms \'<nowiki>$1</nowiki>\' non autorisé.\";'),(_binary 'fr',_binary 'messages:uploadstash',_binary 's:16:\"Cache d’import\";'),(_binary 'fr',_binary 'messages:uploadstash-bad-path',_binary 's:25:\"Le chemin n’existe pas.\";'),(_binary 'fr',_binary 'messages:uploadstash-bad-path-bad-format',_binary 's:56:\"La clé « $1 » n’est pas dans un format correct.\";'),(_binary 'fr',_binary 'messages:uploadstash-bad-path-invalid',_binary 's:29:\"Le chemin n’est pas valide.\";'),(_binary 'fr',_binary 'messages:uploadstash-bad-path-no-handler',_binary 's:62:\"Aucun gestionnaire trouvé pour le type MIME $1 du fichier $2.\";'),(_binary 'fr',_binary 'messages:uploadstash-bad-path-unknown-type',_binary 's:26:\"Type « $1 » inconnu.\";'),(_binary 'fr',_binary 'messages:uploadstash-bad-path-unrecognized-thumb-name',_binary 's:28:\"Nom de vignette non reconnu.\";'),(_binary 'fr',_binary 'messages:uploadstash-badtoken',_binary 's:133:\"L’exécution de cette action a échoué, peut-être parce que vos informations d’identification ont expiré. Veuillez réessayer.\";'),(_binary 'fr',_binary 'messages:uploadstash-clear',_binary 's:38:\"Effacer les fichiers en cache d\'import\";'),(_binary 'fr',_binary 'messages:uploadstash-errclear',_binary 's:39:\"La suppression des fichiers a échoué.\";'),(_binary 'fr',_binary 'messages:uploadstash-exception',_binary 's:78:\"Impossible de stocker le téléversement dans la réserve ($1) : « $2 ».\";'),(_binary 'fr',_binary 'messages:uploadstash-file-not-found',_binary 's:63:\"La clé « $1 » n’a pas été trouvée dans la réserve.\";'),(_binary 'fr',_binary 'messages:uploadstash-file-not-found-missing-content-type',_binary 's:30:\"Entête content-type manquant.\";'),(_binary 'fr',_binary 'messages:uploadstash-file-not-found-no-local-path',_binary 's:58:\"Aucun chemin local pour l’élément mis à l’échelle.\";'),(_binary 'fr',_binary 'messages:uploadstash-file-not-found-no-object',_binary 's:62:\"Impossible de créer l’objet fichier local pour la vignette.\";'),(_binary 'fr',_binary 'messages:uploadstash-file-not-found-no-remote-thumb',_binary 's:57:\"La récupération de la vignette a échoué : $1\nurl = $2\";'),(_binary 'fr',_binary 'messages:uploadstash-file-not-found-no-thumb',_binary 's:36:\"Impossible d’obtenir une vignette.\";'),(_binary 'fr',_binary 'messages:uploadstash-file-not-found-not-exists',_binary 's:67:\"Impossible de trouver le chemin, ou bien ce n’est pas un fichier.\";'),(_binary 'fr',_binary 'messages:uploadstash-file-too-large',_binary 's:58:\"Impossible de fournir un fichier plus grand que $1 octets.\";'),(_binary 'fr',_binary 'messages:uploadstash-no-extension',_binary 's:24:\"L’extension est nulle.\";'),(_binary 'fr',_binary 'messages:uploadstash-no-such-key',_binary 's:47:\"Clé introuvable ($1), impossible de supprimer.\";'),(_binary 'fr',_binary 'messages:uploadstash-nofiles',_binary 's:50:\"Vous n’avez pas de fichiers en cache d’import.\";'),(_binary 'fr',_binary 'messages:uploadstash-not-logged-in',_binary 's:89:\"Aucun utilisateur n’est connecté, les fichiers doivent appartenir à des utilisateurs.\";'),(_binary 'fr',_binary 'messages:uploadstash-refresh',_binary 's:32:\"Actualiser la liste des fichiers\";'),(_binary 'fr',_binary 'messages:uploadstash-summary',_binary 's:222:\"Cette page donne accès aux fichiers qui sont importés (ou en cours d’importation), mais ne sont pas encore publiés dans le wiki. Ces fichiers ne sont pas encore visibles, sauf pour l’utilisateur qui les a importés.\";'),(_binary 'fr',_binary 'messages:uploadstash-thumbnail',_binary 's:20:\"afficher la vignette\";'),(_binary 'fr',_binary 'messages:uploadstash-wrong-owner',_binary 's:62:\"Ce fichier ($1) n’appartient pas à l’utilisateur courant.\";'),(_binary 'fr',_binary 'messages:uploadstash-zero-length',_binary 's:31:\"La taille du fichier est zéro.\";'),(_binary 'fr',_binary 'messages:uploadtext',_binary 's:1052:\"Utilisez ce formulaire pour téléverser des fichiers sur le serveur.\nPour voir ou rechercher des images précédemment envoyées, consultez la [[Special:FileList|liste des fichiers téléversés]]. Les envois multiples sont également tracés dans le [[Special:Log/upload|journal des téléversements]], et les suppressions dans le [[Special:Log/delete|journal des suppressions]].\n\nPour inclure un fichier dans une page, utilisez un lien ayant l\'un des formats suivants :\n* <strong><code><nowiki>[[</nowiki>{{ns:file}}<nowiki>:fichier.jpg]]</nowiki></code></strong>, pour afficher le fichier en pleine résolution (dans le cas d’une image) ;\n* <strong><code><nowiki>[[</nowiki>{{ns:file}}<nowiki>:fichier.png|200px|thumb|left|texte descriptif]]</nowiki></code></strong> pour utiliser une miniature de 200 pixels de large dans une boîte à gauche avec « texte descriptif » comme description ;\n* <strong><code><nowiki>[[</nowiki>{{ns:media}}<nowiki>:fichier.ogg]]</nowiki></code></strong> pour relier directement le fichier sans l’afficher.\";'),(_binary 'fr',_binary 'messages:uploadvirus',_binary 's:68:\"Ce fichier contient un virus ! Pour plus de détails, consultez : $1\";'),(_binary 'fr',_binary 'messages:uploadwarning',_binary 's:11:\"Attention !\";'),(_binary 'fr',_binary 'messages:uploadwarning-text',_binary 's:57:\"Modifiez la description du fichier et essayez de nouveau.\";'),(_binary 'fr',_binary 'messages:uploadwarning-text-nostash',_binary 's:94:\"Veuillez téléverser de nouveau le fichier, modifier la description ci-dessous et réessayer.\";'),(_binary 'fr',_binary 'messages:user-mail-no-addy',_binary 's:60:\"Impossible d’envoyer un courriel sans adresse de courriel.\";'),(_binary 'fr',_binary 'messages:user-mail-no-body',_binary 's:73:\"Essai d’envoi d’un courriel avec un corps vide ou anormalement court.\";'),(_binary 'fr',_binary 'messages:usercreated',_binary 's:32:\"{{GENDER:$3|Créé}} le $1 à $2\";'),(_binary 'fr',_binary 'messages:usercssispublic',_binary 's:144:\"Veuillez noter : les sous-pages CSS ne doivent pas contenir de données confidentielles parce qu’elles sont visibles des autres utilisateurs.\";'),(_binary 'fr',_binary 'messages:usercsspreview',_binary 's:138:\"<strong>Rappelez-vous que vous ne faites que prévisualiser votre propre feuille CSS. \nElle n’a pas encore été enregistrée !</strong>\";'),(_binary 'fr',_binary 'messages:usercssyoucanpreview',_binary 's:135:\"<strong>Astuce :</strong> utilisez le bouton « {{int:showpreview}} » pour tester votre nouvelle feuille CSS avant de l’enregistrer.\";'),(_binary 'fr',_binary 'messages:usereditcount',_binary 's:31:\"$1 modification{{PLURAL:$1||s}}\";'),(_binary 'fr',_binary 'messages:userexists',_binary 's:85:\"Le nom d’utilisateur saisi est déjà utilisé.\nVeuillez choisir un nom différent.\";'),(_binary 'fr',_binary 'messages:userinvalidconfigtitle',_binary 's:243:\"<strong>Attention :</strong> il n’existe pas d’habillage « $1 ». \nLes pages personnelles avec extensions .css, .json et .js utilisent des titres en minuscules, par exemple {{ns:user}}:Foo/vector.css et non {{ns:user}}:Foo/Vector.css.\";'),(_binary 'fr',_binary 'messages:userjsispublic',_binary 's:151:\"Veuillez noter : les sous-pages JavaScript ne doivent pas contenir de données confidentielles parce qu’elles sont visibles des autres utilisateurs.\";'),(_binary 'fr',_binary 'messages:userjsonispublic',_binary 's:137:\"Notez bien : Les sous-pages JSON ne doivent pas contenir de données confidentielles car elles sont visibles par les autres utilisateurs.\";'),(_binary 'fr',_binary 'messages:userjsonpreview',_binary 's:176:\"<strong>Rappelez-vous que vous êtes seulement en train de tester/voir un aperçu de votre configuration utilisateur JSON.\nElle n’a pas encore été enregistrée !</strong>\";'),(_binary 'fr',_binary 'messages:userjsonyoucanpreview',_binary 's:128:\"<strong>Conseil :</strong> Utiliser le bouton « {{int:showpreview}} » pour tester votre nouveau JSON avant enregistrement.\";'),(_binary 'fr',_binary 'messages:userjspreview',_binary 's:137:\"<strong>Rappelez-vous que vous ne faites que visualiser ou tester votre code JavaScript.\nIl n’a pas encore été enregistré !</strong>\";'),(_binary 'fr',_binary 'messages:userjsyoucanpreview',_binary 's:142:\"<strong>Astuce :</strong> utilisez le bouton « {{int:showpreview}} » pour tester votre nouvelle feuille JavaScript avant de l’enregistrer.\";'),(_binary 'fr',_binary 'messages:userlogin-createanother',_binary 's:22:\"Créer un autre compte\";'),(_binary 'fr',_binary 'messages:userlogin-helplink2',_binary 's:22:\"Aide pour se connecter\";'),(_binary 'fr',_binary 'messages:userlogin-joinproject',_binary 's:22:\"Rejoignez {{SITENAME}}\";'),(_binary 'fr',_binary 'messages:userlogin-loggedin',_binary 's:151:\"Vous êtes déjà connecté{{GENDER:$1||e|(e)}} en tant que $1.\nUtilisez le formulaire ci-dessous pour vous connecter avec un autre compte utilisateur.\";'),(_binary 'fr',_binary 'messages:userlogin-noaccount',_binary 's:29:\"Vous n’avez pas de compte ?\";'),(_binary 'fr',_binary 'messages:userlogin-reauth',_binary 's:75:\"Vous devez vous reconnecter pour vérifier que vous êtes {{GENDER:$1|$1}}.\";'),(_binary 'fr',_binary 'messages:userlogin-remembermypassword',_binary 's:24:\"Garder ma session active\";'),(_binary 'fr',_binary 'messages:userlogin-resetpassword-link',_binary 's:24:\"Mot de passe oublié ?\";'),(_binary 'fr',_binary 'messages:userlogin-signwithsecure',_binary 's:34:\"Utiliser une connexion sécurisée\";'),(_binary 'fr',_binary 'messages:userlogin-yourname',_binary 's:19:\"Nom d’utilisateur\";'),(_binary 'fr',_binary 'messages:userlogin-yourname-ph',_binary 's:32:\"Entrez votre nom d’utilisateur\";'),(_binary 'fr',_binary 'messages:userlogin-yourpassword',_binary 's:12:\"Mot de passe\";'),(_binary 'fr',_binary 'messages:userlogin-yourpassword-ph',_binary 's:25:\"Entrez votre mot de passe\";'),(_binary 'fr',_binary 'messages:userlogout',_binary 's:12:\"Déconnexion\";'),(_binary 'fr',_binary 'messages:userlogout-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:usermaildisabled',_binary 's:55:\"L\'envoi de courriels entre utilisateurs est désactivé\";'),(_binary 'fr',_binary 'messages:usermaildisabledtext',_binary 's:76:\"Vous ne pouvez pas envoyer de courriels à d\'autres utilisateurs sur ce wiki\";'),(_binary 'fr',_binary 'messages:usermessage-editor',_binary 's:20:\"Messager du système\";'),(_binary 'fr',_binary 'messages:usermessage-summary',_binary 's:28:\"Laisser un message système.\";'),(_binary 'fr',_binary 'messages:usermessage-template',_binary 's:21:\"MediaWiki:UserMessage\";'),(_binary 'fr',_binary 'messages:username',_binary 's:52:\"{{GENDER:$1|Nom d\'utilisateur|Nom d\'utilisatrice}} :\";'),(_binary 'fr',_binary 'messages:usernameinprogress',_binary 's:92:\"Une création de compte pour ce nom d’utilisateur est déjà en cours.\nVeuillez patienter.\";'),(_binary 'fr',_binary 'messages:userpage-userdoesnotexist',_binary 's:126:\"Le compte utilisateur « <nowiki>$1</nowiki> » n’est pas enregistré. Veuillez vérifier que vous voulez créer cette page.\";'),(_binary 'fr',_binary 'messages:userpage-userdoesnotexist-view',_binary 's:53:\"Le compte utilisateur « $1 » n\'est pas enregistré.\";'),(_binary 'fr',_binary 'messages:userrights',_binary 's:23:\"Droits des utilisateurs\";'),(_binary 'fr',_binary 'messages:userrights-cannot-shorten-expiry',_binary 's:236:\"Vous ne pouvez pas raccourcir la durée d’expiration de l’appartenance au groupe « $1 ». Seuls les utilisateurs disposant de l’autorisation d’ajouter et de supprimer ce groupe peuvent raccourcir les durées d’expiration.\";'),(_binary 'fr',_binary 'messages:userrights-changeable-col',_binary 's:36:\"Les groupes que vous pouvez modifier\";'),(_binary 'fr',_binary 'messages:userrights-conflict',_binary 's:98:\"Conflit de modification des droits utilisateur ! Veuillez relire et confirmer vos modifications.\";'),(_binary 'fr',_binary 'messages:userrights-editusergroup',_binary 's:56:\"Modifier les groupes de l\'utilisat{{GENDER:$1|eur|rice}}\";'),(_binary 'fr',_binary 'messages:userrights-expiry',_binary 's:21:\"Date d’expiration :\";'),(_binary 'fr',_binary 'messages:userrights-expiry-current',_binary 's:12:\"Expire le $1\";'),(_binary 'fr',_binary 'messages:userrights-expiry-existing',_binary 's:38:\"Date d\'expiration existante : $2 à $3\";'),(_binary 'fr',_binary 'messages:userrights-expiry-in-past',_binary 's:60:\"La date d\'expiration pour le groupe « $1 » est dépassée.\";'),(_binary 'fr',_binary 'messages:userrights-expiry-none',_binary 's:12:\"N\'expire pas\";'),(_binary 'fr',_binary 'messages:userrights-expiry-options',_binary 's:88:\"1 jour:1 day,1 semaine:1 week,1 mois:1 month,3 mois:3 montghs,6 mois:6 month,1 an:1 year\";'),(_binary 'fr',_binary 'messages:userrights-expiry-othertime',_binary 's:13:\"Autre temps :\";'),(_binary 'fr',_binary 'messages:userrights-groups-help',_binary 's:547:\"Vous pouvez modifier les groupes auxquels appartient {{GENDER:$1|cet utilisateur|cette utilisatrice}} :\n* Une case cochée signifie que {{GENDER:$1|l’utilisateur|l’utilisatrice}} se trouve dans ce groupe.\n* Une case non cochée signifie qu’{{GENDER:$1|il|elle}} ne s’y trouve pas.\n* Un astérisque (*) indique que vous ne pouvez pas retirer ce groupe une fois que vous l’avez ajouté, ou vice-versa.\n* Un dièse (#) indique que vous ne pouvez que rallonger le délai d’expiration de l’appartenance au groupe et non pas le raccourcir.\";'),(_binary 'fr',_binary 'messages:userrights-groupsmember',_binary 's:11:\"Membre de :\";'),(_binary 'fr',_binary 'messages:userrights-groupsmember-auto',_binary 's:21:\"Membre implicite de :\";'),(_binary 'fr',_binary 'messages:userrights-groupsmember-type',_binary 's:2:\"$1\";'),(_binary 'fr',_binary 'messages:userrights-invalid-expiry',_binary 's:62:\"La date d\'expiration pour le groupe « $1 » n\'est pas valide.\";'),(_binary 'fr',_binary 'messages:userrights-irreversible-marker',_binary 's:3:\"$1*\";'),(_binary 'fr',_binary 'messages:userrights-lookup-user',_binary 's:28:\"Sélectionner un utilisateur\";'),(_binary 'fr',_binary 'messages:userrights-no-interwiki',_binary 's:84:\"Vous n\'avez pas la permission de modifier les droits utilisateur sur d\'autres wikis.\";'),(_binary 'fr',_binary 'messages:userrights-no-shorten-expiry-marker',_binary 's:3:\"$1#\";'),(_binary 'fr',_binary 'messages:userrights-nodatabase',_binary 's:62:\"La base de données « $1 » n\'existe pas ou n\'est pas locale.\";'),(_binary 'fr',_binary 'messages:userrights-reason',_binary 's:7:\"Motif :\";'),(_binary 'fr',_binary 'messages:userrights-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:userrights-unchangeable-col',_binary 's:43:\"Les groupes que vous ne pouvez pas modifier\";'),(_binary 'fr',_binary 'messages:userrights-user-editname',_binary 's:29:\"Entrez un nom d\'utilisateur :\";'),(_binary 'fr',_binary 'messages:userrights-viewusergroup',_binary 's:58:\"Afficher les groupes de l’utilisat{{GENDER:$1|eur|rice}}\";'),(_binary 'fr',_binary 'messages:variantname-crh',_binary 's:3:\"crh\";'),(_binary 'fr',_binary 'messages:variantname-crh-cyrl',_binary 's:8:\"crh-Cyrl\";'),(_binary 'fr',_binary 'messages:variantname-crh-latn',_binary 's:8:\"crh-Latn\";'),(_binary 'fr',_binary 'messages:variantname-gan',_binary 's:3:\"gan\";'),(_binary 'fr',_binary 'messages:variantname-gan-hans',_binary 's:4:\"hans\";'),(_binary 'fr',_binary 'messages:variantname-gan-hant',_binary 's:4:\"hant\";'),(_binary 'fr',_binary 'messages:variantname-ike-cans',_binary 's:8:\"ike-cans\";'),(_binary 'fr',_binary 'messages:variantname-ike-latn',_binary 's:8:\"ike-latn\";'),(_binary 'fr',_binary 'messages:variantname-iu',_binary 's:2:\"iu\";'),(_binary 'fr',_binary 'messages:variantname-kk',_binary 's:2:\"kk\";'),(_binary 'fr',_binary 'messages:variantname-kk-arab',_binary 's:7:\"kk-arab\";'),(_binary 'fr',_binary 'messages:variantname-kk-cn',_binary 's:5:\"kk-cn\";'),(_binary 'fr',_binary 'messages:variantname-kk-cyrl',_binary 's:7:\"kk-cyrl\";'),(_binary 'fr',_binary 'messages:variantname-kk-kz',_binary 's:5:\"kk-kz\";'),(_binary 'fr',_binary 'messages:variantname-kk-latn',_binary 's:7:\"kk-latn\";'),(_binary 'fr',_binary 'messages:variantname-kk-tr',_binary 's:5:\"kk-tr\";'),(_binary 'fr',_binary 'messages:variantname-ku',_binary 's:2:\"ku\";'),(_binary 'fr',_binary 'messages:variantname-ku-arab',_binary 's:7:\"ku-arab\";'),(_binary 'fr',_binary 'messages:variantname-ku-latn',_binary 's:7:\"ku-latn\";'),(_binary 'fr',_binary 'messages:variantname-shi',_binary 's:3:\"shi\";'),(_binary 'fr',_binary 'messages:variantname-shi-latn',_binary 's:8:\"shi-latn\";'),(_binary 'fr',_binary 'messages:variantname-shi-tfng',_binary 's:8:\"shi-tfng\";'),(_binary 'fr',_binary 'messages:variantname-sr',_binary 's:2:\"sr\";'),(_binary 'fr',_binary 'messages:variantname-sr-ec',_binary 's:5:\"sr-ec\";'),(_binary 'fr',_binary 'messages:variantname-sr-el',_binary 's:5:\"sr-el\";'),(_binary 'fr',_binary 'messages:variantname-tg',_binary 's:2:\"tg\";'),(_binary 'fr',_binary 'messages:variantname-tg-cyrl',_binary 's:7:\"tg-cyrl\";'),(_binary 'fr',_binary 'messages:variantname-tg-latn',_binary 's:7:\"tg-latn\";'),(_binary 'fr',_binary 'messages:variantname-uz',_binary 's:2:\"uz\";'),(_binary 'fr',_binary 'messages:variantname-uz-cyrl',_binary 's:7:\"uz-Cyrl\";'),(_binary 'fr',_binary 'messages:variantname-uz-latn',_binary 's:7:\"uz-Latn\";'),(_binary 'fr',_binary 'messages:variantname-zh',_binary 's:2:\"zh\";'),(_binary 'fr',_binary 'messages:variantname-zh-cn',_binary 's:2:\"cn\";'),(_binary 'fr',_binary 'messages:variantname-zh-hans',_binary 's:4:\"hans\";'),(_binary 'fr',_binary 'messages:variantname-zh-hant',_binary 's:4:\"hant\";'),(_binary 'fr',_binary 'messages:variantname-zh-hk',_binary 's:2:\"hk\";'),(_binary 'fr',_binary 'messages:variantname-zh-mo',_binary 's:2:\"mo\";'),(_binary 'fr',_binary 'messages:variantname-zh-my',_binary 's:2:\"my\";'),(_binary 'fr',_binary 'messages:variantname-zh-sg',_binary 's:2:\"sg\";'),(_binary 'fr',_binary 'messages:variantname-zh-tw',_binary 's:2:\"tw\";'),(_binary 'fr',_binary 'messages:variants',_binary 's:9:\"Variantes\";'),(_binary 'fr',_binary 'messages:vector-action-addsection',_binary 's:16:\"Ajouter un sujet\";'),(_binary 'fr',_binary 'messages:vector-action-delete',_binary 's:9:\"Supprimer\";'),(_binary 'fr',_binary 'messages:vector-action-move',_binary 's:8:\"Renommer\";'),(_binary 'fr',_binary 'messages:vector-action-protect',_binary 's:9:\"Protéger\";'),(_binary 'fr',_binary 'messages:vector-action-undelete',_binary 's:9:\"Rétablir\";'),(_binary 'fr',_binary 'messages:vector-action-unprotect',_binary 's:21:\"Changer la protection\";'),(_binary 'fr',_binary 'messages:vector-jumptonavigation',_binary 's:23:\"Sauter à la navigation\";'),(_binary 'fr',_binary 'messages:vector-jumptosearch',_binary 's:22:\"Sauter à la recherche\";'),(_binary 'fr',_binary 'messages:vector-more-actions',_binary 's:4:\"Plus\";'),(_binary 'fr',_binary 'messages:vector-skin-desc',_binary 's:94:\"Version moderne de MonoBook avec un aspect rajeuni et beaucoup d’améliorations ergonomiques\";'),(_binary 'fr',_binary 'messages:vector-view-create',_binary 's:6:\"Créer\";'),(_binary 'fr',_binary 'messages:vector-view-edit',_binary 's:8:\"Modifier\";'),(_binary 'fr',_binary 'messages:vector-view-history',_binary 's:19:\"Voir l’historique\";'),(_binary 'fr',_binary 'messages:vector-view-view',_binary 's:4:\"Lire\";'),(_binary 'fr',_binary 'messages:vector-view-viewsource',_binary 's:14:\"Voir la source\";'),(_binary 'fr',_binary 'messages:vector.css',_binary 's:75:\"/* Le CSS placé ici affectera les utilisateurs de l’habillage Vector. */\";'),(_binary 'fr',_binary 'messages:vector.js',_binary 's:96:\"/* Tout code JavaScript placé ici sera chargé pour les utilisateurs de l’habillage Vector */\";'),(_binary 'fr',_binary 'messages:verification-error',_binary 's:54:\"Ce fichier ne passe pas la vérification des fichiers.\";'),(_binary 'fr',_binary 'messages:version',_binary 's:7:\"Version\";'),(_binary 'fr',_binary 'messages:version-antispam',_binary 's:27:\"Prévention du pollupostage\";'),(_binary 'fr',_binary 'messages:version-api',_binary 's:3:\"API\";'),(_binary 'fr',_binary 'messages:version-credits-not-found',_binary 's:89:\"Aucune information détaillée des remerciements n\'a été trouvée pour cette extension.\";'),(_binary 'fr',_binary 'messages:version-credits-summary',_binary 's:106:\"Nous tenons à remercier les personnes suivantes pour leur contribution à  [[Special:Version|MediaWiki]].\";'),(_binary 'fr',_binary 'messages:version-credits-title',_binary 's:21:\"Remerciements pour $1\";'),(_binary 'fr',_binary 'messages:version-db-mariadb-url',_binary 's:20:\"https://mariadb.org/\";'),(_binary 'fr',_binary 'messages:version-db-mssql-url',_binary 's:30:\"https://www.microsoft.com/sql/\";'),(_binary 'fr',_binary 'messages:version-db-mysql-url',_binary 's:22:\"https://www.mysql.com/\";'),(_binary 'fr',_binary 'messages:version-db-oracle-url',_binary 's:31:\"http://www.oracle.com/database/\";'),(_binary 'fr',_binary 'messages:version-db-percona-url',_binary 's:46:\"http://www.percona.com/software/percona-server\";'),(_binary 'fr',_binary 'messages:version-db-postgres-url',_binary 's:26:\"http://www.postgresql.org/\";'),(_binary 'fr',_binary 'messages:version-db-sqlite-url',_binary 's:23:\"https://www.sqlite.org/\";'),(_binary 'fr',_binary 'messages:version-editors',_binary 's:9:\"Éditeurs\";'),(_binary 'fr',_binary 'messages:version-entrypoints',_binary 's:24:\"URL des points d\'entrée\";'),(_binary 'fr',_binary 'messages:version-entrypoints-api-php',_binary 's:74:\"[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:api.php api.php]\";'),(_binary 'fr',_binary 'messages:version-entrypoints-articlepath',_binary 's:92:\"[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgArticlePath Chemin d’article]\";'),(_binary 'fr',_binary 'messages:version-entrypoints-header-entrypoint',_binary 's:15:\"Point d\'entrée\";'),(_binary 'fr',_binary 'messages:version-entrypoints-header-url',_binary 's:3:\"URL\";'),(_binary 'fr',_binary 'messages:version-entrypoints-index-php',_binary 's:78:\"[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:index.php index.php]\";'),(_binary 'fr',_binary 'messages:version-entrypoints-load-php',_binary 's:76:\"[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:load.php load.php]\";'),(_binary 'fr',_binary 'messages:version-entrypoints-scriptpath',_binary 's:89:\"[https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:$wgScriptPath Chemin de script]\";'),(_binary 'fr',_binary 'messages:version-ext-colheader-credits',_binary 's:7:\"Auteurs\";'),(_binary 'fr',_binary 'messages:version-ext-colheader-description',_binary 's:11:\"Description\";'),(_binary 'fr',_binary 'messages:version-ext-colheader-license',_binary 's:7:\"Licence\";'),(_binary 'fr',_binary 'messages:version-ext-colheader-name',_binary 's:9:\"Extension\";'),(_binary 'fr',_binary 'messages:version-ext-colheader-version',_binary 's:7:\"Version\";'),(_binary 'fr',_binary 'messages:version-ext-license',_binary 's:7:\"Licence\";'),(_binary 'fr',_binary 'messages:version-extensions',_binary 's:22:\"Extensions installées\";'),(_binary 'fr',_binary 'messages:version-hook-name',_binary 's:14:\"Nom du greffon\";'),(_binary 'fr',_binary 'messages:version-hook-subscribedby',_binary 's:10:\"Abonnés :\";'),(_binary 'fr',_binary 'messages:version-hooks',_binary 's:8:\"Greffons\";'),(_binary 'fr',_binary 'messages:version-libraries',_binary 's:26:\"Bibliothèques installées\";'),(_binary 'fr',_binary 'messages:version-libraries-authors',_binary 's:7:\"Auteurs\";'),(_binary 'fr',_binary 'messages:version-libraries-description',_binary 's:11:\"Description\";'),(_binary 'fr',_binary 'messages:version-libraries-library',_binary 's:13:\"Bibliothèque\";'),(_binary 'fr',_binary 'messages:version-libraries-license',_binary 's:7:\"Licence\";'),(_binary 'fr',_binary 'messages:version-libraries-version',_binary 's:7:\"Version\";'),(_binary 'fr',_binary 'messages:version-license',_binary 's:17:\"Licence MediaWiki\";'),(_binary 'fr',_binary 'messages:version-license-info',_binary 's:880:\"MediaWiki est un logiciel libre, vous pouvez le redistribuer ou le modifier selon les termes de la Licence Publique Générale GNU telle que publiée par la Free Software Foundation ; soit la version 2 de la Licence, ou (à votre choix) toute version ultérieure.\n\nMediaWiki est distribué dans l’espoir qu\'il sera utile, mais <em>SANS AUCUNE GARANTIE</em>, sans même la garantie implicite de <strong>COMMERCIALISABILITÉ</strong> ou <strong>D’ADÉQUATION À UN USAGE PARTICULIER</strong>. Voir la Licence Publique Générale GNU pour plus de détails.\n\nVous devriez avoir reçu [{{SERVER}}{{SCRIPTPATH}}/COPYING une copie de la Licence Publique Générale GNU] avec ce programme, sinon, écrivez à la Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, États-Unis ou [//www.gnu.org/licenses/old-licenses/gpl-2.0.html lisez-la en ligne].\";'),(_binary 'fr',_binary 'messages:version-license-not-found',_binary 's:85:\"Aucune information détaillée de la licence n\'a été trouvée pour cette extension.\";'),(_binary 'fr',_binary 'messages:version-license-title',_binary 's:15:\"Licence pour $1\";'),(_binary 'fr',_binary 'messages:version-mediahandlers',_binary 's:24:\"Manipulateurs de médias\";'),(_binary 'fr',_binary 'messages:version-no-ext-name',_binary 's:12:\"[pas de nom]\";'),(_binary 'fr',_binary 'messages:version-other',_binary 's:6:\"Divers\";'),(_binary 'fr',_binary 'messages:version-parser-extensiontags',_binary 's:43:\"Balises étendues de l\'analyseur syntaxique\";'),(_binary 'fr',_binary 'messages:version-parser-function-hooks',_binary 's:45:\"Fonctions étendues de l\'analyseur syntaxique\";'),(_binary 'fr',_binary 'messages:version-parserhooks',_binary 's:34:\"Greffons de l\'analyseur syntaxique\";'),(_binary 'fr',_binary 'messages:version-poweredby-credits',_binary 's:110:\"Ce wiki fonctionne grâce à <strong>[https://www.mediawiki.org/ MediaWiki]</strong>, copyright © 2001-$1 $2.\";'),(_binary 'fr',_binary 'messages:version-poweredby-others',_binary 's:6:\"autres\";'),(_binary 'fr',_binary 'messages:version-poweredby-translators',_binary 's:32:\"traducteurs de translatewiki.net\";'),(_binary 'fr',_binary 'messages:version-skin-colheader-name',_binary 's:9:\"Habillage\";'),(_binary 'fr',_binary 'messages:version-skins',_binary 's:21:\"Habillages installés\";'),(_binary 'fr',_binary 'messages:version-software',_binary 's:20:\"Logiciels installés\";'),(_binary 'fr',_binary 'messages:version-software-product',_binary 's:7:\"Produit\";'),(_binary 'fr',_binary 'messages:version-software-version',_binary 's:7:\"Version\";'),(_binary 'fr',_binary 'messages:version-specialpages',_binary 's:16:\"Pages spéciales\";'),(_binary 'fr',_binary 'messages:version-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:version-variables',_binary 's:9:\"Variables\";'),(_binary 'fr',_binary 'messages:version-version',_binary 's:4:\"($1)\";'),(_binary 'fr',_binary 'messages:versionrequired',_binary 's:35:\"Version $1 de MediaWiki nécessaire\";'),(_binary 'fr',_binary 'messages:versionrequiredtext',_binary 's:120:\"La version $1 de MediaWiki est nécessaire pour utiliser cette page.\nConsultez [[Special:Version|la page des versions]].\";'),(_binary 'fr',_binary 'messages:video-dims',_binary 's:22:\"$1, $2&nbsp;×&nbsp;$3\";'),(_binary 'fr',_binary 'messages:view',_binary 's:4:\"Lire\";'),(_binary 'fr',_binary 'messages:view-foreign',_binary 's:11:\"Voir sur $1\";'),(_binary 'fr',_binary 'messages:view-pool-error',_binary 's:194:\"Désolé, les serveurs sont surchargés en ce moment.\nTrop d’utilisateurs cherchent à consulter cette page.\nVeuillez attendre un peu avant d’essayer à nouveau d’accéder à celle-ci.\n\n$1\";'),(_binary 'fr',_binary 'messages:viewcount',_binary 's:120:\"Cette page {{PLURAL:$1|0=n’a jamais été consultée|1=a été consultée une seule fois|a été consultée $1 fois}}.\";'),(_binary 'fr',_binary 'messages:viewdeleted',_binary 's:9:\"Voir $1 ?\";'),(_binary 'fr',_binary 'messages:viewdeleted_short',_binary 's:75:\"Voir {{PLURAL:$1|une modification supprimée|$1 modifications supprimées}}\";'),(_binary 'fr',_binary 'messages:viewdeletedpage',_binary 's:26:\"Voir les pages supprimées\";'),(_binary 'fr',_binary 'messages:viewhelppage',_binary 's:19:\"Voir la page d\'aide\";'),(_binary 'fr',_binary 'messages:viewinguserrights',_binary 's:109:\"Affichage des droits d’utilisateur de l’utilisat{{GENDER:$1|eur|rice}} <strong>[[User:$1|$1]]</strong> $2\";'),(_binary 'fr',_binary 'messages:viewpagelogs',_binary 's:35:\"Voir les opérations sur cette page\";'),(_binary 'fr',_binary 'messages:viewprevnext',_binary 's:40:\"Voir ($1 {{int:pipe-separator}} $2) ($3)\";'),(_binary 'fr',_binary 'messages:views',_binary 's:10:\"Affichages\";'),(_binary 'fr',_binary 'messages:viewsource',_binary 's:20:\"Voir le texte source\";'),(_binary 'fr',_binary 'messages:viewsource-title',_binary 's:20:\"Voir la source de $1\";'),(_binary 'fr',_binary 'messages:viewsourcelink',_binary 's:14:\"voir la source\";'),(_binary 'fr',_binary 'messages:viewsourceold',_binary 's:14:\"voir la source\";'),(_binary 'fr',_binary 'messages:viewsourcetext',_binary 's:52:\"Vous pouvez voir et copier le contenu de cette page.\";'),(_binary 'fr',_binary 'messages:viewtalkpage',_binary 's:26:\"Voir la page de discussion\";'),(_binary 'fr',_binary 'messages:viewyourtext',_binary 's:90:\"Vous pouvez voir et copier le contenu de <strong>vos modifications</strong> à cette page.\";'),(_binary 'fr',_binary 'messages:virus-badscanner',_binary 's:65:\"Mauvaise configuration : analyseur de virus inconnu : <em>$1</em>\";'),(_binary 'fr',_binary 'messages:virus-scanfailed',_binary 's:31:\"échec de l’analyse (code $1)\";'),(_binary 'fr',_binary 'messages:virus-unknownscanner',_binary 's:19:\"antivirus inconnu :\";'),(_binary 'fr',_binary 'messages:wantedcategories',_binary 's:31:\"Catégories les plus demandées\";'),(_binary 'fr',_binary 'messages:wantedcategories-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:wantedfiles',_binary 's:27:\"Fichiers les plus demandés\";'),(_binary 'fr',_binary 'messages:wantedfiles-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:wantedfiletext-cat',_binary 's:348:\"Les fichiers suivants sont utilisés, mais n\'existent pas localement. Les fichiers qui se trouvent sur un dépôt externe peuvent être listés ici, bien qu\'ils soient, de fait, déjà disponibles. Tous ces faux positifs seront <del>barrés</del>. En outre, les pages qui intègrent des fichiers qui n\'existent pas sont répertoriées dans [[:$1]].\";'),(_binary 'fr',_binary 'messages:wantedfiletext-cat-noforeign',_binary 's:151:\"Les fichiers suivants sont utilisés mais n\'existent pas. De plus, les pages qui intègrent les fichiers qui n\'existent pas sont listées dans [[:$1]].\";'),(_binary 'fr',_binary 'messages:wantedfiletext-nocat',_binary 's:242:\"Les fichiers suivants sont utilisés, mais n\'existent pas localement. S\'ils se trouvent sur un dépôt partagé, ils peuvent être listés ici, bien qu\'ils soient, de fait, déjà disponibles. Tous ces faux positifs seront <del>barrés</del>.\";'),(_binary 'fr',_binary 'messages:wantedfiletext-nocat-noforeign',_binary 's:57:\"Les fichiers suivants sont utilisés mais n\'existent pas.\";'),(_binary 'fr',_binary 'messages:wantedpages',_binary 's:25:\"Pages les plus demandées\";'),(_binary 'fr',_binary 'messages:wantedpages-badtitle',_binary 's:39:\"Titre invalide dans les résultats : $1\";'),(_binary 'fr',_binary 'messages:wantedpages-summary',_binary 's:302:\"Liste des pages inexistantes ayant le plus de liens vers elles, en excluant les pages n’ayant que des redirections pointant vers elles. Pour avoir une liste des pages inexistantes qui ont des redirections pointant vers elles, voyez [[{{#special:BrokenRedirects}}|la liste des redirections cassées]].\";'),(_binary 'fr',_binary 'messages:wantedtemplates',_binary 's:18:\"Modèles demandés\";'),(_binary 'fr',_binary 'messages:wantedtemplates-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:watch',_binary 's:6:\"Suivre\";'),(_binary 'fr',_binary 'messages:watcherrortext',_binary 's:104:\"Une erreur s\'est produite lors de la modification des paramètres de votre liste de suivi pour « $1 ».\";'),(_binary 'fr',_binary 'messages:watching',_binary 's:8:\"Suivi…\";'),(_binary 'fr',_binary 'messages:watchlist',_binary 's:14:\"Liste de suivi\";'),(_binary 'fr',_binary 'messages:watchlist-details',_binary 's:97:\"{{PLURAL:$1|$1 page est|$1 pages sont}} dans votre liste de suivi (plus les pages de discussion).\";'),(_binary 'fr',_binary 'messages:watchlist-hide',_binary 's:7:\"Masquer\";'),(_binary 'fr',_binary 'messages:watchlist-options',_binary 's:28:\"Options de la liste de suivi\";'),(_binary 'fr',_binary 'messages:watchlist-submit',_binary 's:6:\"Lister\";'),(_binary 'fr',_binary 'messages:watchlist-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:watchlist-unwatch',_binary 's:2:\"×\";'),(_binary 'fr',_binary 'messages:watchlist-unwatch-undo',_binary 's:1:\"+\";'),(_binary 'fr',_binary 'messages:watchlistanontext',_binary 's:91:\"Veuillez vous connecter pour visualiser ou modifier les éléments de votre liste de suivi.\";'),(_binary 'fr',_binary 'messages:watchlistedit-clear-done',_binary 's:38:\"Votre liste de suivi a été effacée.\";'),(_binary 'fr',_binary 'messages:watchlistedit-clear-explain',_binary 's:57:\"Tous les titres seront supprimés de votre liste de suivi\";'),(_binary 'fr',_binary 'messages:watchlistedit-clear-jobqueue',_binary 's:86:\"Votre liste de suivi est en cours de supression. Ce qui peut prendre un certain temps.\";'),(_binary 'fr',_binary 'messages:watchlistedit-clear-legend',_binary 's:25:\"Effacer la liste de suivi\";'),(_binary 'fr',_binary 'messages:watchlistedit-clear-removed',_binary 's:61:\"{{PLURAL:$1|Un titre a été|$1 titres ont été}} retirés :\";'),(_binary 'fr',_binary 'messages:watchlistedit-clear-submit',_binary 's:48:\"Effacer la liste de suivi (ceci est permanent !)\";'),(_binary 'fr',_binary 'messages:watchlistedit-clear-title',_binary 's:23:\"Vider la liste de suivi\";'),(_binary 'fr',_binary 'messages:watchlistedit-clear-titles',_binary 's:8:\"Titres :\";'),(_binary 'fr',_binary 'messages:watchlistedit-normal-done',_binary 's:93:\"{{PLURAL:$1|Un titre a été enlevé|$1 titres ont été enlevés}} de votre liste de suivi :\";'),(_binary 'fr',_binary 'messages:watchlistedit-normal-explain',_binary 's:297:\"Les titres de votre liste de suivi sont visibles ci-dessous.\nPour enlever un titre de la liste (et sa page de discussion), cochez la case à côté puis cliquez sur le bouton « {{int:Watchlistedit-normal-submit}} ».\nVous pouvez aussi [[Special:EditWatchlist/raw|modifier la liste en mode brut]].\";'),(_binary 'fr',_binary 'messages:watchlistedit-normal-legend',_binary 's:39:\"Retirer des titres de la liste de suivi\";'),(_binary 'fr',_binary 'messages:watchlistedit-normal-submit',_binary 's:33:\"Retirer les titres sélectionnés\";'),(_binary 'fr',_binary 'messages:watchlistedit-normal-title',_binary 's:26:\"Modifier la liste de suivi\";'),(_binary 'fr',_binary 'messages:watchlistedit-raw-added',_binary 's:69:\"{{PLURAL:$1|Un titre a été ajouté|$1 titres ont été ajoutés}} :\";'),(_binary 'fr',_binary 'messages:watchlistedit-raw-done',_binary 's:42:\"Votre liste de suivi a été mise à jour.\";'),(_binary 'fr',_binary 'messages:watchlistedit-raw-explain',_binary 's:318:\"Les titres de votre liste de suivi sont affichés ci-dessous et peuvent être modifiés en les ajoutant ou les retirant de la liste (un titre par ligne).\nLorsque vous avez fini, cliquez sur le bouton « {{int:Watchlistedit-raw-submit}} » en bas.\nVous pouvez aussi [[Special:EditWatchlist|utiliser l\'éditeur normal]].\";'),(_binary 'fr',_binary 'messages:watchlistedit-raw-legend',_binary 's:46:\"Modification de la liste de suivi en mode brut\";'),(_binary 'fr',_binary 'messages:watchlistedit-raw-removed',_binary 's:69:\"{{PLURAL:$1|Un titre a été retiré|$1 titres ont été retirés}} :\";'),(_binary 'fr',_binary 'messages:watchlistedit-raw-submit',_binary 's:32:\"Mettre à jour la liste de suivi\";'),(_binary 'fr',_binary 'messages:watchlistedit-raw-title',_binary 's:39:\"Modifier la liste de suivi en mode brut\";'),(_binary 'fr',_binary 'messages:watchlistedit-raw-titles',_binary 's:8:\"Titres :\";'),(_binary 'fr',_binary 'messages:watchlistedit-too-many',_binary 's:37:\"Il y a trop de pages à afficher ici.\";'),(_binary 'fr',_binary 'messages:watchlistfor2',_binary 's:10:\"Pour $1 $2\";'),(_binary 'fr',_binary 'messages:watchlisttools-clear',_binary 's:25:\"Effacer la liste de suivi\";'),(_binary 'fr',_binary 'messages:watchlisttools-edit',_binary 's:34:\"Voir et modifier la liste de suivi\";'),(_binary 'fr',_binary 'messages:watchlisttools-raw',_binary 's:39:\"Modifier la liste de suivi en mode brut\";'),(_binary 'fr',_binary 'messages:watchlisttools-view',_binary 's:35:\"Voir les changements correspondants\";'),(_binary 'fr',_binary 'messages:watchnologin',_binary 's:13:\"Non connecté\";'),(_binary 'fr',_binary 'messages:watchthis',_binary 's:17:\"Suivre cette page\";'),(_binary 'fr',_binary 'messages:watchthispage',_binary 's:17:\"Suivre cette page\";'),(_binary 'fr',_binary 'messages:watchthisupload',_binary 's:17:\"Suivre ce fichier\";'),(_binary 'fr',_binary 'messages:wed',_binary 's:4:\"Mer.\";'),(_binary 'fr',_binary 'messages:wednesday',_binary 's:8:\"mercredi\";'),(_binary 'fr',_binary 'messages:wednesday-at',_binary 's:14:\"Mercredi à $1\";'),(_binary 'fr',_binary 'messages:weeks',_binary 's:36:\"{{PLURAL:$1|$1 semaine|$1 semaines}}\";'),(_binary 'fr',_binary 'messages:welcomecreation-msg',_binary 's:131:\"Votre compte a été créé.\nVous pouvez modifier [[Special:Preferences|vos préférences]] pour {{SITENAME}} si vous le souhaitez.\";'),(_binary 'fr',_binary 'messages:welcomeuser',_binary 's:15:\"Bienvenue, $1 !\";'),(_binary 'fr',_binary 'messages:whatlinkshere',_binary 's:12:\"Pages liées\";'),(_binary 'fr',_binary 'messages:whatlinkshere-filters',_binary 's:7:\"Filtres\";'),(_binary 'fr',_binary 'messages:whatlinkshere-hideimages',_binary 's:28:\"$1 les liens vers le fichier\";'),(_binary 'fr',_binary 'messages:whatlinkshere-hidelinks',_binary 's:12:\"$1 les liens\";'),(_binary 'fr',_binary 'messages:whatlinkshere-hideredirs',_binary 's:19:\"$1 les redirections\";'),(_binary 'fr',_binary 'messages:whatlinkshere-hidetrans',_binary 's:17:\"$1 les inclusions\";'),(_binary 'fr',_binary 'messages:whatlinkshere-links',_binary 's:9:\"← liens\";'),(_binary 'fr',_binary 'messages:whatlinkshere-next',_binary 's:35:\"{{PLURAL:$1|suivante|$1 suivantes}}\";'),(_binary 'fr',_binary 'messages:whatlinkshere-page',_binary 's:6:\"Page :\";'),(_binary 'fr',_binary 'messages:whatlinkshere-prev',_binary 's:43:\"{{PLURAL:$1|précédente|$1 précédentes}}\";'),(_binary 'fr',_binary 'messages:whatlinkshere-submit',_binary 's:6:\"Lister\";'),(_binary 'fr',_binary 'messages:whatlinkshere-summary',_binary 's:0:\"\";'),(_binary 'fr',_binary 'messages:whatlinkshere-title',_binary 's:32:\"Pages qui pointent vers « $1 »\";'),(_binary 'fr',_binary 'messages:whitelistedittext',_binary 's:67:\"Vous devez vous $1 pour avoir la permission de modifier le contenu.\";'),(_binary 'fr',_binary 'messages:widthheight',_binary 's:18:\"$1&nbsp;×&nbsp;$2\";'),(_binary 'fr',_binary 'messages:widthheightpage',_binary 's:33:\"$1 × $2, $3 page{{PLURAL:$3||s}}\";'),(_binary 'fr',_binary 'messages:windows-nonascii-filename',_binary 's:83:\"Ce wiki ne prend pas en charge les noms de fichiers avec des caractères spéciaux.\";'),(_binary 'fr',_binary 'messages:withoutinterwiki',_binary 's:30:\"Pages sans liens inter-langues\";'),(_binary 'fr',_binary 'messages:withoutinterwiki-legend',_binary 's:8:\"Préfixe\";'),(_binary 'fr',_binary 'messages:withoutinterwiki-submit',_binary 's:8:\"Afficher\";'),(_binary 'fr',_binary 'messages:withoutinterwiki-summary',_binary 's:70:\"Les pages suivantes ne possèdent pas de liens vers d\'autres langues :\";'),(_binary 'fr',_binary 'messages:wlheader-enotif',_binary 's:42:\"La notification par courriel est activée.\";'),(_binary 'fr',_binary 'messages:wlheader-showupdated',_binary 's:106:\"Les pages qui ont été modifiées depuis votre dernière visite sont affichées en <strong>gras</strong>.\";'),(_binary 'fr',_binary 'messages:wlnote',_binary 's:238:\"Ci-dessous {{PLURAL:$1|figure la dernière modification effectuée|figurent les <strong>$1</strong> dernières modifications effectuées}} durant {{PLURAL:$2|la dernière heure|les <strong>$2</strong> dernières heures}}, jusqu\'au $3, $4.\";'),(_binary 'fr',_binary 'messages:wlshowhideanons',_binary 's:21:\"utilisateurs anonymes\";'),(_binary 'fr',_binary 'messages:wlshowhidebots',_binary 's:6:\"robots\";'),(_binary 'fr',_binary 'messages:wlshowhidecategorization',_binary 's:26:\"catégorisation de la page\";'),(_binary 'fr',_binary 'messages:wlshowhideliu',_binary 's:21:\"utilisateurs inscrits\";'),(_binary 'fr',_binary 'messages:wlshowhidemine',_binary 's:17:\"mes modifications\";'),(_binary 'fr',_binary 'messages:wlshowhideminor',_binary 's:22:\"modifications mineures\";'),(_binary 'fr',_binary 'messages:wlshowhidepatr',_binary 's:20:\"modifications relues\";'),(_binary 'fr',_binary 'messages:wlshowlast',_binary 's:55:\"Montrer les dernières $1 heures, les derniers $2 jours\";'),(_binary 'fr',_binary 'messages:wlshowtime',_binary 's:20:\"Période affichée :\";'),(_binary 'fr',_binary 'messages:word-separator',_binary 's:5:\"&#32;\";'),(_binary 'fr',_binary 'messages:wrongpassword',_binary 's:85:\"Le nom d’utilisateur ou le mot de passe est incorrect.\nVeuillez essayer à nouveau.\";'),(_binary 'fr',_binary 'messages:wrongpasswordempty',_binary 's:69:\"Vous n’avez entré aucun mot de passe.\nVeuillez essayer à nouveau.\";'),(_binary 'fr',_binary 'messages:xffblockreason',_binary 's:181:\"Une adresse IP dans l’en-tête X-Forwarded-For, soit la vôtre ou celle d’un serveur mandataire que vous utilisez, a été bloquée. La raison du blocage initial est&thinsp;: $1\";'),(_binary 'fr',_binary 'messages:xml-error-string',_binary 's:45:\"$1 à la ligne $2, colonne $3 (octet $4) : $5\";'),(_binary 'fr',_binary 'messages:year',_binary 's:42:\"À partir de l\'année (et précédentes) :\";'),(_binary 'fr',_binary 'messages:years',_binary 's:26:\"{{PLURAL:$1|$1 an|$1 ans}}\";'),(_binary 'fr',_binary 'messages:yesterday-at',_binary 's:10:\"Hier à $1\";'),(_binary 'fr',_binary 'messages:youhavenewmessages',_binary 's:32:\"{{PLURAL:$3|Vous avez}} $1 ($2).\";'),(_binary 'fr',_binary 'messages:youhavenewmessagesfromusers',_binary 's:95:\"{{PLURAL:$4|Vous avez}} $1 {{PLURAL:$3|d\'un autre utilisateur|de $3 autres utilisateurs}} ($2).\";'),(_binary 'fr',_binary 'messages:youhavenewmessagesmanyusers',_binary 's:43:\"Vous avez $1 de nombreux utilisateurs ($2).\";'),(_binary 'fr',_binary 'messages:youhavenewmessagesmulti',_binary 's:38:\"Vous avez de nouveaux messages sur $1.\";'),(_binary 'fr',_binary 'messages:yourdiff',_binary 's:12:\"Différences\";'),(_binary 'fr',_binary 'messages:yourdomainname',_binary 's:15:\"Votre domaine :\";'),(_binary 'fr',_binary 'messages:youremail',_binary 's:10:\"Courriel :\";'),(_binary 'fr',_binary 'messages:yourgender',_binary 's:41:\"Comment préférez-vous être décrit ?\";'),(_binary 'fr',_binary 'messages:yourlanguage',_binary 's:8:\"Langue :\";'),(_binary 'fr',_binary 'messages:yourname',_binary 's:22:\"Nom d’utilisateur :\";'),(_binary 'fr',_binary 'messages:yournick',_binary 's:20:\"Nouvelle signature :\";'),(_binary 'fr',_binary 'messages:yourpassword',_binary 's:14:\"Mot de passe :\";'),(_binary 'fr',_binary 'messages:yourpasswordagain',_binary 's:27:\"Confirmez le mot de passe :\";'),(_binary 'fr',_binary 'messages:yourrealname',_binary 's:11:\"Nom réel :\";'),(_binary 'fr',_binary 'messages:yourtext',_binary 's:11:\"Votre texte\";'),(_binary 'fr',_binary 'messages:yourvariant',_binary 's:34:\"Variante de la langue du contenu :\";'),(_binary 'fr',_binary 'messages:zip-bad',_binary 's:118:\"Le fichier est une archive ZIP corrompue ou illisible.\nIl ne peut pas être correctement vérifié pour la sécurité.\";'),(_binary 'fr',_binary 'messages:zip-file-open-error',_binary 's:76:\"Une erreur s\'est produite lors de l\'ouverture du fichier ZIP pour contrôle.\";'),(_binary 'fr',_binary 'messages:zip-unsupported',_binary 's:157:\"Le fichier est une archive ZIP qui utilise des caractéristiques non prises en charge par MediaWiki.\nSa sécurité ne peut pas être correctement vérifiée.\";'),(_binary 'fr',_binary 'messages:zip-wrong-format',_binary 's:48:\"Le fichier spécifié n\'est pas une archive ZIP.\";'),(_binary 'fr',_binary 'minimumGroupingDigits',_binary 'N;'),(_binary 'fr',_binary 'namespaceAliases',_binary 'a:7:{s:8:\"Discuter\";i:1;s:22:\"Discussion_Utilisateur\";i:3;s:18:\"Discussion_Fichier\";i:7;s:16:\"Discussion_Image\";i:7;s:18:\"Discussion_Modèle\";i:11;s:15:\"Discussion_Aide\";i:13;s:21:\"Discussion_Catégorie\";i:15;}'),(_binary 'fr',_binary 'namespaceGenderAliases',_binary 'a:2:{i:2;a:2:{s:4:\"male\";s:11:\"Utilisateur\";s:6:\"female\";s:12:\"Utilisatrice\";}i:3;a:2:{s:4:\"male\";s:22:\"Discussion_utilisateur\";s:6:\"female\";s:23:\"Discussion_utilisatrice\";}}'),(_binary 'fr',_binary 'namespaceNames',_binary 'a:17:{i:-2;s:6:\"Média\";i:-1;s:8:\"Spécial\";i:1;s:10:\"Discussion\";i:2;s:11:\"Utilisateur\";i:3;s:22:\"Discussion_utilisateur\";i:5;s:13:\"Discussion_$1\";i:6;s:7:\"Fichier\";i:7;s:18:\"Discussion_fichier\";i:8;s:9:\"MediaWiki\";i:9;s:20:\"Discussion_MediaWiki\";i:10;s:7:\"Modèle\";i:11;s:18:\"Discussion_modèle\";i:12;s:4:\"Aide\";i:13;s:15:\"Discussion_aide\";i:14;s:10:\"Catégorie\";i:15;s:21:\"Discussion_catégorie\";i:0;s:0:\"\";}'),(_binary 'fr',_binary 'originalFallbackSequence',_binary 'a:0:{}'),(_binary 'fr',_binary 'pluralRuleTypes',_binary 'a:1:{i:0;s:3:\"one\";}'),(_binary 'fr',_binary 'pluralRules',_binary 'a:1:{i:0;s:38:\"i = 0,1 @integer 0, 1 @decimal 0.0~1.5\";}'),(_binary 'fr',_binary 'preload',_binary 'a:3:{s:8:\"messages\";a:111:{s:9:\"aboutpage\";s:20:\"Project:À propos de\";s:9:\"aboutsite\";s:25:\"À propos de {{SITENAME}}\";s:17:\"accesskey-ca-edit\";s:1:\"e\";s:20:\"accesskey-ca-history\";s:1:\"h\";s:23:\"accesskey-ca-nstab-main\";s:1:\"c\";s:17:\"accesskey-ca-talk\";s:1:\"t\";s:23:\"accesskey-ca-viewsource\";s:1:\"e\";s:25:\"accesskey-n-currentevents\";s:0:\"\";s:16:\"accesskey-n-help\";s:0:\"\";s:32:\"accesskey-n-mainpage-description\";s:1:\"z\";s:18:\"accesskey-n-portal\";s:0:\"\";s:22:\"accesskey-n-randompage\";s:1:\"x\";s:25:\"accesskey-n-recentchanges\";s:1:\"r\";s:16:\"accesskey-p-logo\";s:0:\"\";s:18:\"accesskey-pt-login\";s:1:\"o\";s:26:\"accesskey-pt-createaccount\";s:0:\"\";s:16:\"accesskey-search\";s:1:\"f\";s:25:\"accesskey-search-fulltext\";s:0:\"\";s:19:\"accesskey-search-go\";s:0:\"\";s:16:\"accesskey-t-info\";s:0:\"\";s:21:\"accesskey-t-permalink\";s:0:\"\";s:17:\"accesskey-t-print\";s:1:\"p\";s:31:\"accesskey-t-recentchangeslinked\";s:1:\"k\";s:24:\"accesskey-t-specialpages\";s:1:\"q\";s:25:\"accesskey-t-whatlinkshere\";s:1:\"j\";s:7:\"actions\";s:7:\"Actions\";s:10:\"anonnotice\";s:1:\"-\";s:8:\"brackets\";s:4:\"[$1]\";s:15:\"comma-separator\";s:6:\",&#32;\";s:13:\"currentevents\";s:11:\"Actualités\";s:17:\"currentevents-url\";s:20:\"Project: Actualités\";s:14:\"disclaimerpage\";s:34:\"Project: Avertissements généraux\";s:11:\"disclaimers\";s:14:\"Avertissements\";s:4:\"edit\";s:8:\"Modifier\";s:11:\"editsection\";s:8:\"modifier\";s:15:\"editsectionhint\";s:24:\"Modifier la section : $1\";s:4:\"help\";s:4:\"Aide\";s:8:\"helppage\";s:63:\"https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Contents\";s:24:\"interlanguage-link-title\";s:9:\"$1 — $2\";s:6:\"jumpto\";s:10:\"Aller à :\";s:16:\"jumptonavigation\";s:10:\"navigation\";s:12:\"jumptosearch\";s:10:\"rechercher\";s:14:\"lastmodifiedat\";s:66:\"La dernière modification de cette page a été faite le $1 à $2.\";s:8:\"mainpage\";s:7:\"Accueil\";s:20:\"mainpage-description\";s:7:\"Accueil\";s:14:\"mainpage-nstab\";s:7:\"Accueil\";s:10:\"namespaces\";s:15:\"Espaces de noms\";s:10:\"navigation\";s:10:\"Navigation\";s:23:\"nav-login-createaccount\";s:32:\"Créer un compte ou se connecter\";s:10:\"nstab-main\";s:4:\"Page\";s:15:\"opensearch-desc\";s:34:\"{{SITENAME}} ({{CONTENTLANGUAGE}})\";s:14:\"pagecategories\";s:36:\"{{PLURAL:$1|Catégorie|Catégories}}\";s:18:\"pagecategorieslink\";s:18:\"Special:Categories\";s:9:\"pagetitle\";s:19:\"$1 — {{SITENAME}}\";s:23:\"pagetitle-view-mainpage\";s:12:\"{{SITENAME}}\";s:9:\"permalink\";s:14:\"Lien permanent\";s:13:\"personaltools\";s:17:\"Outils personnels\";s:6:\"portal\";s:11:\"Communauté\";s:10:\"portal-url\";s:30:\"Project: Portail communautaire\";s:16:\"printableversion\";s:18:\"Version imprimable\";s:7:\"privacy\";s:29:\"Politique de confidentialité\";s:11:\"privacypage\";s:38:\"Project: Politique de confidentialité\";s:10:\"randompage\";s:14:\"Page au hasard\";s:14:\"randompage-url\";s:14:\"Special:Random\";s:13:\"recentchanges\";s:23:\"Modifications récentes\";s:27:\"recentchangeslinked-toolbox\";s:22:\"Suivi des pages liées\";s:17:\"recentchanges-url\";s:21:\"Special:RecentChanges\";s:13:\"retrievedfrom\";s:24:\"Récupérée de « $1 »\";s:6:\"search\";s:10:\"Rechercher\";s:13:\"searcharticle\";s:9:\"Continuer\";s:12:\"searchbutton\";s:10:\"Rechercher\";s:20:\"searchsuggest-search\";s:28:\"Rechercher dans {{SITENAME}}\";s:7:\"sidebar\";s:168:\"\n* navigation\n** mainpage|mainpage-description\n** recentchanges-url|recentchanges\n** randompage-url|randompage\n** helppage|help-mediawiki\n* SEARCH\n* TOOLBOX\n* LANGUAGES\";s:18:\"navigation-heading\";s:18:\"Menu de navigation\";s:14:\"site-atom-feed\";s:15:\"Flux Atom de $1\";s:10:\"sitenotice\";s:1:\"-\";s:12:\"specialpages\";s:16:\"Pages spéciales\";s:7:\"tagline\";s:15:\"De {{SITENAME}}\";s:4:\"talk\";s:10:\"Discussion\";s:7:\"toolbox\";s:6:\"Outils\";s:15:\"tooltip-ca-edit\";s:20:\"Modifier le wikicode\";s:18:\"tooltip-ca-history\";s:37:\"Historique des versions de cette page\";s:21:\"tooltip-ca-nstab-main\";s:26:\"Voir le contenu de la page\";s:15:\"tooltip-ca-talk\";s:44:\"Discussion au sujet de cette page de contenu\";s:21:\"tooltip-ca-viewsource\";s:73:\"Cette page est protégée.\nVous pouvez toutefois en visualiser la source.\";s:23:\"tooltip-n-currentevents\";s:58:\"Trouver plus d’informations sur les actualités en cours\";s:14:\"tooltip-n-help\";s:18:\"Accès à l’aide\";s:30:\"tooltip-n-mainpage-description\";s:17:\"Accueil général\";s:16:\"tooltip-n-portal\";s:75:\"À propos du projet, ce que vous pouvez faire, où trouver les informations\";s:20:\"tooltip-n-randompage\";s:27:\"Afficher une page au hasard\";s:23:\"tooltip-n-recentchanges\";s:45:\"Liste des modifications récentes sur le wiki\";s:14:\"tooltip-p-logo\";s:27:\"Visiter la page d’accueil\";s:16:\"tooltip-pt-login\";s:79:\"Nous vous encourageons à vous connecter ; ce n’est cependant pas obligatoire\";s:24:\"tooltip-pt-createaccount\";s:110:\"Nous vous encourageons à créer un compte utilisateur et vous connecter; ce n’est cependant pas obligatoire\";s:14:\"tooltip-search\";s:28:\"Rechercher dans {{SITENAME}}\";s:23:\"tooltip-search-fulltext\";s:41:\"Rechercher les pages comportant ce texte.\";s:17:\"tooltip-search-go\";s:48:\"Accédez à une page du même nom si elle existe\";s:14:\"tooltip-t-info\";s:35:\"Plus d’information sur cette page\";s:19:\"tooltip-t-permalink\";s:46:\"Adresse permanente de cette version de la page\";s:15:\"tooltip-t-print\";s:32:\"Version imprimable de cette page\";s:29:\"tooltip-t-recentchangeslinked\";s:66:\"Liste des modifications récentes des pages appelées par celle-ci\";s:22:\"tooltip-t-specialpages\";s:36:\"Liste de toutes les pages spéciales\";s:23:\"tooltip-t-whatlinkshere\";s:48:\"Liste des pages liées qui pointent sur celle-ci\";s:8:\"variants\";s:9:\"Variantes\";s:16:\"vector-view-edit\";s:8:\"Modifier\";s:19:\"vector-view-history\";s:19:\"Voir l’historique\";s:16:\"vector-view-view\";s:4:\"Lire\";s:9:\"viewcount\";s:120:\"Cette page {{PLURAL:$1|0=n’a jamais été consultée|1=a été consultée une seule fois|a été consultée $1 fois}}.\";s:5:\"views\";s:10:\"Affichages\";s:13:\"whatlinkshere\";s:12:\"Pages liées\";s:14:\"word-separator\";s:5:\"&#32;\";}s:11:\"dateFormats\";a:20:{s:8:\"mdy time\";s:3:\"H:i\";s:8:\"mdy date\";s:6:\"F j, Y\";s:8:\"mdy both\";s:13:\"F j, Y à H:i\";s:8:\"dmy time\";s:3:\"H:i\";s:8:\"dmy date\";s:5:\"j F Y\";s:8:\"dmy both\";s:12:\"j F Y à H:i\";s:8:\"ymd time\";s:3:\"H:i\";s:8:\"ymd date\";s:5:\"Y F j\";s:8:\"ymd both\";s:12:\"Y F j à H:i\";s:13:\"mdy monthonly\";s:3:\"F Y\";s:10:\"mdy pretty\";s:3:\"F j\";s:13:\"dmy monthonly\";s:3:\"F Y\";s:10:\"dmy pretty\";s:3:\"j F\";s:13:\"ymd monthonly\";s:3:\"Y F\";s:10:\"ymd pretty\";s:3:\"F j\";s:13:\"ISO 8601 time\";s:11:\"xnH:xni:xns\";s:13:\"ISO 8601 date\";s:11:\"xnY-xnm-xnd\";s:18:\"ISO 8601 monthonly\";s:7:\"xnY-xnm\";s:13:\"ISO 8601 both\";s:25:\"xnY-xnm-xnd\"T\"xnH:xni:xns\";s:15:\"ISO 8601 pretty\";s:7:\"xnm-xnd\";}s:14:\"namespaceNames\";a:17:{i:-2;s:6:\"Média\";i:-1;s:8:\"Spécial\";i:1;s:10:\"Discussion\";i:2;s:11:\"Utilisateur\";i:3;s:22:\"Discussion_utilisateur\";i:5;s:13:\"Discussion_$1\";i:6;s:7:\"Fichier\";i:7;s:18:\"Discussion_fichier\";i:8;s:9:\"MediaWiki\";i:9;s:20:\"Discussion_MediaWiki\";i:10;s:7:\"Modèle\";i:11;s:18:\"Discussion_modèle\";i:12;s:4:\"Aide\";i:13;s:15:\"Discussion_aide\";i:14;s:10:\"Catégorie\";i:15;s:21:\"Discussion_catégorie\";i:0;s:0:\"\";}}'),(_binary 'fr',_binary 'preloadedMessages',_binary 'a:111:{i:0;s:9:\"aboutpage\";i:1;s:9:\"aboutsite\";i:2;s:17:\"accesskey-ca-edit\";i:3;s:20:\"accesskey-ca-history\";i:4;s:23:\"accesskey-ca-nstab-main\";i:5;s:17:\"accesskey-ca-talk\";i:6;s:23:\"accesskey-ca-viewsource\";i:7;s:25:\"accesskey-n-currentevents\";i:8;s:16:\"accesskey-n-help\";i:9;s:32:\"accesskey-n-mainpage-description\";i:10;s:18:\"accesskey-n-portal\";i:11;s:22:\"accesskey-n-randompage\";i:12;s:25:\"accesskey-n-recentchanges\";i:13;s:16:\"accesskey-p-logo\";i:14;s:18:\"accesskey-pt-login\";i:15;s:26:\"accesskey-pt-createaccount\";i:16;s:16:\"accesskey-search\";i:17;s:25:\"accesskey-search-fulltext\";i:18;s:19:\"accesskey-search-go\";i:19;s:16:\"accesskey-t-info\";i:20;s:21:\"accesskey-t-permalink\";i:21;s:17:\"accesskey-t-print\";i:22;s:31:\"accesskey-t-recentchangeslinked\";i:23;s:24:\"accesskey-t-specialpages\";i:24;s:25:\"accesskey-t-whatlinkshere\";i:25;s:7:\"actions\";i:26;s:10:\"anonnotice\";i:27;s:8:\"brackets\";i:28;s:15:\"comma-separator\";i:29;s:13:\"currentevents\";i:30;s:17:\"currentevents-url\";i:31;s:14:\"disclaimerpage\";i:32;s:11:\"disclaimers\";i:33;s:4:\"edit\";i:34;s:11:\"editsection\";i:35;s:15:\"editsectionhint\";i:36;s:4:\"help\";i:37;s:8:\"helppage\";i:38;s:24:\"interlanguage-link-title\";i:39;s:6:\"jumpto\";i:40;s:16:\"jumptonavigation\";i:41;s:12:\"jumptosearch\";i:42;s:14:\"lastmodifiedat\";i:43;s:8:\"mainpage\";i:44;s:20:\"mainpage-description\";i:45;s:14:\"mainpage-nstab\";i:46;s:10:\"namespaces\";i:47;s:10:\"navigation\";i:48;s:23:\"nav-login-createaccount\";i:49;s:10:\"nstab-main\";i:50;s:15:\"opensearch-desc\";i:51;s:14:\"pagecategories\";i:52;s:18:\"pagecategorieslink\";i:53;s:9:\"pagetitle\";i:54;s:23:\"pagetitle-view-mainpage\";i:55;s:9:\"permalink\";i:56;s:13:\"personaltools\";i:57;s:6:\"portal\";i:58;s:10:\"portal-url\";i:59;s:16:\"printableversion\";i:60;s:7:\"privacy\";i:61;s:11:\"privacypage\";i:62;s:10:\"randompage\";i:63;s:14:\"randompage-url\";i:64;s:13:\"recentchanges\";i:65;s:27:\"recentchangeslinked-toolbox\";i:66;s:17:\"recentchanges-url\";i:67;s:13:\"retrievedfrom\";i:68;s:6:\"search\";i:69;s:13:\"searcharticle\";i:70;s:12:\"searchbutton\";i:71;s:20:\"searchsuggest-search\";i:72;s:7:\"sidebar\";i:73;s:18:\"navigation-heading\";i:74;s:14:\"site-atom-feed\";i:75;s:10:\"sitenotice\";i:76;s:12:\"specialpages\";i:77;s:7:\"tagline\";i:78;s:4:\"talk\";i:79;s:7:\"toolbox\";i:80;s:15:\"tooltip-ca-edit\";i:81;s:18:\"tooltip-ca-history\";i:82;s:21:\"tooltip-ca-nstab-main\";i:83;s:15:\"tooltip-ca-talk\";i:84;s:21:\"tooltip-ca-viewsource\";i:85;s:23:\"tooltip-n-currentevents\";i:86;s:14:\"tooltip-n-help\";i:87;s:30:\"tooltip-n-mainpage-description\";i:88;s:16:\"tooltip-n-portal\";i:89;s:20:\"tooltip-n-randompage\";i:90;s:23:\"tooltip-n-recentchanges\";i:91;s:14:\"tooltip-p-logo\";i:92;s:16:\"tooltip-pt-login\";i:93;s:24:\"tooltip-pt-createaccount\";i:94;s:14:\"tooltip-search\";i:95;s:23:\"tooltip-search-fulltext\";i:96;s:17:\"tooltip-search-go\";i:97;s:14:\"tooltip-t-info\";i:98;s:19:\"tooltip-t-permalink\";i:99;s:15:\"tooltip-t-print\";i:100;s:29:\"tooltip-t-recentchangeslinked\";i:101;s:22:\"tooltip-t-specialpages\";i:102;s:23:\"tooltip-t-whatlinkshere\";i:103;s:8:\"variants\";i:104;s:16:\"vector-view-edit\";i:105;s:19:\"vector-view-history\";i:106;s:16:\"vector-view-view\";i:107;s:9:\"viewcount\";i:108;s:5:\"views\";i:109;s:13:\"whatlinkshere\";i:110;s:14:\"word-separator\";}'),(_binary 'fr',_binary 'rtl',_binary 'b:0;'),(_binary 'fr',_binary 'separatorTransformTable',_binary 'a:2:{s:1:\",\";s:2:\" \";s:1:\".\";s:1:\",\";}'),(_binary 'fr',_binary 'specialPageAliases',_binary 'a:124:{s:11:\"Activeusers\";a:3:{i:0;s:19:\"Utilisateurs_actifs\";i:1;s:18:\"UtilisateursActifs\";i:2;s:11:\"ActiveUsers\";}s:11:\"Allmessages\";a:5:{i:0;s:17:\"Messages_système\";i:1;s:16:\"Messages_systeme\";i:2;s:16:\"Messagessystème\";i:3;s:15:\"Messagessysteme\";i:4;s:11:\"AllMessages\";}s:8:\"Allpages\";a:3:{i:0;s:16:\"Toutes_les_pages\";i:1;s:14:\"ToutesLesPages\";i:2;s:8:\"AllPages\";}s:12:\"Ancientpages\";a:5:{i:0;s:15:\"Pages_anciennes\";i:1;s:14:\"PagesAnciennes\";i:2;s:15:\"Anciennes_pages\";i:3;s:14:\"AnciennesPages\";i:4;s:12:\"AncientPages\";}s:8:\"Badtitle\";a:3:{i:0;s:13:\"Mauvais_titre\";i:1;s:12:\"MauvaisTitre\";i:2;s:8:\"Badtitle\";}s:9:\"Blankpage\";a:3:{i:0;s:12:\"Page_blanche\";i:1;s:11:\"PageBlanche\";i:2;s:9:\"BlankPage\";}s:5:\"Block\";a:5:{i:0;s:7:\"Bloquer\";i:1;s:7:\"Blocage\";i:2;s:5:\"Block\";i:3;s:7:\"BlockIP\";i:4;s:9:\"BlockUser\";}s:11:\"Booksources\";a:9:{i:0;s:23:\"Ouvrages_de_référence\";i:1;s:21:\"Ouvrages_de_reference\";i:2;s:21:\"Ouvragesderéférence\";i:3;s:19:\"Ouvragesdereference\";i:4;s:14:\"Recherche_ISBN\";i:5;s:14:\"Recherche_isbn\";i:6;s:13:\"RechercheISBN\";i:7;s:13:\"Rechercheisbn\";i:8;s:11:\"BookSources\";}s:15:\"BrokenRedirects\";a:5:{i:0;s:21:\"Redirections_cassées\";i:1;s:19:\"RedirectionCassées\";i:2;s:20:\"Redirections_cassees\";i:3;s:19:\"RedirectionsCassees\";i:4;s:15:\"BrokenRedirects\";}s:10:\"Categories\";a:2:{i:0;s:11:\"Catégories\";i:1;s:10:\"Categories\";}s:11:\"ChangeEmail\";a:4:{i:0;s:16:\"Changer_courriel\";i:1;s:15:\"ChangerCourriel\";i:2;s:14:\"ChangerCouriel\";i:3;s:11:\"ChangeEmail\";}s:14:\"ChangePassword\";a:5:{i:0;s:26:\"Changement_du_mot_de_passe\";i:1;s:22:\"ChangementDuMotDePasse\";i:2;s:14:\"ChangePassword\";i:3;s:9:\"ResetPass\";i:4;s:13:\"ResetPassword\";}s:12:\"ComparePages\";a:2:{i:0;s:18:\"Comparer_des_pages\";i:1;s:12:\"ComparePages\";}s:12:\"Confirmemail\";a:4:{i:0;s:30:\"Confirmer_l\'adresse_de_contact\";i:1;s:21:\"Confirmer_le_courriel\";i:2;s:19:\"ConfirmerLeCourriel\";i:3;s:12:\"ConfirmEmail\";}s:13:\"CreateAccount\";a:4:{i:0;s:16:\"Créer_un_compte\";i:1;s:14:\"CréerUnCompte\";i:2;s:12:\"CréerCompte\";i:3;s:13:\"CreateAccount\";}s:12:\"Deadendpages\";a:3:{i:0;s:16:\"Pages_en_impasse\";i:1;s:14:\"PagesEnImpasse\";i:2;s:12:\"DeadendPages\";}s:20:\"DeletedContributions\";a:4:{i:0;s:25:\"Contributions_supprimées\";i:1;s:24:\"ContributionsSupprimées\";i:2;s:22:\"ContributionSupprimees\";i:3;s:20:\"DeletedContributions\";}s:15:\"DoubleRedirects\";a:5:{i:0;s:20:\"Doubles_redirections\";i:1;s:19:\"DoublesRedirections\";i:2;s:20:\"Redirections_doubles\";i:3;s:19:\"RedirectionsDoubles\";i:4;s:15:\"DoubleRedirects\";}s:13:\"EditWatchlist\";a:3:{i:0;s:22:\"Éditer_Liste_de_suivi\";i:1;s:19:\"ÉditerListeDeSuivi\";i:2;s:13:\"EditWatchlist\";}s:9:\"Emailuser\";a:9:{i:0;s:19:\"Envoyer_un_courriel\";i:1;s:17:\"EnvoyerUnCourriel\";i:2;s:8:\"Courriel\";i:3;s:17:\"Envoyer_un_e-mail\";i:4;s:14:\"EnvoyerUnEMail\";i:5;s:6:\"E-mail\";i:6;s:5:\"EMail\";i:7;s:9:\"EmailUser\";i:8;s:5:\"Email\";}s:15:\"ExpandTemplates\";a:2:{i:0;s:20:\"ExpansionDesModèles\";i:1;s:15:\"ExpandTemplates\";}s:6:\"Export\";a:3:{i:0;s:8:\"Exporter\";i:1;s:11:\"Exportation\";i:2;s:6:\"Export\";}s:15:\"Fewestrevisions\";a:9:{i:0;s:26:\"Pages_les_moins_modifiées\";i:1;s:23:\"PagesLesMoinsModifiées\";i:2;s:25:\"Pages_les_moins_modifiees\";i:3;s:22:\"PagesLesMoinsModifiees\";i:4;s:19:\"Les_moins_modifiés\";i:5;s:17:\"LesMoinsModifiés\";i:6;s:18:\"Les_moins_modifies\";i:7;s:16:\"LesMoinsModifies\";i:8;s:15:\"FewestRevisions\";}s:19:\"FileDuplicateSearch\";a:3:{i:0;s:27:\"Recherche_fichier_en_double\";i:1;s:24:\"RechercheFichierEnDouble\";i:2;s:19:\"FileDuplicateSearch\";}s:8:\"Filepath\";a:4:{i:0;s:17:\"Chemin_du_fichier\";i:1;s:15:\"CheminDuFichier\";i:2;s:13:\"CheminFichier\";i:3;s:8:\"FilePath\";}s:6:\"Import\";a:3:{i:0;s:8:\"Importer\";i:1;s:11:\"Importation\";i:2;s:6:\"Import\";}s:15:\"Invalidateemail\";a:4:{i:0;s:21:\"Invalider_le_courriel\";i:1;s:18:\"Invalider_courriel\";i:2;s:17:\"InvaliderCourriel\";i:3;s:15:\"InvalidateEmail\";}s:9:\"BlockList\";a:13:{i:0;s:18:\"Liste_des_blocages\";i:1;s:16:\"ListeDesBlocages\";i:2;s:8:\"Blocages\";i:3;s:21:\"Utilisateurs_bloqués\";i:4;s:20:\"UtilisateursBloqués\";i:5;s:20:\"Utilisateurs_bloques\";i:6;s:19:\"UtilisateursBloques\";i:7;s:12:\"IP_bloquées\";i:8;s:10:\"IPBloquees\";i:9;s:11:\"IPBloquées\";i:10;s:9:\"BlockList\";i:11;s:10:\"ListBlocks\";i:12;s:11:\"IPBlockList\";}s:10:\"LinkSearch\";a:3:{i:0;s:17:\"Recherche_de_lien\";i:1;s:18:\"Recherche_de_liens\";i:2;s:10:\"LinkSearch\";}s:10:\"Listadmins\";a:7:{i:0;s:25:\"Liste_des_administrateurs\";i:1;s:23:\"Listedesadministrateurs\";i:2;s:16:\"Liste_des_admins\";i:3;s:14:\"Listedesadmins\";i:4;s:12:\"Liste_admins\";i:5;s:11:\"Listeadmins\";i:6;s:10:\"ListAdmins\";}s:8:\"Listbots\";a:3:{i:0;s:14:\"Liste_des_bots\";i:1;s:12:\"ListedesBots\";i:2;s:8:\"ListBots\";}s:9:\"Listfiles\";a:7:{i:0;s:18:\"Liste_des_fichiers\";i:1;s:16:\"ListeDesFichiers\";i:2;s:16:\"Liste_des_images\";i:3;s:14:\"ListeDesImages\";i:4;s:9:\"ListFiles\";i:5;s:8:\"FileList\";i:6;s:9:\"ImageList\";}s:15:\"Listgrouprights\";a:4:{i:0;s:26:\"Liste_des_droits_de_groupe\";i:1;s:23:\"ListeDesDroitsDeGroupes\";i:2;s:15:\"ListGroupRights\";i:3;s:15:\"UserGroupRights\";}s:13:\"Listredirects\";a:9:{i:0;s:22:\"Liste_des_redirections\";i:1;s:20:\"Listedesredirections\";i:2;s:19:\"Liste_des_redirects\";i:3;s:17:\"Listedesredirects\";i:4;s:18:\"Liste_redirections\";i:5;s:17:\"Listeredirections\";i:6;s:15:\"Liste_redirects\";i:7;s:14:\"Listeredirects\";i:8;s:13:\"ListRedirects\";}s:9:\"Listusers\";a:5:{i:0;s:22:\"Liste_des_utilisateurs\";i:1;s:20:\"ListeDesUtilisateurs\";i:2;s:12:\"Utilisateurs\";i:3;s:9:\"ListUsers\";i:4;s:8:\"UserList\";}s:6:\"Lockdb\";a:9:{i:0;s:19:\"Verrouiller_la_base\";i:1;s:17:\"Verrouillerlabase\";i:2;s:16:\"Verrouiller_base\";i:3;s:15:\"Verrouillerbase\";i:4;s:14:\"Verrouiller_BD\";i:5;s:13:\"VerrouillerBD\";i:6;s:14:\"Verrouiller_bd\";i:7;s:13:\"Verrouillerbd\";i:8;s:6:\"LockDB\";}s:3:\"Log\";a:4:{i:0;s:7:\"Journal\";i:1;s:8:\"Journaux\";i:2;s:3:\"Log\";i:3;s:4:\"Logs\";}s:11:\"Lonelypages\";a:4:{i:0;s:16:\"Pages_orphelines\";i:1;s:15:\"PagesOrphelines\";i:2;s:11:\"LonelyPages\";i:3;s:13:\"OrphanedPages\";}s:9:\"Longpages\";a:3:{i:0;s:13:\"Pages_longues\";i:1;s:12:\"PagesLongues\";i:2;s:9:\"LongPages\";}s:12:\"MergeHistory\";a:5:{i:0;s:25:\"Fusionner_les_historiques\";i:1;s:20:\"FusionnerHistoriques\";i:2;s:22:\"Fusionner_l\'historique\";i:3;s:20:\"Fusionnerlhistorique\";i:4;s:12:\"MergeHistory\";}s:10:\"MIMEsearch\";a:5:{i:0;s:14:\"Recherche_MIME\";i:1;s:13:\"RechercheMIME\";i:2;s:14:\"Recherche_mime\";i:3;s:13:\"Recherchemime\";i:4;s:10:\"MIMESearch\";}s:14:\"Mostcategories\";a:9:{i:0;s:29:\"Pages_les_plus_catégorisées\";i:1;s:26:\"PagesLesPlusCatégorisées\";i:2;s:27:\"Pages_les_plus_categorisees\";i:3;s:24:\"PagesLesPlusCategorisees\";i:4;s:22:\"Les_plus_catégorisés\";i:5;s:20:\"LesPlusCatégorisés\";i:6;s:20:\"Les_plus_categorises\";i:7;s:18:\"LesPlusCategorises\";i:8;s:14:\"MostCategories\";}s:10:\"Mostimages\";a:19:{i:0;s:23:\"Fichiers_les_plus_liés\";i:1;s:20:\"FichiersLesPlusLiés\";i:2;s:22:\"Fichiers_les_plus_lies\";i:3;s:19:\"FichiersLesPlusLies\";i:4;s:27:\"Fichiers_les_plus_utilisés\";i:5;s:24:\"FichiersLesPlusUtilisés\";i:6;s:26:\"Fichiers_les_plus_utilises\";i:7;s:23:\"FichiersLesPlusUtilises\";i:8;s:22:\"Images_les_plus_liées\";i:9;s:19:\"ImagesLesPlusLiées\";i:10;s:21:\"Images_les_plus_liees\";i:11;s:18:\"ImagesLesPlusLiees\";i:12;s:26:\"Images_les_plus_utilisées\";i:13;s:23:\"ImagesLesPlusUtilisées\";i:14;s:25:\"Images_les_plus_utilisees\";i:15;s:22:\"ImagesLesPlusUtilisees\";i:16;s:15:\"MostLinkedFiles\";i:17;s:9:\"MostFiles\";i:18;s:10:\"MostImages\";}s:10:\"Mostlinked\";a:10:{i:0;s:21:\"Pages_les_plus_liées\";i:1;s:18:\"PagesLesPlusLiées\";i:2;s:20:\"Pages_les_plus_liees\";i:3;s:17:\"PagesLesPlusLiees\";i:4;s:15:\"Les_plus_liées\";i:5;s:13:\"LesPlusLiées\";i:6;s:14:\"Les_plus_liees\";i:7;s:12:\"LesPlusLiees\";i:8;s:15:\"MostLinkedPages\";i:9;s:10:\"MostLinked\";}s:20:\"Mostlinkedcategories\";a:10:{i:0;s:27:\"Catégories_les_plus_liées\";i:1;s:24:\"CatégoriesLesPlusLiées\";i:2;s:25:\"Categories_les_plus_liees\";i:3;s:22:\"CategoriesLesPlusLiees\";i:4;s:31:\"Catégories_les_plus_utilisées\";i:5;s:28:\"CatégoriesLesPlusUtilisées\";i:6;s:29:\"Categories_les_plus_utilisees\";i:7;s:26:\"CategoriesLesPlusUtilisees\";i:8;s:20:\"MostLinkedCategories\";i:9;s:18:\"MostUsedCategories\";}s:19:\"Mostlinkedtemplates\";a:11:{i:0;s:23:\"Modèles_les_plus_liés\";i:1;s:20:\"ModèlesLesPlusLiés\";i:2;s:21:\"Modeles_les_plus_lies\";i:3;s:18:\"ModelesLesPlusLies\";i:4;s:27:\"Modèles_les_plus_utilisés\";i:5;s:24:\"ModèlesLesPlusUtilisés\";i:6;s:25:\"Modeles_les_plus_utilises\";i:7;s:22:\"ModelesLesPlusUtilises\";i:8;s:20:\"MostTranscludedPages\";i:9;s:19:\"MostLinkedTemplates\";i:10;s:17:\"MostUsedTemplates\";}s:13:\"Mostrevisions\";a:9:{i:0;s:25:\"Pages_les_plus_modifiées\";i:1;s:22:\"PagesLesPlusModifiées\";i:2;s:24:\"Pages_les_plus_modifiees\";i:3;s:21:\"PagesLesPlusModifiees\";i:4;s:18:\"Les_plus_modifiés\";i:5;s:16:\"LesPlusModifiés\";i:6;s:17:\"Les_plus_modifies\";i:7;s:15:\"LesPlusModifies\";i:8;s:13:\"MostRevisions\";}s:8:\"Movepage\";a:4:{i:0;s:17:\"Renommer_une_page\";i:1;s:8:\"Renommer\";i:2;s:9:\"Renommage\";i:3;s:8:\"MovePage\";}s:15:\"Mycontributions\";a:3:{i:0;s:17:\"Mes_contributions\";i:1;s:16:\"Mescontributions\";i:2;s:15:\"MyContributions\";}s:10:\"MyLanguage\";a:3:{i:0;s:9:\"Ma_langue\";i:1;s:8:\"MaLangue\";i:2;s:10:\"MyLanguage\";}s:6:\"Mypage\";a:3:{i:0;s:7:\"Ma_page\";i:1;s:6:\"Mapage\";i:2;s:6:\"MyPage\";}s:6:\"Mytalk\";a:3:{i:0;s:15:\"Mes_discussions\";i:1;s:14:\"Mesdiscussions\";i:2;s:6:\"MyTalk\";}s:9:\"Newimages\";a:6:{i:0;s:17:\"Nouveaux_fichiers\";i:1;s:16:\"NouveauxFichiers\";i:2;s:16:\"Nouvelles_images\";i:3;s:15:\"NouvellesImages\";i:4;s:8:\"NewFiles\";i:5;s:9:\"NewImages\";}s:8:\"Newpages\";a:7:{i:0;s:15:\"Nouvelles_pages\";i:1;s:14:\"NouvellesPages\";i:2;s:15:\"Pages_récentes\";i:3;s:14:\"PagesRécentes\";i:4;s:14:\"Pages_recentes\";i:5;s:13:\"PagesRecentes\";i:6;s:8:\"NewPages\";}s:13:\"PagesWithProp\";a:5:{i:0;s:25:\"Pages_avec_la_propriété\";i:1;s:13:\"PagesWithProp\";i:2;s:13:\"Pageswithprop\";i:3;s:11:\"PagesByProp\";i:4;s:11:\"Pagesbyprop\";}s:13:\"PasswordReset\";a:3:{i:0;s:33:\"Réinitialisation_du_mot_de_passe\";i:1;s:29:\"RéinitialisationDuMotDePasse\";i:2;s:13:\"PasswordReset\";}s:13:\"PermanentLink\";a:4:{i:0;s:14:\"Lien_permanent\";i:1;s:13:\"LienPermanent\";i:2;s:13:\"PermanentLink\";i:3;s:9:\"PermaLink\";}s:11:\"Preferences\";a:2:{i:0;s:13:\"Préférences\";i:1;s:11:\"Preferences\";}s:11:\"Prefixindex\";a:4:{i:0;s:5:\"Index\";i:1;s:9:\"Préfixes\";i:2;s:8:\"Prefixes\";i:3;s:11:\"PrefixIndex\";}s:14:\"Protectedpages\";a:5:{i:0;s:17:\"Pages_protégées\";i:1;s:16:\"PagesProtégées\";i:2;s:15:\"Pages_protegees\";i:3;s:14:\"PagesProtegees\";i:4;s:14:\"ProtectedPages\";}s:15:\"Protectedtitles\";a:5:{i:0;s:17:\"Titres_protégés\";i:1;s:16:\"TitresProtégés\";i:2;s:15:\"Titres_proteges\";i:3;s:14:\"TitresProteges\";i:4;s:15:\"ProtectedTitles\";}s:10:\"Randompage\";a:8:{i:0;s:14:\"Page_au_hasard\";i:1;s:12:\"PageAuHasard\";i:2;s:9:\"Au_hasard\";i:3;s:8:\"AuHasard\";i:4;s:10:\"Aléatoire\";i:5;s:9:\"Aleatoire\";i:6;s:6:\"Random\";i:7;s:10:\"RandomPage\";}s:16:\"RandomInCategory\";a:2:{i:0;s:34:\"Page_au_hasard_dans_une_catégorie\";i:1;s:16:\"RandomInCategory\";}s:14:\"Randomredirect\";a:13:{i:0;s:21:\"Redirection_au_hasard\";i:1;s:18:\"Redirect_au_hasard\";i:2;s:19:\"Redirectionauhasard\";i:3;s:16:\"Redirectauhasard\";i:4;s:22:\"Redirection_aléatoire\";i:5;s:19:\"Redirect_aléatoire\";i:6;s:21:\"Redirectionaléatoire\";i:7;s:18:\"Redirectaléatoire\";i:8;s:21:\"Redirection_aleatoire\";i:9;s:18:\"Redirect_aleatoire\";i:10;s:20:\"Redirectionaleatoire\";i:11;s:17:\"Redirectaleatoire\";i:12;s:14:\"RandomRedirect\";}s:13:\"Recentchanges\";a:5:{i:0;s:23:\"Modifications_récentes\";i:1;s:22:\"Modifications_recentes\";i:2;s:22:\"ModificationsRécentes\";i:3;s:21:\"ModificationsRecentes\";i:4;s:13:\"RecentChanges\";}s:19:\"Recentchangeslinked\";a:4:{i:0;s:15:\"Suivi_des_liens\";i:1;s:13:\"SuiviDesLiens\";i:2;s:19:\"RecentChangesLinked\";i:3;s:14:\"RelatedChanges\";}s:8:\"Redirect\";a:2:{i:0;s:11:\"Redirection\";i:1;s:8:\"Redirect\";}s:14:\"Revisiondelete\";a:5:{i:0;s:20:\"Versions_supprimées\";i:1;s:19:\"Versions_supprimees\";i:2;s:18:\"Versionsupprimées\";i:3;s:17:\"Versionsupprimees\";i:4;s:14:\"RevisionDelete\";}s:6:\"Search\";a:4:{i:0;s:9:\"Recherche\";i:1;s:10:\"Rechercher\";i:2;s:8:\"Chercher\";i:3;s:6:\"Search\";}s:10:\"Shortpages\";a:3:{i:0;s:13:\"Pages_courtes\";i:1;s:12:\"PagesCourtes\";i:2;s:10:\"ShortPages\";}s:12:\"Specialpages\";a:5:{i:0;s:16:\"Pages_spéciales\";i:1;s:15:\"PagesSpéciales\";i:2;s:15:\"Pages_speciales\";i:3;s:14:\"PagesSpeciales\";i:4;s:12:\"SpecialPages\";}s:10:\"Statistics\";a:4:{i:0;s:12:\"Statistiques\";i:1;s:5:\"Stats\";i:2;s:10:\"Statistics\";i:3;s:5:\"Stats\";}s:4:\"Tags\";a:2:{i:0;s:7:\"Balises\";i:1;s:4:\"Tags\";}s:7:\"Unblock\";a:3:{i:0;s:10:\"Débloquer\";i:1;s:10:\"Déblocage\";i:2;s:7:\"Unblock\";}s:23:\"Uncategorizedcategories\";a:9:{i:0;s:30:\"Catégories_non_catégorisées\";i:1;s:28:\"CatégoriesNonCatégorisées\";i:2;s:27:\"Categories_non_categorisees\";i:3;s:25:\"CategoriesNonCategorisees\";i:4;s:27:\"Catégories_sans_catégorie\";i:5;s:25:\"CatégoriesSansCatégorie\";i:6;s:25:\"Categories_sans_categorie\";i:7;s:23:\"CategoriesSansCategorie\";i:8;s:23:\"UncategorizedCategories\";}s:19:\"Uncategorizedimages\";a:18:{i:0;s:26:\"Fichiers_non_catégorisés\";i:1;s:24:\"FichiersNonCatégorisés\";i:2;s:24:\"Fichiers_non_categorises\";i:3;s:22:\"FichiersNonCategorises\";i:4;s:24:\"Fichiers_sans_catégorie\";i:5;s:22:\"FichiersSansCatégorie\";i:6;s:23:\"Fichiers_sans_categorie\";i:7;s:21:\"FichiersSansCategorie\";i:8;s:25:\"Images_non_catégorisées\";i:9;s:23:\"ImagesNonCatégorisées\";i:10;s:23:\"Images_non_categorisees\";i:11;s:21:\"ImagesNonCategorisees\";i:12;s:22:\"Images_sans_catégorie\";i:13;s:20:\"ImagesSansCatégorie\";i:14;s:21:\"Images_sans_categorie\";i:15;s:19:\"ImagesSansCategorie\";i:16;s:18:\"UncategorizedFiles\";i:17;s:19:\"UncategorizedImages\";}s:18:\"Uncategorizedpages\";a:9:{i:0;s:24:\"Pages_non_catégorisées\";i:1;s:22:\"PagesNonCatégorisées\";i:2;s:22:\"Pages_non_categorisees\";i:3;s:20:\"PagesNonCategorisees\";i:4;s:21:\"Pages_sans_catégorie\";i:5;s:19:\"PagesSansCatégorie\";i:6;s:20:\"Pages_sans_categorie\";i:7;s:18:\"PagesSansCategorie\";i:8;s:18:\"UncategorizedPages\";}s:22:\"Uncategorizedtemplates\";a:9:{i:0;s:26:\"Modèles_non_catégorisés\";i:1;s:24:\"ModèlesNonCatégorisés\";i:2;s:23:\"Modeles_non_categorises\";i:3;s:21:\"ModelesNonCategorises\";i:4;s:24:\"Modèles_sans_catégorie\";i:5;s:22:\"ModèlesSansCatégorie\";i:6;s:23:\"Modeles_sans_catégorie\";i:7;s:21:\"ModelesSansCatégorie\";i:8;s:22:\"UncategorizedTemplates\";}s:8:\"Undelete\";a:3:{i:0;s:9:\"Restaurer\";i:1;s:12:\"Restauration\";i:2;s:8:\"Undelete\";}s:8:\"Unlockdb\";a:17:{i:0;s:22:\"Déverrouiller_la_base\";i:1;s:20:\"Déverrouillerlabase\";i:2;s:21:\"Deverrouiller_la_base\";i:3;s:19:\"Deverrouillerlabase\";i:4;s:19:\"Déverrouiller_base\";i:5;s:18:\"Déverrouillerbase\";i:6;s:18:\"Deverrouiller_base\";i:7;s:17:\"Deverrouillerbase\";i:8;s:17:\"Déverrouiller_BD\";i:9;s:16:\"DéverrouillerBD\";i:10;s:16:\"Deverrouiller_BD\";i:11;s:15:\"DeverrouillerBD\";i:12;s:17:\"Déverrouiller_bd\";i:13;s:16:\"Déverrouillerbd\";i:14;s:16:\"Deverrouiller_bd\";i:15;s:15:\"Deverrouillerbd\";i:16;s:8:\"UnlockDB\";}s:16:\"Unusedcategories\";a:9:{i:0;s:24:\"Catégories_inutilisées\";i:1;s:23:\"CatégoriesInutilisées\";i:2;s:22:\"Categories_inutilisees\";i:3;s:21:\"CategoriesInutilisees\";i:4;s:26:\"Catégories_non_utilisées\";i:5;s:24:\"CatégoriesNonUtilisées\";i:6;s:24:\"Categories_non_utilisees\";i:7;s:22:\"CategoriesNonUtilisees\";i:8;s:16:\"UnusedCategories\";}s:12:\"Unusedimages\";a:18:{i:0;s:20:\"Fichiers_inutilisés\";i:1;s:19:\"FichiersInutilisés\";i:2;s:19:\"Fichiers_inutilises\";i:3;s:18:\"FichiersInutilises\";i:4;s:22:\"Fichiers_non_utilisés\";i:5;s:21:\"FichiersNon_utilisés\";i:6;s:21:\"Fichiers_non_utilises\";i:7;s:20:\"FichiersNon_utilises\";i:8;s:19:\"Images_inutilisées\";i:9;s:18:\"ImagesInutilisées\";i:10;s:18:\"Images_inutilisees\";i:11;s:17:\"ImagesInutilisees\";i:12;s:21:\"Images_non_utilisées\";i:13;s:19:\"ImagesNonUtilisées\";i:14;s:20:\"Images_non_utilisees\";i:15;s:18:\"ImagesNonUtilisees\";i:16;s:11:\"UnusedFiles\";i:17;s:12:\"UnusedImages\";}s:15:\"Unusedtemplates\";a:9:{i:0;s:20:\"Modèles_inutilisés\";i:1;s:19:\"Modèlesinutilisés\";i:2;s:18:\"Modeles_inutilises\";i:3;s:17:\"Modelesinutilises\";i:4;s:22:\"Modèles_non_utilisés\";i:5;s:20:\"Modèlesnonutilisés\";i:6;s:20:\"Modeles_non_utilises\";i:7;s:18:\"Modelesnonutilises\";i:8;s:15:\"UnusedTemplates\";}s:14:\"Unwatchedpages\";a:3:{i:0;s:17:\"Pages_non_suivies\";i:1;s:15:\"Pagesnonsuivies\";i:2;s:14:\"UnwatchedPages\";}s:6:\"Upload\";a:7:{i:0;s:12:\"Téléverser\";i:1;s:10:\"Televerser\";i:2;s:15:\"Téléversement\";i:3;s:13:\"Televersement\";i:4;s:16:\"Téléchargement\";i:5;s:14:\"Telechargement\";i:6;s:6:\"Upload\";}s:9:\"Userlogin\";a:4:{i:0;s:9:\"Connexion\";i:1;s:14:\"Identification\";i:2;s:9:\"UserLogin\";i:3;s:5:\"Login\";}s:10:\"Userlogout\";a:4:{i:0;s:12:\"Déconnexion\";i:1;s:11:\"Deconnexion\";i:2;s:10:\"UserLogout\";i:3;s:6:\"Logout\";}s:10:\"Userrights\";a:6:{i:0;s:11:\"Permissions\";i:1;s:6:\"Droits\";i:2;s:23:\"Droits_des_utilisateurs\";i:3;s:10:\"UserRights\";i:4;s:9:\"MakeSysop\";i:5;s:7:\"MakeBot\";}s:16:\"Wantedcategories\";a:5:{i:0;s:22:\"Catégories_demandées\";i:1;s:21:\"CatégoriesDemandées\";i:2;s:20:\"Categories_demandees\";i:3;s:19:\"CategoriesDemandees\";i:4;s:16:\"WantedCategories\";}s:11:\"Wantedfiles\";a:5:{i:0;s:18:\"Fichiers_demandés\";i:1;s:17:\"FichiersDemandés\";i:2;s:17:\"Fichiers_demandes\";i:3;s:16:\"FichiersDemandes\";i:4;s:11:\"WantedFiles\";}s:11:\"Wantedpages\";a:10:{i:0;s:16:\"Pages_demandées\";i:1;s:15:\"PagesDemandées\";i:2;s:15:\"Pages_demandees\";i:3;s:14:\"PagesDemandees\";i:4;s:13:\"Liens_brisés\";i:5;s:12:\"LiensBrisés\";i:6;s:12:\"Liens_brises\";i:7;s:11:\"LiensBrises\";i:8;s:11:\"WantedPages\";i:9;s:11:\"BrokenLinks\";}s:15:\"Wantedtemplates\";a:5:{i:0;s:18:\"Modèles_demandés\";i:1;s:17:\"ModèlesDemandés\";i:2;s:16:\"Modeles_demandes\";i:3;s:15:\"ModelesDemandes\";i:4;s:15:\"WantedTemplates\";}s:9:\"Watchlist\";a:4:{i:0;s:14:\"Liste_de_suivi\";i:1;s:12:\"ListeDeSuivi\";i:2;s:5:\"Suivi\";i:3;s:9:\"Watchlist\";}s:13:\"Whatlinkshere\";a:5:{i:0;s:12:\"Pages_liées\";i:1;s:11:\"PagesLiées\";i:2;s:11:\"Pages_liees\";i:3;s:10:\"PagesLiees\";i:4;s:13:\"WhatLinksHere\";}s:16:\"Withoutinterwiki\";a:5:{i:0;s:14:\"Sans_interwiki\";i:1;s:13:\"Sansinterwiki\";i:2;s:15:\"Sans_interwikis\";i:3;s:14:\"Sansinterwikis\";i:4;s:16:\"WithoutInterwiki\";}s:12:\"AllMyUploads\";a:2:{i:0;s:12:\"AllMyUploads\";i:1;s:10:\"AllMyFiles\";}s:7:\"ApiHelp\";a:1:{i:0;s:7:\"ApiHelp\";}s:10:\"ApiSandbox\";a:1:{i:0;s:10:\"ApiSandbox\";}s:13:\"AutoblockList\";a:2:{i:0;s:13:\"AutoblockList\";i:1;s:14:\"ListAutoblocks\";}s:12:\"BotPasswords\";a:1:{i:0;s:12:\"BotPasswords\";}s:18:\"ChangeContentModel\";a:1:{i:0;s:18:\"ChangeContentModel\";}s:17:\"ChangeCredentials\";a:1:{i:0;s:17:\"ChangeCredentials\";}s:13:\"Contributions\";a:2:{i:0;s:13:\"Contributions\";i:1;s:8:\"Contribs\";}s:4:\"Diff\";a:1:{i:0;s:4:\"Diff\";}s:8:\"EditTags\";a:1:{i:0;s:8:\"EditTags\";}s:13:\"GoToInterwiki\";a:1:{i:0;s:13:\"GoToInterwiki\";}s:14:\"JavaScriptTest\";a:1:{i:0;s:14:\"JavaScriptTest\";}s:12:\"LinkAccounts\";a:1:{i:0;s:12:\"LinkAccounts\";}s:10:\"Listgrants\";a:1:{i:0;s:10:\"ListGrants\";}s:19:\"ListDuplicatedFiles\";a:2:{i:0;s:19:\"ListDuplicatedFiles\";i:1;s:18:\"ListFileDuplicates\";}s:15:\"MediaStatistics\";a:1:{i:0;s:15:\"MediaStatistics\";}s:14:\"Mostinterwikis\";a:1:{i:0;s:14:\"MostInterwikis\";}s:9:\"Myuploads\";a:2:{i:0;s:9:\"MyUploads\";i:1;s:7:\"MyFiles\";}s:8:\"PageData\";a:1:{i:0;s:8:\"PageData\";}s:12:\"PageLanguage\";a:1:{i:0;s:12:\"PageLanguage\";}s:16:\"PasswordPolicies\";a:1:{i:0;s:16:\"PasswordPolicies\";}s:14:\"Randomrootpage\";a:1:{i:0;s:14:\"RandomRootpage\";}s:17:\"RemoveCredentials\";a:1:{i:0;s:17:\"RemoveCredentials\";}s:11:\"ResetTokens\";a:1:{i:0;s:11:\"ResetTokens\";}s:7:\"RunJobs\";a:1:{i:0;s:7:\"RunJobs\";}s:18:\"TrackingCategories\";a:1:{i:0;s:18:\"TrackingCategories\";}s:14:\"UnlinkAccounts\";a:1:{i:0;s:14:\"UnlinkAccounts\";}s:11:\"UploadStash\";a:1:{i:0;s:11:\"UploadStash\";}s:7:\"Version\";a:1:{i:0;s:7:\"Version\";}}');
/*!40000 ALTER TABLE `devl10n_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devlanglinks`
--

DROP TABLE IF EXISTS `devlanglinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devlanglinks` (
  `ll_from` int(10) unsigned NOT NULL DEFAULT '0',
  `ll_lang` varbinary(20) NOT NULL DEFAULT '',
  `ll_title` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ll_from`,`ll_lang`),
  KEY `ll_lang` (`ll_lang`,`ll_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devlanglinks`
--

LOCK TABLES `devlanglinks` WRITE;
/*!40000 ALTER TABLE `devlanglinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `devlanglinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devlog_search`
--

DROP TABLE IF EXISTS `devlog_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devlog_search` (
  `ls_field` varbinary(32) NOT NULL,
  `ls_value` varbinary(255) NOT NULL,
  `ls_log_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ls_field`,`ls_value`,`ls_log_id`),
  KEY `ls_log_id` (`ls_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devlog_search`
--

LOCK TABLES `devlog_search` WRITE;
/*!40000 ALTER TABLE `devlog_search` DISABLE KEYS */;
INSERT INTO `devlog_search` VALUES (_binary 'associated_rev_id',_binary '1',1);
/*!40000 ALTER TABLE `devlog_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devlogging`
--

DROP TABLE IF EXISTS `devlogging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devlogging` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` varbinary(32) NOT NULL DEFAULT '',
  `log_action` varbinary(32) NOT NULL DEFAULT '',
  `log_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  `log_user` int(10) unsigned NOT NULL DEFAULT '0',
  `log_user_text` varbinary(255) NOT NULL DEFAULT '',
  `log_actor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `log_namespace` int(11) NOT NULL DEFAULT '0',
  `log_title` varbinary(255) NOT NULL DEFAULT '',
  `log_page` int(10) unsigned DEFAULT NULL,
  `log_comment` varbinary(767) NOT NULL DEFAULT '',
  `log_comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `log_params` blob NOT NULL,
  `log_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `type_time` (`log_type`,`log_timestamp`),
  KEY `user_time` (`log_user`,`log_timestamp`),
  KEY `actor_time` (`log_actor`,`log_timestamp`),
  KEY `page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  KEY `times` (`log_timestamp`),
  KEY `log_user_type_time` (`log_user`,`log_type`,`log_timestamp`),
  KEY `log_actor_type_time` (`log_actor`,`log_type`,`log_timestamp`),
  KEY `log_page_id_time` (`log_page`,`log_timestamp`),
  KEY `log_type_action` (`log_type`,`log_action`,`log_timestamp`),
  KEY `log_user_text_type_time` (`log_user_text`,`log_type`,`log_timestamp`),
  KEY `log_user_text_time` (`log_user_text`,`log_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devlogging`
--

LOCK TABLES `devlogging` WRITE;
/*!40000 ALTER TABLE `devlogging` DISABLE KEYS */;
INSERT INTO `devlogging` VALUES (1,_binary 'create',_binary 'create',_binary '20190317055307',0,_binary 'MediaWiki default',0,0,_binary 'Accueil',1,'',0,_binary 'a:1:{s:17:\"associated_rev_id\";i:1;}',0);
/*!40000 ALTER TABLE `devlogging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devmodule_deps`
--

DROP TABLE IF EXISTS `devmodule_deps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devmodule_deps` (
  `md_module` varbinary(255) NOT NULL,
  `md_skin` varbinary(32) NOT NULL,
  `md_deps` mediumblob NOT NULL,
  PRIMARY KEY (`md_module`,`md_skin`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devmodule_deps`
--

LOCK TABLES `devmodule_deps` WRITE;
/*!40000 ALTER TABLE `devmodule_deps` DISABLE KEYS */;
INSERT INTO `devmodule_deps` VALUES (_binary 'mediawiki.legacy.shared',_binary 'vector|fr',_binary '[\"resources/src/mediawiki.legacy/images/ajax-loader.gif\",\"resources/src/mediawiki.legacy/images/spinner.gif\"]'),(_binary 'mediawiki.skinning.interface',_binary 'vector|fr',_binary '[\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.svg\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.svg\"]'),(_binary 'skins.vector.styles',_binary 'vector|fr',_binary '[\"resources/src/mediawiki.less/mediawiki.mixins.animation.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.mixins.rotation.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"skins/Vector/components/common.less\",\"skins/Vector/components/externalLinks.less\",\"skins/Vector/components/footer.less\",\"skins/Vector/components/navigation.less\",\"skins/Vector/components/personalMenu.less\",\"skins/Vector/components/search.less\",\"skins/Vector/components/tabs.less\",\"skins/Vector/components/watchstar.less\",\"skins/Vector/images/arrow-down.png\",\"skins/Vector/images/arrow-down.svg\",\"skins/Vector/images/bullet-icon.png\",\"skins/Vector/images/bullet-icon.svg\",\"skins/Vector/images/external-link-ltr-icon.png\",\"skins/Vector/images/external-link-ltr-icon.svg\",\"skins/Vector/images/page-fade.png\",\"skins/Vector/images/portal-break.png\",\"skins/Vector/images/search-fade.png\",\"skins/Vector/images/search-ltr.png\",\"skins/Vector/images/search-ltr.svg\",\"skins/Vector/images/tab-break.png\",\"skins/Vector/images/tab-current-fade.png\",\"skins/Vector/images/tab-normal-fade.png\",\"skins/Vector/images/unwatch-icon-hl.png\",\"skins/Vector/images/unwatch-icon-hl.svg\",\"skins/Vector/images/unwatch-icon.png\",\"skins/Vector/images/unwatch-icon.svg\",\"skins/Vector/images/user-avatar.png\",\"skins/Vector/images/user-avatar.svg\",\"skins/Vector/images/watch-icon-hl.png\",\"skins/Vector/images/watch-icon-hl.svg\",\"skins/Vector/images/watch-icon-loading.png\",\"skins/Vector/images/watch-icon-loading.svg\",\"skins/Vector/images/watch-icon.png\",\"skins/Vector/images/watch-icon.svg\",\"skins/Vector/print.less\",\"skins/Vector/screen-hd.less\",\"skins/Vector/screen.less\",\"skins/Vector/variables.less\"]');
/*!40000 ALTER TABLE `devmodule_deps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devobjectcache`
--

DROP TABLE IF EXISTS `devobjectcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devobjectcache` (
  `keyname` varbinary(255) NOT NULL DEFAULT '',
  `value` mediumblob,
  `exptime` datetime DEFAULT NULL,
  PRIMARY KEY (`keyname`),
  KEY `exptime` (`exptime`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devobjectcache`
--

LOCK TABLES `devobjectcache` WRITE;
/*!40000 ALTER TABLE `devobjectcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `devobjectcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devoldimage`
--

DROP TABLE IF EXISTS `devoldimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devoldimage` (
  `oi_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_archive_name` varbinary(255) NOT NULL DEFAULT '',
  `oi_size` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_width` int(11) NOT NULL DEFAULT '0',
  `oi_height` int(11) NOT NULL DEFAULT '0',
  `oi_bits` int(11) NOT NULL DEFAULT '0',
  `oi_description` varbinary(767) NOT NULL DEFAULT '',
  `oi_description_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `oi_user` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_user_text` varbinary(255) NOT NULL DEFAULT '',
  `oi_actor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `oi_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') NOT NULL DEFAULT 'unknown',
  `oi_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `oi_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `oi_sha1` varbinary(32) NOT NULL DEFAULT '',
  KEY `oi_usertext_timestamp` (`oi_user_text`,`oi_timestamp`),
  KEY `oi_actor_timestamp` (`oi_actor`,`oi_timestamp`),
  KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  KEY `oi_sha1` (`oi_sha1`(10))
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devoldimage`
--

LOCK TABLES `devoldimage` WRITE;
/*!40000 ALTER TABLE `devoldimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `devoldimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devpage`
--

DROP TABLE IF EXISTS `devpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devpage` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_namespace` int(11) NOT NULL,
  `page_title` varbinary(255) NOT NULL,
  `page_restrictions` tinyblob NOT NULL,
  `page_is_redirect` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_is_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_random` double unsigned NOT NULL,
  `page_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `page_links_updated` varbinary(14) DEFAULT NULL,
  `page_latest` int(10) unsigned NOT NULL,
  `page_len` int(10) unsigned NOT NULL,
  `page_content_model` varbinary(32) DEFAULT NULL,
  `page_lang` varbinary(35) DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `name_title` (`page_namespace`,`page_title`),
  KEY `page_random` (`page_random`),
  KEY `page_len` (`page_len`),
  KEY `page_redirect_namespace_len` (`page_is_redirect`,`page_namespace`,`page_len`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devpage`
--

LOCK TABLES `devpage` WRITE;
/*!40000 ALTER TABLE `devpage` DISABLE KEYS */;
INSERT INTO `devpage` VALUES (1,0,_binary 'Accueil','',0,1,0.041113267327,_binary '20190317055307',NULL,1,852,_binary 'wikitext',NULL);
/*!40000 ALTER TABLE `devpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devpage_props`
--

DROP TABLE IF EXISTS `devpage_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devpage_props` (
  `pp_page` int(11) NOT NULL,
  `pp_propname` varbinary(60) NOT NULL,
  `pp_value` blob NOT NULL,
  `pp_sortkey` float DEFAULT NULL,
  PRIMARY KEY (`pp_page`,`pp_propname`),
  UNIQUE KEY `pp_propname_page` (`pp_propname`,`pp_page`),
  UNIQUE KEY `pp_propname_sortkey_page` (`pp_propname`,`pp_sortkey`,`pp_page`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devpage_props`
--

LOCK TABLES `devpage_props` WRITE;
/*!40000 ALTER TABLE `devpage_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `devpage_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devpage_restrictions`
--

DROP TABLE IF EXISTS `devpage_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devpage_restrictions` (
  `pr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pr_page` int(11) NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_user` int(10) unsigned DEFAULT NULL,
  `pr_expiry` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  UNIQUE KEY `pr_pagetype` (`pr_page`,`pr_type`),
  KEY `pr_typelevel` (`pr_type`,`pr_level`),
  KEY `pr_level` (`pr_level`),
  KEY `pr_cascade` (`pr_cascade`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devpage_restrictions`
--

LOCK TABLES `devpage_restrictions` WRITE;
/*!40000 ALTER TABLE `devpage_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `devpage_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devpagelinks`
--

DROP TABLE IF EXISTS `devpagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devpagelinks` (
  `pl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `pl_from_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_title` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`pl_from`,`pl_namespace`,`pl_title`),
  KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`),
  KEY `pl_backlinks_namespace` (`pl_from_namespace`,`pl_namespace`,`pl_title`,`pl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devpagelinks`
--

LOCK TABLES `devpagelinks` WRITE;
/*!40000 ALTER TABLE `devpagelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `devpagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devprotected_titles`
--

DROP TABLE IF EXISTS `devprotected_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devprotected_titles` (
  `pt_namespace` int(11) NOT NULL,
  `pt_title` varbinary(255) NOT NULL,
  `pt_user` int(10) unsigned NOT NULL,
  `pt_reason` varbinary(767) DEFAULT '',
  `pt_reason_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `pt_timestamp` binary(14) NOT NULL,
  `pt_expiry` varbinary(14) NOT NULL DEFAULT '',
  `pt_create_perm` varbinary(60) NOT NULL,
  PRIMARY KEY (`pt_namespace`,`pt_title`),
  KEY `pt_timestamp` (`pt_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devprotected_titles`
--

LOCK TABLES `devprotected_titles` WRITE;
/*!40000 ALTER TABLE `devprotected_titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `devprotected_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devquerycache`
--

DROP TABLE IF EXISTS `devquerycache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devquerycache` (
  `qc_type` varbinary(32) NOT NULL,
  `qc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qc_namespace` int(11) NOT NULL DEFAULT '0',
  `qc_title` varbinary(255) NOT NULL DEFAULT '',
  KEY `qc_type` (`qc_type`,`qc_value`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devquerycache`
--

LOCK TABLES `devquerycache` WRITE;
/*!40000 ALTER TABLE `devquerycache` DISABLE KEYS */;
/*!40000 ALTER TABLE `devquerycache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devquerycache_info`
--

DROP TABLE IF EXISTS `devquerycache_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devquerycache_info` (
  `qci_type` varbinary(32) NOT NULL DEFAULT '',
  `qci_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  PRIMARY KEY (`qci_type`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devquerycache_info`
--

LOCK TABLES `devquerycache_info` WRITE;
/*!40000 ALTER TABLE `devquerycache_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `devquerycache_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devquerycachetwo`
--

DROP TABLE IF EXISTS `devquerycachetwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devquerycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qcc_namespace` int(11) NOT NULL DEFAULT '0',
  `qcc_title` varbinary(255) NOT NULL DEFAULT '',
  `qcc_namespacetwo` int(11) NOT NULL DEFAULT '0',
  `qcc_titletwo` varbinary(255) NOT NULL DEFAULT '',
  KEY `qcc_type` (`qcc_type`,`qcc_value`),
  KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devquerycachetwo`
--

LOCK TABLES `devquerycachetwo` WRITE;
/*!40000 ALTER TABLE `devquerycachetwo` DISABLE KEYS */;
/*!40000 ALTER TABLE `devquerycachetwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devrecentchanges`
--

DROP TABLE IF EXISTS `devrecentchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devrecentchanges` (
  `rc_id` int(11) NOT NULL AUTO_INCREMENT,
  `rc_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `rc_user` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_user_text` varbinary(255) NOT NULL DEFAULT '',
  `rc_actor` bigint(20) unsigned NOT NULL DEFAULT '0',
  `rc_namespace` int(11) NOT NULL DEFAULT '0',
  `rc_title` varbinary(255) NOT NULL DEFAULT '',
  `rc_comment` varbinary(767) NOT NULL DEFAULT '',
  `rc_comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `rc_minor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_bot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_cur_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_this_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_last_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_source` varbinary(16) NOT NULL DEFAULT '',
  `rc_patrolled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_ip` varbinary(40) NOT NULL DEFAULT '',
  `rc_old_len` int(11) DEFAULT NULL,
  `rc_new_len` int(11) DEFAULT NULL,
  `rc_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_logid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_log_type` varbinary(255) DEFAULT NULL,
  `rc_log_action` varbinary(255) DEFAULT NULL,
  `rc_params` blob,
  PRIMARY KEY (`rc_id`),
  KEY `rc_timestamp` (`rc_timestamp`),
  KEY `rc_namespace_title_timestamp` (`rc_namespace`,`rc_title`,`rc_timestamp`),
  KEY `rc_cur_id` (`rc_cur_id`),
  KEY `new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  KEY `rc_ip` (`rc_ip`),
  KEY `rc_ns_usertext` (`rc_namespace`,`rc_user_text`),
  KEY `rc_ns_actor` (`rc_namespace`,`rc_actor`),
  KEY `rc_user_text` (`rc_user_text`,`rc_timestamp`),
  KEY `rc_actor` (`rc_actor`,`rc_timestamp`),
  KEY `rc_name_type_patrolled_timestamp` (`rc_namespace`,`rc_type`,`rc_patrolled`,`rc_timestamp`),
  KEY `rc_this_oldid` (`rc_this_oldid`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devrecentchanges`
--

LOCK TABLES `devrecentchanges` WRITE;
/*!40000 ALTER TABLE `devrecentchanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `devrecentchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devredirect`
--

DROP TABLE IF EXISTS `devredirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devredirect` (
  `rd_from` int(10) unsigned NOT NULL DEFAULT '0',
  `rd_namespace` int(11) NOT NULL DEFAULT '0',
  `rd_title` varbinary(255) NOT NULL DEFAULT '',
  `rd_interwiki` varbinary(32) DEFAULT NULL,
  `rd_fragment` varbinary(255) DEFAULT NULL,
  PRIMARY KEY (`rd_from`),
  KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devredirect`
--

LOCK TABLES `devredirect` WRITE;
/*!40000 ALTER TABLE `devredirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `devredirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devrevision`
--

DROP TABLE IF EXISTS `devrevision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devrevision` (
  `rev_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rev_page` int(10) unsigned NOT NULL,
  `rev_text_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rev_comment` varbinary(767) NOT NULL DEFAULT '',
  `rev_user` int(10) unsigned NOT NULL DEFAULT '0',
  `rev_user_text` varbinary(255) NOT NULL DEFAULT '',
  `rev_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `rev_minor_edit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_len` int(10) unsigned DEFAULT NULL,
  `rev_parent_id` int(10) unsigned DEFAULT NULL,
  `rev_sha1` varbinary(32) NOT NULL DEFAULT '',
  `rev_content_model` varbinary(32) DEFAULT NULL,
  `rev_content_format` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`rev_id`),
  KEY `rev_page_id` (`rev_page`,`rev_id`),
  KEY `rev_timestamp` (`rev_timestamp`),
  KEY `page_timestamp` (`rev_page`,`rev_timestamp`),
  KEY `user_timestamp` (`rev_user`,`rev_timestamp`),
  KEY `usertext_timestamp` (`rev_user_text`,`rev_timestamp`),
  KEY `page_user_timestamp` (`rev_page`,`rev_user`,`rev_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=1024;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devrevision`
--

LOCK TABLES `devrevision` WRITE;
/*!40000 ALTER TABLE `devrevision` DISABLE KEYS */;
INSERT INTO `devrevision` VALUES (1,1,1,'',0,_binary 'MediaWiki default',_binary '20190317055307',0,0,852,0,_binary '9glwn9v3j4u2b23d5u377n48nlobre1',NULL,NULL);
/*!40000 ALTER TABLE `devrevision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devrevision_actor_temp`
--

DROP TABLE IF EXISTS `devrevision_actor_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devrevision_actor_temp` (
  `revactor_rev` int(10) unsigned NOT NULL,
  `revactor_actor` bigint(20) unsigned NOT NULL,
  `revactor_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `revactor_page` int(10) unsigned NOT NULL,
  PRIMARY KEY (`revactor_rev`,`revactor_actor`),
  UNIQUE KEY `revactor_rev` (`revactor_rev`),
  KEY `actor_timestamp` (`revactor_actor`,`revactor_timestamp`),
  KEY `page_actor_timestamp` (`revactor_page`,`revactor_actor`,`revactor_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devrevision_actor_temp`
--

LOCK TABLES `devrevision_actor_temp` WRITE;
/*!40000 ALTER TABLE `devrevision_actor_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `devrevision_actor_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devrevision_comment_temp`
--

DROP TABLE IF EXISTS `devrevision_comment_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devrevision_comment_temp` (
  `revcomment_rev` int(10) unsigned NOT NULL,
  `revcomment_comment_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`revcomment_rev`,`revcomment_comment_id`),
  UNIQUE KEY `revcomment_rev` (`revcomment_rev`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devrevision_comment_temp`
--

LOCK TABLES `devrevision_comment_temp` WRITE;
/*!40000 ALTER TABLE `devrevision_comment_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `devrevision_comment_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devsearchindex`
--

DROP TABLE IF EXISTS `devsearchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devsearchindex` (
  `si_page` int(10) unsigned NOT NULL,
  `si_title` varchar(255) NOT NULL DEFAULT '',
  `si_text` mediumtext NOT NULL,
  UNIQUE KEY `si_page` (`si_page`),
  FULLTEXT KEY `si_title` (`si_title`),
  FULLTEXT KEY `si_text` (`si_text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devsearchindex`
--

LOCK TABLES `devsearchindex` WRITE;
/*!40000 ALTER TABLE `devsearchindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `devsearchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devsite_identifiers`
--

DROP TABLE IF EXISTS `devsite_identifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devsite_identifiers` (
  `si_site` int(10) unsigned NOT NULL,
  `si_type` varbinary(32) NOT NULL,
  `si_key` varbinary(32) NOT NULL,
  PRIMARY KEY (`si_type`,`si_key`),
  KEY `site_ids_site` (`si_site`),
  KEY `site_ids_key` (`si_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devsite_identifiers`
--

LOCK TABLES `devsite_identifiers` WRITE;
/*!40000 ALTER TABLE `devsite_identifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `devsite_identifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devsite_stats`
--

DROP TABLE IF EXISTS `devsite_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devsite_stats` (
  `ss_row_id` int(10) unsigned NOT NULL,
  `ss_total_edits` bigint(20) unsigned DEFAULT NULL,
  `ss_good_articles` bigint(20) unsigned DEFAULT NULL,
  `ss_total_pages` bigint(20) unsigned DEFAULT NULL,
  `ss_users` bigint(20) unsigned DEFAULT NULL,
  `ss_active_users` bigint(20) unsigned DEFAULT NULL,
  `ss_images` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ss_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devsite_stats`
--

LOCK TABLES `devsite_stats` WRITE;
/*!40000 ALTER TABLE `devsite_stats` DISABLE KEYS */;
INSERT INTO `devsite_stats` VALUES (1,0,0,0,0,0,0);
/*!40000 ALTER TABLE `devsite_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devsites`
--

DROP TABLE IF EXISTS `devsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devsites` (
  `site_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_global_key` varbinary(32) NOT NULL,
  `site_type` varbinary(32) NOT NULL,
  `site_group` varbinary(32) NOT NULL,
  `site_source` varbinary(32) NOT NULL,
  `site_language` varbinary(32) NOT NULL,
  `site_protocol` varbinary(32) NOT NULL,
  `site_domain` varbinary(255) NOT NULL,
  `site_data` blob NOT NULL,
  `site_forward` tinyint(1) NOT NULL,
  `site_config` blob NOT NULL,
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `sites_global_key` (`site_global_key`),
  KEY `sites_type` (`site_type`),
  KEY `sites_group` (`site_group`),
  KEY `sites_source` (`site_source`),
  KEY `sites_language` (`site_language`),
  KEY `sites_protocol` (`site_protocol`),
  KEY `sites_domain` (`site_domain`),
  KEY `sites_forward` (`site_forward`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devsites`
--

LOCK TABLES `devsites` WRITE;
/*!40000 ALTER TABLE `devsites` DISABLE KEYS */;
/*!40000 ALTER TABLE `devsites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devslot_roles`
--

DROP TABLE IF EXISTS `devslot_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devslot_roles` (
  `role_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `role_name` varbinary(64) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devslot_roles`
--

LOCK TABLES `devslot_roles` WRITE;
/*!40000 ALTER TABLE `devslot_roles` DISABLE KEYS */;
INSERT INTO `devslot_roles` VALUES (1,_binary 'main');
/*!40000 ALTER TABLE `devslot_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devslots`
--

DROP TABLE IF EXISTS `devslots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devslots` (
  `slot_revision_id` bigint(20) unsigned NOT NULL,
  `slot_role_id` smallint(5) unsigned NOT NULL,
  `slot_content_id` bigint(20) unsigned NOT NULL,
  `slot_origin` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`slot_revision_id`,`slot_role_id`),
  KEY `slot_revision_origin_role` (`slot_revision_id`,`slot_origin`,`slot_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devslots`
--

LOCK TABLES `devslots` WRITE;
/*!40000 ALTER TABLE `devslots` DISABLE KEYS */;
INSERT INTO `devslots` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `devslots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devtag_summary`
--

DROP TABLE IF EXISTS `devtag_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devtag_summary` (
  `ts_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ts_rc_id` int(11) DEFAULT NULL,
  `ts_log_id` int(10) unsigned DEFAULT NULL,
  `ts_rev_id` int(10) unsigned DEFAULT NULL,
  `ts_tags` blob NOT NULL,
  PRIMARY KEY (`ts_id`),
  UNIQUE KEY `tag_summary_rc_id` (`ts_rc_id`),
  UNIQUE KEY `tag_summary_log_id` (`ts_log_id`),
  UNIQUE KEY `tag_summary_rev_id` (`ts_rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devtag_summary`
--

LOCK TABLES `devtag_summary` WRITE;
/*!40000 ALTER TABLE `devtag_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `devtag_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devtemplatelinks`
--

DROP TABLE IF EXISTS `devtemplatelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devtemplatelinks` (
  `tl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `tl_from_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_title` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tl_from`,`tl_namespace`,`tl_title`),
  KEY `tl_namespace` (`tl_namespace`,`tl_title`,`tl_from`),
  KEY `tl_backlinks_namespace` (`tl_from_namespace`,`tl_namespace`,`tl_title`,`tl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devtemplatelinks`
--

LOCK TABLES `devtemplatelinks` WRITE;
/*!40000 ALTER TABLE `devtemplatelinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `devtemplatelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devtext`
--

DROP TABLE IF EXISTS `devtext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devtext` (
  `old_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_text` mediumblob NOT NULL,
  `old_flags` tinyblob NOT NULL,
  PRIMARY KEY (`old_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary MAX_ROWS=10000000 AVG_ROW_LENGTH=10240;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devtext`
--

LOCK TABLES `devtext` WRITE;
/*!40000 ALTER TABLE `devtext` DISABLE KEYS */;
INSERT INTO `devtext` VALUES (1,_binary '<strong>MediaWiki a été installé.</strong>\n\nConsultez le [https://www.mediawiki.org/wiki/Special:MyLanguage/Help:Contents Guide de l’utilisateur] pour plus d’informations sur l’utilisation de ce logiciel de wiki.\n\n== Pour démarrer ==\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Configuration_settings Liste des paramètres de configuration]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:FAQ/fr Questions courantes sur MediaWiki]\n* [https://lists.wikimedia.org/mailman/listinfo/mediawiki-announce Liste de discussion sur les distributions de MediaWiki]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Localisation#Translation_resources Adaptez MediaWiki dans votre langue]\n* [https://www.mediawiki.org/wiki/Special:MyLanguage/Manual:Combating_spam Apprendre comment lutter contre le pourriel dans votre wiki]',_binary 'utf-8');
/*!40000 ALTER TABLE `devtext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devupdatelog`
--

DROP TABLE IF EXISTS `devupdatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devupdatelog` (
  `ul_key` varbinary(255) NOT NULL,
  `ul_value` blob,
  PRIMARY KEY (`ul_key`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devupdatelog`
--

LOCK TABLES `devupdatelog` WRITE;
/*!40000 ALTER TABLE `devupdatelog` DISABLE KEYS */;
INSERT INTO `devupdatelog` VALUES (_binary 'PingBack',_binary '86402d9a44b7f7cfd687677d8a3add19'),(_binary 'Pingback-1.32.1',_binary '1552802104'),(_binary 'filearchive-fa_major_mime-patch-fa_major_mime-chemical.sql',NULL),(_binary 'image-img_major_mime-patch-img_major_mime-chemical.sql',NULL),(_binary 'oldimage-oi_major_mime-patch-oi_major_mime-chemical.sql',NULL),(_binary 'user_former_groups-ufg_group-patch-ufg_group-length-increase-255.sql',NULL),(_binary 'user_groups-ug_group-patch-ug_group-length-increase-255.sql',NULL),(_binary 'user_properties-up_property-patch-up_property.sql',NULL);
/*!40000 ALTER TABLE `devupdatelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devuploadstash`
--

DROP TABLE IF EXISTS `devuploadstash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devuploadstash` (
  `us_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `us_user` int(10) unsigned NOT NULL,
  `us_key` varbinary(255) NOT NULL,
  `us_orig_path` varbinary(255) NOT NULL,
  `us_path` varbinary(255) NOT NULL,
  `us_source_type` varbinary(50) DEFAULT NULL,
  `us_timestamp` varbinary(14) NOT NULL,
  `us_status` varbinary(50) NOT NULL,
  `us_chunk_inx` int(10) unsigned DEFAULT NULL,
  `us_props` blob,
  `us_size` int(10) unsigned NOT NULL,
  `us_sha1` varbinary(31) NOT NULL,
  `us_mime` varbinary(255) DEFAULT NULL,
  `us_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE','3D') DEFAULT NULL,
  `us_image_width` int(10) unsigned DEFAULT NULL,
  `us_image_height` int(10) unsigned DEFAULT NULL,
  `us_image_bits` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`us_id`),
  UNIQUE KEY `us_key` (`us_key`),
  KEY `us_user` (`us_user`),
  KEY `us_timestamp` (`us_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devuploadstash`
--

LOCK TABLES `devuploadstash` WRITE;
/*!40000 ALTER TABLE `devuploadstash` DISABLE KEYS */;
/*!40000 ALTER TABLE `devuploadstash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devuser`
--

DROP TABLE IF EXISTS `devuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devuser` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varbinary(255) NOT NULL DEFAULT '',
  `user_real_name` varbinary(255) NOT NULL DEFAULT '',
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_newpass_time` binary(14) DEFAULT NULL,
  `user_email` tinyblob NOT NULL,
  `user_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_email_authenticated` binary(14) DEFAULT NULL,
  `user_email_token` binary(32) DEFAULT NULL,
  `user_email_token_expires` binary(14) DEFAULT NULL,
  `user_registration` binary(14) DEFAULT NULL,
  `user_editcount` int(11) DEFAULT NULL,
  `user_password_expires` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `user_email_token` (`user_email_token`),
  KEY `user_email` (`user_email`(50))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devuser`
--

LOCK TABLES `devuser` WRITE;
/*!40000 ALTER TABLE `devuser` DISABLE KEYS */;
INSERT INTO `devuser` VALUES (1,_binary 'Romain','',_binary ':pbkdf2:sha512:30000:64:LLHGjNRbQLrRz9MI0cTaJw==:S/IFQX4M0woE2O3Dln8bqiEV9g6fsZIRwx5jcJpY5uUGK+wOCLMuJXwwJHJZrhv7tg9zIwxLYUjfoyl4qA6PfA==','',NULL,'',_binary '20190317055313',_binary '6614a9a72f5e9b8067cf670fd49c1d29',NULL,_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,_binary '20190317055306',0,NULL);
/*!40000 ALTER TABLE `devuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devuser_former_groups`
--

DROP TABLE IF EXISTS `devuser_former_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devuser_former_groups` (
  `ufg_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ufg_group` varbinary(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ufg_user`,`ufg_group`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devuser_former_groups`
--

LOCK TABLES `devuser_former_groups` WRITE;
/*!40000 ALTER TABLE `devuser_former_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `devuser_former_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devuser_groups`
--

DROP TABLE IF EXISTS `devuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devuser_groups` (
  `ug_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ug_group` varbinary(255) NOT NULL DEFAULT '',
  `ug_expiry` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`ug_user`,`ug_group`),
  KEY `ug_group` (`ug_group`),
  KEY `ug_expiry` (`ug_expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devuser_groups`
--

LOCK TABLES `devuser_groups` WRITE;
/*!40000 ALTER TABLE `devuser_groups` DISABLE KEYS */;
INSERT INTO `devuser_groups` VALUES (1,_binary 'bureaucrat',NULL),(1,_binary 'interface-admin',NULL),(1,_binary 'sysop',NULL);
/*!40000 ALTER TABLE `devuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devuser_newtalk`
--

DROP TABLE IF EXISTS `devuser_newtalk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devuser_newtalk` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_ip` varbinary(40) NOT NULL DEFAULT '',
  `user_last_timestamp` varbinary(14) DEFAULT NULL,
  KEY `un_user_id` (`user_id`),
  KEY `un_user_ip` (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devuser_newtalk`
--

LOCK TABLES `devuser_newtalk` WRITE;
/*!40000 ALTER TABLE `devuser_newtalk` DISABLE KEYS */;
/*!40000 ALTER TABLE `devuser_newtalk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devuser_properties`
--

DROP TABLE IF EXISTS `devuser_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devuser_properties` (
  `up_user` int(10) unsigned NOT NULL,
  `up_property` varbinary(255) NOT NULL,
  `up_value` blob,
  PRIMARY KEY (`up_user`,`up_property`),
  KEY `user_properties_property` (`up_property`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devuser_properties`
--

LOCK TABLES `devuser_properties` WRITE;
/*!40000 ALTER TABLE `devuser_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `devuser_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devvalid_tag`
--

DROP TABLE IF EXISTS `devvalid_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devvalid_tag` (
  `vt_tag` varbinary(255) NOT NULL,
  PRIMARY KEY (`vt_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devvalid_tag`
--

LOCK TABLES `devvalid_tag` WRITE;
/*!40000 ALTER TABLE `devvalid_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `devvalid_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devwatchlist`
--

DROP TABLE IF EXISTS `devwatchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devwatchlist` (
  `wl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wl_user` int(10) unsigned NOT NULL,
  `wl_namespace` int(11) NOT NULL DEFAULT '0',
  `wl_title` varbinary(255) NOT NULL DEFAULT '',
  `wl_notificationtimestamp` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`wl_id`),
  UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  KEY `namespace_title` (`wl_namespace`,`wl_title`),
  KEY `wl_user_notificationtimestamp` (`wl_user`,`wl_notificationtimestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devwatchlist`
--

LOCK TABLES `devwatchlist` WRITE;
/*!40000 ALTER TABLE `devwatchlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `devwatchlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-17  8:08:23
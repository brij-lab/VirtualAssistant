CREATE DATABASE  IF NOT EXISTS `facultycontact` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `facultycontact`;
-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: facultycontact
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.13.10.1

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
-- Table structure for table `faculty_info`
--

DROP TABLE IF EXISTS `faculty_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_id` int(11) DEFAULT NULL,
  `info` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_info`
--

LOCK TABLES `faculty_info` WRITE;
/*!40000 ALTER TABLE `faculty_info` DISABLE KEYS */;
INSERT INTO `faculty_info` VALUES (37,117,'1171',2),(38,117,'1201',5),(39,117,'23006281',3),(40,117,'9866406028',4),(41,118,'8374237609',4),(42,119,'13390',2),(43,119,'8500727346',4),(44,120,'1326',2),(45,120,'1909',5),(46,120,'9849058212',4),(47,121,'1363',2),(48,121,'1924',5),(49,121,'9703135572',4),(50,122,'1506',2),(51,122,'1918',5),(52,122,'9701356641',4),(53,123,'11500',2),(54,123,'23347010',3),(55,123,'9177463928',4),(56,124,'11190',2),(57,124,'27114465',3),(58,124,'9849251716',4),(59,125,'14010',2),(60,125,'9581324422',4),(61,126,'1537',2),(62,126,'1904',5),(63,126,'9502990346',4),(64,127,'9676728080',4),(65,128,'11430',2),(66,128,'27057570',3),(67,128,'9989236525',4),(68,129,'1446',2),(69,129,'1940',5),(70,130,'11750',2),(71,130,'23011403',3),(72,130,'9849426867',4),(73,131,'13180',2),(74,131,'9032345197',4),(75,132,'1161',2),(76,132,'1938',5),(77,132,'9490441430',4),(78,133,'14000',2),(79,133,'9966162734',4),(80,134,'11930',2),(81,134,'23005901',3),(82,134,'8008288624',4),(83,135,'11460',2),(84,135,'9849429332',4),(85,136,'1153',2),(86,136,'1205',5),(87,136,'23005597',3),(88,136,'9848152549',4),(89,137,'1277',2),(90,137,'1934',5),(91,137,'23002606',3),(92,137,'9908811010',4),(93,138,'14050',2),(94,138,'9948318162',4),(95,139,'14150',2),(96,139,'09556392129',4),(97,140,'1148',2),(98,140,'1203',5),(99,140,'23000094',3),(100,140,'9949297410',4),(101,142,'14420',2),(102,142,'9000014993',4),(103,143,'11400',2),(104,143,'9949644088',4),(105,144,'11240',2),(106,144,'23010681',3),(107,144,'9848181682',4),(108,145,'11350',2),(109,145,'40250115',3),(110,145,'9989122390',4),(111,146,'1902',5),(112,146,'9703330791',4),(113,147,'1151',2),(114,147,'1925',5),(115,147,'9441876695',4),(116,148,'1177',2),(117,148,'1905',5),(118,148,'9701387741',4),(119,149,'13221131',2),(120,149,'23011954',3),(121,149,'9849329324',4),(122,150,'1269',2),(123,150,'1926',5),(124,150,'20031326',3),(125,150,'9849434017',4),(126,151,'1447',2),(127,151,'1917',5),(128,151,'8978909345',4),(129,152,'9703630279',4),(130,153,'13580',2),(131,153,'9618474070',4),(132,154,'1405',2),(133,154,'1939',5),(134,154,'09413381045',4),(135,155,'1139',2),(136,155,'1204',5),(137,155,'23005595',3),(138,155,'9949544088',4),(139,156,'1403',2),(140,156,'1903',5),(141,156,'9951076012',4),(142,157,'1220',2),(143,157,'1912',5),(144,157,'9440488034',4),(145,158,'11830',2),(146,158,'27156603',3),(147,159,'12600',2),(148,159,'9392447764',4),(149,160,'1160',2),(150,160,'1936',5),(151,160,'9550361980',4),(152,161,'1187',2),(153,161,'1219',5),(154,161,'23000028',3),(155,161,'9391131199',4),(156,162,'9908209173',4),(157,163,'9885267211',4),(158,164,'11820',2),(159,164,'08106256312',4),(160,165,'1176',2),(161,165,'1931',5),(162,165,'8106224325',4),(163,166,'14880',2),(164,166,'9849371681',4),(165,167,'1276',2),(166,167,'1927',5),(167,167,'9866117070',4),(168,168,'9848152825',4),(169,169,'12870',2),(170,169,'9247428473',4),(171,170,'13210',2),(172,170,'23063345',3),(173,171,'13430',2),(174,171,'9246109160',4),(175,172,'15360',2),(176,172,'8886914433',4),(177,173,'11010',2),(178,173,'27116173',3),(179,174,'1356',2),(180,174,'1935',5),(181,174,'9618945633',4),(182,175,'13490',2),(183,175,'9000456350',4),(184,176,'14010',2),(185,176,'9173878988',4),(186,177,'13460',2),(187,178,'1254',2),(188,178,'1928',5),(189,178,'7893683396',4),(190,179,'1168',2),(191,179,'1914',5),(192,179,'9912910148',4),(193,180,'1287',2),(194,180,'1921',5),(195,180,'9951034734',4),(196,181,'12750',2),(197,181,'23010702',3),(198,181,'9885311702',4),(199,182,'9849310370',4),(200,183,'12870',2),(201,183,'9849080967',4),(202,184,'1128',2),(203,184,'1915',5),(204,184,'9177645172',4),(205,185,'15340',2),(206,185,'8297759406',4),(207,186,'12701422',2),(208,187,'1425',2),(209,187,'1930',5),(210,187,'9908224649',4),(211,188,'1298',2),(212,188,'1933',5),(213,188,'8008228119',4),(214,189,'1179',2),(215,189,'1218',5),(216,189,'9849116254',4),(217,190,'13180',2),(218,190,'9959887313',4),(219,191,'1443',2),(220,191,'1932',5),(221,191,'9652740281',4),(222,192,'11850',2),(223,192,'9989911010',4),(224,193,'9949997346',4),(225,194,'13450',2),(226,194,'9849012304',4),(227,195,'11910',2),(228,195,'9849059842',4),(229,196,'14490',2),(230,196,'9866648770',4),(231,197,'13350',2),(232,198,'11250',2),(233,198,'23006077',3),(234,198,'9949990900',4),(235,199,'13620',2),(236,199,'65548595',3),(237,199,'9949006648',4),(238,200,'12710',2),(239,200,'9441886526',4);
/*!40000 ALTER TABLE `faculty_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_names`
--

DROP TABLE IF EXISTS `faculty_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_names`
--

LOCK TABLES `faculty_names` WRITE;
/*!40000 ALTER TABLE `faculty_names` DISABLE KEYS */;
INSERT INTO `faculty_names` VALUES (117,'Abhijit Mitra'),(118,'Amitash Ojha'),(119,'Anil Kumar Vuppala'),(120,'Anoop Namboodiri'),(121,'Anubha Gupta'),(122,'Ashok Kumar Das'),(123,'Azeemuddin Syed'),(124,'Bagga R K'),(125,'Banatanwi Das Mahapatra'),(126,'Bhaskararao Peri'),(127,'Bipin Indurkhya'),(128,'Bruhadeshwar Bezawada'),(129,'Chakrapani Bommaraju'),(130,'Chandrasekher Mukku'),(131,'Chenna Rajaram'),(132,'Deva Priyakumar'),(133,'Devansh Mittal'),(134,'Dipti M Sharma'),(135,'Giridhar Rao A'),(136,'Govindarajulu  R'),(137,'Harjinder Singh'),(138,'Harsh Satya'),(139,'Indranil Chakarbarty'),(140,'Jawahar C V'),(141,'Jayanthi Sivaswamy'),(142,'Jayashree Ratnam'),(143,'Kamal Karlapalem'),(144,'Kaul C N'),(145,'Kavita Vemuri'),(146,'Kirti Garg'),(147,'Kishore Kothapalli'),(148,'Kishore S P'),(149,'Krishna Reddy P'),(150,'Madhava Krishna K'),(151,'Marimuthu Krishnan'),(152,'Mulualem Teku'),(153,'Naini Arora'),(154,'Nanda Kishore Acharya'),(155,'Narayanan P J'),(156,'Navjyoti Singh'),(157,'Neelima Satyam D'),(158,'Nita Parekh'),(159,'Piyush Bansal'),(160,'Prabhakar Bhimalapuram'),(161,'Pradeep Kumar R'),(162,'Pranav K Vashishta'),(163,'Prashanth Reddy Mannem'),(164,'Priyanka Srivastava'),(165,'Radhika Mamidi'),(166,'Raghu Reddy Y'),(167,'Rajan K S'),(168,'Rajeev Sangal'),(169,'Rajesh Kumar Tavva'),(170,'Rama Murthy G'),(171,'Ramachandra Prasad P'),(172,'Rambabu Kalla'),(173,'Rao P R K'),(174,'Sandhya V Kode'),(175,'Sharma K R'),(176,'Sharmistha Kar'),(177,'Shatrunjay Rawat'),(178,'Shubhajit Roy Chowdhury'),(179,'Soma Paul'),(180,'Sonal Nimbkar'),(181,'Srinathan Kannan'),(182,'Sriram V'),(183,'Sunil M Lohar'),(184,'Suresh Purini'),(185,'Suril Vijaykumar Shah'),(186,'Suryakanth V G'),(187,'Syamasundar Reddy G'),(188,'Tapan Kumar Sau'),(189,'Vasudeva Verma'),(190,'Venkata Dilip Kumar P'),(191,'Venkatesh Choppella'),(192,'Venkateswarlu M'),(193,'Vijay Prakash E'),(194,'Vijaya Sankara Rao P'),(195,'Vikram Pudi'),(196,'Vinay Kumar Mittal'),(197,'Vineet Chaitanya'),(198,'Vishal Garg'),(199,'Viswanath K'),(200,'Yegnanarayana B');
/*!40000 ALTER TABLE `faculty_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info_type`
--

DROP TABLE IF EXISTS `info_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info_type` (
  `id` int(11) NOT NULL,
  `value` varchar(200) DEFAULT NULL,
  `info_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info_type`
--

LOCK TABLES `info_type` WRITE;
/*!40000 ALTER TABLE `info_type` DISABLE KEYS */;
INSERT INTO `info_type` VALUES (1,'phone',1),(2,'office',2),(3,'residential',3),(4,'mobile',4),(5,'extension',2),(6,'residential extension',5),(7,'office extension',2),(8,'residence',3),(9,'home',3);
/*!40000 ALTER TABLE `info_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `synonyms`
--

DROP TABLE IF EXISTS `synonyms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonyms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `syn` varchar(200) DEFAULT NULL,
  `faculty_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `syn_UNIQUE` (`syn`)
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `synonyms`
--

LOCK TABLES `synonyms` WRITE;
/*!40000 ALTER TABLE `synonyms` DISABLE KEYS */;
INSERT INTO `synonyms` VALUES (134,'rajesh kumar tavva','169'),(135,'rajaram','131'),(136,'indranil','139'),(137,'sriram','182'),(138,'gupta','121'),(139,'raghu reddy y','166'),(140,'venkata','190'),(141,'kavita vemuri','145'),(142,'mukku chandrasekher','130'),(143,'bagga r k','124'),(144,'suresh purini','184'),(145,'sharma k r','175'),(146,'paul','179'),(147,'ashok','122'),(148,'sandhya kode','174'),(149,'satya','138'),(150,'mukku','130'),(151,'prabhakar','160'),(152,'vikram','195'),(153,'madhava krishna','150'),(154,'rambabu kalla','172'),(155,'nita','158'),(156,'peri bhaskararao','126'),(157,'indurkhya','127'),(158,'syamasundar reddy g','187'),(159,'chaitanya','197'),(160,'bommaraju','129'),(161,'prashanth','163'),(162,'srinathan kannan','181'),(163,'venkatesh choppella','191'),(164,'mitra','117'),(165,'krishna reddy p','149'),(166,'piyush bansal','159'),(167,'k r sharma','175'),(168,'vemuri','145'),(169,'anil','119'),(170,'indranil chakarbarty','139'),(171,'kishore kothapalli','147'),(172,'ramachandra prasad p','171'),(173,'suril','185'),(174,'acharya','154'),(175,'pradeep','161'),(176,'chandrasekher mukku','130'),(177,'r k bagga','124'),(178,'bezawada','128'),(179,'gangashetty','186'),(180,'srivastava','164'),(181,'harjinder singh','137'),(182,'deva priyakumar','132'),(183,'nanda','154'),(184,'krishna','149,150'),(185,'sankara','194'),(186,'chenna rajaram','131'),(187,'kirti garg','146'),(188,'roy','178'),(189,'banatanwi das','125'),(190,'vijay prakash e','193'),(191,'bipin indurkhya','127'),(192,'sunil','183'),(193,'harsh satya','138'),(194,'p r k rao','173'),(195,'anil kumar vuppala','119'),(196,'harjinder','137'),(197,'purini','184'),(198,'venkateswarlu m','192'),(199,'jayashree ratnam','142'),(200,'sriram v','182'),(201,'lohar','183'),(202,'amitash','118'),(203,'karlapalem','143'),(204,'dilip kumar','190'),(205,'rajeev sangal','168'),(206,'prashanth reddy mannem','163'),(207,'mulualem teku','152'),(208,'harsha','138'),(209,'soma','179'),(210,'verma','189'),(211,'shubhajit roy chowdhury','178'),(212,'ashok kumar das','122'),(213,'neelima','157'),(214,'chakarbarty','139'),(215,'sandhya','174'),(216,'nanda kishore','154'),(217,'chowdhury','178'),(218,'sharmistha','176'),(219,'shatrunjay rawat','177'),(220,'nanda kishore acharya','154'),(221,'namboodiri','120'),(222,'murthy','170'),(223,'vinay kumar','196'),(224,'amitash ojha','118'),(225,'sharma','134,175'),(226,'dipti m sharma','134'),(227,'naini arora','153'),(228,'marimuthu','151'),(229,'kaul c n','144'),(230,'kalla','172'),(231,'bruhadeshwar bezawada','128'),(232,'srinathan','181'),(233,'giridhar','135'),(234,'neelima satyam','157'),(235,'radhika','165'),(236,'anoop namboodiri','120'),(237,'jawahar c v','140'),(238,'satya harsha','138'),(239,'p j n','155'),(240,'navjyoti','156'),(241,'ashok das','122'),(242,'chenna','131'),(243,'dipti','134'),(244,'tapan sau','188'),(245,'suryakanth v g','186'),(246,'anoop','120'),(247,'kamal karlapalem','143'),(248,'sandhya v kode','174'),(249,'krishnan','151'),(250,'rama murthy','170'),(251,'tapan kumar sau','188'),(252,'kaul','144'),(253,'mahapatra','125'),(254,'vijaya sankara','194'),(255,'marimuthu krishnan','151'),(256,'anubha','121'),(257,'azeemuddin syed','123'),(258,'shatrunjay','177'),(259,'kothapalli','147'),(260,'sanghal','168'),(261,'syamasundar reddy','187'),(262,'vasudeva verma','189'),(263,'syed','123'),(264,'vijaya sankara rao p','194'),(265,'sharmistha kar','176'),(266,'vineet','197'),(267,'chakrapani','129'),(268,'vijay','193'),(269,'rama','170'),(270,'raghu','166'),(271,'piyush','159'),(272,'garg','146,198'),(273,'mittal','133,196'),(274,'dipti sharma','134'),(275,'vinay','196'),(276,'kirti','146'),(277,'k s rajan','167'),(278,'vikram pudi','195'),(279,'arora','153'),(280,'venkateswarlu','192'),(281,'pradeep kumar','161'),(282,'chandrasekher','130'),(283,'prasad','171'),(284,'vuppala','119'),(285,'krishna reddy','149'),(286,'shubhajit roy','178'),(287,'venkata dilip kumar p','190'),(288,'rajesh','169'),(289,'madhava','150'),(290,'vasudeva','189'),(291,'narayanan','155'),(292,'peri','126'),(293,'kishore prahallad','148'),(294,'jayanthi sivaswamy','141'),(295,'naini','153'),(296,'ratnam','142'),(297,'rajesh kumar','169'),(298,'bagga','124'),(299,'priyakumar','132'),(300,'sunil lohar','183'),(301,'tavva','169'),(302,'c v jawahar','140'),(303,'suril v shah','185'),(304,'yegnanarayana b','200'),(305,'pranav','162'),(306,'vijaya sankara rao','194'),(307,'bhimalapuram','160'),(308,'rama murthy g','170'),(309,'tapan kumar','188'),(310,'vinay mittal','196'),(311,'raghu reddy','166'),(312,'sunil m lohar','183'),(313,'rajeev','168'),(314,'suresh','184'),(315,'sonal nimbkar','180'),(316,'mannem','163'),(317,'rajan','167'),(318,'k p','148'),(319,'viswanath','199'),(320,'narayanan p j','155'),(321,'tavva rajesh','169'),(322,'govindarajulu  r','136'),(323,'vishal','198'),(324,'sonal','180'),(325,'bansal','159'),(326,'rambabu','172'),(327,'ashok kumar','122'),(328,'radhika mamidi','165'),(329,'kishore','147,148,154'),(330,'kannan srinathan','181'),(331,'kode','174'),(332,'govindarajulu','136'),(333,'prakash','193'),(334,'c n kaul','144'),(335,'vineet chaitanya','197'),(336,'neelima satyam d','157'),(337,'shubhajit','178'),(338,'vinay kumar mittal','196'),(339,'priyanka','164'),(340,'soma paul','179'),(341,'abhijit mitra','117'),(342,'shah','185'),(343,'pranav k vashishta','162'),(344,'bhaskararao','126'),(345,'devansh mittal','133'),(346,'reddy','149,163,166,187'),(347,'azeemuddin','123'),(348,'s v g','186'),(349,'rao','135,173,194'),(350,'bruhadeshwar','128'),(351,'kannan','181'),(352,'madhava krishna k','150'),(353,'jawahar','140'),(354,'priyanka srivastava','164'),(355,'rajan k s','167'),(356,'prabhakar bhimalapuram','160'),(357,'mulualem','152'),(358,'chakrapani bommaraju','129'),(359,'satyam','157'),(360,'devansh','133'),(361,'ramachandra prasad','171'),(362,'viswanath k','199'),(363,'sau','188'),(364,'giridhar rao a','135'),(365,'banatanwi das mahapatra','125'),(366,'pranav vashishta','162'),(367,'nita parekh','158'),(368,'s r c','178'),(369,'prashanth reddy','163'),(370,'venkatesh','191'),(371,'choppella','191'),(372,'mamidi','165'),(373,'abhijit','117'),(374,'banatanwi mahapatra','125'),(375,'yegnanarayana','200'),(376,'v v','189'),(377,'rawat','177'),(378,'bhaskararao peri','126'),(379,'singh','137,156'),(380,'kamal','143'),(381,'vashishta','162'),(382,'rajaram chenna','131'),(383,'anubha gupta','121'),(384,'jayashree','142'),(385,'p k reddy','149'),(386,'ramachandra','171'),(387,'navjyoti singh','156'),(388,'parekh','158'),(389,'vijaya','194'),(390,'pradeep kumar r','161'),(391,'jayanthi','141'),(392,'kishore s p','148'),(393,'kar','176'),(394,'anil kumar','119'),(395,'sivaswamy','141'),(396,'giridhar rao','135'),(397,'p j narayanan','155'),(398,'pudi','195'),(399,'deva','132'),(400,'vijay prakash','193'),(401,'bipin','127'),(402,'suryakanth','186'),(403,'suril vijaykumar shah','185'),(404,'vemuri kavita','145'),(405,'rao p r k','173'),(406,'syamasundar','187'),(407,'teku','152'),(408,'ojha','118'),(409,'nimbkar','180'),(410,'suril shah','185'),(411,'tapan','188'),(412,'kavita','145'),(413,'vishal garg','198'),(414,'venkata dilip kumar','190');
/*!40000 ALTER TABLE `synonyms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-07 18:44:11

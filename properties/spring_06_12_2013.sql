/*
SQLyog - Free MySQL GUI v5.17
Host - 5.1.25-rc-community : Database - spring
*********************************************************************
Server version : 5.1.25-rc-community
*/

SET NAMES utf8;

SET SQL_MODE='';

create database if not exists `spring`;

USE `spring`;

SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';

/*Table structure for table `access_type` */

DROP TABLE IF EXISTS `access_type`;

CREATE TABLE `access_type` (
  `access_id` bigint(20) NOT NULL,
  `acc_name` varchar(30) NOT NULL,
  `parent_access_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`access_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `access_type` */

insert into `access_type` (`access_id`,`acc_name`,`parent_access_id`) values (1,'Client',NULL);
insert into `access_type` (`access_id`,`acc_name`,`parent_access_id`) values (2,'Template',1);
insert into `access_type` (`access_id`,`acc_name`,`parent_access_id`) values (3,'Edit',2);
insert into `access_type` (`access_id`,`acc_name`,`parent_access_id`) values (4,'Read',2);

/*Table structure for table `clnt` */

DROP TABLE IF EXISTS `clnt`;

CREATE TABLE `clnt` (
  `clnt_id` int(11) NOT NULL,
  `clnt_name` varchar(100) DEFAULT NULL,
  `clnt_desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`clnt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `clnt` */

insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (1,'My Client','Demo My Client');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (2,'client two','two');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (3,'client three','three');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (4,'client three4','three4');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (5,'c5','c5');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (6,'c5','c5');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (7,'c5','c5');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (11,'c7','c7');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (21,'c8','c8');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (31,'c9','c9');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (32,'c9','c9');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (41,'ccc','ccc');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (42,'ccc','ccc');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (43,'sss','ddd');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (44,'ddd','fff');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (45,'qqq','qqq');

/*Table structure for table `clnt_tmpl` */

DROP TABLE IF EXISTS `clnt_tmpl`;

CREATE TABLE `clnt_tmpl` (
  `clnt_tmpl_id` int(11) DEFAULT NULL,
  `clnt_id` int(11) DEFAULT NULL,
  `tmpl_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `clnt_tmpl` */

insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (1,1,2);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (41,1,10060);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (51,1,10081);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (52,1,10082);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (61,1,10090);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (71,1,10110);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (81,1,10120);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (91,1,10130);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (92,1,10131);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (101,1,10140);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (102,1,10141);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (111,1,10150);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (121,1,10160);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (122,1,10161);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (123,1,10162);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (124,1,10163);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (125,1,10164);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (131,1,10170);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (141,1,10180);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (151,1,10190);

/*Table structure for table `cond` */

DROP TABLE IF EXISTS `cond`;

CREATE TABLE `cond` (
  `cond_id` int(11) NOT NULL,
  `op_type` int(11) DEFAULT NULL,
  `val` varchar(200) DEFAULT NULL,
  `source_fld` int(11) DEFAULT NULL,
  `val_type` int(11) DEFAULT NULL,
  `cond_config_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cond_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cond` */

insert into `cond` (`cond_id`,`op_type`,`val`,`source_fld`,`val_type`,`cond_config_id`) values (123,1,'B',333,1,1);
insert into `cond` (`cond_id`,`op_type`,`val`,`source_fld`,`val_type`,`cond_config_id`) values (234,1,'A',333,1,2);
insert into `cond` (`cond_id`,`op_type`,`val`,`source_fld`,`val_type`,`cond_config_id`) values (345,1,'irshad',111,1,1);
insert into `cond` (`cond_id`,`op_type`,`val`,`source_fld`,`val_type`,`cond_config_id`) values (567,1,'C',333,1,3);
insert into `cond` (`cond_id`,`op_type`,`val`,`source_fld`,`val_type`,`cond_config_id`) values (678,2,'C',333,1,4);

/*Table structure for table `cond_actn` */

DROP TABLE IF EXISTS `cond_actn`;

CREATE TABLE `cond_actn` (
  `act_id` int(11) NOT NULL,
  `cond_config_id` int(11) DEFAULT NULL,
  `new_value` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`act_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cond_actn` */

insert into `cond_actn` (`act_id`,`cond_config_id`,`new_value`) values (1,1,'NONE');
insert into `cond_actn` (`act_id`,`cond_config_id`,`new_value`) values (2,2,'BLOCK');
insert into `cond_actn` (`act_id`,`cond_config_id`,`new_value`) values (3,3,'TRUE');
insert into `cond_actn` (`act_id`,`cond_config_id`,`new_value`) values (4,4,'FALSE');

/*Table structure for table `cond_config` */

DROP TABLE IF EXISTS `cond_config`;

CREATE TABLE `cond_config` (
  `cond_config_id` int(11) NOT NULL,
  `cond_type` int(11) DEFAULT NULL,
  `exp` varchar(200) DEFAULT NULL,
  `target_fld` int(11) DEFAULT NULL,
  `override` tinyint(4) DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`cond_config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cond_config` */

insert into `cond_config` (`cond_config_id`,`cond_type`,`exp`,`target_fld`,`override`,`enabled`) values (1,1,'123 && 345',444,0,1);
insert into `cond_config` (`cond_config_id`,`cond_type`,`exp`,`target_fld`,`override`,`enabled`) values (2,1,'234',444,0,1);
insert into `cond_config` (`cond_config_id`,`cond_type`,`exp`,`target_fld`,`override`,`enabled`) values (3,2,'567',111,0,1);
insert into `cond_config` (`cond_config_id`,`cond_type`,`exp`,`target_fld`,`override`,`enabled`) values (4,2,'678',111,0,1);

/*Table structure for table `cond_oprtr` */

DROP TABLE IF EXISTS `cond_oprtr`;

CREATE TABLE `cond_oprtr` (
  `op_id` int(11) NOT NULL,
  `op_type` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`op_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cond_oprtr` */

insert into `cond_oprtr` (`op_id`,`op_type`) values (1,'EQ');
insert into `cond_oprtr` (`op_id`,`op_type`) values (2,'NOTEQ');

/*Table structure for table `cond_type` */

DROP TABLE IF EXISTS `cond_type`;

CREATE TABLE `cond_type` (
  `cond_type_id` int(11) NOT NULL,
  `cond_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cond_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cond_type` */

insert into `cond_type` (`cond_type_id`,`cond_type`) values (1,'DISPLAY');
insert into `cond_type` (`cond_type_id`,`cond_type`) values (2,'REQUIRED');

/*Table structure for table `cond_val_type` */

DROP TABLE IF EXISTS `cond_val_type`;

CREATE TABLE `cond_val_type` (
  `val_type_id` int(11) NOT NULL,
  `val_type` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`val_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cond_val_type` */

insert into `cond_val_type` (`val_type_id`,`val_type`) values (1,'STRING');

/*Table structure for table `cond_vals` */

DROP TABLE IF EXISTS `cond_vals`;

CREATE TABLE `cond_vals` (
  `cond_vals_id` int(11) NOT NULL,
  `act_id` int(11) DEFAULT NULL,
  `val` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cond_vals_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cond_vals` */

/*Table structure for table `doc_notes` */

DROP TABLE IF EXISTS `doc_notes`;

CREATE TABLE `doc_notes` (
  `DOC_NOTES_ID` int(11) NOT NULL,
  `DOC_ID` int(11) DEFAULT NULL,
  `DOC_NOTES_DESC` varchar(500) DEFAULT NULL,
  `CRTD_BY` int(11) DEFAULT NULL,
  `CRTD_ON` date DEFAULT NULL,
  PRIMARY KEY (`DOC_NOTES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `doc_notes` */

insert into `doc_notes` (`DOC_NOTES_ID`,`DOC_ID`,`DOC_NOTES_DESC`,`CRTD_BY`,`CRTD_ON`) values (1,211,'ssdfsdfs',2,'2012-05-30');
insert into `doc_notes` (`DOC_NOTES_ID`,`DOC_ID`,`DOC_NOTES_DESC`,`CRTD_BY`,`CRTD_ON`) values (2,211,'sdfsdfsdfsdfsd',2,'2012-05-30');
insert into `doc_notes` (`DOC_NOTES_ID`,`DOC_ID`,`DOC_NOTES_DESC`,`CRTD_BY`,`CRTD_ON`) values (11,161,'hghh',2,'2013-01-01');
insert into `doc_notes` (`DOC_NOTES_ID`,`DOC_ID`,`DOC_NOTES_DESC`,`CRTD_BY`,`CRTD_ON`) values (12,161,'bjbjb',2,'2013-01-01');
insert into `doc_notes` (`DOC_NOTES_ID`,`DOC_ID`,`DOC_NOTES_DESC`,`CRTD_BY`,`CRTD_ON`) values (21,221,'jjj',2,'2013-05-23');

/*Table structure for table `doc_rtxt` */

DROP TABLE IF EXISTS `doc_rtxt`;

CREATE TABLE `doc_rtxt` (
  `doc_rtxt_id` int(11) NOT NULL,
  `doc_rtxt` varchar(1000) DEFAULT NULL,
  `seq` int(11) DEFAULT NULL,
  `rtext_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`doc_rtxt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `doc_rtxt` */

insert into `doc_rtxt` (`doc_rtxt_id`,`doc_rtxt`,`seq`,`rtext_id`) values (91,'<br>',0,71);
insert into `doc_rtxt` (`doc_rtxt_id`,`doc_rtxt`,`seq`,`rtext_id`) values (101,'Its a test movie',0,81);
insert into `doc_rtxt` (`doc_rtxt_id`,`doc_rtxt`,`seq`,`rtext_id`) values (111,'test',0,91);
insert into `doc_rtxt` (`doc_rtxt_id`,`doc_rtxt`,`seq`,`rtext_id`) values (121,'nldnlndlfk<br>',0,101);

/*Table structure for table `fld` */

DROP TABLE IF EXISTS `fld`;

CREATE TABLE `fld` (
  `fld_id` bigint(10) NOT NULL,
  `fld_name` varchar(100) DEFAULT NULL,
  `fld_title` varchar(100) DEFAULT NULL,
  `fld_help_txt` varchar(200) DEFAULT NULL,
  `fld_length` bigint(10) DEFAULT NULL,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT NULL,
  `list_id` bigint(20) DEFAULT NULL,
  `fld_type_id` varchar(10) DEFAULT NULL,
  `is_common` tinyint(1) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `tmpl_id` bigint(10) DEFAULT NULL,
  `default_value` varchar(100) DEFAULT NULL,
  `is_multiselect` tinyint(1) DEFAULT NULL,
  `created_by` bigint(10) DEFAULT NULL,
  `created_on` timestamp NULL DEFAULT NULL,
  `vrsn` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`fld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fld` */

insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1,'NUMBER_FIELD','Number Field','Number Field',0,0,0,NULL,'10',NULL,0,2,'0',NULL,2,'2012-05-30 21:30:57','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (11,'TextField','TextField','Sample Field',12,1,0,NULL,'1',1,1,1,'Default value',0,1,'2001-11-11 00:00:00','0.01');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (22,'CheckBox','CheckBox','Sample Field',NULL,1,0,NULL,'4',1,1,1,'1',0,1,'2001-11-11 00:00:00','0.01');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (55,'FIRST_NAME','First Name','First Name',40,1,1,NULL,'1',1,1,2,NULL,0,1,'2001-11-11 00:00:00','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (66,'LAST_NAME','Last Name','Last Name',40,1,1,NULL,'1',1,1,2,NULL,0,1,'2001-11-11 00:00:00','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (77,'DOB','Date of Birth','Date of Birth',40,1,0,NULL,'9',1,1,2,NULL,0,1,'2001-11-11 00:00:00','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (88,'FavMovie','Your Favorite Movie','Your Favorite Movie',40,1,0,2,'2',1,1,2,NULL,1,1,'2001-11-11 00:00:00','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (111,'USERNAME','Username','Username',20,1,0,NULL,'1',1,1,2,NULL,0,1,'2001-11-11 00:00:00','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (222,'PASSWORD','Password','Password',20,1,0,NULL,'7',1,1,2,NULL,0,1,'2001-11-11 00:00:00','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (333,'MyList','My List','My List',NULL,1,0,1,'2',1,1,2,NULL,0,1,'2001-11-11 00:00:00','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (444,'MyRichText','Rich Text Field','Rich Text Field',0,1,0,NULL,'8',1,1,2,'',0,1,'2001-11-11 00:00:00','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1030,'LABEL_1030','Label','Help Text',0,0,0,0,'1',NULL,0,10030,'',0,2,'2012-05-29 23:14:45','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1031,'LABEL_1031','Label','Help Text',0,0,0,0,'2',NULL,0,10030,'undefined',0,2,'2012-05-29 23:14:45','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1040,'LABEL_1040','Label','Help Text',0,0,0,0,'1',NULL,0,10040,'',0,2,'2012-05-30 00:03:51','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1041,'LABEL_1041','Label','Help Text',0,0,0,0,'2',NULL,0,10040,'undefined',0,2,'2012-05-30 00:03:52','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1042,'LABEL_1042','Label','Help Text',0,0,0,0,'1',NULL,0,10040,'',0,2,'2012-05-30 00:03:52','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1043,'LABEL_1043','Label','Help Text',0,0,0,0,'2',NULL,0,10040,'undefined',0,2,'2012-05-30 00:04:16','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1044,'LABEL_1044','Label','Help Text',0,0,0,0,'2',NULL,0,10040,'undefined',0,2,'2012-05-30 00:04:17','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1050,'LABEL_1050','Label','Help Text',0,0,0,0,'1',NULL,0,10050,'',0,2,'2012-05-30 01:18:34','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1051,'LABEL_1051','Label','Help Text',0,0,0,0,'2',NULL,0,10050,'undefined',0,2,'2012-05-30 01:18:34','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1060,'LABEL_1060','Label','Help Text',0,0,0,0,'1',NULL,0,10060,'',0,2,'2012-05-30 01:23:17','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1061,'LABEL_1061','Label','Help Text',0,0,0,0,'2',NULL,0,10060,'2',0,2,'2012-05-30 01:23:17','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1082,'LABEL_1082','Label','Help Text',0,0,0,0,'2',NULL,0,10081,'undefined',0,2,'2012-05-30 01:42:21','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1083,'LABEL_1083','Label','Help Text',0,0,0,0,'1',NULL,0,10081,'',0,2,'2012-05-30 01:42:21','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1084,'LABEL_1084','Label','Help Text',0,0,0,0,'2',NULL,0,10082,'undefined',0,2,'2012-05-30 01:42:41','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1085,'LABEL_1085','Label','Help Text',0,0,0,0,'1',NULL,0,10082,'',0,2,'2012-05-30 01:42:41','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1090,'LABEL_1090','Label','Help Text',0,0,0,7,'2',NULL,0,10090,'undefined',0,2,'2012-05-30 01:47:16','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1091,'LABEL_1091','Label','Help Text',0,0,0,NULL,'1',NULL,0,10090,'',0,2,'2012-05-30 01:47:16','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1100,'MOVIE_NAME_1100','Movie Name','Movie Name',0,0,1,NULL,'1',NULL,0,10110,'',0,2,'2012-05-30 21:30:56','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1101,'ACTOR_1101','Actor','Actor',0,0,1,NULL,'1',NULL,0,10110,'',0,2,'2012-05-30 21:30:57','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1102,'ACTRESS_1102','Actress','Actress',0,0,0,NULL,'1',NULL,0,10110,'',0,2,'2012-05-30 21:30:57','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1103,'MOVIES_LIST_1103','Movies List','Movies List',0,0,0,14,'2',NULL,0,10110,'undefined',0,2,'2012-05-30 21:30:57','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1110,'LABEL_1110','Label','Help Text',0,0,0,NULL,'2',NULL,0,10120,'undefined',0,2,'2013-05-26 14:48:52','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1111,'LABEL_1111','Label','Help Text',0,0,0,NULL,'1',NULL,0,10120,'',0,2,'2013-05-26 14:48:52','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1120,'LABEL_1120','Label','Help Text',0,0,0,NULL,'-1',NULL,0,10130,'',0,2,'2013-06-08 23:02:20','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1121,'LABEL_1121','Label','Help Text',0,0,0,NULL,'2',NULL,0,10130,'undefined',0,2,'2013-06-08 23:02:20','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1122,'LABEL_1122','Label','Help Text',0,0,0,NULL,'1',NULL,0,10130,'',0,2,'2013-06-08 23:02:20','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1123,'LABEL_1123','Label','Help Text',0,0,0,NULL,'1',NULL,0,10131,'',0,2,'2013-06-08 23:06:32','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1124,'LABEL_1124','Label','Help Text',0,0,0,NULL,'2',NULL,0,10131,'undefined',0,2,'2013-06-08 23:06:32','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1130,'LABEL_1130','Label','Help Text',0,0,0,NULL,'1',NULL,0,10140,'',0,2,'2013-06-08 23:11:32','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1131,'LABEL_1131','Label','Help Text',0,0,0,NULL,'2',NULL,0,10140,'undefined',0,2,'2013-06-08 23:11:32','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1132,'LABEL_1132','Label','Help Text',0,0,0,NULL,'1',NULL,0,10140,'',0,2,'2013-06-08 23:11:32','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1133,'LABEL_1133','Label','Help Text',0,0,0,NULL,'1',NULL,0,10141,'',0,2,'2013-06-08 23:12:41','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1134,'LABEL_1134','Label','Help Text',0,0,0,NULL,'1',NULL,0,10141,'',0,2,'2013-06-08 23:12:41','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1135,'LABEL_1135','Label','Help Text',0,0,0,NULL,'1',NULL,0,10141,'',0,2,'2013-06-08 23:12:41','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1140,'LABEL_1140','Label','Help Text',0,0,0,NULL,'1',NULL,0,10150,'',0,2,'2013-06-09 13:49:56','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1141,'LABEL_1141','Label','Help Text',0,0,0,NULL,'2',NULL,0,10150,'undefined',0,2,'2013-06-09 13:49:56','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1142,'LABEL_1142','Label','Help Text',0,0,0,NULL,'2',NULL,0,10150,'undefined',0,2,'2013-06-09 13:49:56','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1143,'LABEL_1143','Label','Help Text',0,0,0,NULL,'2',NULL,0,10150,'undefined',0,2,'2013-06-09 13:49:56','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1150,'LABEL_1150','Label','Help Text',0,0,0,NULL,'1',NULL,0,10160,'',0,2,'2013-06-09 13:59:18','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1151,'LABEL_1151','Label','Help Text',0,0,0,NULL,'1',NULL,0,10161,'',0,2,'2013-06-09 14:04:07','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1152,'LABEL_1152','Label','Help Text',0,0,0,NULL,'1',NULL,0,10162,'',0,2,'2013-06-09 14:05:35','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1153,'LABEL_1153','Label','Help Text',0,0,0,NULL,'1',NULL,0,10162,'',0,2,'2013-06-09 14:05:35','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1154,'LABEL_1154','Label','Help Text',0,0,0,NULL,'-1',NULL,0,10162,'',0,2,'2013-06-09 14:05:35','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1155,'LABEL_1155','Label','Help Text',0,0,0,NULL,'1',NULL,0,10162,'',0,2,'2013-06-09 14:05:35','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1156,'LABEL_1156','Label','Help Text',0,0,0,NULL,'1',NULL,0,10163,'',0,2,'2013-06-09 14:08:55','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1157,'LABEL_1157','Label','Help Text',0,0,0,NULL,'1',NULL,0,10163,'',0,2,'2013-06-09 14:08:55','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1158,'LABEL_1158','Label','Help Text',0,0,0,NULL,'1',NULL,0,10163,'',0,2,'2013-06-09 14:08:55','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1159,'LABEL_1159','Label','Help Text',0,0,0,NULL,'1',NULL,0,10163,'',0,2,'2013-06-09 14:08:55','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1160,'LABEL_1160','Label','Help Text',0,0,0,NULL,'1',NULL,0,10164,'',0,2,'2013-06-09 14:12:33','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1161,'LABEL_1161','Label','Help Text',0,0,0,NULL,'1',NULL,0,10164,'',0,2,'2013-06-09 14:12:33','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1162,'LABEL_1162','Label','Help Text',0,0,0,NULL,'1',NULL,0,10170,'',0,2,'2013-06-09 14:15:30','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1163,'LABEL_1163','Label','Help Text',0,0,0,NULL,'1',NULL,0,10170,'',0,2,'2013-06-09 14:15:30','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1170,'LABEL_1170','Label','Help Text',0,0,0,NULL,'1',NULL,0,10180,'',0,2,'2013-06-09 14:27:10','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1171,'LABEL_1171','Label','Help Text',0,0,0,NULL,'1',NULL,0,10180,'',0,2,'2013-06-09 14:27:10','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1172,'LABEL_1172','Label','Help Text',0,0,0,NULL,'1',NULL,0,10180,'',0,2,'2013-06-09 14:27:10','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1173,'LABEL_1173','Label','Help Text',0,0,0,NULL,'1',NULL,0,10180,'',0,2,'2013-06-09 14:27:10','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1174,'LABEL_1174','Label','Help Text',0,0,0,NULL,'1',NULL,0,10180,'',0,2,'2013-06-09 14:27:10','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1180,'LABEL_1180','Label','Help Text',0,0,0,NULL,'1',NULL,0,10190,'',0,2,'2013-06-09 14:31:08','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1181,'LABEL_1181','Label','Help Text',0,0,0,NULL,'1',NULL,0,10190,'',0,2,'2013-06-09 14:31:08','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1182,'LABEL_1182','Label','Help Text',0,0,0,NULL,'1',NULL,0,10190,'',0,2,'2013-06-09 14:31:08','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1183,'LABEL_1183','Label','Help Text',0,0,0,NULL,'1',NULL,0,10190,'',0,2,'2013-06-09 14:31:08','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1184,'LABEL_1184','Label','Help Text',0,0,0,NULL,'1',NULL,0,10190,'',0,2,'2013-06-09 14:31:08','0.0.0.1');

/*Table structure for table `fld_type` */

DROP TABLE IF EXISTS `fld_type`;

CREATE TABLE `fld_type` (
  `fld_type_id` bigint(10) NOT NULL,
  `fld_type` varchar(50) DEFAULT NULL,
  `fld_desc` varchar(250) DEFAULT NULL,
  `configurable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`fld_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fld_type` */

insert into `fld_type` (`fld_type_id`,`fld_type`,`fld_desc`,`configurable`) values (1,'TXT','Text Field',1);
insert into `fld_type` (`fld_type_id`,`fld_type`,`fld_desc`,`configurable`) values (2,'LIST','List Field',1);
insert into `fld_type` (`fld_type_id`,`fld_type`,`fld_desc`,`configurable`) values (3,'RADIO','Radio button',1);
insert into `fld_type` (`fld_type_id`,`fld_type`,`fld_desc`,`configurable`) values (4,'CHKBOX','Checkbox',1);
insert into `fld_type` (`fld_type_id`,`fld_type`,`fld_desc`,`configurable`) values (5,'FILE','File Upload',0);
insert into `fld_type` (`fld_type_id`,`fld_type`,`fld_desc`,`configurable`) values (6,'LBL','Label',0);
insert into `fld_type` (`fld_type_id`,`fld_type`,`fld_desc`,`configurable`) values (7,'PSWD','Password',1);
insert into `fld_type` (`fld_type_id`,`fld_type`,`fld_desc`,`configurable`) values (8,'RICHTXT','Rich Text Field',1);
insert into `fld_type` (`fld_type_id`,`fld_type`,`fld_desc`,`configurable`) values (9,'DT','Date',1);
insert into `fld_type` (`fld_type_id`,`fld_type`,`fld_desc`,`configurable`) values (10,'NUM','Number',1);

/*Table structure for table `hstr_tmpl_fld` */

DROP TABLE IF EXISTS `hstr_tmpl_fld`;

CREATE TABLE `hstr_tmpl_fld` (
  `hstr_tmpl_fld_id` int(11) NOT NULL,
  `tmpl_id` int(11) DEFAULT NULL,
  `dt_crt` datetime DEFAULT NULL,
  PRIMARY KEY (`hstr_tmpl_fld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hstr_tmpl_fld` */

insert into `hstr_tmpl_fld` (`hstr_tmpl_fld_id`,`tmpl_id`,`dt_crt`) values (58,10120,'2013-06-12 23:38:30');
insert into `hstr_tmpl_fld` (`hstr_tmpl_fld_id`,`tmpl_id`,`dt_crt`) values (100,10140,'2013-06-12 23:53:38');
insert into `hstr_tmpl_fld` (`hstr_tmpl_fld_id`,`tmpl_id`,`dt_crt`) values (102,10130,'2013-06-12 23:55:06');

/*Table structure for table `hstr_tmpl_fld_nm` */

DROP TABLE IF EXISTS `hstr_tmpl_fld_nm`;

CREATE TABLE `hstr_tmpl_fld_nm` (
  `hstr_tmpl_fld_nm_id` int(11) NOT NULL,
  `hstr_tmpl_fld_id` int(11) DEFAULT NULL,
  `fld_nm` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`hstr_tmpl_fld_nm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hstr_tmpl_fld_nm` */

insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (57,57,'LABEL_1132');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (58,57,'LABEL_1130');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (59,57,'LABEL_1131');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (60,58,'LABEL_1111');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (61,58,'LABEL_1110');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (100,100,'LABEL_1130');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (101,100,'LABEL_1131');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (102,102,'LABEL_1122');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (103,102,'LABEL_1121');

/*Table structure for table `list` */

DROP TABLE IF EXISTS `list`;

CREATE TABLE `list` (
  `list_id` bigint(20) NOT NULL,
  `list_name` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `vrsn` varchar(10) DEFAULT NULL,
  `crtd_by` int(11) DEFAULT NULL,
  `crtd_on` date DEFAULT NULL,
  PRIMARY KEY (`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `list` */

insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (-1,'EmptyList','EmptyList','0.0.0.1',0,'2012-05-26');
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (1,'my_list','my list','0.0.0.1',2,NULL);
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (2,'my_movies','my Movies','0.0.0.1',2,NULL);
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (3,'first list','first list','0.0.0.1',2,'2012-05-26');
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (4,'monday','monday','0.0.0.1',2,'2012-05-26');
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (5,'Years','Years','0.0.0.1',2,'2012-05-26');
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (6,'dssss','dssss','0.0.0.1',2,'2012-05-26');
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (7,'Shariq','Shariq','0.0.0.1',2,'2012-05-26');
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (8,'sssss','sssss','0.0.0.1',2,'2012-05-26');
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (9,'wwwwww','wwwwww','0.0.0.1',2,'2012-05-26');
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (10,'wwwww','wwwww','0.0.0.1',2,'2012-05-26');
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (11,'sads','sads','0.0.0.1',2,'2012-05-26');
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (12,'sfdfs','sfdfs','0.0.0.1',2,'2012-05-26');
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (13,'rrrrrr','rrrrrr','0.0.0.1',2,'2012-05-26');
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (14,'MoviesList','MoviesList','0.0.0.1',2,'2012-05-30');

/*Table structure for table `list_val` */

DROP TABLE IF EXISTS `list_val`;

CREATE TABLE `list_val` (
  `list_val_id` bigint(20) NOT NULL,
  `list_id` bigint(20) DEFAULT NULL,
  `list_val` varchar(500) DEFAULT NULL,
  `vrsn` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`list_val_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `list_val` */

insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (-1,-1,'Empty Value',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (9,1,'A',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (10,1,'B',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (11,1,'C',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (12,2,'Kal Ho na Ho',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (13,2,'Rang de basanti',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (14,2,'Hitch',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (15,2,'The Notebook',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (33,3,'sssssssss',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (43,4,'march',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (44,5,'2001',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (45,6,'sdsds',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (46,7,'Mohd Shariq',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (47,8,'ssssss',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (48,9,'ssssss',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (49,10,'asdas',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (50,11,'asdas',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (51,12,'dfsd',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (52,13,'sssss',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (222,14,'Rang de basanti',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (223,14,'Kal Ho na Ho',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (224,14,'Yarana',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (225,14,'Love',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (226,14,'Loha',NULL);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `userid` bigint(9) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert into `login` (`userid`,`username`,`password`) values (1,'irshad','irshad');
insert into `login` (`userid`,`username`,`password`) values (2,'himanshu','himanshu');
insert into `login` (`userid`,`username`,`password`) values (3,'dan','dan');
insert into `login` (`userid`,`username`,`password`) values (4,'nouser','nouser');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(100) DEFAULT NULL,
  `group_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menu` */

insert into `menu` (`menu_id`,`menu_name`,`group_id`) values (1,'Home','home');
insert into `menu` (`menu_id`,`menu_name`,`group_id`) values (2,'Template','template');
insert into `menu` (`menu_id`,`menu_name`,`group_id`) values (3,'Create Update Template','cutemplate');

/*Table structure for table `menu_itm` */

DROP TABLE IF EXISTS `menu_itm`;

CREATE TABLE `menu_itm` (
  `menu_item_id` int(11) NOT NULL,
  `mn_name` varchar(100) DEFAULT NULL,
  `js_mthd` varchar(100) DEFAULT NULL,
  `js` varchar(1000) DEFAULT NULL,
  `is_js_menu` tinyint(1) DEFAULT NULL,
  `help_txt` varchar(250) DEFAULT NULL,
  `is_visible` tinyint(4) DEFAULT NULL,
  `is_enabled` tinyint(4) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `link` varchar(200) DEFAULT NULL,
  `parent_menu_id` int(11) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `menu_itm` */

insert into `menu_itm` (`menu_item_id`,`mn_name`,`js_mthd`,`js`,`is_js_menu`,`help_txt`,`is_visible`,`is_enabled`,`menu_id`,`link`,`parent_menu_id`,`sort_order`) values (1,'Home',NULL,NULL,NULL,'Home',1,1,1,'#',0,0);
insert into `menu_itm` (`menu_item_id`,`mn_name`,`js_mthd`,`js`,`is_js_menu`,`help_txt`,`is_visible`,`is_enabled`,`menu_id`,`link`,`parent_menu_id`,`sort_order`) values (2,'Create Template',NULL,NULL,NULL,'Create Template',1,1,0,'createUpdateTemplate.html',1,1);
insert into `menu_itm` (`menu_item_id`,`mn_name`,`js_mthd`,`js`,`is_js_menu`,`help_txt`,`is_visible`,`is_enabled`,`menu_id`,`link`,`parent_menu_id`,`sort_order`) values (3,'Save','onClick','submitForm()',1,'Save',1,1,2,'#',1,1);
insert into `menu_itm` (`menu_item_id`,`mn_name`,`js_mthd`,`js`,`is_js_menu`,`help_txt`,`is_visible`,`is_enabled`,`menu_id`,`link`,`parent_menu_id`,`sort_order`) values (4,'Save','onClick','submitTemplate()',1,'Save/Update Template',1,1,3,'#',0,1);
insert into `menu_itm` (`menu_item_id`,`mn_name`,`js_mthd`,`js`,`is_js_menu`,`help_txt`,`is_visible`,`is_enabled`,`menu_id`,`link`,`parent_menu_id`,`sort_order`) values (5,'Home',NULL,NULL,0,'Home',1,1,2,'home.html',0,0);
insert into `menu_itm` (`menu_item_id`,`mn_name`,`js_mthd`,`js`,`is_js_menu`,`help_txt`,`is_visible`,`is_enabled`,`menu_id`,`link`,`parent_menu_id`,`sort_order`) values (6,'Home',NULL,NULL,0,'Home',1,1,3,'home.html',0,0);

/*Table structure for table `racf` */

DROP TABLE IF EXISTS `racf`;

CREATE TABLE `racf` (
  `racf_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `racf_node` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`racf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `racf` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `roleid` bigint(9) NOT NULL,
  `role` varchar(20) DEFAULT NULL,
  `role_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `roles` */

insert into `roles` (`roleid`,`role`,`role_name`) values (1,'ROLE_ADMIN','Admin');
insert into `roles` (`roleid`,`role`,`role_name`) values (2,'ROLE_SUPERVISOR','Supervisor');
insert into `roles` (`roleid`,`role`,`role_name`) values (3,'ROLE_USER','User');
insert into `roles` (`roleid`,`role`,`role_name`) values (4,'ROLE_ANONYMOUS','No Role');

/*Table structure for table `rtxt` */

DROP TABLE IF EXISTS `rtxt`;

CREATE TABLE `rtxt` (
  `rtext_id` int(11) NOT NULL,
  `doc_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `crt_by` varchar(15) DEFAULT NULL,
  `crt_on` date DEFAULT NULL,
  PRIMARY KEY (`rtext_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rtxt` */

insert into `rtxt` (`rtext_id`,`doc_id`,`title`,`crt_by`,`crt_on`) values (71,211,'zxc','2','2012-05-20');
insert into `rtxt` (`rtext_id`,`doc_id`,`title`,`crt_by`,`crt_on`) values (81,231,'Movie Story','2','2012-05-30');
insert into `rtxt` (`rtext_id`,`doc_id`,`title`,`crt_by`,`crt_on`) values (91,241,'test','2','2013-01-04');
insert into `rtxt` (`rtext_id`,`doc_id`,`title`,`crt_by`,`crt_on`) values (101,271,'abc','2','2013-06-08');

/*Table structure for table `system_id` */

DROP TABLE IF EXISTS `system_id`;

CREATE TABLE `system_id` (
  `id` int(11) NOT NULL,
  `table_name` varchar(30) DEFAULT NULL,
  `st_val` int(11) DEFAULT NULL,
  `max_val` int(11) DEFAULT NULL,
  `safe_val` int(11) DEFAULT NULL,
  `next_val` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `system_id` */

insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (1,'tran_doc',1,2147483647,10,291);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (2,'tran_fld',1,2147483647,10,321);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (3,'tran_fld_list',1,2147483647,10,381);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (4,'tran_rich_txt',1,2147483647,10,361);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (5,'upld_doc',1,2147483647,10,51);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (6,'rtxt',1,2147483647,10,111);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (7,'doc_rtxt',1,2147483647,10,131);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (8,'tmpl',10000,2147483647,10,10200);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (9,'fld',1000,2147483647,10,1190);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (10,'doc_notes',1,2147483647,10,31);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (11,'list',1,2147483647,10,222);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (12,'list_val',1,2147483647,10,232);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (13,'clnt_tmpl',1,2147483647,10,161);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (14,'clnt',1,2147483647,10,100);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (15,'users',1000,2147483647,10,1111);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (16,'user_acc_node',111,2144444444,10,112);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (17,'user_access',111,2144444444,10,162);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (18,'user_roles',111,2144444444,10,112);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (19,'hstr_tmpl_fld',1,2144444444,10,110);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (20,'hstr_tmpl_fld_nm',1,2144444444,10,110);

/*Table structure for table `tmpl` */

DROP TABLE IF EXISTS `tmpl`;

CREATE TABLE `tmpl` (
  `tmpl_id` bigint(10) NOT NULL,
  `tmpl_name` varchar(50) DEFAULT NULL,
  `render_xml` varchar(10000) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `parent_id` bigint(10) DEFAULT NULL,
  `is_common` tinyint(1) DEFAULT NULL,
  `is_enable` tinyint(1) DEFAULT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` bigint(10) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `is_abstract` tinyint(1) DEFAULT NULL,
  `crt_doc_enabled` tinyint(1) DEFAULT NULL,
  `upld_doc_enabled` tinyint(1) DEFAULT NULL,
  `vrsn` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`tmpl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tmpl` */

insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (1,'Sample Template','Sample XML','Sample Template',NULL,0,1,'2011-11-08 23:31:01',1,'Sample Template',0,0,0,'0.01');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (2,'Simple Form','<sections>\n<section NAME=\"common_1\" title=\"General section\">\n<tr>\n <td colspan=\"1\" rowspan=\"1\">\n <FIELD NAME=\"USERNAME\"/>\n </td>\n <td colspan=\"1\" rowspan=\"1\">\n <FIELD NAME=\"FIRST_NAME\"/>\n </td>\n <td colspan=\"1\" rowspan=\"1\">\n <FIELD NAME=\"LAST_NAME\"/>\n </td>\n \n</tr>\n<tr>\n <td colspan=\"1\" rowspan=\"1\">\n <FIELD NAME=\"PASSWORD\"/>\n </td>\n  <td colspan=\"1\" rowspan=\"1\">\n <FIELD NAME=\"DOB\"/>\n </td>\n   <td colspan=\"1\" rowspan=\"1\">\n <FIELD NAME=\"FavMovie\"/>\n </td>\n</tr>\n<tr>\n <td colspan=\"1\" rowspan=\"1\">\n <FIELD NAME=\"MyList\"/>\n </td>\n <td colspan=\"1\" rowspan=\"1\">\n <FIELD NAME=\"NUMBER_FIELD\"/>\n </td>\n</tr>\n<tr>\n <td colspan=\"3\" rowspan=\"1\">\n <FIELD NAME=\"MyRichText\"/>\n </td>\n \n</tr>\n</section>\n</sections>','Login Form',NULL,0,1,'2013-01-02 23:24:37',1,'Login Form',0,1,1,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10040,'Movies Info',NULL,'Movies Info',NULL,0,NULL,'2012-05-30 00:03:36',2,'aefes',NULL,NULL,NULL,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10050,'Movies Infossssd',NULL,'Movies Infossssd',NULL,0,NULL,'2012-05-30 01:18:25',2,'sdfsdfsdf',NULL,NULL,NULL,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10060,'Movies Info','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1060\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1061\"/></td></tr></section></sections>','Movies Info',NULL,0,NULL,'2012-05-30 01:23:17',2,'klkl',NULL,NULL,NULL,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10081,'tempids','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1082\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1083\"/></td></tr></section></sections>','tempids',NULL,0,NULL,'2012-05-30 01:42:21',2,'ids',NULL,NULL,NULL,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10082,'dsfgdfgdf','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1084\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1085\"/></td></tr></section></sections>','dsfgdfgdf',NULL,0,NULL,'2012-05-30 01:42:41',2,'qqqq',NULL,NULL,NULL,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10090,'Movies Infossssdw','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1090\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1091\"/></td></tr></section></sections>','Movies Infossssdw',NULL,0,NULL,'2012-05-30 01:50:07',2,'sfdsaf',0,0,0,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10110,'My Movies','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"MOVIE_NAME_1100\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"ACTOR_1101\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"ACTRESS_1102\"/></td></tr><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"MOVIES_LIST_1103\"/></td></tr></section></sections>','My Movies',NULL,0,NULL,'2012-05-30 21:30:56',2,'My Movies',0,1,1,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10120,'hhh','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1110\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1111\"/></td></tr></section></sections>','hhh',NULL,0,NULL,'2013-05-26 14:48:52',2,'jjj',0,0,0,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10130,'test template','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1120\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1121\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1122\"/></td></tr></section></sections>','test template',NULL,0,NULL,'2013-06-08 23:02:20',2,'wwwww',0,1,0,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10131,'sss','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1123\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1124\"/></td></tr></section></sections>','sss',NULL,0,NULL,'2013-06-08 23:06:32',2,'sss',0,1,0,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10140,'test template','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1130\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1131\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1132\"/></td></tr></section></sections>','test template',NULL,0,NULL,'2013-06-08 23:11:32',2,'kkk',0,1,0,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10141,'hhh','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1133\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1134\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1135\"/></td></tr></section></sections>','hhh',NULL,0,NULL,'2013-06-08 23:12:41',2,'klkn',0,1,0,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10150,'new template','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1140\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1141\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1142\"/></td></tr><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1143\"/></td></tr></section></sections>','new template',NULL,0,NULL,'2013-06-09 13:49:56',2,'jhkwkjewkje',0,0,1,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10160,'ttt','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1150\"/></td></tr></section></sections>','ttt',NULL,0,NULL,'2013-06-09 13:59:18',2,'lkhlk',0,1,1,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10161,'lnlk','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"3\"><FIELD NAME=\"LABEL_1151\"/></td></tr></section></sections>','lnlk',NULL,0,NULL,'2013-06-09 14:04:07',2,'.lk',0,0,0,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10162,'mbbnbmmnbm','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"2\"><FIELD NAME=\"LABEL_1152\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1153\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1154\"/></td></tr><tr><td colspan=\"1\" rowspan=\"2\"><FIELD NAME=\"LABEL_1155\"/></td></tr></section></sections>','mbbnbmmnbm',NULL,0,NULL,'2013-06-09 14:05:35',2,'bkjbkjbk',0,1,1,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10163,'sdfsdfsdfsdf','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"2\"><FIELD NAME=\"LABEL_1156\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1157\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1158\"/></td></tr><tr><td colspan=\"1\" rowspan=\"2\"><FIELD NAME=\"LABEL_1159\"/></td></tr></section></sections>','sdfsdfsdfsdf',NULL,0,NULL,'2013-06-09 14:08:55',2,'dfsdfsd',0,0,0,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10164,'test 1','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"2\"><FIELD NAME=\"LABEL_1160\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1161\"/></td></tr></section></sections>','test 1',NULL,0,NULL,'2013-06-09 14:12:33',2,'test 1',0,0,0,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10170,'test2','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"2\" rowspan=\"1\"><FIELD NAME=\"LABEL_1160\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1161\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1162\"/></td></tr><tr><td colspan=\"2\" rowspan=\"1\"><FIELD NAME=\"LABEL_1163\"/></td></tr></section></sections>','test2',NULL,0,NULL,'2013-06-09 14:15:30',2,'test2',0,0,0,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10180,'test3','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"3\" rowspan=\"1\"><FIELD NAME=\"LABEL_1170\"/></td><td colspan=\"2\" rowspan=\"1\"><FIELD NAME=\"LABEL_1171\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1172\"/></td></tr><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1173\"/></td><td colspan=\"2\" rowspan=\"1\"><FIELD NAME=\"LABEL_1174\"/></td></tr></section></sections>','test3',NULL,0,NULL,'2013-06-09 14:27:10',2,'test3',0,0,0,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10190,'test4','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"3\" rowspan=\"1\"><FIELD NAME=\"LABEL_1180\"/></td></tr><tr><td colspan=\"2\" rowspan=\"1\"><FIELD NAME=\"LABEL_1181\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1182\"/></td></tr><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1183\"/></td><td colspan=\"2\" rowspan=\"1\"><FIELD NAME=\"LABEL_1184\"/></td></tr></section></sections>','test4',NULL,0,NULL,'2013-06-09 14:31:08',2,'test4',0,0,0,'0.0.0.1');

/*Table structure for table `tran_doc` */

DROP TABLE IF EXISTS `tran_doc`;

CREATE TABLE `tran_doc` (
  `id` bigint(20) NOT NULL,
  `display_id` varchar(20) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `crtd_on` timestamp NULL DEFAULT NULL,
  `crtd_by` bigint(20) DEFAULT NULL,
  `tmpl_id` bigint(20) DEFAULT NULL,
  `LST_UPDTED_ON` timestamp NULL DEFAULT NULL,
  `LST_UPDTED_BY` bigint(20) DEFAULT NULL,
  `vrsn` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tran_doc` */

insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (161,'XX89118',NULL,'2012-02-18 00:16:33',2,2,'2013-01-01 23:19:36',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (171,'XX64312',NULL,'2012-02-18 19:39:59',2,2,'2012-02-18 21:23:48',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (183,'XX63506',NULL,'2012-03-17 00:53:06',2,2,'2012-03-17 00:53:06',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (191,'XX93742',NULL,'2012-04-13 08:06:08',2,2,'2012-04-13 08:06:08',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (201,'XX53468',NULL,'2012-05-06 15:09:30',2,2,'2012-05-06 15:09:31',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (211,'HS8825',NULL,'2012-05-06 15:13:54',2,2,'2012-05-22 01:04:08',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (221,'DI61695',NULL,'2012-05-30 01:50:35',2,10090,'2012-05-30 01:50:35',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (231,'DI64444',NULL,'2012-05-30 21:32:12',2,10110,'2012-05-30 21:32:12',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (241,'DI20620',NULL,'2013-01-02 23:42:00',2,2,'2013-01-02 23:42:01',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (251,'DI34475',NULL,'2013-01-02 23:46:36',2,2,'2013-01-02 23:46:56',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (261,'DI91971',NULL,'2013-05-23 22:58:03',2,2,'2013-05-23 22:58:17',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (271,'DI4907',NULL,'2013-06-08 23:16:10',2,10141,'2013-06-08 23:17:30',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (281,'DI69742',NULL,'2013-06-09 14:32:54',2,10190,'2013-06-09 14:32:54',2,NULL);

/*Table structure for table `tran_fld` */

DROP TABLE IF EXISTS `tran_fld`;

CREATE TABLE `tran_fld` (
  `fld_id` bigint(20) DEFAULT NULL,
  `fld_value` varchar(500) DEFAULT NULL,
  `fld_type` varchar(10) DEFAULT NULL,
  `tmpl_fld_id` bigint(20) DEFAULT NULL,
  `last_updtd_by` bigint(20) DEFAULT NULL,
  `last_updtd_on` timestamp NULL DEFAULT NULL,
  `doc_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tran_fld` */

insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (201,NULL,'RICHTXT',444,2,'2012-02-18 21:23:48',171);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (202,'xcvvxc','TXT',55,2,'2012-02-18 21:23:48',171);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (203,'02/17/2012','DT',77,2,'2012-02-18 21:23:48',171);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (204,NULL,'LIST',333,2,'2012-02-18 21:23:48',171);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (205,'asZSdxdfh','TXT',111,2,'2012-02-18 21:23:48',171);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (206,NULL,'LIST',88,2,'2012-02-18 21:23:48',171);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (207,'sdds','TXT',222,2,'2012-02-18 21:23:48',171);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (208,'xcv','TXT',66,2,'2012-02-18 21:23:48',171);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (211,NULL,'RICHTXT',444,2,'2012-03-17 00:47:29',181);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (212,'aaaaaaaaaaa','TXT',55,2,'2012-03-17 00:47:29',181);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (213,NULL,'DT',77,2,'2012-03-17 00:47:29',181);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (214,NULL,'LIST',333,2,'2012-03-17 00:47:29',181);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (219,NULL,'RICHTXT',444,2,'2012-03-17 00:48:03',182);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (220,'sss','TXT',55,2,'2012-03-17 00:48:03',182);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (221,NULL,'DT',77,2,'2012-03-17 00:48:03',182);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (222,NULL,'LIST',333,2,'2012-03-17 00:48:03',182);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (227,NULL,'RICHTXT',444,2,'2012-03-17 00:53:06',183);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (228,'sss','TXT',55,2,'2012-03-17 00:53:06',183);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (229,NULL,'DT',77,2,'2012-03-17 00:53:06',183);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (230,NULL,'LIST',333,2,'2012-03-17 00:53:06',183);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (231,'','TXT',111,2,'2012-03-17 00:53:06',183);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (232,NULL,'LIST',88,2,'2012-03-17 00:53:06',183);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (233,'','TXT',222,2,'2012-03-17 00:53:06',183);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (234,'sss','TXT',66,2,'2012-03-17 00:53:06',183);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (221,NULL,'RICHTXT',444,2,'2012-04-13 08:06:08',191);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (222,'sdsg','TXT',55,2,'2012-04-13 08:06:08',191);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (223,'04/13/2012','DT',77,2,'2012-04-13 08:06:08',191);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (224,NULL,'LIST',333,2,'2012-04-13 08:06:08',191);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (225,'danish','TXT',111,2,'2012-04-13 08:06:08',191);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (226,NULL,'LIST',88,2,'2012-04-13 08:06:08',191);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (227,'sjassa','TXT',222,2,'2012-04-13 08:06:08',191);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (228,'cd','TXT',66,2,'2012-04-13 08:06:08',191);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (231,NULL,'RICHTXT',444,2,'2012-05-06 15:09:31',201);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (232,'dfsdf','TXT',55,2,'2012-05-06 15:09:31',201);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (233,NULL,'DT',77,2,'2012-05-06 15:09:31',201);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (234,NULL,'LIST',333,2,'2012-05-06 15:09:31',201);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (235,'dfsfdsf','TXT',111,2,'2012-05-06 15:09:31',201);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (236,NULL,'LIST',88,2,'2012-05-06 15:09:31',201);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (237,'','TXT',222,2,'2012-05-06 15:09:31',201);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (238,'sdfsdf','TXT',66,2,'2012-05-06 15:09:31',201);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (241,NULL,'RICHTXT',444,2,'2012-05-22 01:04:08',211);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (242,'gdhg','TXT',55,2,'2012-05-22 01:04:08',211);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (243,'05/22/2012','DT',77,2,'2012-05-22 01:04:08',211);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (244,NULL,'LIST',333,2,'2012-05-22 01:04:08',211);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (245,'sdfsdf','TXT',111,2,'2012-05-22 01:04:08',211);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (246,NULL,'LIST',88,2,'2012-05-22 01:04:08',211);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (247,'sdfsd','TXT',222,2,'2012-05-22 01:04:08',211);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (248,'gdhd','TXT',66,2,'2012-05-22 01:04:08',211);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (251,NULL,'LIST',1090,2,'2012-05-30 01:50:35',221);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (252,'zczx','TXT',1091,2,'2012-05-30 01:50:35',221);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (261,NULL,'LIST',1103,2,'2012-05-30 21:32:12',231);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (262,'na','TXT',1102,2,'2012-05-30 21:32:12',231);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (263,'irsha','TXT',1101,2,'2012-05-30 21:32:12',231);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (264,'mohd','TXT',1100,2,'2012-05-30 21:32:12',231);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (191,NULL,'RICHTXT',444,2,'2013-01-01 23:19:36',161);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (192,'irshad','TXT',55,2,'2013-01-01 23:19:36',161);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (193,'02/18/2012','DT',77,2,'2013-01-01 23:19:36',161);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (194,NULL,'LIST',333,2,'2013-01-01 23:19:36',161);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (195,'irshad','TXT',111,2,'2013-01-01 23:19:36',161);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (196,'','TXT',222,2,'2013-01-01 23:19:36',161);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (197,'irshad','TXT',66,2,'2013-01-01 23:19:36',161);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (271,'67','NUM',1,2,'2013-01-02 23:42:01',241);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (272,NULL,'RICHTXT',444,2,'2013-01-02 23:42:01',241);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (273,'qqqqq','TXT',55,2,'2013-01-02 23:42:01',241);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (274,NULL,'DT',77,2,'2013-01-02 23:42:01',241);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (275,NULL,'LIST',333,2,'2013-01-02 23:42:01',241);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (276,'','TXT',111,2,'2013-01-02 23:42:01',241);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (277,NULL,'LIST',88,2,'2013-01-02 23:42:01',241);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (278,'','TXT',222,2,'2013-01-02 23:42:01',241);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (279,'qqqqq','TXT',66,2,'2013-01-02 23:42:01',241);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (281,'2222323','TXT',1,2,'2013-01-02 23:46:56',251);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (282,NULL,'RICHTXT',444,2,'2013-01-02 23:46:56',251);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (283,'qqqqq','TXT',55,2,'2013-01-02 23:46:56',251);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (284,NULL,'DT',77,2,'2013-01-02 23:46:56',251);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (285,NULL,'LIST',333,2,'2013-01-02 23:46:56',251);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (286,'qwww','TXT',111,2,'2013-01-02 23:46:56',251);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (288,'','TXT',222,2,'2013-01-02 23:46:56',251);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (287,NULL,'LIST',88,2,'2013-01-02 23:46:56',251);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (289,'qqqqq','TXT',66,2,'2013-01-02 23:46:56',251);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (291,NULL,'NUM',1,2,'2013-05-23 22:58:17',261);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (292,NULL,'RICHTXT',444,2,'2013-05-23 22:58:17',261);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (293,'ddsd','TXT',55,2,'2013-05-23 22:58:17',261);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (294,NULL,'DT',77,2,'2013-05-23 22:58:17',261);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (295,NULL,'LIST',333,2,'2013-05-23 22:58:17',261);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (296,'','TXT',111,2,'2013-05-23 22:58:17',261);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (297,NULL,'LIST',88,2,'2013-05-23 22:58:17',261);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (298,'','TXT',222,2,'2013-05-23 22:58:17',261);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (299,'sdfds','TXT',66,2,'2013-05-23 22:58:17',261);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (301,'lnklnlk','TXT',1134,2,'2013-06-08 23:17:30',271);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (302,'lknkln','TXT',1135,2,'2013-06-08 23:17:30',271);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (303,'llmllk','TXT',1133,2,'2013-06-08 23:17:30',271);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (311,'lknknkl','TXT',1182,2,'2013-06-09 14:32:54',281);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (312,'lklknkl','TXT',1181,2,'2013-06-09 14:32:54',281);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (313,'pjpojp','TXT',1184,2,'2013-06-09 14:32:54',281);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (314,';l;l;','TXT',1183,2,'2013-06-09 14:32:54',281);
insert into `tran_fld` (`fld_id`,`fld_value`,`fld_type`,`tmpl_fld_id`,`last_updtd_by`,`last_updtd_on`,`doc_id`) values (315,'lkokn','TXT',1180,2,'2013-06-09 14:32:54',281);

/*Table structure for table `tran_fld_list` */

DROP TABLE IF EXISTS `tran_fld_list`;

CREATE TABLE `tran_fld_list` (
  `fld_list_id` bigint(20) NOT NULL,
  `fld_id` bigint(20) DEFAULT NULL,
  `list_value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`fld_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tran_fld_list` */

insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (259,204,'A');
insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (260,206,'Rang de basanti');
insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (261,206,'Hitch');
insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (262,206,'The Notebook');
insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (263,230,'A');
insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (264,232,'Kal Ho na Ho');
insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (271,224,'A');
insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (272,226,'Rang de basanti');
insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (281,234,'A');
insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (282,236,'Rang de basanti');
insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (315,244,'B');
insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (316,246,'Rang de basanti');
insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (321,251,'Mohd Shariq');
insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (331,261,'Yarana');
insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (341,194,'A');
insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (351,275,'A');
insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (362,285,'C');
insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (371,295,'A');
insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (372,297,'Kal Ho na Ho');

/*Table structure for table `tran_rich_txt` */

DROP TABLE IF EXISTS `tran_rich_txt`;

CREATE TABLE `tran_rich_txt` (
  `rich_txt_id` int(10) NOT NULL,
  `fld_id` int(11) DEFAULT NULL,
  `rich_txt` longblob,
  `seq` int(11) DEFAULT NULL,
  PRIMARY KEY (`rich_txt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tran_rich_txt` */

insert into `tran_rich_txt` (`rich_txt_id`,`fld_id`,`rich_txt`,`seq`) values (253,201,'dgsdgfdf<br>',0);
insert into `tran_rich_txt` (`rich_txt_id`,`fld_id`,`rich_txt`,`seq`) values (261,211,'<br>',0);
insert into `tran_rich_txt` (`rich_txt_id`,`fld_id`,`rich_txt`,`seq`) values (262,219,'<br>',0);
insert into `tran_rich_txt` (`rich_txt_id`,`fld_id`,`rich_txt`,`seq`) values (263,227,'<br>',0);
insert into `tran_rich_txt` (`rich_txt_id`,`fld_id`,`rich_txt`,`seq`) values (271,221,'dasdhagsdkjfhk hfdhsddklf<br>',0);
insert into `tran_rich_txt` (`rich_txt_id`,`fld_id`,`rich_txt`,`seq`) values (281,231,'<br>',0);
insert into `tran_rich_txt` (`rich_txt_id`,`fld_id`,`rich_txt`,`seq`) values (313,241,'dsfdsf<br>',0);
insert into `tran_rich_txt` (`rich_txt_id`,`fld_id`,`rich_txt`,`seq`) values (321,191,'<br>',0);
insert into `tran_rich_txt` (`rich_txt_id`,`fld_id`,`rich_txt`,`seq`) values (331,272,'adsa',0);
insert into `tran_rich_txt` (`rich_txt_id`,`fld_id`,`rich_txt`,`seq`) values (342,282,'sdsd',0);
insert into `tran_rich_txt` (`rich_txt_id`,`fld_id`,`rich_txt`,`seq`) values (351,292,'',0);

/*Table structure for table `upld_doc` */

DROP TABLE IF EXISTS `upld_doc`;

CREATE TABLE `upld_doc` (
  `upld_doc_id` int(11) NOT NULL,
  `doc_name` varchar(200) DEFAULT NULL,
  `dt_uplded` varchar(20) DEFAULT NULL,
  `crtd_by` int(11) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL,
  `doc_location` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`upld_doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `upld_doc` */

insert into `upld_doc` (`upld_doc_id`,`doc_name`,`dt_uplded`,`crtd_by`,`doc_id`,`doc_location`) values (1,'untitled.bmp','2012-05-08 23:08:57',2,211,'C:/myforms/uploaded_files/2/211/1336498736984_211.bmp');
insert into `upld_doc` (`upld_doc_id`,`doc_name`,`dt_uplded`,`crtd_by`,`doc_id`,`doc_location`) values (11,'shadow man.jpg','2012-05-09 00:40:39',2,211,'C:/myforms/uploaded_files/2/211/1336504239468_211.jpg');
insert into `upld_doc` (`upld_doc_id`,`doc_name`,`dt_uplded`,`crtd_by`,`doc_id`,`doc_location`) values (21,'IMG0033A.jpg','2012-05-13 02:14:29',2,211,'C:/myforms/uploaded_files/2/211/1336855469031_211.jpg');
insert into `upld_doc` (`upld_doc_id`,`doc_name`,`dt_uplded`,`crtd_by`,`doc_id`,`doc_location`) values (31,'IMAG0285.jpg','2012-05-30 21:50:15',2,231,'C:/myforms/uploaded_files/2/231/1338394815328_231.jpg');
insert into `upld_doc` (`upld_doc_id`,`doc_name`,`dt_uplded`,`crtd_by`,`doc_id`,`doc_location`) values (41,'plus.jpeg','2013-01-04 01:17:33',2,241,'C:/myforms/uploaded_files/2/241/1357242453640_241.jpeg');
insert into `upld_doc` (`upld_doc_id`,`doc_name`,`dt_uplded`,`crtd_by`,`doc_id`,`doc_location`) values (42,'dr.batra.txt','2013-01-04 01:17:33',2,241,'C:/myforms/uploaded_files/2/241/1357242453640_241.txt');

/*Table structure for table `user_acc_node` */

DROP TABLE IF EXISTS `user_acc_node`;

CREATE TABLE `user_acc_node` (
  `user_access_id` int(11) DEFAULT NULL,
  `access_node` varchar(250) NOT NULL,
  PRIMARY KEY (`access_node`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_acc_node` */

insert into `user_acc_node` (`user_access_id`,`access_node`) values (142,'RACF.CLIENT-1.*');
insert into `user_acc_node` (`user_access_id`,`access_node`) values (152,'RACF.CLIENT-1.TEMPLATE.10060.R');
insert into `user_acc_node` (`user_access_id`,`access_node`) values (152,'RACF.CLIENT-1.TEMPLATE.10081.R');
insert into `user_acc_node` (`user_access_id`,`access_node`) values (152,'RACF.CLIENT-1.TEMPLATE.10082.R');
insert into `user_acc_node` (`user_access_id`,`access_node`) values (152,'RACF.CLIENT-1.TEMPLATE.10090.R');
insert into `user_acc_node` (`user_access_id`,`access_node`) values (152,'RACF.CLIENT-1.TEMPLATE.10110.R');
insert into `user_acc_node` (`user_access_id`,`access_node`) values (152,'RACF.CLIENT-1.TEMPLATE.2.R');

/*Table structure for table `user_access` */

DROP TABLE IF EXISTS `user_access`;

CREATE TABLE `user_access` (
  `user_access_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_access_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_access` */

insert into `user_access` (`user_access_id`,`user_id`) values (142,1091);
insert into `user_access` (`user_access_id`,`user_id`) values (152,1101);

/*Table structure for table `user_roles` */

DROP TABLE IF EXISTS `user_roles`;

CREATE TABLE `user_roles` (
  `roleid` bigint(9) DEFAULT NULL,
  `userid` bigint(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_roles` */

insert into `user_roles` (`roleid`,`userid`) values (1,1);
insert into `user_roles` (`roleid`,`userid`) values (2,2);
insert into `user_roles` (`roleid`,`userid`) values (3,3);
insert into `user_roles` (`roleid`,`userid`) values (4,4);
insert into `user_roles` (`roleid`,`userid`) values (2,1091);
insert into `user_roles` (`roleid`,`userid`) values (3,1101);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userid` bigint(10) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `created_on` date NOT NULL,
  `email_id` varchar(30) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `clnt_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (2,'danish','danish','2012-02-02','hs@gmail.com','Danish','Iqbal',1,1);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1061,'danish123','password','2013-01-09','aaa@www.ccc','qqq','qqq',1,1);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1071,'himanshu','password','2013-01-09','sdfsdfs@ddd.cc','sdsd','sdfsd',1,1);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1081,'admin222','password','2013-01-09','sssssss@dd.cc','as','aaaaaaaaaas',1,1);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1082,'admin2223','password','2013-01-09','sssssss@dd.cc','as','aaaaaaaaaas',1,1);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1091,'danish321','password','2013-01-09','FGHFG@BBB.FG','ddfgsdB','FGHFGH',1,1);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1101,'danish12345','password','2013-05-23','fff@gg.com','ggh','vbvbv',1,1);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

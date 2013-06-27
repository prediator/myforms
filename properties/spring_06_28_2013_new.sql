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

/*Table structure for table `anms_clnt` */

DROP TABLE IF EXISTS `anms_clnt`;

CREATE TABLE `anms_clnt` (
  `id` int(11) NOT NULL,
  `uname` varchar(200) DEFAULT NULL,
  `clnt_nm` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `cnt_no` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `anms_clnt` */

insert into `anms_clnt` (`id`,`uname`,`clnt_nm`,`email`,`cnt_no`) values (11,'khkhhk','sdfsd','sdfds@hhh.com','dsfs');
insert into `anms_clnt` (`id`,`uname`,`clnt_nm`,`email`,`cnt_no`) values (21,'khkhhk','sdfsd','sdfds@hhh.com','dsfs');

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
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (161,1,10200);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (171,1,10210);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (172,1,10211);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (173,1,10212);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (174,1,10213);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (175,1,10214);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (176,1,10215);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (177,1,10216);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (183,1,10222);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (181,1,10230);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (182,1,10231);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (191,1,10240);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (192,1,10241);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (201,1,10250);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (211,1,10260);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (212,1,10261);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (213,1,10262);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (221,1,10270);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (231,1,10280);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (232,1,10281);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (241,1,10290);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (242,1,10291);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (251,1,10300);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (252,1,10301);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (261,1,10310);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (271,1,10320);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (272,1,10321);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (281,1,10330);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (291,1,10340);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (301,1,10350);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (311,1,10360);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (313,1,10362);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (322,1,10371);
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (322,1,10381);

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
insert into `doc_notes` (`DOC_NOTES_ID`,`DOC_ID`,`DOC_NOTES_DESC`,`CRTD_BY`,`CRTD_ON`) values (31,353,'mmm',2,'2013-06-15');

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
insert into `doc_rtxt` (`doc_rtxt_id`,`doc_rtxt`,`seq`,`rtext_id`) values (131,'b',0,111);
insert into `doc_rtxt` (`doc_rtxt_id`,`doc_rtxt`,`seq`,`rtext_id`) values (141,'sjgjsdgksgjksjksdg',0,121);

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
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1040,'LABEL_1040','Label','Help Text',0,0,0,0,'1',NULL,0,10040,'',0,2,'2012-05-30 00:03:51','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1041,'LABEL_1041','Label','Help Text',0,0,0,0,'2',NULL,0,10040,'undefined',0,2,'2012-05-30 00:03:52','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1042,'LABEL_1042','Label','Help Text',0,0,0,0,'1',NULL,0,10040,'',0,2,'2012-05-30 00:03:52','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1043,'LABEL_1043','Label','Help Text',0,0,0,0,'2',NULL,0,10040,'undefined',0,2,'2012-05-30 00:04:16','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1044,'LABEL_1044','Label','Help Text',0,0,0,0,'2',NULL,0,10040,'undefined',0,2,'2012-05-30 00:04:17','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1050,'LABEL_1050','Label','Help Text',0,0,0,0,'1',NULL,0,10050,'',0,2,'2012-05-30 01:18:34','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1051,'LABEL_1051','Label','Help Text',0,0,0,0,'2',NULL,0,10050,'undefined',0,2,'2012-05-30 01:18:34','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1060,'LABEL_1060','Label','Help Text',0,0,0,0,'1',NULL,0,10060,'',0,2,'2012-05-30 01:23:17','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1061,'LABEL_1061','Label','Help Text',0,0,0,0,'2',NULL,0,10060,'2',0,2,'2012-05-30 01:23:17','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1090,'LABEL_1090','Label','Help Text',0,0,0,7,'2',NULL,0,10090,'undefined',0,2,'2012-05-30 01:47:16','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1091,'LABEL_1091','Label','Help Text',0,0,0,NULL,'1',NULL,0,10090,'',0,2,'2012-05-30 01:47:16','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1377,'YOUR_NAME_1377','Your Name','Your Name',0,0,1,NULL,'1',NULL,0,10381,'',0,2,'2013-06-25 00:19:46','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1378,'COLLEGE_NAME_1378','College Name','Your College Name',0,0,1,232,'2',NULL,0,10381,'undefined',0,2,'2013-06-25 00:19:46','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1379,'COURSE_1379','Course','Your Course',0,0,0,NULL,'1',NULL,0,10381,'',0,2,'2013-06-25 00:19:46','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1380,'UNIVERSITY_ROLL_NO_1380','University Roll No.','Your University Roll No.',0,0,0,NULL,'1',NULL,0,10381,'',0,2,'2013-06-25 00:19:46','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1381,'EVENTGAME_1381','EventGame','Event game ',0,0,0,233,'2',NULL,0,10381,'undefined',0,2,'2013-06-25 00:19:46','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1382,'GENDER_1382','Gender','Gender',0,0,1,NULL,'3',NULL,0,10381,'',0,2,'2013-06-25 00:19:46','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1383,'WHAT_YOU_NEED_1383','What you need','What you need during entire event.',0,0,0,NULL,'4',NULL,0,10381,'',0,2,'2013-06-25 00:19:46','0.0.0.1');

/*Table structure for table `fld_bl_vl` */

DROP TABLE IF EXISTS `fld_bl_vl`;

CREATE TABLE `fld_bl_vl` (
  `id` int(11) NOT NULL,
  `val` varchar(50) NOT NULL,
  `dname` varchar(200) DEFAULT NULL,
  `selected` tinyint(4) DEFAULT NULL,
  `tmpl_fld_id` int(11) DEFAULT NULL,
  `ordr` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `fld_bl_vl` */

insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (31,'VAL_31','Value2',0,1290,0);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (32,'VAL_32','Value',0,1291,0);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (41,'VAL_41','Value1',0,1300,0);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (42,'VAL_42','Value3',0,1300,0);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (51,'VAL_51','Value1',0,1310,0);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (52,'VAL_52','Value3',0,1310,0);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (54,'VAL_54','Value1',0,1312,0);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (55,'VAL_55','Value2',0,1312,0);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (56,'VAL_56','Value3',0,1312,0);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (61,'VAL_61','Value1',0,1320,0);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (62,'VAL_62','Value2',1,1320,0);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (63,'VAL_63','Value3',0,1320,0);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (71,'VAL_71','first',0,1340,0);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (72,'VAL_72','second',1,1340,0);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (73,'VAL_73','third',0,1340,0);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (84,'VAL_84','Value4',0,1351,0);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (85,'VAL_85','Value5',1,1351,0);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (86,'VAL_86','Value',0,1351,0);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (97,'VAL_97','Rang de basanti',0,1362,1);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (98,'VAL_98','Talaash',0,1362,2);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (99,'VAL_99','Rang de basanti',0,1362,3);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (100,'VAL_100','Music',0,1363,1);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (101,'VAL_101','Acting',0,1363,2);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (102,'VAL_102','Story',0,1363,3);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (106,'VAL_106','Male',0,1382,1);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (107,'VAL_107','Female',0,1382,2);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (108,'VAL_108','Food',1,1383,1);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (109,'VAL_109','Stay',0,1383,2);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (110,'VAL_110','Value',0,1383,3);

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

/*Table structure for table `hstr_doc` */

DROP TABLE IF EXISTS `hstr_doc`;

CREATE TABLE `hstr_doc` (
  `hstr_id` int(11) NOT NULL,
  `fld_id` int(11) DEFAULT NULL,
  `hstr_val` varchar(200) DEFAULT NULL,
  `crt_dt` datetime DEFAULT NULL,
  `updt_by` int(11) DEFAULT NULL,
  `fld_type` int(11) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`hstr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hstr_doc` */

insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (14,1102,'aniccdd','2013-06-14 02:18:35',2,1,311);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (15,1102,'irshad','2013-06-14 02:18:57',2,1,311);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (21,1102,'irshad','2013-06-14 02:38:42',2,1,311);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (22,1101,'mohd','2013-06-14 02:38:42',2,1,311);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (31,1102,'ani','2013-06-15 00:00:43',2,1,331);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (41,1102,'anijjj','2013-06-15 01:19:08',2,1,331);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (51,1102,'anijjjsdfs','2013-06-15 01:26:27',2,1,331);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (52,1101,'ASD','2013-06-15 01:26:27',2,1,331);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (53,1100,'irshad','2013-06-15 01:26:27',2,1,331);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (54,1102,'bb,b,b,','2013-06-15 01:27:05',2,1,331);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (61,1102,'gggg','2013-06-15 02:17:15',2,1,331);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (62,1101,'ASDmn,','2013-06-15 02:17:15',2,1,331);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (63,1100,'irshad,mn,','2013-06-15 02:17:15',2,1,331);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (64,1102,'urmila','2013-06-15 02:18:02',2,1,331);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (65,1101,'nana','2013-06-15 02:18:02',2,1,331);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (66,1100,'Prahar','2013-06-15 02:18:02',2,1,331);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (71,1102,'abc','2013-06-15 02:26:05',2,1,342);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (72,1101,'xyz','2013-06-15 02:26:05',2,1,342);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (73,1100,'abc','2013-06-15 02:26:05',2,1,342);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (81,1102,'mmm','2013-06-15 16:20:36',2,1,351);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (82,1101,'mmm','2013-06-15 16:20:36',2,1,351);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (83,1100,'mmm','2013-06-15 16:20:36',2,1,351);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (84,1100,'ddd','2013-06-15 16:20:49',2,1,351);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (85,1,NULL,'2013-06-15 16:22:14',2,10,352);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (86,55,'nnn','2013-06-15 16:22:14',2,1,352);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (87,77,NULL,'2013-06-15 16:22:14',2,9,352);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (91,1330,'himanshu','2013-06-22 17:52:15',2,1,442);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (101,1378,'BirlaInstitute','2013-06-25 00:26:30',2,2,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (102,1380,'06050600018','2013-06-25 00:27:26',2,1,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (103,1380,'06050600019','2013-06-25 00:29:17',2,1,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (104,1380,'06050600018','2013-06-25 00:31:53',2,1,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (105,1380,'06050600019','2013-06-25 00:32:49',2,1,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (111,1381,'Dancing','2013-06-25 00:35:34',2,2,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (112,1380,'06050600018','2013-06-25 00:36:30',2,1,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (113,1380,'06050600017','2013-06-25 00:43:02',2,1,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (114,1379,'MCA','2013-06-25 00:43:02',2,1,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (115,1378,'GraphicEra','2013-06-25 00:43:02',2,2,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (116,1381,'Dancing','2013-06-25 00:43:02',2,2,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (117,1377,'Mohd Irshad','2013-06-25 00:43:28',2,1,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (118,1380,'06050600018','2013-06-25 00:43:28',2,1,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (119,1378,'BirlaInstitute','2013-06-25 00:43:28',2,2,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (120,1381,'Antakshri','2013-06-25 00:43:28',2,2,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (121,1377,'Mohd Irshad1','2013-06-25 00:43:56',2,1,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (122,1380,'06050600017','2013-06-25 00:43:56',2,1,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (123,1379,'MCA 2006','2013-06-25 00:43:56',2,1,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (124,1378,'Amrapali','2013-06-25 00:43:56',2,2,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (125,1381,'Cricket','2013-06-25 00:43:56',2,2,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (126,1380,'06050600018','2013-06-25 00:44:11',2,1,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (127,1380,'06050600019','2013-06-25 00:45:14',2,1,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (128,1381,'Singing','2013-06-25 01:01:03',2,2,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (129,1381,'Cricket','2013-06-25 01:05:05',2,2,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (130,1378,'BirlaInstitute','2013-06-25 01:05:13',2,2,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (131,1378,'Other','2013-06-25 01:05:18',2,2,481);
insert into `hstr_doc` (`hstr_id`,`fld_id`,`hstr_val`,`crt_dt`,`updt_by`,`fld_type`,`doc_id`) values (132,1382,'VAL_106','2013-06-25 01:05:30',2,3,481);

/*Table structure for table `hstr_tmpl_fld` */

DROP TABLE IF EXISTS `hstr_tmpl_fld`;

CREATE TABLE `hstr_tmpl_fld` (
  `hstr_tmpl_fld_id` int(11) NOT NULL,
  `tmpl_id` int(11) DEFAULT NULL,
  `dt_crt` datetime DEFAULT NULL,
  PRIMARY KEY (`hstr_tmpl_fld_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hstr_tmpl_fld` */

insert into `hstr_tmpl_fld` (`hstr_tmpl_fld_id`,`tmpl_id`,`dt_crt`) values (110,10110,'2013-06-14 02:02:00');
insert into `hstr_tmpl_fld` (`hstr_tmpl_fld_id`,`tmpl_id`,`dt_crt`) values (120,2,'2013-06-15 16:21:40');
insert into `hstr_tmpl_fld` (`hstr_tmpl_fld_id`,`tmpl_id`,`dt_crt`) values (130,10340,'2013-06-22 17:51:46');
insert into `hstr_tmpl_fld` (`hstr_tmpl_fld_id`,`tmpl_id`,`dt_crt`) values (140,10381,'2013-06-25 00:26:10');

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
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (104,103,'ACTRESS_1102');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (105,103,'MOVIE_NAME_1100');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (106,104,'ACTRESS_1102');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (107,104,'ACTOR_1101');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (108,104,'MOVIE_NAME_1100');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (110,110,'ACTRESS_1102');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (111,110,'ACTOR_1101');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (112,110,'MOVIE_NAME_1100');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (120,120,'NUMBER_FIELD');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (121,120,'MyRichText');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (122,120,'FIRST_NAME');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (123,120,'DOB');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (130,130,'MOVIES_1331');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (131,130,'NAME_1330');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (140,140,'YOUR_NAME_1377');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (141,140,'UNIVERSITY_ROLL_NO_1380');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (142,140,'COURSE_1379');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (143,140,'GENDER_1382');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (144,140,'COLLEGE_NAME_1378');
insert into `hstr_tmpl_fld_nm` (`hstr_tmpl_fld_nm_id`,`hstr_tmpl_fld_id`,`fld_nm`) values (145,140,'EVENTGAME_1381');

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
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (222,'himansh','himansh','0.0.0.1',2,'2013-06-22');
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (232,'College Names','College Names','0.0.0.1',2,'2013-06-25');
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (233,'Event game','Event game','0.0.0.1',2,'2013-06-25');
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (242,'ABCD','ABCD','0.0.0.1',2,'2013-06-26');
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (243,'XYZ','XYZ','0.0.0.1',2,'2013-06-26');

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
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (232,222,'himansh',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (233,222,'Guru ji',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (234,222,'chomu',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (242,232,'Birla Institute',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (243,232,'Amrapali',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (244,232,'KGIT',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (245,232,'DIT',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (246,232,'Graphic Era',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (247,232,'Other',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (248,233,'Antakshri',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (249,233,'Cricket',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (250,233,'Bollyball',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (251,233,'Singing',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (252,233,'Dancing',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (253,242,'B',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (254,242,'C',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (255,243,'X',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (256,243,'Y',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (257,243,'Z',NULL);

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
insert into `rtxt` (`rtext_id`,`doc_id`,`title`,`crt_by`,`crt_on`) values (111,342,',n,m','2','2013-06-15');
insert into `rtxt` (`rtext_id`,`doc_id`,`title`,`crt_by`,`crt_on`) values (121,441,'doc','2','2013-06-22');

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

insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (1,'tran_doc',1,2147483647,10,491);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (2,'tran_fld',1,2147483647,10,511);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (3,'tran_fld_list',1,2147483647,10,571);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (4,'tran_rich_txt',1,2147483647,10,401);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (5,'upld_doc',1,2147483647,10,51);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (6,'rtxt',1,2147483647,10,131);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (7,'doc_rtxt',1,2147483647,10,151);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (8,'tmpl',10000,2147483647,10,10390);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (9,'fld',1000,2147483647,10,1380);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (10,'doc_notes',1,2147483647,10,41);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (11,'list',1,2147483647,10,252);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (12,'list_val',1,2147483647,10,262);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (13,'clnt_tmpl',1,2147483647,10,321);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (14,'clnt',1,2147483647,10,100);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (15,'users',1000,2147483647,10,1111);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (16,'user_acc_node',111,2144444444,10,112);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (17,'user_access',111,2144444444,10,162);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (18,'user_roles',111,2144444444,10,112);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (19,'hstr_tmpl_fld',1,2144444444,10,150);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (20,'hstr_tmpl_fld_nm',1,2144444444,10,150);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (21,'hstr_doc',1,2144444444,10,121);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (22,'fld_bl_vl',1,2144444444,10,111);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (23,'tran_fld_bl_vl',1,2144444444,10,111);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (24,'anms_clnt',1,2144444444,10,31);

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
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10090,'Movies Infossssdw','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1090\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1091\"/></td></tr></section></sections>','Movies Infossssdw',NULL,0,NULL,'2012-05-30 01:50:07',2,'sfdsaf',0,0,0,'0.0.0.1');
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10381,'Registration form','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"YOUR_NAME_1377\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"COLLEGE_NAME_1378\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"COURSE_1379\"/></td></tr><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"UNIVERSITY_ROLL_NO._1380\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"EVENT\\GAME_1381\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"GENDER_1382\"/></td></tr><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"WHAT_YOU_NEED_1383\"/></td></tr></section></sections>','Registration form',NULL,0,NULL,'2013-06-25 00:19:46',2,'Registration form',0,1,1,'0.0.0.1');

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
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (231,'DI64444',NULL,'2012-05-30 21:32:12',2,10110,'2013-06-14 02:01:29',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (241,'DI20620',NULL,'2013-01-02 23:42:00',2,2,'2013-01-02 23:42:01',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (251,'DI34475',NULL,'2013-01-02 23:46:36',2,2,'2013-01-02 23:46:56',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (261,'DI91971',NULL,'2013-05-23 22:58:03',2,2,'2013-05-23 22:58:17',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (271,'DI4907',NULL,'2013-06-08 23:16:10',2,10141,'2013-06-08 23:17:30',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (281,'DI69742',NULL,'2013-06-09 14:32:54',2,10190,'2013-06-09 14:32:54',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (291,'DI20177',NULL,'2013-06-13 01:43:03',2,2,'2013-06-13 01:43:03',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (292,'DI73476',NULL,'2013-06-13 01:52:50',2,10200,'2013-06-13 01:53:02',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (301,'DI28513',NULL,'2013-06-14 00:45:27',2,2,'2013-06-14 00:58:59',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (311,'DI91102',NULL,'2013-06-14 02:12:38',2,10110,'2013-06-14 02:38:42',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (321,'DI44585',NULL,'2013-06-14 02:24:58',2,10110,'2013-06-14 02:36:48',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (331,'DI62620',NULL,'2013-06-14 23:59:42',2,10110,'2013-06-15 02:20:40',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (341,'DI16103',NULL,'2013-06-15 02:25:23',2,10090,'2013-06-15 02:25:23',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (342,'DI16548',NULL,'2013-06-15 02:25:53',2,10110,'2013-06-15 02:26:05',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (351,'DI19750',NULL,'2013-06-15 16:20:18',2,10110,'2013-06-15 16:20:49',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (352,'DI50709',NULL,'2013-06-15 16:22:02',2,2,'2013-06-15 16:22:14',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (353,'DI77875',NULL,'2013-06-15 16:28:45',2,10131,'2013-06-15 16:28:45',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (361,'DI61705',NULL,'2013-06-20 23:05:59',2,10215,'2013-06-20 23:07:12',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (371,'DI24036',NULL,'2013-06-20 23:50:20',2,10222,'2013-06-20 23:50:20',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (381,'DI58382',NULL,'2013-06-20 23:59:18',2,10222,'2013-06-20 23:59:18',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (382,'DI41016',NULL,'2013-06-21 00:09:34',2,10231,'2013-06-21 00:12:08',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (391,'DI2798',NULL,'2013-06-21 00:20:09',2,10231,'2013-06-21 00:20:09',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (401,'DI90804',NULL,'2013-06-21 00:32:56',2,10231,'2013-06-21 00:33:00',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (402,'DI55214',NULL,'2013-06-21 00:46:54',2,10241,'2013-06-21 00:48:33',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (411,'DI93914',NULL,'2013-06-21 00:54:54',2,10241,'2013-06-21 00:54:54',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (421,'DI18484',NULL,'2013-06-21 00:56:46',2,10241,'2013-06-21 02:19:01',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (431,'DI77694',NULL,'2013-06-22 03:33:42',2,10330,'2013-06-22 03:34:17',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (441,'DI5325',NULL,'2013-06-22 17:50:21',2,10340,'2013-06-22 17:50:21',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (442,'DI68273',NULL,'2013-06-22 17:52:04',2,10340,'2013-06-22 17:52:15',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (451,'DI17187',NULL,'2013-06-23 22:23:32',2,10362,'2013-06-23 23:51:33',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (461,'DI31357',NULL,'2013-06-24 22:14:03',2,10371,'2013-06-24 22:14:23',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (471,'DI20986',NULL,'2013-06-24 23:19:00',2,10371,'2013-06-24 23:19:09',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (474,'DI41784',NULL,'2013-06-24 22:29:25',2,10371,'2013-06-24 22:29:25',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (475,'DI32222',NULL,'2013-06-24 22:30:42',2,10371,'2013-06-24 23:26:04',2,NULL);
insert into `tran_doc` (`id`,`display_id`,`title`,`crtd_on`,`crtd_by`,`tmpl_id`,`LST_UPDTED_ON`,`LST_UPDTED_BY`,`vrsn`) values (481,'DI24366',NULL,'2013-06-25 00:25:00',2,10381,'2013-06-25 01:05:30',2,NULL);

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

/*Table structure for table `tran_fld_bl_vl` */

DROP TABLE IF EXISTS `tran_fld_bl_vl`;

CREATE TABLE `tran_fld_bl_vl` (
  `id` int(11) NOT NULL,
  `fld_id` int(11) DEFAULT NULL,
  `val` varchar(50) DEFAULT NULL,
  `selected` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tran_fld_bl_vl` */

insert into `tran_fld_bl_vl` (`id`,`fld_id`,`val`,`selected`) values (58,471,'VAL_95',1);
insert into `tran_fld_bl_vl` (`id`,`fld_id`,`val`,`selected`) values (59,472,'VAL_96',1);
insert into `tran_fld_bl_vl` (`id`,`fld_id`,`val`,`selected`) values (60,472,'VAL_97',1);
insert into `tran_fld_bl_vl` (`id`,`fld_id`,`val`,`selected`) values (64,491,'VAL_100',1);
insert into `tran_fld_bl_vl` (`id`,`fld_id`,`val`,`selected`) values (65,491,'VAL_102',1);
insert into `tran_fld_bl_vl` (`id`,`fld_id`,`val`,`selected`) values (66,492,'VAL_98',1);
insert into `tran_fld_bl_vl` (`id`,`fld_id`,`val`,`selected`) values (74,497,'VAL_100',1);
insert into `tran_fld_bl_vl` (`id`,`fld_id`,`val`,`selected`) values (75,497,'VAL_101',1);
insert into `tran_fld_bl_vl` (`id`,`fld_id`,`val`,`selected`) values (76,498,'VAL_98',1);
insert into `tran_fld_bl_vl` (`id`,`fld_id`,`val`,`selected`) values (115,504,'VAL_108',1);
insert into `tran_fld_bl_vl` (`id`,`fld_id`,`val`,`selected`) values (116,505,'VAL_107',1);

/*Table structure for table `tran_fld_list` */

DROP TABLE IF EXISTS `tran_fld_list`;

CREATE TABLE `tran_fld_list` (
  `fld_list_id` bigint(20) NOT NULL,
  `fld_id` bigint(20) DEFAULT NULL,
  `list_value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`fld_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tran_fld_list` */

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
insert into `tran_rich_txt` (`rich_txt_id`,`fld_id`,`rich_txt`,`seq`) values (361,322,'',0);
insert into `tran_rich_txt` (`rich_txt_id`,`fld_id`,`rich_txt`,`seq`) values (381,332,'',0);
insert into `tran_rich_txt` (`rich_txt_id`,`fld_id`,`rich_txt`,`seq`) values (392,386,'',0);

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

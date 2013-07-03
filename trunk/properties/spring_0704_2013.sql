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
  `st` varchar(20) DEFAULT NULL,
  `st_ch_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `anms_clnt` */

insert into `anms_clnt` (`id`,`uname`,`clnt_nm`,`email`,`cnt_no`,`st`,`st_ch_dt`) values (131,'Mohd Irshad','MyForms','mirshad@myforms.com','9718593997','Declined','2013-07-04 00:31:34');
insert into `anms_clnt` (`id`,`uname`,`clnt_nm`,`email`,`cnt_no`,`st`,`st_ch_dt`) values (141,'Danish','Danish and sons','danish@dan.com','123456789','Approved','2013-07-04 00:34:58');
insert into `anms_clnt` (`id`,`uname`,`clnt_nm`,`email`,`cnt_no`,`st`,`st_ch_dt`) values (151,'Danish','IRSHAD','IRSHAD@MYFORMS.COM','123456789','Approved','2013-07-04 00:33:56');
insert into `anms_clnt` (`id`,`uname`,`clnt_nm`,`email`,`cnt_no`,`st`,`st_ch_dt`) values (152,'irshD','IRSHAD','sdfds@hhh.com','777','Approved','2013-07-04 00:33:56');
insert into `anms_clnt` (`id`,`uname`,`clnt_nm`,`email`,`cnt_no`,`st`,`st_ch_dt`) values (153,'khkhhk','Danish and sons','sdfds@hhh.com','123456789','Approved','2013-07-04 00:33:56');
insert into `anms_clnt` (`id`,`uname`,`clnt_nm`,`email`,`cnt_no`,`st`,`st_ch_dt`) values (161,'sdfsd','MyForms','mirshad@myforms.com','dsfs','Approved','2013-07-02 23:28:31');
insert into `anms_clnt` (`id`,`uname`,`clnt_nm`,`email`,`cnt_no`,`st`,`st_ch_dt`) values (171,'www','wwww','wwww@ff.com','112121313','Approved','2013-07-03 23:54:29');
insert into `anms_clnt` (`id`,`uname`,`clnt_nm`,`email`,`cnt_no`,`st`,`st_ch_dt`) values (181,'MohdIrsha','Irs','IRSHAD@MYFORMS.COM','12345698765','Approved','2013-07-03 23:54:29');
insert into `anms_clnt` (`id`,`uname`,`clnt_nm`,`email`,`cnt_no`,`st`,`st_ch_dt`) values (182,'MohdIrsha','Irs','IRSHAD@MYFORMS.COM','12345698765','Approved','2013-07-04 00:31:24');
insert into `anms_clnt` (`id`,`uname`,`clnt_nm`,`email`,`cnt_no`,`st`,`st_ch_dt`) values (191,'Danish','sdfsd','sdfds@hhh.com','dsfs','Approved','2013-07-04 00:31:24');

/*Table structure for table `clnt` */

DROP TABLE IF EXISTS `clnt`;

CREATE TABLE `clnt` (
  `clnt_id` int(11) NOT NULL,
  `clnt_name` varchar(100) DEFAULT NULL,
  `clnt_desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`clnt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `clnt` */

insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (1,'My Client','My Client');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (2,'client two','two');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (3,'client three','three');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (4,'client three4','three4');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (120,'MyForms','MyForms');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (130,'Danish and sons','Danish and sons');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (131,'MyForms','MyForms');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (132,'Danish and sons','Danish and sons');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (133,'MyForms','MyForms');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (134,'IRSHAD','IRSHAD');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (135,'IRSHAD','IRSHAD');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (140,'MyForms','MyForms');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (150,'wwww','wwww');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (160,'Irs','Irs');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (161,'sdfsd','sdfsd');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (162,'Irs','Irs');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (170,'wwww','wwww');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (171,'Irs','Irs');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (172,'Irs','Irs');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (173,'sdfsd','sdfsd');
insert into `clnt` (`clnt_id`,`clnt_name`,`clnt_desc`) values (180,'Danish and sons','Danish and sons');

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
insert into `clnt_tmpl` (`clnt_tmpl_id`,`clnt_id`,`tmpl_id`) values (322,150,10392);

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
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1386,'MOBILE_NO._1386','Mobile No.','Mobile No.',0,0,1,NULL,'1',NULL,0,10392,'',0,1131,'2013-07-03 00:33:34','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1387,'RECHARGE_TYPE_1387','Recharge Type','Help Text',0,0,1,254,'2',NULL,0,10392,'undefined',0,1131,'2013-07-03 00:33:34','0.0.0.1');
insert into `fld` (`fld_id`,`fld_name`,`fld_title`,`fld_help_txt`,`fld_length`,`is_visible`,`is_required`,`list_id`,`fld_type_id`,`is_common`,`is_enabled`,`tmpl_id`,`default_value`,`is_multiselect`,`created_by`,`created_on`,`vrsn`) values (1388,'LABEL_1388','Label','Help Text',0,0,0,NULL,'3',NULL,0,10392,'',0,1131,'2013-07-03 00:33:34','0.0.0.1');

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
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (116,'VAL_116','Accept T and A',1,1388,1);
insert into `fld_bl_vl` (`id`,`val`,`dname`,`selected`,`tmpl_fld_id`,`ordr`) values (117,'VAL_117','Not Accept',0,1388,2);

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
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (252,'s','s','0.0.0.1',1131,'2013-07-03');
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (253,'ddd','ddd','0.0.0.1',1131,'2013-07-03');
insert into `list` (`list_id`,`list_name`,`description`,`vrsn`,`crtd_by`,`crtd_on`) values (254,'Recharge Type','Recharge Type','0.0.0.1',1131,'2013-07-03');

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
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (262,252,'s',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (263,253,'d',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (264,253,'f',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (265,254,'Internet',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (266,254,'Topup',NULL);
insert into `list_val` (`list_val_id`,`list_id`,`list_val`,`vrsn`) values (267,254,'Minutes',NULL);

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
insert into `roles` (`roleid`,`role`,`role_name`) values (5,'ROLE_SUPERADMIN','Super Admin');

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

insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (1,'tran_doc',1,2147483647,10,501);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (2,'tran_fld',1,2147483647,10,521);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (3,'tran_fld_list',1,2147483647,10,581);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (4,'tran_rich_txt',1,2147483647,10,401);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (5,'upld_doc',1,2147483647,10,51);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (6,'rtxt',1,2147483647,10,131);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (7,'doc_rtxt',1,2147483647,10,151);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (8,'tmpl',11000,2147483647,10,10400);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (9,'fld',1400,2147483647,10,1390);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (10,'doc_notes',1,2147483647,10,41);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (11,'list',1,2147483647,10,262);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (12,'list_val',1,2147483647,10,272);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (13,'clnt_tmpl',1,2147483647,10,321);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (14,'clnt',1,2147483647,10,190);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (15,'users',1400,2147483647,10,1181);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (16,'user_acc_node',111,2144444444,10,112);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (17,'user_access',111,2144444444,10,232);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (18,'user_roles',111,2144444444,10,112);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (19,'hstr_tmpl_fld',1,2144444444,10,150);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (20,'hstr_tmpl_fld_nm',1,2144444444,10,150);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (21,'hstr_doc',1,2144444444,10,121);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (22,'fld_bl_vl',1,2144444444,10,121);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (23,'tran_fld_bl_vl',1,2144444444,10,121);
insert into `system_id` (`id`,`table_name`,`st_val`,`max_val`,`safe_val`,`next_val`) values (24,'anms_clnt',1,2144444444,10,201);

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
insert into `tmpl` (`tmpl_id`,`tmpl_name`,`render_xml`,`title`,`parent_id`,`is_common`,`is_enable`,`created_on`,`created_by`,`description`,`is_abstract`,`crt_doc_enabled`,`upld_doc_enabled`,`vrsn`) values (10392,'Mobile Recharge','<sections><section name=\"common\" title=\"General Section\"><tr><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"MOBILE_NO._1386\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"RECHARGE_TYPE_1387\"/></td><td colspan=\"1\" rowspan=\"1\"><FIELD NAME=\"LABEL_1388\"/></td></tr></section></sections>','Mobile Recharge',NULL,0,NULL,'2013-07-03 00:33:34',1131,'Mobile Recharge',0,0,0,'0.0.0.1');

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

/*Table structure for table `tran_fld_list` */

DROP TABLE IF EXISTS `tran_fld_list`;

CREATE TABLE `tran_fld_list` (
  `fld_list_id` bigint(20) NOT NULL,
  `fld_id` bigint(20) DEFAULT NULL,
  `list_value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`fld_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tran_fld_list` */

insert into `tran_fld_list` (`fld_list_id`,`fld_id`,`list_value`) values (571,512,'Topup');

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
  `access_node` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_acc_node` */

insert into `user_acc_node` (`user_access_id`,`access_node`) values (142,'RACF.CLIENT-1.*');
insert into `user_acc_node` (`user_access_id`,`access_node`) values (152,'RACF.CLIENT-1.TEMPLATE.10060.R');
insert into `user_acc_node` (`user_access_id`,`access_node`) values (152,'RACF.CLIENT-1.TEMPLATE.10081.R');
insert into `user_acc_node` (`user_access_id`,`access_node`) values (152,'RACF.CLIENT-1.TEMPLATE.10082.R');
insert into `user_acc_node` (`user_access_id`,`access_node`) values (152,'RACF.CLIENT-1.TEMPLATE.10090.R');
insert into `user_acc_node` (`user_access_id`,`access_node`) values (152,'RACF.CLIENT-1.TEMPLATE.10110.R');
insert into `user_acc_node` (`user_access_id`,`access_node`) values (152,'RACF.CLIENT-1.TEMPLATE.2.R');
insert into `user_acc_node` (`user_access_id`,`access_node`) values (164,'RACF.CLIENT-1.*');
insert into `user_acc_node` (`user_access_id`,`access_node`) values (165,'RACF.CLIENT-1.*');
insert into `user_acc_node` (`user_access_id`,`access_node`) values (166,'RACF.CLIENT-1.*');
insert into `user_acc_node` (`user_access_id`,`access_node`) values (192,'RACF.CLIENT-150.TEMPLATE.10392.E');

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
insert into `user_access` (`user_access_id`,`user_id`) values (162,1111);
insert into `user_access` (`user_access_id`,`user_id`) values (163,1112);
insert into `user_access` (`user_access_id`,`user_id`) values (164,1113);
insert into `user_access` (`user_access_id`,`user_id`) values (165,1114);
insert into `user_access` (`user_access_id`,`user_id`) values (166,1115);
insert into `user_access` (`user_access_id`,`user_id`) values (167,1116);
insert into `user_access` (`user_access_id`,`user_id`) values (168,1117);
insert into `user_access` (`user_access_id`,`user_id`) values (172,1121);
insert into `user_access` (`user_access_id`,`user_id`) values (182,1131);
insert into `user_access` (`user_access_id`,`user_id`) values (192,1141);
insert into `user_access` (`user_access_id`,`user_id`) values (202,1151);
insert into `user_access` (`user_access_id`,`user_id`) values (203,1152);
insert into `user_access` (`user_access_id`,`user_id`) values (204,1153);
insert into `user_access` (`user_access_id`,`user_id`) values (212,1161);
insert into `user_access` (`user_access_id`,`user_id`) values (213,1162);
insert into `user_access` (`user_access_id`,`user_id`) values (214,1163);
insert into `user_access` (`user_access_id`,`user_id`) values (215,1164);
insert into `user_access` (`user_access_id`,`user_id`) values (222,1171);

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
insert into `user_roles` (`roleid`,`userid`) values (5,2);
insert into `user_roles` (`roleid`,`userid`) values (1,1113);
insert into `user_roles` (`roleid`,`userid`) values (1,1114);
insert into `user_roles` (`roleid`,`userid`) values (1,1115);
insert into `user_roles` (`roleid`,`userid`) values (1,1116);
insert into `user_roles` (`roleid`,`userid`) values (5,1117);
insert into `user_roles` (`roleid`,`userid`) values (5,1111);
insert into `user_roles` (`roleid`,`userid`) values (5,1112);
insert into `user_roles` (`roleid`,`userid`) values (2,1121);
insert into `user_roles` (`roleid`,`userid`) values (2,1131);
insert into `user_roles` (`roleid`,`userid`) values (1,1141);
insert into `user_roles` (`roleid`,`userid`) values (2,1151);
insert into `user_roles` (`roleid`,`userid`) values (2,1152);
insert into `user_roles` (`roleid`,`userid`) values (2,1153);
insert into `user_roles` (`roleid`,`userid`) values (2,1161);
insert into `user_roles` (`roleid`,`userid`) values (2,1162);
insert into `user_roles` (`roleid`,`userid`) values (2,1163);
insert into `user_roles` (`roleid`,`userid`) values (2,1164);
insert into `user_roles` (`roleid`,`userid`) values (2,1171);

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
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1111,'user130','c0-57ae-4eae-adee-7141e86828bb','2013-07-02',NULL,'Danish',NULL,1,130);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1112,'user131','57-851b-4d92-979f-b22beb4d8fe0','2013-07-02',NULL,'Mohd Irshad',NULL,1,131);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1113,'danish1','password','2013-06-30','sdfds@hhh.com','fff','fff',1,1);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1114,'danish1','password','2013-06-30','sdfds@hhh.com','fff','fff',1,1);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1115,'ddSDSD12','password','2013-06-30','sdfds@hhh.com','gfdf','sdf',1,1);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1116,'irshad12','password','2013-06-30','sdfds@hhh.com','gfdf','sdf',1,1);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1117,'user120','password','2013-06-30',NULL,'Mohd Irshad',NULL,1,120);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1121,'user140','a3-3046-480a-9e58-ed6d53b4186c','2013-07-02',NULL,'sdfsd',NULL,1,140);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1131,'user150','3b-f258-41d6-a0df-e2bbf1759918','2013-07-02',NULL,'www',NULL,1,150);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1141,'abc123','password','2013-07-03','abc@gmail.com','abc','abc',1,150);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1151,'user160','83-c5b7-4850-9190-6e6b53fa28d6','2013-07-03',NULL,'MohdIrsha',NULL,1,160);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1152,'user161','13-65d7-4976-91b5-311d3ccfe481','2013-07-03',NULL,'Danish',NULL,1,161);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1153,'user162','89-3224-4d10-8425-6ad4748837e8','2013-07-03',NULL,'MohdIrsha',NULL,1,162);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1161,'user170','a7-66a3-4981-b4e0-c2b20cc8d230','2013-07-03',NULL,'www',NULL,1,170);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1162,'user171','8b-6836-4765-b85d-95ff50e9e2c2','2013-07-03',NULL,'MohdIrsha',NULL,1,171);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1163,'user172','ab-6136-42c5-a905-58ec9daf50f0','2013-07-03',NULL,'MohdIrsha',NULL,1,172);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1164,'user173','80-23eb-4ad0-962b-a6a005156e4e','2013-07-03',NULL,'Danish',NULL,1,173);
insert into `users` (`userid`,`username`,`password`,`created_on`,`email_id`,`first_name`,`last_name`,`is_enabled`,`clnt_id`) values (1171,'user180','84b5a4','2013-07-04',NULL,'Danish',NULL,1,180);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;

/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : localhost:3306
 Source Schema         : objectdetect

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : 65001

 Date: 02/08/2019 19:44:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for buginfo
-- ----------------------------
DROP TABLE IF EXISTS `buginfo`;
CREATE TABLE `buginfo`  (
  `keyword` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储漏洞信息的I信息\n',
  `plugin` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '漏洞信息中的 组件信息\n',
  `SSVID` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SSV ID信息\n',
  `submittime` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '漏洞提交的时间',
  `buglevel` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '漏洞的等级\n\n',
  `bugname` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '漏洞的名称',
  `bugstatus` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '漏洞的状态',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cve_affects_info
-- ----------------------------
DROP TABLE IF EXISTS `cve_affects_info`;
CREATE TABLE `cve_affects_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `CVEID` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '漏洞产品名称（Apache Tomcat）',
  `version` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '漏洞产品版本（7.0.0）',
  `vendor_name` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产商名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 122192 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cve_base_info
-- ----------------------------
DROP TABLE IF EXISTS `cve_base_info`;
CREATE TABLE `cve_base_info`  (
  `CVEID` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cveid号 cve-xxxx-xxxxxxx',
  `ASSIGNER` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一个邮箱（提交者？）',
  `DATE_PUBLIC` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交时间（2000-01-01T00:00:00）',
  `STATE` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否公开',
  `data_format` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `data_type` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cve',
  `data_version` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CVEID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cve_description_info
-- ----------------------------
DROP TABLE IF EXISTS `cve_description_info`;
CREATE TABLE `cve_description_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CVEID` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `language` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述语言',
  `value` varchar(8196) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cve详情描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109026 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cve_problem_type
-- ----------------------------
DROP TABLE IF EXISTS `cve_problem_type`;
CREATE TABLE `cve_problem_type`  (
  `CVEID` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_type` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '漏洞类型',
  `language` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 79040 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cve_reference_info
-- ----------------------------
DROP TABLE IF EXISTS `cve_reference_info`;
CREATE TABLE `cve_reference_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不知道什么鬼',
  `CVEID` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `refsource` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 346819 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for domaininfo
-- ----------------------------
DROP TABLE IF EXISTS `domaininfo`;
CREATE TABLE `domaininfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '保存该域名所属的IP',
  `domain` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '保存域名的名字 为键值',
  `subdomain` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '保存该域名的子域名',
  `Parentdomain` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '保存该域名的父域名',
  `email` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '该域名下的邮箱信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 417 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for emailinfo
-- ----------------------------
DROP TABLE IF EXISTS `emailinfo`;
CREATE TABLE `emailinfo`  (
  `email` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '保存邮箱名 为表的键值',
  `domain` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '保存其邮箱所属的域名\n',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '保存邮箱的信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for http_email
-- ----------------------------
DROP TABLE IF EXISTS `http_email`;
CREATE TABLE `http_email`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `last_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `seniority` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `department` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `linkedin` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `twitter` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 170 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for http_emaildata
-- ----------------------------
DROP TABLE IF EXISTS `http_emaildata`;
CREATE TABLE `http_emaildata`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `organization` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `emails` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for http_emailsource
-- ----------------------------
DROP TABLE IF EXISTS `http_emailsource`;
CREATE TABLE `http_emailsource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `uri` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `still_on_page` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1369 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ipinfo
-- ----------------------------
DROP TABLE IF EXISTS `ipinfo`;
CREATE TABLE `ipinfo`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `domain` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '该IP下的域名\n',
  `city` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '该IP所在的城市\n',
  `country` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '该域名所属的国家',
  `org` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '该IP 所属的组织',
  `location` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '该IP的地址\n',
  `hostname` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '该IP所属的主机名\n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2858 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for nikto_base_info
-- ----------------------------
DROP TABLE IF EXISTS `nikto_base_info`;
CREATE TABLE `nikto_base_info`  (
  `host` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名信息\n',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip信息',
  `banner` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '容器信息',
  `port` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5423 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for nikto_vulnerabilities
-- ----------------------------
DROP TABLE IF EXISTS `nikto_vulnerabilities`;
CREATE TABLE `nikto_vulnerabilities`  (
  `id` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OSVDB` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `method` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msg` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `idd` int(11) NOT NULL AUTO_INCREMENT,
  `host` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`idd`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 344 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pluginbug
-- ----------------------------
DROP TABLE IF EXISTS `pluginbug`;
CREATE TABLE `pluginbug`  (
  `plugin` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' COMMENT '漏洞插件的名称\n',
  `Keyname` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '与该漏洞相关的关键词\n',
  `submittime` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '漏洞提交的时间',
  `buglevel` int(11) NULL DEFAULT NULL COMMENT '漏洞的等级说明\n',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zoom_city
-- ----------------------------
DROP TABLE IF EXISTS `zoom_city`;
CREATE TABLE `zoom_city`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `geoname_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cnName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '每个城市可以去province找到省',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 661 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zoom_continent
-- ----------------------------
DROP TABLE IF EXISTS `zoom_continent`;
CREATE TABLE `zoom_continent`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `geoname_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cnName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 661 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zoom_country
-- ----------------------------
DROP TABLE IF EXISTS `zoom_country`;
CREATE TABLE `zoom_country`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `geoname_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `cnName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `continent` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '每个国家可以去continent找到所在大陆\r\n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 661 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zoom_domain_ips
-- ----------------------------
DROP TABLE IF EXISTS `zoom_domain_ips`;
CREATE TABLE `zoom_domain_ips`  (
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '#######',
  `ip` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id` int(255) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1342 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zoom_domain_subs
-- ----------------------------
DROP TABLE IF EXISTS `zoom_domain_subs`;
CREATE TABLE `zoom_domain_subs`  (
  `domain` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '#######',
  `subdomain` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id` int(255) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3141 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zoom_geoinfo
-- ----------------------------
DROP TABLE IF EXISTS `zoom_geoinfo`;
CREATE TABLE `zoom_geoinfo`  (
  `city` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '###########用这个找剩余地理信息',
  `isp` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '网络运营商',
  `asn` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '和isp相关的',
  `lat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '经度',
  `lon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '维度',
  `organizaion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'unknown，感觉是和isp相关',
  `aso` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'unknown，感觉是和isp相关',
  `PoweredBy` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'unknown',
  `base_station` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'unknown',
  `idc` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '不懂',
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `country` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '#####万一中间哪个没有',
  `province` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '####万一中间哪个没有',
  `continent` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '####万一中间哪个没有',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 661 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zoom_province
-- ----------------------------
DROP TABLE IF EXISTS `zoom_province`;
CREATE TABLE `zoom_province`  (
  `geoname_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '代号或昵称的意思',
  `cnName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `country` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '每个省可以去county表里找到自己的国家',
  `id` int(255) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 661 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zoom_result
-- ----------------------------
DROP TABLE IF EXISTS `zoom_result`;
CREATE TABLE `zoom_result`  (
  `site` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '域名##############用这个找ip，子域名',
  `description` varchar(2550) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述信息',
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `headers` varchar(2550) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `language` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '网站所使用的语言',
  `webappname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'DedeCMS这种\r\n',
  `webappurl` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `timestamp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '估计是更新时间',
  `keywords` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '##########用这个找地理信息',
  `wafname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '防火墙名字',
  `wafversion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `dbname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '数据库',
  `dbversion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `componentname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'web容器',
  `componentversion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `servername` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '服务器',
  `servervision` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `searchkey` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 768 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Event structure for dupicate_remove_zoomcontinent
-- ----------------------------
DROP EVENT IF EXISTS `dupicate_remove_zoomcontinent`;
delimiter ;;
CREATE EVENT `dupicate_remove_zoomcontinent`
ON SCHEDULE
EVERY '30' MINUTE STARTS '2019-07-09 14:34:08'
DO DELETE FROM objectdetect.zoom_continent
	WHERE id NOT IN (
				SELECT id FROM (
			SELECT DISTINCT * FROM objectdetect.zoom_continent
				GROUP BY geoname_id,cnName,enName,code
			)AS temp
	)
;;
delimiter ;

-- ----------------------------
-- Event structure for dupicate_remove_zoomcountry
-- ----------------------------
DROP EVENT IF EXISTS `dupicate_remove_zoomcountry`;
delimiter ;;
CREATE EVENT `dupicate_remove_zoomcountry`
ON SCHEDULE
EVERY '30' MINUTE STARTS '2019-07-09 14:37:01'
DO DELETE FROM objectdetect.zoom_country
	WHERE id NOT IN (
				SELECT id FROM (
			SELECT DISTINCT * FROM objectdetect.zoom_country
				GROUP BY geoname_id,cnName,enName,code,continent
			)AS temp
	)
;;
delimiter ;

-- ----------------------------
-- Event structure for dupicate_remove_zoomgeoinfo
-- ----------------------------
DROP EVENT IF EXISTS `dupicate_remove_zoomgeoinfo`;
delimiter ;;
CREATE EVENT `dupicate_remove_zoomgeoinfo`
ON SCHEDULE
EVERY '30' MINUTE STARTS '2019-07-09 14:46:42'
DO DELETE FROM objectdetect.zoom_geoinfo
	WHERE id NOT IN (
				SELECT id FROM (
			SELECT DISTINCT * FROM objectdetect.zoom_geoinfo
				GROUP BY city,country,province,continent,isp,asn,lat,lon,organizaion,aso,PoweredBy,base_station,idc
			)AS temp
	)
;;
delimiter ;

-- ----------------------------
-- Event structure for dupicate_remove_zoomips
-- ----------------------------
DROP EVENT IF EXISTS `dupicate_remove_zoomips`;
delimiter ;;
CREATE EVENT `dupicate_remove_zoomips`
ON SCHEDULE
EVERY '30' MINUTE STARTS '2019-07-09 14:41:17'
DO DELETE FROM objectdetect.zoom_domain_ips
	WHERE id NOT IN (
				SELECT id FROM (
			SELECT DISTINCT * FROM objectdetect.zoom_domain_ips
				GROUP BY domain,ip
			)AS temp
	)
;;
delimiter ;

-- ----------------------------
-- Event structure for dupicate_remove_zoomprovince
-- ----------------------------
DROP EVENT IF EXISTS `dupicate_remove_zoomprovince`;
delimiter ;;
CREATE EVENT `dupicate_remove_zoomprovince`
ON SCHEDULE
EVERY '30' MINUTE STARTS '2019-07-09 15:03:52'
DO DELETE FROM objectdetect.zoom_province
	WHERE id NOT IN (
				SELECT id FROM (
			SELECT DISTINCT * FROM objectdetect.zoom_province
				GROUP BY geoname_id,cnName,enName,code,country
			)AS temp
	)
;;
delimiter ;

-- ----------------------------
-- Event structure for dupicate_remove_zoomresult
-- ----------------------------
DROP EVENT IF EXISTS `dupicate_remove_zoomresult`;
delimiter ;;
CREATE EVENT `dupicate_remove_zoomresult`
ON SCHEDULE
EVERY '30' MINUTE STARTS '2019-07-09 14:45:06'
DO DELETE FROM objectdetect.zoom_result
	WHERE id NOT IN (
				SELECT id FROM (
			SELECT DISTINCT * FROM objectdetect.zoom_result
				GROUP BY site,description,title,headers,language,webappname,webappurl,timestamp,keywords,city,wafname,wafversion,dbname,dbversion,componentname,componentversion,servername,servervision
			)AS temp
	)
;;
delimiter ;

-- ----------------------------
-- Event structure for dupicate_remove_zoomsubs
-- ----------------------------
DROP EVENT IF EXISTS `dupicate_remove_zoomsubs`;
delimiter ;;
CREATE EVENT `dupicate_remove_zoomsubs`
ON SCHEDULE
EVERY '30' MINUTE STARTS '2019-07-09 14:42:27'
DO DELETE FROM objectdetect.zoom_domain_subs
	WHERE id NOT IN (
				SELECT id FROM (
			SELECT DISTINCT * FROM objectdetect.zoom_domain_subs
				GROUP BY domain,subdomain
			)AS temp
	)
;;
delimiter ;

-- ----------------------------
-- Event structure for duplicate_remove_zoomcity
-- ----------------------------
DROP EVENT IF EXISTS `duplicate_remove_zoomcity`;
delimiter ;;
CREATE EVENT `duplicate_remove_zoomcity`
ON SCHEDULE
EVERY '30' MINUTE STARTS '2019-07-09 14:32:44'
DO DELETE FROM objectdetect.zoom_city
	WHERE id NOT IN (
				SELECT id FROM (
			SELECT DISTINCT * FROM objectdetect.zoom_city
				GROUP BY geoname_id,cnName,enName,province
			)AS temp
	)
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;

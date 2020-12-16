/*
Navicat MySQL Data Transfer

Source Server         : jsp
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : mydatabase

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2016-01-03 00:38:25
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `login`
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `account` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO login VALUES ('dllm1020GM', 'dick30');
INSERT INTO login VALUES ('test01', '1234');
INSERT INTO login VALUES ('test02', '5678');

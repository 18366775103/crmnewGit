/*
Navicat MySQL Data Transfer

Source Server         : cms-01
Source Server Version : 50162
Source Host           : localhost:3306
Source Database       : crmnew

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2018-01-10 15:31:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `dbid` int(12) NOT NULL AUTO_INCREMENT,
  `authName` varchar(20) DEFAULT NULL,
  `authCode` varchar(20) DEFAULT NULL,
  `authURL` varchar(20) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL COMMENT '1:模块，2：资源',
  `parentId` int(12) DEFAULT NULL,
  `orders` int(12) DEFAULT NULL,
  `valid` varchar(1) DEFAULT NULL COMMENT '1:有效，0：无效',
  `layer` int(12) DEFAULT NULL,
  PRIMARY KEY (`dbid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth
-- ----------------------------
INSERT INTO `auth` VALUES ('1', '功能模块', 'root', null, '1', '-1', '10', '1', '0');
INSERT INTO `auth` VALUES ('2', '系统管理', '2', '2', '1', '1', '6666', '1', '1');
INSERT INTO `auth` VALUES ('5', '用户管理', '', '/user/toMain', '1', '2', '5', '1', '2');
INSERT INTO `auth` VALUES ('6', '角色管理', '', '/role/toMain', '1', '2', '20', '1', '2');
INSERT INTO `auth` VALUES ('7', '权限管理', '', '/auth/toMain', '1', '2', '30', '1', '2');
INSERT INTO `auth` VALUES ('8', '员工档案', '', '', '1', '3', null, '1', '2');
INSERT INTO `auth` VALUES ('11', '增加用户', 'user_add', '', '2', '5', '10', '1', '3');
INSERT INTO `auth` VALUES ('14', '用户查询', 'user_query', '', '2', '5', '10', '1', '3');
INSERT INTO `auth` VALUES ('15', '用户编辑', 'user_edit', '', '2', '5', '10', '1', '3');
INSERT INTO `auth` VALUES ('21', '销售管理', '', '', '1', '1', '10', '1', '1');
INSERT INTO `auth` VALUES ('22', '咨询管理', '', '', '1', '1', '20', '1', '1');
INSERT INTO `auth` VALUES ('23', '电销管理', '', '', '1', '1', '30', '1', '1');
INSERT INTO `auth` VALUES ('24', '网咨管理', '', '', '1', '1', '40', '1', '1');
INSERT INTO `auth` VALUES ('25', '销售分配', '', '/sales/toMain', '1', '21', '10', '1', '2');
INSERT INTO `auth` VALUES ('26', '客户咨询', '', '/zx/toMain', '1', '22', null, '1', '2');
INSERT INTO `auth` VALUES ('27', '客户电销', '', '/dx/toMain', '1', '23', null, '1', '2');
INSERT INTO `auth` VALUES ('28', '客户网咨', '', '/wz/toMain', '1', '24', '10', '1', '2');
INSERT INTO `auth` VALUES ('29', '咨询汇总', '', '/zxSum/toMain', '1', '22', '10', '1', '2');
INSERT INTO `auth` VALUES ('30', '电销汇总', '', '/dxSum/toMain', '1', '23', '20', '1', '2');
INSERT INTO `auth` VALUES ('31', '网咨汇总', '', '/wzSum/toMain', '1', '24', '20', '1', '2');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `dbid` int(23) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(60) DEFAULT NULL COMMENT '编码',
  `name` varchar(20) DEFAULT NULL COMMENT '客户名字',
  `phone` varchar(20) DEFAULT NULL COMMENT '客户电话',
  `sex` varchar(20) DEFAULT NULL COMMENT '性别',
  `createDate` date DEFAULT NULL COMMENT '录入日期',
  `updateDate` date DEFAULT NULL,
  `status` int(2) DEFAULT NULL COMMENT '详见status表',
  `handler` int(12) DEFAULT NULL COMMENT '分配给了谁',
  `giveDate` date DEFAULT NULL COMMENT '分配日期',
  `type` varchar(20) DEFAULT NULL COMMENT '类型，是咨询（1），电销（2）还是网咨（3）',
  `note` varchar(255) DEFAULT '' COMMENT '退费原因',
  PRIMARY KEY (`dbid`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '2017-04-22-15000000001', '测试001', '15000000001', '1', '2017-04-22', '2017-04-22', '6', '15', '2017-04-22', 'zx', '家庭原因');
INSERT INTO `customer` VALUES ('2', '2017-04-22-15000000002', '测试002', '15000000002', '0', '2017-04-22', '2017-04-22', '2', '16', '2017-04-22', 'zx', '');
INSERT INTO `customer` VALUES ('3', '2017-04-22-15000000003', '测试003', '15000000003', '1', '2017-04-22', '2017-04-22', '7', '15', '2017-04-22', 'zx', '');
INSERT INTO `customer` VALUES ('4', '2017-04-22-15000000004', '测试004', '15000000004', '0', '2017-04-22', '2017-04-22', '2', '16', '2017-04-22', 'zx', '');
INSERT INTO `customer` VALUES ('5', '2017-04-22-15000000005', '测试005', '15000000005', '1', '2017-04-22', '2017-04-22', '4', '15', '2017-04-22', 'zx', '');
INSERT INTO `customer` VALUES ('6', '2017-04-22-15000000006', '测试006', '15000000006', '0', '2017-04-22', '2017-04-22', '2', '19', '2017-04-22', 'dx', '');
INSERT INTO `customer` VALUES ('7', '2017-04-22-15000000007', '测试007', '15000000007', '1', '2017-04-22', '2017-04-22', '2', '20', '2017-04-22', 'dx', '');
INSERT INTO `customer` VALUES ('8', '2017-04-22-15000000008', '测试008', '15000000008', '0', '2017-04-22', '2017-04-22', '2', '19', '2017-04-22', 'dx', '');
INSERT INTO `customer` VALUES ('9', '2017-04-22-15000000009', '测试009', '15000000009', '1', '2017-04-22', '2017-04-22', '2', '20', '2017-04-22', 'dx', '');
INSERT INTO `customer` VALUES ('10', '2017-04-22-15000000010', '测试010', '15000000010', '1', '2017-04-22', '2017-05-27', '4', '19', '2017-04-22', 'dx', '');
INSERT INTO `customer` VALUES ('11', '2017-04-22-13999999999', '测试客户', '13999999999', '1', '2017-04-22', '2017-04-22', '2', '20', '2017-04-22', 'dx', '');
INSERT INTO `customer` VALUES ('12', '2017-04-22-15000000001', '测试001', '15000000001', '1', '2017-04-22', null, '1', null, null, null, '');
INSERT INTO `customer` VALUES ('13', '2017-04-22-15000000002', '测试002', '15000000002', '0', '2017-04-22', null, '1', null, null, null, '');
INSERT INTO `customer` VALUES ('14', '2017-04-22-15000000003', '测试003', '15000000003', '1', '2017-04-22', null, '1', null, null, null, '');
INSERT INTO `customer` VALUES ('15', '2017-04-22-15000000004', '测试004', '15000000004', '0', '2017-04-22', null, '1', null, null, null, '');
INSERT INTO `customer` VALUES ('16', '2017-04-22-15000000005', '测试005', '15000000005', '1', '2017-04-22', null, '1', null, null, null, '');
INSERT INTO `customer` VALUES ('17', '2017-04-22-15000000006', '测试006', '15000000006', '0', '2017-04-22', null, '1', null, null, null, '');
INSERT INTO `customer` VALUES ('18', '2017-04-22-15000000007', '测试007', '15000000007', '1', '2017-04-22', null, '1', null, null, null, '');
INSERT INTO `customer` VALUES ('19', '2017-04-22-15000000008', '测试008', '15000000008', '0', '2017-04-22', null, '1', null, null, null, '');
INSERT INTO `customer` VALUES ('20', '2017-04-22-15000000009', '测试009', '15000000009', '1', '2017-04-22', null, '1', null, null, null, '');
INSERT INTO `customer` VALUES ('21', '2017-04-22-15000000010', '测试010', '15000000010', '1', '2017-04-22', null, '1', null, null, null, '');
INSERT INTO `customer` VALUES ('22', '2017-04-22-15966666666', '网咨测试', '15966666666', '1', '2017-04-22', '2017-04-22', '4', '17', '2017-04-22', 'wz', '');
INSERT INTO `customer` VALUES ('23', '2017-04-22-13800000001', '网咨导入001', '13800000001', '1', '2017-04-22', '2017-04-22', '3', '17', '2017-04-22', 'wz', '');
INSERT INTO `customer` VALUES ('24', '2017-04-22-13800000002', '网咨导入002', '13800000002', '0', '2017-04-22', '2017-04-22', '2', '17', '2017-04-22', 'wz', '');
INSERT INTO `customer` VALUES ('25', '2017-04-22-13800000003', '网咨导入003', '13800000003', '1', '2017-04-22', '2017-04-22', '2', '17', '2017-04-22', 'wz', '');
INSERT INTO `customer` VALUES ('26', '2017-04-22-13800000004', '网咨导入004', '13800000004', '0', '2017-04-22', '2017-04-22', '2', '17', '2017-04-22', 'wz', '');
INSERT INTO `customer` VALUES ('27', '2017-04-22-13800000005', '网咨导入005', '13800000005', '1', '2017-04-22', '2017-04-22', '2', '17', '2017-04-22', 'wz', '');
INSERT INTO `customer` VALUES ('28', '2017-04-22-13800000006', '网咨导入006', '13800000006', '0', '2017-04-22', '2017-04-22', '2', '17', '2017-04-22', 'wz', '');
INSERT INTO `customer` VALUES ('29', '2017-04-22-13800000007', '网咨导入007', '13800000007', '1', '2017-04-22', '2017-04-22', '2', '17', '2017-04-22', 'wz', '');
INSERT INTO `customer` VALUES ('30', '2017-04-22-13800000008', '网咨导入008', '13800000008', '0', '2017-04-22', '2017-04-22', '2', '17', '2017-04-22', 'wz', '');
INSERT INTO `customer` VALUES ('31', '2017-04-22-13800000009', '网咨导入009', '13800000009', '1', '2017-04-22', '2017-04-22', '2', '17', '2017-04-22', 'wz', '');
INSERT INTO `customer` VALUES ('32', '2017-04-22-13800000010', '网咨导入010', '13800000010', '1', '2017-04-22', '2017-04-22', '7', '17', '2017-04-22', 'wz', '');
INSERT INTO `customer` VALUES ('33', '2017-05-27-1101110101', '奥巴马', '1101110101', '1', '2017-05-27', '2017-05-27', '6', '15', '2017-05-27', 'zx', '英语不好');
INSERT INTO `customer` VALUES ('34', '2017-05-27-120120120', '特朗普', '120120120', '0', '2017-05-27', '2017-05-27', '6', '16', '2017-05-27', 'zx', '没有妹子');
INSERT INTO `customer` VALUES ('35', '2017-05-27-1111111', '布什', '1111111', '1', '2017-05-27', '2017-05-27', '2', '19', '2017-05-27', 'dx', '');
INSERT INTO `customer` VALUES ('36', '2017-05-27-11111', '克林顿', '11111', '1', '2017-05-27', '2017-05-27', '2', '20', '2017-05-27', 'dx', '');
INSERT INTO `customer` VALUES ('37', '2017-05-27-1111', '测试1', '1111', '1', '2017-05-27', '2017-05-27', '7', '15', '2017-05-27', 'zx', '');
INSERT INTO `customer` VALUES ('38', '2017-05-27-1112', '测试2', '1112', '0', '2017-05-27', '2017-05-27', '2', '16', '2017-05-27', 'zx', '');
INSERT INTO `customer` VALUES ('39', '2017-05-27-1113', '测试3', '1113', '1', '2017-05-27', '2017-05-27', '4', '15', '2017-05-27', 'zx', '');
INSERT INTO `customer` VALUES ('40', '2017-05-27-1114', '测试4', '1114', '0', '2017-05-27', '2017-05-27', '2', '16', '2017-05-27', 'zx', '');
INSERT INTO `customer` VALUES ('41', '2017-05-27-1115', '测试5', '1115', '1', '2017-05-27', '2017-05-27', '2', '15', '2017-05-27', 'zx', '');
INSERT INTO `customer` VALUES ('42', '2017-05-27-1116', '测试6', '1116', '1', '2017-05-27', '2017-05-27', '2', '16', '2017-05-27', 'zx', '');
INSERT INTO `customer` VALUES ('43', '2017-05-27-1117', '测试7', '1117', '0', '2017-05-27', '2017-05-27', '2', '15', '2017-05-27', 'zx', '');
INSERT INTO `customer` VALUES ('44', '2017-05-27-1118', '测试8', '1118', '1', '2017-05-27', '2017-05-27', '2', '16', '2017-05-27', 'zx', '');
INSERT INTO `customer` VALUES ('45', '2017-05-27-1119', '测试9', '1119', '1', '2017-05-27', '2017-05-27', '2', '15', '2017-05-27', 'zx', '');
INSERT INTO `customer` VALUES ('46', '2017-05-27-1120', '测试10', '1120', '0', '2017-05-27', '2017-07-16', '2', '15', '2017-07-16', 'zx', '');
INSERT INTO `customer` VALUES ('47', '2017-05-27-111111', '老布什', '111111', '1', '2017-05-27', '2017-05-27', '2', '17', '2017-05-27', 'wz', '');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `dbid` int(11) NOT NULL AUTO_INCREMENT,
  `staffId` varchar(36) DEFAULT NULL COMMENT '交给谁处理',
  `customerId` int(11) DEFAULT NULL COMMENT '客户ID',
  `updateDate` datetime DEFAULT NULL COMMENT '产生当前状态所在的日期',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `note` varchar(200) DEFAULT NULL COMMENT '备注',
  `visitDate` datetime DEFAULT NULL,
  PRIMARY KEY (`dbid`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('1', '15', '1', '2017-04-22 11:14:55', '2', null, null);
INSERT INTO `history` VALUES ('2', '16', '2', '2017-04-22 11:14:55', '2', null, null);
INSERT INTO `history` VALUES ('3', '15', '3', '2017-04-22 11:14:55', '2', null, null);
INSERT INTO `history` VALUES ('4', '16', '4', '2017-04-22 11:14:55', '2', null, null);
INSERT INTO `history` VALUES ('5', '15', '5', '2017-04-22 11:14:55', '2', null, null);
INSERT INTO `history` VALUES ('6', '19', '6', '2017-04-22 11:16:10', '2', null, null);
INSERT INTO `history` VALUES ('7', '20', '7', '2017-04-22 11:16:10', '2', null, null);
INSERT INTO `history` VALUES ('8', '19', '8', '2017-04-22 11:16:10', '2', null, null);
INSERT INTO `history` VALUES ('9', '20', '9', '2017-04-22 11:16:10', '2', null, null);
INSERT INTO `history` VALUES ('10', '19', '10', '2017-04-22 11:16:10', '2', null, null);
INSERT INTO `history` VALUES ('11', '20', '11', '2017-04-22 11:16:10', '2', null, null);
INSERT INTO `history` VALUES ('12', '15', '1', '2017-04-22 11:18:12', '3', null, null);
INSERT INTO `history` VALUES ('13', '15', '1', '2017-04-22 11:18:39', '4', null, null);
INSERT INTO `history` VALUES ('14', '15', '1', '2017-04-22 11:19:25', '6', '家庭原因', null);
INSERT INTO `history` VALUES ('15', '15', '3', '2017-04-22 11:19:48', '8', null, null);
INSERT INTO `history` VALUES ('16', '15', '3', '2017-04-22 11:20:09', '3', null, null);
INSERT INTO `history` VALUES ('17', '15', '3', '2017-04-22 11:20:25', '7', null, null);
INSERT INTO `history` VALUES ('18', '15', '5', '2017-04-22 11:20:35', '3', null, null);
INSERT INTO `history` VALUES ('19', '15', '5', '2017-04-22 11:20:52', '5', null, '2017-04-22 00:00:00');
INSERT INTO `history` VALUES ('20', '15', '5', '2017-04-22 11:21:01', '3', null, null);
INSERT INTO `history` VALUES ('21', '15', '5', '2017-04-22 11:21:10', '4', null, null);
INSERT INTO `history` VALUES ('22', '17', '22', '2017-04-22 11:22:56', '2', null, null);
INSERT INTO `history` VALUES ('23', '17', '22', '2017-04-22 11:23:08', '3', null, null);
INSERT INTO `history` VALUES ('24', '17', '22', '2017-04-22 11:23:13', '4', null, null);
INSERT INTO `history` VALUES ('25', '17', '23', '2017-04-22 11:24:27', '8', null, null);
INSERT INTO `history` VALUES ('26', '17', '32', '2017-04-22 11:25:04', '7', null, null);
INSERT INTO `history` VALUES ('27', '17', '23', '2017-04-22 11:26:08', '3', null, null);
INSERT INTO `history` VALUES ('28', '15', '33', '2017-05-27 14:25:59', '2', null, null);
INSERT INTO `history` VALUES ('29', '16', '34', '2017-05-27 14:25:59', '2', null, null);
INSERT INTO `history` VALUES ('30', '19', '35', '2017-05-27 14:27:04', '2', null, null);
INSERT INTO `history` VALUES ('31', '20', '36', '2017-05-27 14:27:04', '2', null, null);
INSERT INTO `history` VALUES ('32', '15', '37', '2017-05-27 14:29:21', '2', null, null);
INSERT INTO `history` VALUES ('33', '16', '38', '2017-05-27 14:29:21', '2', null, null);
INSERT INTO `history` VALUES ('34', '15', '39', '2017-05-27 14:29:21', '2', null, null);
INSERT INTO `history` VALUES ('35', '16', '40', '2017-05-27 14:29:21', '2', null, null);
INSERT INTO `history` VALUES ('36', '15', '41', '2017-05-27 14:29:21', '2', null, null);
INSERT INTO `history` VALUES ('37', '16', '42', '2017-05-27 14:29:21', '2', null, null);
INSERT INTO `history` VALUES ('38', '15', '43', '2017-05-27 14:29:21', '2', null, null);
INSERT INTO `history` VALUES ('39', '16', '44', '2017-05-27 14:29:21', '2', null, null);
INSERT INTO `history` VALUES ('40', '15', '45', '2017-05-27 14:29:21', '2', null, null);
INSERT INTO `history` VALUES ('41', '15', '33', '2017-05-27 14:31:50', '3', null, null);
INSERT INTO `history` VALUES ('42', '15', '33', '2017-05-27 14:32:25', '4', null, null);
INSERT INTO `history` VALUES ('43', '15', '33', '2017-05-27 14:33:47', '6', '英语不好', null);
INSERT INTO `history` VALUES ('44', '15', '37', '2017-05-27 14:34:12', '8', null, null);
INSERT INTO `history` VALUES ('45', '15', '37', '2017-05-27 14:34:38', '7', null, null);
INSERT INTO `history` VALUES ('46', '15', '39', '2017-05-27 14:34:56', '3', null, null);
INSERT INTO `history` VALUES ('47', '15', '39', '2017-05-27 14:35:22', '5', null, '2017-05-27 00:00:00');
INSERT INTO `history` VALUES ('48', '15', '39', '2017-05-27 14:35:38', '3', null, null);
INSERT INTO `history` VALUES ('49', '15', '39', '2017-05-27 14:35:43', '4', null, null);
INSERT INTO `history` VALUES ('50', '16', '34', '2017-05-27 14:36:43', '3', null, null);
INSERT INTO `history` VALUES ('51', '16', '34', '2017-05-27 14:36:54', '4', null, null);
INSERT INTO `history` VALUES ('52', '16', '34', '2017-05-27 14:37:10', '6', '没有妹子', null);
INSERT INTO `history` VALUES ('53', '19', '10', '2017-05-27 14:39:15', '3', null, null);
INSERT INTO `history` VALUES ('54', '19', '10', '2017-05-27 14:39:20', '4', null, null);
INSERT INTO `history` VALUES ('55', '17', '47', '2017-05-27 14:41:35', '2', null, null);
INSERT INTO `history` VALUES ('56', '15', '46', '2017-07-16 00:14:56', '2', null, null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `dbid` int(12) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(20) DEFAULT NULL,
  `roleCode` varchar(20) DEFAULT NULL,
  `valid` varchar(1) DEFAULT NULL,
  `orders` int(12) DEFAULT NULL,
  PRIMARY KEY (`dbid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', 'admin', '1', '1');
INSERT INTO `role` VALUES ('2', '销售助理', 'sales_assist', '1', '10');
INSERT INTO `role` VALUES ('3', '咨询师', 'zx', '1', '20');
INSERT INTO `role` VALUES ('4', '电销师', 'dx', '1', '30');
INSERT INTO `role` VALUES ('5', '网咨师', 'wz', '1', '40');
INSERT INTO `role` VALUES ('6', '咨询主管', 'zxzg', '1', '25');
INSERT INTO `role` VALUES ('7', '电销主管', 'dxzg', '1', '35');
INSERT INTO `role` VALUES ('8', '网咨主管', 'wzzg', '1', '45');
INSERT INTO `role` VALUES ('9', '测试人员', 'test', '1', '100');

-- ----------------------------
-- Table structure for role_auth
-- ----------------------------
DROP TABLE IF EXISTS `role_auth`;
CREATE TABLE `role_auth` (
  `dbid` int(12) NOT NULL AUTO_INCREMENT,
  `roleId` int(12) DEFAULT NULL,
  `authId` int(12) DEFAULT NULL,
  PRIMARY KEY (`dbid`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_auth
-- ----------------------------
INSERT INTO `role_auth` VALUES ('141', '4', '1');
INSERT INTO `role_auth` VALUES ('142', '4', '23');
INSERT INTO `role_auth` VALUES ('143', '4', '27');
INSERT INTO `role_auth` VALUES ('147', '6', '1');
INSERT INTO `role_auth` VALUES ('148', '6', '22');
INSERT INTO `role_auth` VALUES ('149', '6', '29');
INSERT INTO `role_auth` VALUES ('150', '7', '1');
INSERT INTO `role_auth` VALUES ('151', '7', '23');
INSERT INTO `role_auth` VALUES ('152', '7', '30');
INSERT INTO `role_auth` VALUES ('153', '8', '1');
INSERT INTO `role_auth` VALUES ('154', '8', '24');
INSERT INTO `role_auth` VALUES ('155', '8', '31');
INSERT INTO `role_auth` VALUES ('156', '1', '1');
INSERT INTO `role_auth` VALUES ('157', '1', '2');
INSERT INTO `role_auth` VALUES ('158', '1', '5');
INSERT INTO `role_auth` VALUES ('159', '1', '11');
INSERT INTO `role_auth` VALUES ('160', '1', '14');
INSERT INTO `role_auth` VALUES ('161', '1', '15');
INSERT INTO `role_auth` VALUES ('162', '1', '6');
INSERT INTO `role_auth` VALUES ('163', '1', '7');
INSERT INTO `role_auth` VALUES ('164', '1', '21');
INSERT INTO `role_auth` VALUES ('165', '1', '25');
INSERT INTO `role_auth` VALUES ('166', '1', '22');
INSERT INTO `role_auth` VALUES ('167', '1', '26');
INSERT INTO `role_auth` VALUES ('168', '1', '29');
INSERT INTO `role_auth` VALUES ('169', '1', '23');
INSERT INTO `role_auth` VALUES ('170', '1', '27');
INSERT INTO `role_auth` VALUES ('171', '1', '30');
INSERT INTO `role_auth` VALUES ('172', '1', '24');
INSERT INTO `role_auth` VALUES ('173', '1', '28');
INSERT INTO `role_auth` VALUES ('174', '1', '31');
INSERT INTO `role_auth` VALUES ('175', '9', '1');
INSERT INTO `role_auth` VALUES ('176', '9', '21');
INSERT INTO `role_auth` VALUES ('177', '9', '25');
INSERT INTO `role_auth` VALUES ('178', '2', '1');
INSERT INTO `role_auth` VALUES ('179', '2', '2');
INSERT INTO `role_auth` VALUES ('180', '2', '5');
INSERT INTO `role_auth` VALUES ('181', '2', '11');
INSERT INTO `role_auth` VALUES ('182', '2', '14');
INSERT INTO `role_auth` VALUES ('183', '2', '15');
INSERT INTO `role_auth` VALUES ('184', '2', '21');
INSERT INTO `role_auth` VALUES ('185', '2', '25');
INSERT INTO `role_auth` VALUES ('186', '3', '1');
INSERT INTO `role_auth` VALUES ('187', '3', '22');
INSERT INTO `role_auth` VALUES ('188', '3', '26');
INSERT INTO `role_auth` VALUES ('189', '3', '29');
INSERT INTO `role_auth` VALUES ('190', '3', '23');
INSERT INTO `role_auth` VALUES ('191', '3', '27');
INSERT INTO `role_auth` VALUES ('192', '3', '30');
INSERT INTO `role_auth` VALUES ('193', '5', '1');
INSERT INTO `role_auth` VALUES ('194', '5', '2');
INSERT INTO `role_auth` VALUES ('195', '5', '5');
INSERT INTO `role_auth` VALUES ('196', '5', '11');
INSERT INTO `role_auth` VALUES ('197', '5', '14');
INSERT INTO `role_auth` VALUES ('198', '5', '15');
INSERT INTO `role_auth` VALUES ('199', '5', '24');
INSERT INTO `role_auth` VALUES ('200', '5', '28');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status` (
  `dbid` int(12) NOT NULL AUTO_INCREMENT,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`dbid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES ('1', '新建');
INSERT INTO `status` VALUES ('2', '已分配');
INSERT INTO `status` VALUES ('3', '上门');
INSERT INTO `status` VALUES ('4', '已报');
INSERT INTO `status` VALUES ('5', '紧跟');
INSERT INTO `status` VALUES ('6', '退费');
INSERT INTO `status` VALUES ('7', '死单');
INSERT INTO `status` VALUES ('8', '未通');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `dbid` int(12) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(36) DEFAULT NULL,
  `realName` varchar(20) DEFAULT NULL,
  `valid` varchar(2) DEFAULT NULL COMMENT '1:正常，0：冻结',
  PRIMARY KEY (`dbid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('12', 'admin', 'MTIz', '管理员', '1');
INSERT INTO `user` VALUES ('15', 'zx1', 'MTIzNDU2', '咨询师1', '1');
INSERT INTO `user` VALUES ('16', 'zx2', 'MTIzNDU2', '咨询师2', '1');
INSERT INTO `user` VALUES ('17', 'wz1', 'MTIzNDU2', '网咨1', '1');
INSERT INTO `user` VALUES ('18', 'wz2', 'MTIzNDU2', '网咨2', '1');
INSERT INTO `user` VALUES ('19', 'dx1', 'MTIzNDU2', '电销1', '1');
INSERT INTO `user` VALUES ('20', 'dx2', 'MTIzNDU2', '电销2', '1');
INSERT INTO `user` VALUES ('21', 'xs1', 'MTIzNDU2', '销售助理1', '1');
INSERT INTO `user` VALUES ('22', 'zxzg', 'MTIzNDU2', '咨询主管', '1');
INSERT INTO `user` VALUES ('23', 'dxzg', 'MTIzNDU2', '电销主管', '1');
INSERT INTO `user` VALUES ('24', 'wzzg', 'MTIzNDU2', '网咨主管', '1');
INSERT INTO `user` VALUES ('25', 'test', 'MTExMTEx', '测试人员', '1');
INSERT INTO `user` VALUES ('26', 'xiaoming', 'MTIzNDU2', '小明明', '1');
INSERT INTO `user` VALUES ('27', '123', '123', null, null);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `dbid` int(12) NOT NULL AUTO_INCREMENT,
  `userId` int(12) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`dbid`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('24', '17', '5');
INSERT INTO `user_role` VALUES ('25', '18', '5');
INSERT INTO `user_role` VALUES ('26', '19', '4');
INSERT INTO `user_role` VALUES ('27', '20', '4');
INSERT INTO `user_role` VALUES ('28', '21', '2');
INSERT INTO `user_role` VALUES ('30', '22', '6');
INSERT INTO `user_role` VALUES ('31', '23', '7');
INSERT INTO `user_role` VALUES ('32', '24', '8');
INSERT INTO `user_role` VALUES ('38', '26', '1');
INSERT INTO `user_role` VALUES ('106', '12', '1');
INSERT INTO `user_role` VALUES ('107', '12', '2');
INSERT INTO `user_role` VALUES ('108', '12', '3');
INSERT INTO `user_role` VALUES ('109', '12', '4');
INSERT INTO `user_role` VALUES ('132', '16', '3');
INSERT INTO `user_role` VALUES ('133', '16', '4');
INSERT INTO `user_role` VALUES ('136', '27', '2');
INSERT INTO `user_role` VALUES ('160', '15', '2');
INSERT INTO `user_role` VALUES ('161', '15', '3');
INSERT INTO `user_role` VALUES ('162', '15', '4');
INSERT INTO `user_role` VALUES ('163', '15', '5');

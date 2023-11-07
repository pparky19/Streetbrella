/*
 Navicat Premium Data Transfer

 Source Server         : DevDatabase
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : 192.168.1.84:3306
 Source Schema         : hire

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 07/11/2023 10:35:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `rid` bigint NOT NULL AUTO_INCREMENT,
  `rName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Rental item name',
  `rPrice` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Product unit price',
  `rUnit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Price unit: yuan/hour',
  `rNumber` int NULL DEFAULT NULL COMMENT 'Product quantity',
  `r_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Product diagram',
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, 'umbrella', 3.00, 'hour', 100, NULL);

-- ----------------------------
-- Table structure for hirehistory
-- ----------------------------
DROP TABLE IF EXISTS `hirehistory`;
CREATE TABLE `hirehistory`  (
  `hid` bigint NOT NULL AUTO_INCREMENT,
  `hRid` bigint NULL DEFAULT NULL COMMENT 'Rental product table assocaition ID',
  `hUid` bigint NULL DEFAULT NULL COMMENT 'User table association ID',
  `hStartDate` timestamp NULL DEFAULT NULL COMMENT 'Rental start time',
  `hEndDate` timestamp NULL DEFAULT NULL COMMENT 'Rental end time',
  `hDuration` int NULL DEFAULT NULL COMMENT 'Rental duration, less than one hour is counted as one hour',
  `hMoney` decimal(10, 2) NULL DEFAULT NULL COMMENT 'Payment amount',
  `payDate` timestamp NULL DEFAULT NULL COMMENT 'Payment time',
  `payType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Payment type (Ali Pay/Wechat Pay)',
  PRIMARY KEY (`hid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hirehistory
-- ----------------------------
INSERT INTO `hirehistory` VALUES (1, 1, 1, '2023-11-07 10:33:00', '2023-11-07 11:33:04', 1, 3.00, '2023-11-07 11:35:24', 'wechat');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'User ID',
  `pwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'User password',
  `wechatNo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'User Wechat nimber',
  `phoneNo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Phone number',
  `regDate` timestamp NULL DEFAULT NULL COMMENT 'Register time',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zouyuchao', 'mvnumtXPyO0/gy12kQkpkw==', 'smilewolf', '13888888888', '2023-11-07 10:18:34');

SET FOREIGN_KEY_CHECKS = 1;

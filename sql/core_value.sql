/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : core_value

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 12/03/2023 12:00:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (3, 'mark', '评分记录表', NULL, NULL, 'Mark', 'crud', 'com.ruoyi.system', 'system', 'mark', '评分记录表', 'cao', '0', '/', '{}', 'admin', '2023-03-02 15:09:05', '', '2023-03-02 15:10:48', NULL);
INSERT INTO `gen_table` VALUES (4, 'mark_amend', '评分记录表确认', NULL, NULL, 'MarkAmend', 'crud', 'com.ruoyi.system', 'system', 'amend', '评分记录表修正', 'cao', '0', '/', '{\"parentMenuId\":2006}', 'admin', '2023-03-02 16:58:18', '', '2023-03-03 09:02:03', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (27, '3', 'id', 'id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-02 15:09:05', '', '2023-03-02 15:10:48');
INSERT INTO `gen_table_column` VALUES (28, '3', 'user_id', '用户id', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-03-02 15:09:05', '', '2023-03-02 15:10:48');
INSERT INTO `gen_table_column` VALUES (29, '3', 'username', '用户名称', 'varchar(255)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-03-02 15:09:05', '', '2023-03-02 15:10:48');
INSERT INTO `gen_table_column` VALUES (30, '3', 'cjkh', '成就客户', 'float', 'Double', 'cjkh', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-03-02 15:09:05', '', '2023-03-02 15:10:48');
INSERT INTO `gen_table_column` VALUES (31, '3', 'wssx', '务实守信', 'float', 'Double', 'wssx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-03-02 15:09:05', '', '2023-03-02 15:10:48');
INSERT INTO `gen_table_column` VALUES (32, '3', 'hzgj', '合作共进', 'float', 'Double', 'hzgj', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-03-02 15:09:05', '', '2023-03-02 15:10:48');
INSERT INTO `gen_table_column` VALUES (33, '3', 'cxfz', '创新发展', 'float', 'Double', 'cxfz', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-03-02 15:09:05', '', '2023-03-02 15:10:48');
INSERT INTO `gen_table_column` VALUES (34, '3', 'avg_score', '平均分', 'float', 'Double', 'avgScore', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-03-02 15:09:05', '', '2023-03-02 15:10:48');
INSERT INTO `gen_table_column` VALUES (35, '3', 'scoring_time', '评分时间，一般本月评分上一个月', 'datetime', 'Date', 'scoringTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2023-03-02 15:09:05', '', '2023-03-02 15:10:48');
INSERT INTO `gen_table_column` VALUES (36, '3', 'explanation', '说明', 'varchar(500)', 'String', 'explanation', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 10, 'admin', '2023-03-02 15:09:05', '', '2023-03-02 15:10:48');
INSERT INTO `gen_table_column` VALUES (37, '3', 'create_time', NULL, 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2023-03-02 15:09:05', '', '2023-03-02 15:10:48');
INSERT INTO `gen_table_column` VALUES (38, '3', 'update_time', NULL, 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2023-03-02 15:09:05', '', '2023-03-02 15:10:48');
INSERT INTO `gen_table_column` VALUES (39, '3', 'is_deleted', '0--未删除 1--已删除', 'tinyint(1) unsigned zerofill', 'Integer', 'isDeleted', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2023-03-02 15:09:05', '', '2023-03-02 15:10:48');
INSERT INTO `gen_table_column` VALUES (40, '4', 'id', 'id', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-03-02 16:58:18', '', '2023-03-03 09:02:03');
INSERT INTO `gen_table_column` VALUES (41, '4', 'user_id', '用户id', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-03-02 16:58:18', '', '2023-03-03 09:02:03');
INSERT INTO `gen_table_column` VALUES (42, '4', 'mark_id', '评分表id', 'bigint', 'Long', 'markId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-03-02 16:58:18', '', '2023-03-03 09:02:03');
INSERT INTO `gen_table_column` VALUES (43, '4', 'username', '用户名称', 'varchar(255)', 'String', 'username', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-03-02 16:58:18', '', '2023-03-03 09:02:03');
INSERT INTO `gen_table_column` VALUES (44, '4', 'cjkh', '成就客户', 'float', 'Double', 'cjkh', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-03-02 16:58:18', '', '2023-03-03 09:02:03');
INSERT INTO `gen_table_column` VALUES (45, '4', 'wssx', '务实守信', 'float', 'Double', 'wssx', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-03-02 16:58:18', '', '2023-03-03 09:02:03');
INSERT INTO `gen_table_column` VALUES (46, '4', 'hzgj', '合作共进', 'float', 'Double', 'hzgj', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-03-02 16:58:18', '', '2023-03-03 09:02:03');
INSERT INTO `gen_table_column` VALUES (47, '4', 'cxfz', '创新发展', 'float', 'Double', 'cxfz', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-03-02 16:58:18', '', '2023-03-03 09:02:03');
INSERT INTO `gen_table_column` VALUES (48, '4', 'avg_score', '平均分', 'float', 'Double', 'avgScore', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-03-02 16:58:18', '', '2023-03-03 09:02:03');
INSERT INTO `gen_table_column` VALUES (49, '4', 'explanation', '说明', 'varchar(0)', 'String', 'explanation', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-03-02 16:58:18', '', '2023-03-03 09:02:03');
INSERT INTO `gen_table_column` VALUES (50, '4', 'scoring_time', '评分时间，一般本月评分上一个月', 'datetime', 'Date', 'scoringTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2023-03-02 16:58:18', '', '2023-03-03 09:02:03');
INSERT INTO `gen_table_column` VALUES (51, '4', 'create_time', NULL, 'datetime', 'Date', 'createTime', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2023-03-02 16:58:18', '', '2023-03-03 09:02:03');
INSERT INTO `gen_table_column` VALUES (52, '4', 'update_time', NULL, 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2023-03-02 16:58:18', '', '2023-03-03 09:02:03');
INSERT INTO `gen_table_column` VALUES (53, '4', 'is_deleted', '0--未删除 1--已删除', 'tinyint(1) unsigned zerofill', 'Integer', 'isDeleted', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2023-03-02 16:58:18', '', '2023-03-03 09:02:03');

-- ----------------------------
-- Table structure for mark
-- ----------------------------
DROP TABLE IF EXISTS `mark`;
CREATE TABLE `mark`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名称',
  `cjkh` float NULL DEFAULT NULL COMMENT '成就客户',
  `wssx` float NULL DEFAULT NULL COMMENT '务实守信',
  `hzgj` float NULL DEFAULT NULL COMMENT '合作共进',
  `cxfz` float NULL DEFAULT NULL COMMENT '创新发展',
  `avg_score` float NULL DEFAULT NULL COMMENT '平均分',
  `scoring_time` datetime(0) NOT NULL COMMENT '评分时间，一般本月评分上一个月',
  `explanation` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '说明',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '0--未删除 1--已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mark
-- ----------------------------
INSERT INTO `mark` VALUES (38, 1, 'admin', 3, 3, 3, 3, 3, '2023-02-01 00:00:00', '3', '2023-03-06 17:11:16', '2023-03-06 17:11:16', NULL);
INSERT INTO `mark` VALUES (39, 1, 'admin', 5, 5, 5, 5, 5, '2023-03-01 00:00:00', '5', '2023-03-06 17:11:24', '2023-03-06 17:11:24', NULL);
INSERT INTO `mark` VALUES (40, 100, '曹浩博', 2, 3.5, 4.5, 3.3, 3.325, '2023-02-01 00:00:00', '测试', '2023-03-06 17:15:45', '2023-03-06 17:15:45', NULL);
INSERT INTO `mark` VALUES (41, 1, 'admin', 5, 4, 5, 4, 4.5, '2023-01-01 00:00:00', '测试', '2023-03-08 09:28:24', '2023-03-08 09:28:23', NULL);
INSERT INTO `mark` VALUES (42, 100, '曹浩博', 3.5, 4, 4, 5, 4.125, '2023-03-01 00:00:00', NULL, '2023-03-08 13:36:53', '2023-03-08 13:36:52', NULL);
INSERT INTO `mark` VALUES (43, 1, 'admin', 0, 0, 2, 0, 0.5, '2023-04-01 00:00:00', 'https://www.yuque.com/g/sinianyanbudaoyongyuan/yt1gnr/gg3kekxkoxpourag/collaborator/join?token=8u8AdS3V3ZyXXx2j&goto=%2Fsinianyanbudaoyongyuan%2Fyt1gnr%2Fgg3kekxkoxpourag%2Fedit# 邀请你共同编辑文档《无标题文档》发射点发射点', '2023-03-08 14:19:34', '2023-03-10 17:41:14', NULL);
INSERT INTO `mark` VALUES (44, 100, '曹浩博', 4, 2, 0.5, 1, 1.875, '2023-01-01 00:00:00', '3', '2023-03-09 08:45:59', '2023-03-09 08:46:08', NULL);

-- ----------------------------
-- Table structure for mark_amend
-- ----------------------------
DROP TABLE IF EXISTS `mark_amend`;
CREATE TABLE `mark_amend`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `mark_id` bigint(0) NOT NULL COMMENT '评分表id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户名称',
  `cjkh` float NULL DEFAULT NULL COMMENT '成就客户',
  `wssx` float NULL DEFAULT NULL COMMENT '务实守信',
  `hzgj` float NULL DEFAULT NULL COMMENT '合作共进',
  `cxfz` float NULL DEFAULT NULL COMMENT '创新发展',
  `avg_score` float NULL DEFAULT NULL COMMENT '平均分',
  `explanation` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '说明',
  `scoring_time` datetime(0) NULL DEFAULT NULL COMMENT '评分时间，一般本月评分上一个月',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `is_deleted` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '0--未删除 1--已删除',
  `is_updated` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 0 COMMENT '0--未修改 1--已修改',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mark_amend
-- ----------------------------
INSERT INTO `mark_amend` VALUES (105, 1, 38, 'admin', 4, 4, 3, 3, 3.5, '3', '2023-02-01 00:00:00', '2023-03-06 17:11:16', '2023-03-08 15:10:05', 0, 1);
INSERT INTO `mark_amend` VALUES (106, 1, 39, 'admin', 3, 5, 5, 5, 4.5, '5', '2023-03-01 00:00:00', '2023-03-06 17:11:24', '2023-03-06 17:24:09', 0, 1);
INSERT INTO `mark_amend` VALUES (107, 100, 40, '曹浩博', 4, 2, 4.5, 3.3, 3.45, '测试', '2023-02-01 00:00:00', '2023-03-07 08:51:03', '2023-03-08 15:10:01', 0, 1);
INSERT INTO `mark_amend` VALUES (108, 1, 41, 'admin', 5, 4, 5, 4, 4.5, '测试', '2023-01-01 00:00:00', '2023-03-08 09:28:24', '2023-03-08 09:28:23', 0, 0);
INSERT INTO `mark_amend` VALUES (109, 100, 42, '曹浩博', 3.5, 4, 4, 5, 4.125, NULL, '2023-03-01 00:00:00', '2023-03-08 13:36:53', '2023-03-08 13:36:52', 0, 0);
INSERT INTO `mark_amend` VALUES (110, 1, 43, 'admin', 0, 0, 2, 0, 0.5, 'https://www.yuque.com/g/sinianyanbudaoyongyuan/yt1gnr/gg3kekxkoxpourag/collaborator/join?token=8u8AdS3V3ZyXXx2j&goto=%2Fsinianyanbudaoyongyuan%2Fyt1gnr%2Fgg3kekxkoxpourag%2Fedit# 邀请你共同编辑文档《无标题文档》发射点发射点', '2023-04-01 00:00:00', '2023-03-08 14:19:34', '2023-03-10 17:41:14', 0, 0);
INSERT INTO `mark_amend` VALUES (111, 100, 44, '曹浩博', 4, 2, 0.5, 1, 1.875, '3', '2023-01-01 00:00:00', '2023-03-09 08:45:59', '2023-03-09 08:46:08', 0, 0);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-03-02 14:00:22', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-03-02 14:00:22', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-03-02 14:00:22', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'N', 'admin', '2023-03-02 14:00:22', 'admin', '2023-03-09 10:56:44', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-03-02 14:00:22', 'admin', '2023-03-09 09:48:22', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-03-02 14:00:22', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-02 14:00:21', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-02 14:00:21', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-02 14:00:21', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-02 14:00:21', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-02 14:00:21', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-02 14:00:21', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-02 14:00:21', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-02 14:00:21', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-02 14:00:21', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-03-02 14:00:21', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-03-02 14:00:22', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-03-02 14:00:22', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 271 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-02 14:12:11');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-02 14:12:43');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-02 14:18:28');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-02 15:49:29');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-02 15:49:33');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-03 08:38:21');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-03 08:40:53');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-03 08:40:59');
INSERT INTO `sys_logininfor` VALUES (108, 'cao', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：cao 不存在', '2023-03-03 08:41:54');
INSERT INTO `sys_logininfor` VALUES (109, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-03 08:41:59');
INSERT INTO `sys_logininfor` VALUES (110, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-03 08:45:27');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-03 08:45:29');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-03 08:45:38');
INSERT INTO `sys_logininfor` VALUES (113, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-03 08:45:46');
INSERT INTO `sys_logininfor` VALUES (114, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-03 08:52:28');
INSERT INTO `sys_logininfor` VALUES (115, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-03-03 08:52:40');
INSERT INTO `sys_logininfor` VALUES (116, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-03 08:52:40');
INSERT INTO `sys_logininfor` VALUES (117, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-03 08:52:45');
INSERT INTO `sys_logininfor` VALUES (118, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-03 08:56:23');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-03 08:56:26');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-03 08:56:54');
INSERT INTO `sys_logininfor` VALUES (121, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-03 08:57:02');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-03 09:41:36');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-03 10:39:41');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-03 10:39:57');
INSERT INTO `sys_logininfor` VALUES (125, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-03 10:42:25');
INSERT INTO `sys_logininfor` VALUES (126, '陈晨', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 10', '0', '登录成功', '2023-03-03 10:44:18');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-03 11:13:05');
INSERT INTO `sys_logininfor` VALUES (128, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-03 11:15:35');
INSERT INTO `sys_logininfor` VALUES (129, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-03 11:15:44');
INSERT INTO `sys_logininfor` VALUES (130, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-03 11:18:34');
INSERT INTO `sys_logininfor` VALUES (131, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-03 11:19:27');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-03 13:35:28');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-03 14:08:00');
INSERT INTO `sys_logininfor` VALUES (134, '陈晨', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-03 14:13:39');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-03 14:39:47');
INSERT INTO `sys_logininfor` VALUES (136, '陈晨', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-03 14:55:01');
INSERT INTO `sys_logininfor` VALUES (137, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-03 14:55:14');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-03 16:40:18');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-06 08:40:35');
INSERT INTO `sys_logininfor` VALUES (140, '曹浩博', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-06 08:41:10');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '192.168.3.76', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-06 08:47:07');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-06 08:51:25');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-06 08:51:45');
INSERT INTO `sys_logininfor` VALUES (144, '曹浩博', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-06 08:51:53');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '192.168.1.48', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-06 08:56:03');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-06 10:00:49');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-06 12:06:08');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-06 13:34:01');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 10', '0', '登录成功', '2023-03-06 13:49:53');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 10', '0', '登录成功', '2023-03-06 13:50:35');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 10', '0', '登录成功', '2023-03-06 14:24:02');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-06 14:35:20');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-06 15:22:46');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-06 15:22:49');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-06 15:23:02');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-06 15:23:18');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-06 15:23:22');
INSERT INTO `sys_logininfor` VALUES (158, '曹浩博', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-06 15:26:45');
INSERT INTO `sys_logininfor` VALUES (159, '曹浩博', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-06 15:33:46');
INSERT INTO `sys_logininfor` VALUES (160, '曹浩博', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-06 15:33:57');
INSERT INTO `sys_logininfor` VALUES (161, '曹浩博', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-06 15:34:30');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-06 15:34:34');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-06 15:35:00');
INSERT INTO `sys_logininfor` VALUES (164, '曹浩博', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-06 15:35:08');
INSERT INTO `sys_logininfor` VALUES (165, '曹浩博', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-06 15:35:53');
INSERT INTO `sys_logininfor` VALUES (166, '曹浩博', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-06 15:36:05');
INSERT INTO `sys_logininfor` VALUES (167, '曹浩博', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-06 15:41:04');
INSERT INTO `sys_logininfor` VALUES (168, '曹浩博', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-06 15:41:13');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-06 15:41:50');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-06 15:41:52');
INSERT INTO `sys_logininfor` VALUES (171, '曹浩博', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-06 16:13:47');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-06 16:13:50');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-06 16:18:26');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 10', '0', '登录成功', '2023-03-06 16:39:57');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-06 16:41:09');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-06 16:41:11');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-06 16:41:56');
INSERT INTO `sys_logininfor` VALUES (178, '曹浩博', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-06 16:42:06');
INSERT INTO `sys_logininfor` VALUES (179, '曹浩博', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-06 17:06:17');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-06 17:06:20');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-06 17:12:03');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-06 17:12:08');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-06 17:12:12');
INSERT INTO `sys_logininfor` VALUES (184, '曹浩博', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-06 17:12:23');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-06 17:23:53');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-07 08:32:35');
INSERT INTO `sys_logininfor` VALUES (187, '陈晨', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-07 08:37:35');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-07 12:29:26');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-07 14:53:33');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-07 14:56:03');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-07 14:59:46');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-07 15:54:18');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-07 16:25:25');
INSERT INTO `sys_logininfor` VALUES (194, '曹浩博', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-07 16:25:39');
INSERT INTO `sys_logininfor` VALUES (195, '曹浩博', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-07 16:25:46');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '4.2.2.2', 'XX XX', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-07 16:25:48');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '4.2.2.2', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-07 16:48:15');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-07 22:30:46');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-07 22:31:28');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-03-07 22:31:57');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-07 22:31:57');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-07 22:32:11');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-03-07 22:32:11');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误3次', '2023-03-07 22:32:13');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-07 22:32:13');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误4次', '2023-03-07 22:33:58');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-03-07 22:34:03');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-08 08:34:14');
INSERT INTO `sys_logininfor` VALUES (209, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 08:39:36');
INSERT INTO `sys_logininfor` VALUES (210, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-08 09:27:49');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 09:27:50');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 11:22:39');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 11:22:42');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 11:30:39');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 11:33:42');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 12:39:03');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 12:47:15');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 12:48:19');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 12:57:16');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 12:59:38');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 13:04:48');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '192.168.1.48', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 13:34:24');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '192.168.1.48', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-08 13:35:24');
INSERT INTO `sys_logininfor` VALUES (224, '曹浩博', '192.168.1.48', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 13:35:29');
INSERT INTO `sys_logininfor` VALUES (225, '曹浩博', '192.168.1.48', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-08 13:37:01');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '192.168.1.48', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 13:37:03');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 13:43:55');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 14:31:03');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 14:32:37');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 14:42:23');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 17:13:35');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-08 17:15:20');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-09 08:38:18');
INSERT INTO `sys_logininfor` VALUES (234, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-09 08:45:24');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-09 09:06:06');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-09 09:06:42');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-09 09:47:38');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-09 09:47:54');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-09 10:14:29');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 10', '0', '登录成功', '2023-03-09 14:46:08');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 10', '0', '退出成功', '2023-03-09 14:47:44');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 10', '0', '登录成功', '2023-03-09 14:49:00');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-09 14:54:27');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-09 14:55:22');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-09 14:55:34');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-09 16:07:51');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-09 16:12:49');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-09 16:12:54');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-09 16:12:58');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-09 16:13:08');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-09 16:13:18');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-09 16:13:27');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-03-09 16:13:31');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-09 16:46:50');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-09 16:48:14');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-09 17:36:49');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-10 08:59:35');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-10 09:04:52');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-10 09:05:16');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-10 09:39:16');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-10 09:39:18');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-10 09:40:05');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-10 10:15:45');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-03-10 10:33:58');
INSERT INTO `sys_logininfor` VALUES (265, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-10 10:45:21');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 10:45:44');
INSERT INTO `sys_logininfor` VALUES (267, '曹浩博', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-03-10 11:27:04');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 16:36:19');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-10 17:38:53');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-03-12 11:23:06');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2018 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-03-02 14:00:21', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2023-03-02 14:00:21', 'admin', '2023-03-06 16:00:20', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '1', '0', '', 'tool', 'admin', '2023-03-02 14:00:21', 'admin', '2023-03-06 16:02:58', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-03-02 14:00:21', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-03-02 14:00:21', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-03-02 14:00:21', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-03-02 14:00:21', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-03-02 14:00:21', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-03-02 14:00:21', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-03-02 14:00:21', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-03-02 14:00:21', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-03-02 14:00:21', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-03-02 14:00:21', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-03-02 14:00:21', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-03-02 14:00:21', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-03-02 14:00:21', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-03-02 14:00:21', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-03-02 14:00:21', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-03-02 14:00:21', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-03-02 14:00:21', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-03-02 14:00:21', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-03-02 14:00:21', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-03-02 14:00:21', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-03-02 14:00:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '评分记录管理', 0, 3, 'mark', NULL, NULL, 1, 0, 'M', '0', '0', '', 'education', 'admin', '2023-03-02 14:47:13', 'admin', '2023-03-06 16:03:02', '');
INSERT INTO `sys_menu` VALUES (2007, '评分记录表', 2006, 1, 'mark', 'system/mark/index', NULL, 1, 1, 'C', '0', '0', 'system:mark:list', 'druid', 'admin', '2023-03-02 14:49:50', 'admin', '2023-03-06 16:17:51', '');
INSERT INTO `sys_menu` VALUES (2008, '评分记录新增', 2007, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:mark:add', '#', 'admin', '2023-03-03 08:52:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '评分记录修改', 2007, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:mark:edit', '#', '曹浩博', '2023-03-03 08:54:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '评分记录删除', 2007, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:mark:remove', '#', '曹浩博', '2023-03-03 08:55:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '评分记录表修正', 2006, 1, 'amend', 'system/amend/index', NULL, 1, 1, 'C', '0', '0', 'system:amend:list', 'build', 'admin', '2023-03-03 09:04:01', 'admin', '2023-03-06 16:17:55', '评分记录表修正菜单');
INSERT INTO `sys_menu` VALUES (2012, '评分记录表修正查询', 2011, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:amend:query', '#', 'admin', '2023-03-03 09:04:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '评分记录表修正新增', 2011, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:amend:add', '#', 'admin', '2023-03-03 09:04:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '评分记录表修正修改', 2011, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:amend:edit', '#', 'admin', '2023-03-03 09:04:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '评分记录表修正删除', 2011, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:amend:remove', '#', 'admin', '2023-03-03 09:04:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '评分记录表修正导出', 2011, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:amend:export', '#', 'admin', '2023-03-03 09:04:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '评分记录查询', 2007, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:mark:query', '#', 'admin', '2023-03-03 11:15:09', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-03-02 14:00:22', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-03-02 14:00:22', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(0) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 385 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"N\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 14:00:22\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 14:12:37', 49);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"mark\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 14:20:04', 83);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"mark\",\"className\":\"Mark\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 14:20:04\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":2,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 14:20:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Username\",\"columnComment\":\"用户名称\",\"columnId\":3,\"columnName\":\"username\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 14:20:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"username\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Cjkh\",\"columnComment\":\"成就客户\",\"columnId\":4,\"columnName\":\"cjkh\",\"columnType\":\"float\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 14:20:04\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cjkh\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 14:22:46', 51);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"mark\"}', NULL, 0, NULL, '2023-03-02 14:22:49', 41);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"评分记录表\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"mark\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 14:47:13', 26);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-02 14:47:13\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"评分记录管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"mark\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 14:48:03', 10);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/mark/index\",\"createBy\":\"admin\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"评分记录表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"mark\",\"perms\":\"system:mark:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 14:49:50', 10);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 14:54:18', 28);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"mark\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 14:54:22', 80);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"mark\",\"className\":\"Mark\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":14,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 14:54:22\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":15,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 14:54:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Username\",\"columnComment\":\"用户名称\",\"columnId\":16,\"columnName\":\"username\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 14:54:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"username\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Cjkh\",\"columnComment\":\"成就客户\",\"columnId\":17,\"columnName\":\"cjkh\",\"columnType\":\"float\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 14:54:22\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cjkh\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":t', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 14:55:51', 60);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"mark\"}', NULL, 0, NULL, '2023-03-02 14:55:55', 208);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2000', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-03-02 15:01:18', 9);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2001', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 15:01:25', 12);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2002', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 15:01:29', 12);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2003', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 15:01:31', 14);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2004', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 15:01:34', 10);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 15:01:36', 11);
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2000', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 15:01:40', 9);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-02 14:47:13\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"评分记录管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 15:02:03', 15);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-02 14:47:13\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"评分记录管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"mark\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 15:02:31', 10);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 15:08:58', 19);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"mark\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 15:09:05', 61);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"mark\",\"className\":\"Mark\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":27,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 15:09:05\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":28,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 15:09:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Username\",\"columnComment\":\"用户名称\",\"columnId\":29,\"columnName\":\"username\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 15:09:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"username\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Cjkh\",\"columnComment\":\"成就客户\",\"columnId\":30,\"columnName\":\"cjkh\",\"columnType\":\"float\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 15:09:05\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"cjkh\",\"javaType\":\"Double\",\"list\":true,\"params\":{},\"pk\":false,\"query\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 15:10:48', 43);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"mark\"}', NULL, 0, NULL, '2023-03-02 15:10:51', 137);
INSERT INTO `sys_oper_log` VALUES (124, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":123.0,\"createTime\":\"2023-03-02 15:16:16\",\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-03-01\",\"wssx\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\ZHKJ\\project\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\MarkMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.MarkMapper.insertMark-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mark          ( cjkh,                                                                 scoring_time,                          create_time )           values ( ?,                                                                 ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2023-03-02 15:16:16', 69);
INSERT INTO `sys_oper_log` VALUES (125, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":123.0,\"createTime\":\"2023-03-02 15:16:42\",\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-03-01\",\"wssx\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\ZHKJ\\project\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\MarkMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.MarkMapper.insertMark-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mark          ( cjkh,                                                                 scoring_time,                          create_time )           values ( ?,                                                                 ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2023-03-02 15:16:42', 3);
INSERT INTO `sys_oper_log` VALUES (126, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":123.0,\"createTime\":\"2023-03-02 15:18:14\",\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-03-01\",\"wssx\":null}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\ZHKJ\\project\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\MarkMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.MarkMapper.insertMark-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mark          ( cjkh,                                                                 scoring_time,                          create_time )           values ( ?,                                                                 ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2023-03-02 15:18:33', 25263);
INSERT INTO `sys_oper_log` VALUES (127, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"createTime\":\"2023-03-02 16:32:40\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":1,\"params\":{},\"scoringTime\":\"2023-03-01\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 16:32:50', 68416);
INSERT INTO `sys_oper_log` VALUES (128, '评分记录表', 2, 'com.ruoyi.web.controller.system.MarkController.edit()', 'PUT', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"createTime\":\"2023-03-02 16:32:41\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":1,\"params\":{},\"updateTime\":\"2023-03-02 16:34:11\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 16:34:11', 11);
INSERT INTO `sys_oper_log` VALUES (129, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":4.0,\"cjkh\":4.0,\"createTime\":\"2023-03-02 16:40:37\",\"cxfz\":4.0,\"explanation\":\"阿斯弗\",\"hzgj\":4.0,\"id\":2,\"params\":{},\"scoringTime\":\"2023-02-02\",\"userId\":1,\"username\":\"admin\",\"wssx\":4.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 16:40:37', 3256);
INSERT INTO `sys_oper_log` VALUES (130, '评分记录表', 2, 'com.ruoyi.web.controller.system.MarkController.edit()', 'PUT', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":4.0,\"cjkh\":4.3,\"createTime\":\"2023-03-02 16:40:38\",\"cxfz\":4.0,\"explanation\":\"阿斯弗\",\"hzgj\":4.0,\"id\":2,\"params\":{},\"scoringTime\":\"2023-02-02\",\"updateTime\":\"2023-03-02 16:46:27\",\"userId\":1,\"username\":\"admin\",\"wssx\":4.5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 16:46:27', 8);
INSERT INTO `sys_oper_log` VALUES (131, '评分记录表', 2, 'com.ruoyi.web.controller.system.MarkController.edit()', 'PUT', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":4.2,\"cjkh\":4.3,\"createTime\":\"2023-03-02 16:40:38\",\"cxfz\":4.0,\"explanation\":\"阿斯弗\",\"hzgj\":4.0,\"id\":2,\"params\":{},\"scoringTime\":\"2023-02-02\",\"updateTime\":\"2023-03-02 16:53:55\",\"userId\":1,\"username\":\"admin\",\"wssx\":4.5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 16:53:55', 27);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"mark_amend\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-02 16:58:18', 100);
INSERT INTO `sys_oper_log` VALUES (133, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"cao\",\"params\":{},\"postIds\":[4],\"roleIds\":[2],\"status\":\"0\",\"userId\":100,\"userName\":\"曹浩博\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 08:41:40', 106);
INSERT INTO `sys_oper_log` VALUES (134, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-03-02 14:00:21\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2006,2007,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 08:42:25', 29);
INSERT INTO `sys_oper_log` VALUES (135, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, '曹浩博', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-03-02 14:00:21\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2006,2007,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"曹浩博\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 08:43:26', 73);
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"评分记录新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"perms\":\"system:mark:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 08:52:05', 22);
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, '曹浩博', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"曹浩博\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"评分记录修改\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2007,\"perms\":\"system:mark:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 08:54:18', 7);
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, '曹浩博', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"评分记录修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2007,\"perms\":\"system:mark:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"新增菜单\'评分记录修改\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2023-03-03 08:55:35', 3);
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, '曹浩博', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"曹浩博\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"评分记录删除\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2007,\"perms\":\"system:mark:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 08:55:42', 7);
INSERT INTO `sys_oper_log` VALUES (140, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-03-02 14:00:21\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2006,2007,2008,2009,2010,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 08:56:38', 34);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"amend\",\"className\":\"MarkAmend\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":40,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 16:58:18\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":41,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 16:58:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MarkId\",\"columnComment\":\"评分表id\",\"columnId\":42,\"columnName\":\"mark_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 16:58:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"markId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Username\",\"columnComment\":\"用户名称\",\"columnId\":43,\"columnName\":\"username\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 16:58:18\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"username\",\"javaType\":\"String\",\"list\":true,\"p', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 09:02:03', 65);
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"mark_amend\"}', NULL, 0, NULL, '2023-03-03 09:02:06', 202);
INSERT INTO `sys_oper_log` VALUES (143, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":5.0,\"cjkh\":5.0,\"createTime\":\"2023-03-03 09:42:00\",\"cxfz\":5.0,\"explanation\":\"阿三发\",\"hzgj\":5.0,\"params\":{},\"scoringTime\":\"2023-02-03\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'explanation\' at row 1\r\n### The error may exist in file [D:\\ZHKJ\\project\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\MarkAmendMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.MarkAmendMapper.insertMarkAmend-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mark_amend          ( user_id,                          username,             cjkh,             wssx,             hzgj,             cxfz,             avg_score,             explanation,             scoring_time,             create_time )           values ( ?,                          ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'explanation\' at row 1\n; Data truncation: Data too long for column \'explanation\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'explanation\' at row 1', '2023-03-03 09:42:00', 4521);
INSERT INTO `sys_oper_log` VALUES (144, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":5.0,\"cjkh\":5.0,\"createTime\":\"2023-03-03 09:43:55\",\"cxfz\":5.0,\"explanation\":\"张三\",\"hzgj\":5.0,\"params\":{},\"scoringTime\":\"2023-02-03\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mark_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\ZHKJ\\project\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\MarkAmendMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.MarkAmendMapper.insertMarkAmend-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mark_amend          ( user_id,                          username,             cjkh,             wssx,             hzgj,             cxfz,             avg_score,             explanation,             scoring_time,             create_time )           values ( ?,                          ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'mark_id\' doesn\'t have a default value\n; Field \'mark_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mark_id\' doesn\'t have a default value', '2023-03-03 09:43:55', 3466);
INSERT INTO `sys_oper_log` VALUES (145, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":5.0,\"cjkh\":5.0,\"createTime\":\"2023-03-03 09:46:17\",\"cxfz\":5.0,\"explanation\":\"张三\",\"hzgj\":5.0,\"id\":3,\"params\":{},\"scoringTime\":\"2023-02-03\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 09:46:17', 3748);
INSERT INTO `sys_oper_log` VALUES (146, '评分记录表', 2, 'com.ruoyi.web.controller.system.MarkController.edit()', 'PUT', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":4.775,\"cjkh\":5.0,\"createTime\":\"2023-03-03 09:46:17\",\"cxfz\":4.1,\"explanation\":\"张三\",\"hzgj\":5.0,\"id\":3,\"params\":{},\"scoringTime\":\"2023-02-03\",\"updateTime\":\"2023-03-03 09:46:49\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 09:46:49', 17);
INSERT INTO `sys_oper_log` VALUES (147, '评分记录表', 2, 'com.ruoyi.web.controller.system.MarkController.edit()', 'PUT', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":4.275,\"cjkh\":5.0,\"createTime\":\"2023-03-03 09:46:17\",\"cxfz\":4.1,\"explanation\":\"张三1\",\"hzgj\":5.0,\"id\":3,\"params\":{},\"scoringTime\":\"2023-02-03\",\"updateTime\":\"2023-03-03 09:56:54\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', NULL, 1, 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', '2023-03-03 09:56:54', 27);
INSERT INTO `sys_oper_log` VALUES (148, '评分记录表', 2, 'com.ruoyi.web.controller.system.MarkController.edit()', 'PUT', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":4.8,\"cjkh\":5.0,\"createTime\":\"2023-03-03 09:46:17\",\"cxfz\":4.1,\"explanation\":\"张三1\",\"hzgj\":5.1,\"id\":3,\"params\":{},\"scoringTime\":\"2023-02-03\",\"updateTime\":\"2023-03-03 10:00:30\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-03 10:00:30', 27);
INSERT INTO `sys_oper_log` VALUES (149, '评分记录表', 2, 'com.ruoyi.web.controller.system.MarkController.edit()', 'PUT', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":4.275,\"cjkh\":5.0,\"createTime\":\"2023-03-03 09:46:17\",\"cxfz\":4.1,\"explanation\":\"张三\",\"hzgj\":5.0,\"id\":3,\"params\":{},\"scoringTime\":\"2023-02-03\",\"updateTime\":\"2023-03-03 10:02:19\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2023-03-03 10:02:19', 5);
INSERT INTO `sys_oper_log` VALUES (150, '评分记录表', 2, 'com.ruoyi.web.controller.system.MarkController.edit()', 'PUT', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":4.275,\"cjkh\":5.0,\"createTime\":\"2023-03-03 09:46:17\",\"cxfz\":4.1,\"explanation\":\"张三\",\"hzgj\":3.0,\"id\":3,\"params\":{},\"scoringTime\":\"2023-02-03\",\"updateTime\":\"2023-03-03 10:04:21\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', NULL, 1, '表中数据有重复', '2023-03-03 10:04:21', 27);
INSERT INTO `sys_oper_log` VALUES (151, '评分记录表', 2, 'com.ruoyi.web.controller.system.MarkController.edit()', 'PUT', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":4.275,\"cjkh\":5.0,\"createTime\":\"2023-03-03 09:46:17\",\"cxfz\":4.1,\"explanation\":\"张三3\",\"hzgj\":3.0,\"id\":3,\"params\":{},\"scoringTime\":\"2023-02-03\",\"updateTime\":\"2023-03-03 10:05:03\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:05:03', 69);
INSERT INTO `sys_oper_log` VALUES (152, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/3', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'markId\' not found. Available parameters are [array, arg0]', '2023-03-03 10:07:07', 15);
INSERT INTO `sys_oper_log` VALUES (153, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/3', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'markId\' not found. Available parameters are [array, arg0]', '2023-03-03 10:07:14', 4);
INSERT INTO `sys_oper_log` VALUES (154, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/3', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'markId\' not found. Available parameters are [array, arg0]', '2023-03-03 10:09:28', 42378);
INSERT INTO `sys_oper_log` VALUES (155, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:10:35', 19724);
INSERT INTO `sys_oper_log` VALUES (156, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:10:50', 3773);
INSERT INTO `sys_oper_log` VALUES (157, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:10:57', 3386);
INSERT INTO `sys_oper_log` VALUES (158, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.375,\"cjkh\":3.5,\"createTime\":\"2023-03-03 10:11:17\",\"cxfz\":3.0,\"explanation\":\"发\",\"hzgj\":3.5,\"id\":4,\"params\":{},\"scoringTime\":\"2023-02-03\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:11:17', 4735);
INSERT INTO `sys_oper_log` VALUES (159, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:11:57', 35634);
INSERT INTO `sys_oper_log` VALUES (160, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.95,\"cjkh\":3.3,\"createTime\":\"2023-03-03 10:13:37\",\"cxfz\":5.0,\"explanation\":\"曹\",\"hzgj\":4.3,\"id\":5,\"params\":{},\"scoringTime\":\"2023-02-03\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:13:37', 2287);
INSERT INTO `sys_oper_log` VALUES (161, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.95,\"cjkh\":3.3,\"createTime\":\"2023-03-03 10:13:37\",\"cxfz\":5.0,\"explanation\":\"曹1\",\"hzgj\":4.3,\"id\":5,\"markId\":5,\"params\":{},\"scoringTime\":\"2023-02-03\",\"updateTime\":\"2023-03-03 10:20:30\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:20:30', 14912);
INSERT INTO `sys_oper_log` VALUES (162, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.95,\"cjkh\":3.3,\"createTime\":\"2023-03-03 10:13:37\",\"cxfz\":5.0,\"explanation\":\"曹12\",\"hzgj\":4.3,\"id\":5,\"markId\":5,\"params\":{},\"scoringTime\":\"2023-02-03\",\"updateTime\":\"2023-03-03 10:20:46\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:20:46', 6);
INSERT INTO `sys_oper_log` VALUES (163, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"wssx\":null}', NULL, 0, NULL, '2023-03-03 10:24:40', 606);
INSERT INTO `sys_oper_log` VALUES (164, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"wssx\":null}', NULL, 0, NULL, '2023-03-03 10:29:39', 489);
INSERT INTO `sys_oper_log` VALUES (165, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"陈晨\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":101,\"userName\":\"陈晨\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:32:05', 109);
INSERT INTO `sys_oper_log` VALUES (166, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"焦建波\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":102,\"userName\":\"焦建波\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:32:34', 85);
INSERT INTO `sys_oper_log` VALUES (167, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"梁岩峰\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":103,\"userName\":\"梁岩峰\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:33:01', 78);
INSERT INTO `sys_oper_log` VALUES (168, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"梅凯强\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":104,\"userName\":\"梅凯强\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:33:30', 81);
INSERT INTO `sys_oper_log` VALUES (169, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"牛世康\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":105,\"userName\":\"牛世康\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:33:45', 86);
INSERT INTO `sys_oper_log` VALUES (170, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"谢佳森\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":106,\"userName\":\"谢佳森\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:34:08', 78);
INSERT INTO `sys_oper_log` VALUES (171, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"张舒苑\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":107,\"userName\":\"张舒苑\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:34:39', 77);
INSERT INTO `sys_oper_log` VALUES (172, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"张欣\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":108,\"userName\":\"张欣\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:34:52', 80);
INSERT INTO `sys_oper_log` VALUES (173, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"createBy\":\"admin\",\"createTime\":\"2023-03-02 14:00:21\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"ry@163.com\",\"loginDate\":\"2023-03-03 08:56:26\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"admin\",\"params\":{},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:35:34', 61);
INSERT INTO `sys_oper_log` VALUES (174, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"createBy\":\"admin\",\"createTime\":\"2023-03-02 14:00:21\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"ry@163.com\",\"loginDate\":\"2023-03-03 08:56:26\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"admin\",\"params\":{},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:35:35', 53);
INSERT INTO `sys_oper_log` VALUES (175, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-03-02 14:00:21\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2006,2007,2008,2009,2010],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:37:09', 23);
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:37:29', 9);
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/amend/index\",\"createTime\":\"2023-03-03 09:04:01\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"评分记录表修正\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"amend\",\"perms\":\"system:amend:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:42:06', 12);
INSERT INTO `sys_oper_log` VALUES (178, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, '曹浩博', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.8499999999999996,\"cjkh\":3.3,\"createTime\":\"2023-03-03 10:44:50\",\"cxfz\":4.3,\"explanation\":\"测试\",\"hzgj\":4.0,\"id\":6,\"params\":{},\"scoringTime\":\"2023-02-03\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":3.8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 10:44:50', 86);
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"评分记录查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"perms\":\"system:mark:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 11:15:09', 16);
INSERT INTO `sys_oper_log` VALUES (180, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-03-02 14:00:21\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2006,2007,2008,2017,2009,2010],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 11:18:13', 30);
INSERT INTO `sys_oper_log` VALUES (181, '评分记录表', 2, 'com.ruoyi.web.controller.system.MarkController.edit()', 'PUT', 1, '曹浩博', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.9000000000000004,\"cjkh\":3.5,\"createTime\":\"2023-03-03 10:44:51\",\"cxfz\":4.3,\"explanation\":\"测试1\",\"hzgj\":4.0,\"id\":6,\"params\":{},\"scoringTime\":\"2023-02-03\",\"updateTime\":\"2023-03-03 11:19:58\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":3.8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 11:19:58', 70);
INSERT INTO `sys_oper_log` VALUES (182, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, '曹浩博', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"createTime\":\"2023-03-03 11:27:45\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":7,\"params\":{},\"scoringTime\":\"2023-02-03\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 11:27:45', 383048);
INSERT INTO `sys_oper_log` VALUES (183, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.125,\"cjkh\":3.5,\"createTime\":\"2023-03-03 11:27:46\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":7,\"markId\":7,\"params\":{},\"scoringTime\":\"2023-02-03\",\"updateTime\":\"2023-03-03 11:28:18\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 11:28:18', 2993);
INSERT INTO `sys_oper_log` VALUES (184, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"createTime\":\"2023-03-03 14:08:21\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":8,\"params\":{},\"scoringTime\":\"2023-02-03\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 14:08:21', 8787);
INSERT INTO `sys_oper_log` VALUES (185, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":4.0,\"cjkh\":4.0,\"createTime\":\"2023-03-03 14:10:11\",\"cxfz\":4.0,\"explanation\":\"4\",\"hzgj\":4.0,\"id\":9,\"params\":{},\"scoringTime\":\"2023-02-03\",\"userId\":1,\"username\":\"admin\",\"wssx\":4.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 14:10:11', 90187);
INSERT INTO `sys_oper_log` VALUES (186, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":5.0,\"cjkh\":5.0,\"cxfz\":5.0,\"explanation\":\"5\",\"hzgj\":5.0,\"params\":{},\"wssx\":5.0}', NULL, 1, '已经填写过了', '2023-03-03 14:11:17', 30994);
INSERT INTO `sys_oper_log` VALUES (187, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":5.0,\"cjkh\":5.0,\"cxfz\":5.0,\"explanation\":\"5\",\"hzgj\":5.0,\"params\":{},\"wssx\":5.0}', NULL, 1, '已经填写过了', '2023-03-03 14:11:23', 4);
INSERT INTO `sys_oper_log` VALUES (188, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":5.0,\"cjkh\":5.0,\"cxfz\":5.0,\"explanation\":\"5\",\"hzgj\":5.0,\"params\":{},\"wssx\":5.0}', NULL, 1, '本月已经填写过了', '2023-03-03 14:12:13', 24);
INSERT INTO `sys_oper_log` VALUES (189, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, '陈晨', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3000000000000003,\"cjkh\":3.1,\"cxfz\":3.6,\"explanation\":\"3-3\",\"hzgj\":3.3,\"params\":{},\"wssx\":3.2}', NULL, 1, '本月已经填写过了', '2023-03-03 14:14:07', 3);
INSERT INTO `sys_oper_log` VALUES (190, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, '陈晨', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3000000000000003,\"cjkh\":3.1,\"createTime\":\"2023-03-03 14:16:42\",\"cxfz\":3.6,\"explanation\":\"3-3\",\"hzgj\":3.3,\"id\":10,\"params\":{},\"scoringTime\":\"2023-02-03\",\"userId\":101,\"username\":\"陈晨\",\"wssx\":3.2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 14:16:42', 101);
INSERT INTO `sys_oper_log` VALUES (191, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, '陈晨', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"params\":{},\"wssx\":3.0}', NULL, 1, '本月已经填写过了', '2023-03-03 14:16:52', 3);
INSERT INTO `sys_oper_log` VALUES (192, '评分记录表', 2, 'com.ruoyi.web.controller.system.MarkController.edit()', 'PUT', 1, '陈晨', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3000000000000003,\"cjkh\":3.1,\"createTime\":\"2023-03-03 14:16:43\",\"cxfz\":3.6,\"explanation\":\"3-35\",\"hzgj\":3.3,\"id\":10,\"params\":{},\"scoringTime\":\"2023-02-03\",\"updateTime\":\"2023-03-03 14:16:42\",\"userId\":101,\"username\":\"陈晨\",\"wssx\":3.2}', NULL, 1, '本月已经填写过了', '2023-03-03 14:17:23', 3);
INSERT INTO `sys_oper_log` VALUES (193, '评分记录表', 2, 'com.ruoyi.web.controller.system.MarkController.edit()', 'PUT', 1, '陈晨', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3075,\"cjkh\":3.1,\"createTime\":\"2023-03-03 14:16:43\",\"cxfz\":3.63,\"explanation\":\"3-3\",\"hzgj\":3.3,\"id\":10,\"params\":{},\"scoringTime\":\"2023-02-03\",\"updateTime\":\"2023-03-03 14:22:47\",\"userId\":101,\"username\":\"陈晨\",\"wssx\":3.2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 14:22:47', 87);
INSERT INTO `sys_oper_log` VALUES (194, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, '陈晨', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"params\":{},\"wssx\":3.0}', NULL, 1, '本月已经填写过了', '2023-03-03 14:23:02', 4);
INSERT INTO `sys_oper_log` VALUES (195, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"params\":{},\"scoringTime\":\"2023-01\",\"wssx\":3.0}', NULL, 1, '本月已经填写过了', '2023-03-03 14:51:19', 42461);
INSERT INTO `sys_oper_log` VALUES (196, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"cxfz\":3.0,\"explanation\":\"35\",\"hzgj\":3.0,\"params\":{},\"scoringTime\":\"2023-01\",\"wssx\":3.0}', NULL, 1, '本月已经填写过了', '2023-03-03 14:53:59', 109415);
INSERT INTO `sys_oper_log` VALUES (197, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, '曹浩博', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.2500000000000004,\"cjkh\":3.1,\"createTime\":\"2023-03-03 14:55:37\",\"cxfz\":3.4,\"explanation\":\"测试\",\"hzgj\":3.3,\"id\":11,\"params\":{},\"scoringTime\":\"2023-02\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":3.2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 14:55:37', 71);
INSERT INTO `sys_oper_log` VALUES (198, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, '曹浩博', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"params\":{},\"wssx\":3.0}', NULL, 1, '本月已经填写过了', '2023-03-03 14:55:43', 4);
INSERT INTO `sys_oper_log` VALUES (199, '评分记录表', 2, 'com.ruoyi.web.controller.system.MarkController.edit()', 'PUT', 1, '曹浩博', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.2750000000000004,\"cjkh\":3.1,\"createTime\":\"2023-03-03 14:55:37\",\"cxfz\":3.5,\"explanation\":\"测试\",\"hzgj\":3.3,\"id\":11,\"params\":{},\"scoringTime\":\"2023-02\",\"updateTime\":\"2023-03-03 14:56:05\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":3.2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 14:56:05', 14);
INSERT INTO `sys_oper_log` VALUES (200, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.4749999999999996,\"cjkh\":3.9,\"createTime\":\"2023-03-03 14:55:37\",\"cxfz\":3.5,\"explanation\":\"测试\",\"hzgj\":3.3,\"id\":11,\"markId\":11,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-03 14:56:29\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":3.2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-03 14:56:29', 12);
INSERT INTO `sys_oper_log` VALUES (201, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, '曹浩博', NULL, '/system/mark', '4.2.2.2', 'XX XX', '{\"avgScore\":3.275,\"cjkh\":3.8,\"cxfz\":3.1,\"explanation\":\"3.1\",\"hzgj\":3.1,\"params\":{},\"wssx\":3.1}', NULL, 1, '本月已经填写过了', '2023-03-06 08:52:09', 13);
INSERT INTO `sys_oper_log` VALUES (202, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '192.168.3.76', '内网IP', '{\"avgScore\":3.4,\"cjkh\":3.8,\"createTime\":\"2023-03-06 08:53:41\",\"cxfz\":3.6,\"explanation\":\"测试\",\"hzgj\":3.1,\"id\":12,\"params\":{},\"scoringTime\":\"2023-02\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 08:53:41', 86);
INSERT INTO `sys_oper_log` VALUES (203, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":3.3}', NULL, 1, '本月已经填写过了', '2023-03-06 09:18:38', 4);
INSERT INTO `sys_oper_log` VALUES (204, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":3.3}', NULL, 1, '本月已经填写过了', '2023-03-06 09:20:30', 19774);
INSERT INTO `sys_oper_log` VALUES (205, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":3.3}', NULL, 1, '本月已经填写过了', '2023-03-06 09:20:38', 3826);
INSERT INTO `sys_oper_log` VALUES (206, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '192.168.3.76', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":3.3}', NULL, 1, '本月已经填写过了', '2023-03-06 10:07:11', 21816);
INSERT INTO `sys_oper_log` VALUES (207, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '192.168.3.76', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":3.0}', NULL, 1, '本月已经填写过了', '2023-03-06 10:11:00', 34096);
INSERT INTO `sys_oper_log` VALUES (208, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '192.168.3.76', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"createTime\":\"2023-03-06 10:14:04\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":13,\"params\":{},\"scoringTime\":\"2023-01\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:14:04', 168235);
INSERT INTO `sys_oper_log` VALUES (209, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"createTime\":\"2023-03-06 10:20:46\",\"cxfz\":3.3,\"explanation\":\"3.3111\",\"hzgj\":3.3,\"id\":14,\"params\":{},\"scoringTime\":\"2023-02\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:20:46', 51167);
INSERT INTO `sys_oper_log` VALUES (210, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":3.3}', NULL, 1, '本月已经填写过了', '2023-03-06 10:24:15', 57829);
INSERT INTO `sys_oper_log` VALUES (211, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"createTime\":\"2023-03-06 10:30:14\",\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"id\":15,\"params\":{},\"scoringTime\":\"2023-01\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:30:14', 324959);
INSERT INTO `sys_oper_log` VALUES (212, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":3.3}', NULL, 1, '本月已经填写过了', '2023-03-06 10:31:41', 3626);
INSERT INTO `sys_oper_log` VALUES (213, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"createTime\":\"2023-03-06 10:31:49\",\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"id\":16,\"params\":{},\"scoringTime\":\"2023-01\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:31:49', 3666);
INSERT INTO `sys_oper_log` VALUES (214, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"createTime\":\"2023-03-06 10:32:09\",\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"id\":17,\"params\":{},\"scoringTime\":\"2023-01\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:32:09', 15);
INSERT INTO `sys_oper_log` VALUES (215, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/17', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:32:13', 16);
INSERT INTO `sys_oper_log` VALUES (216, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/16', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:32:14', 8);
INSERT INTO `sys_oper_log` VALUES (217, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/15', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:32:18', 11);
INSERT INTO `sys_oper_log` VALUES (218, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/14', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:32:20', 11);
INSERT INTO `sys_oper_log` VALUES (219, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/13', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:32:23', 9);
INSERT INTO `sys_oper_log` VALUES (220, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":3.3}', NULL, 1, '本月已经填写过了', '2023-03-06 10:32:28', 3);
INSERT INTO `sys_oper_log` VALUES (221, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":3.3}', NULL, 1, '本月已经填写过了', '2023-03-06 10:32:32', 3);
INSERT INTO `sys_oper_log` VALUES (222, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"createTime\":\"2023-03-06 10:32:36\",\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"id\":18,\"params\":{},\"scoringTime\":\"2023-03\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:32:36', 15);
INSERT INTO `sys_oper_log` VALUES (223, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"createTime\":\"2023-03-06 10:32:55\",\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"id\":19,\"params\":{},\"scoringTime\":\"2023-01\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:32:55', 16);
INSERT INTO `sys_oper_log` VALUES (224, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"createTime\":\"2023-03-06 10:33:05\",\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"id\":20,\"params\":{},\"scoringTime\":\"2023-01\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:33:05', 14);
INSERT INTO `sys_oper_log` VALUES (225, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"createTime\":\"2023-03-06 10:36:20\",\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"id\":21,\"params\":{},\"scoringTime\":\"2023-01\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:36:20', 184735);
INSERT INTO `sys_oper_log` VALUES (226, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"createTime\":\"2023-03-06 10:37:36\",\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"id\":22,\"params\":{},\"scoringTime\":\"2023-01\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:37:36', 59230);
INSERT INTO `sys_oper_log` VALUES (227, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"createTime\":\"2023-03-06 10:38:16\",\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"id\":23,\"params\":{},\"scoringTime\":\"2023-01\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:38:17', 1529);
INSERT INTO `sys_oper_log` VALUES (228, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/23', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:38:27', 15);
INSERT INTO `sys_oper_log` VALUES (229, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/22', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:38:30', 8);
INSERT INTO `sys_oper_log` VALUES (230, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/21', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:38:31', 8);
INSERT INTO `sys_oper_log` VALUES (231, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/20', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:38:33', 9);
INSERT INTO `sys_oper_log` VALUES (232, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":3.3}', NULL, 1, '本月已经填写过了', '2023-03-06 10:38:42', 4);
INSERT INTO `sys_oper_log` VALUES (233, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"createTime\":\"2023-03-06 10:38:46\",\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"id\":24,\"params\":{},\"scoringTime\":\"2023-03\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:38:46', 13);
INSERT INTO `sys_oper_log` VALUES (234, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"createTime\":\"2023-03-06 10:38:56\",\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"id\":25,\"params\":{},\"scoringTime\":\"2023-03\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:38:56', 14);
INSERT INTO `sys_oper_log` VALUES (235, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"createTime\":\"2023-03-06 10:42:42\",\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"id\":26,\"params\":{},\"scoringTime\":\"2023-03\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:42:42', 197905);
INSERT INTO `sys_oper_log` VALUES (236, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"createTime\":\"2023-03-06 10:46:38\",\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"id\":27,\"params\":{},\"scoringTime\":\"2023-03\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:46:38', 146755);
INSERT INTO `sys_oper_log` VALUES (237, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"createTime\":\"2023-03-06 10:47:38\",\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"id\":28,\"params\":{},\"scoringTime\":\"2023-03\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:47:39', 23887);
INSERT INTO `sys_oper_log` VALUES (238, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"params\":{},\"scoringTime\":\"2023-03\",\"wssx\":3.3}', NULL, 1, '本月已经填写过了', '2023-03-06 10:47:57', 2703);
INSERT INTO `sys_oper_log` VALUES (239, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.3,\"cjkh\":3.3,\"cxfz\":3.3,\"explanation\":\"3.3\",\"hzgj\":3.3,\"params\":{},\"scoringTime\":\"2023-03\",\"wssx\":3.3}', NULL, 1, '本月已经填写过了', '2023-03-06 10:48:30', 28151);
INSERT INTO `sys_oper_log` VALUES (240, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/28', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:48:39', 25);
INSERT INTO `sys_oper_log` VALUES (241, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/27', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:48:41', 9);
INSERT INTO `sys_oper_log` VALUES (242, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/26', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:48:44', 7);
INSERT INTO `sys_oper_log` VALUES (243, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/25', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:48:46', 9);
INSERT INTO `sys_oper_log` VALUES (244, '评分记录表', 3, 'com.ruoyi.web.controller.system.MarkController.remove()', 'DELETE', 1, 'admin', NULL, '/system/mark/24', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 10:48:50', 10);
INSERT INTO `sys_oper_log` VALUES (245, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"params\":{},\"scoringTime\":\"2023-01\",\"wssx\":3.0}', NULL, 1, '本月已经填写过了', '2023-03-06 10:48:59', 3416);
INSERT INTO `sys_oper_log` VALUES (246, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.4499999999999997,\"cjkh\":3.3,\"createTime\":\"2023-03-06 10:32:55\",\"cxfz\":3.9,\"explanation\":\"3.3\",\"hzgj\":3.3,\"id\":19,\"markId\":19,\"params\":{},\"scoringTime\":\"2023-01-01\",\"updateTime\":\"2023-03-06 11:17:30\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 11:17:30', 29);
INSERT INTO `sys_oper_log` VALUES (247, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.425,\"cjkh\":3.3,\"createTime\":\"2023-03-06 10:32:55\",\"cxfz\":3.8,\"explanation\":\"3.3\",\"hzgj\":3.3,\"id\":19,\"markId\":19,\"params\":{},\"scoringTime\":\"2023-01-01\",\"updateTime\":\"2023-03-06 11:17:45\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 11:17:45', 6);
INSERT INTO `sys_oper_log` VALUES (248, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.415,\"cjkh\":3.86,\"createTime\":\"2023-03-06 08:53:42\",\"cxfz\":3.6,\"explanation\":\"测试\",\"hzgj\":3.1,\"id\":12,\"markId\":12,\"params\":{},\"scoringTime\":\"2023-02-06\",\"updateTime\":\"2023-03-06 14:03:08\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 14:03:09', 22);
INSERT INTO `sys_oper_log` VALUES (249, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.6149999999999998,\"cjkh\":3.86,\"createTime\":\"2023-03-06 08:53:42\",\"cxfz\":3.6,\"explanation\":\"测试\",\"hzgj\":3.1,\"id\":12,\"markId\":12,\"params\":{},\"scoringTime\":\"2023-02-06\",\"updateTime\":\"2023-03-06 14:03:15\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 14:03:15', 7);
INSERT INTO `sys_oper_log` VALUES (250, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"createTime\":\"2023-03-06 14:40:03\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":29,\"params\":{},\"scoringTime\":\"2023-02\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 14:40:03', 83);
INSERT INTO `sys_oper_log` VALUES (251, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":3.0}', NULL, 1, '本月已经填写过了', '2023-03-06 14:58:23', 8042);
INSERT INTO `sys_oper_log` VALUES (252, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"createTime\":\"2023-03-06 14:58:36\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":30,\"params\":{},\"scoringTime\":\"2023-01\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 15:00:11', 102686);
INSERT INTO `sys_oper_log` VALUES (253, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"createTime\":\"2023-03-06 15:01:16\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":32,\"params\":{},\"scoringTime\":\"2023-04\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 15:01:17', 5188);
INSERT INTO `sys_oper_log` VALUES (254, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"createTime\":\"2023-03-06 15:10:34\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":33,\"params\":{},\"scoringTime\":\"2023-02\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 15:10:34', 3491);
INSERT INTO `sys_oper_log` VALUES (255, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":3.6,\"cjkh\":3.9,\"createTime\":\"2023-03-06 15:11:10\",\"cxfz\":3.9,\"explanation\":\"3.9\",\"hzgj\":3.6,\"id\":34,\"params\":{},\"scoringTime\":\"2023-01\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 15:11:10', 11);
INSERT INTO `sys_oper_log` VALUES (256, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/mark/index\",\"createTime\":\"2023-03-02 14:49:50\",\"icon\":\"druid\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"评分记录表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"mark\",\"perms\":\"system:mark:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:00:00', 13);
INSERT INTO `sys_oper_log` VALUES (257, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/amend/index\",\"createTime\":\"2023-03-03 09:04:01\",\"icon\":\"build\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"评分记录表修正\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"amend\",\"perms\":\"system:amend:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:00:05', 8);
INSERT INTO `sys_oper_log` VALUES (258, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-02 14:47:13\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"评分记录管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"mark\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:00:12', 6);
INSERT INTO `sys_oper_log` VALUES (259, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-02 14:00:21\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:00:20', 6);
INSERT INTO `sys_oper_log` VALUES (260, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:02:13', 42);
INSERT INTO `sys_oper_log` VALUES (261, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-02 14:00:21\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:02:58', 8);
INSERT INTO `sys_oper_log` VALUES (262, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-03-02 14:47:13\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"评分记录管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"mark\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:03:02', 7);
INSERT INTO `sys_oper_log` VALUES (263, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"wssx\":null}', NULL, 0, NULL, '2023-03-06 16:03:29', 585);
INSERT INTO `sys_oper_log` VALUES (264, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.75,\"cjkh\":3.9,\"createTime\":\"2023-03-06 15:11:10\",\"cxfz\":3.9,\"explanation\":\"3.9\",\"hzgj\":3.6,\"id\":101,\"markId\":34,\"params\":{},\"scoringTime\":\"2023-01-01\",\"updateTime\":\"2023-03-06 16:04:01\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:04:01', 4);
INSERT INTO `sys_oper_log` VALUES (265, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"wssx\":null}', NULL, 0, NULL, '2023-03-06 16:04:21', 30);
INSERT INTO `sys_oper_log` VALUES (266, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.775,\"cjkh\":4.0,\"createTime\":\"2023-03-06 15:11:10\",\"cxfz\":3.9,\"explanation\":\"3.9\",\"hzgj\":3.6,\"id\":101,\"markId\":34,\"params\":{},\"scoringTime\":\"2023-01-01\",\"updateTime\":\"2023-03-06 16:11:38\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:11:38', 6);
INSERT INTO `sys_oper_log` VALUES (267, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.8,\"cjkh\":4.1,\"createTime\":\"2023-03-06 15:11:10\",\"cxfz\":3.9,\"explanation\":\"3.9\",\"hzgj\":3.6,\"id\":101,\"markId\":34,\"params\":{},\"scoringTime\":\"2023-01-01\",\"updateTime\":\"2023-03-06 16:11:57\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:11:57', 5);
INSERT INTO `sys_oper_log` VALUES (268, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/amend/index\",\"createTime\":\"2023-03-03 09:04:01\",\"icon\":\"build\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"评分记录表修正\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"amend\",\"perms\":\"system:amend:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:13:30', 7);
INSERT INTO `sys_oper_log` VALUES (269, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '4.2.2.2', 'XX XX', '{\"avgScore\":3.825,\"cjkh\":4.2,\"createTime\":\"2023-03-06 15:11:10\",\"cxfz\":3.9,\"explanation\":\"3.9\",\"hzgj\":3.6,\"id\":101,\"markId\":34,\"params\":{},\"scoringTime\":\"2023-01-01\",\"updateTime\":\"2023-03-06 16:14:28\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:14:28', 5);
INSERT INTO `sys_oper_log` VALUES (270, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '4.2.2.2', 'XX XX', '{\"avgScore\":3.85,\"cjkh\":4.3,\"createTime\":\"2023-03-06 15:11:10\",\"cxfz\":3.9,\"explanation\":\"3.9\",\"hzgj\":3.6,\"id\":101,\"markId\":34,\"params\":{},\"scoringTime\":\"2023-01-01\",\"updateTime\":\"2023-03-06 16:15:13\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:15:13', 4);
INSERT INTO `sys_oper_log` VALUES (271, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '4.2.2.2', 'XX XX', '{\"avgScore\":3.9,\"cjkh\":4.5,\"createTime\":\"2023-03-06 15:11:10\",\"cxfz\":3.9,\"explanation\":\"3.9\",\"hzgj\":3.6,\"id\":101,\"markId\":34,\"params\":{},\"scoringTime\":\"2023-01-01\",\"updateTime\":\"2023-03-06 16:15:23\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:15:23', 4);
INSERT INTO `sys_oper_log` VALUES (272, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '4.2.2.2', 'XX XX', '{\"children\":[],\"component\":\"system/amend/index\",\"createTime\":\"2023-03-03 09:04:01\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"评分记录表修正\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"amend\",\"perms\":\"system:amend:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:15:51', 7);
INSERT INTO `sys_oper_log` VALUES (273, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '4.2.2.2', 'XX XX', '{\"children\":[],\"component\":\"system/mark/index\",\"createTime\":\"2023-03-02 14:49:50\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"评分记录表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"mark\",\"perms\":\"system:mark:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:15:55', 7);
INSERT INTO `sys_oper_log` VALUES (274, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '4.2.2.2', 'XX XX', '{\"avgScore\":3.925,\"cjkh\":4.6,\"createTime\":\"2023-03-06 15:11:10\",\"cxfz\":3.9,\"explanation\":\"3.9\",\"hzgj\":3.6,\"id\":101,\"markId\":34,\"params\":{},\"scoringTime\":\"2023-01-01\",\"updateTime\":\"2023-03-06 16:16:07\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:16:07', 6);
INSERT INTO `sys_oper_log` VALUES (275, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '4.2.2.2', 'XX XX', '{\"avgScore\":3.125,\"cjkh\":3.5,\"createTime\":\"2023-03-06 15:10:34\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":100,\"markId\":33,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-06 16:17:33\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:17:33', 6);
INSERT INTO `sys_oper_log` VALUES (276, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '4.2.2.2', 'XX XX', '{\"children\":[],\"component\":\"system/mark/index\",\"createTime\":\"2023-03-02 14:49:50\",\"icon\":\"druid\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"评分记录表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"mark\",\"perms\":\"system:mark:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:17:51', 5);
INSERT INTO `sys_oper_log` VALUES (277, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '4.2.2.2', 'XX XX', '{\"children\":[],\"component\":\"system/amend/index\",\"createTime\":\"2023-03-03 09:04:01\",\"icon\":\"build\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"评分记录表修正\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"amend\",\"perms\":\"system:amend:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:17:55', 7);
INSERT INTO `sys_oper_log` VALUES (278, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '4.2.2.2', 'XX XX', '{\"avgScore\":3.375,\"cjkh\":3.5,\"createTime\":\"2023-03-06 15:10:34\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":100,\"markId\":33,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-06 16:18:37\",\"userId\":1,\"username\":\"admin\",\"wssx\":4.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:18:37', 4);
INSERT INTO `sys_oper_log` VALUES (279, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '4.2.2.2', 'XX XX', '{\"avgScore\":3.625,\"cjkh\":3.5,\"createTime\":\"2023-03-06 15:10:34\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":100,\"markId\":33,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-06 16:19:03\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:19:03', 5);
INSERT INTO `sys_oper_log` VALUES (280, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '4.2.2.2', 'XX XX', '{\"avgScore\":3.75,\"cjkh\":3.5,\"createTime\":\"2023-03-06 15:10:34\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":100,\"markId\":33,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-06 16:20:26\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:20:26', 4);
INSERT INTO `sys_oper_log` VALUES (281, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '4.2.2.2', 'XX XX', '{\"avgScore\":3.625,\"cjkh\":3.5,\"createTime\":\"2023-03-06 15:10:34\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":100,\"markId\":33,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-06 16:22:32\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:22:32', 8);
INSERT INTO `sys_oper_log` VALUES (282, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '4.2.2.2', 'XX XX', '{\"avgScore\":4.0,\"cjkh\":5.0,\"createTime\":\"2023-03-06 15:10:34\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":100,\"markId\":33,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-06 16:23:49\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:23:50', 4);
INSERT INTO `sys_oper_log` VALUES (283, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '4.2.2.2', 'XX XX', '{\"avgScore\":3.25,\"cjkh\":2.0,\"createTime\":\"2023-03-06 15:10:34\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":100,\"markId\":33,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-06 16:24:23\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:24:23', 4);
INSERT INTO `sys_oper_log` VALUES (284, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '4.2.2.2', 'XX XX', '{\"avgScore\":2.75,\"cjkh\":0.0,\"createTime\":\"2023-03-06 15:10:34\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":100,\"markId\":33,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-06 16:26:57\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:26:57', 6);
INSERT INTO `sys_oper_log` VALUES (285, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '4.2.2.2', 'XX XX', '{\"avgScore\":3.0,\"cjkh\":1.0,\"createTime\":\"2023-03-06 15:10:34\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":100,\"markId\":33,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-06 16:29:27\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:29:27', 5);
INSERT INTO `sys_oper_log` VALUES (286, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, '曹浩博', NULL, '/system/mark', '4.2.2.2', 'XX XX', '{\"avgScore\":4.0,\"cjkh\":4.0,\"createTime\":\"2023-03-06 16:42:16\",\"cxfz\":4.0,\"explanation\":\"4\",\"hzgj\":4.0,\"id\":35,\"params\":{},\"scoringTime\":\"2023-02\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":4.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:42:17', 13);
INSERT INTO `sys_oper_log` VALUES (287, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, '曹浩博', NULL, '/system/mark', '4.2.2.2', 'XX XX', '{\"avgScore\":5.0,\"cjkh\":5.0,\"createTime\":\"2023-03-06 16:42:25\",\"cxfz\":5.0,\"explanation\":\"5\",\"hzgj\":5.0,\"id\":36,\"params\":{},\"scoringTime\":\"2023-03\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":5.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:42:25', 10);
INSERT INTO `sys_oper_log` VALUES (288, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, '曹浩博', NULL, '/system/mark', '4.2.2.2', 'XX XX', '{\"avgScore\":5.0,\"cjkh\":5.0,\"createTime\":\"2023-03-06 16:42:32\",\"cxfz\":5.0,\"explanation\":\"5\",\"hzgj\":5.0,\"id\":37,\"params\":{},\"scoringTime\":\"2023-01\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":5.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:42:32', 11);
INSERT INTO `sys_oper_log` VALUES (289, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":4.125,\"cjkh\":4.5,\"createTime\":\"2023-03-06 16:42:17\",\"cxfz\":4.0,\"explanation\":\"4\",\"hzgj\":4.0,\"id\":102,\"markId\":35,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-06 16:43:41\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":4.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:43:41', 6);
INSERT INTO `sys_oper_log` VALUES (290, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"wssx\":null}', NULL, 0, NULL, '2023-03-06 16:44:02', 37);
INSERT INTO `sys_oper_log` VALUES (291, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.5,\"cjkh\":3.0,\"createTime\":\"2023-03-06 16:56:54\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":100,\"isUpdated\":1,\"markId\":33,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-06 16:58:49\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 16:58:49', 26);
INSERT INTO `sys_oper_log` VALUES (292, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":4.0,\"cjkh\":5.0,\"createTime\":\"2023-03-06 16:56:54\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":100,\"isUpdated\":1,\"markId\":33,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-06 17:00:13\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 17:00:19', 5848);
INSERT INTO `sys_oper_log` VALUES (293, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":4.5,\"cjkh\":3.0,\"createTime\":\"2023-03-06 16:56:57\",\"cxfz\":5.0,\"explanation\":\"5\",\"hzgj\":5.0,\"id\":104,\"isUpdated\":1,\"markId\":37,\"params\":{},\"scoringTime\":\"2023-01-01\",\"updateTime\":\"2023-03-06 17:00:47\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":5.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 17:00:53', 5844);
INSERT INTO `sys_oper_log` VALUES (294, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":1.0,\"createTime\":\"2023-03-06 16:56:54\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":100,\"isUpdated\":1,\"markId\":33,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-06 17:02:43\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 17:02:46', 2761);
INSERT INTO `sys_oper_log` VALUES (295, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '4.2.2.2', 'XX XX', '{\"avgScore\":3.75,\"cjkh\":4.0,\"createTime\":\"2023-03-06 16:56:54\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":100,\"isUpdated\":1,\"markId\":33,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-06 17:06:37\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 17:06:43', 5640);
INSERT INTO `sys_oper_log` VALUES (296, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '4.2.2.2', 'XX XX', '{\"avgScore\":3.0,\"cjkh\":3.0,\"createTime\":\"2023-03-06 17:11:16\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":38,\"params\":{},\"scoringTime\":\"2023-02\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 17:11:16', 95);
INSERT INTO `sys_oper_log` VALUES (297, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '4.2.2.2', 'XX XX', '{\"avgScore\":5.0,\"cjkh\":5.0,\"createTime\":\"2023-03-06 17:11:24\",\"cxfz\":5.0,\"explanation\":\"5\",\"hzgj\":5.0,\"id\":39,\"params\":{},\"scoringTime\":\"2023-03\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 17:11:24', 16);
INSERT INTO `sys_oper_log` VALUES (298, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '4.2.2.2', 'XX XX', '{\"avgScore\":3.125,\"cjkh\":3.5,\"createTime\":\"2023-03-06 17:11:16\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":105,\"isDeleted\":0,\"isUpdated\":1,\"markId\":38,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-06 17:11:43\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 17:11:43', 11);
INSERT INTO `sys_oper_log` VALUES (299, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, '曹浩博', NULL, '/system/mark', '4.2.2.2', 'XX XX', '{\"avgScore\":3.325,\"cjkh\":2.0,\"createTime\":\"2023-03-06 17:15:45\",\"cxfz\":3.3,\"explanation\":\"测试\",\"hzgj\":4.5,\"id\":40,\"params\":{},\"scoringTime\":\"2023-02\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":3.5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 17:15:45', 16);
INSERT INTO `sys_oper_log` VALUES (300, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":4.5,\"cjkh\":3.0,\"createTime\":\"2023-03-06 17:11:24\",\"cxfz\":5.0,\"explanation\":\"5\",\"hzgj\":5.0,\"id\":106,\"isDeleted\":0,\"isUpdated\":1,\"markId\":39,\"params\":{},\"scoringTime\":\"2023-03-01\",\"updateTime\":\"2023-03-06 17:24:08\",\"userId\":1,\"username\":\"admin\",\"wssx\":5.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-06 17:24:09', 48);
INSERT INTO `sys_oper_log` VALUES (301, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.325,\"cjkh\":2.0,\"createTime\":\"2023-03-06 17:15:45\",\"cxfz\":3.3,\"explanation\":\"测试\",\"hzgj\":4.5,\"id\":107,\"isDeleted\":0,\"isUpdated\":1,\"markId\":40,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-07 08:36:26\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":3.5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 08:36:26', 134);
INSERT INTO `sys_oper_log` VALUES (302, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.825,\"cjkh\":4.0,\"createTime\":\"2023-03-07 08:36:59\",\"cxfz\":3.3,\"explanation\":\"测试\",\"hzgj\":4.5,\"id\":107,\"isDeleted\":0,\"isUpdated\":1,\"markId\":40,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-07 08:48:04\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":3.5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 08:48:04', 5);
INSERT INTO `sys_oper_log` VALUES (303, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":4.075,\"cjkh\":5.0,\"createTime\":\"2023-03-07 08:36:59\",\"cxfz\":3.3,\"explanation\":\"测试\",\"hzgj\":4.5,\"id\":107,\"isDeleted\":0,\"isUpdated\":1,\"markId\":40,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-07 08:50:49\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":3.5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 08:50:49', 4);
INSERT INTO `sys_oper_log` VALUES (304, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.575,\"cjkh\":3.0,\"createTime\":\"2023-03-07 08:51:03\",\"cxfz\":3.3,\"explanation\":\"测试\",\"hzgj\":4.5,\"id\":107,\"isDeleted\":0,\"isUpdated\":1,\"markId\":40,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-07 08:54:21\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":3.5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 08:54:21', 6);
INSERT INTO `sys_oper_log` VALUES (305, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.1375,\"cjkh\":3.55,\"createTime\":\"2023-03-06 17:11:16\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":105,\"isDeleted\":0,\"isUpdated\":1,\"markId\":38,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-07 12:30:51\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 12:30:51', 6);
INSERT INTO `sys_oper_log` VALUES (306, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.325,\"cjkh\":2.0,\"createTime\":\"2023-03-07 08:51:03\",\"cxfz\":3.3,\"explanation\":\"测试\",\"hzgj\":4.5,\"id\":107,\"isDeleted\":0,\"isUpdated\":1,\"markId\":40,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-07 12:36:01\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":3.5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 12:36:01', 6);
INSERT INTO `sys_oper_log` VALUES (307, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":2.5,\"cjkh\":1.0,\"createTime\":\"2023-03-06 17:11:16\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":105,\"isDeleted\":0,\"isUpdated\":1,\"markId\":38,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-07 12:42:59\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 12:42:59', 6);
INSERT INTO `sys_oper_log` VALUES (308, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":2.75,\"cjkh\":2.0,\"createTime\":\"2023-03-06 17:11:16\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":105,\"isDeleted\":0,\"isUpdated\":1,\"markId\":38,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-07 12:49:56\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 12:49:56', 4);
INSERT INTO `sys_oper_log` VALUES (309, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"createTime\":\"2023-03-06 17:11:16\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":105,\"isDeleted\":0,\"isUpdated\":1,\"markId\":38,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-07 12:51:12\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 12:51:12', 4);
INSERT INTO `sys_oper_log` VALUES (310, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":2.5,\"cjkh\":1.0,\"createTime\":\"2023-03-06 17:11:16\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":105,\"isDeleted\":0,\"isUpdated\":1,\"markId\":38,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-07 12:52:28\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 12:52:28', 5);
INSERT INTO `sys_oper_log` VALUES (311, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.5,\"cjkh\":5.0,\"createTime\":\"2023-03-06 17:11:16\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":105,\"isDeleted\":0,\"isUpdated\":1,\"markId\":38,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-07 12:52:37\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 12:52:37', 5);
INSERT INTO `sys_oper_log` VALUES (312, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"createTime\":\"2023-03-06 17:11:16\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":105,\"isDeleted\":0,\"isUpdated\":1,\"markId\":38,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-07 12:53:12\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 12:53:12', 7);
INSERT INTO `sys_oper_log` VALUES (313, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.5,\"cjkh\":5.0,\"createTime\":\"2023-03-06 17:11:16\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":105,\"isDeleted\":0,\"isUpdated\":1,\"markId\":38,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-07 14:43:52\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 14:43:52', 5);
INSERT INTO `sys_oper_log` VALUES (314, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":2.75,\"cjkh\":2.0,\"createTime\":\"2023-03-06 17:11:16\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":105,\"isDeleted\":0,\"isUpdated\":1,\"markId\":38,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-07 14:49:47\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 14:49:47', 5);
INSERT INTO `sys_oper_log` VALUES (315, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.0,\"cjkh\":3.0,\"createTime\":\"2023-03-06 17:11:16\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":105,\"isDeleted\":0,\"isUpdated\":1,\"markId\":38,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-07 14:50:27\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 14:50:27', 5);
INSERT INTO `sys_oper_log` VALUES (316, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.075,\"cjkh\":1.0,\"createTime\":\"2023-03-07 08:51:03\",\"cxfz\":3.3,\"explanation\":\"测试\",\"hzgj\":4.5,\"id\":107,\"isDeleted\":0,\"isUpdated\":1,\"markId\":40,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-07 14:50:31\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":3.5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 14:50:31', 14);
INSERT INTO `sys_oper_log` VALUES (317, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":2.7,\"cjkh\":1.0,\"createTime\":\"2023-03-07 08:51:03\",\"cxfz\":3.3,\"explanation\":\"测试\",\"hzgj\":4.5,\"id\":107,\"isDeleted\":0,\"isUpdated\":1,\"markId\":40,\"params\":{},\"scoringTime\":\"2023-02-01\",\"updateTime\":\"2023-03-07 14:51:48\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":2.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 14:51:48', 6);
INSERT INTO `sys_oper_log` VALUES (318, '评分记录表修正', 1, 'com.ruoyi.web.controller.system.MarkAmendController.add()', 'POST', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":3.0,\"createTime\":\"2023-03-07 14:53:43\",\"cxfz\":1.0,\"explanation\":\"1\",\"hzgj\":1.0,\"params\":{},\"scoringTime\":\"2023-02\",\"username\":\"2\",\"wssx\":1.0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\ZHKJ\\project\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\MarkAmendMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.MarkAmendMapper.insertMarkAmend-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mark_amend          ( username,             cjkh,             wssx,             hzgj,             cxfz,                          explanation,             scoring_time,             create_time )           values ( ?,             ?,             ?,             ?,             ?,                          ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2023-03-07 14:53:43', 74);
INSERT INTO `sys_oper_log` VALUES (319, '评分记录表修正', 1, 'com.ruoyi.web.controller.system.MarkAmendController.add()', 'POST', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":3.0,\"createTime\":\"2023-03-07 14:56:30\",\"cxfz\":3.0,\"hzgj\":33.0,\"params\":{},\"scoringTime\":\"2023-02\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mark_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\ZHKJ\\project\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\MarkAmendMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.MarkAmendMapper.insertMarkAmend-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into mark_amend          ( user_id,                          username,             cjkh,             wssx,             hzgj,             cxfz,                                       scoring_time,             create_time )           values ( ?,                          ?,             ?,             ?,             ?,             ?,                                       ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'mark_id\' doesn\'t have a default value\n; Field \'mark_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mark_id\' doesn\'t have a default value', '2023-03-07 14:56:44', 26171);
INSERT INTO `sys_oper_log` VALUES (320, '评分记录表修正', 1, 'com.ruoyi.web.controller.system.MarkAmendController.add()', 'POST', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":3.0,\"createTime\":\"2023-03-07 14:59:56\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":33.0,\"params\":{},\"scoringTime\":\"2023-02\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', NULL, 1, '暂未开放', '2023-03-07 14:59:56', 77);
INSERT INTO `sys_oper_log` VALUES (321, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.2,\"cjkh\":3.0,\"createTime\":\"2023-03-07 08:51:03\",\"cxfz\":3.3,\"explanation\":\"测试\",\"hzgj\":4.5,\"id\":107,\"isDeleted\":0,\"isUpdated\":1,\"markId\":40,\"params\":{},\"scoringTime\":\"2023-02\",\"updateTime\":\"2023-03-07 15:11:55\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":2.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 15:11:58', 2504);
INSERT INTO `sys_oper_log` VALUES (322, '账户解锁', 0, 'com.ruoyi.web.controller.monitor.SysLogininforController.unlock()', 'GET', 1, 'admin', NULL, '/monitor/logininfor/unlock/admin', '4.2.2.2', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 16:01:05', 2);
INSERT INTO `sys_oper_log` VALUES (323, '账户解锁', 0, 'com.ruoyi.web.controller.monitor.SysLogininforController.unlock()', 'GET', 1, 'admin', NULL, '/monitor/logininfor/unlock/admin', '4.2.2.2', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 16:01:07', 0);
INSERT INTO `sys_oper_log` VALUES (324, '账户解锁', 0, 'com.ruoyi.web.controller.monitor.SysLogininforController.unlock()', 'GET', 1, 'admin', NULL, '/monitor/logininfor/unlock/admin', '4.2.2.2', 'XX XX', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 16:01:14', 0);
INSERT INTO `sys_oper_log` VALUES (325, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '4.2.2.2', 'XX XX', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-03-03 08:41:40\",\"delFlag\":\"0\",\"deptId\":103,\"email\":\"\",\"loginDate\":\"2023-03-06 17:12:24\",\"loginIp\":\"4.2.2.2\",\"nickName\":\"cao\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[4],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"曹浩博\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-07 16:25:21', 33);
INSERT INTO `sys_oper_log` VALUES (326, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.45,\"cjkh\":3.0,\"createTime\":\"2023-03-07 08:51:03\",\"cxfz\":3.3,\"explanation\":\"测试\",\"hzgj\":4.5,\"id\":107,\"isDeleted\":0,\"isUpdated\":1,\"markId\":40,\"params\":{},\"scoringTime\":\"2023-02\",\"updateTime\":\"2023-03-08 08:34:34\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-08 08:34:34', 144);
INSERT INTO `sys_oper_log` VALUES (327, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.2,\"cjkh\":3.0,\"createTime\":\"2023-03-07 08:51:03\",\"cxfz\":3.3,\"explanation\":\"测试\",\"hzgj\":4.5,\"id\":107,\"isDeleted\":0,\"isUpdated\":1,\"markId\":40,\"params\":{},\"scoringTime\":\"2023-02\",\"updateTime\":\"2023-03-08 08:34:42\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":2.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-08 08:34:42', 6);
INSERT INTO `sys_oper_log` VALUES (328, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":4.5,\"cjkh\":5.0,\"cxfz\":4.0,\"explanation\":\"测试\",\"hzgj\":5.0,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":4.0}', NULL, 1, '本月已经填写过了', '2023-03-08 09:28:20', 7);
INSERT INTO `sys_oper_log` VALUES (329, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":4.5,\"cjkh\":5.0,\"createTime\":\"2023-03-08 09:28:23\",\"cxfz\":4.0,\"explanation\":\"测试\",\"hzgj\":5.0,\"id\":41,\"params\":{},\"scoringTime\":\"2023-01\",\"userId\":1,\"username\":\"admin\",\"wssx\":4.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-08 09:28:23', 74);
INSERT INTO `sys_oper_log` VALUES (330, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, '曹浩博', NULL, '/system/mark', '192.168.1.48', '内网IP', '{\"avgScore\":4.125,\"cjkh\":3.5,\"createTime\":\"2023-03-08 13:36:52\",\"cxfz\":5.0,\"hzgj\":4.0,\"id\":42,\"params\":{},\"scoringTime\":\"2023-03\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":4.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-08 13:36:52', 83);
INSERT INTO `sys_oper_log` VALUES (331, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '192.168.1.48', '内网IP', '{\"avgScore\":3.45,\"cjkh\":4.0,\"createTime\":\"2023-03-07 08:51:03\",\"cxfz\":3.3,\"explanation\":\"测试\",\"hzgj\":4.5,\"id\":107,\"isDeleted\":0,\"isUpdated\":1,\"markId\":40,\"params\":{},\"scoringTime\":\"2023-02\",\"updateTime\":\"2023-03-08 13:37:46\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":2.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-08 13:37:46', 9);
INSERT INTO `sys_oper_log` VALUES (332, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '192.168.1.48', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"wssx\":null}', NULL, 0, NULL, '2023-03-08 13:38:17', 465);
INSERT INTO `sys_oper_log` VALUES (333, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":0.25,\"cjkh\":0.0,\"cxfz\":0.0,\"hzgj\":0.0,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":1.0}', NULL, 1, '本月已经填写过了', '2023-03-08 14:19:05', 4);
INSERT INTO `sys_oper_log` VALUES (334, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":0.0,\"cjkh\":0.0,\"cxfz\":0.0,\"hzgj\":0.0,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":0.0}', NULL, 1, '本月已经填写过了', '2023-03-08 14:19:23', 3);
INSERT INTO `sys_oper_log` VALUES (335, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":0.0,\"cjkh\":0.0,\"cxfz\":0.0,\"explanation\":\"3\",\"hzgj\":0.0,\"params\":{},\"scoringTime\":\"2023-01\",\"wssx\":0.0}', NULL, 1, '本月已经填写过了', '2023-03-08 14:19:30', 3);
INSERT INTO `sys_oper_log` VALUES (336, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":0.0,\"cjkh\":0.0,\"createTime\":\"2023-03-08 14:19:33\",\"cxfz\":0.0,\"explanation\":\"3\",\"hzgj\":0.0,\"id\":43,\"params\":{},\"scoringTime\":\"2023-04\",\"userId\":1,\"username\":\"admin\",\"wssx\":0.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-08 14:19:33', 13);
INSERT INTO `sys_oper_log` VALUES (337, '评分记录表', 2, 'com.ruoyi.web.controller.system.MarkController.edit()', 'PUT', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":0.0,\"cjkh\":0.0,\"createTime\":\"2023-03-08 14:19:34\",\"cxfz\":0.0,\"explanation\":\"4\",\"hzgj\":0.0,\"id\":43,\"params\":{},\"scoringTime\":\"2023-04\",\"updateTime\":\"2023-03-08 14:19:47\",\"userId\":1,\"username\":\"admin\",\"wssx\":0.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-08 14:19:47', 12);
INSERT INTO `sys_oper_log` VALUES (338, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.25,\"cjkh\":4.0,\"createTime\":\"2023-03-06 17:11:16\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":105,\"isDeleted\":0,\"isUpdated\":1,\"markId\":38,\"params\":{},\"scoringTime\":\"2023-02\",\"updateTime\":\"2023-03-08 14:23:01\",\"userId\":1,\"username\":\"admin\",\"wssx\":3.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-08 14:23:01', 7);
INSERT INTO `sys_oper_log` VALUES (339, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.5,\"cjkh\":4.0,\"createTime\":\"2023-03-06 17:11:16\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":105,\"isDeleted\":0,\"isUpdated\":1,\"markId\":38,\"params\":{},\"scoringTime\":\"2023-02\",\"updateTime\":\"2023-03-08 14:24:57\",\"userId\":1,\"username\":\"admin\",\"wssx\":4.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-08 14:24:57', 8);
INSERT INTO `sys_oper_log` VALUES (340, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"wssx\":null}', NULL, 0, NULL, '2023-03-08 14:27:37', 30);
INSERT INTO `sys_oper_log` VALUES (341, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-03\",\"wssx\":null}', NULL, 0, NULL, '2023-03-08 14:28:39', 30);
INSERT INTO `sys_oper_log` VALUES (342, '评分记录表', 5, 'com.ruoyi.web.controller.system.MarkController.export()', 'POST', 1, 'admin', NULL, '/system/mark/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"wssx\":null}', NULL, 0, NULL, '2023-03-08 14:31:08', 456);
INSERT INTO `sys_oper_log` VALUES (343, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-01\",\"wssx\":null}', NULL, 0, NULL, '2023-03-08 14:33:44', 31782);
INSERT INTO `sys_oper_log` VALUES (344, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-01\",\"wssx\":null}', NULL, 0, NULL, '2023-03-08 14:33:49', 30);
INSERT INTO `sys_oper_log` VALUES (345, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"wssx\":null}', NULL, 0, NULL, '2023-03-08 14:42:29', 522);
INSERT INTO `sys_oper_log` VALUES (346, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":null}', NULL, 0, NULL, '2023-03-08 14:43:07', 34);
INSERT INTO `sys_oper_log` VALUES (347, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-01\",\"wssx\":null}', NULL, 0, NULL, '2023-03-08 14:48:12', 29);
INSERT INTO `sys_oper_log` VALUES (348, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"wssx\":null}', NULL, 0, NULL, '2023-03-08 14:55:20', 26);
INSERT INTO `sys_oper_log` VALUES (349, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":null}', NULL, 0, NULL, '2023-03-08 14:58:45', 24282);
INSERT INTO `sys_oper_log` VALUES (350, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":null}', NULL, 0, NULL, '2023-03-08 14:58:51', 1522);
INSERT INTO `sys_oper_log` VALUES (351, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":null}', NULL, 0, NULL, '2023-03-08 15:02:03', 32153);
INSERT INTO `sys_oper_log` VALUES (352, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.5,\"cjkh\":4.0,\"createTime\":\"2023-03-06 17:11:16\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":105,\"isDeleted\":0,\"isUpdated\":1,\"markId\":38,\"params\":{},\"scoringTime\":\"2023-02\",\"updateTime\":\"2023-03-08 15:09:33\",\"userId\":1,\"username\":\"admin\",\"wssx\":4.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-08 15:09:42', 9074);
INSERT INTO `sys_oper_log` VALUES (353, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.5,\"cjkh\":4.0,\"createTime\":\"2023-03-06 17:11:16\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":105,\"isDeleted\":0,\"isUpdated\":1,\"markId\":38,\"params\":{},\"scoringTime\":\"2023-02\",\"updateTime\":\"2023-03-08 15:09:41\",\"userId\":1,\"username\":\"admin\",\"wssx\":4.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-08 15:09:42', 1090);
INSERT INTO `sys_oper_log` VALUES (354, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.45,\"cjkh\":4.0,\"createTime\":\"2023-03-07 08:51:03\",\"cxfz\":3.3,\"explanation\":\"测试\",\"hzgj\":4.5,\"id\":107,\"isDeleted\":0,\"isUpdated\":1,\"markId\":40,\"params\":{},\"scoringTime\":\"2023-02\",\"updateTime\":\"2023-03-08 15:09:47\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":2.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-08 15:09:57', 10166);
INSERT INTO `sys_oper_log` VALUES (355, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.45,\"cjkh\":4.0,\"createTime\":\"2023-03-07 08:51:03\",\"cxfz\":3.3,\"explanation\":\"测试\",\"hzgj\":4.5,\"id\":107,\"isDeleted\":0,\"isUpdated\":1,\"markId\":40,\"params\":{},\"scoringTime\":\"2023-02\",\"updateTime\":\"2023-03-08 15:10:01\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":2.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-08 15:10:01', 6);
INSERT INTO `sys_oper_log` VALUES (356, '评分记录表修正', 2, 'com.ruoyi.web.controller.system.MarkAmendController.edit()', 'PUT', 1, 'admin', NULL, '/system/amend', '127.0.0.1', '内网IP', '{\"avgScore\":3.5,\"cjkh\":4.0,\"createTime\":\"2023-03-06 17:11:16\",\"cxfz\":3.0,\"explanation\":\"3\",\"hzgj\":3.0,\"id\":105,\"isDeleted\":0,\"isUpdated\":1,\"markId\":38,\"params\":{},\"scoringTime\":\"2023-02\",\"updateTime\":\"2023-03-08 15:10:05\",\"userId\":1,\"username\":\"admin\",\"wssx\":4.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-08 15:10:05', 6);
INSERT INTO `sys_oper_log` VALUES (357, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":null}', NULL, 0, NULL, '2023-03-08 17:14:00', 548);
INSERT INTO `sys_oper_log` VALUES (358, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-01\",\"wssx\":null}', NULL, 0, NULL, '2023-03-08 17:15:28', 454);
INSERT INTO `sys_oper_log` VALUES (359, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-01\",\"wssx\":null}', NULL, 0, NULL, '2023-03-08 17:19:26', 46);
INSERT INTO `sys_oper_log` VALUES (360, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"wssx\":null}', NULL, 0, NULL, '2023-03-08 17:40:04', 369521);
INSERT INTO `sys_oper_log` VALUES (361, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, '曹浩博', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":1.625,\"cjkh\":4.0,\"cxfz\":1.0,\"explanation\":\"3\",\"hzgj\":0.5,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":1.0}', NULL, 1, '本月已经填写过了', '2023-03-09 08:45:55', 35);
INSERT INTO `sys_oper_log` VALUES (362, '评分记录表', 1, 'com.ruoyi.web.controller.system.MarkController.add()', 'POST', 1, '曹浩博', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":1.625,\"cjkh\":4.0,\"createTime\":\"2023-03-09 08:45:58\",\"cxfz\":1.0,\"explanation\":\"3\",\"hzgj\":0.5,\"id\":44,\"params\":{},\"scoringTime\":\"2023-01\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":1.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-09 08:45:58', 88);
INSERT INTO `sys_oper_log` VALUES (363, '评分记录表', 2, 'com.ruoyi.web.controller.system.MarkController.edit()', 'PUT', 1, '曹浩博', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":1.875,\"cjkh\":4.0,\"createTime\":\"2023-03-09 08:45:59\",\"cxfz\":1.0,\"explanation\":\"3\",\"hzgj\":0.5,\"id\":44,\"params\":{},\"scoringTime\":\"2023-01\",\"updateTime\":\"2023-03-09 08:46:07\",\"userId\":100,\"username\":\"曹浩博\",\"wssx\":2.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-09 08:46:07', 15);
INSERT INTO `sys_oper_log` VALUES (364, '评分记录表', 2, 'com.ruoyi.web.controller.system.MarkController.edit()', 'PUT', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":0.0,\"cjkh\":0.0,\"createTime\":\"2023-03-08 14:19:34\",\"cxfz\":0.0,\"explanation\":\"https://www.yuque.com/g/sinianyanbudaoyongyuan/yt1gnr/gg3kekxkoxpourag/collaborator/join?token=8u8AdS3V3ZyXXx2j&goto=%2Fsinianyanbudaoyongyuan%2Fyt1gnr%2Fgg3kekxkoxpourag%2Fedit# 邀请你共同编辑文档《无标题文档》发射点发射点\",\"hzgj\":0.0,\"id\":43,\"params\":{},\"scoringTime\":\"2023-04\",\"updateTime\":\"2023-03-09 08:51:06\",\"userId\":1,\"username\":\"admin\",\"wssx\":0.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-09 08:51:06', 14);
INSERT INTO `sys_oper_log` VALUES (365, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0, NULL, '2023-03-09 09:06:14', 524);
INSERT INTO `sys_oper_log` VALUES (366, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0, NULL, '2023-03-09 09:08:56', 125541);
INSERT INTO `sys_oper_log` VALUES (367, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0, NULL, '2023-03-09 09:10:04', 56289);
INSERT INTO `sys_oper_log` VALUES (368, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0, NULL, '2023-03-09 09:21:24', 646120);
INSERT INTO `sys_oper_log` VALUES (369, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 14:00:22\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-09 09:47:33', 16);
INSERT INTO `sys_oper_log` VALUES (370, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 14:00:22\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\",\"updateTime\":\"2023-03-09 09:47:33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-09 09:48:22', 11);
INSERT INTO `sys_oper_log` VALUES (371, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"N\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-03-02 14:00:22\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\",\"updateTime\":\"2023-03-02 14:12:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-09 10:56:44', 2467799);
INSERT INTO `sys_oper_log` VALUES (372, '评分记录表', 2, 'com.ruoyi.web.controller.system.MarkController.edit()', 'PUT', 1, 'admin', NULL, '/system/mark', '127.0.0.1', '内网IP', '{\"avgScore\":0.5,\"cjkh\":0.0,\"createTime\":\"2023-03-08 14:19:34\",\"cxfz\":0.0,\"explanation\":\"https://www.yuque.com/g/sinianyanbudaoyongyuan/yt1gnr/gg3kekxkoxpourag/collaborator/join?token=8u8AdS3V3ZyXXx2j&goto=%2Fsinianyanbudaoyongyuan%2Fyt1gnr%2Fgg3kekxkoxpourag%2Fedit# 邀请你共同编辑文档《无标题文档》发射点发射点\",\"hzgj\":2.0,\"id\":43,\"params\":{},\"scoringTime\":\"2023-04\",\"updateTime\":\"2023-03-10 17:41:13\",\"userId\":1,\"username\":\"admin\",\"wssx\":0.0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-03-10 17:41:14', 276);
INSERT INTO `sys_oper_log` VALUES (373, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"wssx\":null}', NULL, 0, NULL, '2023-03-10 17:43:17', 936);
INSERT INTO `sys_oper_log` VALUES (374, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-01\",\"wssx\":null}', NULL, 0, NULL, '2023-03-12 11:54:26', 572);
INSERT INTO `sys_oper_log` VALUES (375, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-01\",\"wssx\":null}', NULL, 0, NULL, '2023-03-12 11:54:52', 30);
INSERT INTO `sys_oper_log` VALUES (376, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"wssx\":null}', NULL, 0, NULL, '2023-03-12 11:54:57', 28);
INSERT INTO `sys_oper_log` VALUES (377, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-01\",\"wssx\":null}', NULL, 0, NULL, '2023-03-12 11:55:07', 25);
INSERT INTO `sys_oper_log` VALUES (378, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-01\",\"wssx\":null}', NULL, 0, NULL, '2023-03-12 11:56:13', 24);
INSERT INTO `sys_oper_log` VALUES (379, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"wssx\":null}', NULL, 0, NULL, '2023-03-12 11:56:58', 21);
INSERT INTO `sys_oper_log` VALUES (380, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-01\",\"wssx\":null}', NULL, 0, NULL, '2023-03-12 11:57:03', 23);
INSERT INTO `sys_oper_log` VALUES (381, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"wssx\":null}', NULL, 0, NULL, '2023-03-12 11:58:53', 25);
INSERT INTO `sys_oper_log` VALUES (382, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-01\",\"wssx\":null}', NULL, 0, NULL, '2023-03-12 11:58:58', 19);
INSERT INTO `sys_oper_log` VALUES (383, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"scoringTime\":\"2023-02\",\"wssx\":null}', NULL, 0, NULL, '2023-03-12 11:59:19', 20);
INSERT INTO `sys_oper_log` VALUES (384, '评分记录表修正', 5, 'com.ruoyi.web.controller.system.MarkAmendController.export()', 'POST', 1, 'admin', NULL, '/system/amend/export', '127.0.0.1', '内网IP', '{\"avgScore\":null,\"cjkh\":null,\"cxfz\":null,\"hzgj\":null,\"params\":{},\"wssx\":null}', NULL, 0, NULL, '2023-03-12 11:59:42', 22);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-03-02 14:00:21', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-03-02 14:00:21', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-03-02 14:00:21', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-03-02 14:00:21', 'admin', '2023-03-03 11:18:13', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2017);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'admin', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-03-12 11:23:07', 'admin', '2023-03-02 14:00:21', '', '2023-03-12 11:23:06', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2023-03-02 14:00:21', 'admin', '2023-03-02 14:00:21', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, 103, '曹浩博', 'cao', '00', '', '', '0', '', '$2a$10$.ZxVa9oWyVuElqSgEYR1BOxmvQbJ9.yu5axL1XzAIu2m283kvJDW.', '0', '0', '127.0.0.1', '2023-03-10 11:27:04', 'admin', '2023-03-03 08:41:40', 'admin', '2023-03-10 11:27:04', NULL);
INSERT INTO `sys_user` VALUES (101, NULL, '陈晨', '陈晨', '00', '', '', '0', '', '$2a$10$KBJg9QVamLG0fyIuFhv9M.C1gwF9iTx8xip9UWvZg6CLkB1IPQk4C', '0', '0', '4.2.2.2', '2023-03-07 08:37:35', 'admin', '2023-03-03 10:32:05', '', '2023-03-07 08:37:35', NULL);
INSERT INTO `sys_user` VALUES (102, NULL, '焦建波', '焦建波', '00', '', '', '0', '', '$2a$10$eGMYXCzdol6evUt37L41MuGiisD3cM36hbV9ZsDVzB1arrlELAIw6', '0', '0', '', NULL, 'admin', '2023-03-03 10:32:34', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (103, NULL, '梁岩峰', '梁岩峰', '00', '', '', '0', '', '$2a$10$sV0YFXwmrcLFrd8Awfr2cufZQVhQA/5CD/qcM39tLUoTut.CVO5vu', '0', '0', '', NULL, 'admin', '2023-03-03 10:33:01', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (104, NULL, '梅凯强', '梅凯强', '00', '', '', '0', '', '$2a$10$1Jzd8G8t5kuiXsKWrcC69uy4WDjgeLfE4.CP66Nd/4iUu9XD1eXXW', '0', '0', '', NULL, 'admin', '2023-03-03 10:33:30', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (105, NULL, '牛世康', '牛世康', '00', '', '', '0', '', '$2a$10$4ZizruGFlizNkNUR436oHO7uxN9MJ/9adjVapYGNzpIeco.ThJ6VW', '0', '0', '', NULL, 'admin', '2023-03-03 10:33:44', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (106, NULL, '谢佳森', '谢佳森', '00', '', '', '0', '', '$2a$10$G7n0NncqebaWbdQLthwAju.0003TcsHHDRQIZ07RIrhYMsBYeOqra', '0', '0', '', NULL, 'admin', '2023-03-03 10:34:08', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (107, NULL, '张舒苑', '张舒苑', '00', '', '', '0', '', '$2a$10$MMDOhlOkXN5xHowMG6jkpuWNFM6OTVMeMcoGPxRlYNsNTx3QjXTg2', '0', '0', '', NULL, 'admin', '2023-03-03 10:34:39', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (108, NULL, '张欣', '张欣', '00', '', '', '0', '', '$2a$10$Qw1xzbNFU1RrtVd/iK54yuE3C2q8tt1Yuy4SZpEv/cp1Xod5EZxwO', '0', '0', '', NULL, 'admin', '2023-03-03 10:34:52', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (100, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 2);
INSERT INTO `sys_user_role` VALUES (101, 2);
INSERT INTO `sys_user_role` VALUES (102, 2);
INSERT INTO `sys_user_role` VALUES (103, 2);
INSERT INTO `sys_user_role` VALUES (104, 2);
INSERT INTO `sys_user_role` VALUES (105, 2);
INSERT INTO `sys_user_role` VALUES (106, 2);
INSERT INTO `sys_user_role` VALUES (107, 2);
INSERT INTO `sys_user_role` VALUES (108, 2);

SET FOREIGN_KEY_CHECKS = 1;

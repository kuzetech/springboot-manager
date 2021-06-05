/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : company_project

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 05/06/2021 11:56:10
*/

create database company_project character set 'utf8' collate 'utf8_general_ci';

use company_project;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bank_account
-- ----------------------------
DROP TABLE IF EXISTS `bank_account`;
CREATE TABLE `bank_account` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `name` varchar(255) NOT NULL COMMENT '开户人',
  `account` varchar(64) NOT NULL COMMENT '银行账户',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `bank_name` varchar(255) NOT NULL COMMENT '银行名称',
  `sub_name` varchar(255) NOT NULL COMMENT '支行名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户角色';

-- ----------------------------
-- Records of bank_account
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bargain
-- ----------------------------
DROP TABLE IF EXISTS `bargain`;
CREATE TABLE `bargain` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `money` decimal(18,2) NOT NULL COMMENT '操作金额',
  `type` tinyint(8) NOT NULL COMMENT '充值或提现',
  `status` tinyint(8) NOT NULL COMMENT '状态',
  `comment` varchar(255) DEFAULT NULL COMMENT '备注',
  `channel` tinyint(8) DEFAULT NULL COMMENT '支付宝或银行',
  `account` varchar(255) DEFAULT NULL COMMENT '转账账户',
  `name` varchar(255) DEFAULT NULL COMMENT '转账人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户角色';

-- ----------------------------
-- Records of bargain
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mission
-- ----------------------------
DROP TABLE IF EXISTS `mission`;
CREATE TABLE `mission` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `type` tinyint(8) NOT NULL COMMENT '任务类型',
  `status` tinyint(8) NOT NULL COMMENT '状态',
  `customer_condition` varchar(255) DEFAULT NULL COMMENT '商家备注',
  `comment` varchar(255) DEFAULT NULL COMMENT '平台回复',
  `product_url` varchar(255) NOT NULL COMMENT '商品链接',
  `amount` int(64) NOT NULL COMMENT '购买数量',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户角色';

-- ----------------------------
-- Records of mission
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `name` varchar(255) NOT NULL COMMENT '店铺名',
  `type` tinyint(10) NOT NULL COMMENT '店铺类型',
  `seven_day_exchange` tinyint(4) NOT NULL COMMENT '是否支持七天无理由退换货',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户角色';

-- ----------------------------
-- Records of store
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_content
-- ----------------------------
DROP TABLE IF EXISTS `sys_content`;
CREATE TABLE `sys_content` (
  `id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '主键',
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
  `type` int(11) DEFAULT NULL COMMENT '文章类型',
  `content` longtext COLLATE utf8_bin COMMENT '内容',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='文章管理';

-- ----------------------------
-- Records of sys_content
-- ----------------------------
BEGIN;
INSERT INTO `sys_content` VALUES ('1391299982690586626', '张东妹我爱你111111', 0, '<p>爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你爱你</p>', '2021-05-09 15:52:20');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `dept_no` varchar(18) DEFAULT NULL COMMENT '部门编号(规则：父级关系编码+自己的编码)',
  `name` varchar(300) DEFAULT NULL COMMENT '部门名称',
  `pid` varchar(64) NOT NULL COMMENT '父级id',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(1:正常；0:弃用)',
  `relation_code` varchar(3000) DEFAULT NULL COMMENT '为了维护更深层级关系',
  `dept_manager_id` varchar(64) DEFAULT NULL COMMENT '部门经理user_id',
  `manager_name` varchar(255) DEFAULT NULL COMMENT '部门经理名称',
  `phone` varchar(20) DEFAULT NULL COMMENT '部门经理联系电话',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(4) DEFAULT NULL COMMENT '是否删除(1未删除；0已删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统部门';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES ('4bd0b0a3-097d-4902-a1f7-641ea3b771bd', 'D000002', '部门1', '72a4f388-50f8-4019-8c67-530cd7c74e7a', 1, 'D000001D000002', NULL, '张杨', '13899999999', '2019-11-05 12:24:50', '2019-11-09 21:22:55', 1);
INSERT INTO `sys_dept` VALUES ('72a4f388-50f8-4019-8c67-530cd7c74e7a', 'D000001', '总公司', '0', 1, 'D000001', NULL, '小李', '13888888888', '2019-11-07 22:43:33', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES ('1255790029680242690', 'sex', '性别', '2020-04-30 17:24:09');
INSERT INTO `sys_dict` VALUES ('1393499975438524418', 'store_type', '店铺类型', '2021-05-15 17:34:19');
INSERT INTO `sys_dict` VALUES ('1393597227800600578', 'bargain_channel', '充值方式', '2021-05-16 00:00:46');
INSERT INTO `sys_dict` VALUES ('1393597618583904257', 'bargain_status', '交易状态', '2021-05-16 00:02:19');
INSERT INTO `sys_dict` VALUES ('1393598981472657409', 'bargain_type', '交易类型', '2021-05-16 00:07:44');
INSERT INTO `sys_dict` VALUES ('1393807598423584769', 'mission_type', '刷单类型', '2021-05-16 13:56:42');
INSERT INTO `sys_dict` VALUES ('1393817388239437826', 'mission_status', '任务状态', '2021-05-16 14:35:36');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_detail`;
CREATE TABLE `sys_dict_detail` (
  `id` varchar(50) NOT NULL,
  `label` varchar(255) NOT NULL COMMENT '字典标签',
  `value` varchar(255) NOT NULL COMMENT '字典值',
  `sort` smallint(6) DEFAULT NULL COMMENT '排序',
  `dict_id` varchar(50) DEFAULT NULL COMMENT '字典id',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='数据字典详情';

-- ----------------------------
-- Records of sys_dict_detail
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_detail` VALUES ('1255790073535885314', '男', '1', 1, '1255790029680242690', '2020-04-30 17:24:19');
INSERT INTO `sys_dict_detail` VALUES ('1255790100115189761', '女', '2', 2, '1255790029680242690', '2020-04-30 17:24:25');
INSERT INTO `sys_dict_detail` VALUES ('1393500159165816833', '拼多多', '1', 1, '1393499975438524418', '2021-05-15 17:35:03');
INSERT INTO `sys_dict_detail` VALUES ('1393500198051209217', '京东', '2', 2, '1393499975438524418', '2021-05-15 17:35:12');
INSERT INTO `sys_dict_detail` VALUES ('1393500223896510466', '淘宝', '3', 3, '1393499975438524418', '2021-05-15 17:35:18');
INSERT INTO `sys_dict_detail` VALUES ('1393597314064850945', '支付宝', '1', 1, '1393597227800600578', '2021-05-16 00:01:06');
INSERT INTO `sys_dict_detail` VALUES ('1393597346386157570', '银行转账', '2', 2, '1393597227800600578', '2021-05-16 00:01:14');
INSERT INTO `sys_dict_detail` VALUES ('1393597671927062530', '取消', '0', 0, '1393597618583904257', '2021-05-16 00:02:31');
INSERT INTO `sys_dict_detail` VALUES ('1393597717363957761', '待审核', '1', 1, '1393597618583904257', '2021-05-16 00:02:42');
INSERT INTO `sys_dict_detail` VALUES ('1393597804903276546', '审核通过', '2', 2, '1393597618583904257', '2021-05-16 00:03:03');
INSERT INTO `sys_dict_detail` VALUES ('1393597842291302402', '审核失败', '3', 3, '1393597618583904257', '2021-05-16 00:03:12');
INSERT INTO `sys_dict_detail` VALUES ('1393597881189277698', '完成', '4', 4, '1393597618583904257', '2021-05-16 00:03:21');
INSERT INTO `sys_dict_detail` VALUES ('1393599056261292033', '充值', '1', 1, '1393598981472657409', '2021-05-16 00:08:01');
INSERT INTO `sys_dict_detail` VALUES ('1393599097608740866', '提现', '2', 2, '1393598981472657409', '2021-05-16 00:08:11');
INSERT INTO `sys_dict_detail` VALUES ('1393807649229189121', '普通刷单(每单5元)', '1', 1, '1393807598423584769', '2021-05-16 13:56:54');
INSERT INTO `sys_dict_detail` VALUES ('1393807687082782721', '精细刷单(每单10元)', '2', 2, '1393807598423584769', '2021-05-16 13:57:03');
INSERT INTO `sys_dict_detail` VALUES ('1393817695044386818', '待审核', '1', 1, '1393817388239437826', '2021-05-16 14:36:49');
INSERT INTO `sys_dict_detail` VALUES ('1393817729722892289', '审核通过', '2', 2, '1393817388239437826', '2021-05-16 14:36:57');
INSERT INTO `sys_dict_detail` VALUES ('1393817783779082242', '审核失败', '3', 3, '1393817388239437826', '2021-05-16 14:37:10');
INSERT INTO `sys_dict_detail` VALUES ('1393817828087709697', '完成', '4', 4, '1393817388239437826', '2021-05-16 14:37:21');
INSERT INTO `sys_dict_detail` VALUES ('1393817864993390593', '取消', '0', 0, '1393817388239437826', '2021-05-16 14:37:30');
COMMIT;

-- ----------------------------
-- Table structure for sys_files
-- ----------------------------
DROP TABLE IF EXISTS `sys_files`;
CREATE TABLE `sys_files` (
  `id` varchar(50) NOT NULL,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='文件上传';

-- ----------------------------
-- Records of sys_files
-- ----------------------------
BEGIN;
INSERT INTO `sys_files` VALUES ('1391299229821407233', 'http://localhost:8080/files/20210509/426b5540b3cc4bc49edc644c86a2c4e0.jpeg', '2021-05-09 15:49:20', 'WechatIMG23.jpeg', '/tmp/springboot/files/20210509/426b5540b3cc4bc49edc644c86a2c4e0.jpeg');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `id` varchar(50) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='定时任务';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES ('1252884495040782337', 'testTask', '1', '0 */1 * * * ?', 0, '1', '2020-04-22 16:58:35');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `id` varchar(50) NOT NULL COMMENT '任务日志id',
  `job_id` varchar(50) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `job_id` (`job_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='定时任务日志';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `name` varchar(300) DEFAULT NULL COMMENT '菜单权限名称',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：sys:user:add,sys:user:edit)',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `url` varchar(100) DEFAULT NULL COMMENT '访问地址URL',
  `target` varchar(50) DEFAULT NULL COMMENT 'a target属性:_self _blank',
  `pid` varchar(64) DEFAULT NULL COMMENT '父级菜单权限名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `type` tinyint(4) DEFAULT NULL COMMENT '菜单权限类型(1:目录;2:菜单;3:按钮)',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态1:正常 0：禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(4) DEFAULT NULL COMMENT '是否删除(1未删除；0已删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统权限';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
BEGIN;
INSERT INTO `sys_permission` VALUES ('010bcf8b-3172-4331-9941-25788ca8cbb0', '删除', 'sysGenerator:delete', NULL, 'sysGenerator/delete', NULL, '43d1bbf7-fc4a-4a10-9ad1-205b16c7c05f', 1, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('0d99b687-3f46-4632-9d56-8dd5e476dae7', 'SQL 监控', '', '', '/druid/sql.html', '_self', '65bdb02f47b94e71c2a2b9e459bde909', 98, 2, 1, '2020-03-19 13:29:40', '2020-05-07 13:36:59', 1);
INSERT INTO `sys_permission` VALUES ('1a2ec857-e775-4377-9fb7-e3c77738b3e5', '新增', 'sys:role:add', NULL, '/sys/role', NULL, 'e0b16b95-09de-4d60-a283-1eebd424ed47', 0, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('1dec779d-a9ec-448a-9389-a2b4eefce119', '添加', 'sysGenerator:add', NULL, 'sysGenerator/add', NULL, '43d1bbf7-fc4a-4a10-9ad1-205b16c7c05f', 1, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('2073345f-7344-43fe-9084-b7add56da652', '删除', 'sys:dept:deleted', NULL, '/sys/dept/*', NULL, 'c038dc93-f30d-4802-a090-be352eab341a', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('26764d88-1d90-402d-b355-a75deef116f2', '接口管理', '', '', '/doc.html', '_blank', '65bdb02f47b94e71c2a2b9e459bde909', 100, 2, 1, '2020-03-19 13:29:40', '2020-05-07 13:36:02', 1);
INSERT INTO `sys_permission` VALUES ('34875fcab58811eb854c0242ac110002', '充值和转账', NULL, NULL, '/index/bargain', '_self', '65bdb02f47b94e71c2a2b9e459bde909', 10, 2, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('348773e6b58811eb854c0242ac110002', '列表', 'bargain:list', NULL, 'bargain/listByPage', NULL, '34875fcab58811eb854c0242ac110002', NULL, 3, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('34877ce5b58811eb854c0242ac110002', '新增', 'bargain:add', NULL, 'bargain/add', NULL, '34875fcab58811eb854c0242ac110002', NULL, 3, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('34878844b58811eb854c0242ac110002', '修改', 'bargain:update', NULL, 'bargain/update', NULL, '34875fcab58811eb854c0242ac110002', NULL, 3, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('348794b1b58811eb854c0242ac110002', '删除', 'bargain:delete', NULL, 'bargain/delete', NULL, '34875fcab58811eb854c0242ac110002', NULL, 3, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('355f387f-a22b-4f8c-9cd6-ae10e930cd70', '列表', 'sys:log:list', NULL, '/sys/logs', NULL, '37101ed5-e840-4082-ae33-682ca6e41ad8', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('37101ed5-e840-4082-ae33-682ca6e41ad8', '日志管理', NULL, NULL, '/index/logs', '_self', 'e549c4b8-72ca-4ba3-91a8-9ffa1daf77cf', 97, 2, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('3a93a7e3-956a-408e-b2e4-108e9ece8f04', '新增', 'sys:dept:add', NULL, '/sys/dept', NULL, 'c038dc93-f30d-4802-a090-be352eab341a', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('3aa89f18b58811eb854c0242ac110002', '任务管理', NULL, NULL, '/index/mission', '_self', '65bdb02f47b94e71c2a2b9e459bde909', 10, 2, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('3aa8bc83b58811eb854c0242ac110002', '列表', 'mission:list', NULL, 'mission/listByPage', NULL, '3aa89f18b58811eb854c0242ac110002', NULL, 3, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('3aa8c6e9b58811eb854c0242ac110002', '新增', 'mission:add', NULL, 'mission/add', NULL, '3aa89f18b58811eb854c0242ac110002', NULL, 3, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('3aa8d225b58811eb854c0242ac110002', '修改', 'mission:update', NULL, 'mission/update', NULL, '3aa89f18b58811eb854c0242ac110002', NULL, 3, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('3aa8db8db58811eb854c0242ac110002', '删除', 'mission:delete', NULL, 'mission/delete', NULL, '3aa89f18b58811eb854c0242ac110002', NULL, 3, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('3c390dfd-0d9a-46de-9a5b-1ed884febcb2', '赋予角色', 'sys:user:role:update', NULL, '/sys/user/roles/*', NULL, '78f8e29a-cccd-49e5-ada7-5af40dd95312', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('3dac936c-c4e1-4560-ac93-905502f61ae0', '菜单权限管理', NULL, NULL, '/index/menus', '_self', 'd6214dcb-8b6d-494b-88fa-f519fc08ff8f', 98, 2, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('3ed79f23-90bf-4669-bc02-42ae392e75c1', '列表', 'sys:dept:list', NULL, '/sys/depts', NULL, 'c038dc93-f30d-4802-a090-be352eab341a', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('4018e179-e599-41d0-bac5-c5408e1d4bc6', '删除', 'sys:role:deleted', NULL, '/sys/role/*', NULL, 'e0b16b95-09de-4d60-a283-1eebd424ed47', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('438641da495235106c2d311703ac4290', '定时任务立即执行', 'sysJob:run', NULL, '/sysJob/run', '_self', 'fc9ca351846111eaab15b4a9fc2c4442', 5, 3, 1, '2020-04-22 15:47:54', NULL, 1);
INSERT INTO `sys_permission` VALUES ('43d1bbf7-fc4a-4a10-9ad1-205b16c7c05f', '代码生成', NULL, NULL, '/index/sysGenerator', '_self', 'e549c4b8-72ca-4ba3-91a8-9ffa1daf77cf', 1, 2, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('46dbb867-51d6-4523-852f-b12e75b34e3d', '列表', 'sysGenerator:list', NULL, 'sysGenerator/listByPage', NULL, '43d1bbf7-fc4a-4a10-9ad1-205b16c7c05f', 1, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('475b4c24-40fa-4823-863a-ba6d793b7610', '详情', 'sys:permission:detail', NULL, '/sys/permission/*', NULL, '3dac936c-c4e1-4560-ac93-905502f61ae0', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('526be97ba24c5a1b3418cdf7ca176b7e', '定时任务恢复', 'sysJob:resume', NULL, '/sysJob/resume', '_self', 'fc9ca351846111eaab15b4a9fc2c4442', 4, 3, 1, '2020-04-22 15:48:40', NULL, 1);
INSERT INTO `sys_permission` VALUES ('56a4fd32b33811eb854c0242ac110002', '绑定银行卡', NULL, NULL, '/index/bankAccount', '_self', '65bdb02f47b94e71c2a2b9e459bde909', 10, 2, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('56a50cbcb33811eb854c0242ac110002', '列表', 'bankAccount:list', NULL, 'bankAccount/listByPage', NULL, '56a4fd32b33811eb854c0242ac110002', NULL, 3, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('56a51288b33811eb854c0242ac110002', '新增', 'bankAccount:add', NULL, 'bankAccount/add', NULL, '56a4fd32b33811eb854c0242ac110002', NULL, 3, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('56a51997b33811eb854c0242ac110002', '修改', 'bankAccount:update', NULL, 'bankAccount/update', NULL, '56a4fd32b33811eb854c0242ac110002', NULL, 3, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('56a51dffb33811eb854c0242ac110002', '删除', 'bankAccount:delete', NULL, 'bankAccount/delete', NULL, '56a4fd32b33811eb854c0242ac110002', NULL, 3, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('58612968-d93c-4c21-8fdc-a825c0ab0275', '列表', 'sys:role:list', NULL, '/sys/roles', NULL, 'e0b16b95-09de-4d60-a283-1eebd424ed47', 0, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('60c3443a-5ec9-4ea7-9484-d2870af93059', '修改', 'sysGenerator:update', NULL, 'sysGenerator/update', NULL, '43d1bbf7-fc4a-4a10-9ad1-205b16c7c05f', 1, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('65bdb02f47b94e71c2a2b9e459bde909', '其他', NULL, 'layui-icon-list', NULL, NULL, '0', 200, 1, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('761db494-833d-4a6c-94b4-3a7409fd9a78', '详情', 'sys:dept:detail', NULL, '/sys/dept/*', NULL, 'c038dc93-f30d-4802-a090-be352eab341a', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('783aedd8-5d93-46b6-8c6d-e4d3f0f3f466', '列表', 'sys:user:list', NULL, '/sys/users', NULL, '78f8e29a-cccd-49e5-ada7-5af40dd95312', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('78f8e29a-cccd-49e5-ada7-5af40dd95312', '用户管理', NULL, NULL, '/index/users', '_self', 'd6214dcb-8b6d-494b-88fa-f519fc08ff8f', 100, 2, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('817a58d1-ec82-4106-870a-bcc0bfaee0e7', '详情', 'sys:user:detail', NULL, '/sys/user/*', NULL, '78f8e29a-cccd-49e5-ada7-5af40dd95312', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('8623c941-5746-4667-9fb8-76f6f5059788', '删除', 'sys:permission:deleted', NULL, '/sys/permission/*', NULL, '3dac936c-c4e1-4560-ac93-905502f61ae0', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('88fd1359aa3911ea883eb4a9fc2c4442', '文件管理', '', '', '/index/sysFiles', '_self', 'e549c4b8-72ca-4ba3-91a8-9ffa1daf77cf', 10, 2, 1, NULL, '2020-06-15 16:00:29', 1);
INSERT INTO `sys_permission` VALUES ('88fd59f1aa3911ea883eb4a9fc2c4442', '列表', 'sysFiles:list', NULL, 'sysFiles/listByPage', NULL, '88fd1359aa3911ea883eb4a9fc2c4442', 0, 3, 1, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('88fd953aaa3911ea883eb4a9fc2c4442', '新增', 'sysFiles:add', NULL, 'sysFiles/add', NULL, '88fd1359aa3911ea883eb4a9fc2c4442', 0, 3, 1, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('88fded61aa3911ea883eb4a9fc2c4442', '删除', 'sysFiles:delete', NULL, 'sysFiles/delete', NULL, '88fd1359aa3911ea883eb4a9fc2c4442', 0, 3, 1, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('8cbcf9939f2f11ea9b7bb4a9fc2c4442', '文章管理', NULL, NULL, '/index/sysContent', '_self', 'e549c4b8-72ca-4ba3-91a8-9ffa1daf77cf', 10, 2, 1, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('8cbd63619f2f11ea9b7bb4a9fc2c4442', '列表', 'sysContent:list', NULL, 'sysContent/listByPage', NULL, '8cbcf9939f2f11ea9b7bb4a9fc2c4442', 0, 3, 1, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('8cbdc0cc9f2f11ea9b7bb4a9fc2c4442', '新增', 'sysContent:add', NULL, 'sysContent/add', NULL, '8cbcf9939f2f11ea9b7bb4a9fc2c4442', 0, 3, 1, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('8cbdf07f9f2f11ea9b7bb4a9fc2c4442', '修改', 'sysContent:update', NULL, 'sysContent/update', NULL, '8cbcf9939f2f11ea9b7bb4a9fc2c4442', 0, 3, 1, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('8cbe19f09f2f11ea9b7bb4a9fc2c4442', '删除', 'sysContent:delete', NULL, 'sysContent/delete', NULL, '8cbcf9939f2f11ea9b7bb4a9fc2c4442', 0, 3, 1, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('992d1a8d-b5f8-44fc-9a48-4b3e60a7b15e', '更新', 'sys:role:update', NULL, '/sys/role', NULL, 'e0b16b95-09de-4d60-a283-1eebd424ed47', 0, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('9b02bb94c01d69b8dabeaeae1c85bbee', '系统信息', '', '', '/index/systemInfo', '_self', '65bdb02f47b94e71c2a2b9e459bde909', 1, 2, 1, '2020-05-26 14:21:47', '2020-05-26 14:23:01', 1);
INSERT INTO `sys_permission` VALUES ('a390845b-a53d-4bc9-af5d-331c37f34e6f', '更新', 'sys:dept:update', NULL, '/sys/dept', NULL, 'c038dc93-f30d-4802-a090-be352eab341a', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('b01614ab-0538-4cca-bb61-b46f18c60aa4', '详情', 'sys:role:detail', NULL, '/sys/role/*', NULL, 'e0b16b95-09de-4d60-a283-1eebd424ed47', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('b180aafa-0d1a-4898-b838-bc20cd44356d', '编辑', 'sys:permission:update', NULL, '/sys/permission', NULL, '3dac936c-c4e1-4560-ac93-905502f61ae0', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('c038dc93-f30d-4802-a090-be352eab341a', '部门管理', NULL, NULL, '/index/depts', '_self', 'd6214dcb-8b6d-494b-88fa-f519fc08ff8f', 100, 2, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('c0a84726-47d8-4d7a-8d53-0736a4586647', '新增', 'sys:user:add', NULL, '/sys/user', NULL, '78f8e29a-cccd-49e5-ada7-5af40dd95312', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('c30389e8-eb3e-4a0d-99c4-639e1893a05f', '列表', 'sys:permission:list', NULL, '/sys/permissions', NULL, '3dac936c-c4e1-4560-ac93-905502f61ae0', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('c30389e8-eb3e-4a0d-99c4-639e1893f50a', '新增', 'sys:permission:add', NULL, '/sys/permission', NULL, '3dac936c-c4e1-4560-ac93-905502f61ae0', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('c69c2d5c81e711ea81a800163e045bb0', '字典管理', NULL, '', '/index/sysDict', NULL, 'e549c4b8-72ca-4ba3-91a8-9ffa1daf77cf', 10, 2, 1, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('c6a0d80a81e711ea81a800163e045bb0', '列表', 'sysDict:list', NULL, 'sysDict/listByPage', NULL, 'c69c2d5c81e711ea81a800163e045bb0', 0, 3, 1, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('c6a36ae381e711ea81a800163e045bb0', '新增', 'sysDict:add', NULL, 'sysDict/add', NULL, 'c69c2d5c81e711ea81a800163e045bb0', 0, 3, 1, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('c6a5e38d81e711ea81a800163e045bb0', '修改', 'sysDict:update', NULL, 'sysDict/update', NULL, 'c69c2d5c81e711ea81a800163e045bb0', 0, 3, 1, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('c6a85a8381e711ea81a800163e045bb0', '删除', 'sysDict:delete', NULL, 'sysDict/delete', NULL, 'c69c2d5c81e711ea81a800163e045bb0', 0, 3, 1, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('d372f1a482e69165151a7dbab0937903', '表单构建', '', '', '/index/build', '_self', '65bdb02f47b94e71c2a2b9e459bde909', 1, 2, 1, '2020-04-22 13:09:41', '2020-05-07 13:36:47', 1);
INSERT INTO `sys_permission` VALUES ('d6214dcb-8b6d-494b-88fa-f519fc08ff8f', '组织管理', NULL, 'layui-icon-user', NULL, NULL, '0', 1, 1, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('db2d31b7-fdcb-478e-bfde-a55eb8b0aa43', '拥有角色', 'sys:user:role:detail', NULL, '/sys/user/roles/*', NULL, '78f8e29a-cccd-49e5-ada7-5af40dd95312', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('e0b16b95-09de-4d60-a283-1eebd424ed47', '角色管理', NULL, NULL, '/index/roles', '_self', 'd6214dcb-8b6d-494b-88fa-f519fc08ff8f', 99, 2, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('e549c4b8-72ca-4ba3-91a8-9ffa1daf77cf', '系统管理', NULL, 'layui-icon-set-fill', NULL, NULL, '0', 98, 1, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('eef2b95e5d5ae2ebbb9d835e8850fd1f', '定时任务暂停', 'sysJob:pause', NULL, '/sysJob/pause', '_self', 'fc9ca351846111eaab15b4a9fc2c4442', 1, 3, 1, '2020-04-22 15:48:18', NULL, 1);
INSERT INTO `sys_permission` VALUES ('f21ed5e8-0756-45dc-91c5-f58a9463caaa', '更新', 'sys:user:update', NULL, '/sys/user', NULL, '78f8e29a-cccd-49e5-ada7-5af40dd95312', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('f28b9215-3119-482d-bdc1-1f4c3f7c0869', '删除', 'sys:user:deleted', NULL, '/sys/user', NULL, '78f8e29a-cccd-49e5-ada7-5af40dd95312', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('f2ff9320-c643-4c85-8b68-15f86d47b88b', '删除', 'sys:log:deleted', NULL, '/sys/logs', NULL, '37101ed5-e840-4082-ae33-682ca6e41ad8', 100, 3, 1, '2020-03-19 13:29:40', '2020-03-19 13:29:40', 1);
INSERT INTO `sys_permission` VALUES ('f5516429b55411eb854c0242ac110002', '绑定店铺', NULL, NULL, '/index/store', '_self', '65bdb02f47b94e71c2a2b9e459bde909', 10, 2, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('f5517419b55411eb854c0242ac110002', '列表', 'store:list', NULL, 'store/listByPage', NULL, 'f5516429b55411eb854c0242ac110002', NULL, 3, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('f5517a94b55411eb854c0242ac110002', '新增', 'store:add', NULL, 'store/add', NULL, 'f5516429b55411eb854c0242ac110002', NULL, 3, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('f551808ab55411eb854c0242ac110002', '修改', 'store:update', NULL, 'store/update', NULL, 'f5516429b55411eb854c0242ac110002', NULL, 3, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('f5518a96b55411eb854c0242ac110002', '删除', 'store:delete', NULL, 'store/delete', NULL, 'f5516429b55411eb854c0242ac110002', NULL, 3, NULL, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('fc9ca351846111eaab15b4a9fc2c4442', '定时任务', NULL, NULL, '/index/sysJob', '_self', 'e549c4b8-72ca-4ba3-91a8-9ffa1daf77cf', 10, 2, 1, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('fc9d3120846111eaab15b4a9fc2c4442', '列表', 'sysJob:list', NULL, 'sysJob/listByPage', NULL, 'fc9ca351846111eaab15b4a9fc2c4442', 0, 3, 1, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('fc9d5be5846111eaab15b4a9fc2c4442', '新增', 'sysJob:add', NULL, 'sysJob/add', NULL, 'fc9ca351846111eaab15b4a9fc2c4442', 0, 3, 1, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('fc9da4f7846111eaab15b4a9fc2c4442', '修改', 'sysJob:update', NULL, 'sysJob/update', NULL, 'fc9ca351846111eaab15b4a9fc2c4442', 0, 3, 1, NULL, NULL, 1);
INSERT INTO `sys_permission` VALUES ('fc9dc9cd846111eaab15b4a9fc2c4442', '删除', 'sysJob:delete', NULL, 'sysJob/delete', NULL, 'fc9ca351846111eaab15b4a9fc2c4442', 0, 3, 1, NULL, NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(300) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '状态(1:正常0:弃用)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(4) DEFAULT NULL COMMENT '是否删除(1未删除；0已删除)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES ('11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '超级管理员', '拥有所有权限-不能删除', 1, '2019-11-01 19:26:29', '2021-05-15 22:51:37', 1);
INSERT INTO `sys_role` VALUES ('2d56198c-d14b-4d02-a625-7559815b62fb', '普通用户角色', '只读', 1, '2019-11-09 22:49:18', '2020-01-01 19:59:46', 1);
INSERT INTO `sys_role` VALUES ('8dd881c7-078c-406a-9c5f-242ab9ecfcb5', 'test', '测试', 1, '2020-01-01 20:01:58', '2019-11-19 10:43:05', 1);
INSERT INTO `sys_role` VALUES ('b95c69b7-84be-430f-ae57-27a703ae3998', '后台管理员', '一般是程序员拥有，用来初始化菜单权限', 1, '2019-11-09 21:25:31', NULL, 1);
INSERT INTO `sys_role` VALUES ('de54c167-e733-4b5b-83dd-ce10edd078f5', '超级权限', '', 1, '2019-11-19 10:34:48', '2019-11-19 10:49:39', 1);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `role_id` varchar(64) DEFAULT NULL COMMENT '角色id',
  `permission_id` varchar(64) DEFAULT NULL COMMENT '菜单权限id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_permission` VALUES ('1393579826010804226', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'd6214dcb-8b6d-494b-88fa-f519fc08ff8f', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826023387138', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '3dac936c-c4e1-4560-ac93-905502f61ae0', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826027581441', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '475b4c24-40fa-4823-863a-ba6d793b7610', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826027581442', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '8623c941-5746-4667-9fb8-76f6f5059788', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826031775745', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'b180aafa-0d1a-4898-b838-bc20cd44356d', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826031775746', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'c30389e8-eb3e-4a0d-99c4-639e1893a05f', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826035970049', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'c30389e8-eb3e-4a0d-99c4-639e1893f50a', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826035970050', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'e0b16b95-09de-4d60-a283-1eebd424ed47', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826035970051', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '1a2ec857-e775-4377-9fb7-e3c77738b3e5', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826040164354', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '58612968-d93c-4c21-8fdc-a825c0ab0275', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826040164355', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '992d1a8d-b5f8-44fc-9a48-4b3e60a7b15e', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826040164356', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '4018e179-e599-41d0-bac5-c5408e1d4bc6', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826044358657', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'b01614ab-0538-4cca-bb61-b46f18c60aa4', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826044358658', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '78f8e29a-cccd-49e5-ada7-5af40dd95312', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826048552962', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '3c390dfd-0d9a-46de-9a5b-1ed884febcb2', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826048552963', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '783aedd8-5d93-46b6-8c6d-e4d3f0f3f466', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826056941570', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '817a58d1-ec82-4106-870a-bcc0bfaee0e7', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826056941571', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'c0a84726-47d8-4d7a-8d53-0736a4586647', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826061135873', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'db2d31b7-fdcb-478e-bfde-a55eb8b0aa43', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826061135874', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'f21ed5e8-0756-45dc-91c5-f58a9463caaa', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826061135875', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'f28b9215-3119-482d-bdc1-1f4c3f7c0869', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826065330178', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'c038dc93-f30d-4802-a090-be352eab341a', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826065330179', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '2073345f-7344-43fe-9084-b7add56da652', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826065330180', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '3a93a7e3-956a-408e-b2e4-108e9ece8f04', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826069524481', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '3ed79f23-90bf-4669-bc02-42ae392e75c1', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826069524482', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '761db494-833d-4a6c-94b4-3a7409fd9a78', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826069524483', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'a390845b-a53d-4bc9-af5d-331c37f34e6f', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826073718786', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'e549c4b8-72ca-4ba3-91a8-9ffa1daf77cf', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826073718787', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '43d1bbf7-fc4a-4a10-9ad1-205b16c7c05f', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826073718788', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '010bcf8b-3172-4331-9941-25788ca8cbb0', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826073718789', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '1dec779d-a9ec-448a-9389-a2b4eefce119', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826077913090', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '46dbb867-51d6-4523-852f-b12e75b34e3d', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826077913091', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '60c3443a-5ec9-4ea7-9484-d2870af93059', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826077913092', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '88fd1359aa3911ea883eb4a9fc2c4442', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826082107394', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '88fd59f1aa3911ea883eb4a9fc2c4442', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826082107395', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '88fd953aaa3911ea883eb4a9fc2c4442', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826082107396', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '88fded61aa3911ea883eb4a9fc2c4442', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826086301697', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '8cbcf9939f2f11ea9b7bb4a9fc2c4442', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826086301698', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '8cbd63619f2f11ea9b7bb4a9fc2c4442', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826086301699', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '8cbdc0cc9f2f11ea9b7bb4a9fc2c4442', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826086301700', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '8cbdf07f9f2f11ea9b7bb4a9fc2c4442', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826086301701', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '8cbe19f09f2f11ea9b7bb4a9fc2c4442', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826090496002', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'c69c2d5c81e711ea81a800163e045bb0', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826090496003', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'c6a0d80a81e711ea81a800163e045bb0', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826090496004', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'c6a36ae381e711ea81a800163e045bb0', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826094690305', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'c6a5e38d81e711ea81a800163e045bb0', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826094690306', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'c6a85a8381e711ea81a800163e045bb0', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826098884610', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'fc9ca351846111eaab15b4a9fc2c4442', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826098884611', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'fc9d3120846111eaab15b4a9fc2c4442', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826098884612', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'fc9d5be5846111eaab15b4a9fc2c4442', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826103078914', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'fc9da4f7846111eaab15b4a9fc2c4442', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826103078915', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'fc9dc9cd846111eaab15b4a9fc2c4442', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826103078916', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'eef2b95e5d5ae2ebbb9d835e8850fd1f', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826107273217', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '526be97ba24c5a1b3418cdf7ca176b7e', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826107273218', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '438641da495235106c2d311703ac4290', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826107273219', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '37101ed5-e840-4082-ae33-682ca6e41ad8', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826107273220', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '355f387f-a22b-4f8c-9cd6-ae10e930cd70', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826111467522', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'f2ff9320-c643-4c85-8b68-15f86d47b88b', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826111467523', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '65bdb02f47b94e71c2a2b9e459bde909', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826111467524', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '9b02bb94c01d69b8dabeaeae1c85bbee', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826111467525', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'd372f1a482e69165151a7dbab0937903', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826115661825', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '34875fcab58811eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826115661826', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '348773e6b58811eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826115661827', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '34877ce5b58811eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826119856130', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '34878844b58811eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826119856131', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '348794b1b58811eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826119856132', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '3aa89f18b58811eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826124050433', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '3aa8bc83b58811eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826124050434', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '3aa8c6e9b58811eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826124050435', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '3aa8d225b58811eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826124050436', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '3aa8db8db58811eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826124050437', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '56a4fd32b33811eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826128244738', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '56a50cbcb33811eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826128244739', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '56a51288b33811eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826128244740', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '56a51997b33811eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826132439041', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '56a51dffb33811eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826132439042', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'f5516429b55411eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826132439043', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'f5517419b55411eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826132439044', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'f5517a94b55411eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826132439045', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'f551808ab55411eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826136633345', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', 'f5518a96b55411eb854c0242ac110002', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826136633346', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '0d99b687-3f46-4632-9d56-8dd5e476dae7', '2021-05-15 22:51:37');
INSERT INTO `sys_role_permission` VALUES ('1393579826136633347', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '26764d88-1d90-402d-b355-a75deef116f2', '2021-05-15 22:51:37');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '用户id',
  `username` varchar(50) NOT NULL COMMENT '账户名称',
  `salt` varchar(20) DEFAULT NULL COMMENT '加密盐值',
  `password` varchar(200) NOT NULL COMMENT '用户密码密文',
  `phone` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `dept_id` varchar(64) DEFAULT NULL COMMENT '部门id',
  `real_name` varchar(60) DEFAULT NULL COMMENT '真实名称',
  `nick_name` varchar(60) DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱(唯一)',
  `status` tinyint(4) DEFAULT NULL COMMENT '账户状态(1.正常 2.锁定 )',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别(1.男 2.女)',
  `deleted` tinyint(4) DEFAULT NULL COMMENT '是否删除(1未删除；0已删除)',
  `create_id` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_id` varchar(64) DEFAULT NULL COMMENT '更新人',
  `create_where` tinyint(4) DEFAULT NULL COMMENT '创建来源(1.web 2.android 3.ios )',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('1dfaafa7-fddf-46f2-b3d8-11bfe9ac7230', 'dev123', 'fa386978e2c04b7baef1', '9204993352a150ddd9febc421a5e5636', '131777777777', '4bd0b0a3-097d-4902-a1f7-641ea3b771bd', NULL, NULL, NULL, 1, 1, 1, NULL, 'fcf34b56-a7a2-4719-9236-867495e74c31', 1, '2019-11-09 22:47:30', '2020-03-19 02:39:12');
INSERT INTO `sys_user` VALUES ('7f8c0e32-058e-409d-8e7c-22a9afe6a0a0', 'zhangyang', '062f33e33afe4509b24b', '920f5d75077b25912e5054c4d58e0a4c', '13899999999', '4bd0b0a3-097d-4902-a1f7-641ea3b771bd', '张杨', NULL, '16399@163.com', 1, 1, 1, NULL, '7f8c0e32-058e-409d-8e7c-22a9afe6a0a0', 1, '2019-11-09 21:23:36', '2019-11-09 22:45:36');
INSERT INTO `sys_user` VALUES ('cd58111d005641a162cb2528c71889ae', 'admin123123', 'db7b27ee460d47a0ad1f', 'f9ac8bba2c66976c73120fcd41a5a79a', '123123123', '4bd0b0a3-097d-4902-a1f7-641ea3b771bd', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, '2020-03-18 09:49:31', NULL);
INSERT INTO `sys_user` VALUES ('d860412c-9a4b-404b-8b71-ae8e3f4c27b7', 't', 'a8aed440045b4e0c9c69', 'b08f907d879ea98a681df0082a9cb95e', '13899999999', '72a4f388-50f8-4019-8c67-530cd7c74e7a', NULL, NULL, NULL, 1, 1, 1, NULL, NULL, 1, '2019-11-19 10:34:24', NULL);
INSERT INTO `sys_user` VALUES ('fcf34b56-a7a2-4719-9236-867495e74c31', 'admin', '324ce32d86224b00a02b', '2102b59a75ab87616b62d0b9432569d0', '13888888888', '72a4f388-50f8-4019-8c67-530cd7c74e7a', '爱糖宝', '爱糖宝', 'yingxue@163.com', 1, 2, 1, NULL, 'fcf34b56-a7a2-4719-9236-867495e74c31', 3, '2019-09-22 19:38:05', '2020-03-18 09:15:22');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(64) NOT NULL COMMENT '用户id',
  `user_id` varchar(64) DEFAULT NULL,
  `role_id` varchar(64) DEFAULT NULL COMMENT '角色id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('2ebca69cc810541c81348d72aa5cab98', '7884efa332130c80be43ef1c61d91f8b', '8dd881c7-078c-406a-9c5f-242ab9ecfcb5', '2020-03-19 02:23:13');
INSERT INTO `sys_user_role` VALUES ('33137e13-2318-42e4-a8e7-4bb7eea0f4ef', '1ff14b2c-d32b-496b-8fb7-d988b838b8e0', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '2020-03-18 08:16:12');
INSERT INTO `sys_user_role` VALUES ('69d5bf3a-37a8-4da1-8941-fe44caa51af0', '7f8c0e32-058e-409d-8e7c-22a9afe6a0a0', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '2019-11-09 21:25:49');
INSERT INTO `sys_user_role` VALUES ('d797bb615b355118d35929ffa573cc86', 'ffd81881f21b48529086233f832f3480', '8dd881c7-078c-406a-9c5f-242ab9ecfcb5', '2020-03-19 02:23:02');
INSERT INTO `sys_user_role` VALUES ('da3dd29ea2f7957c144149e5040ce275', 'fcf34b56-a7a2-4719-9236-867495e74c31', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '2020-03-19 12:17:45');
INSERT INTO `sys_user_role` VALUES ('ea228f70b42849dfffeffdcad04c3a45', 'ee477bad852b0177b3fa10a2243c98d2', '8dd881c7-078c-406a-9c5f-242ab9ecfcb5', '2020-03-19 02:34:47');
INSERT INTO `sys_user_role` VALUES ('f8ad372b79490bd1ad99e7ac77409647', '1dfaafa7-fddf-46f2-b3d8-11bfe9ac7230', '11b3b80c-4a0b-4a92-96ea-fdd4f7a4a7e9', '2020-03-19 02:39:01');
INSERT INTO `sys_user_role` VALUES ('fd1512dc-bf59-45b2-aa14-93da48ff0e8c', 'd860412c-9a4b-404b-8b71-ae8e3f4c27b7', 'de54c167-e733-4b5b-83dd-ce10edd078f5', '2019-11-19 10:35:14');
COMMIT;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `money` decimal(18,2) NOT NULL COMMENT '账户余额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户角色';

-- ----------------------------
-- Records of test
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wallet
-- ----------------------------
DROP TABLE IF EXISTS `wallet`;
CREATE TABLE `wallet` (
  `id` varchar(64) NOT NULL COMMENT 'id',
  `user_id` varchar(64) NOT NULL COMMENT '用户id',
  `money` decimal(18,2) NOT NULL COMMENT '账户余额',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户角色';

-- ----------------------------
-- Records of wallet
-- ----------------------------
BEGIN;
INSERT INTO `wallet` VALUES ('1', 'fcf34b56-a7a2-4719-9236-867495e74c31', 33683.00, '2021-05-15 23:07:22');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

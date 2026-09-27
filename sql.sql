DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `auth_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可增加：',
  `del` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可删除：',
  `set` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改：',
  `get` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可查看：',
  `field_add` varchar(500) DEFAULT NULL COMMENT '添加字段：',
  `field_set` varchar(500) DEFAULT NULL COMMENT '修改字段：',
  `field_get` varchar(500) DEFAULT NULL COMMENT '查询字段：',
  `table_nav_name` varchar(500) DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(500) DEFAULT NULL COMMENT '跨表导航：',
  `option` text COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定制授权';
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) DEFAULT NULL COMMENT '显示顺序',
  `father_id` int(11) DEFAULT '0' COMMENT '父级ID',
  `dir` varchar(255) DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
insert into `upload` values ('1','movie.mp4','/upload/movie.mp4','',null,'0',null,'video');
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint(4) unsigned NOT NULL DEFAULT '100' COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  `register` smallint(1) unsigned DEFAULT '0' COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户组：用于用户前端身份和鉴权';
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token` (
  `token_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) DEFAULT NULL COMMENT '临时访问牌',
  `info` text,
  `maxage` int(2) NOT NULL DEFAULT '2' COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='临时访问牌';
insert into `access_token` values ('57','5accf85cb6a7f06f0aa2968deadaec1b',null,'2','2022-12-12 18:32:09.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('58','46ff1d4d07714f046ba07b34bffe0af9',null,'2','2022-12-12 18:32:31.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('59','ed9d6cba9826fda1beafcd9326be7a86',null,'2','2022-12-12 18:32:36.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('60','c99763c1833ea0785d9e2b81da3fd28f',null,'2','2022-12-12 18:36:46.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('61','33fbfaccd6d1cb9143e4129bd919d4b0',null,'2','2022-12-12 18:38:05.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('62','493e13da5f293ba67a56a0fe3e1fa6cf',null,'2','2022-12-12 18:44:44.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('63','c4b48e9e2160db09c703041a8fee0a1f',null,'2','2022-12-12 18:55:04.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('64','d13cdaefd3823c360c959a02a262f71d',null,'2','2022-12-12 19:22:32.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('65','6c6ff426fd77ea5a2025ce5ed2e42c8a',null,'2','2022-12-12 19:28:29.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('66','80930065a61ffcdd5cbb75f60932973c',null,'2','2022-12-12 19:41:41.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('67','94114763cf2e3b020495d8a27096d4ef',null,'2','2022-12-12 19:43:13.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('68','761052c551c97c9317bc3aa475c85b84',null,'2','2022-12-12 19:43:26.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('69','7c44ef14131a0ba7c16aa16cef104065',null,'2','2022-12-12 20:24:46.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('70','96380f3d9542c80d04bdade1cf7635a5',null,'2','2022-12-12 21:08:06.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('71','bfdc7acfcbf5763fda81945b60961222',null,'2','2022-12-12 21:08:34.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('72','170a598e51ae8ae2badde20a42fe171d',null,'2','2022-12-12 21:25:42.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('73','c82c357488c75926a92d8a9608d4b367',null,'2','2022-12-12 21:28:52.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('74','4d35290c023f407a820f37dbbb1ceb09',null,'2','2022-12-12 21:44:12.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('75','8d19162776682b695c0f62f3c7a92fec',null,'2','2022-12-12 21:44:38.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('76','a7ea2cdc9a2be179e19200e593ad5a69',null,'2','2022-12-12 21:47:50.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('77','c79a554f9832adc01f19682c5d576bc4',null,'2','2022-12-12 21:49:06.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('78','1c7d95001fa09951a679841c8100ad1f',null,'2','2022-12-12 21:51:22.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('79','776da1bcdd01ddb3cbf0a37fa13fc5b0',null,'2','2022-12-12 21:52:07.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('80','d336e88e57c329d0166931292c1fac41',null,'2','2022-12-12 21:53:34.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('81','37a40f526a6c82fc6110b512802d35bf',null,'2','2022-12-12 22:03:13.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('82','691ad331771f4109206d58aeee572371',null,'2','2022-12-12 22:06:22.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('83','9942e458886219960d3344b4a6a6fbec',null,'2','2022-12-12 23:09:17.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('84','e9939a8b7ccf9f548f0bbb5664981f96',null,'2','2022-12-12 23:11:18.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('85','f5b27912060d1909bef61fab9d96faae',null,'2','2022-12-12 23:20:40.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('86','7c5888682f1d449eb1b62f0054a79fbf',null,'2','2022-12-12 23:28:01.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('87','00dfdc6ac21c4a9da80fd71c990764d1',null,'2','2022-12-13 12:54:06.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('88','3cce592bc72840ab932ce96d85a194da',null,'2','2022-12-13 12:56:39.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('89','43fdaa989a644ad683ef4b4d488e8629',null,'2','2022-12-13 13:31:25.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('90','d6a3cecadacff0dbd6b43b25372cc2a2',null,'2','2022-12-13 20:29:58.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('91','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2022-12-13 20:30:36.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('92','5570bc5b07b3589f4ef8553bd46eb0d1',null,'2','2022-12-13 20:30:36.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('93','26c553bd2ee2ab6605d18dfd310d85f9',null,'2','2022-12-13 20:30:54.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('94','3fd52f81236ed2c37ff91a6696d4e47a',null,'2','2022-12-13 20:32:53.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('95','893332e9ee67d60d8312b3700c58a359',null,'2','2022-12-13 20:57:29.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('96','b7844068ade535b2e517df4a40948703',null,'2','2022-12-13 21:01:03.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('97','179b37a5e1893c3af6b946bd5a1c8625',null,'2','2022-12-13 21:01:37.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('98','3a47b8a040a83ebbc9194cb255dc668c',null,'2','2022-12-16 14:30:56.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('99','afa60196afb77dcc2b520ed13a817560',null,'2','2022-12-16 14:31:03.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('100','7fc6d9b324f8c0a3a1784d04ef132692',null,'2','2022-12-16 17:54:10.0','2022-12-20 11:45:30.0','1');
insert into `access_token` values ('101','84e31b291f2bde6b7ceb27af5fe8eee3',null,'2','2022-12-30 15:22:34.0','2022-12-31 11:46:03.0','1');
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits` (
  `hits_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源字段：',
  `source_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint(1) unsigned NOT NULL DEFAULT '1' COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户账户：用于保存用户登录信息';
insert into `user` values ('1','1','管理员','2022-12-25 18:21:49.0',null,'0','admin','admin','bfd59291e825b5f2bbf1eb76569f8fe7','','0','/api/upload/admin_avatar.jpg','2022-12-01 17:35:13.0');
DROP TABLE IF EXISTS `teacher_user`;
CREATE TABLE `teacher_user`(teacher_user_id int(11) NOT NULL AUTO_INCREMENT COMMENT '教师用户ID',
`teachers_name` varchar(64) comment '教师姓名',
`gender_of_teachers` varchar(64) comment '教师性别',
`teacher_id` varchar(64) NOT NULL UNIQUE comment '教师工号',
`name_of_department` varchar(64) comment '院系名称',
`class_name` varchar(64) comment '班级名称',
`teacher_education` varchar(64) comment '教师学历',
`teacher_title` varchar(64) comment '教师职称',
`examine_state` varchar(16) DEFAULT '已通过' NOT NULL comment '审核状态',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`user_id` int(11) DEFAULT '0' NOT NULL comment '用户ID',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (teacher_user_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '教师用户';

DROP TABLE IF EXISTS `announcement_information`;
CREATE TABLE `announcement_information`(announcement_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '公告信息ID',
`announcement_no` varchar(64) comment '公告编号',
`announcement_title` varchar(64) comment '公告标题',
`publisher` varchar(64) comment '发布人',
`release_date` date comment '发布日期',
`announcement_content` text comment '公告内容',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (announcement_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '公告信息';
insert into `announcement_information` values (1,'公告编号1','公告标题1','发布人1','2023-01-18','此处可上传文字、图片、视频、超链接、表格等内容区1',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `announcement_information` values (2,'公告编号2','公告标题2','发布人2','2023-01-18','此处可上传文字、图片、视频、超链接、表格等内容区2',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `announcement_information` values (3,'公告编号3','公告标题3','发布人3','2023-01-18','此处可上传文字、图片、视频、超链接、表格等内容区3',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `announcement_information` values (4,'公告编号4','公告标题4','发布人4','2023-01-18','此处可上传文字、图片、视频、超链接、表格等内容区4',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `announcement_information` values (5,'公告编号5','公告标题5','发布人5','2023-01-18','此处可上传文字、图片、视频、超链接、表格等内容区5',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `announcement_information` values (6,'公告编号6','公告标题6','发布人6','2023-01-18','此处可上传文字、图片、视频、超链接、表格等内容区6',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `announcement_information` values (7,'公告编号7','公告标题7','发布人7','2023-01-18','此处可上传文字、图片、视频、超链接、表格等内容区7',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `announcement_information` values (8,'公告编号8','公告标题8','发布人8','2023-01-18','此处可上传文字、图片、视频、超链接、表格等内容区8',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');

DROP TABLE IF EXISTS `teacher_workload`;
CREATE TABLE `teacher_workload`(teacher_workload_id int(11) NOT NULL AUTO_INCREMENT COMMENT '教师工作量ID',
`title_name` varchar(64) comment '标题名称',
`teacher_information` int(11) DEFAULT 0 comment '教师信息',
`teachers_name` varchar(64) comment '教师姓名',
`number_of_students` int(11) DEFAULT 0 comment '学生数量',
`student_hours` varchar(64) comment '学生学时',
`total_workload` varchar(64) comment '总工作量',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (teacher_workload_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '教师工作量';
insert into `teacher_workload` values (1,'标题名称1',0,'教师姓名1',1,'学生学时1','总工作量1',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `teacher_workload` values (2,'标题名称2',0,'教师姓名2',2,'学生学时2','总工作量2',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `teacher_workload` values (3,'标题名称3',0,'教师姓名3',3,'学生学时3','总工作量3',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `teacher_workload` values (4,'标题名称4',0,'教师姓名4',4,'学生学时4','总工作量4',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `teacher_workload` values (5,'标题名称5',0,'教师姓名5',5,'学生学时5','总工作量5',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `teacher_workload` values (6,'标题名称6',0,'教师姓名6',6,'学生学时6','总工作量6',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `teacher_workload` values (7,'标题名称7',0,'教师姓名7',7,'学生学时7','总工作量7',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `teacher_workload` values (8,'标题名称8',0,'教师姓名8',8,'学生学时8','总工作量8',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');

DROP TABLE IF EXISTS `teacher_salary`;
CREATE TABLE `teacher_salary`(teacher_salary_id int(11) NOT NULL AUTO_INCREMENT COMMENT '教师工资ID',
`title_name` varchar(64) comment '标题名称',
`teacher_information` int(11) DEFAULT 0 comment '教师信息',
`teachers_name` varchar(64) comment '教师姓名',
`teacher_education` varchar(64) comment '教师学历',
`academic_salary` varchar(64) comment '学历工资',
`teacher_title` varchar(64) comment '教师职称',
`title_salary` varchar(64) comment '职称工资',
`number_of_courses` int(11) DEFAULT 0 comment '课程数量',
`teaching_evaluation_grade` varchar(64) comment '评教等级',
`teaching_evaluation_bonus` varchar(64) comment '评教奖金',
`annual_salary` varchar(64) comment '年度工资',
`salary_details` text comment '工资详情',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (teacher_salary_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '教师工资';
insert into `teacher_salary` values (1,'标题名称1',0,'教师姓名1','教师学历1','学历工资1','教师职称1','职称工资1',1,'评教等级1','评教奖金1','年度工资1','此处可上传文字、图片、视频、超链接、表格等内容区1',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `teacher_salary` values (2,'标题名称2',0,'教师姓名2','教师学历2','学历工资2','教师职称2','职称工资2',2,'评教等级2','评教奖金2','年度工资2','此处可上传文字、图片、视频、超链接、表格等内容区2',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `teacher_salary` values (3,'标题名称3',0,'教师姓名3','教师学历3','学历工资3','教师职称3','职称工资3',3,'评教等级3','评教奖金3','年度工资3','此处可上传文字、图片、视频、超链接、表格等内容区3',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `teacher_salary` values (4,'标题名称4',0,'教师姓名4','教师学历4','学历工资4','教师职称4','职称工资4',4,'评教等级4','评教奖金4','年度工资4','此处可上传文字、图片、视频、超链接、表格等内容区4',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `teacher_salary` values (5,'标题名称5',0,'教师姓名5','教师学历5','学历工资5','教师职称5','职称工资5',5,'评教等级5','评教奖金5','年度工资5','此处可上传文字、图片、视频、超链接、表格等内容区5',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `teacher_salary` values (6,'标题名称6',0,'教师姓名6','教师学历6','学历工资6','教师职称6','职称工资6',6,'评教等级6','评教奖金6','年度工资6','此处可上传文字、图片、视频、超链接、表格等内容区6',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `teacher_salary` values (7,'标题名称7',0,'教师姓名7','教师学历7','学历工资7','教师职称7','职称工资7',7,'评教等级7','评教奖金7','年度工资7','此处可上传文字、图片、视频、超链接、表格等内容区7',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `teacher_salary` values (8,'标题名称8',0,'教师姓名8','教师学历8','学历工资8','教师职称8','职称工资8',8,'评教等级8','评教奖金8','年度工资8','此处可上传文字、图片、视频、超链接、表格等内容区8',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');

DROP TABLE IF EXISTS `course_information`;
CREATE TABLE `course_information`(course_information_id int(11) NOT NULL AUTO_INCREMENT COMMENT '课程信息ID',
`course_no` varchar(64) comment '课程编号',
`course_name` varchar(64) comment '课程名称',
`lecturer` int(11) DEFAULT 0 comment '授课教师',
`teachers_name` varchar(64) comment '教师姓名',
`teaching_time` datetime comment '授课时间',
`lecture_section` varchar(64) comment '授课课节',
`remarks` text comment '备注信息',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (course_information_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '课程信息';
insert into `course_information` values (1,'课程编号1','课程名称1',0,'教师姓名1','2023-01-18 09:21:07','授课课节1','此处可上传文字、图片、视频、超链接、表格等内容区1',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `course_information` values (2,'课程编号2','课程名称2',0,'教师姓名2','2023-01-18 09:21:07','授课课节2','此处可上传文字、图片、视频、超链接、表格等内容区2',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `course_information` values (3,'课程编号3','课程名称3',0,'教师姓名3','2023-01-18 09:21:07','授课课节3','此处可上传文字、图片、视频、超链接、表格等内容区3',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `course_information` values (4,'课程编号4','课程名称4',0,'教师姓名4','2023-01-18 09:21:07','授课课节4','此处可上传文字、图片、视频、超链接、表格等内容区4',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `course_information` values (5,'课程编号5','课程名称5',0,'教师姓名5','2023-01-18 09:21:07','授课课节5','此处可上传文字、图片、视频、超链接、表格等内容区5',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `course_information` values (6,'课程编号6','课程名称6',0,'教师姓名6','2023-01-18 09:21:07','授课课节6','此处可上传文字、图片、视频、超链接、表格等内容区6',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `course_information` values (7,'课程编号7','课程名称7',0,'教师姓名7','2023-01-18 09:21:07','授课课节7','此处可上传文字、图片、视频、超链接、表格等内容区7',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `course_information` values (8,'课程编号8','课程名称8',0,'教师姓名8','2023-01-18 09:21:07','授课课节8','此处可上传文字、图片、视频、超链接、表格等内容区8',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');

DROP TABLE IF EXISTS `course_materials`;
CREATE TABLE `course_materials`(course_materials_id int(11) NOT NULL AUTO_INCREMENT COMMENT '课程资料ID',
`course_no` varchar(64) comment '课程编号',
`course_name` varchar(64) comment '课程名称',
`lecturer` int(11) DEFAULT 0 comment '授课教师',
`teachers_name` varchar(64) comment '教师姓名',
`teaching_time` datetime comment '授课时间',
`lecture_section` varchar(64) comment '授课课节',
`information_documents` varchar(255) comment '资料文件',
`course_summary` text comment '课程总结',
`recommend` int(11) DEFAULT '0' NOT NULL comment '智能推荐',
`create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY (course_materials_id))ENGINE=InnoDB DEFAULT CHARSET=utf8 comment '课程资料';
insert into `course_materials` values (1,'课程编号1','课程名称1',0,'教师姓名1','2023-01-18 09:21:07','授课课节1','','此处可上传文字、图片、视频、超链接、表格等内容区1',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `course_materials` values (2,'课程编号2','课程名称2',0,'教师姓名2','2023-01-18 09:21:07','授课课节2','','此处可上传文字、图片、视频、超链接、表格等内容区2',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `course_materials` values (3,'课程编号3','课程名称3',0,'教师姓名3','2023-01-18 09:21:07','授课课节3','','此处可上传文字、图片、视频、超链接、表格等内容区3',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `course_materials` values (4,'课程编号4','课程名称4',0,'教师姓名4','2023-01-18 09:21:07','授课课节4','','此处可上传文字、图片、视频、超链接、表格等内容区4',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `course_materials` values (5,'课程编号5','课程名称5',0,'教师姓名5','2023-01-18 09:21:07','授课课节5','','此处可上传文字、图片、视频、超链接、表格等内容区5',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `course_materials` values (6,'课程编号6','课程名称6',0,'教师姓名6','2023-01-18 09:21:07','授课课节6','','此处可上传文字、图片、视频、超链接、表格等内容区6',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `course_materials` values (7,'课程编号7','课程名称7',0,'教师姓名7','2023-01-18 09:21:07','授课课节7','','此处可上传文字、图片、视频、超链接、表格等内容区7',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');
insert into `course_materials` values (8,'课程编号8','课程名称8',0,'教师姓名8','2023-01-18 09:21:07','授课课节8','','此处可上传文字、图片、视频、超链接、表格等内容区8',0,'2023-01-18 09:21:07','2023-01-18 09:21:07');

insert into `auth` values ('1','管理员','教师用户','teacher_user','教师用户','/teacher_user/table','','_blank','1','1','1','1','teachers_name,gender_of_teachers,teacher_id,name_of_department,class_name,teacher_education,teacher_title','teachers_name,gender_of_teachers,teacher_id,name_of_department,class_name,teacher_education,teacher_title','teachers_name,gender_of_teachers,teacher_id,name_of_department,class_name,teacher_education,teacher_title',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('2','管理员','教师用户','teacher_user','教师用户详情','/teacher_user/view','','_blank','1','1','1','1','teachers_name,gender_of_teachers,teacher_id,name_of_department,class_name,teacher_education,teacher_title','teachers_name,gender_of_teachers,teacher_id,name_of_department,class_name,teacher_education,teacher_title','teachers_name,gender_of_teachers,teacher_id,name_of_department,class_name,teacher_education,teacher_title',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('3','管理员','公告信息','announcement_information','公告信息','/announcement_information/table','','_blank','1','1','1','1','announcement_no,announcement_title,publisher,release_date,announcement_content','announcement_no,announcement_title,publisher,release_date,announcement_content','announcement_no,announcement_title,publisher,release_date,announcement_content',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('4','管理员','公告信息','announcement_information','公告信息详情','/announcement_information/view','','_blank','1','1','1','1','announcement_no,announcement_title,publisher,release_date,announcement_content','announcement_no,announcement_title,publisher,release_date,announcement_content','announcement_no,announcement_title,publisher,release_date,announcement_content',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('5','管理员','教师工作量','teacher_workload','教师工作量','/teacher_workload/table','','_blank','1','1','1','1','title_name,teacher_information,teachers_name,number_of_students,student_hours,total_workload','title_name,teacher_information,teachers_name,number_of_students,student_hours,total_workload','title_name,teacher_information,teachers_name,number_of_students,student_hours,total_workload',null,'0','{"figure":true}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('6','管理员','教师工作量','teacher_workload','教师工作量详情','/teacher_workload/view','','_blank','1','1','1','1','title_name,teacher_information,teachers_name,number_of_students,student_hours,total_workload','title_name,teacher_information,teachers_name,number_of_students,student_hours,total_workload','title_name,teacher_information,teachers_name,number_of_students,student_hours,total_workload',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('7','管理员','教师工资','teacher_salary','教师工资','/teacher_salary/table','','_blank','1','1','1','1','title_name,teacher_information,teachers_name,teacher_education,academic_salary,teacher_title,title_salary,number_of_courses,teaching_evaluation_grade,teaching_evaluation_bonus,annual_salary,salary_details','title_name,teacher_information,teachers_name,teacher_education,academic_salary,teacher_title,title_salary,number_of_courses,teaching_evaluation_grade,teaching_evaluation_bonus,annual_salary,salary_details','title_name,teacher_information,teachers_name,teacher_education,academic_salary,teacher_title,title_salary,number_of_courses,teaching_evaluation_grade,teaching_evaluation_bonus,annual_salary,salary_details',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('8','管理员','教师工资','teacher_salary','教师工资详情','/teacher_salary/view','','_blank','1','1','1','1','title_name,teacher_information,teachers_name,teacher_education,academic_salary,teacher_title,title_salary,number_of_courses,teaching_evaluation_grade,teaching_evaluation_bonus,annual_salary,salary_details','title_name,teacher_information,teachers_name,teacher_education,academic_salary,teacher_title,title_salary,number_of_courses,teaching_evaluation_grade,teaching_evaluation_bonus,annual_salary,salary_details','title_name,teacher_information,teachers_name,teacher_education,academic_salary,teacher_title,title_salary,number_of_courses,teaching_evaluation_grade,teaching_evaluation_bonus,annual_salary,salary_details',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('9','管理员','课程信息','course_information','课程信息','/course_information/table','','_blank','1','1','1','1','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,remarks','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,remarks','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,remarks',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('10','管理员','课程信息','course_information','课程信息详情','/course_information/view','','_blank','1','1','1','1','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,remarks','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,remarks','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,remarks',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('11','管理员','课程资料','course_materials','课程资料','/course_materials/table','','_blank','1','1','1','1','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,information_documents,course_summary','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,information_documents,course_summary','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,information_documents,course_summary',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('12','管理员','课程资料','course_materials','课程资料详情','/course_materials/view','','_blank','1','1','1','1','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,information_documents,course_summary','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,information_documents,course_summary','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,information_documents,course_summary',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('13','管理员','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('14','管理员','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('15','管理员','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('16','管理员','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('17','游客','教师用户','teacher_user','教师用户','/teacher_user/table','','_blank','0','0','0','0','teachers_name,gender_of_teachers,teacher_id,name_of_department,class_name,teacher_education,teacher_title','teachers_name,gender_of_teachers,teacher_id,name_of_department,class_name,teacher_education,teacher_title','teachers_name,gender_of_teachers,teacher_id,name_of_department,class_name,teacher_education,teacher_title',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('18','游客','教师用户','teacher_user','教师用户详情','/teacher_user/view','','_blank','0','0','0','0','teachers_name,gender_of_teachers,teacher_id,name_of_department,class_name,teacher_education,teacher_title','teachers_name,gender_of_teachers,teacher_id,name_of_department,class_name,teacher_education,teacher_title','teachers_name,gender_of_teachers,teacher_id,name_of_department,class_name,teacher_education,teacher_title',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('19','游客','公告信息','announcement_information','公告信息','/announcement_information/table','','_blank','0','0','0','0','announcement_no,announcement_title,publisher,release_date,announcement_content','announcement_no,announcement_title,publisher,release_date,announcement_content','announcement_no,announcement_title,publisher,release_date,announcement_content',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('20','游客','公告信息','announcement_information','公告信息详情','/announcement_information/view','','_blank','0','0','0','0','announcement_no,announcement_title,publisher,release_date,announcement_content','announcement_no,announcement_title,publisher,release_date,announcement_content','announcement_no,announcement_title,publisher,release_date,announcement_content',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('21','游客','教师工作量','teacher_workload','教师工作量','/teacher_workload/table','','_blank','0','0','0','0','title_name,teacher_information,teachers_name,number_of_students,student_hours,total_workload','title_name,teacher_information,teachers_name,number_of_students,student_hours,total_workload','title_name,teacher_information,teachers_name,number_of_students,student_hours,total_workload',null,'0','{"figure":false}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('22','游客','教师工作量','teacher_workload','教师工作量详情','/teacher_workload/view','','_blank','0','0','0','0','title_name,teacher_information,teachers_name,number_of_students,student_hours,total_workload','title_name,teacher_information,teachers_name,number_of_students,student_hours,total_workload','title_name,teacher_information,teachers_name,number_of_students,student_hours,total_workload',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('23','游客','教师工资','teacher_salary','教师工资','/teacher_salary/table','','_blank','0','0','0','0','title_name,teacher_information,teachers_name,teacher_education,academic_salary,teacher_title,title_salary,number_of_courses,teaching_evaluation_grade,teaching_evaluation_bonus,annual_salary,salary_details','title_name,teacher_information,teachers_name,teacher_education,academic_salary,teacher_title,title_salary,number_of_courses,teaching_evaluation_grade,teaching_evaluation_bonus,annual_salary,salary_details','title_name,teacher_information,teachers_name,teacher_education,academic_salary,teacher_title,title_salary,number_of_courses,teaching_evaluation_grade,teaching_evaluation_bonus,annual_salary,salary_details',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('24','游客','教师工资','teacher_salary','教师工资详情','/teacher_salary/view','','_blank','0','0','0','0','title_name,teacher_information,teachers_name,teacher_education,academic_salary,teacher_title,title_salary,number_of_courses,teaching_evaluation_grade,teaching_evaluation_bonus,annual_salary,salary_details','title_name,teacher_information,teachers_name,teacher_education,academic_salary,teacher_title,title_salary,number_of_courses,teaching_evaluation_grade,teaching_evaluation_bonus,annual_salary,salary_details','title_name,teacher_information,teachers_name,teacher_education,academic_salary,teacher_title,title_salary,number_of_courses,teaching_evaluation_grade,teaching_evaluation_bonus,annual_salary,salary_details',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('25','游客','课程信息','course_information','课程信息','/course_information/table','','_blank','0','0','0','0','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,remarks','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,remarks','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,remarks',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('26','游客','课程信息','course_information','课程信息详情','/course_information/view','','_blank','0','0','0','0','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,remarks','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,remarks','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,remarks',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('27','游客','课程资料','course_materials','课程资料','/course_materials/table','','_blank','0','0','0','0','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,information_documents,course_summary','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,information_documents,course_summary','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,information_documents,course_summary',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('28','游客','课程资料','course_materials','课程资料详情','/course_materials/view','','_blank','0','0','0','0','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,information_documents,course_summary','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,information_documents,course_summary','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,information_documents,course_summary',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('29','游客','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('30','游客','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('31','游客','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('32','游客','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('33','教师用户','教师用户','teacher_user','教师用户','/teacher_user/table','','_blank','0','0','0','0','teachers_name,gender_of_teachers,teacher_id,name_of_department,class_name,teacher_education,teacher_title','teachers_name,gender_of_teachers,teacher_id,name_of_department,class_name,teacher_education,teacher_title','teachers_name,gender_of_teachers,teacher_id,name_of_department,class_name,teacher_education,teacher_title',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('34','教师用户','教师用户','teacher_user','教师用户详情','/teacher_user/view','','_blank','1','1','1','1','teachers_name,gender_of_teachers,teacher_id,name_of_department,class_name,teacher_education,teacher_title','teachers_name,gender_of_teachers,teacher_id,name_of_department,class_name,teacher_education,teacher_title','teachers_name,gender_of_teachers,teacher_id,name_of_department,class_name,teacher_education,teacher_title',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('35','教师用户','公告信息','announcement_information','公告信息','/announcement_information/table','','_blank','0','0','0','1','announcement_no,announcement_title,publisher,release_date,announcement_content','announcement_no,announcement_title,publisher,release_date,announcement_content','announcement_no,announcement_title,publisher,release_date,announcement_content',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('36','教师用户','公告信息','announcement_information','公告信息详情','/announcement_information/view','','_blank','0','0','0','1','announcement_no,announcement_title,publisher,release_date,announcement_content','announcement_no,announcement_title,publisher,release_date,announcement_content','announcement_no,announcement_title,publisher,release_date,announcement_content',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('37','教师用户','教师工作量','teacher_workload','教师工作量','/teacher_workload/table','','_blank','0','0','0','1','title_name,teacher_information,teachers_name,number_of_students,student_hours,total_workload','title_name,teacher_information,teachers_name,number_of_students,student_hours,total_workload','title_name,teacher_information,teachers_name,number_of_students,student_hours,total_workload',null,'0','{"figure":false}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('38','教师用户','教师工作量','teacher_workload','教师工作量详情','/teacher_workload/view','','_blank','0','0','0','1','title_name,teacher_information,teachers_name,number_of_students,student_hours,total_workload','title_name,teacher_information,teachers_name,number_of_students,student_hours,total_workload','title_name,teacher_information,teachers_name,number_of_students,student_hours,total_workload',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('39','教师用户','教师工资','teacher_salary','教师工资','/teacher_salary/table','','_blank','0','0','0','1','title_name,teacher_information,teachers_name,teacher_education,academic_salary,teacher_title,title_salary,number_of_courses,teaching_evaluation_grade,teaching_evaluation_bonus,annual_salary,salary_details','title_name,teacher_information,teachers_name,teacher_education,academic_salary,teacher_title,title_salary,number_of_courses,teaching_evaluation_grade,teaching_evaluation_bonus,annual_salary,salary_details','title_name,teacher_information,teachers_name,teacher_education,academic_salary,teacher_title,title_salary,number_of_courses,teaching_evaluation_grade,teaching_evaluation_bonus,annual_salary,salary_details',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('40','教师用户','教师工资','teacher_salary','教师工资详情','/teacher_salary/view','','_blank','0','0','0','1','title_name,teacher_information,teachers_name,teacher_education,academic_salary,teacher_title,title_salary,number_of_courses,teaching_evaluation_grade,teaching_evaluation_bonus,annual_salary,salary_details','title_name,teacher_information,teachers_name,teacher_education,academic_salary,teacher_title,title_salary,number_of_courses,teaching_evaluation_grade,teaching_evaluation_bonus,annual_salary,salary_details','title_name,teacher_information,teachers_name,teacher_education,academic_salary,teacher_title,title_salary,number_of_courses,teaching_evaluation_grade,teaching_evaluation_bonus,annual_salary,salary_details',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('41','教师用户','课程信息','course_information','课程信息','/course_information/table','','_blank','0','0','0','1','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,remarks','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,remarks','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,remarks',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('42','教师用户','课程信息','course_information','课程信息详情','/course_information/view','','_blank','0','0','0','1','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,remarks','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,remarks','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,remarks',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('43','教师用户','课程资料','course_materials','课程资料','/course_materials/table','','_blank','1','1','1','1','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,information_documents,course_summary','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,information_documents,course_summary','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,information_documents,course_summary',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('44','教师用户','课程资料','course_materials','课程资料详情','/course_materials/view','','_blank','1','1','1','1','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,information_documents,course_summary','information_documents,course_summary','course_no,course_name,lecturer,teachers_name,teaching_time,lecture_section,information_documents,course_summary',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('45','教师用户','评论','comment','评论列表','/comment/table','','_blank','0','0','0','0','','','',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('46','教师用户','评论','comment','评论详情','/comment/view','','_blank','0','0','0','0','','','',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('47','教师用户','评论','comment','我的评论','/comment/list','','_blank','0','0','0','0','','','',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `auth` values ('48','教师用户','评论','comment','评论详情','/comment/details','','_blank','0','0','0','0','','','',null,'0','{}','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `user_group` values ('1','100','管理员',null,'','','0','0','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `user_group` values ('2','100','游客',null,'','','0','0','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');
insert into `user_group` values ('3','100','教师用户',null,'teacher_user','teacher_user_id','0','0','2023-01-18 09:21:07.0','2023-01-18 09:21:07.0');

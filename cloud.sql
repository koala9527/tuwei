-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2019-11-12 15:58:54
-- 服务器版本： 5.5.57-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cloud`
--

-- --------------------------------------------------------

--
-- 表的结构 `cloud_advise`
--

CREATE TABLE IF NOT EXISTS `cloud_advise` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(10) NOT NULL,
  `submit_time` datetime DEFAULT NULL,
  `submit_ip` varchar(20) NOT NULL DEFAULT '000.000.000.000',
  `content` varchar(200) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='建议';

-- --------------------------------------------------------

--
-- 表的结构 `cloud_notice`
--

CREATE TABLE IF NOT EXISTS `cloud_notice` (
  `id` int(11) unsigned NOT NULL,
  `creat_time` varchar(20) NOT NULL DEFAULT '' COMMENT '创建时间',
  `title` varchar(200) NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='公告表';

-- --------------------------------------------------------

--
-- 表的结构 `cloud_recommendedrule`
--

CREATE TABLE IF NOT EXISTS `cloud_recommendedrule` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `origin_day` int(4) NOT NULL DEFAULT '0' COMMENT '原本时长',
  `give_day` int(4) NOT NULL DEFAULT '0' COMMENT '赠送时长'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='被推荐人规则';

-- --------------------------------------------------------

--
-- 表的结构 `cloud_recommenderrule`
--

CREATE TABLE IF NOT EXISTS `cloud_recommenderrule` (
  `id` int(11) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `origin_day` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '原本时长',
  `give_day` int(4) unsigned NOT NULL DEFAULT '0' COMMENT '赠送时长'
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='推荐人规则';

-- --------------------------------------------------------

--
-- 表的结构 `cloud_regcode`
--

CREATE TABLE IF NOT EXISTS `cloud_regcode` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `software_id` int(11) NOT NULL COMMENT '软件id',
  `time_str` varchar(10) NOT NULL DEFAULT '' COMMENT '中文时间',
  `software_name` varchar(20) NOT NULL DEFAULT '' COMMENT '软件名',
  `code` char(32) NOT NULL DEFAULT '' COMMENT '注册码',
  `produce_time` datetime DEFAULT NULL COMMENT '生成时间',
  `all_minutes` int(10) unsigned DEFAULT '0' COMMENT '可用分钟',
  `isonline` mediumint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0不在线，1在线',
  `overdue` mediumint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未到期，1到期',
  `computer_uid` char(16) NOT NULL DEFAULT '' COMMENT '机器码',
  `beginuse_time` datetime DEFAULT NULL COMMENT '开始使用时间',
  `expire_time` datetime DEFAULT NULL COMMENT '到期时间',
  `last_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  `last_ip` varchar(20) NOT NULL DEFAULT '000.000.000.000' COMMENT '最后一次登录ip',
  `use_count` int(10) unsigned DEFAULT '0' COMMENT '使用次数',
  `frozen` mediumint(1) NOT NULL DEFAULT '0' COMMENT '0 正常1冻结',
  `token` char(5) DEFAULT NULL COMMENT '限制多开',
  `mark` char(30) NOT NULL DEFAULT '' COMMENT '备注',
  `recommend_code` int(10) DEFAULT NULL COMMENT '推荐码'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='注册码表';

-- --------------------------------------------------------

--
-- 表的结构 `cloud_software`
--

CREATE TABLE IF NOT EXISTS `cloud_software` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '软件名',
  `version` varchar(10) DEFAULT '' COMMENT '软件版本',
  `info` varchar(45) DEFAULT '' COMMENT '软件公告',
  `update_url` varchar(45) DEFAULT '' COMMENT '更新地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `try_minutes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '试用分钟',
  `try_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '试用次数',
  `updatemode` mediumint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0强制更新1不强制',
  `bindmode` mediumint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0绑机单开1绑机多开2不绑多开',
  `unbindmode` mediumint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0允许解绑1不允许',
  `frozen` mediumint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 正常1冻结'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cloud_trial`
--

CREATE TABLE IF NOT EXISTS `cloud_trial` (
  `id` int(11) unsigned NOT NULL,
  `computer_uid` char(16) DEFAULT '0' COMMENT '机器码',
  `software_id` int(11) DEFAULT '0' COMMENT '软件id',
  `has_try_count` int(11) DEFAULT '1' COMMENT '已用次数',
  `last_ip` varchar(20) DEFAULT '000.000.000.000' COMMENT 'ip',
  `last_time` datetime DEFAULT NULL COMMENT '最后试用时间',
  `token` char(5) DEFAULT NULL COMMENT '限制多开'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `cloud_user`
--

CREATE TABLE IF NOT EXISTS `cloud_user` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` char(40) NOT NULL DEFAULT '',
  `email` varchar(30) NOT NULL DEFAULT '',
  `reg_time` datetime DEFAULT NULL,
  `lastlogin_time` datetime DEFAULT NULL COMMENT '上一次登录时间',
  `lastlogin_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '上一次登录ip',
  `currentlogin_time` datetime DEFAULT NULL COMMENT '本次登录时间',
  `currentlogin_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '本次登录ip',
  `login_count` int(10) unsigned DEFAULT NULL,
  `forget_time` datetime DEFAULT NULL COMMENT '上次找回密码时间'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cloud_advise`
--
ALTER TABLE `cloud_advise`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cloud_notice`
--
ALTER TABLE `cloud_notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cloud_recommendedrule`
--
ALTER TABLE `cloud_recommendedrule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cloud_recommenderrule`
--
ALTER TABLE `cloud_recommenderrule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cloud_regcode`
--
ALTER TABLE `cloud_regcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cloud_software`
--
ALTER TABLE `cloud_software`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cloud_trial`
--
ALTER TABLE `cloud_trial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cloud_user`
--
ALTER TABLE `cloud_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cloud_advise`
--
ALTER TABLE `cloud_advise`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cloud_notice`
--
ALTER TABLE `cloud_notice`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cloud_recommendedrule`
--
ALTER TABLE `cloud_recommendedrule`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cloud_recommenderrule`
--
ALTER TABLE `cloud_recommenderrule`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `cloud_regcode`
--
ALTER TABLE `cloud_regcode`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `cloud_software`
--
ALTER TABLE `cloud_software`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cloud_trial`
--
ALTER TABLE `cloud_trial`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cloud_user`
--
ALTER TABLE `cloud_user`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

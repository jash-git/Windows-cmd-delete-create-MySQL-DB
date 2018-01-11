-- phpMyAdmin SQL Dump
-- version 4.0.4.2
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 產生日期: 2018 年 01 月 11 日 02:45
-- 伺服器版本: 5.1.44-community
-- PHP 版本: 5.4.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 資料庫: `v8_workstation`
--
CREATE DATABASE IF NOT EXISTS `test_DB` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `test_DB`;

-- --------------------------------------------------------

--
-- 表的結構 `apb_door`
--

CREATE TABLE IF NOT EXISTS `apb_door` (
  `apb_group_id` int(11) NOT NULL,
  `door_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的結構 `apb_group`
--

CREATE TABLE IF NOT EXISTS `apb_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `mode` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date` varchar(30) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `apb_group_extend`
--

CREATE TABLE IF NOT EXISTS `apb_group_extend` (
  `apb_group_id` int(11) NOT NULL,
  `reset_time_1` varchar(255) DEFAULT NULL,
  `reset_time_2` varchar(255) DEFAULT NULL,
  `reset_time_3` varchar(255) DEFAULT NULL,
  `reset_time_4` varchar(255) DEFAULT NULL,
  `reset_time_5` varchar(255) DEFAULT NULL,
  `reset_time_6` varchar(255) DEFAULT NULL,
  `reset_time_7` varchar(255) DEFAULT NULL,
  `reset_time_8` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的結構 `area`
--

CREATE TABLE IF NOT EXISTS `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `unit` int(11) NOT NULL DEFAULT '0',
  `descript` text,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `area_detail`
--

CREATE TABLE IF NOT EXISTS `area_detail` (
  `area_id` int(11) NOT NULL,
  `door_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的結構 `authorization`
--

CREATE TABLE IF NOT EXISTS `authorization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `datetime` varchar(30) DEFAULT NULL,
  `action` int(11) NOT NULL,
  `group_id_for_doors` int(11) DEFAULT NULL,
  `group_id_for_users` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `dep_id` int(11) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  `door_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `authorization_data`
--

CREATE TABLE IF NOT EXISTS `authorization_data` (
  `card_id` int(11) NOT NULL,
  `door_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `block` varchar(10) NOT NULL DEFAULT '0,0,0',
  `level` int(11) NOT NULL DEFAULT '1',
  `access_time_1_start` time NOT NULL DEFAULT '00:00:00',
  `access_time_1_end` time NOT NULL DEFAULT '23:59:00',
  `access_time_2_start` time NOT NULL DEFAULT '00:00:00',
  `access_time_2_end` time NOT NULL DEFAULT '00:00:00',
  `access_time_3_start` time NOT NULL DEFAULT '00:00:00',
  `access_time_3_end` time NOT NULL DEFAULT '00:00:00',
  `week_plan` int(11) NOT NULL DEFAULT '0',
  `available_date_start` varchar(25) NOT NULL DEFAULT 'now',
  `available_date_end` varchar(25) NOT NULL DEFAULT 'forever',
  `state` int(11) NOT NULL DEFAULT '0' COMMENT '[-1]->del,[0]->finish,[1]->send',
  PRIMARY KEY (`card_id`,`door_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的結構 `authorization_group`
--

CREATE TABLE IF NOT EXISTS `authorization_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `action` int(11) NOT NULL COMMENT '1 -> authorize,0 -> delete',
  `enable` int(11) NOT NULL DEFAULT '1',
  `card_type_enable` int(11) NOT NULL DEFAULT '0',
  `card_type` int(11) DEFAULT NULL,
  `effective_date_enable` int(11) NOT NULL DEFAULT '0',
  `effective_date_start` varchar(30) DEFAULT NULL,
  `effective_date_end` varchar(30) DEFAULT NULL,
  `card_status_enable` int(11) NOT NULL DEFAULT '0',
  `card_disable` int(11) NOT NULL DEFAULT '0',
  `card_black` int(11) NOT NULL DEFAULT '0',
  `card_apb_disable` int(11) NOT NULL DEFAULT '0',
  `card_level_enable` int(11) NOT NULL DEFAULT '0',
  `card_level` int(11) DEFAULT NULL,
  `card_week_time_enable` int(11) NOT NULL DEFAULT '0',
  `card_week` int(11) NOT NULL DEFAULT '0',
  `card_time_period01` varchar(20) NOT NULL DEFAULT '00:00~00:00',
  `card_time_period02` varchar(20) NOT NULL DEFAULT '00:00~00:00',
  `card_time_period03` varchar(20) NOT NULL DEFAULT '00:00~00:00',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '[-1]->del,[0]->unknown,[1]->send',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `authorization_group_detailed`
--

CREATE TABLE IF NOT EXISTS `authorization_group_detailed` (
  `authorization_group_id` int(11) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `data_type` int(11) DEFAULT NULL COMMENT '[1]->door_group,[2]->door,[-1]->card_group,[-2]->card',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '[-1]->del,[0]->unknown,[1]->send'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的結構 `car`
--

CREATE TABLE IF NOT EXISTS `car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias_name` varchar(255) DEFAULT NULL,
  `pic` longtext,
  `administrator_name` varchar(255) DEFAULT NULL,
  `administrator_tel` varchar(255) DEFAULT NULL,
  `m_liter` int(11) DEFAULT NULL,
  `weight` decimal(10,0) DEFAULT NULL,
  `factory_date` varchar(30) DEFAULT NULL,
  `put_up_date` varchar(30) DEFAULT NULL,
  `break_up_date` varchar(30) DEFAULT NULL,
  `asset_no` varchar(255) DEFAULT NULL,
  `licence` varchar(255) DEFAULT NULL,
  `parking_space_no` varchar(255) DEFAULT NULL,
  `take_care_tel` varchar(255) DEFAULT NULL,
  `take_care_mobile` varchar(255) DEFAULT NULL,
  `take_care_address` varchar(255) DEFAULT NULL,
  `note` text,
  `status` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `card`
--

CREATE TABLE IF NOT EXISTS `card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `card_code` varchar(255) NOT NULL,
  `display` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `pin` varchar(255) NOT NULL DEFAULT 'FFFFFFFFFFFFFFFF',
  `type` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '1',
  `level` int(11) NOT NULL DEFAULT '1',
  `block` int(11) NOT NULL DEFAULT '0',
  `apb_level_value` int(11) NOT NULL DEFAULT '1',
  `apb_enable` int(11) NOT NULL DEFAULT '1',
  `available_date_start` varchar(30) NOT NULL,
  `available_date_end` varchar(30) NOT NULL,
  `week_plan` varchar(255) NOT NULL DEFAULT '11111111',
  `access_time_1_start` time NOT NULL DEFAULT '00:00:00',
  `access_time_1_end` time NOT NULL DEFAULT '23:59:00',
  `access_time_2_start` time NOT NULL DEFAULT '00:00:00',
  `access_time_2_end` time NOT NULL DEFAULT '00:00:00',
  `access_time_3_start` time NOT NULL DEFAULT '00:00:00',
  `access_time_3_end` time NOT NULL DEFAULT '00:00:00',
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `card_for_user_car`
--

CREATE TABLE IF NOT EXISTS `card_for_user_car` (
  `card_id` int(11) NOT NULL,
  `user_id` int(255) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  UNIQUE KEY `card_id` (`card_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的結構 `card_type`
--

CREATE TABLE IF NOT EXISTS `card_type` (
  `id` int(11) NOT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的結構 `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的結構 `controller`
--

CREATE TABLE IF NOT EXISTS `controller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` int(11) DEFAULT NULL,
  `model` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `pic` longtext,
  `sydm_id` int(11) NOT NULL DEFAULT '0',
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `controller_dm`
--

CREATE TABLE IF NOT EXISTS `controller_dm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` int(11) DEFAULT NULL,
  `model` int(11) DEFAULT NULL,
  `connetction_enabled` int(11) DEFAULT NULL,
  `connetction_mode` int(11) DEFAULT NULL,
  `connetction_address` int(11) DEFAULT NULL,
  `ab_door_enabled` int(11) DEFAULT NULL,
  `ab_door_level` int(11) DEFAULT NULL,
  `ab_door_timeout_second` int(11) DEFAULT NULL,
  `ab_door_reset_time_second` int(11) DEFAULT NULL,
  `apb_enabled` int(11) DEFAULT NULL,
  `apb_mode` int(11) DEFAULT NULL,
  `apb_group` int(11) DEFAULT NULL,
  `apb_level_list` text,
  `apb_reset_timestamp_list` text,
  `holiday_of_months_field_flags` text,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `controller_extend`
--

CREATE TABLE IF NOT EXISTS `controller_extend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `controller_sn` int(11) NOT NULL,
  `connetction_address` varchar(255) DEFAULT NULL,
  `connetction_enabled` int(11) DEFAULT NULL,
  `connetction_mode` int(11) DEFAULT NULL,
  `apb_enable` int(11) DEFAULT NULL,
  `apb_mode` int(11) DEFAULT NULL,
  `apb_group` int(11) DEFAULT NULL,
  `apb_level_list` text,
  `apb_reset_timestamp_list` text,
  `ab_door_enabled` int(11) DEFAULT NULL,
  `ab_door_level` int(11) DEFAULT NULL,
  `ab_door_timeout_second` int(11) DEFAULT NULL,
  `ab_door_reset_time_second` int(11) DEFAULT NULL,
  `port` int(11) NOT NULL DEFAULT '5001',
  `door_number` int(11) NOT NULL DEFAULT '1',
  `same_card_interval_time_second` int(11) NOT NULL DEFAULT '3',
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `department`
--

CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `descript` text,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `department_detail`
--

CREATE TABLE IF NOT EXISTS `department_detail` (
  `dep_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的結構 `door`
--

CREATE TABLE IF NOT EXISTS `door` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `controller_id` int(11) DEFAULT NULL,
  `controller_door_index` int(11) NOT NULL DEFAULT '0',
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `door_extend`
--

CREATE TABLE IF NOT EXISTS `door_extend` (
  `door_id` int(11) NOT NULL,
  `base` text,
  `pass` text,
  `open` text,
  `anti_de` text,
  `detect` text,
  `button` text,
  `anti_co` text,
  `overtime` text,
  `violent` text,
  `pass_mode` text,
  `auto_mode` text,
  `apb_group_id` int(11) NOT NULL DEFAULT '-1',
  `apb_used` int(11) NOT NULL DEFAULT '0',
  `apb_level` int(11) NOT NULL DEFAULT '1',
  `state` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的結構 `door_group`
--

CREATE TABLE IF NOT EXISTS `door_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `enable` int(11) NOT NULL,
  `param_enable` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `available_date_start` varchar(30) DEFAULT NULL,
  `available_date_end` varchar(30) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `door_group_detail`
--

CREATE TABLE IF NOT EXISTS `door_group_detail` (
  `door_group_id` int(11) NOT NULL,
  `area_id` int(11) DEFAULT NULL,
  `door_id` int(11) DEFAULT NULL,
  `floor_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的結構 `floor`
--

CREATE TABLE IF NOT EXISTS `floor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `door_id` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `holiday`
--

CREATE TABLE IF NOT EXISTS `holiday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `date` varchar(30) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `controller_id` int(11) NOT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `models`
--

CREATE TABLE IF NOT EXISTS `models` (
  `model` int(11) DEFAULT NULL,
  `model_name` text,
  `apb` int(11) DEFAULT NULL,
  `door_number` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的結構 `sydm`
--

CREATE TABLE IF NOT EXISTS `sydm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `system_config`
--

CREATE TABLE IF NOT EXISTS `system_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `employee_date` varchar(30) DEFAULT NULL,
  `unemployee_date` varchar(30) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias_name` varchar(255) DEFAULT NULL,
  `pic` longtext,
  `gender` int(11) DEFAULT NULL,
  `attribute` varchar(255) DEFAULT NULL,
  `birthday` varchar(30) DEFAULT NULL,
  `emp_no` varchar(255) DEFAULT NULL,
  `security_id` varchar(255) DEFAULT NULL,
  `passport_id` varchar(255) DEFAULT NULL,
  `office_tel` varchar(255) DEFAULT NULL,
  `home_tel` varchar(255) DEFAULT NULL,
  `cell_phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `family_address` varchar(255) DEFAULT NULL,
  `contact_address` varchar(255) DEFAULT NULL,
  `emergency_contactor` varchar(255) DEFAULT NULL,
  `emergency_tel` varchar(255) DEFAULT NULL,
  `note` text NOT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `user_car_group`
--

CREATE TABLE IF NOT EXISTS `user_car_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `enable` int(11) NOT NULL DEFAULT '1',
  `card_type_enable` int(11) NOT NULL DEFAULT '0',
  `card_type` int(11) DEFAULT NULL,
  `effective_date_enable` int(11) NOT NULL DEFAULT '0',
  `effective_date_start` varchar(30) DEFAULT NULL,
  `effective_date_end` varchar(30) DEFAULT NULL,
  `card_status_enable` int(11) NOT NULL DEFAULT '0',
  `card_disable` int(11) NOT NULL DEFAULT '0',
  `card_black` int(11) NOT NULL DEFAULT '0',
  `card_apb_disable` int(11) NOT NULL DEFAULT '0',
  `card_level_enable` int(11) NOT NULL DEFAULT '0',
  `card_level` int(11) DEFAULT NULL,
  `card_week_time_enable` int(11) NOT NULL DEFAULT '0',
  `card_week` int(11) NOT NULL DEFAULT '0',
  `card_time_period01` varchar(20) NOT NULL DEFAULT '00:00~00:00',
  `card_time_period02` varchar(20) NOT NULL DEFAULT '00:00~00:00',
  `card_time_period03` varchar(20) NOT NULL DEFAULT '00:00~00:00',
  `state` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的結構 `user_car_group_detailed`
--

CREATE TABLE IF NOT EXISTS `user_car_group_detailed` (
  `user_car_group_id` int(11) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的結構 `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `enable` int(11) NOT NULL,
  `dep_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  `param_enable` int(11) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `available_date_start` varchar(30) DEFAULT NULL,
  `available_date_end` varchar(30) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

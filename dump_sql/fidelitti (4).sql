-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 08 2017 г., 18:31
-- Версия сервера: 5.6.34
-- Версия PHP: 5.6.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `fidelitti`
--

-- --------------------------------------------------------

--
-- Структура таблицы `oc_address`
--

CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_affiliate`
--

CREATE TABLE `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_affiliate_activity`
--

CREATE TABLE `oc_affiliate_activity` (
  `affiliate_activity_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_affiliate_login`
--

CREATE TABLE `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_affiliate_transaction`
--

CREATE TABLE `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api`
--

CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `name`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'iOGb0Dau54pFVaNr4kme5OKu3eojmp2YqoKLdjOA6GM9qEhNiNboPCidk7oQejRb2GFomUVGqimR5giPSLGSlGK0KgQQlzZhX03xiZhfJAkQYCPt9mErlEIPOsxvDR3qeD2PnWHoGRwO5z4zgeBSONsqboJiqxqTeVemSVx3SC10uk2mWPwQu1PBUksDenOWswSX2UmLRbKDGR9qlC4IJrsaSxVFWE16qla0oTxhZ7mGBx5Qzm4qUE5jjHucZbwN', 1, '2016-07-18 12:05:12', '2016-07-18 12:05:12');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api_ip`
--

CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_api_ip`
--

INSERT INTO `oc_api_ip` (`api_ip_id`, `api_id`, `ip`) VALUES
(1, 1, '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api_session`
--

CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_api_session`
--

INSERT INTO `oc_api_session` (`api_session_id`, `api_id`, `token`, `session_id`, `session_name`, `ip`, `date_added`, `date_modified`) VALUES
(28, 1, '1Qoo2RfjDqzxvN8ahMf9eSerDh5HBwoW', 's1aqb2hee7msbgol7jcmffhaa3', 'temp_session_59899a6e77059', '127.0.0.1', '2017-08-08 14:03:10', '2017-08-08 14:03:41'),
(27, 1, 'SMvh3gBIDC79rQDJflaJu9CJEATnRAHR', 's1aqb2hee7msbgol7jcmffhaa3', 'temp_session_59899a6a2b8f5', '127.0.0.1', '2017-08-08 14:03:06', '2017-08-08 14:03:06'),
(30, 1, 'F3mRAXMMNXQFSvkm0R3PAMJ7n4Fzz4EE', 's1aqb2hee7msbgol7jcmffhaa3', 'temp_session_59899a9c03d35', '127.0.0.1', '2017-08-08 14:03:56', '2017-08-08 14:03:56'),
(29, 1, 'D3GC6rZjnv4PqcrwS1bWbbGmkel23IUj', 's1aqb2hee7msbgol7jcmffhaa3', 'temp_session_59899a98a527f', '127.0.0.1', '2017-08-08 14:03:52', '2017-08-08 14:03:52');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute`
--

CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(12, 7, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_description`
--

CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(12, 4, '123'),
(12, 2, '123'),
(12, 3, '123');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_group`
--

CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(7, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_group_description`
--

CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(7, 4, '111'),
(7, 2, '111'),
(7, 3, '111');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_banner`
--

CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_banner_image`
--

CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`) VALUES
(79, 7, 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(87, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(94, 8, '', 'catalog/demo/manufacturer/nfl.png', 0),
(95, 8, '', 'catalog/demo/manufacturer/redbull.png', 0),
(96, 8, '', 'catalog/demo/manufacturer/sony.png', 0),
(91, 8, '', 'catalog/demo/manufacturer/cocacola.png', 0),
(92, 8, '', 'catalog/demo/manufacturer/burgerking.png', 0),
(93, 8, '', 'catalog/demo/manufacturer/canon.png', 0),
(88, 8, '', 'catalog/demo/manufacturer/harley.png', 0),
(89, 8, '', 'catalog/demo/manufacturer/dell.png', 0),
(90, 8, '', 'catalog/demo/manufacturer/disney.png', 0),
(80, 7, '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(97, 8, '', 'catalog/demo/manufacturer/starbucks.png', 0),
(98, 8, '', 'catalog/demo/manufacturer/nintendo.png', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_banner_image_description`
--

CREATE TABLE `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_banner_image_description`
--

INSERT INTO `oc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(79, 2, 7, 'iPhone 6'),
(87, 2, 6, 'HP Banner'),
(93, 2, 8, 'Canon'),
(92, 2, 8, 'Burger King'),
(91, 2, 8, 'Coca Cola'),
(90, 2, 8, 'Disney'),
(89, 2, 8, 'Dell'),
(80, 2, 7, 'MacBookAir'),
(88, 2, 8, 'Harley Davidson'),
(94, 2, 8, 'NFL'),
(95, 2, 8, 'RedBull'),
(96, 2, 8, 'Sony'),
(97, 2, 8, 'Starbucks'),
(98, 2, 8, 'Nintendo'),
(79, 3, 7, 'iPhone 6'),
(87, 3, 6, 'HP Banner'),
(93, 3, 8, 'Canon'),
(92, 3, 8, 'Burger King'),
(91, 3, 8, 'Coca Cola'),
(90, 3, 8, 'Disney'),
(89, 3, 8, 'Dell'),
(80, 3, 7, 'MacBookAir'),
(88, 3, 8, 'Harley Davidson'),
(94, 3, 8, 'NFL'),
(95, 3, 8, 'RedBull'),
(96, 3, 8, 'Sony'),
(97, 3, 8, 'Starbucks'),
(98, 3, 8, 'Nintendo'),
(79, 4, 7, 'iPhone 6'),
(87, 4, 6, 'HP Banner'),
(93, 4, 8, 'Canon'),
(92, 4, 8, 'Burger King'),
(91, 4, 8, 'Coca Cola'),
(90, 4, 8, 'Disney'),
(89, 4, 8, 'Dell'),
(80, 4, 7, 'MacBookAir'),
(88, 4, 8, 'Harley Davidson'),
(94, 4, 8, 'NFL'),
(95, 4, 8, 'RedBull'),
(96, 4, 8, 'Sony'),
(97, 4, 8, 'Starbucks'),
(98, 4, 8, 'Nintendo');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog`
--

CREATE TABLE `oc_blog` (
  `blog_id` int(11) NOT NULL,
  `allow_comment` int(1) NOT NULL DEFAULT '1',
  `count_read` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `oc_blog`
--

INSERT INTO `oc_blog` (`blog_id`, `allow_comment`, `count_read`, `sort_order`, `status`, `author`, `date_added`, `image`) VALUES
(16, 1, 2, 0, 1, 'John', '2016-07-20 10:39:38', 'catalog/1456944747naturehike.jpg'),
(17, 1, 0, 0, 1, 'John', '2016-07-20 10:40:07', 'catalog/bluebird-640x400-1.jpg'),
(18, 1, 0, 0, 1, 'John', '2016-07-20 10:40:39', 'catalog/Fall-beautiful-nature-22666764-900-562.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_category`
--

CREATE TABLE `oc_blog_category` (
  `blog_category_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `oc_blog_category`
--

INSERT INTO `oc_blog_category` (`blog_category_id`, `parent_id`, `sort_order`, `date_added`, `status`) VALUES
(49, 0, 0, '2016-07-20 10:43:11', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_category_description`
--

CREATE TABLE `oc_blog_category_description` (
  `blog_category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `meta_keywords` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `oc_blog_category_description`
--

INSERT INTO `oc_blog_category_description` (`blog_category_id`, `language_id`, `name`, `page_title`, `meta_keywords`, `meta_description`, `description`) VALUES
(49, 2, 'tests cat', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_category_to_layout`
--

CREATE TABLE `oc_blog_category_to_layout` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_category_to_store`
--

CREATE TABLE `oc_blog_category_to_store` (
  `blog_category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `oc_blog_category_to_store`
--

INSERT INTO `oc_blog_category_to_store` (`blog_category_id`, `store_id`) VALUES
(49, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_comment`
--

CREATE TABLE `oc_blog_comment` (
  `blog_comment_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `date_added` datetime DEFAULT '0000-00-00 00:00:00',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_description`
--

CREATE TABLE `oc_blog_description` (
  `blog_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8_bin NOT NULL,
  `page_title` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `short_description` text COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `tags` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `oc_blog_description`
--

INSERT INTO `oc_blog_description` (`blog_id`, `language_id`, `title`, `page_title`, `meta_keyword`, `meta_description`, `short_description`, `description`, `tags`) VALUES
(16, 2, 'Blog Test 1', 'Test ', '', '', '', '&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \r\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \r\ncommodo consequat. Duis aute irure dolor in reprehenderit in voluptate \r\nvelit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint \r\noccaecat cupidatat non proident, sunt in culpa qui officia deserunt \r\nmollit anim id est laborum.&lt;/p&gt;&lt;p&gt;Sed ut perspiciatis unde omnis iste natus error sit voluptatem \r\naccusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab\r\n illo inventore veritatis et quasi architecto beatae vitae dicta sunt \r\nexplicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut \r\nodit aut fugit, sed quia consequuntur magni dolores eos qui ratione \r\nvoluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum \r\nquia dolor sit amet, consectetur, adipisci velit, sed quia non numquam \r\neius modi tempora incidunt ut labore et dolore magnam aliquam quaerat \r\nvoluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam \r\ncorporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?\r\n Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse \r\nquam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo \r\nvoluptas nulla pariatur?&lt;/p&gt;&lt;p&gt;But I must explain to you how all this mistaken idea of denouncing \r\npleasure and praising pain was born and I will give you a complete \r\naccount of the system, and expound the actual teachings of the great \r\nexplorer of the truth, the master-builder of human happiness. No one \r\nrejects, dislikes, or avoids pleasure itself, because it is pleasure, \r\nbut because those who do not know how to pursue pleasure rationally \r\nencounter consequences that are extremely painful. Nor again is there \r\nanyone who loves or pursues or desires to obtain pain of itself, because\r\n it is pain, but because occasionally circumstances occur in which toil \r\nand pain can procure him some great pleasure. To take a trivial example,\r\n which of us ever undertakes laborious physical exercise, except to \r\nobtain some advantage from it? But who has any right to find fault with a\r\n man who chooses to enjoy a pleasure that has no annoying consequences, \r\nor one who avoids a pain that produces no resultant pleasure?&lt;br&gt;&lt;/p&gt;', ''),
(17, 2, 'Blog Test 2', 'Test 2', '', '', '', '&lt;p style=&quot;line-height: 17.1428px;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;&lt;p style=&quot;line-height: 17.1428px;&quot;&gt;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&lt;/p&gt;&lt;p style=&quot;line-height: 17.1428px;&quot;&gt;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&lt;/p&gt;', ''),
(18, 2, 'Blog Test 3', 'Test 3', '', '', '', '&lt;p style=&quot;line-height: 17.1428px;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;&lt;hr&gt;&lt;p style=&quot;line-height: 17.1428px;&quot;&gt;&lt;span style=&quot;line-height: 17.1428px;&quot;&gt;Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;line-height: 17.1428px;&quot;&gt;But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?&lt;/p&gt;', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_related`
--

CREATE TABLE `oc_blog_related` (
  `parent_blog_id` int(11) NOT NULL DEFAULT '0',
  `child_blog_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_to_category`
--

CREATE TABLE `oc_blog_to_category` (
  `blog_id` int(11) NOT NULL,
  `blog_category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `oc_blog_to_category`
--

INSERT INTO `oc_blog_to_category` (`blog_id`, `blog_category_id`) VALUES
(16, 49),
(17, 49),
(18, 49);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_to_layout`
--

CREATE TABLE `oc_blog_to_layout` (
  `blog_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_blog_to_store`
--

CREATE TABLE `oc_blog_to_store` (
  `blog_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `oc_blog_to_store`
--

INSERT INTO `oc_blog_to_store` (`blog_id`, `store_id`) VALUES
(16, 0),
(17, 0),
(18, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_cart`
--

CREATE TABLE `oc_cart` (
  `cart_id` int(11) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_cart`
--

INSERT INTO `oc_cart` (`cart_id`, `customer_id`, `session_id`, `product_id`, `recurring_id`, `option`, `quantity`, `date_added`) VALUES
(2, 0, 's1aqb2hee7msbgol7jcmffhaa3', 438, 0, '[]', 1, '2017-08-08 17:33:44'),
(3, 0, '4aal2qha5b973jovc0v43h6p35', 355, 0, '[]', 1, '2017-08-08 18:10:21');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category`
--

CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(27, 'catalog/category/_dsc3858.png', 61, 0, 0, 6, 1, '2009-01-31 01:55:34', '2017-06-12 12:39:05'),
(20, 'catalog/category/img_2.jpg', 0, 1, 1, 1, 1, '2009-01-05 21:49:43', '2017-08-07 15:25:22'),
(64, '', 61, 0, 1, 2, 1, '2017-02-20 11:11:44', '2017-06-12 12:38:54'),
(65, '', 20, 0, 1, 2, 1, '2017-02-20 11:12:31', '2017-06-12 12:38:01'),
(66, '', 65, 0, 1, 0, 1, '2017-02-20 11:14:20', '2017-06-12 12:39:19'),
(67, '', 65, 0, 1, 2, 1, '2017-02-20 11:15:11', '2017-06-12 12:39:25'),
(57, 'catalog/category/borsellino_black_blue.png', 61, 0, 1, 7, 1, '2011-04-26 08:53:16', '2017-06-12 12:39:11'),
(59, '', 61, 0, 1, 1, 1, '2017-02-20 10:47:47', '2017-07-13 22:09:58'),
(60, '', 61, 0, 1, 2, 1, '2017-02-20 11:02:03', '2017-06-12 12:38:41'),
(61, '', 20, 0, 1, 1, 1, '2017-02-20 11:03:13', '2017-06-12 12:37:55'),
(62, '', 61, 0, 1, 5, 1, '2017-02-20 11:04:07', '2017-06-12 12:38:59'),
(68, '', 20, 0, 1, 3, 0, '2017-02-20 11:16:27', '2017-06-16 12:58:52'),
(69, '', 20, 0, 1, 4, 1, '2017-02-20 11:17:22', '2017-06-12 12:38:18'),
(70, 'catalog/category/men.jpg', 0, 1, 1, 2, 1, '2017-02-20 11:18:19', '2017-07-01 16:42:32'),
(71, '', 70, 0, 1, 2, 1, '2017-02-20 11:19:04', '2017-06-12 12:39:34'),
(72, '', 70, 0, 1, 3, 1, '2017-02-20 11:19:38', '2017-06-12 12:39:40'),
(90, '', 61, 0, 1, 0, 1, '2017-05-05 16:28:22', '2017-05-05 16:28:22'),
(91, '', 20, 1, 1, 100, 1, '2017-05-05 16:30:47', '2017-06-12 12:38:28'),
(92, '', 91, 0, 1, 0, 1, '2017-06-13 14:40:31', '2017-06-13 14:40:31'),
(93, '', 91, 0, 1, 1, 1, '2017-06-13 14:41:14', '2017-06-16 12:20:04');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_description`
--

CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(20, 4, 'Для жінок', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;\r\n', 'H1 заголовок Комьпютеров', '', ''),
(20, 2, 'Для женщин', '&lt;p&gt;1234567890&lt;/p&gt;\r\n', 'H1 заголовок Комьпютеров', '', ''),
(20, 3, 'For women', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;\r\n', 'Example of category description', '', ''),
(27, 2, 'Рюкзаки', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', ''),
(27, 3, 'Backpacks', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', ''),
(27, 4, 'Рюкзаки', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', ''),
(57, 2, 'Клатчи', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', ''),
(57, 3, 'Clutches', '', '', '', ''),
(57, 4, 'Клатчі', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', ''),
(59, 2, 'Сумки с короткими ручками', '', '', '', ''),
(59, 3, 'Totes', '', '', '', ''),
(59, 4, 'Сумки з короткими ручками', '', '', '', ''),
(60, 2, 'Сумки на плечо', '', '', '', ''),
(60, 3, 'Shoulder Bags', '', '', '', ''),
(60, 4, 'Сумки на плече', '', '', '', ''),
(61, 2, 'Сумки', '', '', '', ''),
(61, 3, 'Bags', '', '', '', ''),
(61, 4, 'Сумки', '', '', '', ''),
(62, 2, 'Мини сумки', '', '', '', ''),
(62, 3, 'Mini Bags', '', '', '', ''),
(62, 4, 'Міні сумки', '', '', '', ''),
(64, 2, 'Сумки через плечо', '', '', '', ''),
(64, 3, 'Satchels', '', '', '', ''),
(64, 4, 'Сумки через плече', '', '', '', ''),
(65, 2, 'Аксессуары ', '', '', '', ''),
(65, 3, 'Accessories ', '', '', '', ''),
(65, 4, 'Аксесуари ', '', '', '', ''),
(66, 2, 'Ремни', '', '', '', ''),
(66, 3, 'Belts', '', '', '', ''),
(66, 4, 'Ремені', '', '', '', ''),
(67, 2, 'Кошельки', '', '', '', ''),
(67, 3, 'Wallets', '', '', '', ''),
(67, 4, 'Гаманці', '', '', '', ''),
(68, 2, 'Коллаборации', '', '', '', ''),
(68, 3, 'Collaborations', '', '', '', ''),
(68, 4, 'Колаборації', '', '', '', ''),
(69, 2, 'Скидки', '', '', '', ''),
(69, 3, 'Sale', '', '', '', ''),
(69, 4, 'Знижки', '', '', '', ''),
(70, 2, 'Для мужчин', '', '', '', ''),
(70, 3, 'For men', '', '', '', ''),
(70, 4, 'Для чоловіків', '', '', '', ''),
(71, 2, 'Сумки', '', '', '', ''),
(71, 3, 'Bags', '', '', '', ''),
(71, 4, 'Сумки', '', '', '', ''),
(72, 2, 'Аксессуары', '', '', '', ''),
(72, 3, 'Accessories', '', '', '', ''),
(72, 4, 'Аксесуари', '', '', '', ''),
(91, 2, 'OUTLET', '', '', '', ''),
(91, 3, 'OUTLET', '', '', '', ''),
(91, 4, 'OUTLET', '', '', '', ''),
(92, 2, 'Сумки', '', '', '', ''),
(92, 3, 'Bags', '', '', '', ''),
(92, 4, 'Сумки', '', '', '', ''),
(93, 2, 'Аксессуары', '', '', '', ''),
(93, 3, 'Accessories', '', '', '', ''),
(93, 4, 'Аксесуари', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_filter`
--

CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_path`
--

CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(20, 20, 0),
(27, 27, 2),
(27, 61, 1),
(60, 61, 1),
(59, 20, 0),
(57, 57, 2),
(57, 20, 0),
(59, 59, 2),
(59, 61, 1),
(60, 60, 2),
(60, 20, 0),
(61, 61, 1),
(61, 20, 0),
(62, 62, 2),
(62, 20, 0),
(62, 61, 1),
(27, 20, 0),
(57, 61, 1),
(64, 64, 2),
(64, 20, 0),
(64, 61, 1),
(65, 65, 1),
(65, 20, 0),
(66, 66, 2),
(66, 65, 1),
(66, 20, 0),
(67, 20, 0),
(67, 67, 2),
(67, 65, 1),
(68, 68, 1),
(68, 20, 0),
(69, 20, 0),
(69, 69, 1),
(70, 70, 0),
(71, 71, 1),
(71, 70, 0),
(72, 72, 1),
(72, 70, 0),
(91, 20, 0),
(92, 20, 0),
(91, 91, 1),
(92, 91, 1),
(92, 92, 2),
(93, 91, 1),
(93, 20, 0),
(93, 93, 2),
(86, 86, 2),
(86, 61, 1),
(86, 20, 0),
(87, 87, 2),
(87, 61, 1),
(87, 20, 0),
(88, 88, 2),
(88, 61, 1),
(88, 20, 0),
(89, 89, 2),
(89, 61, 1),
(89, 20, 0),
(90, 90, 2),
(90, 61, 1),
(90, 20, 0),
(84, 84, 0),
(85, 85, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_to_layout`
--

CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(91, 0, 0),
(64, 0, 0),
(64, 5, 0),
(27, 0, 0),
(27, 6, 0),
(57, 0, 0),
(57, 6, 0),
(59, 6, 0),
(59, 0, 0),
(60, 6, 0),
(60, 0, 0),
(61, 6, 0),
(62, 6, 0),
(62, 0, 0),
(65, 0, 0),
(65, 6, 0),
(66, 0, 0),
(66, 6, 0),
(67, 6, 0),
(67, 0, 0),
(68, 5, 0),
(68, 6, 0),
(69, 0, 0),
(69, 6, 0),
(70, 6, 0),
(71, 6, 0),
(71, 0, 0),
(72, 0, 0),
(72, 6, 0),
(70, 0, 0),
(61, 0, 0),
(91, 5, 0),
(20, 0, 0),
(61, 5, 0),
(65, 5, 0),
(68, 0, 0),
(69, 5, 0),
(91, 6, 0),
(59, 5, 0),
(60, 5, 0),
(64, 6, 0),
(62, 5, 0),
(27, 5, 0),
(57, 5, 0),
(66, 5, 0),
(67, 5, 0),
(71, 5, 0),
(72, 5, 0),
(92, 0, 0),
(92, 6, 0),
(92, 5, 0),
(93, 5, 0),
(93, 0, 0),
(93, 6, 0),
(70, 5, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_to_store`
--

CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(20, 0),
(27, 0),
(27, 5),
(27, 6),
(57, 0),
(57, 5),
(57, 6),
(59, 0),
(59, 5),
(59, 6),
(60, 0),
(60, 5),
(60, 6),
(61, 0),
(61, 5),
(61, 6),
(62, 0),
(62, 5),
(62, 6),
(64, 0),
(64, 5),
(64, 6),
(65, 0),
(65, 5),
(65, 6),
(66, 0),
(66, 5),
(66, 6),
(67, 0),
(67, 5),
(67, 6),
(68, 0),
(68, 5),
(68, 6),
(69, 0),
(69, 5),
(69, 6),
(70, 0),
(70, 5),
(70, 6),
(71, 0),
(71, 5),
(71, 6),
(72, 0),
(72, 5),
(72, 6),
(91, 0),
(91, 5),
(91, 6),
(92, 0),
(92, 5),
(92, 6),
(93, 0),
(93, 5),
(93, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_country`
--

CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D\'Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'South Korea', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People\'s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon`
--

CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 1, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '0000-00-00', '0000-00-00', 0, '0', 1, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_category`
--

CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_history`
--

CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_product`
--

CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_currency`
--

CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(4, 'Гривна', 'UAH', '', '', '2', 1.00000000, 1, '2017-08-08 17:06:51');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer`
--

CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_activity`
--

CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_activity`
--

INSERT INTO `oc_customer_activity` (`customer_activity_id`, `customer_id`, `key`, `data`, `ip`, `date_added`) VALUES
(1, 1, 'register', '{\"customer_id\":1,\"name\":\"Test1 admin\"}', '127.0.0.1', '2016-07-21 16:13:02'),
(2, 1, 'order_account', '{\"customer_id\":\"1\",\"name\":\"Test1 admin\",\"order_id\":1}', '127.0.0.1', '2016-07-21 16:13:23'),
(3, 0, 'order_guest', '{\"name\":\"qwer qwer\",\"order_id\":11}', '127.0.0.1', '2017-07-25 17:59:13');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_group`
--

CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_group_description`
--

CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 2, 'Default', 'test'),
(1, 3, 'Default', 'test');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_history`
--

CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_ip`
--

CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_login`
--

CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_customer_login`
--

INSERT INTO `oc_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(1, '', '127.0.0.1', 2, '2017-07-21 18:22:19', '2017-08-01 15:41:44');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_online`
--

CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_reward`
--

CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_transaction`
--

CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_wishlist`
--

CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field`
--

CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_customer_group`
--

CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_description`
--

CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_value`
--

CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_value_description`
--

CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_download`
--

CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_download_description`
--

CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_event`
--

CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_extension`
--

CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(1432, 'module', 'revslideropencart'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(1431, 'module', 'cosyone_productbrand'),
(15, 'total', 'reward'),
(17, 'payment', 'free_checkout'),
(1429, 'module', 'cosyone_deals'),
(20, 'theme', 'theme_default'),
(1428, 'module', 'cosyone'),
(1433, 'module', 'revslideroutput'),
(1434, 'module', 'cosyone_bannerwall'),
(1435, 'module', 'showintabs'),
(1436, 'module', 'showintabs_output'),
(1438, 'module', 'cosyone_testimonial'),
(1441, 'module', 'cosyone_content'),
(1442, 'module', 'cosyone_twitterfeed'),
(1443, 'module', 'cosyone_socials'),
(1444, 'module', 'cosyone_category'),
(1445, 'module', 'newsletter'),
(1446, 'module', 'cosyone_recently'),
(1448, 'module', 'd_ajax_search'),
(1449, 'module', 'cosyone_banner'),
(1450, 'module', 'cosyone_carousel'),
(1452, 'module', 'faqmanager'),
(1455, 'module', 'category'),
(1459, 'module', 'adv_ajaxfilter'),
(1458, 'module', 'mega_filter'),
(1460, 'module', 'quickcheckout');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter`
--

CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_description`
--

CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_group`
--

CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_group_description`
--

CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_geo_zone`
--

CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information`
--

CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_description`
--

CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 2, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', 'About Us', '', ''),
(5, 2, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Terms &amp; Conditions', '', ''),
(3, 2, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', 'Privacy Policy', '', ''),
(6, 2, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Delivery Information', '', ''),
(4, 3, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', 'About Us', '', ''),
(5, 3, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Terms &amp; Conditions', '', ''),
(3, 3, 'Privacy Policy', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', 'Privacy Policy', '', ''),
(6, 3, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Delivery Information', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_to_layout`
--

CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_to_store`
--

CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_language`
--

CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(2, 'rus', 'ru-ru', '', '', '', 2, 1),
(3, 'eng', 'en-gb', '', '', '', 1, 1),
(4, 'ukr', 'uk-ua', '', '', '', 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout`
--

CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search'),
(14, 'Footer'),
(15, 'Mega Filter PRO');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout_module`
--

CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(142, 5, 'cosyone_category', 'column_left', 1),
(150, 10, 'account', 'column_left', 1),
(172, 6, 'account', 'column_left', 1),
(200, 1, 'cosyone_content.39', 'content_bottom', 7),
(146, 8, 'cosyone_category', 'column_left', 1),
(199, 1, 'cosyone_testimonial.37', 'content_bottom', 5),
(198, 1, 'cosyone_carousel.36', 'content_bottom', 4),
(168, 14, 'cosyone_socials.40', 'footer', 2),
(167, 14, 'cosyone_twitterfeed', 'footer', 1),
(202, 2, 'cosyone_recently.44', 'content_bottom', 1),
(141, 5, 'newsletter.42', 'column_left', 3),
(140, 5, 'cosyone_banner.32', 'column_left', 2),
(143, 13, 'cosyone_category', 'column_left', 1),
(144, 13, 'cosyone_banner.32', 'column_left', 2),
(145, 13, 'newsletter.42', 'column_left', 3),
(147, 8, 'cosyone_banner.32', 'column_left', 2),
(148, 8, 'newsletter.42', 'column_left', 3),
(214, 3, 'adv_ajaxfilter', 'content_top', 0),
(197, 1, 'cosyone_bannerwall.34', 'content_bottom', 2),
(213, 3, 'newsletter.42', 'content_bottom', 4),
(201, 1, 'revslideroutput.33', 'content_top', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout_route`
--

CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(88, 6, 0, 'account/%'),
(81, 10, 0, 'affiliate/%'),
(124, 3, 0, 'product/special'),
(97, 1, 0, 'common/home'),
(98, 2, 0, 'product/product'),
(78, 11, 0, 'information/information'),
(86, 7, 0, 'checkout/%'),
(79, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(75, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(77, 13, 0, 'product/search'),
(64, 15, 0, 'blog/%'),
(76, 5, 0, 'product/manufacturer/info'),
(87, 7, 0, 'quickcheckout/%'),
(89, 15, 0, 'module/mega_filter/results'),
(123, 3, 0, 'product/category');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_length_class`
--

CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_length_class_description`
--

CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 2, 'Centimeter', 'cm'),
(2, 2, 'Millimeter', 'mm'),
(3, 2, 'Inch', 'in'),
(1, 3, 'Centimeter', 'cm'),
(2, 3, 'Millimeter', 'mm'),
(3, 3, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_location`
--

CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer`
--

CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer_to_store`
--

CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_marketing`
--

CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_mfilter_url_alias`
--

CREATE TABLE `oc_mfilter_url_alias` (
  `mfilter_url_alias_id` int(11) UNSIGNED NOT NULL,
  `path` text COLLATE utf8_unicode_ci NOT NULL,
  `mfp` text COLLATE utf8_unicode_ci NOT NULL,
  `alias` text COLLATE utf8_unicode_ci NOT NULL,
  `language_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_modification`
--

CREATE TABLE `oc_modification` (
  `modification_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_module`
--

CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(32, 'Column style', 'cosyone_banner', '{\"save\":\"stay\",\"status\":\"1\",\"name\":\"Column style\",\"module_title\":{\"1\":\"\"},\"columns\":\"column1\",\"sections\":{\"1\":{\"thumb_image\":\"catalog\\/cosyone_sample\\/rich-banner-column363x290.png\",\"block\":{\"1\":\"&lt;div class=&quot;info_wrapper&quot;&gt;&lt;span&gt;SPECIAL OFFER&lt;\\/span&gt;&lt;div class=&quot;info&quot;&gt;&lt;h4&gt;Some longer title&lt;\\/h4&gt;&lt;p&gt;A little longer tag line &lt;a href=&quot;#&quot;&gt;Read more&lt;\\/a&gt;&lt;\\/p&gt;&lt;\\/div&gt;&lt;\\/div&gt;\"}}}}'),
(36, 'Home page carousel', 'cosyone_carousel', '{\"name\":\"Home page carousel\",\"title\":{\"2\":\"Brands carousel\"},\"banner_id\":\"8\",\"grid\":\"[[0, 2], [320, 3], [550, 4], [999, 5], [1200, 6]]\",\"width\":\"165\",\"height\":\"80\",\"status\":\"1\"}'),
(31, 'Deals Category Page', 'cosyone_deals', '{\"name\":\"Deals Category Page\",\"product\":[\"42\",\"30\",\"47\"],\"limit\":\"5\",\"width\":\"360\",\"height\":\"360\",\"autoplay\":\"5000\",\"status\":\"1\"}'),
(42, 'Column subscribe', 'newsletter', '{\"name\":\"Column subscribe\",\"style\":\"default\",\"show_once\":\"1\",\"delay\":\"0\",\"block\":{\"1\":\"&lt;p&gt;&lt;br&gt;&lt;\\/p&gt;\"},\"status\":\"1\"}'),
(43, 'Column promos', 'cosyone_content', '{\"save\":\"0\",\"status\":\"1\",\"name\":\"Column promos\",\"template\":\"info2\",\"columns\":\"column-1\",\"module_title\":{\"1\":\"\"},\"sections\":{\"1\":{\"title\":{\"1\":\"\"},\"block\":{\"1\":\"&lt;p&gt;&lt;i class=&quot;fa fa-truck&quot;&gt;&lt;\\/i&gt;&lt;\\/p&gt;&lt;h3&gt;Free Delivery&lt;\\/h3&gt;&lt;p&gt;Lorem dolor item lorem dolor item lorem. &lt;a class=&quot;contrast_font&quot; href=&quot;#&quot;&gt;Read more&lt;\\/a&gt;&lt;\\/p&gt;\"}},\"2\":{\"title\":{\"1\":\"\"},\"block\":{\"1\":\"&lt;p&gt;&lt;i class=&quot;fa fa-lock&quot;&gt;&lt;\\/i&gt;&lt;\\/p&gt;&lt;h3&gt;Secure Payments&lt;\\/h3&gt;&lt;p&gt;Lorem dolor item lorem dolor item. &lt;a class=&quot;contrast_font&quot; href=&quot;#&quot;&gt;Read more&lt;\\/a&gt;&lt;\\/p&gt;\"}},\"3\":{\"title\":{\"1\":\"\"},\"block\":{\"1\":\"&lt;p&gt;&lt;i class=&quot;fa fa-cube&quot;&gt;&lt;\\/i&gt;&lt;\\/p&gt;&lt;h3&gt;Sample Promo Title&lt;\\/h3&gt;&lt;p&gt;Lorem dolor item lorem dolor item lorem. &lt;a class=&quot;contrast_font&quot; href=&quot;#&quot;&gt;Read more&lt;\\/a&gt;&lt;\\/p&gt;\"}}}}'),
(33, 'Home Full Width', 'revslideroutput', '{\"name\":\"Home Full Width\",\"slider_id\":\"1\",\"status\":\"1\"}'),
(34, 'Home page wall', 'cosyone_bannerwall', '{\"name\":\"Home page wall\",\"status\":\"1\",\"image1\":{\"2\":\"catalog\\/demo\\/product\\/thunderboltdisplay.jpg\"},\"html1\":{\"2\":\"\"},\"image4\":{\"2\":\"catalog\\/demo\\/product\\/iphone.jpg\"},\"html4\":{\"2\":\"\"},\"image2\":{\"2\":\"catalog\\/cosyone_sample\\/rich-banner-wall360x300.png\"},\"html2\":{\"2\":\"\"},\"image3\":{\"2\":\"catalog\\/demo\\/product\\/samsungtab.jpg\"},\"html3\":{\"2\":\"\"},\"image5\":{\"2\":\"catalog\\/demo\\/product\\/macbook.jpg\"},\"html5\":{\"2\":\"\"}}'),
(35, 'Home page tabs', 'showintabs_output', '{\"name\":\"Home page tabs\",\"status\":\"1\",\"selected_tabs\":{\"tabs\":[\"1\",\"2\",\"5\"]},\"limit\":\"8\",\"image_width\":\"263\",\"image_height\":\"263\",\"columns\":\"grid4\",\"carousel\":\"1\"}'),
(37, 'Home testimonials', 'cosyone_testimonial', '{\"name\":\"Home testimonials\",\"testimonial_title\":{\"2\":\"Testimonials\"},\"testimonial_limit\":\"5\",\"testimonial_character_limit\":\"190\",\"testimonial_columns\":\"grid3\",\"testimonial_carousel\":\"1\",\"testimonial_contrast\":\"1\",\"status\":\"1\"}'),
(39, 'Custom tekst', 'cosyone_content', '{\"save\":\"stay\",\"status\":\"1\",\"name\":\"Custom tekst\",\"template\":\"info1\",\"columns\":\"column-3\",\"module_title\":{\"2\":\"Custom tekst\"},\"sections\":{\"1\":{\"title\":{\"2\":\"CUSTOM\"},\"block\":{\"2\":\"&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \\r\\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat.&lt;br&gt;&lt;\\/p&gt;\"}},\"2\":{\"title\":{\"2\":\"CUSTOM 2\"},\"block\":{\"2\":\"&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \\r\\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat.&lt;br&gt;&lt;\\/p&gt;\"}},\"3\":{\"title\":{\"2\":\"CUSTOM 3\"},\"block\":{\"2\":\"&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \\r\\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim \\r\\nveniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea \\r\\ncommodo consequat.&lt;br&gt;&lt;\\/p&gt;\"}}}}'),
(40, 'Footer Socials', 'cosyone_socials', '{\"save\":\"stay\",\"status\":\"1\",\"name\":\"Footer Socials\",\"module_title\":{\"1\":\"Stay connected\"},\"sections\":{\"1\":{\"social_type\":\"fa-facebook\",\"link\":\"#\",\"link_type\":\"external\",\"tooltip\":\"Facebook\"},\"2\":{\"social_type\":\"fa-twitter\",\"link\":\"#\",\"link_type\":\"external\",\"tooltip\":\"Twitter\"},\"3\":{\"social_type\":\"fa-google-plus\",\"link\":\"#\",\"link_type\":\"external\",\"tooltip\":\"Google+\"},\"4\":{\"social_type\":\"fa-rss\",\"link\":\"#\",\"link_type\":\"external\",\"tooltip\":\"RSS\"},\"5\":{\"social_type\":\"fa-pinterest\",\"link\":\"#\",\"link_type\":\"external\",\"tooltip\":\"Pinterest\"},\"6\":{\"social_type\":\"fa-instagram\",\"link\":\"#\",\"link_type\":\"external\",\"tooltip\":\"Instagram\"},\"7\":{\"social_type\":\"fa-linkedin\",\"link\":\"#\",\"link_type\":\"external\",\"tooltip\":\"Linkedin\"},\"8\":{\"social_type\":\"fa-vimeo-square\",\"link\":\"#\",\"link_type\":\"external\",\"tooltip\":\"Vimeo\"},\"9\":{\"social_type\":\"fa-youtube\",\"link\":\"#\",\"link_type\":\"external\",\"tooltip\":\"Youtube\"},\"10\":{\"social_type\":\"fa-flickr\",\"link\":\"#\",\"link_type\":\"external\",\"tooltip\":\"Flickr\"},\"11\":{\"social_type\":\"fa-vk\",\"link\":\"#\",\"link_type\":\"external\",\"tooltip\":\"VK\"},\"12\":{\"social_type\":\"fa-dribbble\",\"link\":\"#\",\"link_type\":\"external\",\"tooltip\":\"Dribbble\"},\"13\":{\"social_type\":\"fa-spotify\",\"link\":\"#\",\"link_type\":\"external\",\"tooltip\":\"Spotify\"},\"14\":{\"social_type\":\"fa-tumblr\",\"link\":\"#\",\"link_type\":\"external\",\"tooltip\":\"Tumblr\"},\"15\":{\"social_type\":\"fa-xing\",\"link\":\"#\",\"link_type\":\"external\",\"tooltip\":\"Xing\"},\"16\":{\"social_type\":\"fa-wordpress\",\"link\":\"#\",\"link_type\":\"external\",\"tooltip\":\"Wordpress\"}}}'),
(41, 'Column top rated', 'showintabs_output', '{\"name\":\"Column top rated\",\"status\":\"1\",\"selected_tabs\":{\"tabs\":[\"5\"]},\"limit\":\"4\",\"image_width\":\"60\",\"image_height\":\"60\",\"columns\":\"grid1\",\"carousel\":\"0\"}'),
(44, 'Recently viewed product page', 'cosyone_recently', '{\"name\":\"Recently viewed product page\",\"limit\":\"3\",\"width\":\"262\",\"height\":\"262\",\"grid\":\"grid3\",\"status\":\"1\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_newsletter`
--

CREATE TABLE `oc_newsletter` (
  `email` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option`
--

CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(21, 'checkbox', 0),
(16, 'text_url', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_description`
--

CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(21, 4, '123'),
(21, 2, '123'),
(21, 3, '123');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_value`
--

CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(49, 21, '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_value_description`
--

CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(49, 4, 21, '123'),
(49, 2, 21, '123'),
(49, 3, 21, '123');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order`
--

CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_order`
--

INSERT INTO `oc_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(15, 0, 'INV-2013-00', 0, 'fidelitti', 'http://new.fidelitti.loc/', 1, 1, 'test', '', 'test@test.ua', '000', '', '', 'test', '', '', '', '', '', '', '', 0, '', 0, '', '', 'Оплата при доставке', 'cod', 'test', '', '', '', '', '', '', '', 0, '', 0, '', '', 'Доставка с фиксированной стоимостью доставки', 'flat.flat', '', '1490.0000', 1, 0, '0.0000', 0, '', 2, 4, 'UAH', '1.00000000', '127.0.0.1', '', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2017-08-05 13:48:08', '2017-08-05 13:48:08');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_custom_field`
--

CREATE TABLE `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_history`
--

CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_order_history`
--

INSERT INTO `oc_order_history` (`order_history_id`, `order_id`, `order_status_id`, `notify`, `comment`, `date_added`) VALUES
(33, 15, 1, 0, '', '2017-08-05 13:48:08');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_option`
--

CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_product`
--

CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_order_product`
--

INSERT INTO `oc_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(16, 15, 419, 'Adelle', '042/0/Lu/Red', 1, '1490.0000', '1490.0000', '0.0000', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_recurring`
--

CREATE TABLE `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_recurring_transaction`
--

CREATE TABLE `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_status`
--

CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 2, 'Processing'),
(3, 2, 'Shipped'),
(7, 2, 'Canceled'),
(5, 2, 'Complete'),
(8, 2, 'Denied'),
(9, 2, 'Canceled Reversal'),
(10, 2, 'Failed'),
(11, 2, 'Refunded'),
(12, 2, 'Reversed'),
(13, 2, 'Chargeback'),
(1, 2, 'Pending'),
(16, 2, 'Voided'),
(15, 2, 'Processed'),
(14, 2, 'Expired'),
(2, 3, 'Processing'),
(3, 3, 'Shipped'),
(7, 3, 'Canceled'),
(5, 3, 'Complete'),
(8, 3, 'Denied'),
(9, 3, 'Canceled Reversal'),
(10, 3, 'Failed'),
(11, 3, 'Refunded'),
(12, 3, 'Reversed'),
(13, 3, 'Chargeback'),
(1, 3, 'Pending'),
(16, 3, 'Voided'),
(15, 3, 'Processed'),
(14, 3, 'Expired');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_total`
--

CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_voucher`
--

CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product`
--

CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_ru` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price_en` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `price_ru`, `price_en`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(449, '057/6022/F/V2', '057/6022/F/V2', '', '', '', '', '', '', 9975, 7, 'catalog/bags/salerno/salernowhitev2/salerno_white_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-06-27', '0.00000000', 1, '21.00000000', '11.00000000', '26.00000000', 1, 1, 1, 112, 1, 0, '2017-06-27 11:52:43', '2017-07-27 15:02:21'),
(450, '064/white-pink/F/V2', '064/white-pink/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/marbella/marbellawhitepinksfv2/marbella_white_pink_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-06-30', '0.00000000', 1, '18.00000000', '23.00000000', '12.00000000', 1, 1, 1, 15, 1, 0, '2017-06-30 11:00:16', '2017-07-27 14:53:18'),
(451, '064/prado-honey/F/V2', '064/prado-honey/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/marbella/marbellapradohoneyv2/marbella_prado_honey_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-06-30', '0.00000000', 1, '18.00000000', '23.00000000', '12.00000000', 1, 1, 1, 16, 1, 0, '2017-06-30 17:53:46', '2017-07-27 14:57:52'),
(452, '057/6006/F/V2', '057/6006/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno/salerno_lavander/salerno_lavender_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-07-02', '0.00000000', 1, '21.00000000', '11.00000000', '26.00000000', 1, 1, 1, 1, 1, 0, '2017-07-02 18:22:36', '2017-07-27 15:03:08'),
(453, '058/green/F/V2', '058/green/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno_mini/salernominigreensf/salerno_mini_green_sf_v2_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-07-03', '0.00000000', 1, '18.00000000', '10.00000000', '22.00000000', 1, 1, 1, 16, 1, 0, '2017-07-03 11:08:00', '2017-07-27 15:05:57'),
(448, '058/6022/F/V2', '058/6022/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno_mini/salernominiwhitev2/salerno_mini_white_v2_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-06-26', '0.00000000', 1, '18.00000000', '10.00000000', '22.00000000', 1, 1, 1, 21, 1, 0, '2017-06-26 10:24:59', '2017-07-27 15:08:38'),
(447, '058/6032/F/V2', '058/6032/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno_mini/salernominimintv2/salerno_mini_mint_v2_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-06-26', '0.00000000', 1, '18.00000000', '10.00000000', '22.00000000', 1, 1, 1, 19, 1, 0, '2017-06-26 10:10:12', '2017-07-27 15:09:14'),
(446, '043/6006/SF/V2', '043/6006/SF/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondominilavenderv2/tondo_mini_lavender_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-06-23', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 119, 1, 0, '2017-06-23 14:38:18', '2017-07-08 13:34:40'),
(445, '065/6006/F/V2', '065/6006/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino_mini/cylindro/cylindrolavenderv2/cylindro_lavender_v2_ar-01.jpg', 0, 1, '3190.0000', '1234.0000', '3456.0000', 0, 0, '2017-06-23', '0.00000000', 1, '16.00000000', '16.00000000', '19.00000000', 1, 1, 1, 16, 1, 0, '2017-06-23 09:50:45', '2017-08-07 15:36:47'),
(444, '065/powder/F/V2', '065/powder/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino_mini/cylindro/cylindropowder/cylindro_powder_v2_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-06-22', '0.00000000', 1, '16.00000000', '16.00000000', '19.00000000', 1, 1, 1, 12, 1, 1, '2017-06-22 18:22:16', '2017-07-24 12:43:10'),
(443, '065/6022/F/V2', '065/6022/F/V2', '', '', '', '', '', '', 9998, 7, 'catalog/bags/cylindro/cylindrowhite/cylindro_white_v2_ar-01.jpg', 0, 1, '3190.0000', '2222.0000', '3333.0000', 0, 0, '2017-06-22', '0.00000000', 1, '16.00000000', '16.00000000', '19.00000000', 1, 1, 1, 1, 1, 31, '2017-06-22 10:36:33', '2017-08-07 14:31:18'),
(436, '019/640/F/V2', '019/640/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo/tondo_blue_sky/tondo_skyblue_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-06-03', '0.00000000', 1, '28.00000000', '9.00000000', '30.00000000', 1, 1, 1, 1, 1, 0, '2017-06-03 13:14:08', '2017-07-27 15:12:17'),
(437, '064/6006/F/V2', '064/6006/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno/marbella_lavender_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-06-03', '0.00000000', 1, '18.00000000', '23.00000000', '12.00000000', 1, 1, 1, 1, 1, 0, '2017-06-03 13:52:23', '2017-07-27 14:59:21'),
(438, '064/6003/F/V2', '064/6003/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/marbella/marbella_powder/marbella_powder_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-06-03', '0.00000000', 1, '18.00000000', '23.00000000', '12.00000000', 1, 1, 1, 1, 1, 0, '2017-06-03 13:59:27', '2017-07-27 14:59:47'),
(439, '061/G/kometa/gold', '061/G/kometa/gold', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino_mini/zaino_mini_kometa_gold/zaino_mini_comet_gold_v2_ar-01.jpg', 0, 1, '2690.0000', '0.0000', '0.0000', 0, 0, '2017-06-21', '0.00000000', 1, '21.00000000', '9.00000000', '22.00000000', 1, 1, 1, 21, 1, 1, '2017-06-05 14:13:15', '2017-07-22 17:09:59'),
(440, '061/G/комета/никель', '061/G/комета/никель', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino_mini/zainominikometanikel/zaino_mini_comet_silver_v2_ar-01.jpg', 0, 1, '2690.0000', '0.0000', '0.0000', 0, 0, '2017-06-21', '0.00000000', 1, '21.00000000', '9.00000000', '22.00000000', 1, 1, 1, 65, 1, 0, '2017-06-21 14:20:54', '2017-07-28 17:20:30'),
(441, '027/lightbue/T/V2', '027/lightbue/T/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zainolightblue/zaino_lightblue_t_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-06-21', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 59, 1, 0, '2017-06-21 14:59:36', '2017-07-22 13:06:14'),
(435, '061/6006/F/V2', '061/6006/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno/salerno_black_v2/zaino_mini_lavender_v2_ar-01(1).jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-06-03', '0.00000000', 1, '21.00000000', '9.00000000', '22.00000000', 1, 1, 1, 1, 1, 0, '2017-06-03 12:54:20', '2017-07-28 17:30:00'),
(424, '027/white-pink/SF/V2', '027/white-pink/SF/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_white_pink/zaino_white_pink_t_v2_br-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-27', '0.00000000', 1, '25.00000000', '26.00000000', '11.00000000', 1, 1, 1, 1, 1, 0, '2017-05-27 13:04:27', '2017-08-03 14:21:43'),
(426, '043/green/SF/V2', '043/green/SF/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_green/tondo_mini_green_t_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-27', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 35, 1, 0, '2017-05-27 14:49:23', '2017-07-08 13:34:29'),
(303, '019/6053/F', '019/6053/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo/tondo_amaranto/tondo_amaranto_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '28.00000000', '9.00000000', '30.00000000', 1, 1, 1, 4, 1, 0, '2017-05-12 22:35:12', '2017-07-08 13:30:38'),
(304, '019/6054/F/V2', '019/6054/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo/tondo_bordo/tondo_bordo_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '28.00000000', '9.00000000', '30.00000000', 1, 1, 1, 5, 1, 0, '2017-05-12 22:38:31', '2017-07-14 18:09:26'),
(305, '019/6055/F/V2', '019/6055/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo/tondo_burgundy/tondo_burgundy_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '28.00000000', '9.00000000', '30.00000000', 1, 1, 1, 6, 1, 0, '2017-05-12 22:40:40', '2017-07-08 13:31:45'),
(427, '043/red/SF/V2', '043/red/SF/V2', '', '', '', '', '', '', 9999, 7, 'catalog/bags/tondo_mini/tondo_mini_scarlet/tondo_mini_red_t_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-27', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 36, 1, 0, '2017-05-27 14:57:47', '2017-07-08 13:35:23'),
(307, '019/6070/F/V2', '019/6070/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo/tondo_marine/tondo_marine_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '28.00000000', '9.00000000', '30.00000000', 1, 1, 1, 9, 1, 0, '2017-05-12 23:22:35', '2017-07-08 13:32:23'),
(308, '019/6023/F-P/V2', '', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo/tondo_black/tondo_black_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '28.00000000', '9.00000000', '30.00000000', 1, 1, 1, 10, 1, 0, '2017-05-12 23:26:10', '2017-07-08 13:32:49'),
(422, '061/G/комета/сияние', '061/G/комета/сияние', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino_mini/zaino_mini_kometa/zaino_mini_comet_nickel_v2_ar-01.jpg', 0, 1, '2690.0000', '0.0000', '0.0000', 0, 0, '2017-05-27', '0.00000000', 1, '21.00000000', '9.00000000', '22.00000000', 1, 1, 1, 95, 1, 0, '2017-05-27 12:01:14', '2017-07-28 17:35:21'),
(310, '043/6073/F', '043/6073/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_grey/tondo_mini_shark_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 21, 1, 0, '2017-05-12 23:40:18', '2017-07-20 16:41:23'),
(311, '043/6074/F', '043/6074/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_zinco/tondo_mini_zinco_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 22, 1, 0, '2017-05-13 00:19:40', '2017-07-22 12:04:23'),
(312, '043/6026/F', '043/6026/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_red_v2/tondo_mini_red_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 23, 1, 0, '2017-05-13 00:22:29', '2017-07-20 16:04:58'),
(313, '043/темно-красная/SF', '043/темно-красная/SF', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_dark_red_ante/tondo_mini_red_ante_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 24, 1, 0, '2017-05-13 00:28:16', '2017-07-08 13:37:38'),
(314, '043/6053/F', '043/6053/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_amaranto/tondo_mini_amaranto_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 25, 1, 0, '2017-05-13 00:31:31', '2017-07-08 13:38:14'),
(315, '043/6054/F/V2', '043/6054/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_bordo_v2/tondo_mini_bordo_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 26, 1, 0, '2017-05-13 00:36:18', '2017-07-08 13:38:42'),
(316, '043/6055/F/V2', '043/6055/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_burgundy/tondo_mini_burgundy_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 27, 1, 0, '2017-05-13 00:44:17', '2017-07-13 16:16:15'),
(317, '043/6056/F', '043/6056/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_coriandr/tondo_mini_coriandr_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 28, 1, 0, '2017-05-13 00:49:11', '2017-07-08 13:39:40'),
(318, '043/6062/F/V2', '043/6062/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_khaki_v2/tondo_mini_khaki_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 29, 1, 0, '2017-05-13 00:51:43', '2017-07-20 16:19:42'),
(319, '043/6070/F', '043/6070/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_marine/tondo_mini_marine_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 30, 1, 0, '2017-05-13 00:53:37', '2017-07-20 16:20:32'),
(320, '043/6022/F/V2', '043/6022/F/V2', '', '', '', '', '', '', 9987, 7, 'catalog/bags/tondo_mini/tondo_mini_white_v2/tondo_mini_white_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 31, 1, 0, '2017-05-13 00:57:00', '2017-07-08 13:41:26'),
(423, '043/ivory/SF/V2', '043/ivory/SF/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_ivory/tondo_mini_white_t_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-27', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 33, 1, 0, '2017-05-27 12:14:22', '2017-07-27 15:16:38'),
(322, '043/powder/F/V2', '043/powder/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_powder/tondo_mini_powder_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 33, 0, 0, '2017-05-13 01:05:11', '2017-07-28 15:40:02'),
(323, '043/white-pink/SF/V2', '043/white-pink/SF/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_white_pink_v2/tondo_mini_white_pink_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 34, 1, 0, '2017-05-13 01:08:54', '2017-07-08 13:43:03'),
(324, '043/6032/F/V2', '043/6032/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_menthol_v2/tondo_mini_mint_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 35, 1, 0, '2017-05-13 12:35:18', '2017-07-08 13:43:32'),
(325, '043/650/Lu', '043/650/Lu', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_azure/tondo_mini_lightblue_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 36, 1, 0, '2017-05-13 12:38:00', '2017-07-27 15:17:26'),
(326, '043/660/Lu', '', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_deep_blue/tondo_mini_mint_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 37, 1, 0, '2017-05-13 12:43:15', '2017-07-27 15:18:11'),
(327, '043/6037/F/V2', '043/6037/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_indigo/tondo_mini_indi_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 38, 1, 0, '2017-05-13 12:46:55', '2017-07-08 13:45:13'),
(328, '043/6057/F/V2', '043/6057/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondominiblackberryv2/tondo_mini_blackberry_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 39, 1, 0, '2017-05-13 12:49:45', '2017-07-20 16:17:36'),
(329, '043/6043/F/V2', '043/6043/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_caramel/tondo_mini_caramel_ar-01.jpg', 0, 1, '100.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 40, 1, 0, '2017-05-13 12:52:03', '2017-07-20 16:13:49'),
(330, '043/6058/F/V2', '043/6058/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_yellow_v2/tondo_mini_sierra_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 41, 1, 0, '2017-05-13 12:54:03', '2017-07-08 13:47:08'),
(331, '043/6030/F/V2', '043/6030/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_denim_v2/tondo_mini_denim_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 42, 1, 0, '2017-05-13 13:54:31', '2017-07-08 13:48:06'),
(332, '043/6018/F', '043/6018/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_ocean/tondo_mini_ocean_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 43, 1, 0, '2017-05-13 13:56:48', '2017-07-08 13:48:41'),
(333, '043/600/PN', '043/600/пони', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_pony/tondo_mini_pony_ar-01.jpg', 0, 1, '5190.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 44, 1, 0, '2017-05-13 13:58:23', '2017-07-20 16:32:18'),
(334, '043/6023/F', '043/6023/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_black/tondo_mini_black_black_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 45, 1, 0, '2017-05-13 22:02:11', '2017-07-20 16:42:31'),
(335, '043/6023/F/Blue', '043/6023/F/Blue', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_black_blue/tondo_mini_black_blue_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 46, 1, 0, '2017-05-13 22:05:21', '2017-07-08 14:00:15'),
(336, '043/6023/F/Pink', '043/6023/F/Pink', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_black_pink/tondo_mini_black_pink_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 47, 1, 0, '2017-05-13 22:07:44', '2017-07-08 14:00:59'),
(337, '043/0/T', '043/0/T', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_black_ante/tondo_mini_black_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 48, 1, 0, '2017-05-13 22:09:50', '2017-07-08 14:01:29'),
(297, '019/6032/F/V2', '019/6032/F/V2', '', '', '', '', '', '', 9999, 7, 'catalog/bags/tondo/tondo_mint_v2/tondo_mint_v2_ar-01-2.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-12', '0.00000000', 1, '28.00000000', '9.00000000', '30.00000000', 1, 1, 1, 1, 1, 0, '2017-05-12 22:05:11', '2017-07-08 13:33:24'),
(339, '043/0/T/Blue', '043/0/T/Blue', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_black_blue_ante/tondo_mini_black_blue_t_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 49, 1, 0, '2017-05-13 22:14:03', '2017-07-08 14:02:03'),
(340, '043/silver/eco', '043/silver/eco', '', '', '', '', '', '', 9999, 7, 'catalog/bags/tondo_mini/tondo_mini_silver/tondo_mini_silver_ar-01.jpg', 0, 1, '1700.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 50, 1, 0, '2017-05-13 22:16:41', '2017-07-08 14:02:40'),
(341, '043/gold/eco', '', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_gold/tondo_mini_gold_ar-01.jpg', 0, 1, '1700.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 51, 1, 0, '2017-05-13 22:22:06', '2017-07-22 12:02:09'),
(420, '027/6022/F/V2', '027/6022/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_white_v2/zaino_white_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-27', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 63, 1, 0, '2017-05-27 11:06:15', '2017-07-22 12:05:37'),
(343, '027/6032/F/V2', '027/6032/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_menthol_v2/zaino_mint_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 62, 1, 0, '2017-05-13 22:43:37', '2017-07-27 15:20:33'),
(344, '027/Green/SF/V2', '027/Green/SF/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_green_ante_v2/zaino_green_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 63, 1, 0, '2017-05-13 22:45:27', '2017-08-03 14:30:15'),
(345, '027/6006/F/V2', '027/6006/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_lavender_v2/zaino_lavender_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 64, 1, 0, '2017-05-13 22:47:25', '2017-07-27 15:21:17'),
(421, '027/6058/F/V2', '027/6058/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_yellow_v2/zaino_yellow_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-27', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 64, 1, 0, '2017-05-27 11:27:14', '2017-07-22 13:03:14'),
(347, '027/650/Lu/V2', '027/650/Lu/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_azure_v2/zaino_blue_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 66, 1, 0, '2017-05-13 22:54:20', '2017-07-27 15:21:44'),
(348, '027/6073/F/V2', '027/6073/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_grey_brunto_v2/zaino_gray_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 67, 1, 0, '2017-05-13 22:56:40', '2017-07-22 13:07:45'),
(349, '027/Grey/SF/V2', '027/Grey/SF/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_pale_grey_v2/zaino_gray_blue_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 68, 1, 0, '2017-05-13 22:59:27', '2017-07-22 13:08:47'),
(350, '027/Graphit/SF/V2', '027/Graphit/SF/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_graphit/zaino_graphite_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 69, 1, 0, '2017-05-13 23:03:22', '2017-07-22 13:09:47'),
(351, '027/6074/F/V2', '027/6074/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_zinco/zaino_zinco_br-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 70, 1, 0, '2017-05-13 23:05:43', '2017-07-22 13:23:14'),
(352, '027/6055/F/V2', '027/6055/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_burgundy_v2/zaino_burgundy_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 71, 1, 0, '2017-05-13 23:07:56', '2017-07-28 17:57:50'),
(353, '027/6054/F/V2', '027/6054/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_bordo_v2/zaino_bordo_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 72, 1, 0, '2017-05-13 23:10:15', '2017-07-22 13:13:15'),
(354, '027/Red/SF/V2', '027/Red/SF/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_red_ante/zaino_prado_dark_red_sf_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 73, 1, 0, '2017-05-13 23:11:56', '2017-08-03 12:31:17'),
(355, '027/6053/F/V2', '027/6053/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_red_brunto_v2/zaino_red_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 74, 1, 0, '2017-05-13 23:14:52', '2017-07-22 13:18:04'),
(356, '027/6071/F/V2', '027/6071/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_space_v2/zaino_cosmos_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 75, 1, 0, '2017-05-13 23:49:47', '2017-07-22 13:22:50'),
(357, '027/6018/F/V2', '027/6018/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_ocean/zaino_ocean_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 76, 1, 0, '2017-05-13 23:53:00', '2017-07-27 18:24:33'),
(425, '043/640/F/V2', '043/640/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_skyblue/tondo_mini_skyblue_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-27', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 33, 1, 0, '2017-05-27 13:48:23', '2017-07-08 14:04:20'),
(359, '027/6037/F/V2', '027/6037/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_indigo/zaino_indi_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 78, 1, 0, '2017-05-14 17:39:57', '2017-07-22 13:25:01'),
(360, '027/6070/F/V2', '027/6070/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_marine/zaino_marine_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 79, 1, 0, '2017-05-14 17:42:35', '2017-07-22 13:25:44'),
(361, '027/6057/F/V2', '027/6057/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_lilac/zaino_blackberry_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 80, 1, 0, '2017-05-14 17:43:48', '2017-07-22 13:27:08'),
(362, '027/600/PN', '027/600/PN', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_blue_pony/zaino_pony_ar-01.jpg', 0, 1, '6500.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 81, 1, 0, '2017-05-14 17:45:01', '2017-07-28 11:14:44'),
(363, '027/6023/F', '027/6023/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_black/zaino_black_brunto_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 82, 1, 0, '2017-05-14 17:47:55', '2017-07-22 13:28:55'),
(364, '027/0/T', '027/0/T', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_black_ante/z_zaino_black_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 83, 1, 0, '2017-05-14 17:51:40', '2017-07-27 17:48:07'),
(365, '027/0/R', '027/0/R', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_black_eco/zaino_black_eco_br-01.jpg', 0, 1, '1900.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 84, 1, 0, '2017-05-14 17:53:12', '2017-07-22 13:31:04'),
(366, '061/6022/F/V2', '061/6022/F/V2', '', '', '', '', '', '', 9995, 7, 'catalog/bags/zaino_mini/zaino_mini_v2/zaino_mini_white_v2_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '21.00000000', '9.00000000', '22.00000000', 1, 1, 1, 91, 1, 0, '2017-05-14 17:57:34', '2017-07-28 17:36:57'),
(442, '065/6032/F/V2', '065/6032/F/V2', '', '', '', '', '', '', 9998, 7, 'catalog/bags/cylindro/cylindromint/cylindro_mint_v2_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-06-22', '0.00000000', 1, '16.00000000', '16.00000000', '19.00000000', 1, 1, 1, 1, 1, 8, '2017-06-22 10:18:38', '2017-08-07 16:29:34'),
(367, '061/6032/F/V2', '061/6032/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino_mini/zaino_mini_menthol_v2/zaino_mini_mint_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '21.00000000', '9.00000000', '22.00000000', 1, 1, 1, 92, 1, 0, '2017-05-14 18:03:20', '2017-07-08 14:34:02'),
(368, '061/6073/F/V2', '061/6073/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino_mini/zaino_mini_grey/zaino_mini_gray_v2_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '21.00000000', '9.00000000', '22.00000000', 1, 1, 1, 93, 1, 0, '2017-05-14 18:06:03', '2017-07-28 17:38:50'),
(369, '061/6018/F/V2', '061/6018/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino_mini/zaino_mini_ocean/zaino_mini_ocean_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '21.00000000', '10.00000000', '22.00000000', 1, 1, 1, 94, 1, 0, '2017-05-14 18:08:18', '2017-07-22 11:54:36'),
(370, '061/600/PN/V2', '061/600/PN/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino_mini/zaino_mini_pony_v2/zaino_mini_pony_v2_ar-01.jpg', 0, 1, '5740.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '21.00000000', '9.00000000', '22.00000000', 1, 1, 1, 95, 1, 0, '2017-05-14 18:09:33', '2017-07-28 17:41:55'),
(371, '061/6055/F/V2', '061/6055/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino_mini/zaino_mini_burgundy/zaino_mini_burgundy_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '21.00000000', '9.00000000', '22.00000000', 1, 1, 1, 96, 1, 0, '2017-05-14 18:11:50', '2017-07-28 17:44:34'),
(372, '061/6023/F/V2', '061/6023/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino_mini/zainominiblackv2/zaino_mini_black_v2_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '21.00000000', '9.00000000', '22.00000000', 1, 1, 1, 97, 1, 0, '2017-05-14 18:13:37', '2017-07-28 17:46:06'),
(373, '061/6053/F/V2', '061/6053/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino_mini/zaino_mini_amaranto/zaino_mini_red_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '21.00000000', '9.00000000', '22.00000000', 1, 1, 1, 98, 1, 0, '2017-05-14 18:16:14', '2017-07-28 17:47:15'),
(374, '061/6070/F', '061/6070/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino_mini/zaino_mini_marine/zaino_mini_marine_v2_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '21.00000000', '9.00000000', '22.00000000', 1, 1, 1, 99, 1, 0, '2017-05-14 18:18:02', '2017-07-28 17:09:11'),
(375, '061/6057/F/V2', '061/6057/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino_mini/zaino_mini_lilac/zaino_mini_blackberry_v2_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '21.00000000', '9.00000000', '22.00000000', 1, 1, 1, 100, 1, 0, '2017-05-14 18:20:56', '2017-07-28 17:08:24'),
(376, '057/6053/F/V2', '057/6053/F/V2', '', '', '', '', '', '', 9952, 7, 'catalog/bags/salerno/salerno_amaranto/salerno_red_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '21.00000000', '11.00000000', '26.00000000', 1, 1, 1, 111, 1, 0, '2017-05-14 18:23:37', '2017-07-27 15:04:30'),
(377, '057/6018/F', '057/6018/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno/salernooceanv2/salerno_ocean_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '21.00000000', '11.00000000', '26.00000000', 1, 1, 1, 112, 1, 0, '2017-05-14 18:26:18', '2017-07-17 18:15:45'),
(378, '057/6030/F', '057/6030/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno/salerno_denim/salerno_denim_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '21.00000000', '11.00000000', '26.00000000', 1, 1, 1, 113, 1, 0, '2017-05-14 18:27:59', '2017-07-08 12:24:43'),
(379, '057/6073/F/V2', '057/6073/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno/salerno_grey_v2/salerno_gray_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '21.00000000', '11.00000000', '26.00000000', 1, 1, 1, 114, 1, 0, '2017-05-14 18:32:27', '2017-07-08 12:25:14'),
(380, '057/6057/F', '057/6057/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno/salerno_lilac/salerno_blackberry_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '21.00000000', '11.00000000', '26.00000000', 1, 1, 1, 115, 1, 0, '2017-05-14 18:32:27', '2017-07-08 12:25:44'),
(381, '057/6023/F/Red/V2', '057/6023/F/Red/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno/salerno_black_red/salerno_black_red_br-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '21.00000000', '11.00000000', '26.00000000', 1, 1, 1, 116, 1, 0, '2017-05-14 18:32:27', '2017-07-08 12:26:12'),
(382, '057/6023/F/V', '057/6023/F/V', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno/salerno_black_violet/salerno_black_violet_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '21.00000000', '11.00000000', '26.00000000', 1, 1, 1, 117, 1, 0, '2017-05-14 18:32:34', '2017-07-08 12:26:38'),
(383, '057/6023/F/V2', '057/6023/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno/salerno_black_v2/salerno_black_black_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '21.00000000', '11.00000000', '26.00000000', 1, 1, 1, 118, 1, 0, '2017-05-14 18:32:34', '2017-07-08 12:27:25'),
(389, '058/6018/F/V2', '058/6018/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno_mini/salerno_mini_ocean/salerno_mini_ocean_v2_ar-01(1).jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '18.00000000', '10.00000000', '22.00000000', 1, 1, 1, 121, 1, 0, '2017-05-14 18:55:12', '2017-07-11 12:08:05'),
(434, '043/6004/F/V2', '043/6004/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_blue_v2/tondo_mini_blue_v2_ar-01-1.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-29', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 1, 1, 0, '2017-05-29 15:18:25', '2017-07-08 14:04:09'),
(433, '043/6019/F/V2', '043/6019/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_violet_v2/tondo_mini_fuchsia_v2_ar-01-1.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-29', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 1, 1, 0, '2017-05-29 14:52:21', '2017-07-08 14:05:00'),
(390, '058/6030/F', '058/6030/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno_mini/salerno_mini_denim/salerno_mini_denim_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '18.00000000', '10.00000000', '22.00000000', 1, 1, 1, 122, 1, 0, '2017-05-14 18:59:08', '2017-07-08 12:57:45'),
(391, '058/6070/F', '058/6070/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno_mini/salerno_mini_marine/salerno_mini_marine_v2_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '18.00000000', '10.00000000', '22.00000000', 1, 1, 1, 123, 1, 0, '2017-05-14 19:21:18', '2017-07-08 12:58:18'),
(392, '058/6073/F', '058/6073/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno_mini/salerno_mini_grey/salerno_mini_gray_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '18.00000000', '10.00000000', '22.00000000', 1, 1, 1, 124, 1, 0, '2017-05-14 19:23:13', '2017-07-08 13:19:42'),
(429, '027/6007/F/V2', '027/6007/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_raspberry_v2/zaino_raspberry_v2_ar-01-1.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-29', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 1, 1, 0, '2017-05-29 14:01:58', '2017-07-22 13:48:00'),
(394, '058/6053/F/V2', '058/6053/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino_mini/salernomini/salerno_mini_red_v2_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '18.00000000', '10.00000000', '22.00000000', 1, 1, 1, 126, 1, 0, '2017-05-14 19:27:01', '2017-07-08 13:20:13'),
(395, '058/6057/F', '058/6057/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno_mini/salerno_mini_lilac/salerno_mini_blackberry_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '18.00000000', '10.00000000', '22.00000000', 1, 1, 1, 127, 1, 0, '2017-05-14 19:41:29', '2017-07-08 13:20:41'),
(396, '058/6023/F', '058/6023/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno_mini/salerno_mini_black/salerno_mini_black_black_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-13', '0.00000000', 1, '18.00000000', '10.00000000', '22.00000000', 1, 1, 1, 128, 1, 0, '2017-05-14 19:42:54', '2017-07-08 13:21:59'),
(428, '025/0/Т/B', '025/0/Т/B', '', '', '', '', '', '', 10000, 7, 'catalog/bags/modena/modena_black_blue/black-modena11.jpg', 0, 1, '3390.0000', '0.0000', '0.0000', 0, 0, '2017-05-27', '0.00000000', 1, '39.00000000', '33.00000000', '9.00000000', 1, 1, 1, 1, 1, 0, '2017-05-27 15:24:29', '2017-07-08 15:38:14'),
(398, '046/6057/F', '046/6057/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/sevilla/sevilla_lilac/sevilla_blackberry_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '34.00000000', '14.00000000', '20.00000000', 1, 1, 1, 132, 1, 0, '2017-05-14 22:13:06', '2017-07-08 13:22:54'),
(399, '046/6073/F', '046/6073/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/sevilla/sevilla_grey/sevilla_shark_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '34.00000000', '14.00000000', '20.00000000', 1, 1, 1, 133, 1, 0, '2017-05-14 22:15:05', '2017-07-08 13:23:35'),
(401, '046/6030/F', '046/6030/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/sevilla/sevilla_denim/sevilla_denim_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '34.00000000', '14.00000000', '20.00000000', 1, 1, 1, 135, 1, 0, '2017-05-14 22:17:12', '2017-07-08 13:24:01'),
(402, '046/6018/F', '046/6018/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/sevilla/sevilla_ocean/sevilla_ocean_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '34.00000000', '14.00000000', '20.00000000', 1, 1, 1, 136, 1, 0, '2017-05-14 22:18:03', '2017-07-08 13:24:25'),
(403, '046/6070/F', '046/6070/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/sevilla/sevilla_marine/sevilla_marine_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '34.00000000', '14.00000000', '20.00000000', 1, 1, 1, 137, 1, 0, '2017-05-14 22:18:57', '2017-07-08 13:24:54'),
(404, '046/6023/F', '046/6023/F', '', '', '', '', '', '', 10000, 7, 'catalog/bags/sevilla/sevilla_black/sevilla_black_red_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '34.00000000', '14.00000000', '20.00000000', 1, 1, 1, 138, 1, 0, '2017-05-14 22:19:51', '2017-07-08 13:25:22'),
(405, '049/6023/F/Red', '049/6023/F/Red', '', '', '', '', '', '', 10000, 7, 'catalog/bags/caramente/caramente_black_red_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '30.00000000', '9.00000000', '25.00000000', 1, 1, 1, 151, 1, 0, '2017-05-14 22:21:07', '2017-07-17 17:43:04'),
(406, '051/6023/F/Red', '051/6023/F/Red', '', '', '', '', '', '', 10000, 7, 'catalog/bags/bordo/bordo_black_red/bordo_black_red_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '34.00000000', '14.00000000', '20.00000000', 1, 1, 1, 152, 1, 0, '2017-05-14 22:58:23', '2017-07-07 13:20:05'),
(407, '051/6023/F/Blue', '051/6023/F/Blue', '', '', '', '', '', '', 10000, 7, 'catalog/bags/bordo/bordo_black_blue/bordo_black_blue_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '34.00000000', '14.00000000', '20.00000000', 1, 1, 1, 153, 1, 1, '2017-05-14 23:01:49', '2017-07-07 13:20:49'),
(408, '038/850/T', '038/850/T', '', '', '', '', '', '', 10000, 7, 'catalog/bags/siera/siera_red_ar-01.jpg', 0, 1, '2410.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '20.00000000', '14.00000000', '17.00000000', 1, 1, 1, 154, 0, 0, '2017-05-14 23:08:18', '2017-07-08 13:25:54'),
(409, '025/0-100/Т', '025/0-100/Т', '', '', '', '', '', '', 10000, 7, 'catalog/bags/modena/modena_black_white/fidelitt-square-black-white-1.jpg', 0, 1, '3390.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '39.00000000', '33.00000000', '9.00000000', 1, 1, 1, 155, 1, 0, '2017-05-14 23:14:58', '2017-07-08 15:38:50'),
(410, '025/0/Т/Red', '025/0/Т/Red', '', '', '', '', '', '', 10000, 7, 'catalog/bags/modena/modena_black_red/fidelitti-black-square-1.jpg', 0, 1, '3390.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '39.00000000', '33.00000000', '9.00000000', 1, 1, 1, 156, 1, 0, '2017-05-14 23:15:06', '2017-07-08 15:39:32'),
(411, '013/0-645/Lu', '013/0-645/Lu', '', '', '', '', '', '', 10000, 7, 'catalog/bags/terno/terno-black-menthol/terno_black_menthol_ar-01.jpg', 0, 1, '1599.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '25.00000000', '3.00000000', '13.00000000', 1, 1, 1, 161, 1, 1, '2017-05-14 23:26:42', '2017-07-27 15:10:01'),
(412, '013/0-640/Lu', '013/0-640/Lu', '', '', '', '', '', '', 10000, 7, 'catalog/bags/terno/terno-black-lightblue/terno_black_lightblue_ar-01.jpg', 0, 1, '1599.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '25.00000000', '3.00000000', '13.00000000', 1, 1, 1, 162, 1, 0, '2017-05-14 23:26:52', '2017-07-27 15:10:31'),
(413, '013/0-660/Lu', '013/0-660/Lu', '', '', '', '', '', '', 10000, 7, 'catalog/bags/terno/terno-black-blue/terno_black_blue_ar-01.jpg', 0, 1, '1599.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '25.00000000', '3.00000000', '13.00000000', 1, 1, 1, 163, 1, 0, '2017-05-14 23:28:21', '2017-07-27 15:10:55'),
(414, '013/0-530/Lu', '013/0-530/Lu', '', '', '', '', '', '', 10000, 7, 'catalog/bags/terno/terno-black-red/terno_black_red_ar-01.jpg', 0, 1, '1599.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '25.00000000', '3.00000000', '13.00000000', 1, 1, 1, 164, 1, 0, '2017-05-14 23:29:59', '2017-07-27 15:11:14'),
(415, '013/0-150/Lu', '013/0-150/Lu', '', '', '', '', '', '', 10000, 7, 'catalog/bags/terno/terno-black-pink/terno_black_pink_ar-01.jpg', 0, 1, '1599.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '25.00000000', '3.00000000', '13.00000000', 1, 1, 1, 165, 1, 0, '2017-05-14 23:31:20', '2017-07-27 15:11:36'),
(416, '002/850/Lu', '002/850/Lu', '', '', '', '', '', '', 10000, 7, 'catalog/bags/roza/roza_red/fidelitti_red_clutch_1.jpg', 0, 1, '1599.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '25.00000000', '3.00000000', '13.00000000', 1, 1, 1, 166, 1, 0, '2017-05-14 23:32:44', '2017-07-08 15:39:44'),
(417, '002/0/Lu/Blue', '002/0/Lu/Blue', '', '', '', '', '', '', 10000, 7, 'catalog/bags/roza/roza_bb/z_rosa_black_blue_ar-01.jpg', 0, 1, '1599.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '25.00000000', '3.00000000', '13.00000000', 1, 1, 1, 167, 1, 0, '2017-05-14 23:37:37', '2017-07-27 15:00:54'),
(418, '002/0/Lu/Red', '002/0/Lu/Red', '', '', '', '', '', '', 10000, 7, 'catalog/bags/roza/roza_br/z_rosa_black_red_ar-01.jpg', 0, 1, '1599.0000', '0.0000', '0.0000', 0, 0, '2017-05-14', '0.00000000', 1, '25.00000000', '3.00000000', '13.00000000', 1, 1, 1, 168, 1, 0, '2017-05-14 23:38:55', '2017-07-27 15:01:37'),
(419, '042/0/Lu/Red', '042/0/Lu/Red', '', '', '', '', '', '', 9999, 7, 'catalog/bags/adelle/adelle_black_red_ar-01.jpg', 0, 1, '1490.0000', '1111.0000', '2222.0000', 0, 0, '2017-05-14', '0.00000000', 1, '19.00000000', '11.00000000', '20.00000000', 1, 1, 1, 171, 1, 19, '2017-05-14 23:47:05', '2017-08-08 18:00:27'),
(430, '027/6019/F/V2', '027/6019/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_violet_v2/zaino_fuchsia_v2_ar-01-1.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-29', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 1, 1, 0, '2017-05-29 14:18:02', '2017-07-28 17:13:35'),
(431, '027/6004/F/V2', '027/6004/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zaino_blue_v2/zaino_blue_v2_ar-01-1.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-05-29', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 1, 1, 0, '2017-05-29 14:24:46', '2017-07-28 17:15:11'),
(432, '043/6007/F/V2', '043/6007/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/tondo_mini/tondo_mini_raspberry/tondo_mini_raspberries_v2_ar-01-1.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-05-29', '0.00000000', 1, '20.00000000', '7.00000000', '21.00000000', 1, 1, 1, 1, 1, 0, '2017-05-29 14:38:36', '2017-07-08 14:05:33'),
(454, '027/yellow-savage/F/V2', '027/yellow-savage/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/salerno_mini/zainoyellowsavage/zaino_yellow_savage_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-07-03', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 62, 1, 0, '2017-07-03 18:16:25', '2017-07-28 17:16:52'),
(455, '061/ivory/SF/V2', '061/ivory/SF/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino_mini/zainominiwhitetv2/zaino_mini_white_t_v2_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-07-06', '0.00000000', 1, '21.00000000', '9.00000000', '22.00000000', 1, 1, 1, 19, 1, 0, '2017-07-06 12:45:01', '2017-07-28 17:06:59'),
(456, '064/gray/F/V2', '064/gray/F/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/marbella/marbellagrayv2/marbella_gray_v2_ar-01.jpg', 0, 1, '2940.0000', '0.0000', '0.0000', 0, 0, '2017-07-06', '0.00000000', 1, '18.00000000', '23.00000000', '12.00000000', 1, 1, 1, 25, 1, 0, '2017-07-06 15:32:01', '2017-07-27 15:00:12'),
(457, '027/Prado-Arsenic/SF/V2', '027/Prado-Arsenic/SF/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino/zainopradoarsenicnew/zaino_prado_arsenic_v2_ar-01.jpg', 0, 1, '3490.0000', '0.0000', '0.0000', 0, 0, '2017-07-07', '0.00000000', 1, '25.00000000', '11.00000000', '26.00000000', 1, 1, 1, 58, 1, 0, '2017-07-07 17:55:37', '2017-07-28 17:17:41'),
(458, '065/прадо Honey/V2', '065/прадо Honey/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/cylindro/cylindropradohoney/cylindro_prado_honey_v2_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-07-21', '0.00000000', 1, '16.00000000', '16.00000000', '19.00000000', 1, 1, 1, 17, 1, 0, '2017-07-21 14:34:28', '2017-07-24 16:43:07'),
(459, '065//Prado-Arsenic/SF/V2', '065//Prado-Arsenic/SF/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/cylindro/cylindropradoarsenicv2/cylindro_prado_arsenic_v2_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-07-24', '0.00000000', 1, '16.00000000', '16.00000000', '19.00000000', 1, 1, 1, 110, 1, 0, '2017-07-24 12:47:02', '2017-07-24 13:30:51'),
(460, '061/прадо пудра 0032/V2', '061/прадо пудра 0032/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino_mini/zainominipradopowdert0032/zaino_mini_prado_powder_t_v2_ar-01.jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-07-24', '0.00000000', 1, '21.00000000', '9.00000000', '22.00000000', 1, 1, 1, 112, 1, 0, '2017-07-24 16:17:58', '2017-07-28 17:07:28'),
(461, '061/green/SF/V2', '061/green/SF/V2', '', '', '', '', '', '', 10000, 7, 'catalog/bags/zaino_mini/zainominigreensf/zaino_mini_green_sf_v2_ar-01(1).jpg', 0, 1, '3190.0000', '0.0000', '0.0000', 0, 0, '2017-07-27', '0.00000000', 1, '21.00000000', '9.00000000', '22.00000000', 1, 1, 1, 68, 1, 0, '2017-07-27 11:34:29', '2017-08-03 14:27:50'),
(462, '061/G/kometa/rose', '061/G/kometa/rose', '', '', '', '', '', '', 1, 7, 'catalog/bags/zaino_mini/zainominicometrosev2/zaino_mini_comet_rose_v2_ar-01.jpg', 0, 1, '2690.0000', '0.0000', '0.0000', 0, 0, '2017-07-28', '0.00000000', 1, '21.00000000', '9.00000000', '22.00000000', 1, 1, 1, 89, 1, 0, '2017-07-28 18:06:37', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_attribute`
--

CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_attribute`
--

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(297, 12, 1, 'Fidelitti'),
(303, 12, 1, 'Fidelitti'),
(304, 12, 1, 'Fidelitti'),
(305, 12, 1, 'Fidelitti'),
(307, 12, 1, 'Fidelitti'),
(308, 12, 1, 'Fidelitti'),
(310, 12, 1, 'Fidelitti'),
(311, 12, 1, 'Fidelitti'),
(312, 12, 1, 'Fidelitti'),
(313, 12, 1, 'Fidelitti'),
(314, 12, 1, 'Fidelitti'),
(315, 12, 1, 'Fidelitti'),
(316, 12, 1, 'Fidelitti'),
(317, 12, 1, 'Fidelitti'),
(318, 12, 1, 'Fidelitti'),
(319, 12, 1, 'Fidelitti'),
(320, 12, 1, 'Fidelitti'),
(322, 12, 1, 'Fidelitti'),
(323, 12, 1, 'Fidelitti'),
(324, 12, 1, 'Fidelitti'),
(325, 12, 1, 'Fidelitti'),
(326, 12, 1, 'Fidelitti'),
(327, 12, 1, 'Fidelitti'),
(328, 12, 1, 'Fidelitti'),
(329, 12, 1, 'Fidelitti'),
(330, 12, 1, 'Fidelitti'),
(331, 12, 1, 'Fidelitti'),
(332, 12, 1, 'Fidelitti'),
(333, 12, 1, 'Ultima'),
(334, 12, 1, 'Fidelitti'),
(335, 12, 1, 'Fidelitti'),
(336, 12, 1, 'Fidelitti'),
(337, 12, 1, 'Fidelitti'),
(339, 12, 1, 'Fidelitti'),
(340, 12, 1, 'Fedelta'),
(341, 12, 1, 'Fedelta'),
(343, 12, 1, 'Fidelitti'),
(344, 14, 2, 'green'),
(345, 12, 1, 'Fidelitti'),
(347, 12, 1, 'Fidelitti'),
(348, 12, 1, 'Fidelitti'),
(349, 12, 1, 'Fidelitti'),
(350, 12, 1, 'Fidelitti'),
(351, 12, 1, 'Fidelitti'),
(352, 12, 1, 'Fidelitti'),
(353, 12, 1, 'Fidelitti'),
(355, 12, 1, 'Fidelitti'),
(356, 12, 1, 'Fidelitti'),
(357, 12, 1, 'Fidelitti'),
(359, 12, 1, 'Fidelitti'),
(360, 12, 1, 'Fidelitti'),
(361, 12, 1, 'Fidelitti'),
(362, 12, 1, 'Ultima'),
(363, 12, 1, 'Fidelitti'),
(364, 12, 1, 'Fidelitti'),
(365, 12, 1, 'Fedelta'),
(366, 12, 1, 'Fidelitti'),
(367, 12, 1, 'Fidelitti'),
(368, 12, 1, 'Fidelitti'),
(369, 12, 1, 'Fidelitti'),
(370, 12, 1, 'Ultima'),
(371, 12, 1, 'Fidelitti'),
(372, 12, 1, 'Fidelitti'),
(373, 12, 1, 'Fidelitti'),
(374, 12, 1, 'Fidelitti'),
(375, 12, 1, 'Fidelitti'),
(376, 12, 1, 'Fidelitti'),
(377, 12, 1, 'Fidelitti'),
(378, 12, 1, 'Fidelitti'),
(379, 12, 1, 'Fidelitti'),
(380, 12, 1, 'Fidelitti'),
(381, 12, 1, 'Fidelitti'),
(382, 12, 1, 'Fidelitti'),
(383, 12, 1, 'Fidelitti'),
(389, 12, 1, 'Fidelitti'),
(390, 12, 1, 'Fidelitti'),
(391, 12, 1, 'Fidelitti'),
(392, 12, 1, 'Fidelitti'),
(394, 12, 1, 'Fidelitti'),
(395, 12, 1, 'Fidelitti'),
(396, 12, 1, 'Fidelitti'),
(398, 12, 1, 'Fidelitti'),
(399, 12, 1, 'Fidelitti'),
(401, 12, 1, 'Fidelitti'),
(402, 12, 1, 'Fidelitti'),
(403, 12, 1, 'Fidelitti'),
(404, 12, 1, 'Fidelitti'),
(405, 12, 1, 'Fidelitti'),
(406, 12, 1, 'Fidelitti'),
(407, 12, 1, 'Fidelitti'),
(408, 12, 1, 'Fidelitti'),
(409, 12, 1, 'Fidelitti'),
(410, 12, 1, 'Fidelitti'),
(411, 12, 1, 'Fidelitti'),
(412, 12, 1, 'Fidelitti'),
(413, 12, 1, 'Fidelitti'),
(414, 12, 1, 'Fidelitti'),
(415, 12, 1, 'Fidelitti'),
(416, 12, 1, 'Fidelitti'),
(417, 12, 1, 'Fidelitti'),
(418, 12, 1, 'Fidelitti'),
(420, 12, 1, 'Fidelitti'),
(421, 12, 1, 'Fidelitti'),
(422, 12, 1, 'Fidelitti '),
(423, 12, 1, 'Fidelitti'),
(425, 12, 1, 'Fidelitti'),
(426, 12, 1, 'Fidelitti'),
(427, 12, 1, 'Fidelitti'),
(428, 12, 1, 'Fidelitti'),
(429, 12, 1, 'Fidelitti'),
(430, 12, 1, 'Fidelitti'),
(431, 12, 1, 'Fidelitti'),
(432, 12, 1, 'Fidelitti'),
(433, 12, 1, 'Fidelitti'),
(434, 12, 1, 'Fidelitti'),
(435, 12, 1, 'Fidelitti'),
(436, 12, 1, 'Fidelitti'),
(437, 12, 1, 'Fidelitti'),
(438, 12, 1, 'Fidelitti'),
(439, 12, 1, 'Fidelitti '),
(440, 12, 1, 'Fidelitti '),
(441, 12, 1, 'Fidelitti'),
(444, 12, 1, 'Fidelitti'),
(446, 12, 1, 'Fidelitti'),
(447, 12, 1, 'Fidelitti'),
(448, 12, 1, 'Fidelitti'),
(449, 12, 1, 'Fidelitti'),
(451, 12, 1, 'Fidelitti '),
(452, 12, 1, 'Fidelitti'),
(454, 12, 1, 'Fidelitti'),
(455, 12, 1, 'Fidelitti'),
(456, 12, 1, 'Fidelitti'),
(457, 12, 1, 'Fidelitti'),
(458, 12, 1, 'Fidelitti '),
(460, 12, 1, 'Fidelitti'),
(461, 18, 1, '100% микрофибра'),
(297, 12, 2, 'Fidelitti'),
(303, 12, 2, 'Fidelitti'),
(304, 12, 2, 'Fidelitti'),
(305, 12, 2, 'Fidelitti'),
(307, 12, 2, 'Fidelitti'),
(308, 12, 2, 'Fidelitti'),
(310, 12, 2, 'Fidelitti'),
(311, 12, 2, 'Fidelitti'),
(312, 12, 2, 'Fidelitti'),
(313, 12, 2, 'Fidelitti'),
(314, 12, 2, 'Fidelitti'),
(315, 12, 2, 'Fidelitti'),
(316, 12, 2, 'Fidelitti'),
(317, 12, 2, 'Fidelitti'),
(318, 12, 2, 'Fidelitti'),
(319, 12, 2, 'Fidelitti'),
(320, 12, 2, 'Fidelitti'),
(322, 12, 2, 'Fidelitti'),
(323, 12, 2, 'Fidelitti'),
(324, 12, 2, 'Fidelitti'),
(325, 12, 2, 'Fidelitti'),
(326, 12, 2, 'Fidelitti'),
(327, 12, 2, 'Fidelitti'),
(328, 12, 2, 'Fidelitti'),
(329, 12, 2, 'Fidelitti'),
(330, 12, 2, 'Fidelitti'),
(331, 12, 2, 'Fidelitti'),
(332, 12, 2, 'Fidelitti'),
(333, 12, 2, 'Ultima'),
(334, 12, 2, 'Fidelitti'),
(335, 12, 2, 'Fidelitti'),
(336, 12, 2, 'Fidelitti'),
(337, 12, 2, 'Fidelitti'),
(339, 12, 2, 'Fidelitti'),
(340, 12, 2, 'Fedelta'),
(341, 12, 2, 'Fedelta'),
(343, 12, 2, 'Fidelitti'),
(344, 16, 1, 'Снаружи 100% - натуральная телячья кожа Ante, 100% - металл. Внутри 100% микрофибра.'),
(345, 12, 2, 'Fidelitti'),
(347, 12, 2, 'Fidelitti'),
(348, 12, 2, 'Fidelitti'),
(349, 12, 2, 'Fidelitti'),
(350, 12, 2, 'Fidelitti'),
(351, 12, 2, 'Fidelitti'),
(352, 12, 2, 'Fidelitti'),
(353, 12, 2, 'Fidelitti'),
(355, 12, 2, 'Fidelitti'),
(356, 12, 2, 'Fidelitti'),
(357, 12, 2, 'Fidelitti'),
(359, 12, 2, 'Fidelitti'),
(360, 12, 2, 'Fidelitti'),
(361, 12, 2, 'Fidelitti'),
(362, 12, 2, 'Ultima'),
(363, 12, 2, 'Fidelitti'),
(364, 12, 2, 'Fidelitti'),
(365, 12, 2, 'Fedelta'),
(366, 12, 2, 'Fidelitti'),
(367, 12, 2, 'Fidelitti'),
(368, 12, 2, 'Fidelitti'),
(369, 12, 2, 'Fidelitti'),
(370, 12, 2, 'Ultima'),
(371, 12, 2, 'Fidelitti'),
(372, 12, 2, 'Fidelitti'),
(373, 12, 2, 'Fidelitti'),
(374, 12, 2, 'Fidelitti'),
(375, 12, 2, 'Fidelitti'),
(376, 12, 2, 'Fidelitti'),
(377, 12, 2, 'Fidelitti'),
(378, 12, 2, 'Fidelitti'),
(379, 12, 2, 'Fidelitti'),
(380, 12, 2, 'Fidelitti'),
(381, 12, 2, 'Fidelitti'),
(382, 12, 2, 'Fidelitti'),
(383, 12, 2, 'Fidelitti'),
(389, 12, 2, 'Fidelitti'),
(390, 12, 2, 'Fidelitti'),
(391, 12, 2, 'Fidelitti'),
(392, 12, 2, 'Fidelitti'),
(394, 12, 2, 'Fidelitti'),
(395, 12, 2, 'Fidelitti'),
(396, 12, 2, 'Fidelitti'),
(398, 12, 2, 'Fidelitti'),
(399, 12, 2, 'Fidelitti'),
(401, 12, 2, 'Fidelitti'),
(402, 12, 2, 'Fidelitti'),
(403, 12, 2, 'Fidelitti'),
(404, 12, 2, 'Fidelitti'),
(405, 12, 2, 'Fidelitti'),
(406, 12, 2, 'Fidelitti'),
(407, 12, 2, 'Fidelitti'),
(408, 12, 2, 'Fidelitti'),
(409, 12, 2, 'Fidelitti'),
(410, 12, 2, 'Fidelitti'),
(411, 12, 2, 'Fidelitti'),
(412, 12, 2, 'Fidelitti'),
(413, 12, 2, 'Fidelitti'),
(414, 12, 2, 'Fidelitti'),
(415, 12, 2, 'Fidelitti'),
(416, 12, 2, 'Fidelitti'),
(417, 12, 2, 'Fidelitti'),
(418, 12, 2, 'Fidelitti'),
(420, 12, 2, 'Fidelitti'),
(421, 12, 2, 'Fidelitti'),
(422, 12, 2, 'Fidelitti '),
(423, 12, 2, 'Fidelitti'),
(425, 12, 2, 'Fidelitti'),
(426, 12, 2, 'Fidelitti'),
(427, 12, 2, 'Fidelitti'),
(428, 12, 2, 'Fidelitti'),
(429, 12, 2, 'Fidelitti'),
(430, 12, 2, 'Fidelitti'),
(431, 12, 2, 'Fidelitti'),
(432, 12, 2, 'Fidelitti'),
(433, 12, 2, 'Fidelitti'),
(434, 12, 2, 'Fidelitti'),
(435, 12, 2, 'Fidelitti'),
(436, 12, 2, 'Fidelitti'),
(437, 12, 2, 'Fidelitti'),
(438, 12, 2, 'Fidelitti'),
(439, 12, 2, 'Fidelitti '),
(440, 12, 2, 'Fidelitti '),
(441, 12, 2, 'Fidelitti'),
(444, 12, 2, 'Fidelitti'),
(446, 12, 2, 'Fidelitti'),
(447, 12, 2, 'Fidelitti'),
(448, 12, 2, 'Fidelitti'),
(449, 12, 2, 'Fidelitti'),
(451, 12, 2, 'Fidelitti '),
(452, 12, 2, 'Fidelitti'),
(454, 12, 2, 'Fidelitti'),
(455, 12, 2, 'Fidelitti'),
(456, 12, 2, 'Fidelitti'),
(457, 12, 2, 'Fidelitti'),
(458, 12, 2, 'Fidelitti '),
(460, 12, 2, 'Fidelitti'),
(461, 17, 2, ''),
(297, 12, 3, 'Fidelitti'),
(303, 12, 3, 'Fidelitti'),
(304, 12, 3, 'Fidelitti'),
(305, 12, 3, 'Fidelitti'),
(307, 12, 3, 'Fidelitti'),
(308, 12, 3, 'Fidelitti'),
(310, 12, 3, 'Fidelitti'),
(311, 12, 3, 'Fidelitti'),
(312, 12, 3, 'Fidelitti'),
(313, 12, 3, 'Fidelitti'),
(314, 12, 3, 'Fidelitti'),
(315, 12, 3, 'Fidelitti'),
(316, 12, 3, 'Fidelitti'),
(317, 12, 3, 'Fidelitti'),
(318, 12, 3, 'Fidelitti'),
(319, 12, 3, 'Fidelitti'),
(320, 12, 3, 'Fidelitti'),
(322, 12, 3, 'Fidelitti'),
(323, 12, 3, 'Fidelitti'),
(324, 12, 3, 'Fidelitti'),
(325, 12, 3, 'Fidelitti'),
(326, 12, 3, 'Fidelitti'),
(327, 12, 3, 'Fidelitti'),
(328, 12, 3, 'Fidelitti'),
(329, 12, 3, 'Fidelitti'),
(330, 12, 3, 'Fidelitti'),
(331, 12, 3, 'Fidelitti'),
(332, 12, 3, 'Fidelitti'),
(333, 12, 3, 'Ultima'),
(334, 12, 3, 'Fidelitti'),
(335, 12, 3, 'Fidelitti'),
(336, 12, 3, 'Fidelitti'),
(337, 12, 3, 'Fidelitti'),
(339, 12, 3, 'Fidelitti'),
(340, 12, 3, 'Fedelta'),
(341, 12, 3, 'Fedelta'),
(343, 12, 3, 'Fidelitti'),
(345, 12, 3, 'Fidelitti'),
(347, 12, 3, 'Fidelitti'),
(348, 12, 3, 'Fidelitti'),
(349, 12, 3, 'Fidelitti'),
(350, 12, 3, 'Fidelitti'),
(351, 12, 3, 'Fidelitti'),
(352, 12, 3, 'Fidelitti'),
(353, 12, 3, 'Fidelitti'),
(355, 12, 3, 'Fidelitti'),
(356, 12, 3, 'Fidelitti'),
(357, 12, 3, 'Fidelitti'),
(359, 12, 3, 'Fidelitti'),
(360, 12, 3, 'Fidelitti'),
(361, 12, 3, 'Fidelitti'),
(362, 12, 3, 'Ultima'),
(363, 12, 3, 'Fidelitti'),
(364, 12, 3, 'Fidelitti'),
(365, 12, 3, 'Fedelta'),
(366, 12, 3, 'Fidelitti'),
(367, 12, 3, 'Fidelitti'),
(368, 12, 3, 'Fidelitti'),
(369, 12, 3, 'Fidelitti'),
(370, 12, 3, 'Ultima'),
(371, 12, 3, 'Fidelitti'),
(372, 12, 3, 'Fidelitti'),
(373, 12, 3, 'Fidelitti'),
(374, 12, 3, 'Fidelitti'),
(375, 12, 3, 'Fidelitti'),
(376, 12, 3, 'Fidelitti'),
(377, 12, 3, 'Fidelitti'),
(378, 12, 3, 'Fidelitti'),
(379, 12, 3, 'Fidelitti'),
(380, 12, 3, 'Fidelitti'),
(381, 12, 3, 'Fidelitti'),
(382, 12, 3, 'Fidelitti'),
(383, 12, 3, 'Fidelitti'),
(389, 12, 3, 'Fidelitti'),
(390, 12, 3, 'Fidelitti'),
(391, 12, 3, 'Fidelitti'),
(392, 12, 3, 'Fidelitti'),
(394, 12, 3, 'Fidelitti'),
(395, 12, 3, 'Fidelitti'),
(396, 12, 3, 'Fidelitti'),
(398, 12, 3, 'Fidelitti'),
(399, 12, 3, 'Fidelitti'),
(401, 12, 3, 'Fidelitti'),
(402, 12, 3, 'Fidelitti'),
(403, 12, 3, 'Fidelitti'),
(404, 12, 3, 'Fidelitti'),
(405, 12, 3, 'Fidelitti'),
(406, 12, 3, 'Fidelitti'),
(407, 12, 3, 'Fidelitti'),
(408, 12, 3, 'Fidelitti'),
(409, 12, 3, 'Fidelitti'),
(410, 12, 3, 'Fidelitti'),
(411, 12, 3, 'Fidelitti'),
(412, 12, 3, 'Fidelitti'),
(413, 12, 3, 'Fidelitti'),
(414, 12, 3, 'Fidelitti'),
(415, 12, 3, 'Fidelitti'),
(416, 12, 3, 'Fidelitti'),
(417, 12, 3, 'Fidelitti'),
(418, 12, 3, 'Fidelitti'),
(420, 12, 3, 'Fidelitti'),
(421, 12, 3, 'Fidelitti'),
(422, 12, 3, 'Fidelitti '),
(423, 12, 3, 'Fidelitti'),
(424, 17, 3, '100% - натуральна теляча шкіра Ante з природною лицьовою, 100% - метал'),
(425, 12, 3, 'Fidelitti'),
(426, 12, 3, 'Fidelitti'),
(427, 12, 3, 'Fidelitti'),
(428, 12, 3, 'Fidelitti'),
(429, 12, 3, 'Fidelitti'),
(430, 12, 3, 'Fidelitti'),
(431, 12, 3, 'Fidelitti'),
(432, 12, 3, 'Fidelitti'),
(433, 12, 3, 'Fidelitti'),
(434, 12, 3, 'Fidelitti'),
(435, 12, 3, 'Fidelitti'),
(436, 12, 3, 'Fidelitti'),
(437, 12, 3, 'Fidelitti'),
(438, 12, 3, 'Fidelitti'),
(439, 12, 3, 'Fidelitti '),
(440, 12, 3, 'Fidelitti '),
(441, 12, 3, 'Fidelitti'),
(444, 12, 3, 'Fidelitti'),
(446, 12, 3, 'Fidelitti'),
(447, 12, 3, 'Fidelitti'),
(448, 12, 3, 'Fidelitti'),
(449, 12, 3, 'Fidelitti'),
(451, 12, 3, 'Fidelitti '),
(452, 12, 3, 'Fidelitti'),
(454, 12, 3, 'Fidelitti'),
(455, 12, 3, 'Fidelitti'),
(456, 12, 3, 'Fidelitti'),
(457, 12, 3, 'Fidelitti'),
(458, 12, 3, 'Fidelitti '),
(460, 12, 3, 'Fidelitti'),
(461, 17, 3, ''),
(320, 13, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100 % кожа Brunto'),
(366, 13, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(378, 13, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(409, 13, 1, 'Снаружи 100% - натуральная телячья кожа Ante, 100% - металл. Внутри 100% микрофибра.'),
(416, 13, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100 % кожа Brunto.'),
(420, 13, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(421, 13, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(422, 13, 1, 'Отделка из гладкой телячьей кожи Ante и блестки на кожволокне, 100% - металл. Внутри 100% микрофибра'),
(423, 13, 1, 'Снаружи \r\n100% - натуральная телячья кожа Ante, \r\n100% - металл. Внутри 100% микрофибра.'),
(424, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(425, 13, 1, 'Снаружи \r\n100% - натуральная телячья кожа Ante, \r\n100% - металл. Внутри 100% микрофибра.'),
(426, 13, 1, 'Снаружи \r\n100% - натуральная телячья кожа Ante, \r\n100% - металл. Внутри 100% микрофибра.'),
(427, 13, 1, 'Снаружи \r\n100% - натуральная телячья кожа Ante, \r\n100% - металл. Внутри 100% микрофибра.'),
(428, 13, 1, 'Снаружи 100% - натуральная телячья кожа Ante, 100% - металл. Внутри 65% текстиль, 35% кожа Ante'),
(429, 13, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(430, 13, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(431, 13, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(432, 13, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(433, 13, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(434, 13, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(435, 13, 1, 'Снаружи 100% - натуральная телячья кожа Ante,100% - металл. Внутри 100% микрофибра.'),
(436, 13, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(437, 13, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(438, 13, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(439, 13, 1, 'Отделка из гладкой телячьей кожи Ante и блестки на кожволокне, 100% - металл. Внутри 100% микрофибра'),
(440, 13, 1, 'Отделка из гладкой телячьей кожи Ante и блестки на кожволокне, 100% - металл. Внутри 100% микрофибра'),
(320, 13, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% leather Brunto'),
(366, 13, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(378, 13, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(409, 13, 2, 'Exterior: 100% genuine calfskin leather Ante, 100% metal. Interior: 100% microfiber.'),
(416, 13, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% leather Brunto.'),
(420, 13, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(421, 13, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(422, 13, 2, 'Coated with smooth calfskin leather Ante and glitter on the leather fiber, 100% metal. Interior: 100% microfiber'),
(423, 13, 2, 'Exterior: \r\n100% genuine calfskin leather Ante, \r\n100% metal Interior: 100% microfiber.'),
(424, 14, 3, 'рожевий'),
(424, 14, 2, 'pink'),
(425, 13, 2, 'Exterior: \r\n100% genuine calfskin leather Ante, \r\n100% metal Interior: 100% microfiber.'),
(426, 13, 2, 'Exterior: \r\n100% genuine calfskin leather Ante, \r\n100% metal Interior: 100% microfiber.'),
(427, 13, 2, 'Exterior: \r\n100% genuine calfskin leather Ante, \r\n100% metal Interior: 100% microfiber.'),
(428, 13, 2, 'Exterior: 100% genuine calfskin leather Ante, 100% metal. Interior: 65% fabric, 35% leather Ante'),
(429, 13, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(430, 13, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(431, 13, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(432, 13, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(433, 13, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(434, 13, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(435, 13, 2, 'Exterior: 100% genuine calfskin leather Ante, 100% metal. Interior: 100% microfiber.'),
(436, 13, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(437, 13, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(438, 13, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(439, 13, 2, 'Coated with smooth calfskin leather Ante and glitter on the leather fiber, 100% metal. Interior: 100% microfiber'),
(440, 13, 2, 'Coated with smooth calfskin leather Ante and glitter on the leather fiber, 100% metal. Interior: 100% microfiber'),
(320, 13, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100 % шкіра Brunto.'),
(366, 13, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(378, 13, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(409, 13, 3, 'Зовні 100% - натуральна теляча шкіра Ante, 100% - метал. Всередині 100% мікрофібра.'),
(416, 13, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100 % шкіра Brunto.'),
(420, 13, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(421, 13, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(422, 13, 3, 'Оздоблення з гладкої телячої шкіри Ante та блискітки на шкірволокні, 100% - метал. Всередині 100% мікрофібра'),
(423, 13, 3, 'Зовні \r\n100% - натуральна теляча шкіра Ante, \r\n100% - метал. Всередині 100% мікрофібра.'),
(424, 14, 1, 'розовый'),
(425, 13, 3, 'Зовні \r\n100% - натуральна теляча шкіра Ante, \r\n100% - метал. Всередині 100% мікрофібра.'),
(426, 13, 3, 'Зовні \r\n100% - натуральна теляча шкіра Ante, \r\n100% - метал. Всередині 100% мікрофібра.'),
(427, 13, 3, 'Зовні \r\n100% - натуральна теляча шкіра Ante, \r\n100% - метал. Всередині 100% мікрофібра.'),
(428, 13, 3, 'Зовні 100% - натуральна теляча шкіра Ante, 100% - метал. Всередині 65% текстиль, 35% шкіра Ante'),
(429, 13, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(430, 13, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(431, 13, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(432, 13, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(433, 13, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(434, 13, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(435, 13, 3, 'Зовні 100% - натуральна теляча шкіра Ante, 100% - метал. Всередині 100% мікрофібра.'),
(436, 13, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(437, 13, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(438, 13, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(439, 13, 3, 'Оздоблення з гладкої телячої шкіри Ante та блискітки на шкірволокні, 100% - метал. Всередині 100% мікрофібра'),
(440, 13, 3, 'Оздоблення з гладкої телячої шкіри Ante та блискітки на шкірволокні, 100% - метал. Всередині 100% мікрофібра'),
(297, 14, 1, 'голубой'),
(303, 14, 1, 'темно-красный'),
(304, 14, 1, 'темно-красный'),
(305, 14, 1, 'коричневый'),
(307, 14, 1, 'зелёный'),
(308, 14, 1, 'чёрный'),
(310, 14, 1, 'серый'),
(311, 14, 1, 'серый'),
(312, 14, 1, 'красный'),
(313, 14, 1, 'темно-красный'),
(314, 14, 1, 'темно-красный'),
(315, 14, 1, 'темно-красный'),
(316, 14, 1, 'коричневый'),
(317, 14, 1, 'коричневый'),
(318, 14, 1, 'зелёный'),
(319, 14, 1, 'зелёный'),
(320, 14, 1, 'белый'),
(322, 14, 1, 'бежевый'),
(323, 14, 1, 'розовый'),
(324, 14, 1, 'голубой'),
(325, 14, 1, 'голубой'),
(326, 14, 1, 'голубой'),
(327, 14, 1, 'синий'),
(328, 14, 1, 'фиолетовый'),
(329, 14, 1, 'коричневый'),
(330, 14, 1, 'жёлтый'),
(331, 14, 1, 'синий'),
(332, 14, 1, 'синий'),
(333, 14, 1, 'синий'),
(334, 14, 1, 'чёрный'),
(335, 14, 1, 'чёрный'),
(336, 14, 1, 'чёрный'),
(337, 14, 1, 'чёрный'),
(339, 14, 1, 'чёрный'),
(340, 14, 1, 'серебро'),
(341, 14, 1, 'золотой'),
(343, 14, 1, 'голубой'),
(345, 14, 1, 'розовый'),
(347, 14, 1, 'голубой'),
(348, 14, 1, 'серый'),
(349, 14, 1, 'серый'),
(350, 14, 1, 'серый'),
(351, 14, 1, 'серый'),
(352, 14, 1, 'коричневый'),
(353, 14, 1, 'темно-красный'),
(355, 14, 1, 'темно-красный'),
(356, 14, 1, 'синий'),
(357, 14, 1, 'синий'),
(359, 14, 1, 'синий'),
(360, 14, 1, 'зелёный'),
(361, 14, 1, 'фиолетовый'),
(362, 14, 1, 'синий'),
(363, 14, 1, 'чёрный'),
(364, 14, 1, 'чёрный'),
(365, 14, 1, 'чёрный'),
(366, 14, 1, 'белый'),
(367, 14, 1, 'голубой'),
(368, 14, 1, 'серый'),
(369, 14, 1, 'синий'),
(370, 14, 1, 'синий'),
(371, 14, 1, 'коричневый'),
(372, 14, 1, 'чёрный'),
(373, 14, 1, 'темно-красный'),
(374, 14, 1, 'зелёный'),
(375, 14, 1, 'фиолетовый'),
(376, 14, 1, 'темно-красный'),
(377, 14, 1, 'синий'),
(378, 14, 1, 'синий'),
(379, 14, 1, 'серый'),
(380, 14, 1, 'фиолетовый'),
(381, 14, 1, 'чёрный'),
(382, 14, 1, 'чёрный'),
(383, 14, 1, 'чёрный'),
(389, 14, 1, 'синий'),
(390, 14, 1, 'синий'),
(391, 14, 1, 'зеленый'),
(392, 14, 1, 'серый'),
(394, 14, 1, 'темно-красный'),
(395, 14, 1, 'фиолетовый'),
(396, 14, 1, 'чёрный'),
(398, 14, 1, 'фиолетовый'),
(399, 14, 1, 'серый'),
(401, 14, 1, 'синий'),
(402, 14, 1, 'синий'),
(403, 14, 1, 'зелёный'),
(404, 14, 1, 'чёрный'),
(405, 14, 1, 'чёрный'),
(406, 14, 1, 'чёрный'),
(407, 14, 1, 'чёрный'),
(408, 14, 1, 'красный'),
(409, 14, 1, 'чёрный'),
(410, 14, 1, 'чёрный'),
(411, 14, 1, 'голубой'),
(412, 14, 1, 'голубой'),
(413, 14, 1, 'голубой'),
(414, 14, 1, 'розовый'),
(415, 14, 1, 'розовый'),
(416, 14, 1, 'красный'),
(417, 14, 1, 'чёрный'),
(418, 14, 1, 'чёрный'),
(420, 14, 1, 'белый'),
(421, 14, 1, 'жёлтый'),
(422, 14, 1, 'черный'),
(423, 14, 1, 'белый'),
(425, 14, 1, 'голубой'),
(426, 14, 1, 'зелёный'),
(427, 14, 1, 'красный'),
(428, 14, 1, 'черный'),
(429, 14, 1, 'фиолетовый'),
(430, 14, 1, 'фиолетовый'),
(431, 14, 1, 'голубой'),
(432, 14, 1, 'фиолетовый'),
(433, 14, 1, 'фиолетовый'),
(434, 14, 1, 'голубой'),
(435, 14, 1, 'розовый'),
(436, 14, 1, 'голубой'),
(437, 14, 1, 'розовый'),
(438, 14, 1, 'бежевый'),
(439, 14, 1, 'золотой'),
(440, 14, 1, 'серый'),
(441, 14, 1, 'голубой'),
(444, 14, 1, 'бежевый'),
(446, 14, 1, 'розовый'),
(447, 14, 1, 'голубой'),
(448, 14, 1, 'белый'),
(449, 14, 1, 'белый'),
(450, 14, 1, 'розовый'),
(451, 14, 1, 'желтый'),
(452, 14, 1, 'розовый'),
(454, 14, 1, 'жёлтый'),
(455, 14, 1, 'белый'),
(456, 14, 1, 'серый'),
(457, 14, 1, 'зелёный'),
(460, 14, 1, 'розовый'),
(297, 14, 2, 'blue'),
(303, 14, 2, 'crimson'),
(304, 14, 2, 'crimson'),
(305, 14, 2, 'brown'),
(307, 14, 2, 'green'),
(308, 14, 2, 'black'),
(310, 14, 2, 'grey'),
(311, 14, 2, 'grey'),
(312, 14, 2, 'red'),
(313, 14, 2, 'crimson'),
(314, 14, 2, 'crimson'),
(315, 14, 2, 'crimson'),
(316, 14, 2, 'brown'),
(317, 14, 2, 'brown'),
(318, 14, 2, 'green'),
(319, 14, 2, 'green'),
(320, 14, 2, 'white'),
(322, 14, 2, 'beige'),
(323, 14, 2, 'pink'),
(324, 14, 2, 'blue'),
(325, 14, 2, 'blue'),
(326, 14, 2, 'blue'),
(327, 14, 2, 'dark blue'),
(328, 14, 2, 'purple'),
(329, 14, 2, 'brown'),
(330, 14, 2, 'yellow'),
(331, 14, 2, 'dark blue'),
(332, 14, 2, 'dark blue'),
(333, 14, 2, 'dark blue'),
(334, 14, 2, 'black'),
(335, 14, 2, 'black'),
(336, 14, 2, 'black'),
(337, 14, 2, 'black'),
(339, 14, 2, 'black'),
(340, 14, 2, 'silver'),
(341, 14, 2, 'golden'),
(343, 14, 2, 'blue'),
(345, 14, 2, 'pink'),
(347, 14, 2, 'blue'),
(348, 14, 2, 'grey'),
(349, 14, 2, 'grey'),
(350, 14, 2, 'grey'),
(351, 14, 2, 'grey'),
(352, 14, 2, 'brown'),
(353, 14, 2, 'crimson'),
(355, 14, 2, 'crimson'),
(356, 14, 2, 'dark blue'),
(357, 14, 2, 'dark blue'),
(359, 14, 2, 'dark blue'),
(360, 14, 2, 'green'),
(361, 14, 2, 'purple'),
(362, 14, 2, 'dark blue'),
(363, 14, 2, 'black'),
(364, 14, 2, 'black'),
(365, 14, 2, 'black'),
(366, 14, 2, 'white'),
(367, 14, 2, 'blue'),
(368, 14, 2, 'grey'),
(369, 14, 2, 'dark blue'),
(370, 14, 2, 'dark blue'),
(371, 14, 2, 'brown'),
(372, 14, 2, 'black'),
(373, 14, 2, 'crimson'),
(374, 14, 2, 'green'),
(375, 14, 2, 'purple'),
(376, 14, 2, 'crimson'),
(377, 14, 2, 'dark blue'),
(378, 14, 2, 'dark blue'),
(379, 14, 2, 'grey'),
(380, 14, 2, 'purple'),
(381, 14, 2, 'black'),
(382, 14, 2, 'black'),
(383, 14, 2, 'black'),
(389, 14, 2, 'dark blue'),
(390, 14, 2, 'dark blue'),
(391, 14, 2, 'green'),
(392, 14, 2, 'grey'),
(394, 14, 2, 'crimson'),
(395, 14, 2, 'purple'),
(396, 14, 2, 'black'),
(398, 14, 2, 'purple'),
(399, 14, 2, 'grey'),
(401, 14, 2, 'dark blue'),
(402, 14, 2, 'dark blue'),
(403, 14, 2, 'green'),
(404, 14, 2, 'black'),
(405, 14, 2, 'black'),
(406, 14, 2, 'black'),
(407, 14, 2, 'black'),
(408, 14, 2, 'red'),
(409, 14, 2, 'black'),
(410, 14, 2, 'black'),
(411, 14, 2, 'blue'),
(412, 14, 2, 'blue'),
(413, 14, 2, 'blue'),
(414, 14, 2, 'pink'),
(415, 14, 2, 'pink'),
(416, 14, 2, 'red'),
(417, 14, 2, 'black'),
(418, 14, 2, 'black'),
(420, 14, 2, 'white'),
(421, 14, 2, 'yellow'),
(422, 14, 2, 'black'),
(423, 14, 2, 'white'),
(424, 13, 2, 'Exterior: 100% genuine calfskin leather Ante, 100% metal. Interior: 100% microfiber.'),
(425, 14, 2, 'blue'),
(426, 14, 2, 'green'),
(427, 14, 2, 'red'),
(428, 14, 2, 'black'),
(429, 14, 2, 'purple'),
(430, 14, 2, 'purple'),
(431, 14, 2, 'blue'),
(432, 14, 2, 'purple'),
(433, 14, 2, 'purple'),
(434, 14, 2, 'blue'),
(435, 14, 2, 'pink'),
(436, 14, 2, 'blue'),
(437, 14, 2, 'pink'),
(438, 14, 2, 'beige'),
(439, 14, 2, 'golden'),
(440, 14, 2, 'grey'),
(441, 14, 2, ''),
(444, 14, 2, 'beige'),
(446, 14, 2, 'pink'),
(447, 14, 2, 'blue'),
(448, 14, 2, 'white'),
(449, 14, 2, 'white'),
(450, 14, 2, 'pink'),
(451, 14, 2, 'yellow'),
(452, 14, 2, 'pink'),
(454, 14, 2, ''),
(455, 14, 2, 'white'),
(456, 14, 2, 'grey'),
(457, 14, 2, ''),
(460, 14, 2, ''),
(297, 14, 3, 'блакитний'),
(303, 14, 3, 'темно-червоний'),
(304, 14, 3, 'темно-червоний'),
(305, 14, 3, 'коричневий'),
(307, 14, 3, 'зелений'),
(308, 14, 3, 'чорний'),
(310, 14, 3, 'сірий'),
(311, 14, 3, 'сірий'),
(312, 14, 3, 'червоний'),
(313, 14, 3, 'темно-червоний'),
(314, 14, 3, 'темно-червоний'),
(315, 14, 3, 'темно-червоний'),
(316, 14, 3, 'коричневий'),
(317, 14, 3, 'коричневий'),
(318, 14, 3, 'зелений'),
(319, 14, 3, 'зелений'),
(320, 14, 3, 'білий'),
(322, 14, 3, 'бежевий'),
(323, 14, 3, 'рожевий'),
(324, 14, 3, 'блакитний'),
(325, 14, 3, 'блакитний'),
(326, 14, 3, 'блакитний'),
(327, 14, 3, 'синій'),
(328, 14, 3, 'фіолетовий'),
(329, 14, 3, 'коричневий'),
(330, 14, 3, 'жовтий'),
(331, 14, 3, 'синій'),
(332, 14, 3, 'синій'),
(333, 14, 3, 'синій'),
(334, 14, 3, 'чорний'),
(335, 14, 3, 'чорний'),
(336, 14, 3, 'чорний'),
(337, 14, 3, 'чорний'),
(339, 14, 3, 'чорний'),
(340, 14, 3, 'срібло'),
(341, 14, 3, 'золотий'),
(343, 14, 3, 'блакитний'),
(345, 14, 3, 'рожевий'),
(347, 14, 3, 'блакитний'),
(348, 14, 3, 'сірий'),
(349, 14, 3, 'сірий'),
(350, 14, 3, 'сірий'),
(351, 14, 3, 'сірий'),
(352, 14, 3, 'коричневий'),
(353, 14, 3, 'темно-червоний'),
(354, 17, 3, '100% - натуральна теляча шкіра Ante з природною лицьовою, 100% - метал'),
(355, 14, 3, 'темно-червоний'),
(356, 14, 3, 'синій'),
(357, 14, 3, 'синій'),
(359, 14, 3, 'синій'),
(360, 14, 3, 'зелений'),
(361, 14, 3, 'фіолетовий'),
(362, 14, 3, 'синій'),
(363, 14, 3, 'чорний'),
(364, 14, 3, 'чорний'),
(365, 14, 3, 'чорний'),
(366, 14, 3, 'білий'),
(367, 14, 3, 'блакитний'),
(368, 14, 3, 'сірий'),
(369, 14, 3, 'синій'),
(370, 14, 3, 'синій'),
(371, 14, 3, 'коричневий'),
(372, 14, 3, 'чорний'),
(373, 14, 3, 'темно-червоний'),
(374, 14, 3, 'зелений'),
(375, 14, 3, 'фіолетовий'),
(376, 14, 3, 'темно-червоний'),
(377, 14, 3, 'синій'),
(378, 14, 3, 'синій'),
(379, 14, 3, 'сірий'),
(380, 14, 3, 'фіолетовий'),
(381, 14, 3, 'чорний'),
(382, 14, 3, 'чорний'),
(383, 14, 3, 'чорний'),
(389, 14, 3, 'синій'),
(390, 14, 3, 'синій'),
(391, 14, 3, 'зелений'),
(392, 14, 3, 'сірий'),
(394, 14, 3, 'темно-червоний'),
(395, 14, 3, 'фіолетовий'),
(396, 14, 3, 'чорний'),
(398, 14, 3, 'фіолетовий'),
(399, 14, 3, 'сірий'),
(401, 14, 3, 'синій'),
(402, 14, 3, 'синій'),
(403, 14, 3, 'зелений'),
(404, 14, 3, 'чорний'),
(405, 14, 3, 'чорний'),
(406, 14, 3, 'чорний'),
(407, 14, 3, 'чорний'),
(408, 14, 3, 'червоний'),
(409, 14, 3, 'чорний'),
(410, 14, 3, 'чорний'),
(411, 14, 3, 'блакитний'),
(412, 14, 3, 'блакитний'),
(413, 14, 3, 'блакитний'),
(414, 14, 3, 'рожевий'),
(415, 14, 3, 'рожевий'),
(416, 14, 3, 'червоний'),
(417, 14, 3, 'чорний'),
(418, 14, 3, 'чорний'),
(420, 14, 3, 'білий'),
(421, 14, 3, 'жовтий'),
(422, 14, 3, 'чорний'),
(423, 14, 3, 'білий'),
(425, 14, 3, 'блакитний'),
(426, 14, 3, 'зелений'),
(427, 14, 3, 'червоний'),
(428, 14, 3, 'чорний'),
(429, 14, 3, 'фіолетовий'),
(430, 14, 3, 'фіолетовий'),
(431, 14, 3, 'блакитний'),
(432, 14, 3, 'фіолетовий'),
(433, 14, 3, 'фіолетовий'),
(434, 14, 3, 'блакитний'),
(435, 14, 3, 'рожевий'),
(436, 14, 3, 'блакитний'),
(437, 14, 3, 'рожевий'),
(438, 14, 3, 'бежевий'),
(439, 14, 3, 'золотий'),
(440, 14, 3, 'сірий'),
(441, 14, 3, 'блакитний'),
(444, 14, 3, 'бежевий'),
(446, 14, 3, 'рожевий'),
(447, 14, 3, 'блакитний'),
(448, 14, 3, 'білий'),
(449, 14, 3, 'білий'),
(450, 14, 3, 'рожевий'),
(451, 14, 3, 'жовтий'),
(452, 14, 3, 'рожевий'),
(454, 14, 3, 'жовтий'),
(455, 14, 3, 'білий'),
(456, 14, 3, 'сірий'),
(457, 14, 3, 'зелений'),
(460, 14, 3, 'рожевий'),
(297, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(303, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(304, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(305, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(307, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(308, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(310, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(311, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(312, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(313, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Ante, \r\n100% - металл. Внутри 100% микрофибра.'),
(314, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(315, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(316, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(317, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(318, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(319, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(322, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(323, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Ante, \r\n100% - металл. Внутри 100% микрофибра.'),
(324, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(325, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(326, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(327, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(328, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(329, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(330, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(331, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(332, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(333, 16, 1, 'Снаружи 100% - натуральная телячья кожа Etro, 100% - мех пони, 100% - металл. Внутри 100% микрофибра.'),
(334, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(335, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(336, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(337, 16, 1, 'Снаружи 100% - натуральная телячья кожа Ante, 100% - металл. Внутри 100% микрофибра.'),
(339, 16, 1, 'Снаружи 100% - натуральная телячья кожа Ante, 100% - металл. Внутри 100% микрофибра.'),
(340, 16, 1, 'Снаружи 100% - экокожа, 100% - металл. Внутри 100% микрофибра.'),
(341, 16, 1, 'Снаружи 100% - экокожа, 100% - металл. Внутри 100% микрофибра.'),
(343, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(344, 16, 3, 'Зовні 100% - натуральна теляча шкіра Ante, 100% - метал. Всередині 100% мікрофібра.'),
(345, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(347, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(348, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(349, 16, 1, 'Снаружи 100% - натуральная телячья кожа Ante, 100% - металл. Внутри 100% микрофибра.'),
(350, 16, 1, 'Снаружи 100% - натуральная телячья кожа Ante, 100% - металл. Внутри 100% микрофибра.'),
(351, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(352, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(353, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(354, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(355, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(356, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(357, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(359, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(360, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(361, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(362, 16, 1, 'Снаружи 100% - натуральная телячья кожа Etro, 100 % - мех пони, 100% - металл. Внутри 100% микрофибра.'),
(363, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(364, 16, 1, 'Снаружи 100% - натуральная телячья кожа Ante, 100% - металл. Внутри 100% микрофибра.'),
(365, 16, 1, 'Снаружи 100% - экокожа, 100% - металл. Внутри 100% микрофибра.'),
(367, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(368, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(369, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(370, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - натуральный мех пони, 100% - металл. Внутри 100% микрофибра.'),
(371, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(372, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(373, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(374, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(375, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(376, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(377, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(379, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(380, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(381, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(382, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(383, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(389, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(390, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(391, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(392, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(394, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(395, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(396, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(398, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% текстиль.'),
(399, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% текстиль.'),
(401, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% текстиль.'),
(402, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% текстиль.'),
(403, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% текстиль.'),
(404, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% текстиль.'),
(405, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% текстиль.'),
(406, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(407, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% тестиль.'),
(408, 16, 1, 'Снаружи 100% - натуральная телячья кожа Ante, 100% - металл. Внутри 100% микрофибра.'),
(410, 16, 1, 'Снаружи 100% - натуральная телячья кожа Ante, 100% - металл. Внутри 65% текстиль, 35% кожа Ante'),
(411, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% натуральная телячья кожа Brunto.'),
(412, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% - натуральная телячья кожа Brunto.'),
(413, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% - натуральная телячья кожа Brunto.'),
(414, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% - натуральная телячья кожа Brunto.'),
(415, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% - натуральная телячья кожа Brunto.'),
(417, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100 % кожа Brunto'),
(418, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100 % кожа Brunto'),
(441, 16, 1, 'Снаружи 100% - натуральная телячья кожа Ante, 100% - металл. Внутри 100% микрофибра.'),
(444, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(446, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(447, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(448, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(449, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(450, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(451, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(452, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(454, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(455, 16, 1, 'Снаружи 100% - натуральная телячья кожа Ante, 100% - металл. Внутри 100% микрофибра.'),
(456, 16, 1, 'Снаружи \r\n100% - натуральная телячья кожа Brunto, \r\n100% - металл. Внутри 100% микрофибра.'),
(457, 16, 1, 'Снаружи 100% - натуральная телячья кожа Ante, 100% - металл. Внутри 100% микрофибра.'),
(458, 16, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% микрофибра.'),
(459, 16, 1, 'Снаружи 100% - натуральная телячья кожа Ante, 100% - металл. Внутри 100% микрофибра.'),
(460, 16, 1, 'Снаружи 100% - натуральная телячья кожа Ante, 100% - металл. Внутри 100% микрофибра.'),
(297, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(303, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(304, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(305, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(307, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(308, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(310, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(311, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(312, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(313, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Ante, \r\n100% metal Interior: 100% microfiber.'),
(314, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(315, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(316, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(317, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(318, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(319, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(322, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(323, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Ante, \r\n100% metal Interior: 100% microfiber.'),
(324, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(325, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(326, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(327, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(328, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(329, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(330, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(331, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(332, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(333, 16, 2, 'Exterior: 100% genuine calfskin leather Etro, 100% pony fur, 100% metal Interior: 100% microfiber.'),
(334, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(335, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(336, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(337, 16, 2, 'Exterior: 100% genuine calfskin leather Ante, 100% metal. Interior: 100% microfiber.'),
(339, 16, 2, 'Exterior: 100% genuine calfskin leather Ante, 100% metal. Interior: 100% microfiber.'),
(340, 16, 2, 'Exterior: 100% eco-leather, 100% metal Interior: 100% microfiber.'),
(341, 16, 2, 'Exterior: 100% eco-leather, 100% metal Interior: 100% microfiber.'),
(343, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(344, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(345, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(347, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(348, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(349, 16, 2, 'Exterior: 100% genuine calfskin leather Ante, 100% metal. Interior: 100% microfiber.'),
(350, 16, 2, 'Exterior: 100% genuine calfskin leather Ante, 100% metal. Interior: 100% microfiber.'),
(351, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(352, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(353, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(354, 16, 2, 'Exterior: 100% genuine calfskin leather Ante, 100% metal. Interior: 100% microfiber.'),
(355, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(356, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(357, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(359, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(360, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(361, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(362, 16, 2, 'Exterior: 100% genuine calfskin leather Etro, 100% pony fur, 100% metal Interior: 100% microfiber.'),
(363, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(364, 16, 2, 'Exterior: 100% genuine calfskin leather Ante, 100% metal. Interior: 100% microfiber.'),
(365, 16, 2, 'Exterior: 100% eco-leather, 100% metal Interior: 100% microfiber.'),
(367, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(368, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(369, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(370, 16, 2, '100% genuine calfskin leather Brunto, 100% natural pony fur, 100% metal Interior: 100% microfiber.'),
(371, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(372, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(373, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(374, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(375, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(376, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(377, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(379, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(380, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(381, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(382, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(383, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(389, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(390, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(391, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(392, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(394, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(395, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(396, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(398, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% fabric.'),
(399, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% fabric.'),
(401, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% fabric.'),
(402, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% fabric.'),
(403, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% fabric.'),
(404, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% fabric.'),
(405, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% fabric.'),
(406, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(407, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% fabric.'),
(408, 16, 2, 'Exterior: 100% genuine calfskin leather Ante, 100% metal. Interior: 100% microfiber.'),
(410, 16, 2, 'Exterior: 100% genuine calfskin leather Ante, 100% metal. Interior: 65% fabric, 35% leather Ante'),
(411, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% genuine calfskin leather Brunto.'),
(412, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% genuine calfskin leather Brunto.'),
(413, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% genuine calfskin leather Brunto.'),
(414, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% genuine calfskin leather Brunto.'),
(415, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% genuine calfskin leather Brunto.'),
(417, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% leather Brunto'),
(418, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% leather Brunto'),
(441, 16, 2, 'Exterior: 100% genuine calfskin leather Ante, 100% metal. Interior: 100% microfiber.'),
(444, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.');
INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(446, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(447, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(448, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(449, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(450, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(451, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(452, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(454, 16, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% microfiber.'),
(455, 16, 2, 'Exterior: 100% genuine calfskin leather Ante, 100% metal. Interior: 100% microfiber.'),
(456, 16, 2, 'Exterior: \r\n100% genuine calfskin leather Brunto. \r\n100% metal Interior: 100% microfiber.'),
(457, 16, 2, 'Exterior: 100% genuine calfskin leather Ante, 100% metal. Interior: 100% microfiber.'),
(458, 16, 2, ''),
(459, 16, 2, ''),
(460, 16, 2, ''),
(297, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(303, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(304, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(305, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(307, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(308, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(310, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(311, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(312, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(313, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Ante, \r\n100% - метал. Всередині 100% мікрофібра.'),
(314, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(315, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(316, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(317, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(318, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(319, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(322, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(323, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Ante, \r\n100% - метал. Всередині 100% мікрофібра.'),
(324, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(325, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(326, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(327, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(328, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(329, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(330, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(331, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(332, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(333, 16, 3, 'Зовні 100% - натуральна теляча шкіра Etro, 100% - хутро поні, 100% - метал Всередині 100% мікрофібра.'),
(334, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(335, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(336, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(337, 16, 3, 'Зовні 100% - натуральна теляча шкіра Ante, 100% - метал. Всередині 100% мікрофібра.'),
(339, 16, 3, 'Зовні 100% - натуральна теляча шкіра Ante, 100% - метал. Всередині 100% мікрофібра.'),
(340, 16, 3, 'Зовні 100% - екошкіра, 100% - метал Всередині 100% мікрофібра.'),
(341, 16, 3, 'Зовні 100% - екошкіра, 100% - метал Всередині 100% мікрофібра.'),
(343, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(344, 16, 2, 'Exterior: 100% genuine calfskin leather Ante, 100% metal. Interior: 100% microfiber.'),
(345, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(347, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(348, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(349, 16, 3, 'Зовні 100% - натуральна теляча шкіра Ante, 100% - метал. Всередині 100% мікрофібра.'),
(350, 16, 3, 'Зовні 100% - натуральна теляча шкіра Ante, 100% - метал. Всередині 100% мікрофібра.'),
(351, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(352, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(353, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(355, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(356, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(357, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(359, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(360, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(361, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(362, 16, 3, 'Зовні 100% - натуральна теляча шкіра Etro, 100% - хутро поні, 100% - метал Всередині 100% мікрофібра.'),
(363, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(364, 16, 3, 'Зовні 100% - натуральна теляча шкіра Ante, 100% - метал. Всередині 100% мікрофібра.'),
(365, 16, 3, 'Зовні 100% - екошкіра, 100% - метал Всередині 100% мікрофібра.'),
(367, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(368, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(369, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(370, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - натуральне хутро поні, 100% - метал Всередині 100% мікрофібра.'),
(371, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(372, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(373, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(374, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(375, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(376, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(377, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(379, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(380, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(381, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(382, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(383, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(389, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(390, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(391, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(392, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(394, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(395, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(396, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(398, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% текстиль.'),
(399, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% текстиль.'),
(401, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% текстиль.'),
(402, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% текстиль.'),
(403, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% текстиль.'),
(404, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% текстиль.'),
(405, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% текстиль.'),
(406, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(407, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% текстиль.'),
(408, 16, 3, 'Зовні 100% - натуральна теляча шкіра Ante, 100% - метал. Всередині 100% мікрофібра.'),
(410, 16, 3, 'Зовні 100% - натуральна теляча шкіра Ante, 100% - метал. Всередині 65% текстиль, 35% шкіра Ante'),
(411, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% - натуральна теляча шкіра Brunto.'),
(412, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% - натуральна теляча шкіра Brunto.'),
(413, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% - натуральна теляча шкіра Brunto.'),
(414, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% - натуральна теляча шкіра Brunto.'),
(415, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% - натуральна теляча шкіра Brunto.'),
(417, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100 % шкіра Brunto.'),
(418, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100 % шкіра Brunto.'),
(441, 16, 3, 'Зовні 100% - натуральна теляча шкіра Ante, 100% - метал. Всередині 100% мікрофібра.'),
(444, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(446, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(447, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(448, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(449, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(450, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(451, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(452, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(454, 16, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% мікрофібра.'),
(455, 16, 3, 'Зовні 100% - натуральна теляча шкіра Ante, 100% - метал. Всередині 100% мікрофібра.'),
(456, 16, 3, 'Зовні \r\n100% - натуральна теляча шкіра Brunto, \r\n100% - метал. Всередині 100% мікрофібра.'),
(457, 16, 3, 'Зовні 100% - натуральна теляча шкіра Ante, 100% - метал. Всередині 100% мікрофібра.'),
(458, 16, 3, ''),
(459, 16, 3, ''),
(460, 16, 3, ''),
(297, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(303, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(304, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(305, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(307, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(308, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(310, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(311, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(312, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(313, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(314, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(315, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(316, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(317, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(318, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(319, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(320, 17, 1, '100%  микрофибра'),
(322, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(323, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(324, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(325, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(326, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(327, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(328, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(329, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(330, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(331, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(332, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(333, 17, 1, '100% - натуральная телячья кожа Etro, 100% - мех пони, 100% - металл'),
(334, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(335, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(336, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(337, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(339, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(340, 17, 1, 'Снаружи 100% - экокожа, 100% - металл'),
(341, 17, 1, 'Снаружи 100% - экокожа, 100% - металл'),
(343, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(345, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(347, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(348, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(349, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(350, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(351, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(352, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(353, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(354, 16, 3, 'Зовні 100% - натуральна теляча шкіра Ante, 100% - метал. Всередині 100% мікрофібра.'),
(355, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(356, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(357, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(359, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(360, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой,100% - металл'),
(361, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(362, 17, 1, '100% - натуральная телячья кожа Etro, 100 % - мех пони, 100% - металл'),
(363, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(364, 17, 1, '100% - натуральная телячья кожа Ante, 100% - металл'),
(365, 17, 1, '100% - экокожа, 100% - металл'),
(366, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(367, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(368, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(369, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(370, 17, 1, '100% - натуральная телячья кожа Brunto, 100% - натуральный мех пони, 100% - металл'),
(371, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(372, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(373, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(374, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(375, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(376, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(377, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(378, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(379, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(380, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(381, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(382, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(383, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(389, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(390, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(391, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(392, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(394, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(395, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(396, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(398, 17, 1, 'Снаружи 100% - натуральная телячья кожа Brunto, 100% - металл. Внутри 100% текстиль.'),
(399, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(401, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(402, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(403, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(404, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(405, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(406, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(407, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(408, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(409, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(410, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(411, 17, 1, '100% - натуральная телячья кожа Brunto, 100% - металл'),
(412, 17, 1, '100% - натуральная телячья кожа Brunto, 100% - металл'),
(413, 17, 1, '100% - натуральная телячья кожа Brunto, 100% - металл'),
(414, 17, 1, '100% - натуральная телячья кожа Brunto, 100% - металл'),
(415, 17, 1, '100% - натуральная телячья кожа Brunto, 100% - металл'),
(416, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(417, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(418, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(420, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(421, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(422, 17, 1, 'Отделка из гладкой телячьей кожи Ante и блестки на кожволокне, 100% - металл'),
(423, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(424, 13, 3, 'Зовні 100% - натуральна теляча шкіра Ante, 100% - метал. Всередині 100% мікрофібра.'),
(425, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(426, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(427, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(428, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(429, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(430, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(431, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(432, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(433, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(434, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(435, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(436, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(437, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(438, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(439, 17, 1, 'Отделка из гладкой телячьей кожи Ante и блестки на кожволокне, 100% - металл'),
(440, 17, 1, 'Отделка из гладкой телячьей кожи Ante и блестки на кожволокне, 100% - металл'),
(441, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(444, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(446, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(447, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(448, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(449, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(450, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(451, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(452, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(453, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(454, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(455, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(456, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(457, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(458, 17, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(459, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(460, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(461, 17, 1, '100% - натуральная телячья кожа Ante с естественной лицевой, 100% - металл'),
(297, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(303, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(304, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(305, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(307, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(308, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(310, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(311, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(312, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(313, 17, 2, '100% genuine full-grain calfskin leather Ante, 100% metal'),
(314, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(315, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(316, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(317, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(318, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(319, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(320, 17, 2, '100% microfiber'),
(322, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(323, 17, 2, '100% genuine full-grain calfskin leather Ante, 100% metal'),
(324, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(325, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(326, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(327, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(328, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(329, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(330, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(331, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(332, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(333, 17, 2, '100% genuine calfskin leather Etro, 100% pony fur, 100% metal'),
(334, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(335, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(336, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(337, 17, 2, '100% genuine full-grain calfskin leather Ante, 100% metal'),
(339, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(340, 17, 2, 'Exterior: 100% eco-leather, 100% metal'),
(341, 17, 2, 'Exterior: 100% eco-leather, 100% metal'),
(343, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(344, 17, 3, '100% - натуральна теляча шкіра Ante з природною лицьовою, 100% - метал'),
(345, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(347, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(348, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(349, 17, 2, '100% genuine full-grain calfskin leather Ante, 100% metal'),
(350, 17, 2, '100% genuine full-grain calfskin leather Ante, 100% metal'),
(351, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(352, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(353, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(354, 16, 1, 'Снаружи 100% - натуральная телячья кожа Ante, 100% - металл. Внутри 100% микрофибра.'),
(355, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(356, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(357, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(359, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(360, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(361, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(362, 17, 2, '100% genuine calfskin leather Etro, 100% pony fur, 100% metal'),
(363, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(364, 17, 2, '100% genuine calfskin leather Ante, 100% metal'),
(365, 17, 2, '100% eco-leather, 100% metal'),
(366, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(367, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(368, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(369, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(370, 17, 2, '100% genuine calfskin leather Brunto, 100% natural pony fur, 100% metal'),
(371, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(372, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(373, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(374, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(375, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(376, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(377, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(378, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(379, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(380, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(381, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(382, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(383, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(389, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(390, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(391, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(392, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(394, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(395, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(396, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(398, 17, 2, 'Exterior: 100% genuine calfskin leather Brunto, 100% metal. Interior: 100% fabric.'),
(399, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(401, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(402, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(403, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(404, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(405, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(406, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(407, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(408, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(409, 17, 2, '100% genuine full-grain calfskin leather Ante, 100% metal'),
(410, 17, 2, '100% genuine full-grain calfskin leather Ante, 100% metal'),
(411, 17, 2, '100% genuine calfskin leather Brunto, 100% metal.'),
(412, 17, 2, '100% genuine calfskin leather Brunto, 100% metal.'),
(413, 17, 2, '100% genuine calfskin leather Brunto, 100% metal.'),
(414, 17, 2, '100% genuine calfskin leather Brunto, 100% metal.'),
(415, 17, 2, '100% genuine calfskin leather Brunto, 100% metal.'),
(416, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(417, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(418, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(420, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(421, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(422, 17, 2, 'Coated with smooth calfskin leather Ante and glitter on the leather fiber, 100% metal'),
(423, 17, 2, '100% genuine full-grain calfskin leather Ante, 100% metal'),
(425, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(426, 17, 2, '100% genuine full-grain calfskin leather Ante, 100% metal'),
(427, 17, 2, '100% genuine full-grain calfskin leather Ante, 100% metal'),
(428, 17, 2, '100% genuine full-grain calfskin leather Ante, 100% metal'),
(429, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(430, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(431, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(432, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(433, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(434, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(435, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(436, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(437, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(438, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(439, 17, 2, 'Coated with smooth calfskin leather Ante and glitter on the leather fiber, 100% metal'),
(440, 17, 2, 'Coated with smooth calfskin leather Ante and glitter on the leather fiber, 100% metal'),
(441, 17, 2, '100% genuine full-grain calfskin leather Ante, 100% metal'),
(444, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(446, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(447, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(448, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(449, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(450, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(451, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(452, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(453, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(454, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(455, 17, 2, '100% genuine full-grain calfskin leather Ante, 100% metal'),
(456, 17, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(457, 17, 2, '100% genuine full-grain calfskin leather Ante, 100% metal'),
(458, 17, 2, ''),
(459, 17, 2, ''),
(460, 17, 2, ''),
(297, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(303, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(304, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(305, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(307, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(308, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(310, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(311, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(312, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(313, 17, 3, '100% - натуральна теляча шкіра Ante з природною лицьовою, 100% - метал'),
(314, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(315, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(316, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(317, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(318, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(319, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(320, 17, 3, '100% мікрофібра'),
(322, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(323, 17, 3, '100% - натуральна теляча шкіра Ante з природною лицьовою, 100% - метал'),
(324, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(325, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(326, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(327, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(328, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(329, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(330, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(331, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(332, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(333, 17, 3, '100% - натуральна теляча шкіра Etro, 100% - хутро поні, 100% - метал'),
(334, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(335, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(336, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(337, 17, 3, '100% - натуральна теляча шкіра Ante з природною лицьовою, 100% - метал'),
(339, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(340, 17, 3, 'Зовні 100% - екошкіра, 100% - метал'),
(341, 17, 3, 'Зовні 100% - екошкіра, 100% - метал'),
(343, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(345, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(347, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(348, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(349, 17, 3, '100% - натуральна теляча шкіра Ante з природною лицьовою, 100% - метал'),
(350, 17, 3, '100% - натуральна теляча шкіра Ante з природною лицьовою, 100% - метал'),
(351, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(352, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(353, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(354, 14, 1, 'красный'),
(354, 14, 3, 'червоний'),
(354, 14, 2, 'red'),
(355, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(356, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(357, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(359, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(360, 17, 3, '100% - натуральна теляча шкіра Brunto з природною лицьовою, 100% - метал'),
(361, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(362, 17, 3, '100% - натуральна теляча шкіра Etro, 100% - хутро поні, 100% - метал'),
(363, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(364, 17, 3, '100% - натуральна теляча шкіра Ante, 100% - метал'),
(365, 17, 3, '100% - екошкіра, 100% - метал'),
(366, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(367, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(368, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(369, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(370, 17, 3, '100% - натуральна теляча шкіра Brunto, 100% - натуральне хутро поні, 100% - метал'),
(371, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(372, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(373, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(374, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(375, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(376, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(377, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(378, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(379, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(380, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(381, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(382, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(383, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(389, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(390, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(391, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(392, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(394, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(395, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(396, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(398, 17, 3, 'Зовні 100% - натуральна теляча шкіра Brunto, 100% - метал. Всередині 100% текстиль.'),
(399, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(401, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(402, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(403, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(404, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(405, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(406, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(407, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(408, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(409, 17, 3, '100% - натуральна теляча шкіра Ante з природною лицьовою, 100% - метал'),
(410, 17, 3, '100% - натуральна теляча шкіра Ante з природною лицьовою, 100% - метал'),
(411, 17, 3, '100% - натуральна теляча шкіра Brunto, 100% - метал'),
(412, 17, 3, '100% - натуральна теляча шкіра Brunto, 100% - метал'),
(413, 17, 3, '100% - натуральна теляча шкіра Brunto, 100% - метал'),
(414, 17, 3, '100% - натуральна теляча шкіра Brunto, 100% - метал'),
(415, 17, 3, '100% - натуральна теляча шкіра Brunto, 100% - метал'),
(416, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(417, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(418, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(420, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(421, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(422, 17, 3, 'Оздоблення з гладкої телячої шкіри Ante та блискітки на шкірволокні, 100% - метал'),
(423, 17, 3, '100% - натуральна теляча шкіра Ante з природною лицьовою, 100% - метал'),
(424, 13, 1, 'Снаружи 100% - натуральная телячья кожа Ante, 100% - металл. Внутри 100% микрофибра.'),
(425, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(426, 17, 3, '100% - натуральна теляча шкіра Ante з природною лицьовою, 100% - метал'),
(427, 17, 3, '100% - натуральна теляча шкіра Ante з природною лицьовою, 100% - метал'),
(428, 17, 3, '100% - натуральна теляча шкіра Ante з природною лицьовою, 100% - метал'),
(429, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(430, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(431, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(432, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(433, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(434, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(435, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(436, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(437, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(438, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(439, 17, 3, 'Оздоблення з гладкої телячої шкіри Ante та блискітки на шкірволокні, 100% - метал'),
(440, 17, 3, 'Оздоблення з гладкої телячої шкіри Ante та блискітки на шкірволокні, 100% - метал'),
(441, 17, 3, '100% - натуральна теляча шкіра Ante з природною лицьовою, 100% - метал'),
(444, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(446, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(447, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(448, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(449, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(450, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(451, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(452, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(453, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(454, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(455, 17, 3, '100% - натуральна теляча шкіра Ante з природною лицьовою, 100% - метал'),
(456, 17, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(457, 17, 3, '100% - натуральна теляча шкіра Ante з природною лицьовою, 100% - метал'),
(458, 17, 3, ''),
(459, 17, 3, ''),
(460, 17, 3, ''),
(461, 12, 2, 'Fidelitti'),
(297, 18, 1, '100% микрофибра'),
(303, 18, 1, '100% микрофибра'),
(304, 18, 1, '100% микрофибра'),
(305, 18, 1, '100% микрофибра'),
(307, 18, 1, '100% микрофибра'),
(308, 18, 1, '100% микрофибра'),
(310, 18, 1, '100% микрофибра'),
(311, 18, 1, '100% микрофибра'),
(312, 18, 1, '100% микрофибра'),
(313, 18, 1, '100% микрофибра'),
(314, 18, 1, '100% микрофибра'),
(315, 18, 1, '100% микрофибра'),
(316, 18, 1, '100% микрофибра'),
(317, 18, 1, '100% микрофибра'),
(318, 18, 1, '100% микрофибра'),
(319, 18, 1, '100% микрофибра'),
(320, 18, 1, '100% - натуральная телячья кожа Brunto с естественной лицевой, 100% - металл'),
(322, 18, 1, '100% микрофибра'),
(323, 18, 1, '100% микрофибра'),
(324, 18, 1, '100% микрофибра'),
(325, 18, 1, '100% микрофибра'),
(326, 18, 1, '100% микрофибра'),
(327, 18, 1, '100% микрофибра'),
(328, 18, 1, '100% микрофибра'),
(329, 18, 1, '100% микрофибра'),
(330, 18, 1, '100% микрофибра'),
(331, 18, 1, '100% микрофибра'),
(332, 18, 1, '100% микрофибра'),
(333, 18, 1, '100% микрофибра'),
(334, 18, 1, '100% микрофибра'),
(335, 18, 1, '100% микрофибра'),
(336, 18, 1, '100% микрофибра'),
(337, 18, 1, '100% микрофибра'),
(339, 18, 1, '100% микрофибра'),
(340, 18, 1, '100% микрофибра'),
(341, 18, 1, '100% микрофибра'),
(343, 18, 1, '100% микрофибра'),
(345, 18, 1, '100% микрофибра'),
(347, 18, 1, '100% микрофибра'),
(348, 18, 1, '100% микрофибра'),
(349, 18, 1, '100% микрофибра'),
(350, 18, 1, '100% микрофибра'),
(351, 18, 1, '100% микрофибра'),
(352, 18, 1, '100% микрофибра'),
(353, 18, 1, '100% микрофибра'),
(354, 12, 2, 'Fidelitti'),
(355, 18, 1, '100% микрофибра'),
(356, 18, 1, '100% микрофибра'),
(357, 18, 1, '100% микрофибра'),
(359, 18, 1, '100% микрофибра'),
(360, 18, 1, '100% микрофибра'),
(361, 18, 1, '100% микрофибра'),
(362, 18, 1, '100% микрофибра'),
(363, 18, 1, '100% микрофибра'),
(364, 18, 1, '100% микрофибра'),
(365, 18, 1, 'Внутри 100% микрофибра'),
(366, 18, 1, '100% микрофибра'),
(367, 18, 1, '100% микрофибра'),
(368, 18, 1, '100% микрофибра'),
(369, 18, 1, '100% микрофибра'),
(370, 18, 1, '100% микрофибра'),
(371, 18, 1, '100% микрофибра'),
(372, 18, 1, '100% микрофибра'),
(373, 18, 1, '100% микрофибра'),
(374, 18, 1, '100% микрофибра'),
(375, 18, 1, '100% микрофибра'),
(376, 18, 1, '100% микрофибра'),
(377, 18, 1, '100% микрофибра'),
(378, 18, 1, '100% микрофибра'),
(379, 18, 1, '100% микрофибра'),
(380, 18, 1, '100% микрофибра'),
(381, 18, 1, '100% микрофибра'),
(382, 18, 1, '100% микрофибра'),
(383, 18, 1, '100% микрофибра'),
(389, 18, 1, '100% микрофибра'),
(390, 18, 1, '100% микрофибра'),
(391, 18, 1, '100% микрофибра'),
(392, 18, 1, '100% микрофибра'),
(394, 18, 1, '100% микрофибра'),
(395, 18, 1, '100% микрофибра'),
(396, 18, 1, '100% микрофибра'),
(398, 18, 1, '100% текстиль'),
(399, 18, 1, '100% текстиль'),
(401, 18, 1, '100% текстиль'),
(402, 18, 1, '100% текстиль'),
(403, 18, 1, '100% текстиль'),
(404, 18, 1, '100% текстиль'),
(405, 18, 1, '100% текстиль'),
(406, 18, 1, '100% тестиль'),
(407, 18, 1, '100% текстиль '),
(408, 18, 1, '100% текстиль '),
(409, 18, 1, '65% - текстиль, 35% - кожа '),
(410, 18, 1, '65% - текстиль, 35% - кожа '),
(411, 18, 1, '100% - натуральная телячья кожа Brunto'),
(412, 18, 1, ' 100% - натуральная телячья кожа Brunto'),
(413, 18, 1, '100% - натуральная телячья кожа Brunto.'),
(414, 18, 1, '100% - натуральная телячья кожа Brunto.'),
(415, 18, 1, '100% - натуральная телячья кожа Brunto.'),
(416, 18, 1, '100 % кожа Brunto'),
(417, 18, 1, '100 % кожа Brunto'),
(418, 18, 1, '100 % кожа Brunto'),
(420, 18, 1, ''),
(421, 18, 1, '100% микрофибра'),
(422, 18, 1, '100% микрофибра'),
(423, 18, 1, '100% микрофибра'),
(424, 12, 2, 'Fidelitti'),
(425, 18, 1, '100% микрофибра'),
(426, 18, 1, '100% микрофибра'),
(427, 18, 1, '100% микрофибра');
INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(428, 18, 1, '65% текстиль, 35% кожа Ante'),
(429, 18, 1, '100% микрофибра'),
(430, 18, 1, '100% микрофибра'),
(431, 18, 1, '100% микрофибра'),
(432, 18, 1, '100% микрофибра'),
(433, 18, 1, '100% микрофибра'),
(434, 18, 1, '100% микрофибра'),
(435, 18, 1, '100% микрофибра'),
(436, 18, 1, '100% микрофибра'),
(437, 18, 1, '100% микрофибра'),
(438, 18, 1, '100% микрофибра'),
(439, 18, 1, '100% микрофибра'),
(440, 18, 1, '100% микрофибра'),
(441, 18, 1, '100% микрофибра'),
(442, 12, 4, ''),
(443, 12, 4, ''),
(444, 18, 1, '100% микрофибра'),
(445, 12, 4, ''),
(446, 18, 1, '100% микрофибра'),
(447, 18, 1, '100% микрофибра'),
(448, 18, 1, '100% микрофибра'),
(449, 18, 1, '100% микрофибра'),
(450, 18, 1, '100% микрофибра'),
(451, 18, 1, '100% микрофибра'),
(452, 18, 1, '100% микрофибра'),
(453, 18, 1, '100% микрофибра'),
(454, 18, 1, '100% микрофибра'),
(455, 18, 1, '100% микрофибра'),
(456, 18, 1, '100% микрофибра'),
(457, 18, 1, '100% микрофибра'),
(458, 18, 1, '100% микрофибра'),
(459, 18, 1, '100% микрофибра'),
(460, 18, 1, '100% микрофибра'),
(461, 12, 3, 'Fidelitti'),
(462, 18, 1, '100% микрофибра'),
(297, 18, 2, '100% microfiber'),
(303, 18, 2, '100% microfiber'),
(304, 18, 2, '100% microfiber'),
(305, 18, 2, '100% microfiber'),
(307, 18, 2, '100% microfiber'),
(308, 18, 2, '100% microfiber'),
(310, 18, 2, '100% microfiber'),
(311, 18, 2, '100% microfiber'),
(312, 18, 2, '100% microfiber'),
(313, 18, 2, '100% microfiber'),
(314, 18, 2, '100% microfiber'),
(315, 18, 2, '100% microfiber'),
(316, 18, 2, '100% microfiber'),
(317, 18, 2, '100% microfiber'),
(318, 18, 2, '100% microfiber'),
(319, 18, 2, '100% microfiber'),
(320, 18, 2, '100% genuine full-grain calfskin leather Brunto, 100% metal'),
(322, 18, 2, '100% microfiber'),
(323, 18, 2, '100% microfiber'),
(324, 18, 2, '100% microfiber'),
(325, 18, 2, '100% microfiber'),
(326, 18, 2, '100% microfiber'),
(327, 18, 2, '100% microfiber'),
(328, 18, 2, '100% microfiber'),
(329, 18, 2, '100% microfiber'),
(330, 18, 2, '100% microfiber'),
(331, 18, 2, '100% microfiber'),
(332, 18, 2, '100% microfiber'),
(333, 18, 2, '100% microfiber'),
(334, 18, 2, '100% microfiber'),
(335, 18, 2, '100% microfiber'),
(336, 18, 2, '100% microfiber'),
(337, 18, 2, '100% microfiber'),
(339, 18, 2, '100% microfiber'),
(340, 18, 2, '100% microfiber'),
(341, 18, 2, '100% microfiber'),
(343, 18, 2, '100% microfiber'),
(344, 17, 2, '100% genuine full-grain calfskin leather Ante, 100% metal'),
(345, 18, 2, '100% microfiber'),
(347, 18, 2, '100% microfiber'),
(348, 18, 2, '100% microfiber'),
(349, 18, 2, '100% microfiber'),
(350, 18, 2, '100% microfiber'),
(351, 18, 2, '100% microfiber'),
(352, 18, 2, '100% microfiber'),
(353, 18, 2, '100% microfiber'),
(354, 12, 3, 'Fidelitti'),
(355, 18, 2, '100% microfiber'),
(356, 18, 2, '100% microfiber'),
(357, 18, 2, '100% microfiber'),
(359, 18, 2, '100% microfiber'),
(360, 18, 2, '100% microfiber'),
(361, 18, 2, '100% microfiber'),
(362, 18, 2, '100% microfiber'),
(363, 18, 2, '100% microfiber'),
(364, 18, 2, '100% microfiber'),
(365, 18, 2, 'Interior: 100% microfiber'),
(366, 18, 2, '100% microfiber'),
(367, 18, 2, '100% microfiber'),
(368, 18, 2, '100% microfiber'),
(369, 18, 2, '100% microfiber'),
(370, 18, 2, '100% microfiber'),
(371, 18, 2, '100% microfiber'),
(372, 18, 2, '100% microfiber'),
(373, 18, 2, '100% microfiber'),
(374, 18, 2, '100% microfiber'),
(375, 18, 2, '100% microfiber'),
(376, 18, 2, '100% microfiber'),
(377, 18, 2, '100% microfiber'),
(378, 18, 2, '100% microfiber'),
(379, 18, 2, '100% microfiber'),
(380, 18, 2, '100% microfiber'),
(381, 18, 2, '100% microfiber'),
(382, 18, 2, '100% microfiber'),
(383, 18, 2, '100% microfiber'),
(389, 18, 2, '100% microfiber'),
(390, 18, 2, '100% microfiber'),
(391, 18, 2, '100% microfiber'),
(392, 18, 2, '100% microfiber'),
(394, 18, 2, '100% microfiber'),
(395, 18, 2, '100% microfiber'),
(396, 18, 2, '100% microfiber'),
(398, 18, 2, '100% fabric'),
(399, 18, 2, '100% fabric'),
(401, 18, 2, '100% fabric'),
(402, 18, 2, '100% fabric'),
(403, 18, 2, '100% fabric'),
(404, 18, 2, '100% fabric'),
(405, 18, 2, '100% fabric'),
(406, 18, 2, '100% fabric'),
(407, 18, 2, '100% fabric '),
(408, 18, 2, '100% fabric '),
(409, 18, 2, '65% fabric, 35% leather '),
(410, 18, 2, '65% fabric, 35% leather '),
(411, 18, 2, '100% genuine calfskin leather Brunto'),
(412, 18, 2, ' 100% genuine calfskin leather Brunto'),
(413, 18, 2, '100% genuine calfskin leather Brunto.'),
(414, 18, 2, '100% genuine calfskin leather Brunto.'),
(415, 18, 2, '100% genuine calfskin leather Brunto.'),
(416, 18, 2, '100% leather Brunto.'),
(417, 18, 2, '100% leather Brunto.'),
(418, 18, 2, '100% leather Brunto.'),
(420, 18, 2, ''),
(421, 18, 2, '100% microfiber'),
(422, 18, 2, '100% microfiber'),
(423, 18, 2, '100% microfiber'),
(424, 12, 3, 'Fidelitti'),
(425, 18, 2, '100% microfiber'),
(426, 18, 2, '100% microfiber'),
(427, 18, 2, '100% microfiber'),
(428, 18, 2, '65% fabric, 35% leather Ante'),
(429, 18, 2, '100% microfiber'),
(430, 18, 2, '100% microfiber'),
(431, 18, 2, '100% microfiber'),
(432, 18, 2, '100% microfiber'),
(433, 18, 2, '100% microfiber'),
(434, 18, 2, '100% microfiber'),
(435, 18, 2, '100% microfiber'),
(436, 18, 2, '100% microfiber'),
(437, 18, 2, '100% microfiber'),
(438, 18, 2, '100% microfiber'),
(439, 18, 2, '100% microfiber'),
(440, 18, 2, '100% microfiber'),
(441, 18, 2, '100% microfiber'),
(442, 12, 2, 'Fidelitti '),
(443, 12, 2, 'Fidelitti'),
(444, 18, 2, '100% microfiber'),
(445, 12, 2, 'Fidelitti '),
(446, 18, 2, '100% microfiber'),
(447, 18, 2, '100% microfiber'),
(448, 18, 2, '100% microfiber'),
(449, 18, 2, '100% microfiber'),
(450, 18, 2, '100% microfiber'),
(451, 18, 2, '100% microfiber'),
(452, 18, 2, '100% microfiber'),
(453, 18, 2, '100% microfiber'),
(454, 18, 2, '100% microfiber'),
(455, 18, 2, '100% microfiber'),
(456, 18, 2, '100% microfiber'),
(457, 18, 2, '100% microfiber'),
(458, 18, 2, ''),
(459, 18, 2, ''),
(460, 18, 2, ''),
(462, 18, 2, ''),
(297, 18, 3, '100% мікрофібра'),
(303, 18, 3, '100% мікрофібра'),
(304, 18, 3, '100% мікрофібра'),
(305, 18, 3, '100% мікрофібра'),
(307, 18, 3, '100% мікрофібра'),
(308, 18, 3, '100% мікрофібра'),
(310, 18, 3, '100% мікрофібра'),
(311, 18, 3, '100% мікрофібра'),
(312, 18, 3, '100% мікрофібра'),
(313, 18, 3, '100% мікрофібра'),
(314, 18, 3, '100% мікрофібра'),
(315, 18, 3, '100% мікрофібра'),
(316, 18, 3, '100% мікрофібра'),
(317, 18, 3, '100% мікрофібра'),
(318, 18, 3, '100% мікрофібра'),
(319, 18, 3, '100% мікрофібра'),
(320, 18, 3, '100% - натуральна теляча шкіра з природною лицьовою, 100% - метал'),
(322, 18, 3, '100% мікрофібра'),
(323, 18, 3, '100% мікрофібра'),
(324, 18, 3, '100% мікрофібра'),
(325, 18, 3, '100% мікрофібра'),
(326, 18, 3, '100% мікрофібра'),
(327, 18, 3, '100% мікрофібра'),
(328, 18, 3, '100% мікрофібра'),
(329, 18, 3, '100% мікрофібра'),
(330, 18, 3, '100% мікрофібра'),
(331, 18, 3, '100% мікрофібра'),
(332, 18, 3, '100% мікрофібра'),
(333, 18, 3, '100% мікрофібра'),
(334, 18, 3, '100% мікрофібра'),
(335, 18, 3, '100% мікрофібра'),
(336, 18, 3, '100% мікрофібра'),
(337, 18, 3, '100% мікрофібра'),
(339, 18, 3, '100% мікрофібра'),
(340, 18, 3, '100% мікрофібра'),
(341, 18, 3, '100% мікрофібра'),
(343, 18, 3, '100% мікрофібра'),
(345, 18, 3, '100% мікрофібра'),
(347, 18, 3, '100% мікрофібра'),
(348, 18, 3, '100% мікрофібра'),
(349, 18, 3, '100% мікрофібра'),
(350, 18, 3, '100% мікрофібра'),
(351, 18, 3, '100% мікрофібра'),
(352, 18, 3, '100% мікрофібра'),
(353, 18, 3, '100% мікрофібра'),
(354, 12, 1, 'Fidelitti'),
(355, 18, 3, '100% мікрофібра'),
(356, 18, 3, '100% мікрофібра'),
(357, 18, 3, '100% мікрофібра'),
(359, 18, 3, '100% мікрофібра'),
(360, 18, 3, '100% мікрофібра'),
(361, 18, 3, '100% мікрофібра'),
(362, 18, 3, '100% мікрофібра'),
(363, 18, 3, '100% мікрофібра'),
(364, 18, 3, '100% мікрофібра'),
(365, 18, 3, 'Всередині 100% мікрофібра'),
(366, 18, 3, '100% мікрофібра'),
(367, 18, 3, '100% мікрофібра'),
(368, 18, 3, '100% мікрофібра'),
(369, 18, 3, '100% мікрофібра'),
(370, 18, 3, '100% мікрофібра'),
(371, 18, 3, '100% мікрофібра'),
(372, 18, 3, '100% мікрофібра'),
(373, 18, 3, '100% мікрофібра'),
(374, 18, 3, '100% мікрофібра'),
(375, 18, 3, '100% мікрофібра'),
(376, 18, 3, '100% мікрофібра'),
(377, 18, 3, '100% мікрофібра'),
(378, 18, 3, '100% мікрофібра'),
(379, 18, 3, '100% мікрофібра'),
(380, 18, 3, '100% мікрофібра'),
(381, 18, 3, '100% мікрофібра'),
(382, 18, 3, '100% мікрофібра'),
(383, 18, 3, '100% мікрофібра'),
(389, 18, 3, '100% мікрофібра'),
(390, 18, 3, '100% мікрофібра'),
(391, 18, 3, '100% мікрофібра'),
(392, 18, 3, '100% мікрофібра'),
(394, 18, 3, '100% мікрофібра'),
(395, 18, 3, '100% мікрофібра'),
(396, 18, 3, '100% мікрофібра'),
(398, 18, 3, '100% текстиль'),
(399, 18, 3, '100% текстиль'),
(401, 18, 3, '100% текстиль'),
(402, 18, 3, '100% текстиль'),
(403, 18, 3, '100% текстиль'),
(404, 18, 3, '100% текстиль'),
(405, 18, 3, '100% текстиль'),
(406, 18, 3, '100% текстиль'),
(407, 18, 3, '100% текстиль '),
(408, 18, 3, '100% текстиль '),
(409, 18, 3, '65% - текстиль, 35% - шкіра '),
(410, 18, 3, '65% - текстиль, 35% - шкіра '),
(411, 18, 3, '100% - натуральна теляча шкіра Brunto'),
(412, 18, 3, ' 100% - натуральна теляча шкіра Brunto'),
(413, 18, 3, '100% - натуральна теляча шкіра Brunto.'),
(414, 18, 3, '100% - натуральна теляча шкіра Brunto.'),
(415, 18, 3, '100% - натуральна теляча шкіра Brunto.'),
(416, 18, 3, '100 % шкіра Brunto'),
(417, 18, 3, '100 % шкіра Brunto'),
(418, 18, 3, '100 % шкіра Brunto'),
(420, 18, 3, ''),
(421, 18, 3, '100% мікрофібра'),
(422, 18, 3, '100% мікрофібра'),
(423, 18, 3, '100% мікрофібра'),
(424, 12, 1, 'Fidelitti'),
(425, 18, 3, '100% мікрофібра'),
(426, 18, 3, '100% мікрофібра'),
(427, 18, 3, '100% мікрофібра'),
(428, 18, 3, '65% текстиль, 35% шкіра Ante'),
(429, 18, 3, '100% мікрофібра'),
(430, 18, 3, '100% мікрофібра'),
(431, 18, 3, '100% мікрофібра'),
(432, 18, 3, '100% мікрофібра'),
(433, 18, 3, '100% мікрофібра'),
(434, 18, 3, '100% мікрофібра'),
(435, 18, 3, '100% мікрофібра'),
(436, 18, 3, '100% мікрофібра'),
(437, 18, 3, '100% мікрофібра'),
(438, 18, 3, '100% мікрофібра'),
(439, 18, 3, '100% мікрофібра'),
(440, 18, 3, '100% мікрофібра'),
(441, 18, 3, '100% мікрофібра'),
(442, 12, 3, 'Fidelitti '),
(443, 12, 3, 'Fidelitti'),
(444, 18, 3, '100% мікрофібра'),
(445, 12, 3, 'Fidelitti '),
(446, 18, 3, '100% мікрофібра'),
(447, 18, 3, '100% мікрофібра'),
(448, 18, 3, '100% мікрофібра'),
(449, 18, 3, '100% мікрофібра'),
(450, 18, 3, '100% мікрофібра'),
(451, 18, 3, '100% мікрофібра'),
(452, 18, 3, '100% мікрофібра'),
(453, 18, 3, '100% мікрофібра'),
(454, 18, 3, '100% мікрофібра'),
(455, 18, 3, '100% мікрофібра'),
(456, 18, 3, '100% мікрофібра'),
(457, 18, 3, '100% мікрофібра'),
(458, 18, 3, ''),
(459, 18, 3, ''),
(460, 18, 3, ''),
(461, 12, 1, 'Fidelitti'),
(462, 18, 3, ''),
(354, 17, 2, '100% genuine full-grain calfskin leather Ante, 100% metal'),
(354, 18, 1, '100% микрофибра'),
(354, 18, 3, '100% мікрофібра'),
(354, 18, 2, '100% microfiber'),
(344, 14, 1, 'зелёный'),
(344, 14, 3, 'зелений'),
(344, 12, 2, 'Fidelitti'),
(344, 12, 1, 'Fidelitti'),
(344, 12, 3, 'Fidelitti'),
(424, 17, 2, '100% genuine full-grain calfskin leather Ante, 100% metal'),
(424, 18, 1, '100% микрофибра'),
(424, 18, 3, '100% мікрофібра'),
(424, 18, 2, '100% microfiber'),
(461, 18, 3, ''),
(461, 18, 2, ''),
(344, 18, 1, '100% микрофибра'),
(344, 18, 3, '100% мікрофібра'),
(344, 18, 2, '100% microfiber');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_description`
--

CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(297, 2, 'Tondo', '&lt;p&gt;Большая кожаная сумка на руку из серии Tondo.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: ментоловый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 кармашка, один из которых на змейке.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(303, 2, 'Tondo', '&lt;p&gt;Большая кожаная сумка на руку из&nbsp;&lt;span style=&quot;font-size: 12px;&quot;&gt;линии&nbsp;&lt;/span&gt;Tondo.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: красный гранат.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 кармашка, один из которых на змейке.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(304, 2, 'Tondo', '&lt;p&gt;Большая кожаная сумка на руку из серии Tondo.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: бордо.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 кармашка, один из которых на змейке.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(305, 2, 'Tondo', '&lt;p&gt;Большая кожаная сумка на руку из серии Tondo.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: бургунди.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 кармашка, один из которых на змейке.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(307, 2, 'Tondo', '&lt;p&gt;Большая кожаная сумка на руку из серии Tondo.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: морской.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 кармашка, один из которых на змейке.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(308, 2, 'Tondo', '&lt;p&gt;Большая кожаная сумка на руку из серии Tondo.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 кармашка, один из которых на змейке.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(310, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: серый.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(311, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: бежевый.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(312, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: красный.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(313, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: темный красный.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(314, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: красный гранат.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(315, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: бордовый.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(316, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: бургунди.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(317, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: кориандр.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(318, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: хаки.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(319, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: морской.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(320, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: белая.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(322, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: пудровый.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(323, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: пастельно-розовый.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(324, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: ментоловый.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(325, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: лазурный.&lt;/li&gt;&lt;li&gt;Металлическая застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(326, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: ярко-голубой.&lt;/li&gt;&lt;li&gt;Металлическая застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(327, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: индиго.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(328, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: лиловый.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(329, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: карамель.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(330, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: желтый.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(331, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: деним.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(332, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: океан.&lt;/li&gt;&lt;li&gt;Металлическая застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(333, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: синий.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(334, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(335, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный с синей окантовкой.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(336, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный с синей окантовкой.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(337, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(339, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный с синей окантовкой.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(340, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: серебро.&lt;/li&gt;&lt;li&gt;Металлическая застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(341, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: золото.&lt;/li&gt;&lt;li&gt;Металлическая застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(343, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: ментол.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(344, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак  с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: зеленый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную  края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(345, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: лавандовый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(347, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: лазурный.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(348, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: серый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(349, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: светло-серый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(350, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: графит.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(351, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: бежевый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(352, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: бургунди.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(353, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: бордо.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(354, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel  Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Crimson.&lt;/li&gt;&lt;li&gt;Manually dyed  leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(355, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: красный гранат.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(356, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: космос.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(357, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: океан.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из&nbsp;&lt;span style=&quot;font-size: 12px;&quot;&gt;экокожи&lt;/span&gt;.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(359, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: индиго.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из&nbsp;&lt;span style=&quot;font-size: 12px;&quot;&gt;экокожи&lt;/span&gt;.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(360, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: морской.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(361, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: лиловый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(362, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: синий.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(363, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(364, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(365, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный.&lt;/li&gt;&lt;li&gt;Металлическая застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(366, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: белый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(367, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: ментоловый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(368, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: серый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(369, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: океан.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(370, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: синий.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(371, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: бургунди.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(372, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(373, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: красный гранат.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(374, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: морской.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(375, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: лиловый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(376, 2, 'Salerno ', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: красный гранат.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(377, 2, 'Salerno', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: океан.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(378, 2, 'Salerno', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: деним.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(379, 2, 'Salerno', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: серый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(380, 2, 'Salerno', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: лиловый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(381, 2, 'Salerno', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный с красной окантовкой.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(382, 2, 'Salerno', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный с фиолетовой окантовкой.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(383, 2, 'Salerno', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(389, 2, 'Salerno mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Salerno mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: океан.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(390, 2, 'Salerno mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Salerno mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: деним.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(391, 2, 'Salerno mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Salerno mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: морской.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(392, 2, 'Salerno mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Salerno mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: серый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(394, 2, 'Salerno mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Salerno mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: красный гранат.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(395, 2, 'Salerno mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Salerno mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: лиловый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(396, 2, 'Salerno mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Salerno mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(398, 2, 'Sevilla', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Большая кожаная сумка на руку из линии Sevilla.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Цвет: лиловый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см, съемный кожаный ремень на карабинах.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 1 кармашек на змейке.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(399, 2, 'Sevilla', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Большая кожаная сумка на руку из линии Sevilla.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Цвет: серый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см, съемный кожаный ремень на карабинах.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 1 кармашек на змейке.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(401, 2, 'Sevilla', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Большая кожаная сумка на руку из линии Sevilla.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Цвет: деним.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см, съемный кожаный ремень на карабинах.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 1 кармашек на змейке.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(402, 2, 'Sevilla', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Большая кожаная сумка на руку из линии Sevilla.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Цвет: океан.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см, съемный кожаный ремень на карабинах.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 1 кармашек на змейке.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(403, 2, 'Sevilla', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Большая кожаная сумка на руку из линии Sevilla.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Цвет: морской.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см, съемный кожаный ремень на карабинах.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 1 кармашек на змейке.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(404, 2, 'Sevilla', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Большая кожаная сумка на руку из линии Sevilla.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Цвет: черный.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см, съемный кожаный ремень на карабинах.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 1 кармашек на змейке.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(405, 2, 'Caramente', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Большая кожаная сумка на руку из линии Caramente.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см, съемный кожаный ремень на карабинах.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 кармашка, один из которых на змейке.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(406, 2, 'Bordo', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Большая кожаная сумка на руку из линии Bordo.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Металлическая застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху две ручки, съемный кожаный ремень на карабинах.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 1 кармашек на змейке.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(407, 2, 'Bordo', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Большая кожаная сумка на руку из линии Bordo.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Металлическая застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху две ручки, съемный кожаный ремень на карабинах.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 1 кармашек на змейке.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(408, 2, 'Siera', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Кожаная сумка на руку из линии Siera.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Цвет: красный.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Металлическая застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху две ручки, съемный кожаный ремень на карабинах.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 1 кармашек на змейке.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(409, 2, 'Modena', '&lt;p style=&quot;box-sizing: inherit; margin-bottom: 1rem; padding: 0px; font-size: 12px; line-height: 1.6; text-rendering: optimizeLegibility; color: rgb(10, 10, 10); font-family: &quot;Century Gothic&quot;;&quot;&gt;Большая кожаная сумка на руку из линии Sevilla.&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;padding: 0px; color: rgb(10, 10, 10); line-height: 1.6; font-family: &quot;Century Gothic&quot;; font-size: 12px; margin-bottom: 1rem; box-sizing: inherit;&quot;&gt;&nbsp; Цвет: черно-белый.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Металлическая застежка на молнии.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Сверху 2 ручки, диаметром 12,5 см.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Внутренняя подкладка из текстиля и кожи.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Внутри: 1 основное отделение и 3 кармашка, один из которых на змейке.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(410, 2, 'Modena', '&lt;p style=&quot;box-sizing: inherit; margin-bottom: 1rem; padding: 0px; font-size: 12px; line-height: 1.6; text-rendering: optimizeLegibility; color: rgb(10, 10, 10); font-family: &quot;Century Gothic&quot;;&quot;&gt;Большая кожаная сумка на руку из линии Sevilla.&lt;/p&gt;&lt;ul style=&quot;box-sizing: inherit; list-style-position: outside; list-style-image: initial; margin-right: 0px; margin-bottom: 0px; margin-left: 1.25rem; padding: 0px; color: rgb(10, 10, 10); font-family: &quot;Century Gothic&quot;; font-size: 12px;&quot;&gt;&lt;li style=&quot;box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;&quot;&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li style=&quot;box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;&quot;&gt;Металлическая застежка на молнии.&lt;/li&gt;&lt;li style=&quot;box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;&quot;&gt;Сверху 2 ручки, диаметром 12,5 см.&lt;/li&gt;&lt;li style=&quot;box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;&quot;&gt;Внутренняя подкладка из текстиля и кожи.&lt;/li&gt;&lt;li style=&quot;box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;&quot;&gt;Внутри: 1 основное отделение и 3 кармашка, один из которых на змейке.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(411, 2, 'Terno', '&lt;p&gt;Кожаный клатч-конверт с длинным ремешком из линии Terno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный и ментоловый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Застежка на магните.&lt;/li&gt;&lt;li&gt;Длинный несъемный ремешок.&lt;/li&gt;&lt;li&gt;Внутренняя отделка из натуральной кожи.&lt;/li&gt;&lt;li&gt;Внутри 1 основное отделение, 1 карман, 4 отделения для карт.&lt;/li&gt;&lt;/ul&gt;', '', '', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(412, 2, 'Terno', '&lt;p&gt;Кожаный клатч-конверт с длинным ремешком из линии Terno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный и голубой.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Застежка на магните.&lt;/li&gt;&lt;li&gt;Длинный несъемный ремешок.&lt;/li&gt;&lt;li&gt;Внутренняя отделка из натуральной кожи.&lt;/li&gt;&lt;li&gt;Внутри 1 основное отделение, 1 карман, 4 отделения для карт.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(413, 2, 'Terno', '&lt;p&gt;Кожаный клатч-конверт с длинным ремешком из линии Terno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный и синий.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Застежка на магните.&lt;/li&gt;&lt;li&gt;Длинный несъемный ремешок.&lt;/li&gt;&lt;li&gt;Внутренняя отделка из натуральной кожи.&lt;/li&gt;&lt;li&gt;Внутри 1 основное отделение, 1 карман, 4 отделения для карт.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(414, 2, 'Terno', '&lt;p&gt;Кожаный клатч-конверт с длинным ремешком из линии Terno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный и малиновый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Застежка на магните.&lt;/li&gt;&lt;li&gt;Длинный несъемный ремешок.&lt;/li&gt;&lt;li&gt;Внутренняя отделка из натуральной кожи.&lt;/li&gt;&lt;li&gt;Внутри 1 основное отделение, 1 карман, 4 отделения для карт.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(415, 2, 'Terno', '&lt;p&gt;Кожаный клатч-конверт с длинным ремешком из линии Terno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: черный и розовый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Застежка на магните.&lt;/li&gt;&lt;li&gt;Длинный несъемный ремешок.&lt;/li&gt;&lt;li&gt;Внутренняя отделка из натуральной кожи.&lt;/li&gt;&lt;li&gt;Внутри 1 основное отделение, 1 карман, 4 отделения для карт.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(416, 2, 'Roza', '&lt;p&gt;Кожаный клатч-конверт с длинным ремешком из линии Roza.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Застежка на магните.&lt;/li&gt;&lt;li&gt;Длинный несъемный кожаный ремешок.&lt;/li&gt;&lt;li&gt;Внутренняя отделка из натуральной кожи и текстиля.&lt;/li&gt;&lt;li&gt;Внутри 1 основное отделение, &nbsp;1 внутренний карман со змейкой, 1 карман на задней части со змейкой.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(417, 2, 'Roza', '&lt;p&gt;Кожаный клатч-конверт с длинным ремешком из линии Roza.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Застежка на магните.&lt;/li&gt;&lt;li&gt;Длинный несъемный кожаный ремешок.&lt;/li&gt;&lt;li&gt;Внутренняя отделка из натуральной кожи и текстиля.&lt;/li&gt;&lt;li&gt;Внутри 1 основное отделение, &nbsp;1 внутренний карман со змейкой, 1 карман на задней части со змейкой.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(418, 2, 'Roza', '&lt;p&gt;Кожаный клатч-конверт с длинным ремешком из линии Roza.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Застежка на магните.&lt;/li&gt;&lt;li&gt;Длинный несъемный кожаный ремешок.&lt;/li&gt;&lt;li&gt;Внутренняя отделка из натуральной кожи и текстиля.&lt;/li&gt;&lt;li&gt;Внутри 1 основное отделение, &nbsp;1 внутренний карман со змейкой, 1 карман на задней части со змейкой.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(420, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: белый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(421, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: жёлтый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(422, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: сияние.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(423, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: слоновая кость.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(424, 3, 'Zaino mini', '&lt;p&gt;Zaino mini Leather  Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Pastel Pink.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 Detachable Straps.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(425, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: небесно-голубой.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(426, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: зелёный.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(427, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: алый.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(428, 2, 'Modena', '&lt;p style=&quot;box-sizing: inherit; margin-bottom: 1rem; padding: 0px; font-size: 12px; line-height: 1.6; text-rendering: optimizeLegibility; color: rgb(10, 10, 10); font-family: &quot;Century Gothic&quot;;&quot;&gt;Большая кожаная сумка на руку из линии Sevilla.&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;padding: 0px; color: rgb(10, 10, 10); line-height: 1.6; font-family: &quot;Century Gothic&quot;; font-size: 12px; margin-bottom: 1rem; box-sizing: inherit;&quot;&gt;&nbsp; Цвет: черный.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Металлическая застежка на молнии.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Сверху 2 ручки, диаметром 12,5 см.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Внутренняя подкладка из текстиля и кожи.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Внутри: 1 основное отделение и 3 кармашка, один из которых на змейке.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(429, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: малина.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(430, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: фиалка.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(431, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: голубой.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(432, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: малина.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(433, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: фиалка.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(434, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: голубой.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(435, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: лаванда.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(436, 2, 'Tondo', '&lt;p&gt;Большая кожаная сумка на руку из серии Tondo.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: небесно-голубой.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 кармашка, один из которых на змейке.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(437, 2, 'Marbella', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Marbella.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: лаванда.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и&nbsp;3 маленьких кармашка.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(438, 2, 'Marbella', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Marbella.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: пудра.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и&nbsp;3 маленьких кармашка.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(439, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: золото.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(440, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: никель.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(441, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: нежно-голубой.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(442, 4, 'Cylindro ', '&lt;p&gt;Шкіряна сумка на плече з довгим знімним ремінцем з лінії Cylindro.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: ментоловий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну  краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху одна ручка висотою 12 см.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та  знімний гаманець.&lt;/li&gt;&lt;/ul&gt;', '', 'Cylindro ', '', ''),
(443, 4, 'Cylindro', '&lt;p&gt;Шкіряна сумка на плече з довгим знімним ремінцем з лінії Cylindro.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: білий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну  краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху одна ручка висотою 12 см.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та  знімний гаманець.&lt;/li&gt;&lt;/ul&gt;', '', 'Cylindro', '', ''),
(444, 2, 'Cylindro ', '&lt;p&gt;Кожаная сумка на плечо с длинным съемным ремешком из линии Cylindro.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: пудровый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и &nbsp;съемный кошелек.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(445, 4, 'Cylindro ', '&lt;p&gt;Шкіряна сумка на плече з довгим знімним ремінцем з лінії Cylindro.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: лаванда.&lt;/li&gt;&lt;li&gt;Профарбовані вручну  краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху одна ручка висотою 12 см.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та  знімний гаманець.&lt;/li&gt;&lt;/ul&gt;', '', 'Cylindro ', '', ''),
(446, 2, 'Tondo mini', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: лаванда.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и 2 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(447, 2, 'Salerno mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Salerno mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: ментоловый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(448, 2, 'Salerno mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Salerno mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: белый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(449, 2, 'Salerno ', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: белый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(450, 2, 'Marbella', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Marbella.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: пастельно-розовый&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и&nbsp;3 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(451, 2, 'Marbella', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Marbella.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: медовый&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и&nbsp;3 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(452, 2, 'Salerno', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: лаванда.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(453, 2, 'Salerno mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Salerno mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: зеленый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(454, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: желтый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(455, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер &nbsp;с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: слоновая кость.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(456, 2, 'Marbella', '&lt;p&gt;Кожаная сумочка-мини на плечо с длинным съемным ремешком из линии Marbella.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: серый.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Одна ручка высотой 8 см, съемный ремень из кожи.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и&nbsp;3 маленьких кармашка.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(457, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак &nbsp;с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: изумрудный.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&nbsp;&nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(458, 2, 'Cylindro ', '&lt;p&gt;Кожаная сумка на плечо с длинным съемным ремешком из линии Cylindro.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: медовый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&amp;nbsp;&amp;nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и &amp;nbsp;съемный кошелек.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(459, 2, 'Cylindro ', '&lt;p&gt;Кожаная сумка на плечо с длинным съемным ремешком из линии Cylindro.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: изумруд.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную&amp;nbsp;&amp;nbsp;края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и &amp;nbsp;съемный кошелек.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(460, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер &amp;nbsp;с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: пудра.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(462, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер &amp;nbsp;с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: розовый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(297, 3, 'Tondo', '&lt;p&gt;Tondo Leather Big Handbag.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Mint.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;One Top Handle, 12 cm Drop.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 open pocket and 1 zip pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(303, 3, 'Tondo', '&lt;p&gt;Tondo Leather Big Handbag &nbsp;&lt;span style=&quot;font-size: 12px;&quot;&gt;&nbsp;&lt;/span&gt;.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Garnet.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;One Top Handle, 12 cm Drop.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 open pocket and 1 zip pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(304, 3, 'Tondo', '&lt;p&gt;Tondo Leather Big Handbag.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Claret.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;One Top Handle, 12 cm Drop.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 open pocket and 1 zip pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(305, 3, 'Tondo', '&lt;p&gt;Tondo Leather Big Handbag.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Burgundy.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;One Top Handle, 12 cm Drop.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 open pocket and 1 zip pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(307, 3, 'Tondo', '&lt;p&gt;Tondo Leather Big Handbag.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Navy.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;One Top Handle, 12 cm Drop.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 open pocket and 1 zip pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(308, 3, 'Tondo', '&lt;p&gt;Tondo Leather Big Handbag.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Black.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;One Top Handle, 12 cm Drop.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 open pocket and 1 zip pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(310, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Grey.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(311, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Beige.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(312, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Red.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(313, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Crimson.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(314, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Garnet.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(315, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Claret.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(316, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Burgundy.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(317, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Coriander.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(318, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Khaki.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(319, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Navy.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(320, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: White.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(322, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Powder.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(323, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Pastel Pink.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(324, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Mint.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(325, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Azure.&lt;/li&gt;&lt;li&gt;Metal Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(326, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Bright-Blue.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(327, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Indigo.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(328, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Violet.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(329, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Caramel.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(330, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Yellow.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(331, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Denim.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(332, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Ocean.&lt;/li&gt;&lt;li&gt;Metal Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(333, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Dark Blue.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(334, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Black.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(335, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Black, Dark Blue-Edged.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(336, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Black, Dark Blue-Edged.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(337, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Black.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(339, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Black, Dark Blue-Edged.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(340, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Silver.&lt;/li&gt;&lt;li&gt;Metal Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(341, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Gold.&lt;/li&gt;&lt;li&gt;Metal Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(343, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Mint.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(344, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак  з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: зелений.&lt;/li&gt;&lt;li&gt;Профарбовані вручну  краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(345, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Lavender.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(347, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Azure.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(348, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Grey.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(349, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Light Grey.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(350, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Graphite.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(351, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Beige.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(352, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Burgundy.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(353, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Claret.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(354, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак  з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: темно-червоний.&lt;/li&gt;&lt;li&gt;Профарбовані вручну  краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(355, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Garnet.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(356, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Cosmos.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(357, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Ocean.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather&nbsp;&lt;span style=&quot;font-size: 12px;&quot;&gt;Lining&lt;/span&gt;.&lt;/li&gt;&lt;li&gt;Interior details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(359, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Indigo.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather&nbsp;&lt;span style=&quot;font-size: 12px;&quot;&gt;Lining&lt;/span&gt;.&lt;/li&gt;&lt;li&gt;Interior details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(360, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Navy.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(361, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Violet.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(362, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Dark Blue.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(363, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Black.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(364, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Black.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(365, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Black.&lt;/li&gt;&lt;li&gt;Metal Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(366, 3, 'Zaino mini', '&lt;p&gt;Zaino mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: White.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(367, 3, 'Zaino mini', '&lt;p&gt;Zaino mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Mint.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(368, 3, 'Zaino mini', '&lt;p&gt;Zaino mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Grey.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(369, 3, 'Zaino mini', '&lt;p&gt;Zaino mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Ocean.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(370, 3, 'Zaino mini', '&lt;p&gt;Zaino mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Dark Blue.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(371, 3, 'Zaino mini', '&lt;p&gt;Zaino mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Burgundy.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(372, 3, 'Zaino mini', '&lt;p&gt;Zaino mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Black.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(373, 3, 'Zaino mini', '&lt;p&gt;Zaino mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Garnet.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(374, 3, 'Zaino mini', '&lt;p&gt;Zaino mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Navy.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(375, 3, 'Zaino mini', '&lt;p&gt;Zaino mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Violet.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(376, 3, 'Salerno', '&lt;p&gt;Salerno Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Garnet.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(377, 3, 'Salerno', '&lt;p&gt;Salerno Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Ocean.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(378, 3, 'Salerno', '&lt;p&gt;Salerno Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Denim.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(379, 3, 'Salerno', '&lt;p&gt;Salerno Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Grey.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(380, 3, 'Salerno', '&lt;p&gt;Salerno Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Violet.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(381, 3, 'Salerno', '&lt;p&gt;Salerno Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Black, Red-Edged.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(382, 3, 'Salerno', '&lt;p&gt;Salerno Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Black, Violet-Edged.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(383, 3, 'Salerno', '&lt;p&gt;Salerno Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Black.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(389, 3, 'Salerno mini', '&lt;p&gt;Salerno mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Ocean.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(390, 3, 'Salerno mini', '&lt;p&gt;Salerno mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Denim.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(391, 3, 'Salerno mini', '&lt;p&gt;Salerno mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Navy.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(392, 3, 'Salerno mini', '&lt;p&gt;Salerno mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Grey.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(394, 3, 'Salerno mini', '&lt;p&gt;Salerno mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Garnet.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(395, 3, 'Salerno mini', '&lt;p&gt;Salerno mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Violet.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(396, 3, 'Salerno mini', '&lt;p&gt;Salerno mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Black.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(398, 3, 'Sevilla', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Sevilla Big Leather Handbag.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Color: Violet.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;One Top Handle, 12 cm Drop, Detachable Lobster Clasp Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 1 cash zip pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(399, 3, 'Sevilla', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Sevilla Big Leather Handbag.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Color: Grey.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;One Top Handle, 12 cm Drop, Detachable Lobster Clasp Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 1 cash zip pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(401, 3, 'Sevilla', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Sevilla Big Leather Handbag.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Color: Denim.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;One Top Handle, 12 cm Drop, Detachable Lobster Clasp Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 1 cash zip pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(402, 3, 'Sevilla', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Sevilla Big Leather Handbag.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Color: Ocean.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;One Top Handle, 12 cm Drop, Detachable Lobster Clasp Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 1 cash zip pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(403, 3, 'Sevilla', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Sevilla Big Leather Handbag.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Color: Navy.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;One Top Handle, 12 cm Drop, Detachable Lobster Clasp Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 1 cash zip pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(404, 3, 'Sevilla', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Sevilla Big Leather Handbag.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Color: Black.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;One Top Handle, 12 cm Drop, Detachable Lobster Clasp Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 1 cash zip pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(405, 3, 'Caramente', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Caramente Big Leather Handbag.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;One Top Handle, 12 cm Drop, Detachable Lobster Clasp Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 open pocket and 1 zip pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(406, 3, 'Bordo', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Bordo Big Leather Handbag.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Metal Zip Closure.&lt;/li&gt;&lt;li&gt;Double Top Handles, Detachable Lobster Clasp Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 1 cash zip pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(407, 3, 'Bordo', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Bordo Big Leather Handbag.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Metal Zip Closure.&lt;/li&gt;&lt;li&gt;Double Top Handles, Detachable Lobster Clasp Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 1 cash zip pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(408, 3, 'Siera', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Siera Big Leather Handbag.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Color: Red.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Metal Zip Closure.&lt;/li&gt;&lt;li&gt;Double Top Handles, Detachable Lobster Clasp Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 1 cash zip pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(409, 3, 'Modena', '&lt;p style=&quot;box-sizing: inherit; margin-bottom: 1rem; padding: 0px; font-size: 12px; line-height: 1.6; text-rendering: optimizeLegibility; color: rgb(10, 10, 10); font-family: &quot;Century Gothic&quot;;&quot;&gt;Sevilla Big Leather Handbag.&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;padding: 0px; color: rgb(10, 10, 10); line-height: 1.6; font-family: &quot;Century Gothic&quot;; font-size: 12px; margin-bottom: 1rem; box-sizing: inherit;&quot;&gt;&nbsp; Color: Black&amp;White.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Metal Zip Closure.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Double Top Handles, 12.5 cm Drop&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Inside Fabric and Leather Lining.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Interior details: 1 Center Compartment, 3 pockets - one is zip pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(410, 3, 'Modena', '&lt;p style=&quot;box-sizing: inherit; margin-bottom: 1rem; padding: 0px; font-size: 12px; line-height: 1.6; text-rendering: optimizeLegibility; color: rgb(10, 10, 10); font-family: &quot;Century Gothic&quot;;&quot;&gt;Sevilla Big Leather Handbag.&lt;/p&gt;&lt;ul style=&quot;box-sizing: inherit; list-style-position: outside; list-style-image: initial; margin-right: 0px; margin-bottom: 0px; margin-left: 1.25rem; padding: 0px; color: rgb(10, 10, 10); font-family: &quot;Century Gothic&quot;; font-size: 12px;&quot;&gt;&lt;li style=&quot;box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;&quot;&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li style=&quot;box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;&quot;&gt;Metal Zip Closure.&lt;/li&gt;&lt;li style=&quot;box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;&quot;&gt;Double Top Handles, 12.5 cm Drop.&lt;/li&gt;&lt;li style=&quot;box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;&quot;&gt;Inside Fabric and Leather Lining.&lt;/li&gt;&lt;li style=&quot;box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;&quot;&gt;Interior details: 1 Center Compartment, 3 pockets - one is zip pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(411, 3, 'Terno', '&lt;p&gt;Terno Leather Long Strap Envelope  Clutch.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Black &amp; Mint.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Magnetic Fastening.&lt;/li&gt;&lt;li&gt;Long Non-Detachable Strap.&lt;/li&gt;&lt;li&gt;Inside Coated with Natural Leather.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Pocket, 4 Card Slots.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(412, 3, 'Terno', '&lt;p&gt;Terno Leather Long Strap Envelope  Clutch.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Black &amp; Blue.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Magnetic Fastening.&lt;/li&gt;&lt;li&gt;Long Non-Detachable Strap.&lt;/li&gt;&lt;li&gt;Inside Coated with Natural Leather.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Pocket, 4 Card Slots.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(413, 3, 'Terno', '&lt;p&gt;Terno Leather Long Strap Envelope  Clutch.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Black &amp; Dark Blue.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Magnetic Fastening.&lt;/li&gt;&lt;li&gt;Long Non-Detachable Strap.&lt;/li&gt;&lt;li&gt;Inside Coated with Natural Leather.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Pocket, 4 Card Slots.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(414, 3, 'Terno', '&lt;p&gt;Terno Leather Long Strap Envelope  Clutch.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Black &amp; Raspberry-Red.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Magnetic Fastening.&lt;/li&gt;&lt;li&gt;Long Non-Detachable Strap.&lt;/li&gt;&lt;li&gt;Inside Coated with Natural Leather.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Pocket, 4 Card Slots.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(415, 3, 'Terno', '&lt;p&gt;Terno Leather Long Strap Envelope  Clutch.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Black &amp; Pink.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Magnetic Fastening.&lt;/li&gt;&lt;li&gt;Long Non-Detachable Strap.&lt;/li&gt;&lt;li&gt;Inside Coated with Natural Leather.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Pocket, 4 Card Slots.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(416, 3, 'Roza', '&lt;p&gt;Roza Leather Long Strap Envelope Clutch.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Magnetic Fastening.&lt;/li&gt;&lt;li&gt;Long Non-Detachable Strap.&lt;/li&gt;&lt;li&gt;Inside Coated with Natural Leather and Fabric.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartmen, &nbsp;1 Inside Zip Pocket, 1 Back Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(417, 3, 'Roza', '&lt;p&gt;Roza Leather Long Strap Envelope Clutch.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Magnetic Fastening.&lt;/li&gt;&lt;li&gt;Long Non-Detachable Strap.&lt;/li&gt;&lt;li&gt;Inside Coated with Natural Leather and Fabric.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartmen, &nbsp;1 Inside Zip Pocket, 1 Back Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(418, 3, 'Roza', '&lt;p&gt;Roza Leather Long Strap Envelope Clutch.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Magnetic Fastening.&lt;/li&gt;&lt;li&gt;Long Non-Detachable Strap.&lt;/li&gt;&lt;li&gt;Inside Coated with Natural Leather and Fabric.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartmen, &nbsp;1 Inside Zip Pocket, 1 Back Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(419, 4, 'Adelle', '&lt;p&gt;Шкіряний міні-рюкзак з лінії Adelle.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Зверху коротка ручка довжиною 8 см.&lt;/li&gt;&lt;li&gt;Незнімні шкіряні ремінці з довжиною, що регулюється &lt;/li&gt;&lt;li&gt;Внутрішнє оздоблення з текстилю.&lt;/li&gt;&lt;li&gt;Всередині 1 основне  відділення, 1 кишеня на змійці.&lt;/li&gt;&lt;/ul&gt;', '', 'Adelle', '', ''),
(420, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: White.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(421, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Yellow.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(422, 3, 'Zaino mini', '&lt;p&gt;Zaino mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Glow.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 Detachable Straps.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(423, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Ivory.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(424, 4, 'Zaino mini', '&lt;p&gt;Шкіряний рюкзак-трансформер  з пензликами з лінії Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: пастельно-рожевий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімні ременя.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(425, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Sky Blue.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(426, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Green.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(427, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Scarlet.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(428, 3, 'Modena', '&lt;p style=&quot;box-sizing: inherit; margin-bottom: 1rem; padding: 0px; font-size: 12px; line-height: 1.6; text-rendering: optimizeLegibility; color: rgb(10, 10, 10); font-family: &quot;Century Gothic&quot;;&quot;&gt;Sevilla Big Leather Handbag.&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;padding: 0px; color: rgb(10, 10, 10); line-height: 1.6; font-family: &quot;Century Gothic&quot;; font-size: 12px; margin-bottom: 1rem; box-sizing: inherit;&quot;&gt;&nbsp; Color: Black.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Metal Zip Closure.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Double Top Handles, 12.5 cm Drop&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Inside Fabric and Leather Lining.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Interior details: 1 Center Compartment and 3 Cash Pockets - one is zip pocket.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(429, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Raspberry.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(430, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Viola.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(431, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Blue.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(432, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Raspberry.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(433, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Viola.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(434, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Blue.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(435, 3, 'Zaino mini', '&lt;p&gt;Zaino mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Lavender.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 Detachable Straps.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(436, 3, 'Tondo', '&lt;p&gt;Tondo Leather Big Handbag.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Sky Blue.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;One Top Handle, 12 cm Drop.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets - one is zip pocket.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(437, 3, 'Marbella', '&lt;p&gt;Marbella Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Lavender.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and&nbsp;3 Cash Pockets.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(438, 3, 'Marbella', '&lt;p&gt;Marbella Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Powder.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and&nbsp;3 Cash Pockets.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(439, 3, 'Zaino mini', '&lt;p&gt;Zaino mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Gold.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 Detachable Straps.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(440, 3, 'Zaino mini', '&lt;p&gt;Zaino mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Nickel.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(441, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Tender Blue.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(444, 3, 'Cylindro ', '&lt;p&gt;Cylindro Leather Shoulder Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Powder.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;One Top Handle, 12 cm Drop.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and &nbsp;Detachable Wallet.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(446, 3, 'Tondo mini', '&lt;p&gt;Tondo mini Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Lavender.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and 2 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(447, 3, 'Salerno mini', '&lt;p&gt;Salerno mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Mint.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(448, 3, 'Salerno mini', '&lt;p&gt;Salerno mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: White.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(449, 3, 'Salerno', '&lt;p&gt;Salerno Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: White.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(450, 3, 'Marbella', '&lt;p&gt;Marbella Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Pastel Pink&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and&nbsp;3 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(451, 3, 'Marbella', '&lt;p&gt;Marbella Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Honey.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and&nbsp;3 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(452, 3, 'Salerno', '&lt;p&gt;Salerno Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Lavender.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Fabric Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(453, 3, 'Salerno mini', '&lt;p&gt;Salerno mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Green.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(454, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Yellow.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(455, 3, 'Zaino mini', '&lt;p&gt;Zaino mini Leather &nbsp;Tassel Transformer Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Ivory.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;li&gt;Comes with 3 straps.&lt;/li&gt;&lt;/ul&gt;', '', '', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(456, 3, 'Marbella', '&lt;p&gt;Marbella Leather Shoulder Mini Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Grey.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;One Handle, 8 cm Drop, Detachable Leather Strap.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and&nbsp;3 Cash Pockets.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(457, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel &nbsp;Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Emerald.&lt;/li&gt;&lt;li&gt;Manually dyed&nbsp;&nbsp;leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(458, 3, 'Cylindro ', '', '', '', '', ''),
(459, 3, 'Cylindro ', '', '', '', '', ''),
(460, 3, 'Zaino mini', '', '', '', '', ''),
(462, 3, 'Zaino mini', '', '', '', '', ''),
(297, 4, 'Tondo', '&lt;p&gt;Велика шкіряна сумка на руку з серії Tondo.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: ментоловий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху одна ручка висотою 12 см.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 кишеньки, одна з яких на змійці.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(303, 4, 'Tondo', '&lt;p&gt;Велика шкіряна сумка на руку з&nbsp;&lt;span style=&quot;font-size: 12px;&quot;&gt;лінії&nbsp;&lt;/span&gt;Tondo.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: червоний гранат.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху одна ручка висотою 12 см.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 кишеньки, одна з яких на змійці.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(304, 4, 'Tondo', '&lt;p&gt;Велика шкіряна сумка на руку з серії Tondo.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: бордо.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху одна ручка висотою 12 см.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 кишеньки, одна з яких на змійці.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(305, 4, 'Tondo', '&lt;p&gt;Велика шкіряна сумка на руку з серії Tondo.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: бургунді.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху одна ручка висотою 12 см.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 кишеньки, одна з яких на змійці.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(307, 4, 'Tondo', '&lt;p&gt;Велика шкіряна сумка на руку з серії Tondo.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: морський.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху одна ручка висотою 12 см.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 кишеньки, одна з яких на змійці.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(308, 4, 'Tondo', '&lt;p&gt;Велика шкіряна сумка на руку з серії Tondo.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху одна ручка висотою 12 см.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 кишеньки, одна з яких на змійці.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(310, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: сірий.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(311, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: бежевий.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(312, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: червоний.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(313, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: темно-червоний.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(314, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: червоний гранат.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(315, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: бордовий.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(316, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: бургунді.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(317, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: коріандр.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(318, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: хакі.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(319, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: морський.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(320, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: білий.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(322, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: пудровий.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(323, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: пастельно-рожевий.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(324, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: ментоловий.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(325, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: лазуровий.&lt;/li&gt;&lt;li&gt;Металева застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(326, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: яскраво-блакитний.&lt;/li&gt;&lt;li&gt;Металева застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(327, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: індиго.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(328, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: ліловий.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(329, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: карамель.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(330, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: жовтий.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(331, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: денім.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(332, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: океан.&lt;/li&gt;&lt;li&gt;Металева застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(333, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: синій.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(334, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(335, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний з синьою окантовкою.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(336, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний з синьою окантовкою.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(337, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(339, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний з синьою окантовкою.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(340, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: срібло.&lt;/li&gt;&lt;li&gt;Металева застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(341, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: золото.&lt;/li&gt;&lt;li&gt;Металева застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(343, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: ментол.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(344, 3, 'Zaino', '&lt;p&gt;Zaino Leather Tassel  Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Color: Green.&lt;/li&gt;&lt;li&gt;Manually dyed  leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment, 1 Cash Pocket.&lt;/li&gt;&lt;li&gt;Exterior Details: 1 Front Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(345, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: лавандовий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(347, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: лазуровий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(348, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: сірий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(349, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: світло-сірий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(350, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: графіт.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(351, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: бежевий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(352, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: бургунді.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(353, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: бордо.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(354, 2, 'Zaino', '&lt;p&gt;Кожаный рюкзак  с кисточками из линии Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: темно-красный.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную  края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(355, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: червоний гранат.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(356, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: космос.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(357, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: океан.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 12px;&quot;&gt;екошкіри&lt;/span&gt;.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(359, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: індиго.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 12px;&quot;&gt;екошкіри&lt;/span&gt;.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(360, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: морський.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(361, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: ліловий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(362, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: синій.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(363, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(364, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(365, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний.&lt;/li&gt;&lt;li&gt;Металева застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(366, 4, 'Zaino mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: білий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(367, 4, 'Zaino mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: ментоловий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(368, 4, 'Zaino mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: сірий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(369, 4, 'Zaino mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: океан.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(370, 4, 'Zaino mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: синій.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(371, 4, 'Zaino mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: бургунді.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(372, 4, 'Zaino mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(373, 4, 'Zaino mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: червоний гранат.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(374, 4, 'Zaino mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: морський.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(375, 4, 'Zaino mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: ліловий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(376, 4, 'Salerno', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: червоний гранат.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(377, 4, 'Salerno', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: океан.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(378, 4, 'Salerno', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: денім.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(379, 4, 'Salerno', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: сірий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(380, 4, 'Salerno', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: ліловий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(381, 4, 'Salerno', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний з червоною окантовкою.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(382, 4, 'Salerno', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний з фіолетовою окантовкою.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(383, 4, 'Salerno', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(389, 4, 'Salerno mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: океан.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(390, 4, 'Salerno mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: денім.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(391, 4, 'Salerno mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: морський.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(392, 4, 'Salerno mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: сірий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(394, 4, 'Salerno mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: червоний гранат.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(395, 4, 'Salerno mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: ліловий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(396, 4, 'Salerno mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(398, 4, 'Sevilla', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Велика шкіряна сумка на руку з лінії Sevilla.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Колір: ліловий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху одна ручка висотою 12 см, знімний шкіряний ремінь на карабінах.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 1 кишенька на змійці.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(399, 4, 'Sevilla', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Велика шкіряна сумка на руку з лінії Sevilla.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Колір: сірий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху одна ручка висотою 12 см, знімний шкіряний ремінь на карабінах.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 1 кишенька на змійці.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(401, 4, 'Sevilla', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Велика шкіряна сумка на руку з лінії Sevilla.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Колір: денім.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху одна ручка висотою 12 см, знімний шкіряний ремінь на карабінах.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 1 кишенька на змійці.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(402, 4, 'Sevilla', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Велика шкіряна сумка на руку з лінії Sevilla.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Колір: океан.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху одна ручка висотою 12 см, знімний шкіряний ремінь на карабінах.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 1 кишенька на змійці.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(403, 4, 'Sevilla', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Велика шкіряна сумка на руку з лінії Sevilla.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Колір: морський.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху одна ручка висотою 12 см, знімний шкіряний ремінь на карабінах.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 1 кишенька на змійці.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(404, 4, 'Sevilla', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Велика шкіряна сумка на руку з лінії Sevilla.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Колір: чорний.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху одна ручка висотою 12 см, знімний шкіряний ремінь на карабінах.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 1 кишенька на змійці.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(405, 4, 'Caramente', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Велика шкіряна сумка на руку з лінії Caramente.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху одна ручка висотою 12 см, знімний шкіряний ремінь на карабінах.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 кишеньки, одна з яких на змійці.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(406, 4, 'Bordo', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Велика шкіряна сумка на руку з лінії Bordo.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Металева застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху дві ручки, знімний шкіряний ремінь на карабінах.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 1 кишенька на змійці.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(407, 4, 'Bordo', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Велика шкіряна сумка на руку з лінії Bordo.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Металева застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху дві ручки, знімний шкіряний ремінь на карабінах.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 1 кишенька на змійці.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(408, 4, 'Siera', '&lt;p style=&quot;font-size: 12px;&quot;&gt;Шкіряна сумка на руку з лінії Siera.&lt;/p&gt;&lt;ul style=&quot;font-size: 12px;&quot;&gt;&lt;li&gt;Колір: червоний.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Металева застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху дві ручки, знімний шкіряний ремінь на карабінах.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 1 кишенька на змійці.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(409, 4, 'Modena', '&lt;p style=&quot;box-sizing: inherit; margin-bottom: 1rem; padding: 0px; font-size: 12px; line-height: 1.6; text-rendering: optimizeLegibility; color: rgb(10, 10, 10); font-family: &quot;Century Gothic&quot;;&quot;&gt;Велика шкіряна сумка на руку з лінії Sevilla.&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;padding: 0px; color: rgb(10, 10, 10); line-height: 1.6; font-family: &quot;Century Gothic&quot;; font-size: 12px; margin-bottom: 1rem; box-sizing: inherit;&quot;&gt;&nbsp; Колір: чорно-білий.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Металева застібка на блискавці.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Зверху 2 ручки, діаметром 12,5 см.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Внутрішня підкладка з текстилю та шкіри.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Всередині: 1 основне відділення та 3 кишеньки, одна з яких на змійці.&lt;/li&gt;&lt;/ul&gt;', '', '', '', '');
INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(410, 4, 'Modena', '&lt;p style=&quot;box-sizing: inherit; margin-bottom: 1rem; padding: 0px; font-size: 12px; line-height: 1.6; text-rendering: optimizeLegibility; color: rgb(10, 10, 10); font-family: &quot;Century Gothic&quot;;&quot;&gt;Велика шкіряна сумка на руку з лінії Sevilla.&lt;/p&gt;&lt;ul style=&quot;box-sizing: inherit; list-style-position: outside; list-style-image: initial; margin-right: 0px; margin-bottom: 0px; margin-left: 1.25rem; padding: 0px; color: rgb(10, 10, 10); font-family: &quot;Century Gothic&quot;; font-size: 12px;&quot;&gt;&lt;li style=&quot;box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;&quot;&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li style=&quot;box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;&quot;&gt;Металева застібка на блискавці.&lt;/li&gt;&lt;li style=&quot;box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;&quot;&gt;Зверху 2 ручки, діаметром 12,5 см.&lt;/li&gt;&lt;li style=&quot;box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;&quot;&gt;Внутрішня підкладка з текстилю та шкіри.&lt;/li&gt;&lt;li style=&quot;box-sizing: inherit; margin: 0px; padding: 0px; font-size: inherit;&quot;&gt;Всередині: 1 основне відділення та 3 кишеньки, одна з яких на змійці.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(411, 4, 'Terno', '&lt;p&gt;Шкіряний клатч-конверт з довгим ремінцем з лінії Terno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний та ментоловий.&lt;/li&gt;&lt;li&gt;Профаобовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Застібка на магніті.&lt;/li&gt;&lt;li&gt;Довгий незнімний ремінець.&lt;/li&gt;&lt;li&gt;Внутрішнє оздоблення з натуральної шкіри.&lt;/li&gt;&lt;li&gt;Всередині 1 основне відділення, 1 кишеня, 4 відділення для карт.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(412, 4, 'Terno', '&lt;p&gt;Шкіряний клатч-конверт з довгим ремінцем з лінії Terno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний та голубий.&lt;/li&gt;&lt;li&gt;Профаобовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Застібка на магніті.&lt;/li&gt;&lt;li&gt;Довгий незнімний ремінець.&lt;/li&gt;&lt;li&gt;Внутрішнє оздоблення з натуральної шкіри.&lt;/li&gt;&lt;li&gt;Всередині 1 основне відділення, 1 кишеня, 4 відділення для карт.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(413, 4, 'Terno', '&lt;p&gt;Шкіряний клатч-конверт з довгим ремінцем з лінії Terno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний та синій.&lt;/li&gt;&lt;li&gt;Профаобовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Застібка на магніті.&lt;/li&gt;&lt;li&gt;Довгий незнімний ремінець.&lt;/li&gt;&lt;li&gt;Внутрішнє оздоблення з натуральної шкіри.&lt;/li&gt;&lt;li&gt;Всередині 1 основне відділення, 1 кишеня, 4 відділення для карт.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(414, 4, 'Terno', '&lt;p&gt;Шкіряний клатч-конверт з довгим ремінцем з лінії Terno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний та малиновый.&lt;/li&gt;&lt;li&gt;Профаобовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Застібка на магніті.&lt;/li&gt;&lt;li&gt;Довгий незнімний ремінець.&lt;/li&gt;&lt;li&gt;Внутрішнє оздоблення з натуральної шкіри.&lt;/li&gt;&lt;li&gt;Всередині 1 основне відділення, 1 кишеня, 4 відділення для карт.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(415, 4, 'Terno', '&lt;p&gt;Шкіряний клатч-конверт з довгим ремінцем з лінії Terno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: чорний та рожевий.&lt;/li&gt;&lt;li&gt;Профаобовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Застібка на магніті.&lt;/li&gt;&lt;li&gt;Довгий незнімний ремінець.&lt;/li&gt;&lt;li&gt;Внутрішнє оздоблення з натуральної шкіри.&lt;/li&gt;&lt;li&gt;Всередині 1 основне відділення, 1 кишеня, 4 відділення для карт.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(416, 4, 'Roza', '&lt;p&gt;Шкіряний клатч-конверт з довгим ремінцем з лінії Roza.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Застібка на магніті.&lt;/li&gt;&lt;li&gt;Довгий незнімний шкіряний ремінець.&lt;/li&gt;&lt;li&gt;Внутрішнє оздоблення з натуральної шкіри та текстилю.&lt;/li&gt;&lt;li&gt;Всередині 1 основне відділення, &nbsp;1 внутрішня кишеня зі змійкою, 1 кишеня на задній частині зі змійкою.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(417, 4, 'Roza', '&lt;p&gt;Шкіряний клатч-конверт з довгим ремінцем з лінії Roza.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Застібка на магніті.&lt;/li&gt;&lt;li&gt;Довгий незнімний шкіряний ремінець.&lt;/li&gt;&lt;li&gt;Внутрішнє оздоблення з натуральної шкіри та текстилю.&lt;/li&gt;&lt;li&gt;Всередині 1 основне відділення, &nbsp;1 внутрішня кишеня зі змійкою, 1 кишеня на задній частині зі змійкою.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(418, 4, 'Roza', '&lt;p&gt;Шкіряний клатч-конверт з довгим ремінцем з лінії Roza.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Застібка на магніті.&lt;/li&gt;&lt;li&gt;Довгий незнімний шкіряний ремінець.&lt;/li&gt;&lt;li&gt;Внутрішнє оздоблення з натуральної шкіри та текстилю.&lt;/li&gt;&lt;li&gt;Всередині 1 основне відділення, &nbsp;1 внутрішня кишеня зі змійкою, 1 кишеня на задній частині зі змійкою.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(419, 3, 'Adelle', '&lt;p&gt;Adelle Leather Mini Backpack.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Manually dyed leather edges.&lt;/li&gt;&lt;li&gt;Top Short Handle, 8 cm Drop.&lt;/li&gt;&lt;li&gt;Non-Detachable Adjustable Leather Straps.&lt;/li&gt;&lt;li&gt;Inside Coated with Fabric.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center  Compartment, 1 Zip Pocket.&lt;/li&gt;&lt;/ul&gt;', '', 'Adelle', '', ''),
(419, 2, 'Adelle', '&lt;p&gt;Кожаный мини-рюкзак из линии Adelle.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Сверху короткая ручка длиной 8 см.&lt;/li&gt;&lt;li&gt;Несъемные кожаные ремешки с регулирующейся длиной.&lt;/li&gt;&lt;li&gt;Внутренняя отделка из текстиля.&lt;/li&gt;&lt;li&gt;Внутри 1 основное  отделение, 1 карман на змейке.&lt;/li&gt;&lt;/ul&gt;', '', 'Adelle', '', ''),
(420, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: білий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(421, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: жовтий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(422, 4, 'Zaino mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: сяйво.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімні ременя.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(423, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: слонова кістка.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та  2 маленькі кишеньки.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(424, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер  с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: пастельно-розовый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(425, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: небесно-блакитний.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та  2 маленькі кишеньки.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(426, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: зелений.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(427, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: багряний.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(428, 4, 'Modena', '&lt;p style=&quot;box-sizing: inherit; margin-bottom: 1rem; padding: 0px; font-size: 12px; line-height: 1.6; text-rendering: optimizeLegibility; color: rgb(10, 10, 10); font-family: &quot;Century Gothic&quot;;&quot;&gt;Велика шкіряна сумка на руку з лінії Sevilla.&lt;/p&gt;&lt;ul&gt;&lt;li style=&quot;padding: 0px; color: rgb(10, 10, 10); line-height: 1.6; font-family: &quot;Century Gothic&quot;; font-size: 12px; margin-bottom: 1rem; box-sizing: inherit;&quot;&gt;&nbsp; Колір: чорний.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Металева застібка на блискавці.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Зверху 2 ручки, діаметром 12,5 см.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Внутрішня підкладка з текстилю та шкіри.&lt;/li&gt;&lt;li style=&quot;margin: 0px; padding: 0px; font-size: inherit; box-sizing: inherit;&quot;&gt;Всередині: 1 основне відділення та 3 маленьких кишеньки, одна з яких на змійці.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(429, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: малина.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(430, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: фіалка.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(431, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: блакитний.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(432, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: малина.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та  2 маленькі кишеньки.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(433, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: фыалка.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та  2 маленькі кишеньки.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(434, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: блакитний.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та  2 маленькі кишеньки.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(435, 4, 'Zaino mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: лаванда.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімні ременя.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(436, 4, 'Tondo', '&lt;p&gt;Велика шкіряна сумка на руку з серії Tondo.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: небесно-блакитний.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху одна ручка висотою 12 см.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки, одна з яких на змійці.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(437, 4, 'Marbella', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Marbella.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: лаванда.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та&nbsp;3 маленькі кишеньки.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(438, 4, 'Marbella', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Marbella.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: пудра.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та&nbsp;3 маленькі кишеньки.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(439, 4, 'Zaino mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: золото.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімні ременя.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(440, 4, 'Zaino mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: нікель.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(441, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: ніжно-блакитний.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(442, 3, 'Cylindro ', '&lt;p&gt;Cylindro Leather Shoulder Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Mint.&lt;/li&gt;&lt;li&gt;Manually dyed  leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;One Top Handle, 12 cm Drop.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and  Detachable Wallet.&lt;/li&gt;&lt;/ul&gt;', '', 'Cylindro ', '', ''),
(442, 2, 'Cylindro ', '&lt;p&gt;Кожаная сумка на плечо с длинным съемным ремешком из линии Cylindro.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: ментоловый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную  края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и  съемный кошелек.&lt;/li&gt;&lt;/ul&gt;', '', 'Cylindro ', '', ''),
(443, 3, 'Cylindro', '&lt;p&gt;Cylindro Leather Shoulder Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: White.&lt;/li&gt;&lt;li&gt;Manually dyed  leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;One Top Handle, 12 cm Drop.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and  Detachable Wallet.&lt;/li&gt;&lt;/ul&gt;', '', 'Cylindro', '', ''),
(443, 2, 'Cylindro', '&lt;p&gt;Кожаная сумка на плечо с длинным съемным ремешком из линии Cylindro.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: белый.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную  края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и  съемный кошелек.&lt;/li&gt;&lt;/ul&gt;', '', 'Cylindro', '', ''),
(444, 4, 'Cylindro ', '&lt;p&gt;Шкіряна сумка на плече з довгим знімним ремінцем з лінії Cylindro.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: пудровий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Зверху одна ручка висотою 12 см.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та &nbsp;знімний гаманець.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(445, 3, 'Cylindro ', '&lt;p&gt;Cylindro Leather Shoulder Bag with Long Detachable Strap.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: Lavender.&lt;/li&gt;&lt;li&gt;Manually dyed  leather edges.&lt;/li&gt;&lt;li&gt;Branded Zip Closure.&lt;/li&gt;&lt;li&gt;One Top Handle, 12 cm Drop.&lt;/li&gt;&lt;li&gt;Inside Eco Leather Lining.&lt;/li&gt;&lt;li&gt;Interior Details: 1 Center Compartment and  Detachable Wallet.&lt;/li&gt;&lt;/ul&gt;', '', 'Cylindro ', '', ''),
(445, 2, 'Cylindro ', '&lt;p&gt;Кожаная сумка на плечо с длинным съемным ремешком из линии Cylindro.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: лаванда.&lt;/li&gt;&lt;li&gt;Прокрашенные вручную  края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Сверху одна ручка высотой 12 см.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение и  съемный кошелек.&lt;/li&gt;&lt;/ul&gt;', '', 'Cylindro ', '', ''),
(446, 4, 'Tondo mini', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Tondo mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: лаванда.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та 2 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(447, 4, 'Salerno mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: ментоловий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(448, 4, 'Salerno mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: білий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(449, 4, 'Salerno', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: білий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(450, 4, 'Marbella', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Marbella.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: пастельно-рожевий&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та&nbsp;3 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(451, 4, 'Marbella', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Marbella.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: медовий.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та&nbsp;3 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(452, 4, 'Salerno', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: лаванда.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;b&gt;&lt;/b&gt;&lt;i&gt;&lt;/i&gt;&lt;u&gt;&lt;/u&gt;&lt;sub&gt;&lt;/sub&gt;&lt;sup&gt;&lt;/sup&gt;&lt;strike&gt;&lt;/strike&gt;&lt;br&gt;&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(453, 4, 'Salerno mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Salerno.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: зелений.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(454, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: жовтий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(455, 4, 'Zaino mini', '&lt;p&gt;Шкіряний рюкзак-трансформер &nbsp;з пензликами з лінії Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: слонова кістка.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;li&gt;В комплекті 3 знімних ременя.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(456, 4, 'Marbella', '&lt;p&gt;Шкіряна сумочка-міні на плече з довгим знімним ремінцем з лінії Marbella.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: сірий.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Профарбовані вручну краї шкіри.&lt;/li&gt;&lt;li&gt;Одна ручка висотою 8 см, знімний ремінь зі шкіри.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з екошкіри.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення та&nbsp;3 маленькі кишеньки.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(457, 4, 'Zaino', '&lt;p&gt;Шкіряний рюкзак &nbsp;з пензликами з лінії Zaino.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Колір: смарагдовий.&lt;/li&gt;&lt;li&gt;Профарбовані вручну&nbsp;&nbsp;краї шкіри.&lt;/li&gt;&lt;li&gt;Брендована застібка на блискавці.&lt;/li&gt;&lt;li&gt;Внутрішня підкладка з текстилю.&lt;/li&gt;&lt;li&gt;Всередині: 1 основне відділення, 1 маленька кишеня.&lt;/li&gt;&lt;li&gt;Зовні: 1 кишеня зі змійкою на лицьовій частині рюкзака.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(458, 4, 'Cylindro ', '', '', '', '', ''),
(459, 4, 'Cylindro ', '', '', '', '', ''),
(460, 4, 'Zaino mini', '', '', '', '', ''),
(461, 2, 'Zaino mini', '&lt;p&gt;Кожаный рюкзак-трансформер &amp;nbsp;с кисточками из линии Zaino mini.&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Цвет: зеленый&lt;/li&gt;&lt;li&gt;Прокрашенные вручную края кожи.&lt;/li&gt;&lt;li&gt;Брендированная застежка на молнии.&lt;/li&gt;&lt;li&gt;Внутренняя подкладка из экокожи.&lt;/li&gt;&lt;li&gt;Внутри: 1 основное отделение, 1 маленький карман.&lt;/li&gt;&lt;li&gt;Снаружи: 1 карман со змейкой на лицевой части рюкзака.&lt;/li&gt;&lt;li&gt;В комплекте 3 съемных ремня.&lt;/li&gt;&lt;/ul&gt;', '', '', '', ''),
(462, 4, 'Zaino mini', '', '', '', '', ''),
(461, 4, 'Zaino mini', '', '', '', '', ''),
(461, 3, 'Zaino mini', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_discount`
--

CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `country_code` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_filter`
--

CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_image`
--

CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(15698, 408, 'catalog/bags/siera/siera_red_ar-02.jpg', 0),
(15431, 407, 'catalog/bags/bordo/bordo_black_blue/bordo_black_blue_ar-02.jpg', 5),
(15430, 407, 'catalog/bags/bordo/bordo_black_blue/bordo_black_blue_ar-05.jpg', 4),
(15429, 407, 'catalog/bags/bordo/bordo_black_blue/bordo_black_blue_ar-04.jpg', 3),
(15428, 407, 'catalog/bags/bordo/bordo_black_blue/bordo_black_blue_ar-03.jpg', 2),
(15426, 406, 'catalog/bags/bordo/bordo_black_red/bordo_black_red_ar-02.jpg', 5),
(15425, 406, 'catalog/bags/bordo/bordo_black_red/bordo_black_red_ar-05.jpg', 4),
(16326, 389, 'catalog/bags/salerno_mini/salerno_mini_ocean/salerno_mini_ocean_v2_ar-01.jpg', 5),
(15629, 390, 'catalog/bags/salerno_mini/salerno_mini_denim/salerno_mini_denim_ar-05.jpg', 4),
(15628, 390, 'catalog/bags/salerno_mini/salerno_mini_denim/salerno_mini_denim_ar-04.jpg', 3),
(15627, 390, 'catalog/bags/salerno_mini/salerno_mini_denim/salerno_mini_denim_ar-03.jpg', 2),
(15626, 390, 'catalog/bags/salerno_mini/salerno_mini_denim/salerno_mini_denim_ar-02.jpg', 1),
(16670, 341, 'catalog/bags/tondo_mini/tondo_mini_gold/tondo_mini_gold_ar-05.jpg', 4),
(15634, 391, 'catalog/bags/salerno_mini/salerno_mini_marine/salerno_mini_marine_v2_ar-02.jpg', 5),
(15633, 391, 'catalog/bags/salerno_mini/salerno_mini_marine/salerno_mini_marine_v2_ar-05.jpg', 4),
(15632, 391, 'catalog/bags/salerno_mini/salerno_mini_marine/salerno_mini_marine_v2_ar-04.jpg', 3),
(15631, 391, 'catalog/bags/salerno_mini/salerno_mini_marine/salerno_mini_marine_v2_ar-03.jpg', 2),
(16443, 405, 'catalog/bags/caramente/caramente_black_red_ar-04.jpg', 5),
(16442, 405, 'catalog/bags/caramente/caramente_black_red_ar-03.jpg', 4),
(16441, 405, 'catalog/bags/caramente/caramente_black_red_ar-06.jpg', 3),
(15639, 392, 'catalog/bags/salerno_mini/salerno_mini_grey/salerno_mini_gray_ar-02.jpg', 5),
(15638, 392, 'catalog/bags/salerno_mini/salerno_mini_grey/salerno_mini_gray_ar-05.jpg', 4),
(15637, 392, 'catalog/bags/salerno_mini/salerno_mini_grey/salerno_mini_gray_ar-04.jpg', 3),
(15636, 392, 'catalog/bags/salerno_mini/salerno_mini_grey/salerno_mini_gray_ar-03.jpg', 2),
(15760, 426, 'catalog/bags/tondo_mini/tondo_mini_green/tondo_mini_green_t_v2_ar-02-600x806.jpg', 5),
(15759, 426, 'catalog/bags/tondo_mini/tondo_mini_green/tondo_mini_green_t_v2_ar-05.jpg', 4),
(15695, 404, 'catalog/bags/sevilla/sevilla_black/sevilla_black_red_ar-02.jpg', 6),
(15694, 404, 'catalog/bags/sevilla/sevilla_black/sevilla_black_red_ar-06.jpg', 5),
(15693, 404, 'catalog/bags/sevilla/sevilla_black/sevilla_black_red_ar-05.jpg', 4),
(15973, 425, 'catalog/bags/tondo_mini/tondo_mini_skyblue/tondo_mini_skyblue_v2_ar-03.jpg', 2),
(15692, 404, 'catalog/bags/sevilla/sevilla_black/sevilla_black_red_ar-04.jpg', 3),
(15689, 403, 'catalog/bags/sevilla/sevilla_marine/sevilla_marine_ar-02.jpg', 5),
(15688, 403, 'catalog/bags/sevilla/sevilla_marine/sevilla_marine_ar-05.jpg', 4),
(15687, 403, 'catalog/bags/sevilla/sevilla_marine/sevilla_marine_ar-04.jpg', 3),
(15686, 403, 'catalog/bags/sevilla/sevilla_marine/sevilla_marine_ar-03.jpg', 2),
(15684, 402, 'catalog/bags/sevilla/sevilla_ocean/sevilla_ocean_ar-02.jpg', 5),
(15641, 394, 'catalog/bags/zaino_mini/salernomini/salerno_mini_red_v2_ar-03.jpg', 2),
(15642, 394, 'catalog/bags/zaino_mini/salernomini/salerno_mini_red_v2_ar-04.jpg', 3),
(15683, 402, 'catalog/bags/sevilla/sevilla_ocean/sevilla_ocean_ar-05.jpg', 4),
(15682, 402, 'catalog/bags/sevilla/sevilla_ocean/sevilla_ocean_ar-04.jpg', 3),
(15681, 402, 'catalog/bags/sevilla/sevilla_ocean/sevilla_ocean_ar-03.jpg', 2),
(15649, 395, 'catalog/bags/salerno_mini/salerno_mini_lilac/salerno_mini_blackberry_ar-02.jpg', 5),
(15648, 395, 'catalog/bags/salerno_mini/salerno_mini_lilac/salerno_mini_blackberry_ar-05.jpg', 4),
(15647, 395, 'catalog/bags/salerno_mini/salerno_mini_lilac/salerno_mini_blackberry_ar-04.jpg', 3),
(15646, 395, 'catalog/bags/salerno_mini/salerno_mini_lilac/salerno_mini_blackberry_ar-03.jpg', 2),
(15770, 427, 'catalog/bags/tondo_mini/tondo_mini_scarlet/tondo_mini_red_t_v2_ar-02.jpg', 5),
(15769, 427, 'catalog/bags/tondo_mini/tondo_mini_scarlet/tondo_mini_red_t_v2_ar-05.jpg', 4),
(15654, 396, 'catalog/bags/salerno_mini/salerno_mini_black/salerno_mini_black_black_ar-05.jpg', 4),
(15653, 396, 'catalog/bags/salerno_mini/salerno_mini_black/salerno_mini_black_black_ar-04.jpg', 3),
(15652, 396, 'catalog/bags/salerno_mini/salerno_mini_black/salerno_mini_black_black_ar-03.jpg', 2),
(15651, 396, 'catalog/bags/salerno_mini/salerno_mini_black/salerno_mini_black_black_ar-02.jpg', 1),
(15679, 401, 'catalog/bags/sevilla/sevilla_denim/sevilla_denim_ar-02.jpg', 5),
(15678, 401, 'catalog/bags/sevilla/sevilla_denim/sevilla_denim_ar-05.jpg', 4),
(15677, 401, 'catalog/bags/sevilla/sevilla_denim/sevilla_denim_ar-04.jpg', 3),
(15676, 401, 'catalog/bags/sevilla/sevilla_denim/sevilla_denim_ar-03.jpg', 2),
(15757, 426, 'catalog/bags/tondo_mini/tondo_mini_green/tondo_mini_green_t_v2_ar-03.jpg', 2),
(15768, 427, 'catalog/bags/tondo_mini/tondo_mini_scarlet/tondo_mini_red_t_v2_ar-04.jpg', 3),
(15767, 427, 'catalog/bags/tondo_mini/tondo_mini_scarlet/tondo_mini_red_t_v2_ar-03.jpg', 2),
(16278, 409, 'catalog/bags/modena/modena_black_white/modena_black_white-05.jpg', 3),
(15664, 398, 'catalog/bags/sevilla/sevilla_lilac/sevilla_blackberry_ar-02.jpg', 5),
(15663, 398, 'catalog/bags/sevilla/sevilla_lilac/sevilla_blackberry_ar-05.jpg', 4),
(15662, 398, 'catalog/bags/sevilla/sevilla_lilac/sevilla_blackberry_ar-04.jpg', 3),
(15661, 398, 'catalog/bags/sevilla/sevilla_lilac/sevilla_blackberry_ar-03.jpg', 2),
(15423, 406, 'catalog/bags/bordo/bordo_black_red/bordo_black_red_ar-03.jpg', 2),
(15673, 399, 'catalog/bags/sevilla/sevilla_grey/sevilla_shark_ar-05.jpg', 4),
(15672, 399, 'catalog/bags/sevilla/sevilla_grey/sevilla_shark_ar-04.jpg', 3),
(15671, 399, 'catalog/bags/sevilla/sevilla_grey/sevilla_shark_ar-03.jpg', 2),
(15643, 394, 'catalog/bags/zaino_mini/salernomini/salerno_mini_red_v2_ar-05.jpg', 4),
(16478, 377, 'catalog/bags/salerno/salernooceanv2/salerno_ocean_v2_ar-02.jpg', 4),
(16477, 377, 'catalog/bags/salerno/salernooceanv2/salerno_ocean_v2_ar-04.jpg', 3),
(15578, 378, 'catalog/bags/salerno/salerno_denim/salerno_denim_ar-02.jpg', 4),
(15577, 378, 'catalog/bags/salerno/salerno_denim/salerno_denim_ar-04.jpg', 3),
(15576, 378, 'catalog/bags/salerno/salerno_denim/salerno_denim_ar-03.jpg', 2),
(15582, 379, 'catalog/bags/salerno/salerno_grey_v2/model_salerno_a-02.jpg', 4),
(15581, 379, 'catalog/bags/salerno/salerno_grey_v2/salerno_gray_v2_ar-04.jpg', 3),
(15580, 379, 'catalog/bags/salerno/salerno_grey_v2/salerno_gray_v2_ar-03.jpg', 2),
(15586, 380, 'catalog/bags/salerno/salerno_lilac/salerno_blackberry_ar-02.jpg', 4),
(15585, 380, 'catalog/bags/salerno/salerno_lilac/salerno_blackberry_ar-04.jpg', 3),
(15584, 380, 'catalog/bags/salerno/salerno_lilac/salerno_blackberry_ar-03.jpg', 2),
(15590, 381, 'catalog/bags/salerno/salerno_black_red/salerno_black_red_br-02.jpg', 4),
(15589, 381, 'catalog/bags/salerno/salerno_black_red/salerno_black_red_br-04.jpg', 3),
(15588, 381, 'catalog/bags/salerno/salerno_black_red/salerno_black_red_br-03.jpg', 2),
(15594, 382, 'catalog/bags/salerno/salerno_black_violet/salerno_black_violet_ar-02.jpg', 4),
(15593, 382, 'catalog/bags/salerno/salerno_black_violet/salerno_black_violet_ar-04.jpg', 3),
(16325, 389, 'catalog/bags/salerno_mini/salerno_mini_ocean/salerno_mini_ocean_v2_ar-05.jpg', 4),
(16324, 389, 'catalog/bags/salerno_mini/salerno_mini_ocean/salerno_mini_ocean_v2_ar-04.jpg', 3),
(15599, 383, 'catalog/bags/salerno/salerno_black_v2/salerno_black_black_ar-02.jpg', 5),
(15596, 383, 'catalog/bags/salerno/salerno_black_v2/salerno_black_black_ar-03.jpg', 2),
(16701, 421, 'catalog/bags/zaino/zaino_yellow_v2/zaino_yellow_v2_ar-02.jpg', 5),
(17212, 375, 'catalog/bags/zaino_mini/zaino_mini_lilac/zaino_mini_blackberry_v2_ar-02.jpg', 6),
(17218, 374, 'catalog/bags/zaino_mini/zaino_mini_marine/zaino_mini_marine_v2_ar-02.jpg', 6),
(16725, 350, 'catalog/bags/zaino/zaino_graphit/zaino_graphite_v2_ar-02.jpg', 4),
(16724, 350, 'catalog/bags/zaino/zaino_graphit/zaino_graphite_v2_ar-04.jpg', 3),
(17217, 374, 'catalog/bags/zaino_mini/zaino_mini_marine/zaino_mini_marine_v2_ar-06.jpg', 5),
(16756, 351, 'catalog/bags/zaino/zaino_zinco/zaino_zinco_br-02.jpg', 4),
(16755, 351, 'catalog/bags/zaino/zaino_zinco/zaino_zinco_br-04.jpg', 3),
(16754, 351, 'catalog/bags/zaino/zaino_zinco/zaino_zinco_br-03.jpg', 2),
(17216, 374, 'catalog/bags/zaino_mini/zaino_mini_marine/zaino_mini_marine_v2_ar-05.jpg', 4),
(17298, 352, 'catalog/bags/zaino/zaino_burgundy_v2/zaino_burgundy_v2_ar-02.jpg', 5),
(17297, 352, 'catalog/bags/zaino/zaino_burgundy_v2/zaino_burgundy_v2_ar-05.jpg', 4),
(17296, 352, 'catalog/bags/zaino/zaino_burgundy_v2/zaino_burgundy_v2_ar-04.jpg', 3),
(17295, 352, 'catalog/bags/zaino/zaino_burgundy_v2/zaino_burgundy_v2_ar-03.jpg', 2),
(17293, 373, 'catalog/bags/zaino_mini/zaino_mini_amaranto/zaino_mini_red_ar-02.jpg', 5),
(17292, 373, 'catalog/bags/zaino_mini/zaino_mini_amaranto/zaino_mini_red_ar-05.jpg', 4),
(17291, 373, 'catalog/bags/zaino_mini/zaino_mini_amaranto/zaino_mini_red_ar-04.jpg', 3),
(16738, 353, 'catalog/bags/zaino/zaino_bordo_v2/zaino_bordo_ar-02.jpg', 4),
(16737, 353, 'catalog/bags/zaino/zaino_bordo_v2/zaino_bordo_ar-04.jpg', 3),
(16736, 353, 'catalog/bags/zaino/zaino_bordo_v2/zaino_bordo_ar-03.jpg', 2),
(17288, 372, 'catalog/bags/zaino_mini/zainominiblackv2/zaino_mini_black_v2_ar-02.jpg', 6),
(17287, 372, 'catalog/bags/zaino_mini/zainominiblackv2/zaino_mini_black_v2_ar-06.jpg', 5),
(17286, 372, 'catalog/bags/zaino_mini/zainominiblackv2/zaino_mini_black_v2_ar-05.jpg', 4),
(17307, 354, 'catalog/bags/zaino/zaino_red_ante/zaino_prado_dark_red_sf_v2_ar-05.jpg', 4),
(17306, 354, 'catalog/bags/zaino/zaino_red_ante/zaino_prado_dark_red_sf_v2_ar-04.jpg', 3),
(17305, 354, 'catalog/bags/zaino/zaino_red_ante/zaino_prado_dark_red_sf_v2_ar-03.jpg', 2),
(17282, 371, 'catalog/bags/zaino_mini/zaino_mini_burgundy/zaino_mini_burgundy_ar-02.jpg', 5),
(17281, 371, 'catalog/bags/zaino_mini/zaino_mini_burgundy/zaino_mini_burgundy_ar-05.jpg', 4),
(16748, 355, 'catalog/bags/zaino/zaino_red_brunto_v2/zaino_red_v2_ar-02.jpg', 5),
(16747, 355, 'catalog/bags/zaino/zaino_red_brunto_v2/zaino_red_v2_ar-05.jpg', 4),
(16746, 355, 'catalog/bags/zaino/zaino_red_brunto_v2/zaino_red_v2_ar-04.jpg', 3),
(16745, 355, 'catalog/bags/zaino/zaino_red_brunto_v2/zaino_red_v2_ar-03.jpg', 2),
(17280, 371, 'catalog/bags/zaino_mini/zaino_mini_burgundy/zaino_mini_burgundy_ar-04.jpg', 3),
(17279, 371, 'catalog/bags/zaino_mini/zaino_mini_burgundy/zaino_mini_burgundy_ar-03.jpg', 2),
(16752, 356, 'catalog/bags/zaino/zaino_space_v2/zaino_cosmos_ar-02.jpg', 4),
(16751, 356, 'catalog/bags/zaino/zaino_space_v2/zaino_cosmos_ar-04.jpg', 3),
(16750, 356, 'catalog/bags/zaino/zaino_space_v2/zaino_cosmos_ar-03.jpg', 2),
(17277, 370, 'catalog/bags/zaino_mini/zaino_mini_pony_v2/zaino_mini_pony_v2_ar-02.jpg', 6),
(17276, 370, 'catalog/bags/zaino_mini/zaino_mini_pony_v2/zaino_mini_pony_v2_ar-05.jpg', 5),
(17275, 370, 'catalog/bags/zaino_mini/zaino_mini_pony_v2/zaino_mini_pony_v2_ar-06.jpg', 4),
(17274, 370, 'catalog/bags/zaino_mini/zaino_mini_pony_v2/zaino_mini_pony_v2_ar-04.jpg', 3),
(16649, 369, 'catalog/bags/zaino_mini/zaino_mini_ocean/zaino_mini_ocean_ar-05.jpg', 4),
(17109, 357, 'catalog/bags/zaino/zaino_ocean/zaino_ocean_v2_ar-02.jpg', 5),
(17108, 357, 'catalog/bags/zaino/zaino_ocean/zaino_ocean_v2_ar-05.jpg', 4),
(16214, 367, 'catalog/bags/zaino_mini/zaino_mini_menthol_v2/zaino_mini_mint_ar-04.jpg', 3),
(15976, 425, 'catalog/bags/tondo_mini/tondo_mini_skyblue/tondo_mini_skyblue_v2_ar-02.jpg', 5),
(15975, 425, 'catalog/bags/tondo_mini/tondo_mini_skyblue/tondo_mini_skyblue_v2_ar-05.jpg', 4),
(17270, 368, 'catalog/bags/zaino_mini/zaino_mini_grey/zaino_mini_gray_v2_ar-06.jpg', 5),
(16765, 359, 'catalog/bags/zaino/zaino_indigo/zaino_indi_ar-02.jpg', 4),
(16764, 359, 'catalog/bags/zaino/zaino_indigo/zaino_indi_ar-04.jpg', 3),
(16763, 359, 'catalog/bags/zaino/zaino_indigo/zaino_indi_ar-03.jpg', 2),
(17271, 368, 'catalog/bags/zaino_mini/zaino_mini_grey/zaino_mini_gray_v2_ar-02.jpg', 6),
(17268, 368, 'catalog/bags/zaino_mini/zaino_mini_grey/zaino_mini_gray_v2_ar-04.jpg', 3),
(16768, 360, 'catalog/bags/zaino/zaino_marine/zaino_marine_v2_ar-04.jpg', 3),
(16769, 360, 'catalog/bags/zaino/zaino_marine/zaino_marine_v2_ar-05.jpg', 4),
(16770, 360, 'catalog/bags/zaino/zaino_marine/zaino_marine_v2_ar-02.jpg', 5),
(16648, 369, 'catalog/bags/zaino_mini/zaino_mini_ocean/zaino_mini_ocean_ar-04.jpg', 3),
(16647, 369, 'catalog/bags/zaino_mini/zaino_mini_ocean/zaino_mini_ocean_ar-03.jpg', 2),
(16773, 361, 'catalog/bags/zaino/zaino_lilac/zaino_blackberry_v2_ar-04.jpg', 3),
(16774, 361, 'catalog/bags/zaino/zaino_lilac/zaino_blackberry_v2_ar-05.jpg', 4),
(16775, 361, 'catalog/bags/zaino/zaino_lilac/zaino_blackberry_v2_ar-02.jpg', 5),
(17113, 362, 'catalog/bags/zaino/zaino_blue_pony/zaino_pony_ar-02.jpg', 4),
(17112, 362, 'catalog/bags/zaino/zaino_blue_pony/zaino_pony_ar-04.jpg', 3),
(17111, 362, 'catalog/bags/zaino/zaino_blue_pony/zaino_pony_ar-03.jpg', 2),
(16217, 367, 'catalog/bags/zaino_mini/zaino_mini_menthol_v2/zaino_mini_mint_ar-02.jpg', 6),
(16216, 367, 'catalog/bags/zaino_mini/zaino_mini_menthol_v2/zaino_mini_mint_ar-05.jpg', 5),
(16783, 363, 'catalog/bags/zaino/zaino_black/zaino_black_brunto_ar-02.jpg', 4),
(16782, 363, 'catalog/bags/zaino/zaino_black/zaino_black_brunto_ar-04.jpg', 3),
(16781, 363, 'catalog/bags/zaino/zaino_black/zaino_black_brunto_ar-03.jpg', 2),
(16215, 367, 'catalog/bags/zaino_mini/zaino_mini_menthol_v2/zaino_mini_mint_ar-06.jpg', 4),
(17265, 366, 'catalog/bags/zaino_mini/zaino_mini_v2/zaino_mini_white_v2_ar-02.jpg', 6),
(17104, 364, 'catalog/bags/zaino/zaino_black_ante/z_zaino_black_ar-02.jpg', 4),
(17101, 364, 'catalog/bags/zaino/zaino_black_ante/z_zaino_black_ar-02.jpg', 1),
(17264, 366, 'catalog/bags/zaino_mini/zaino_mini_v2/zaino_mini_white_v2_ar-05.jpg', 5),
(17263, 366, 'catalog/bags/zaino_mini/zaino_mini_v2/zaino_mini_white_v2_ar-06.jpg', 4),
(16791, 365, 'catalog/bags/zaino/zaino_black_eco/zaino_black_eco_br-02.jpg', 4),
(16790, 365, 'catalog/bags/zaino/zaino_black_eco/zaino_black_eco_br-04.jpg', 3),
(16789, 365, 'catalog/bags/zaino/zaino_black_eco/zaino_black_eco_br-03.jpg', 2),
(17262, 366, 'catalog/bags/zaino_mini/zaino_mini_v2/zaino_mini_white_v2_ar-04.jpg', 3),
(15956, 340, 'catalog/bags/tondo_mini/tondo_mini_silver/tondo_mini_silver_ar-02.jpg', 5),
(15955, 340, 'catalog/bags/tondo_mini/tondo_mini_silver/tondo_mini_silver_ar-05.jpg', 4),
(15954, 340, 'catalog/bags/tondo_mini/tondo_mini_silver/tondo_mini_silver_ar-04.jpg', 3),
(15953, 340, 'catalog/bags/tondo_mini/tondo_mini_silver/tondo_mini_silver_ar-03.jpg', 2),
(16723, 350, 'catalog/bags/zaino/zaino_graphit/zaino_graphite_v2_ar-03.jpg', 2),
(16721, 349, 'catalog/bags/zaino/zaino_pale_grey_v2/zaino_gray_blue_v2_ar-02.jpg', 5),
(16720, 349, 'catalog/bags/zaino/zaino_pale_grey_v2/zaino_gray_blue_v2_ar-05.jpg', 4),
(16719, 349, 'catalog/bags/zaino/zaino_pale_grey_v2/zaino_gray_blue_v2_ar-04.jpg', 3),
(16716, 348, 'catalog/bags/zaino/zaino_grey_brunto_v2/zaino_gray_v2_ar-02.jpg', 5),
(16669, 341, 'catalog/bags/tondo_mini/tondo_mini_gold/tondo_mini_gold_ar-04.jpg', 3),
(16668, 341, 'catalog/bags/tondo_mini/tondo_mini_gold/tondo_mini_gold_ar-03.jpg', 2),
(16667, 341, 'catalog/bags/tondo_mini/tondo_mini_gold/model_tondo_mini_gold_a-07.jpg', 1),
(16715, 348, 'catalog/bags/zaino/zaino_grey_brunto_v2/zaino_gray_v2_ar-05.jpg', 4),
(16714, 348, 'catalog/bags/zaino/zaino_grey_brunto_v2/zaino_gray_v2_ar-04.jpg', 3),
(16713, 348, 'catalog/bags/zaino/zaino_grey_brunto_v2/zaino_gray_v2_ar-03.jpg', 2),
(16700, 421, 'catalog/bags/zaino/zaino_yellow_v2/zaino_yellow_v2_ar-05.jpg', 4),
(16699, 421, 'catalog/bags/zaino/zaino_yellow_v2/zaino_yellow_v2_ar-04.jpg', 3),
(16698, 421, 'catalog/bags/zaino/zaino_yellow_v2/zaino_yellow_v2_ar-03.jpg', 2),
(16681, 420, 'catalog/bags/zaino/zaino_white_v2/zaino_white_v2_ar-02.jpg', 5),
(16680, 420, 'catalog/bags/zaino/zaino_white_v2/zaino_white_v2_ar-05.jpg', 4),
(16679, 420, 'catalog/bags/zaino/zaino_white_v2/zaino_white_v2_ar-04.jpg', 3),
(16678, 420, 'catalog/bags/zaino/zaino_white_v2/zaino_white_v2_ar-03.jpg', 2),
(17057, 343, 'catalog/bags/zaino/zaino_menthol_v2/zaino_mint_v2_ar-02.jpg', 5),
(17056, 343, 'catalog/bags/zaino/zaino_menthol_v2/zaino_mint_v2_ar-05.jpg', 4),
(17055, 343, 'catalog/bags/zaino/zaino_menthol_v2/zaino_mint_v2_ar-04.jpg', 3),
(17054, 343, 'catalog/bags/zaino/zaino_menthol_v2/zaino_mint_v2_ar-03.jpg', 2),
(17072, 347, 'catalog/bags/zaino/zaino_azure_v2/zaino_blue_v2_ar-02.jpg', 5),
(17071, 347, 'catalog/bags/zaino/zaino_azure_v2/zaino_blue_v2_ar-05.jpg', 4),
(17070, 347, 'catalog/bags/zaino/zaino_azure_v2/zaino_blue_v2_ar-04.jpg', 3),
(17069, 347, 'catalog/bags/zaino/zaino_azure_v2/zaino_blue_v2_ar-03.jpg', 2),
(17259, 422, 'catalog/bags/zaino_mini/zaino_mini_kometa/zaino_mini_comet_nickel_v2_ar-02.jpg', 5),
(17067, 345, 'catalog/bags/zaino/zaino_lavender_v2/zaino_lavender_v2_ar-02.jpg', 5),
(17330, 344, 'catalog/bags/zaino_mini/zainominigreensf/zaino_mini_green_sf_v2_ar-06.jpg', 5),
(17331, 344, 'catalog/bags/zaino/zaino_green_ante_v2/zaino_green_v2_ar-02.jpg', 6),
(17328, 344, 'catalog/bags/zaino_mini/zainominigreensf/zaino_mini_green_sf_v2_ar-04.jpg', 3),
(17066, 345, 'catalog/bags/zaino/zaino_lavender_v2/zaino_lavender_v2_ar-05.jpg', 4),
(17065, 345, 'catalog/bags/zaino/zaino_lavender_v2/zaino_lavender_v2_ar-04.jpg', 3),
(17064, 345, 'catalog/bags/zaino/zaino_lavender_v2/zaino_lavender_v2_ar-03.jpg', 2),
(15947, 339, 'catalog/bags/tondo_mini/tondo_mini_black_blue_ante/tondo_mini_black_blue_t_ar-02.jpg', 1),
(15974, 425, 'catalog/bags/tondo_mini/tondo_mini_skyblue/tondo_mini_skyblue_v2_ar-04-600x806.jpg', 3),
(15905, 331, 'catalog/bags/tondo_mini/tondo_mini_denim_v2/tondo_mini_denim_v2_ar-02.jpg', 5),
(15951, 339, 'catalog/bags/tondo_mini/tondo_mini_black_blue_ante/tondo_mini_black_blue_t_ar-02.jpg', 5),
(15948, 339, 'catalog/bags/tondo_mini/tondo_mini_black_blue_ante/tondo_mini_black_blue_t_ar-03.jpg', 2),
(15915, 332, 'catalog/bags/tondo_mini/tondo_mini_ocean/tondo_mini_ocean_ar-02.jpg', 5),
(15914, 332, 'catalog/bags/tondo_mini/tondo_mini_ocean/tondo_mini_ocean_ar-05.jpg', 4),
(15913, 332, 'catalog/bags/tondo_mini/tondo_mini_ocean/tondo_mini_ocean_ar-04.jpg', 3),
(15912, 332, 'catalog/bags/tondo_mini/tondo_mini_ocean/tondo_mini_ocean_ar-03.jpg', 2),
(15937, 336, 'catalog/bags/tondo_mini/tondo_mini_black_pink/tondo_mini_black_pink_ar-02.jpg', 1),
(15949, 339, 'catalog/bags/tondo_mini/tondo_mini_black_blue_ante/tondo_mini_black_blue_t_ar-04.jpg', 3),
(16998, 376, 'catalog/bags/salerno/salerno_amaranto/salerno_red_ar-02b.jpg', 5),
(16997, 376, 'catalog/bags/salerno/salerno_amaranto/model_salerno_a-03.jpg', 4),
(16996, 376, 'catalog/bags/salerno/salerno_amaranto/salerno_red_ar-04.jpg', 3),
(17210, 375, 'catalog/bags/zaino_mini/zaino_mini_lilac/zaino_mini_blackberry_v2_ar-05.jpg', 4),
(15946, 337, 'catalog/bags/tondo_mini/tondo_mini_black_ante/tondo_mini_black_ar-02.jpg', 5),
(16532, 333, 'catalog/bags/tondo_mini/tondo_mini_pony/tondo_mini_pony_ar-02.jpg', 6),
(16531, 333, 'catalog/bags/tondo_mini/tondo_mini_pony/tondo_mini_pony_ar-05.jpg', 5),
(16530, 333, 'catalog/bags/tondo_mini/tondo_mini_pony/tondo_mini_pony_ar-06.jpg', 4),
(16529, 333, 'catalog/bags/tondo_mini/tondo_mini_pony/tondo_mini_pony_ar-04.jpg', 3),
(16528, 333, 'catalog/bags/tondo_mini/tondo_mini_pony/tondo_mini_pony_ar-03.jpg', 2),
(15945, 337, 'catalog/bags/tondo_mini/tondo_mini_black_ante/tondo_mini_black_ar-05.jpg', 4),
(15944, 337, 'catalog/bags/tondo_mini/tondo_mini_black_ante/tondo_mini_black_ar-04.jpg', 3),
(15943, 337, 'catalog/bags/tondo_mini/tondo_mini_black_ante/tondo_mini_black_ar-03.jpg', 2),
(15941, 336, 'catalog/bags/tondo_mini/tondo_mini_black_pink/tondo_mini_black_pink_ar-02.jpg', 5),
(16542, 334, 'catalog/bags/tondo_mini/tondo_mini_black/tondo_mini_black_black_ar-02.jpg', 5),
(16541, 334, 'catalog/bags/tondo_mini/tondo_mini_black/tondo_mini_black_black_ar-05.jpg', 4),
(16540, 334, 'catalog/bags/tondo_mini/tondo_mini_black/tondo_mini_black_black_ar-04.jpg', 3),
(16539, 334, 'catalog/bags/tondo_mini/tondo_mini_black/tondo_mini_black_black_ar-03.jpg', 2),
(15940, 336, 'catalog/bags/tondo_mini/tondo_mini_black_pink/tondo_mini_black_pink_ar-05.jpg', 4),
(15939, 336, 'catalog/bags/tondo_mini/tondo_mini_black_pink/tondo_mini_black_pink_ar-04.jpg', 3),
(15938, 336, 'catalog/bags/tondo_mini/tondo_mini_black_pink/tondo_mini_black_pink_ar-03.jpg', 2),
(15931, 335, 'catalog/bags/tondo_mini/tondo_mini_black_blue/tondo_mini_black_blue_ar-02.jpg', 5),
(15930, 335, 'catalog/bags/tondo_mini/tondo_mini_black_blue/tondo_mini_black_blue_ar-05.jpg', 4),
(15929, 335, 'catalog/bags/tondo_mini/tondo_mini_black_blue/tondo_mini_black_blue_ar-04.jpg', 3),
(15928, 335, 'catalog/bags/tondo_mini/tondo_mini_black_blue/tondo_mini_black_blue_ar-03.jpg', 2),
(15902, 331, 'catalog/bags/tondo_mini/tondo_mini_denim_v2/tondo_mini_denim_v2_ar-03.jpg', 2),
(15903, 331, 'catalog/bags/tondo_mini/tondo_mini_denim_v2/tondo_mini_denim_v2_ar-04.jpg', 3),
(15904, 331, 'catalog/bags/tondo_mini/tondo_mini_denim_v2/tondo_mini_denim_v2_ar-05.jpg', 4),
(15900, 330, 'catalog/bags/tondo_mini/tondo_mini_yellow_v2/tondo_mini_sierra_v2_ar-02.jpg', 5),
(15897, 330, 'catalog/bags/tondo_mini/tondo_mini_yellow_v2/tondo_mini_sierra_v2_ar-03.jpg', 2),
(16440, 405, 'catalog/bags/caramente/caramente_black_red_ar-05.jpg', 2),
(15899, 330, 'catalog/bags/tondo_mini/tondo_mini_yellow_v2/tondo_mini_sierra_v2_ar-05.jpg', 4),
(15898, 330, 'catalog/bags/tondo_mini/tondo_mini_yellow_v2/tondo_mini_sierra_v2_ar-04.jpg', 3),
(15750, 297, 'catalog/bags/tondo/tondo_mint_v2/tondo_mint_v2_ar-02-2.jpg', 4),
(15749, 297, 'catalog/bags/tondo/tondo_mint_v2/tondo_mint_v2_ar-04-2.jpg', 3),
(15748, 297, 'catalog/bags/tondo/tondo_mint_v2/tondo_mint_v2_ar-03-2.jpg', 2),
(15950, 339, 'catalog/bags/tondo_mini/tondo_mini_black_blue_ante/tondo_mini_black_blue_t_ar-05.jpg', 4),
(16511, 329, 'catalog/bags/tondo_mini/tondo_mini_caramel/tondo_mini_caramel_ar-02.jpg', 5),
(16510, 329, 'catalog/bags/tondo_mini/tondo_mini_caramel/tondo_mini_caramel_ar-05.jpg', 4),
(16509, 329, 'catalog/bags/tondo_mini/tondo_mini_caramel/tondo_mini_caramel_ar-04.jpg', 3),
(17249, 435, 'catalog/bags/zaino_mini/zaino_mini_lavander/zaino_mini_lavender_v2_ar-02.jpg', 6),
(17272, 370, 'catalog/bags/zaino_mini/zaino_mini_pony_v2/model_zaino_mini_a-04.jpg', 1),
(17319, 424, 'catalog/bags/zaino/zaino_white_pink/zaino_white_pink_t_v2_br-02.jpg', 5),
(17318, 424, 'catalog/bags/zaino/zaino_white_pink/zaino_white_pink_t_v2_br-05.jpg', 4),
(17258, 422, 'catalog/bags/zaino_mini/zaino_mini_kometa/zaino_mini_comet_nickel_v2_ar-06.jpg', 4),
(16508, 329, 'catalog/bags/tondo_mini/tondo_mini_caramel/tondo_mini_caramel_ar-03.jpg', 2),
(15876, 327, 'catalog/bags/tondo_mini/tondo_mini_indigo/tondo_mini_indi_ar-02.jpg', 1),
(16515, 328, 'catalog/bags/tondo_mini/tondominiblackberryv2/tondo_mini_blackberry_v2_ar-05.jpg', 4),
(16516, 328, 'catalog/bags/tondo_mini/tondominiblackberryv2/tondo_mini_blackberry_v2_ar-02.jpg', 5),
(15880, 327, 'catalog/bags/tondo_mini/tondo_mini_indigo/tondo_mini_indi_ar-02.jpg', 5),
(15879, 327, 'catalog/bags/tondo_mini/tondo_mini_indigo/tondo_mini_indi_ar-05.jpg', 4),
(15877, 327, 'catalog/bags/tondo_mini/tondo_mini_indigo/tondo_mini_indi_ar-03.jpg', 2),
(15726, 303, 'catalog/bags/tondo/tondo_amaranto/tondo_amaranto_ar-02.jpg', 4),
(15724, 303, 'catalog/bags/tondo/tondo_amaranto/tondo_amaranto_ar-03.jpg', 2),
(15725, 303, 'catalog/bags/tondo/tondo_amaranto/tondo_amaranto_ar-04.jpg', 3),
(15878, 327, 'catalog/bags/tondo_mini/tondo_mini_indigo/tondo_mini_indi_ar-04.jpg', 3),
(16437, 304, 'catalog/bags/tondo/tondo_bordo/tondo_bordo_v2_ar-04.jpg', 3),
(16436, 304, 'catalog/bags/tondo/tondo_bordo/tondo_bordo_v2_ar-03.jpg', 2),
(17052, 326, 'catalog/bags/tondo_mini/tondo_mini_deep_blue/tondo_mini_mint_ar-02.jpg', 5),
(15734, 305, 'catalog/bags/tondo/tondo_burgundy/tondo_burgundy_ar-02.jpg', 4),
(15733, 305, 'catalog/bags/tondo/tondo_burgundy/tondo_burgundy_ar-04.jpg', 3),
(15732, 305, 'catalog/bags/tondo/tondo_burgundy/tondo_burgundy_ar-03.jpg', 2),
(17051, 326, 'catalog/bags/tondo_mini/tondo_mini_deep_blue/tondo_mini_mint_ar-05.jpg', 4),
(17050, 326, 'catalog/bags/tondo_mini/tondo_mini_deep_blue/tondo_mini_mint_ar-04.jpg', 3),
(17049, 326, 'catalog/bags/tondo_mini/tondo_mini_deep_blue/tondo_mini_mint_ar-03.jpg', 2),
(17047, 325, 'catalog/bags/tondo_mini/tondo_mini_azure/tondo_mini_lightblue_ar-02.jpg', 5),
(17046, 325, 'catalog/bags/tondo_mini/tondo_mini_azure/tondo_mini_lightblue_ar-05.jpg', 4),
(16439, 405, 'catalog/bags/caramente/caramente_black_red_ar-02.jpg', 1),
(17317, 424, 'catalog/bags/zaino/zaino_white_pink/zaino_white_pink_t_v2_br-04.jpg', 3),
(17316, 424, 'catalog/bags/zaino/zaino_white_pink/zaino_white_pink_t_v2_br-03.jpg', 2),
(15758, 426, 'catalog/bags/tondo_mini/tondo_mini_green/tondo_mini_green_t_v2_ar-04.jpg', 3),
(17042, 423, 'catalog/bags/tondo_mini/tondo_mini_ivory/tondo_mini_white_t_v2_ar-02.jpg', 5),
(17041, 423, 'catalog/bags/tondo_mini/tondo_mini_ivory/tondo_mini_white_t_v2_ar-05.jpg', 4),
(15742, 307, 'catalog/bags/tondo/tondo_marine/tondo_marine_ar-02.jpg', 4),
(15741, 307, 'catalog/bags/tondo/tondo_marine/tondo_marine_ar-04.jpg', 3),
(15740, 307, 'catalog/bags/tondo/tondo_marine/tondo_marine_ar-03.jpg', 2),
(17045, 325, 'catalog/bags/tondo_mini/tondo_mini_azure/tondo_mini_lightblue_ar-04.jpg', 3),
(15746, 308, 'catalog/bags/tondo/tondo_black/tondo_black_ar-02.jpg', 4),
(15745, 308, 'catalog/bags/tondo/tondo_black/tondo_black_ar-04.jpg', 3),
(15860, 324, 'catalog/bags/tondo_mini/tondo_mini_menthol_v2/tondo_mini_mint_v2_ar-02.jpg', 5),
(17044, 325, 'catalog/bags/tondo_mini/tondo_mini_azure/tondo_mini_lightblue_ar-03.jpg', 2),
(15805, 314, 'catalog/bags/tondo_mini/tondo_mini_amaranto/tondo_mini_amaranto_ar-02.jpg', 5),
(15795, 313, 'catalog/bags/tondo_mini/tondo_mini_dark_red_ante/tondo_mini_red_ante_ar-02.jpg', 5),
(15792, 313, 'catalog/bags/tondo_mini/tondo_mini_dark_red_ante/tondo_mini_red_ante_ar-03.jpg', 2),
(16537, 310, 'catalog/bags/tondo_mini/tondo_mini_grey/tondo_mini_shark_ar-02.jpg', 5),
(16536, 310, 'catalog/bags/tondo_mini/tondo_mini_grey/tondo_mini_shark_ar-05.jpg', 4),
(16535, 310, 'catalog/bags/tondo_mini/tondo_mini_grey/tondo_mini_shark_ar-04.jpg', 3),
(16534, 310, 'catalog/bags/tondo_mini/tondo_mini_grey/tondo_mini_shark_ar-03.jpg', 2),
(15794, 313, 'catalog/bags/tondo_mini/tondo_mini_dark_red_ante/tondo_mini_red_ante_ar-05.jpg', 4),
(15793, 313, 'catalog/bags/tondo_mini/tondo_mini_dark_red_ante/tondo_mini_red_ante_ar-04.jpg', 3),
(16675, 311, 'catalog/bags/tondo_mini/tondo_mini_zinco/tondo_mini_zinco_ar-05.jpg', 4),
(16674, 311, 'catalog/bags/tondo_mini/tondo_mini_zinco/tondo_mini_zinco_ar-04.jpg', 3),
(16673, 311, 'catalog/bags/tondo_mini/tondo_mini_zinco/tondo_mini_zinco_ar-03.jpg', 2),
(15804, 314, 'catalog/bags/tondo_mini/tondo_mini_amaranto/tondo_mini_amaranto_ar-05.jpg', 4),
(15803, 314, 'catalog/bags/tondo_mini/tondo_mini_amaranto/tondo_mini_amaranto_ar-04.jpg', 3),
(15802, 314, 'catalog/bags/tondo_mini/tondo_mini_amaranto/tondo_mini_amaranto_ar-03.jpg', 2),
(16506, 312, 'catalog/bags/tondo_mini/tondo_mini_red_v2/model_tondo_mini_a-02.jpg', 1),
(16505, 312, 'catalog/bags/tondo_mini/tondo_mini_red_v2/tondo_mini_red_v2_ar-02.jpg', 5),
(16504, 312, 'catalog/bags/tondo_mini/tondo_mini_red_v2/tondo_mini_red_v2_ar-05.jpg', 4),
(16503, 312, 'catalog/bags/tondo_mini/tondo_mini_red_v2/tondo_mini_red_v2_ar-04.jpg', 3),
(15859, 324, 'catalog/bags/tondo_mini/tondo_mini_menthol_v2/tondo_mini_mint_v2_ar-05.jpg', 4),
(15858, 324, 'catalog/bags/tondo_mini/tondo_mini_menthol_v2/tondo_mini_mint_v2_ar-04.jpg', 3),
(15857, 324, 'catalog/bags/tondo_mini/tondo_mini_menthol_v2/tondo_mini_mint_v2_ar-03.jpg', 2),
(15855, 323, 'catalog/bags/tondo_mini/tondo_mini_white_pink_v2/tondo_mini_white_pink_v2_ar-02.jpg', 5),
(17188, 322, 'catalog/bags/tondo_mini/tondo_mini_powder/tondo_mini_powder_v2_ar-02.jpg', 5),
(17257, 422, 'catalog/bags/zaino_mini/zaino_mini_kometa/zaino_mini_comet_nickel_v2_ar-04.jpg', 3),
(17256, 422, 'catalog/bags/zaino_mini/zaino_mini_kometa/zaino_mini_comet_nickel_v2_ar-03.jpg', 2),
(17040, 423, 'catalog/bags/tondo_mini/tondo_mini_ivory/tondo_mini_white_t_v2_ar-04.jpg', 3),
(17039, 423, 'catalog/bags/tondo_mini/tondo_mini_ivory/tondo_mini_white_t_v2_ar-03.jpg', 2),
(15810, 315, 'catalog/bags/tondo_mini/tondo_mini_bordo_v2/tondo_mini_bordo_v2_ar-02.jpg', 5),
(15809, 315, 'catalog/bags/tondo_mini/tondo_mini_bordo_v2/tondo_mini_bordo_v2_ar-05.jpg', 4),
(15808, 315, 'catalog/bags/tondo_mini/tondo_mini_bordo_v2/tondo_mini_bordo_v2_ar-04.jpg', 3),
(15807, 315, 'catalog/bags/tondo_mini/tondo_mini_bordo_v2/tondo_mini_bordo_v2_ar-03.jpg', 2),
(16385, 316, 'catalog/bags/tondo_mini/tondo_mini_burgundy/tondo_mini_burgundy_v2_ar-05.jpg', 4),
(16384, 316, 'catalog/bags/tondo_mini/tondo_mini_burgundy/tondo_mini_burgundy_v2_ar-04.jpg', 3),
(16383, 316, 'catalog/bags/tondo_mini/tondo_mini_burgundy/tondo_mini_burgundy_v2_ar-03.jpg', 2),
(17187, 322, 'catalog/bags/tondo_mini/tondo_mini_powder/tondo_mini_powder_v2_ar-05.jpg', 4),
(17186, 322, 'catalog/bags/tondo_mini/tondo_mini_powder/tondo_mini_powder_v2_ar-04.jpg', 3),
(17185, 322, 'catalog/bags/tondo_mini/tondo_mini_powder/tondo_mini_powder_v2_ar-03.jpg', 2),
(15839, 320, 'catalog/bags/tondo_mini/tondo_mini_white_v2/tondo_mini_white_v2_ar-05.jpg', 4),
(15838, 320, 'catalog/bags/tondo_mini/tondo_mini_white_v2/tondo_mini_white_v2_ar-04.jpg', 3),
(15854, 323, 'catalog/bags/tondo_mini/tondo_mini_white_pink_v2/tondo_mini_white_pink_v2_ar-05.jpg', 4),
(15853, 323, 'catalog/bags/tondo_mini/tondo_mini_white_pink_v2/tondo_mini_white_pink_v2_ar-04.jpg', 3),
(15852, 323, 'catalog/bags/tondo_mini/tondo_mini_white_pink_v2/tondo_mini_white_pink_v2_ar-03.jpg', 2),
(15820, 317, 'catalog/bags/tondo_mini/tondo_mini_coriandr/tondo_mini_coriandr_ar-02.jpg', 5),
(15819, 317, 'catalog/bags/tondo_mini/tondo_mini_coriandr/tondo_mini_coriandr_ar-05.jpg', 4),
(15818, 317, 'catalog/bags/tondo_mini/tondo_mini_coriandr/tondo_mini_coriandr_ar-04.jpg', 3),
(15817, 317, 'catalog/bags/tondo_mini/tondo_mini_coriandr/tondo_mini_coriandr_ar-03.jpg', 2),
(16521, 318, 'catalog/bags/tondo_mini/tondo_mini_khaki_v2/tondo_mini_khaki_v2_ar-02.jpg', 5),
(16520, 318, 'catalog/bags/tondo_mini/tondo_mini_khaki_v2/tondo_mini_khaki_v2_ar-05.jpg', 4),
(16519, 318, 'catalog/bags/tondo_mini/tondo_mini_khaki_v2/tondo_mini_khaki_v2_ar-04.jpg', 3),
(16518, 318, 'catalog/bags/tondo_mini/tondo_mini_khaki_v2/tondo_mini_khaki_v2_ar-03.jpg', 2),
(16526, 319, 'catalog/bags/tondo_mini/tondo_mini_marine/tondo_mini_marine_ar-02.jpg', 5),
(16525, 319, 'catalog/bags/tondo_mini/tondo_mini_marine/tondo_mini_marine_ar-05.jpg', 4),
(16524, 319, 'catalog/bags/tondo_mini/tondo_mini_marine/tondo_mini_marine_ar-04.jpg', 3),
(16523, 319, 'catalog/bags/tondo_mini/tondo_mini_marine/tondo_mini_marine_ar-03.jpg', 2),
(15836, 320, 'catalog/bags/tondo_mini/tondo_mini_white_v2/tondo_mini_white_v2_ar-02.jpg', 1),
(15837, 320, 'catalog/bags/tondo_mini/tondo_mini_white_v2/tondo_mini_white_v2_ar-03.jpg', 2),
(15697, 408, 'catalog/bags/siera/siera_red_ar-03.jpg', 0),
(15696, 408, 'catalog/bags/siera/siera_red_ar-04.jpg', 0),
(17017, 411, 'catalog/bags/terno/terno-black-menthol/terno_black_menthol_ar-02.jpg', 4),
(17016, 411, 'catalog/bags/terno/terno-black-menthol/terno_black_menthol_ar-04.jpg', 3),
(17021, 412, 'catalog/bags/terno/terno-black-lightblue/terno_black_lightblue_ar-02.jpg', 4),
(17020, 412, 'catalog/bags/terno/terno-black-lightblue/terno_black_lightblue_ar-04.jpg', 3),
(17019, 412, 'catalog/bags/terno/terno-black-lightblue/terno_black_lightblue_ar-03.jpg', 2),
(17025, 413, 'catalog/bags/terno/terno-black-menthol/terno_black_menthol_ar-02.jpg', 4),
(17024, 413, 'catalog/bags/terno/terno-black-menthol/terno_black_menthol_ar-04.jpg', 3),
(17023, 413, 'catalog/bags/terno/terno-black-menthol/terno_black_menthol_ar-03.jpg', 2),
(17029, 414, 'catalog/bags/terno/terno-black-red/terno_black_red_ar-02.jpg', 4),
(17028, 414, 'catalog/bags/terno/terno-black-red/terno_black_red_ar-04.jpg', 3),
(17033, 415, 'catalog/bags/terno/terno-black-red/terno_black_red_ar-02.jpg', 4),
(17032, 415, 'catalog/bags/terno/terno-black-red/terno_black_red_ar-04.jpg', 3),
(15680, 402, 'catalog/bags/sevilla/sevilla_ocean/sevilla_ocean_ar-02.jpg', 1),
(16981, 417, 'catalog/bags/roza/roza_bb/z_rosa_black_blue_ar-02.jpg', 4),
(16980, 417, 'catalog/bags/roza/roza_bb/z_rosa_black_blue_ar-03.jpg', 3),
(16979, 417, 'catalog/bags/roza/roza_bb/z_rosa_black_blue_ar-04.jpg', 2),
(16985, 418, 'catalog/bags/roza/roza_br/z_rosa_black_red_ar-02.jpg', 4),
(16984, 418, 'catalog/bags/roza/roza_br/z_rosa_black_red_ar-03.jpg', 3),
(16983, 418, 'catalog/bags/roza/roza_br/z_rosa_black_red_ar-04.jpg', 2),
(17409, 419, 'catalog/bags/adelle/adelle_black_red_ar-06.jpg', 5),
(17408, 419, 'catalog/bags/adelle/adelle_black_red_ar-05.jpg', 4),
(17407, 419, 'catalog/bags/adelle/adelle_black_red_ar-04.jpg', 3),
(17406, 419, 'catalog/bags/adelle/adelle_black_red_ar-03.jpg', 2),
(17405, 419, 'catalog/bags/adelle/adelle_black_red_ar-02.jpg', 1),
(15424, 406, 'catalog/bags/bordo/bordo_black_red/bordo_black_red_ar-04.jpg', 3),
(16276, 409, 'catalog/bags/modena/modena_black_white/fidelitt-square-black-white-2.jpg', 1),
(16277, 409, 'catalog/bags/modena/modena_black_white/fidelitt-square-black-white-3.jpg', 2),
(16284, 410, 'catalog/bags/modena/modena_black_red/modena_black_red-04.jpg', 3),
(16283, 410, 'catalog/bags/modena/modena_black_red/fidelitti-black-square-3.jpg', 2),
(16282, 410, 'catalog/bags/modena/modena_black_red/fidelitti-black-square-2.jpg', 1),
(16275, 428, 'catalog/bags/modena/modena_black_blue/modena_black_blue-04-600x806.jpg', 3),
(16274, 428, 'catalog/bags/modena/modena_black_blue/black-square-3.jpg', 2),
(16273, 428, 'catalog/bags/modena/modena_black_blue/black-square-2.jpg', 1),
(16289, 416, 'catalog/bags/roza/roza_red/fidelitti_red_clutch_2-600x806.jpg', 5),
(16288, 416, 'catalog/bags/roza/roza_red/fidelitti_red_clutch_5.jpg', 4),
(16287, 416, 'catalog/bags/roza/roza_red/fidelitti_red_clutch_4.jpg', 3),
(16805, 429, 'catalog/bags/zaino/zaino_raspberry_v2/zaino_raspberry_v2_ar-05-1.jpg', 4),
(16804, 429, 'catalog/bags/zaino/zaino_raspberry_v2/zaino_raspberry_v2_ar-04-1.jpg', 3),
(16803, 429, 'catalog/bags/zaino/zaino_raspberry_v2/zaino_raspberry_v2_ar-03-1-600x806.jpg', 2),
(17223, 430, 'catalog/bags/zaino/zaino_violet_v2/zaino_fuchsia_v2_ar-02-1.jpg', 5),
(17222, 430, 'catalog/bags/zaino/zaino_violet_v2/zaino_fuchsia_v2_ar-05-1.jpg', 4),
(17221, 430, 'catalog/bags/zaino/zaino_violet_v2/zaino_fuchsia_v2_ar-04-1.jpg', 3),
(17228, 431, 'catalog/bags/zaino/zaino_blue_v2/zaino_blue_v2_ar-02-1.jpg', 5),
(17227, 431, 'catalog/bags/zaino/zaino_blue_v2/zaino_blue_v2_ar-05-1.jpg', 4),
(15991, 432, 'catalog/bags/tondo_mini/tondo_mini_raspberry/tondo_mini_raspberries_v2_ar-02-1.jpg', 5),
(15989, 432, 'catalog/bags/tondo_mini/tondo_mini_raspberry/tondo_mini_raspberries_v2_ar-04-1.jpg', 3),
(15990, 432, 'catalog/bags/tondo_mini/tondo_mini_raspberry/tondo_mini_raspberries_v2_ar-05-1.jpg', 4),
(15986, 433, 'catalog/bags/tondo_mini/tondo_mini_violet_v2/tondo_mini_fuchsia_v2_ar-02-1.jpg', 5),
(15985, 433, 'catalog/bags/tondo_mini/tondo_mini_violet_v2/tondo_mini_fuchsia_v2_ar-05-1-600x806.jpg', 4),
(15984, 433, 'catalog/bags/tondo_mini/tondo_mini_violet_v2/tondo_mini_fuchsia_v2_ar-04-1.jpg', 3),
(15983, 433, 'catalog/bags/tondo_mini/tondo_mini_violet_v2/tondo_mini_fuchsia_v2_ar-03-1.jpg', 2),
(15970, 434, 'catalog/bags/tondo_mini/tondo_mini_blue_v2/tondo_mini_blue_v2_ar-05-1-600x806.jpg', 4),
(15969, 434, 'catalog/bags/tondo_mini/tondo_mini_blue_v2/tondo_mini_blue_v2_ar-04-1.jpg', 3),
(15968, 434, 'catalog/bags/tondo_mini/tondo_mini_blue_v2/tondo_mini_blue_v2_ar-03-1.jpg', 2),
(17248, 435, 'catalog/bags/salerno/salerno_black_v2/zaino_mini_lavender_v2_ar-05(1).jpg', 5),
(17245, 435, 'catalog/bags/salerno/salerno_black_v2/zaino_mini_lavender_v2_ar-03(1).jpg', 2),
(17246, 435, 'catalog/bags/salerno/salerno_black_v2/zaino_mini_lavender_v2_ar-04.jpg', 3),
(17244, 435, 'catalog/bags/zaino_mini/zaino_mini_lavander/model_zaino_mini_lavender_a-06.jpg', 1),
(17037, 436, 'catalog/bags/tondo/tondo_blue_sky/tondo_skyblue_v2_ar-02.jpg', 4),
(17036, 436, 'catalog/bags/tondo/tondo_blue_sky/tondo_skyblue_v2_ar-04.jpg', 3),
(16963, 437, 'catalog/bags/marbella/marbella_lavander/marbella_lavender_v2_ar-02.jpg', 7),
(16962, 437, 'catalog/bags/marbella/marbella_lavander/marbella_lavender_v2_ar-07.jpg', 6),
(16970, 438, 'catalog/bags/marbella/marbella_powder/marbella_powder_v2_ar-02.jpg', 7),
(16969, 438, 'catalog/bags/marbella/marbella_powder/marbella_powder_v2_ar-07.jpg', 6),
(16849, 439, 'catalog/bags/zaino_mini/zaino_mini_kometa_gold/zaino_mini_comet_gold_v2_ar-04.jpg', 3),
(16850, 439, 'catalog/bags/zaino_mini/zaino_mini_kometa_gold/zaino_mini_comet_gold_v2_ar-05.jpg', 4),
(15640, 394, 'catalog/bags/zaino_mini/salernomini/salerno_mini_red_v2_ar-02.jpg', 1),
(16286, 416, 'catalog/bags/roza/roza_red/fidelitti_red_clutch_3-600x806.jpg', 2),
(15674, 399, 'catalog/bags/sevilla/sevilla_grey/sevilla_shark_ar-02.jpg', 5),
(15598, 383, 'catalog/bags/salerno/salerno_black_v2/model_salerno_a-06.jpg', 4),
(15592, 382, 'catalog/bags/salerno/salerno_black_violet/salerno_black_violet_ar-03.jpg', 2),
(15635, 392, 'catalog/bags/salerno_mini/salerno_mini_grey/salerno_mini_gray_ar-02.jpg', 1),
(15630, 391, 'catalog/bags/salerno_mini/salerno_mini_marine/salerno_mini_marine_v2_ar-02.jpg', 1),
(15645, 395, 'catalog/bags/salerno_mini/salerno_mini_lilac/salerno_mini_blackberry_ar-02.jpg', 1),
(15583, 380, 'catalog/bags/salerno/salerno_lilac/salerno_blackberry_ar-02.jpg', 1),
(15625, 390, 'catalog/bags/salerno_mini/salerno_mini_denim/salerno_mini_denim_ar-02.jpg', 0),
(15575, 378, 'catalog/bags/salerno/salerno_denim/salerno_denim_ar-02.jpg', 1),
(16323, 389, 'catalog/bags/salerno_mini/salerno_mini_ocean/salerno_mini_ocean_v2_ar-03.jpg', 2),
(16476, 377, 'catalog/bags/salerno/salernooceanv2/salerno_ocean_v2_ar-03.jpg', 2),
(15650, 396, 'catalog/bags/salerno_mini/salerno_mini_black/salerno_mini_black_black_ar-02.jpg', 0),
(15587, 381, 'catalog/bags/salerno/salerno_black_red/salerno_black_red_br-02.jpg', 1),
(15591, 382, 'catalog/bags/salerno/salerno_black_violet/salerno_black_violet_ar-02.jpg', 1),
(17315, 424, 'catalog/bags/zaino/zaino_white_pink/zaino_white_pink_t_v2_br-02.jpg', 1),
(17247, 435, 'catalog/bags/salerno/salerno_black_v2/zaino_mini_lavender_v2_ar-06(1).jpg', 4),
(17063, 345, 'catalog/bags/zaino/zaino_lavender_v2/zaino_lavender_v2_ar-02.jpg', 1),
(16213, 367, 'catalog/bags/zaino_mini/zaino_mini_menthol_v2/zaino_mini_mint_ar-03.jpg', 2),
(16212, 367, 'catalog/bags/zaino_mini/zaino_mini_menthol_v2/zaino_mini_mint_ar-02.jpg', 1),
(17053, 343, 'catalog/bags/zaino/zaino_menthol_v2/zaino_mint_v2_ar-02.jpg', 1),
(17226, 431, 'catalog/bags/zaino/zaino_blue_v2/zaino_blue_v2_ar-04-1-600x806.jpg', 3),
(17225, 431, 'catalog/bags/zaino/zaino_blue_v2/zaino_blue_v2_ar-03-1.jpg', 2),
(17068, 347, 'catalog/bags/zaino/zaino_azure_v2/zaino_blue_v2_ar-02.jpg', 1),
(17269, 368, 'catalog/bags/zaino_mini/zaino_mini_grey/zaino_mini_gray_v2_ar-05.jpg', 4),
(16712, 348, 'catalog/bags/zaino/zaino_grey_brunto_v2/zaino_gray_v2_ar-02.jpg', 1),
(16718, 349, 'catalog/bags/zaino/zaino_pale_grey_v2/zaino_gray_blue_v2_ar-03.jpg', 2),
(16753, 351, 'catalog/bags/zaino/zaino_graphit/model_zaino_a-03.jpg', 1),
(16697, 421, 'catalog/bags/zaino/zaino_yellow_v2/zaino_yellow_v2_ar-02.jpg', 1),
(16802, 429, 'catalog/bags/zaino/zaino_raspberry_v2/zaino_raspberry_v2_ar-02-1-600x806.jpg', 1),
(17220, 430, 'catalog/bags/zaino/zaino_violet_v2/zaino_fuchsia_v2_ar-03-1.jpg', 2),
(17219, 430, 'catalog/bags/zaino/zaino_violet_v2/zaino_fuchsia_v2_ar-02-1.jpg', 1),
(17255, 422, 'catalog/bags/zaino_mini/zaino_mini_kometa/zaino_mini_comet_nickel_v2_ar-02.jpg', 1),
(17290, 373, 'catalog/bags/zaino_mini/zaino_mini_amaranto/zaino_mini_red_ar-03.jpg', 2),
(17289, 373, 'catalog/bags/zaino_mini/zaino6053/model_zaino_mini_red_a-05.jpg', 1),
(16744, 355, 'catalog/bags/zaino/zainogarnet/model_zaino_a-06.jpg', 1),
(17304, 354, 'catalog/bags/zaino/zaino_red_ante/model_zaino_a-08.jpg', 1),
(16735, 353, 'catalog/bags/zaino/zaino_bordo_v2/zaino_bordo_ar-02.jpg', 1),
(17329, 344, 'catalog/bags/zaino_mini/zainominigreensf/zaino_mini_green_sf_v2_ar-05.jpg', 4),
(17215, 374, 'catalog/bags/zaino_mini/zaino_mini_marine/zaino_mini_marine_v2_ar-04.jpg', 3),
(17278, 371, 'catalog/bags/zaino_mini/zaino_mini_burgundy/zaino_mini_burgundy_ar-02.jpg', 1),
(17294, 352, 'catalog/bags/zaino/zaino_burgundy_v2/model_zaino_burgundy_a-14.jpg', 1),
(16762, 359, 'catalog/bags/zaino/zaino_indigo/model_zaino_a-05.jpg', 1),
(16646, 369, 'catalog/bags/zaino_mini/zaino_mini_ocean/model_zaino_mini_ocean_a-07.jpg', 1),
(17107, 357, 'catalog/bags/zaino/zaino_ocean/zaino_ocean_v2_ar-04.jpg', 3),
(16749, 356, 'catalog/bags/zaino/zaino_space_v2/zaino_cosmos_ar-02.jpg', 1),
(16722, 350, 'catalog/bags/zaino/zaino_graphit/zaino_graphite_v2_ar-02.jpg', 1),
(17285, 372, 'catalog/bags/zaino_mini/zainominiblackv2/zaino_mini_black_v2_ar-04.jpg', 3),
(17284, 372, 'catalog/bags/zaino_mini/zainominiblackv2/zaino_mini_black_v2_ar-03.jpg', 2),
(16780, 363, 'catalog/bags/zaino/zaino_black/zaino_black_brunto_ar-02.jpg', 1),
(16788, 365, 'catalog/bags/zaino/zaino_black_eco/zaino_black_eco_br-02.jpg', 1),
(15840, 320, 'catalog/bags/tondo_mini/tondo_mini_white_v2/tondo_mini_white_v2_ar-02.jpg', 5),
(17038, 423, 'catalog/bags/tondo_mini/tondo_mini_ivory/tondo_mini_white_t_v2_ar-02.jpg', 1),
(15851, 323, 'catalog/bags/tondo_mini/tondo_mini_white_pink_v2/tondo_mini_white_pink_v2_ar-02.jpg', 1),
(17184, 322, 'catalog/bags/tondo_mini/tondo_mini_powder/tondo_mini_powder_v2_ar-02.jpg', 1),
(15856, 324, 'catalog/bags/tondo_mini/tondo_mini_menthol_v2/tondo_mini_mint_v2_ar-02.jpg', 1),
(15747, 297, 'catalog/bags/tondo/tondo_mint_v2/tondo_mint_v2_ar-02-2.jpg', 1),
(15972, 425, 'catalog/bags/tondo_mini/tondo_mini_skyblue/tondo_mini_skyblue_v2_ar-02.jpg', 1),
(17035, 436, 'catalog/bags/tondo/tondo_blue_sky/tondo_skyblue_v2_ar-03.jpg', 2),
(17034, 436, 'catalog/bags/tondo/tondo_blue_sky/tondo_skyblue_v2_ar-02.jpg', 1),
(15971, 434, 'catalog/bags/tondo_mini/tondo_mini_blue_v2/tondo_mini_blue_v2_ar-02-1.jpg', 5),
(15967, 434, 'catalog/bags/tondo_mini/tondo_mini_blue_v2/tondo_mini_blue_v2_ar-02-1.jpg', 1),
(17043, 325, 'catalog/bags/tondo_mini/tondo_mini_azure/tondo_mini_lightblue_ar-02.jpg', 1),
(17048, 326, 'catalog/bags/tondo_mini/tondo_mini_deep_blue/tondo_mini_mint_ar-02.jpg', 1),
(16533, 310, 'catalog/bags/tondo_mini/tondo_mini_grey/model_tondo_mini_a-06.jpg', 1),
(16672, 311, 'catalog/bags/tondo_mini/tondo_mini_zinco/model_tondo_mini_zola_a-06.jpg', 1),
(15896, 330, 'catalog/bags/tondo_mini/tondo_mini_yellow_v2/tondo_mini_sierra_v2_ar-02.jpg', 1),
(16507, 329, 'catalog/bags/tondo_mini/tondo_mini_caramel/model_tondo_mini_a-04.jpg', 1),
(15988, 432, 'catalog/bags/tondo_mini/tondo_mini_raspberry/tondo_mini_raspberries_v2_ar-03-1.jpg', 2),
(15987, 432, 'catalog/bags/tondo_mini/tondo_mini_raspberry/tondo_mini_raspberries_v2_ar-02-1.jpg', 1),
(15982, 433, 'catalog/bags/tondo_mini/tondo_mini_violet_v2/tondo_mini_fuchsia_v2_ar-02-1.jpg', 1),
(15801, 314, 'catalog/bags/tondo_mini/tondo_mini_amaranto/tondo_mini_amaranto_ar-02.jpg', 1),
(15766, 427, 'catalog/bags/tondo_mini/tondo_mini_scarlet/tondo_mini_red_t_v2_ar-02.jpg', 1),
(16502, 312, 'catalog/bags/tondo_mini/tondo_mini_red_v2/tondo_mini_red_v2_ar-03.jpg', 2),
(15723, 303, 'catalog/bags/tondo/tondo_amaranto/tondo_amaranto_ar-02.jpg', 1),
(15791, 313, 'catalog/bags/tondo_mini/tondo_mini_dark_red_ante/tondo_mini_red_ante_ar-02.jpg', 1),
(15806, 315, 'catalog/bags/tondo_mini/tondo_mini_bordo_v2/tondo_mini_bordo_v2_ar-02.jpg', 1),
(16435, 304, 'catalog/bags/tondo/tondo_bordo/tondo_bordo_v2_ar-02.jpg', 1),
(15756, 426, 'catalog/bags/tondo_mini/tondo_mini_green/tondo_mini_green_t_v2_ar-02-600x806.jpg', 1),
(16522, 319, 'catalog/bags/tondo_mini/tondo_mini_marine/model_tondo_mini_a-09.jpg', 1),
(15739, 307, 'catalog/bags/tondo/tondo_marine/tondo_marine_ar-02.jpg', 1),
(16517, 318, 'catalog/bags/tondo_mini/tondo_mini_khaki_v2/model_tondo_mini_a-08.jpg', 1),
(15816, 317, 'catalog/bags/tondo_mini/tondo_mini_coriandr/tondo_mini_coriandr_ar-02.jpg', 1),
(16382, 316, 'catalog/bags/tondo_mini/tondo_mini_burgundy/tondo_mini_burgundy_v2_ar-02.jpg', 1),
(15731, 305, 'catalog/bags/tondo/tondo_burgundy/tondo_burgundy_ar-02.jpg', 1),
(16513, 328, 'catalog/bags/tondo_mini/tondominiblackberryv2/tondo_mini_blackberry_v2_ar-03.jpg', 2),
(16514, 328, 'catalog/bags/tondo_mini/tondominiblackberryv2/tondo_mini_blackberry_v2_ar-04.jpg', 3),
(15901, 331, 'catalog/bags/tondo_mini/tondo_mini_denim_v2/tondo_mini_denim_v2_ar-02.jpg', 1),
(15911, 332, 'catalog/bags/tondo_mini/tondo_mini_ocean/tondo_mini_ocean_ar-02.jpg', 1),
(16527, 333, 'catalog/bags/tondo_mini/tondo_mini_pony/model_tondo_mini_a-13.jpg', 1),
(16538, 334, 'catalog/bags/tondo_mini/tondo_mini_black/model_tondo_mini_a-12.jpg', 1),
(15942, 337, 'catalog/bags/tondo_mini/tondo_mini_black_ante/tondo_mini_black_ar-02.jpg', 1),
(15927, 335, 'catalog/bags/tondo_mini/tondo_mini_black_blue/tondo_mini_black_blue_ar-02.jpg', 1),
(15743, 308, 'catalog/bags/tondo/tondo_black/tondo_black_ar-02.jpg', 1),
(15744, 308, 'catalog/bags/tondo/tondo_black/tondo_black_ar-03.jpg', 2),
(15422, 406, 'catalog/bags/bordo/bordo_black_red/bordo_black_red_ar-02.jpg', 1),
(15427, 407, 'catalog/bags/bordo/bordo_black_blue/bordo_black_blue_ar-02.jpg', 1),
(16960, 437, 'catalog/bags/marbella/marbella_lavander/marbella_lavender_v2_ar-05.jpg', 4),
(16968, 438, 'catalog/bags/marbella/marbella_powder/marbella_powder_v2_ar-06.jpg', 5),
(16967, 438, 'catalog/bags/marbella/marbella_powder/marbella_powder_v2_ar-05.jpg', 4),
(17243, 440, 'catalog/bags/zaino_mini/zainominikometanikel/zaino_mini_comet_silver_v2_ar-02.jpg', 5),
(17240, 440, 'catalog/bags/zaino_mini/zainominikometanikel/zaino_mini_comet_silver_v2_ar-03.jpg', 2),
(17241, 440, 'catalog/bags/zaino_mini/zainominikometanikel/zaino_mini_comet_silver_v2_ar-04.jpg', 3),
(16711, 441, 'catalog/bags/zaino/zainolightblue/zaino_lightblue_t_v2_ar-02.jpg', 5),
(16709, 441, 'catalog/bags/zaino/zainolightblue/zaino_lightblue_t_v2_ar-04.jpg', 3),
(16710, 441, 'catalog/bags/zaino/zainolightblue/zaino_lightblue_t_v2_ar-05.jpg', 4),
(17102, 364, 'catalog/bags/zaino/zaino_black_ante/z_zaino_black_ar-03.jpg', 2),
(17399, 442, 'catalog/bags/cylindro/cylindromint/cylindro_mint_v2_ar-02.jpg', 6),
(17398, 442, 'catalog/bags/cylindro/cylindromint/cylindro_mint_v2_ar-06.jpg', 5),
(17397, 442, 'catalog/bags/cylindro/cylindromint/cylindro_mint_v2_ar-05.jpg', 4),
(17387, 443, 'catalog/bags/cylindro/cylindrowhite/cylindro_white_v2_ar-02.jpg', 6),
(17386, 443, 'catalog/bags/cylindro/cylindrowhite/cylindro_white_v2_ar-06.jpg', 5),
(17385, 443, 'catalog/bags/cylindro/cylindrowhite/cylindro_white_v2_ar-05.jpg', 4),
(17384, 443, 'catalog/bags/cylindro/cylindrowhite/cylindro_white_v2_ar-04.jpg', 3),
(15644, 394, 'catalog/bags/zaino_mini/salernomini/salerno_mini_red_v2_ar-02.jpg', 5),
(16966, 438, 'catalog/bags/marbella/marbella_powder/marbella_powder_v2_ar-04000.jpg', 3),
(15579, 379, 'catalog/bags/salerno/salerno_grey_v2/salerno_gray_v2_ar-02.jpg', 1),
(15670, 399, 'catalog/bags/sevilla/sevilla_grey/sevilla_shark_ar-02.jpg', 1),
(16995, 376, 'catalog/bags/salerno/salerno_amaranto/salerno_red_ar-03.jpg', 2),
(16994, 376, 'catalog/bags/salerno/salerno_amaranto/salerno_red_ar-02b.jpg', 1),
(15685, 403, 'catalog/bags/sevilla/sevilla_marine/sevilla_marine_ar-02.jpg', 1),
(16931, 458, 'catalog/bags/cylindro/cylindropradohoney/cylindro_prado_honey_v2_ar-02.jpg', 6),
(17209, 375, 'catalog/bags/zaino_mini/zaino_mini_lilac/zaino_mini_blackberry_v2_ar-04.jpg', 3),
(16806, 429, 'catalog/bags/zaino/zaino_raspberry_v2/zaino_raspberry_v2_ar-02-1-600x806.jpg', 5),
(15660, 398, 'catalog/bags/sevilla/sevilla_lilac/sevilla_blackberry_ar-02.jpg', 1),
(15675, 401, 'catalog/bags/sevilla/sevilla_denim/sevilla_denim_ar-02.jpg', 1),
(15597, 383, 'catalog/bags/salerno/salerno_black_v2/salerno_black_black_ar-04.jpg', 3),
(15595, 383, 'catalog/bags/salerno/salerno_black_v2/salerno_black_black_ar-02.jpg', 1),
(15691, 404, 'catalog/bags/sevilla/sevilla_black/sevilla_black_red_ar-03.jpg', 2),
(15690, 404, 'catalog/bags/sevilla/sevilla_black/sevilla_black_red_ar-02.jpg', 1),
(15952, 340, 'catalog/bags/tondo_mini/tondo_mini_silver/tondo_mini_silver_ar-02.jpg', 1),
(16285, 416, 'catalog/bags/roza/roza_red/fidelitti_red_clutch_2-600x806.jpg', 1),
(17022, 413, 'catalog/bags/terno/terno-black-menthol/terno_black_menthol_ar-02.jpg', 1),
(17015, 411, 'catalog/bags/terno/terno-black-menthol/terno_black_menthol_ar-03.jpg', 2),
(17014, 411, 'catalog/bags/terno/terno-black-menthol/terno_black_menthol_ar-02.jpg', 1),
(17027, 414, 'catalog/bags/terno/terno-black-red/terno_black_red_ar-03.jpg', 2),
(17026, 414, 'catalog/bags/terno/terno-black-red/terno_black_red_ar-02.jpg', 1),
(17031, 415, 'catalog/bags/terno/terno-black-red/terno_black_red_ar-03.jpg', 2),
(17030, 415, 'catalog/bags/terno/terno-black-red/terno_black_red_ar-02.jpg', 1),
(16978, 417, 'catalog/bags/roza/roza_bb/z_rosa_black_blue_ar-02.jpg', 1),
(16982, 418, 'catalog/bags/roza/roza_br/z_rosa_black_red_ar-02.jpg', 1),
(17110, 362, 'catalog/bags/zaino/zaino_blue_pony/model_zaino_a-12.jpg', 1),
(16896, 444, 'catalog/bags/zaino_mini/cylindro/cylindropowder/cylindro_powder_v2_ar-02.jpg', 6),
(16895, 444, 'catalog/bags/zaino_mini/cylindro/cylindropowder/cylindro_powder_v2_ar-06.jpg', 5),
(16894, 444, 'catalog/bags/zaino_mini/cylindro/cylindropowder/cylindro_powder_v2_ar-05.jpg', 4),
(16893, 444, 'catalog/bags/zaino_mini/cylindro/cylindropowder/cylindro_powder_v2_ar-04.jpg', 3),
(16892, 444, 'catalog/bags/zaino_mini/cylindro/cylindropowder/cylindro_powder_v2_ar-03.jpg', 2),
(16891, 444, 'catalog/bags/zaino_mini/cylindro/cylindropowder/cylindro_powder_v2_ar-02.jpg', 1),
(17393, 445, 'catalog/bags/zaino_mini/cylindro/cylindrolavenderv2/cylindro_lavender_v2_ar-02.jpg', 6),
(17392, 445, 'catalog/bags/zaino_mini/cylindro/cylindrolavenderv2/cylindro_lavender_v2_ar-06.jpg', 5),
(17391, 445, 'catalog/bags/zaino_mini/cylindro/cylindrolavenderv2/cylindro_lavender_v2_ar-05.jpg', 4),
(17390, 445, 'catalog/bags/zaino_mini/cylindro/cylindrolavenderv2/cylindro_lavender_v2_ar-04.jpg', 3),
(17389, 445, 'catalog/bags/zaino_mini/cylindro/cylindrolavenderv2/cylindro_lavender_v2_ar-03.jpg', 2),
(17388, 445, 'catalog/bags/zaino_mini/cylindro/cylindrolavenderv2/cylindro_lavender_v2_ar-02.jpg', 1),
(15765, 446, 'catalog/bags/tondo_mini/tondominilavenderv2/tondo_mini_lavender_v2_ar-02.jpg', 5),
(15764, 446, 'catalog/bags/tondo_mini/tondominilavenderv2/tondo_mini_lavender_v2_ar-05.jpg', 4),
(15763, 446, 'catalog/bags/tondo_mini/tondominilavenderv2/tondo_mini_lavender_v2_ar-04.jpg', 3),
(15762, 446, 'catalog/bags/tondo_mini/tondominilavenderv2/tondo_mini_lavender_v2_ar-03.jpg', 2);
INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(15761, 446, 'catalog/bags/tondo_mini/tondominilavenderv2/tondo_mini_lavender_v2_ar-02.jpg', 1),
(17018, 412, 'catalog/bags/terno/terno-black-lightblue/terno_black_lightblue_ar-02.jpg', 1),
(16965, 438, 'catalog/bags/marbella/marbella_powder/marbella_powder_v2_ar-03.jpg', 2),
(16961, 437, 'catalog/bags/marbella/marbella_lavander/marbella_lavender_v2_ar-06.jpg', 5),
(16959, 437, 'catalog/bags/marbella/marbella_lavander/marbella_lavender_v2_ar-04oo.jpg', 3),
(16964, 438, 'catalog/bags/marbella/marbella_powder/marbella_powder_v2_ar-02.jpg', 1),
(17013, 447, 'catalog/bags/salerno_mini/salernominimintv2/salerno_mini_mint_v2_ar-02.jpg', 5),
(17012, 447, 'catalog/bags/salerno_mini/salernominimintv2/salerno_mini_mint_v2_ar-05.jpg', 4),
(17011, 447, 'catalog/bags/salerno_mini/salernominimintv2/salerno_mini_mint_v2_ar-04.jpg', 3),
(17010, 447, 'catalog/bags/salerno_mini/salernominimintv2/salerno_mini_mint_v2_ar-03.jpg', 2),
(17009, 447, 'catalog/bags/salerno_mini/salernominimintv2/salerno_mini_mint_v2_ar-02.jpg', 1),
(17008, 448, 'catalog/bags/salerno_mini/salernominiwhitev2/salerno_mini_white_v2_ar-02.jpg', 5),
(17007, 448, 'catalog/bags/salerno_mini/salernominiwhitev2/salerno_mini_white_v2_ar-05.jpg', 4),
(17006, 448, 'catalog/bags/salerno_mini/salernominiwhitev2/salerno_mini_white_v2_ar-04.jpg', 3),
(17005, 448, 'catalog/bags/salerno_mini/salernominiwhitev2/salerno_mini_white_v2_ar-03.jpg', 2),
(17004, 448, 'catalog/bags/salerno_mini/salernominiwhitev2/salerno_mini_white_v2_ar-02.jpg', 1),
(16322, 389, 'catalog/bags/salerno_mini/salerno_mini_ocean/salerno_mini_ocean_v2_ar-02.jpg', 1),
(16989, 449, 'catalog/bags/salerno/salernowhitev2/salerno_white_v2_ar-02.jpg', 4),
(16988, 449, 'catalog/bags/salerno/salernowhitev2/salerno_white_v2_ar-04.jpg', 3),
(16987, 449, 'catalog/bags/salerno/salernowhitev2/salerno_white_v2_ar-03.jpg', 2),
(16986, 449, 'catalog/bags/salerno/salernowhitev2/salerno_white_v2_ar-02.jpg', 1),
(16475, 377, 'catalog/bags/salerno/salernooceanv2/salerno_ocean_v2_ar-02.jpg', 1),
(17283, 372, 'catalog/bags/zaino_mini/zaino_mini_black_v2/model_zaino_mini_a-07.jpg', 1),
(16949, 450, 'catalog/bags/marbella/marbellawhitepinksfv2/marbella_white_pink_v2_ar-02.jpg', 7),
(16948, 450, 'catalog/bags/marbella/marbellawhitepinksfv2/marbella_white_pink_v2_ar-07.jpg', 6),
(16947, 450, 'catalog/bags/marbella/marbellawhitepinksfv2/marbella_white_pink_v2_ar-06.jpg', 5),
(16946, 450, 'catalog/bags/marbella/marbellawhitepinksfv2/marbella_white_pink_v2_ar-05.jpg', 4),
(16945, 450, 'catalog/bags/marbella/marbellawhitepinksfv2/marbella_white_pink_v2_ar-04.jpg', 3),
(16944, 450, 'catalog/bags/marbella/marbellawhitepinksfv2/marbella_white_pink_v2_ar-03.jpg', 2),
(16943, 450, 'catalog/bags/marbella/marbellawhitepinksfv2/marbella_white_pink_v2_ar-02.jpg', 1),
(16956, 451, 'catalog/bags/marbella/marbellapradohoneyv2/marbella_prado_honey_v2_ar-02.jpg', 7),
(16955, 451, 'catalog/bags/marbella/marbellapradohoneyv2/marbella_prado_honey_v2_ar-07.jpg', 6),
(16954, 451, 'catalog/bags/marbella/marbellapradohoneyv2/marbella_prado_honey_v2_ar-06.jpg', 5),
(16953, 451, 'catalog/bags/marbella/marbellapradohoneyv2/marbella_prado_honey_v2_ar-05.jpg', 4),
(16952, 451, 'catalog/bags/marbella/marbellapradohoneyv2/marbella_prado_honey_v2_ar-04.jpg', 3),
(16951, 451, 'catalog/bags/marbella/marbellapradohoneyv2/marbella_prado_honey_v2_ar-03.jpg', 2),
(16950, 451, 'catalog/bags/marbella/marbellapradohoneyv2/marbella_prado_honey_v2_ar-02.jpg', 1),
(16993, 452, 'catalog/bags/salerno/salerno_lavander/salerno_lavender_v2_ar-02.jpg', 4),
(16992, 452, 'catalog/bags/salerno/salerno_lavander/salerno_lavender_v2_ar-04.jpg', 3),
(16991, 452, 'catalog/bags/salerno/salerno_lavander/salerno_lavender_v2_ar-03.jpg', 2),
(16990, 452, 'catalog/bags/salerno/salerno_lavander/salerno_lavender_v2_ar-02.jpg', 1),
(17003, 453, 'catalog/bags/salerno_mini/salernominigreensf/salerno_mini_green_sf_v2_ar-02.jpg', 5),
(17002, 453, 'catalog/bags/salerno_mini/salernominigreensf/salerno_mini_green_sf_v2_ar-05.jpg', 4),
(17001, 453, 'catalog/bags/salerno_mini/salernominigreensf/salerno_mini_green_sf_v2_ar-04.jpg', 3),
(17000, 453, 'catalog/bags/salerno_mini/salernominigreensf/salerno_mini_green_sf_v2_ar-03.jpg', 2),
(16999, 453, 'catalog/bags/salerno_mini/salernominigreensf/salerno_mini_green_sf_v2_ar-02.jpg', 1),
(17233, 454, 'catalog/bags/salerno_mini/zainoyellowsavage/zaino_yellow_savage_v2_ar-02.jpg', 5),
(17232, 454, 'catalog/bags/salerno_mini/zainoyellowsavage/zaino_yellow_savage_v2_ar-05.jpg', 4),
(17231, 454, 'catalog/bags/salerno_mini/zainoyellowsavage/zaino_yellow_savage_v2_ar-04.jpg', 3),
(17230, 454, 'catalog/bags/salerno_mini/zainoyellowsavage/zaino_yellow_savage_v2_ar-03.jpg', 2),
(17229, 454, 'catalog/bags/salerno_mini/zainoyellowsavage/zaino_yellow_savage_v2_ar-02.jpg', 1),
(17200, 455, 'catalog/bags/zaino_mini/zainominiwhitetv2/zaino_mini_white_t_v2_ar-02.jpg', 6),
(17199, 455, 'catalog/bags/zaino_mini/zainominiwhitetv2/zaino_mini_white_t_v2_ar-06.jpg', 5),
(17198, 455, 'catalog/bags/zaino_mini/zainominiwhitetv2/zaino_mini_white_t_v2_ar-05.jpg', 4),
(17197, 455, 'catalog/bags/zaino_mini/zainominiwhitetv2/zaino_mini_white_t_v2_ar-04.jpg', 3),
(17196, 455, 'catalog/bags/zaino_mini/zainominiwhitetv2/zaino_mini_white_t_v2_ar-03.jpg', 2),
(17195, 455, 'catalog/bags/zaino_mini/zainominiwhitetv2/zaino_mini_white_t_v2_ar-02.jpg', 1),
(17214, 374, 'catalog/bags/zaino_mini/zaino_mini_marine/zaino_mini_marine_v2_ar-03.jpg', 2),
(17213, 374, 'catalog/bags/zaino_mini/zaino_mini_marine/zaino_mini_marine_v2_ar-02.jpg', 1),
(16977, 456, 'catalog/bags/marbella/marbellagrayv2/marbella_gray_v2_ar-02.jpg', 7),
(16976, 456, 'catalog/bags/marbella/marbellagrayv2/marbella_gray_v2_ar-07.jpg', 6),
(16975, 456, 'catalog/bags/marbella/marbellagrayv2/marbella_gray_v2_ar-06.jpg', 5),
(16974, 456, 'catalog/bags/marbella/marbellagrayv2/marbella_gray_v2_ar-05.jpg', 4),
(16973, 456, 'catalog/bags/marbella/marbellagrayv2/marbella_gray_v2_ar-04.jpg', 3),
(16972, 456, 'catalog/bags/marbella/marbellagrayv2/marbella_gray_v2_ar-03.jpg', 2),
(16971, 456, 'catalog/bags/marbella/marbellagrayv2/marbella_gray_v2_ar-02.jpg', 1),
(17238, 457, 'catalog/bags/zaino/zainopradoarsenicnew/zaino_prado_arsenic_v2_ar-02.jpg', 5),
(17237, 457, 'catalog/bags/zaino/zainopradoarsenicnew/zaino_prado_arsenic_v2_ar-05.jpg', 4),
(17236, 457, 'catalog/bags/zaino/zainopradoarsenicnew/zaino_prado_arsenic_v2_ar-04.jpg', 3),
(17235, 457, 'catalog/bags/zaino/zainopradoarsenicnew/zaino_prado_arsenic_v2_ar-03.jpg', 2),
(17234, 457, 'catalog/bags/zaino/zainopradoarsenicnew/zaino_prado_arsenic_v2_ar-02.jpg', 1),
(16767, 360, 'catalog/bags/zaino/zaino_marine/zaino_marine_v2_ar-03.jpg', 2),
(16766, 360, 'catalog/bags/zaino/zaino_marine/model_zaino_a-16.jpg', 1),
(16958, 437, 'catalog/bags/marbella/marbella_lavander/marbella_lavender_v2_ar-03.jpg', 2),
(16957, 437, 'catalog/bags/marbella/marbella_lavander/marbella_lavender_v2_ar-02.jpg', 1),
(17106, 357, 'catalog/bags/zaino/zaino_ocean/zaino_ocean_v2_ar-03.jpg', 2),
(17105, 357, 'catalog/bags/zaino/zaino_ocean/zaino_ocean_v2_ar-02.jpg', 1),
(16512, 328, 'catalog/bags/tondo_mini/tondo_mini_lilac/model_tondo_mini_a-05.jpg', 1),
(16386, 316, 'catalog/bags/tondo_mini/tondo_mini_burgundy/tondo_mini_burgundy_v2_ar-02.jpg', 5),
(17211, 375, 'catalog/bags/zaino_mini/zaino_mini_lilac/zaino_mini_blackberry_v2_ar-06.jpg', 5),
(17208, 375, 'catalog/bags/zaino_mini/zaino_mini_lilac/zaino_mini_blackberry_v2_ar-03.jpg', 2),
(17207, 375, 'catalog/bags/zaino_mini/zaino_mini_lilac/model_zaino_mini_a-08.jpg', 1),
(17383, 443, 'catalog/bags/cylindro/cylindrowhite/cylindro_white_v2_ar-03.jpg', 2),
(17382, 443, 'catalog/bags/cylindro/cylindrowhite/cylindro_white_v2_ar-02.jpg', 1),
(17396, 442, 'catalog/bags/cylindro/cylindromint/cylindro_mint_v2_ar-04.jpg', 3),
(17395, 442, 'catalog/bags/cylindro/cylindromint/cylindro_mint_v2_ar-03.jpg', 2),
(17394, 442, 'catalog/bags/cylindro/cylindromint/cylindro_mint_v2_ar-02.jpg', 1),
(16708, 441, 'catalog/bags/zaino/zainolightblue/zaino_lightblue_t_v2_ar-03.jpg', 2),
(16707, 441, 'catalog/bags/zaino/zainolightblue/zaino_lightblue_t_v2_ar-02.jpg', 1),
(17103, 364, 'catalog/bags/zaino/zaino_black_ante/zaino_black_t_v2_ar-05c.jpg', 3),
(16851, 439, 'catalog/bags/zaino_mini/zaino_mini_kometa_gold/zaino_mini_comet_gold_v2_ar-02.jpg', 5),
(16847, 439, 'catalog/bags/zaino_mini/zaino_mini_kometa_gold/model_zaino_mini_comet_gold_a-03.jpg', 1),
(16848, 439, 'catalog/bags/zaino_mini/zaino_mini_kometa_gold/zaino_mini_comet_gold_v2_ar-03.jpg', 2),
(17242, 440, 'catalog/bags/zaino_mini/zainominikometanikel/zaino_mini_comet_silver_v2_ar-05.jpg', 4),
(17239, 440, 'catalog/bags/zaino_mini/zainominikometanikel/zaino_mini_comet_silver_v2_ar-02.jpg', 1),
(16772, 361, 'catalog/bags/zaino/zaino_lilac/zaino_blackberry_v2_ar-03.jpg', 2),
(16771, 361, 'catalog/bags/zaino/zaino_lilac/model_zaino_a-17.jpg', 1),
(17267, 368, 'catalog/bags/zaino_mini/zaino_mini_grey/zaino_mini_gray_v2_ar-03.jpg', 2),
(17266, 368, 'catalog/bags/zaino_mini/zaino_mini_grey/zaino_mini_gray_v2_ar-02.jpg', 1),
(16438, 304, 'catalog/bags/tondo/tondo_bordo/tondo_bordo_v2_ar-02.jpg', 4),
(16444, 405, 'catalog/bags/caramente/caramente_black_red_ar-02.jpg', 6),
(17273, 370, 'catalog/bags/zaino_mini/zaino_mini_pony_v2/zaino_mini_pony_v2_ar-03.jpg', 2),
(16930, 458, 'catalog/bags/cylindro/cylindropradohoney/cylindro_prado_honey_v2_ar-06.jpg', 5),
(16929, 458, 'catalog/bags/cylindro/cylindropradohoney/cylindro_prado_honey_v2_ar-05.jpg', 4),
(16928, 458, 'catalog/bags/cylindro/cylindropradohoney/cylindro_prado_honey_v2_ar-04.jpg', 3),
(16927, 458, 'catalog/bags/cylindro/cylindropradohoney/cylindro_prado_honey_v2_ar-03.jpg', 2),
(16926, 458, 'catalog/bags/cylindro/cylindropradohoney/cylindro_prado_honey_v2_ar-02.jpg', 1),
(16717, 349, 'catalog/bags/zaino/zaino_pale_grey_v2/model_zaino_gray_blue_a-02.jpg', 1),
(16650, 369, 'catalog/bags/zaino_mini/zaino_mini_ocean/zaino_mini_ocean_ar-02.jpg', 5),
(16677, 420, 'catalog/bags/zaino/zaino_white_v2/model_zaino_white_a-01.jpg', 1),
(17261, 366, 'catalog/bags/zaino_mini/zaino_mini_v2/zaino_mini_white_v2_ar-03.jpg', 2),
(17260, 366, 'catalog/bags/zaino_mini/zainominiwhitetv2/model_zaino_mini_white_a-01.jpg', 1),
(16671, 341, 'catalog/bags/tondo_mini/tondo_mini_gold/tondo_mini_gold_ar-02.jpg', 5),
(16676, 311, 'catalog/bags/tondo_mini/tondo_mini_zinco/tondo_mini_zinco_ar-02.jpg', 5),
(17224, 431, 'catalog/bags/zaino/zaino_blue_v2/zaino_blue_v2_ar-02-1.jpg', 1),
(16908, 459, 'catalog/bags/cylindro/cylindropradoarsenicv2/cylindro_prado_arsenic_v2_ar-02.jpg', 6),
(16907, 459, 'catalog/bags/cylindro/cylindropradoarsenicv2/cylindro_prado_arsenic_v2_ar-06.jpg', 5),
(16906, 459, 'catalog/bags/cylindro/cylindropradoarsenicv2/cylindro_prado_arsenic_v2_ar-05.jpg', 4),
(16905, 459, 'catalog/bags/cylindro/cylindropradoarsenicv2/cylindro_prado_arsenic_v2_ar-04.jpg', 3),
(16904, 459, 'catalog/bags/cylindro/cylindropradoarsenicv2/cylindro_prado_arsenic_v2_ar-03.jpg', 2),
(16903, 459, 'catalog/bags/cylindro/cylindropradoarsenicv2/cylindro_prado_arsenic_v2_ar-02.jpg', 1),
(17206, 460, 'catalog/bags/zaino_mini/zainominipradopowdert0032/zaino_mini_prado_powder_t_v2_ar-02.jpg', 6),
(17205, 460, 'catalog/bags/zaino_mini/zainominipradopowdert0032/zaino_mini_prado_powder_t_v2_ar-06.jpg', 5),
(17204, 460, 'catalog/bags/zaino_mini/zainominipradopowdert0032/zaino_mini_prado_powder_t_v2_ar-05.jpg', 4),
(17203, 460, 'catalog/bags/zaino_mini/zainominipradopowdert0032/zaino_mini_prado_powder_t_v2_ar-04.jpg', 3),
(17202, 460, 'catalog/bags/zaino_mini/zainominipradopowdert0032/zaino_mini_prado_powder_t_v2_ar-03.jpg', 2),
(17201, 460, 'catalog/bags/zaino_mini/zainominipradopowdert0032/zaino_mini_prado_powder_t_v2_ar-02.jpg', 1),
(17325, 461, 'catalog/bags/zaino_mini/zainominigreensf/zaino_mini_green_sf_v2_ar-02(1).jpg', 6),
(17324, 461, 'catalog/bags/zaino_mini/zainominigreensf/zaino_mini_green_sf_v2_ar-06.jpg', 5),
(17323, 461, 'catalog/bags/zaino_mini/zainominigreensf/zaino_mini_green_sf_v2_ar-05.jpg', 4),
(17322, 461, 'catalog/bags/zaino_mini/zainominigreensf/zaino_mini_green_sf_v2_ar-04.jpg', 3),
(17321, 461, 'catalog/bags/zaino_mini/zainominigreensf/zaino_mini_green_sf_v2_ar-03.jpg', 2),
(17320, 461, 'catalog/bags/zaino_mini/zainominigreensf/zaino_mini_green_sf_v2_ar-02(1).jpg', 1),
(17299, 462, 'catalog/bags/zaino_mini/zainominicometrosev2/zaino_mini_comet_rose_v2_ar-02.jpg', 1),
(17300, 462, 'catalog/bags/zaino_mini/zainominicometrosev2/zaino_mini_comet_rose_v2_ar-03.jpg', 2),
(17301, 462, 'catalog/bags/zaino_mini/zainominicometrosev2/zaino_mini_comet_rose_v2_ar-04.jpg', 3),
(17302, 462, 'catalog/bags/zaino_mini/zainominicometrosev2/zaino_mini_comet_rose_v2_ar-05.jpg', 4),
(17303, 462, 'catalog/bags/zaino_mini/zainominicometrosev2/zaino_mini_comet_rose_v2_ar-02.jpg', 5),
(17308, 354, 'catalog/bags/zaino/zaino_red_ante/zaino_prado_dark_red_sf_v2_ar-02.jpg', 5),
(17327, 344, 'catalog/bags/zaino_mini/zainominigreensf/zaino_mini_green_sf_v2_ar-03.jpg', 2),
(17326, 344, 'catalog/bags/zaino/zaino_green_ante_v2/zaino_green_v2_ar-02.jpg', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_option`
--

CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_option_value`
--

CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  `country_code` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_recurring`
--

CREATE TABLE `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_related`
--

CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_reward`
--

CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_special`
--

CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `country_code` varchar(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_special`
--

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`, `country_code`) VALUES
(3798, 419, 1, 0, '500.0000', '0000-00-00', '0000-00-00', 'en'),
(3796, 442, 1, 0, '1115.0000', '0000-00-00', '0000-00-00', 'ua');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_tab`
--

CREATE TABLE `oc_product_tab` (
  `product_id` int(11) NOT NULL,
  `tab_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text COLLATE utf8_bin NOT NULL,
  `position` tinyint(1) DEFAULT NULL,
  `show_empty` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_category`
--

CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(297, 59),
(297, 61),
(297, 69),
(303, 59),
(303, 61),
(303, 69),
(304, 59),
(304, 61),
(304, 69),
(305, 59),
(305, 61),
(305, 69),
(307, 59),
(307, 61),
(307, 69),
(308, 59),
(308, 61),
(308, 69),
(310, 59),
(310, 60),
(310, 61),
(310, 62),
(310, 64),
(310, 69),
(311, 59),
(311, 60),
(311, 61),
(311, 62),
(311, 64),
(311, 69),
(312, 59),
(312, 60),
(312, 61),
(312, 62),
(312, 64),
(312, 69),
(313, 59),
(313, 60),
(313, 61),
(313, 62),
(313, 64),
(313, 69),
(314, 59),
(314, 60),
(314, 61),
(314, 62),
(314, 64),
(314, 69),
(315, 59),
(315, 60),
(315, 61),
(315, 62),
(315, 64),
(315, 69),
(316, 59),
(316, 60),
(316, 61),
(316, 62),
(316, 64),
(316, 69),
(317, 59),
(317, 60),
(317, 61),
(317, 62),
(317, 64),
(317, 69),
(318, 59),
(318, 60),
(318, 61),
(318, 62),
(318, 64),
(318, 69),
(319, 59),
(319, 60),
(319, 61),
(319, 62),
(319, 64),
(319, 69),
(320, 59),
(320, 60),
(320, 61),
(320, 62),
(320, 64),
(320, 69),
(322, 59),
(322, 60),
(322, 61),
(322, 62),
(322, 64),
(323, 59),
(323, 60),
(323, 61),
(323, 62),
(323, 64),
(323, 69),
(324, 59),
(324, 60),
(324, 61),
(324, 62),
(324, 64),
(324, 69),
(325, 59),
(325, 60),
(325, 61),
(325, 62),
(325, 64),
(325, 69),
(326, 59),
(326, 60),
(326, 61),
(326, 62),
(326, 64),
(326, 69),
(327, 59),
(327, 60),
(327, 61),
(327, 62),
(327, 64),
(327, 69),
(328, 59),
(328, 60),
(328, 61),
(328, 62),
(328, 64),
(328, 69),
(329, 59),
(329, 60),
(329, 61),
(329, 62),
(329, 64),
(329, 69),
(330, 59),
(330, 60),
(330, 61),
(330, 62),
(330, 64),
(330, 69),
(331, 59),
(331, 60),
(331, 61),
(331, 62),
(331, 64),
(331, 69),
(332, 59),
(332, 60),
(332, 61),
(332, 62),
(332, 64),
(332, 69),
(333, 59),
(333, 60),
(333, 61),
(333, 62),
(333, 64),
(333, 69),
(334, 59),
(334, 60),
(334, 61),
(334, 62),
(334, 64),
(334, 69),
(335, 59),
(335, 60),
(335, 61),
(335, 62),
(335, 64),
(335, 69),
(336, 59),
(336, 60),
(336, 61),
(336, 62),
(336, 64),
(336, 69),
(337, 59),
(337, 60),
(337, 61),
(337, 62),
(337, 64),
(337, 69),
(339, 59),
(339, 60),
(339, 61),
(339, 62),
(339, 64),
(339, 69),
(340, 59),
(340, 60),
(340, 61),
(340, 62),
(340, 64),
(340, 69),
(341, 59),
(341, 60),
(341, 61),
(341, 62),
(341, 64),
(341, 69),
(343, 27),
(343, 61),
(343, 69),
(344, 27),
(344, 61),
(344, 69),
(345, 27),
(345, 61),
(345, 69),
(347, 27),
(347, 61),
(347, 69),
(348, 27),
(348, 61),
(348, 69),
(349, 27),
(349, 61),
(349, 69),
(350, 27),
(350, 61),
(350, 69),
(351, 27),
(351, 61),
(351, 69),
(352, 27),
(352, 61),
(352, 69),
(353, 27),
(353, 61),
(353, 69),
(354, 27),
(354, 61),
(354, 69),
(355, 27),
(355, 61),
(355, 69),
(356, 27),
(356, 61),
(356, 69),
(357, 27),
(357, 61),
(357, 69),
(359, 27),
(359, 61),
(359, 69),
(360, 27),
(360, 61),
(360, 69),
(361, 27),
(361, 61),
(361, 69),
(362, 27),
(362, 61),
(362, 69),
(363, 27),
(363, 61),
(363, 69),
(364, 27),
(364, 61),
(364, 69),
(365, 27),
(365, 61),
(365, 69),
(366, 27),
(366, 60),
(366, 61),
(366, 62),
(366, 64),
(366, 69),
(367, 27),
(367, 60),
(367, 61),
(367, 62),
(367, 64),
(367, 69),
(368, 27),
(368, 60),
(368, 61),
(368, 62),
(368, 64),
(368, 69),
(369, 27),
(369, 60),
(369, 61),
(369, 62),
(369, 64),
(369, 69),
(370, 27),
(370, 60),
(370, 61),
(370, 62),
(370, 64),
(370, 69),
(371, 27),
(371, 60),
(371, 61),
(371, 62),
(371, 64),
(371, 69),
(372, 27),
(372, 60),
(372, 61),
(372, 62),
(372, 64),
(372, 69),
(373, 27),
(373, 60),
(373, 61),
(373, 62),
(373, 64),
(373, 69),
(374, 27),
(374, 60),
(374, 61),
(374, 62),
(374, 64),
(374, 69),
(375, 27),
(375, 60),
(375, 61),
(375, 62),
(375, 64),
(375, 69),
(376, 27),
(376, 61),
(376, 69),
(377, 27),
(377, 61),
(377, 69),
(378, 27),
(378, 61),
(378, 69),
(379, 27),
(379, 61),
(379, 69),
(380, 27),
(380, 61),
(380, 69),
(381, 27),
(381, 61),
(381, 69),
(382, 27),
(382, 61),
(382, 69),
(383, 27),
(383, 61),
(383, 69),
(389, 27),
(389, 60),
(389, 61),
(389, 62),
(389, 64),
(389, 69),
(390, 27),
(390, 60),
(390, 61),
(390, 62),
(390, 64),
(390, 69),
(391, 27),
(391, 60),
(391, 61),
(391, 62),
(391, 64),
(391, 69),
(392, 27),
(392, 60),
(392, 61),
(392, 62),
(392, 64),
(392, 69),
(394, 27),
(394, 60),
(394, 61),
(394, 62),
(394, 64),
(394, 69),
(395, 27),
(395, 60),
(395, 61),
(395, 62),
(395, 64),
(395, 69),
(396, 27),
(396, 60),
(396, 61),
(396, 62),
(396, 64),
(396, 69),
(398, 59),
(398, 60),
(398, 61),
(398, 64),
(398, 69),
(399, 59),
(399, 60),
(399, 61),
(399, 64),
(399, 69),
(401, 59),
(401, 60),
(401, 61),
(401, 64),
(401, 69),
(402, 59),
(402, 60),
(402, 61),
(402, 64),
(402, 69),
(403, 59),
(403, 60),
(403, 61),
(403, 64),
(403, 69),
(404, 59),
(404, 60),
(404, 61),
(404, 64),
(404, 69),
(405, 59),
(405, 60),
(405, 61),
(405, 64),
(405, 69),
(405, 91),
(406, 59),
(406, 60),
(406, 61),
(406, 64),
(406, 69),
(406, 91),
(407, 59),
(407, 60),
(407, 61),
(407, 64),
(407, 69),
(407, 91),
(408, 59),
(408, 60),
(408, 61),
(408, 62),
(408, 64),
(408, 69),
(408, 91),
(409, 59),
(409, 61),
(409, 69),
(409, 91),
(410, 59),
(410, 61),
(410, 69),
(410, 91),
(411, 57),
(411, 60),
(411, 61),
(411, 62),
(411, 69),
(411, 91),
(411, 92),
(412, 57),
(412, 60),
(412, 61),
(412, 62),
(412, 69),
(412, 91),
(412, 92),
(413, 57),
(413, 60),
(413, 61),
(413, 62),
(413, 69),
(413, 91),
(413, 92),
(414, 57),
(414, 60),
(414, 61),
(414, 62),
(414, 69),
(414, 91),
(414, 92),
(415, 57),
(415, 60),
(415, 61),
(415, 62),
(415, 69),
(415, 91),
(415, 92),
(416, 57),
(416, 60),
(416, 61),
(416, 62),
(416, 69),
(416, 91),
(417, 57),
(417, 60),
(417, 61),
(417, 62),
(417, 69),
(417, 91),
(418, 57),
(418, 60),
(418, 61),
(418, 62),
(418, 69),
(418, 91),
(419, 27),
(419, 61),
(419, 62),
(419, 69),
(419, 91),
(419, 92),
(420, 27),
(420, 61),
(420, 69),
(421, 27),
(421, 61),
(421, 69),
(422, 27),
(422, 60),
(422, 61),
(422, 62),
(422, 64),
(423, 59),
(423, 60),
(423, 61),
(423, 62),
(423, 64),
(423, 69),
(424, 27),
(424, 60),
(424, 61),
(424, 62),
(424, 64),
(424, 69),
(425, 59),
(425, 60),
(425, 61),
(425, 62),
(425, 64),
(425, 69),
(426, 59),
(426, 60),
(426, 61),
(426, 62),
(426, 64),
(426, 69),
(427, 59),
(427, 60),
(427, 61),
(427, 62),
(427, 64),
(427, 69),
(428, 59),
(428, 61),
(428, 69),
(428, 91),
(429, 27),
(429, 61),
(429, 69),
(430, 27),
(430, 61),
(430, 69),
(431, 27),
(431, 61),
(431, 69),
(432, 59),
(432, 60),
(432, 61),
(432, 62),
(432, 64),
(432, 69),
(433, 59),
(433, 60),
(433, 61),
(433, 62),
(433, 64),
(433, 69),
(434, 59),
(434, 60),
(434, 61),
(434, 62),
(434, 64),
(434, 69),
(435, 27),
(435, 60),
(435, 61),
(435, 62),
(435, 64),
(435, 69),
(436, 59),
(436, 61),
(436, 69),
(437, 59),
(437, 60),
(437, 61),
(437, 62),
(437, 64),
(437, 69),
(438, 59),
(438, 60),
(438, 61),
(438, 62),
(438, 64),
(438, 69),
(439, 27),
(439, 60),
(439, 61),
(439, 62),
(439, 64),
(440, 27),
(440, 60),
(440, 61),
(440, 62),
(440, 64),
(441, 27),
(441, 61),
(441, 69),
(442, 59),
(442, 60),
(442, 61),
(442, 64),
(442, 69),
(443, 59),
(443, 60),
(443, 61),
(443, 64),
(443, 69),
(444, 59),
(444, 60),
(444, 61),
(444, 64),
(444, 69),
(445, 59),
(445, 60),
(445, 61),
(445, 64),
(445, 69),
(446, 59),
(446, 60),
(446, 61),
(446, 62),
(446, 64),
(446, 69),
(447, 27),
(447, 60),
(447, 61),
(447, 62),
(447, 64),
(447, 69),
(448, 27),
(448, 60),
(448, 61),
(448, 62),
(448, 64),
(448, 69),
(449, 27),
(449, 61),
(449, 69),
(450, 59),
(450, 60),
(450, 61),
(450, 62),
(450, 64),
(451, 59),
(451, 60),
(451, 61),
(451, 62),
(451, 64),
(452, 27),
(452, 61),
(452, 69),
(453, 27),
(453, 60),
(453, 61),
(453, 62),
(453, 64),
(453, 69),
(454, 27),
(454, 60),
(454, 61),
(454, 64),
(454, 69),
(455, 27),
(455, 60),
(455, 61),
(455, 62),
(455, 64),
(455, 69),
(456, 59),
(456, 60),
(456, 61),
(456, 62),
(456, 64),
(457, 27),
(457, 60),
(457, 61),
(457, 64),
(457, 69),
(458, 59),
(458, 60),
(458, 61),
(458, 69),
(459, 59),
(459, 60),
(459, 61),
(459, 69),
(460, 27),
(460, 60),
(460, 61),
(460, 62),
(460, 64),
(460, 69),
(461, 27),
(461, 60),
(461, 61),
(461, 62),
(461, 64),
(461, 69),
(462, 27),
(462, 60),
(462, 61),
(462, 62),
(462, 64);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_download`
--

CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_layout`
--

CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(303, 0, 0),
(377, 5, 0),
(376, 6, 0),
(378, 0, 0),
(303, 6, 0),
(379, 5, 0),
(326, 6, 0),
(317, 0, 0),
(370, 5, 0),
(436, 0, 0),
(375, 6, 0),
(374, 5, 0),
(339, 6, 0),
(373, 6, 0),
(420, 0, 0),
(372, 0, 0),
(341, 6, 0),
(343, 5, 0),
(371, 6, 0),
(389, 5, 0),
(367, 0, 0),
(434, 0, 0),
(326, 5, 0),
(366, 6, 0),
(390, 6, 0),
(365, 6, 0),
(425, 6, 0),
(364, 6, 0),
(328, 5, 0),
(389, 6, 0),
(363, 5, 0),
(391, 6, 0),
(362, 6, 0),
(361, 0, 0),
(425, 0, 0),
(390, 5, 0),
(360, 0, 0),
(311, 6, 0),
(359, 0, 0),
(311, 0, 0),
(425, 5, 0),
(357, 6, 0),
(337, 6, 0),
(434, 6, 0),
(356, 5, 0),
(355, 6, 0),
(310, 5, 0),
(332, 5, 0),
(344, 6, 0),
(313, 6, 0),
(354, 5, 0),
(353, 0, 0),
(391, 0, 0),
(352, 6, 0),
(312, 0, 0),
(351, 5, 0),
(383, 5, 0),
(350, 6, 0),
(310, 6, 0),
(349, 0, 0),
(433, 5, 0),
(327, 5, 0),
(326, 0, 0),
(348, 5, 0),
(409, 6, 0),
(347, 6, 0),
(312, 5, 0),
(421, 5, 0),
(382, 6, 0),
(327, 0, 0),
(328, 6, 0),
(325, 5, 0),
(325, 6, 0),
(324, 6, 0),
(324, 0, 0),
(323, 0, 0),
(323, 6, 0),
(336, 6, 0),
(383, 6, 0),
(335, 5, 0),
(343, 0, 0),
(416, 6, 0),
(317, 5, 0),
(317, 6, 0),
(415, 6, 0),
(316, 6, 0),
(414, 5, 0),
(316, 0, 0),
(413, 6, 0),
(314, 0, 0),
(412, 5, 0),
(411, 0, 0),
(314, 6, 0),
(410, 0, 0),
(315, 5, 0),
(315, 6, 0),
(420, 6, 0),
(408, 6, 0),
(436, 5, 0),
(407, 6, 0),
(415, 0, 0),
(413, 0, 0),
(406, 5, 0),
(414, 0, 0),
(405, 0, 0),
(404, 0, 0),
(414, 6, 0),
(415, 5, 0),
(403, 0, 0),
(413, 5, 0),
(311, 5, 0),
(310, 0, 0),
(412, 6, 0),
(412, 0, 0),
(402, 6, 0),
(349, 5, 0),
(350, 5, 0),
(349, 6, 0),
(348, 6, 0),
(330, 0, 0),
(403, 6, 0),
(313, 5, 0),
(329, 5, 0),
(401, 6, 0),
(328, 0, 0),
(335, 6, 0),
(327, 6, 0),
(399, 5, 0),
(325, 0, 0),
(396, 0, 0),
(399, 6, 0),
(324, 5, 0),
(322, 0, 0),
(322, 5, 0),
(423, 5, 0),
(423, 6, 0),
(320, 6, 0),
(320, 0, 0),
(319, 0, 0),
(319, 6, 0),
(401, 0, 0),
(323, 5, 0),
(331, 5, 0),
(396, 5, 0),
(322, 6, 0),
(395, 6, 0),
(423, 0, 0),
(395, 0, 0),
(320, 5, 0),
(394, 5, 0),
(319, 5, 0),
(394, 6, 0),
(392, 5, 0),
(312, 6, 0),
(318, 0, 0),
(318, 5, 0),
(297, 0, 0),
(318, 6, 0),
(392, 0, 0),
(408, 0, 0),
(422, 6, 0),
(308, 0, 0),
(411, 6, 0),
(307, 6, 0),
(408, 5, 0),
(404, 5, 0),
(426, 0, 0),
(404, 6, 0),
(305, 5, 0),
(427, 5, 0),
(399, 0, 0),
(427, 6, 0),
(398, 5, 0),
(426, 5, 0),
(396, 6, 0),
(426, 6, 0),
(395, 5, 0),
(297, 5, 0),
(429, 0, 0),
(297, 6, 0),
(394, 0, 0),
(430, 5, 0),
(308, 5, 0),
(389, 0, 0),
(308, 6, 0),
(331, 6, 0),
(332, 0, 0),
(331, 0, 0),
(330, 5, 0),
(330, 6, 0),
(329, 6, 0),
(417, 6, 0),
(435, 5, 0),
(335, 0, 0),
(334, 6, 0),
(333, 6, 0),
(334, 0, 0),
(333, 0, 0),
(436, 6, 0),
(307, 0, 0),
(337, 5, 0),
(332, 6, 0),
(339, 5, 0),
(437, 5, 0),
(339, 0, 0),
(329, 0, 0),
(305, 6, 0),
(434, 5, 0),
(307, 5, 0),
(433, 6, 0),
(305, 0, 0),
(432, 5, 0),
(390, 0, 0),
(392, 6, 0),
(420, 5, 0),
(368, 0, 0),
(383, 0, 0),
(382, 5, 0),
(344, 5, 0),
(345, 6, 0),
(381, 6, 0),
(380, 0, 0),
(340, 6, 0),
(416, 5, 0),
(418, 0, 0),
(366, 0, 0),
(366, 5, 0),
(417, 0, 0),
(407, 0, 0),
(359, 5, 0),
(341, 0, 0),
(336, 0, 0),
(336, 5, 0),
(304, 0, 0),
(391, 5, 0),
(304, 5, 0),
(369, 5, 0),
(432, 0, 0),
(303, 5, 0),
(427, 0, 0),
(433, 0, 0),
(357, 0, 0),
(359, 6, 0),
(348, 0, 0),
(347, 0, 0),
(354, 6, 0),
(355, 5, 0),
(345, 5, 0),
(406, 6, 0),
(353, 5, 0),
(354, 0, 0),
(421, 6, 0),
(347, 5, 0),
(345, 0, 0),
(421, 0, 0),
(351, 6, 0),
(352, 5, 0),
(428, 0, 0),
(315, 0, 0),
(378, 6, 0),
(378, 5, 0),
(411, 5, 0),
(401, 5, 0),
(379, 6, 0),
(381, 0, 0),
(381, 5, 0),
(379, 0, 0),
(357, 5, 0),
(356, 6, 0),
(380, 5, 0),
(417, 5, 0),
(380, 6, 0),
(438, 5, 0),
(313, 0, 0),
(337, 0, 0),
(316, 5, 0),
(431, 6, 0),
(416, 0, 0),
(418, 6, 0),
(418, 5, 0),
(403, 5, 0),
(304, 6, 0),
(419, 0, 0),
(439, 0, 0),
(382, 0, 0),
(356, 0, 0),
(355, 0, 0),
(352, 0, 0),
(353, 6, 0),
(350, 0, 0),
(351, 0, 0),
(314, 5, 0),
(432, 6, 0),
(334, 5, 0),
(343, 6, 0),
(424, 0, 0),
(341, 5, 0),
(344, 0, 0),
(333, 5, 0),
(360, 6, 0),
(360, 5, 0),
(361, 6, 0),
(361, 5, 0),
(362, 5, 0),
(362, 0, 0),
(363, 0, 0),
(363, 6, 0),
(364, 5, 0),
(364, 0, 0),
(365, 5, 0),
(365, 0, 0),
(429, 6, 0),
(429, 5, 0),
(430, 0, 0),
(430, 6, 0),
(431, 5, 0),
(431, 0, 0),
(439, 6, 0),
(439, 5, 0),
(435, 0, 0),
(435, 6, 0),
(424, 6, 0),
(424, 5, 0),
(422, 5, 0),
(422, 0, 0),
(367, 6, 0),
(367, 5, 0),
(368, 6, 0),
(368, 5, 0),
(369, 0, 0),
(369, 6, 0),
(370, 0, 0),
(370, 6, 0),
(371, 5, 0),
(371, 0, 0),
(372, 6, 0),
(372, 5, 0),
(373, 5, 0),
(373, 0, 0),
(374, 0, 0),
(374, 6, 0),
(375, 5, 0),
(375, 0, 0),
(428, 6, 0),
(428, 5, 0),
(410, 6, 0),
(410, 5, 0),
(377, 0, 0),
(377, 6, 0),
(376, 5, 0),
(376, 0, 0),
(406, 0, 0),
(407, 5, 0),
(437, 0, 0),
(437, 6, 0),
(438, 0, 0),
(438, 6, 0),
(409, 5, 0),
(409, 0, 0),
(440, 5, 0),
(440, 0, 0),
(440, 6, 0),
(441, 5, 0),
(441, 0, 0),
(441, 6, 0),
(442, 0, 0),
(443, 0, 0),
(398, 0, 0),
(398, 6, 0),
(340, 5, 0),
(340, 0, 0),
(405, 6, 0),
(405, 5, 0),
(402, 5, 0),
(402, 0, 0),
(444, 6, 0),
(444, 5, 0),
(444, 0, 0),
(445, 0, 0),
(446, 5, 0),
(446, 0, 0),
(446, 6, 0),
(447, 5, 0),
(447, 0, 0),
(447, 6, 0),
(448, 0, 0),
(448, 6, 0),
(448, 5, 0),
(449, 5, 0),
(449, 0, 0),
(449, 6, 0),
(450, 6, 0),
(450, 5, 0),
(450, 0, 0),
(451, 6, 0),
(451, 5, 0),
(451, 0, 0),
(452, 5, 0),
(452, 0, 0),
(452, 6, 0),
(453, 6, 0),
(453, 5, 0),
(453, 0, 0),
(454, 0, 0),
(454, 6, 0),
(454, 5, 0),
(455, 0, 0),
(455, 6, 0),
(455, 5, 0),
(456, 0, 0),
(456, 6, 0),
(456, 5, 0),
(457, 0, 0),
(457, 6, 0),
(457, 5, 0),
(458, 6, 0),
(458, 5, 0),
(458, 0, 0),
(459, 5, 0),
(459, 0, 0),
(459, 6, 0),
(460, 0, 0),
(460, 6, 0),
(460, 5, 0),
(461, 5, 0),
(461, 0, 0),
(461, 6, 0),
(462, 0, 0),
(462, 6, 0),
(462, 5, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_store`
--

CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(297, 0),
(297, 5),
(297, 6),
(303, 0),
(303, 5),
(303, 6),
(304, 0),
(304, 5),
(304, 6),
(305, 0),
(305, 5),
(305, 6),
(307, 0),
(307, 5),
(307, 6),
(308, 0),
(308, 5),
(308, 6),
(310, 0),
(310, 5),
(310, 6),
(311, 0),
(311, 5),
(311, 6),
(312, 0),
(312, 5),
(312, 6),
(313, 0),
(313, 5),
(313, 6),
(314, 0),
(314, 5),
(314, 6),
(315, 0),
(315, 5),
(315, 6),
(316, 0),
(316, 5),
(316, 6),
(317, 0),
(317, 5),
(317, 6),
(318, 0),
(318, 5),
(318, 6),
(319, 0),
(319, 5),
(319, 6),
(320, 0),
(320, 5),
(320, 6),
(322, 0),
(322, 5),
(322, 6),
(323, 0),
(323, 5),
(323, 6),
(324, 0),
(324, 5),
(324, 6),
(325, 0),
(325, 5),
(325, 6),
(326, 0),
(326, 5),
(326, 6),
(327, 0),
(327, 5),
(327, 6),
(328, 0),
(328, 5),
(328, 6),
(329, 0),
(329, 5),
(329, 6),
(330, 0),
(330, 5),
(330, 6),
(331, 0),
(331, 5),
(331, 6),
(332, 0),
(332, 5),
(332, 6),
(333, 0),
(333, 5),
(333, 6),
(334, 0),
(334, 5),
(334, 6),
(335, 0),
(335, 5),
(335, 6),
(336, 0),
(336, 5),
(336, 6),
(337, 0),
(337, 5),
(337, 6),
(339, 0),
(339, 5),
(339, 6),
(340, 0),
(340, 5),
(340, 6),
(341, 0),
(341, 5),
(341, 6),
(343, 0),
(343, 5),
(343, 6),
(344, 0),
(344, 5),
(344, 6),
(345, 0),
(345, 5),
(345, 6),
(347, 0),
(347, 5),
(347, 6),
(348, 0),
(348, 5),
(348, 6),
(349, 0),
(349, 5),
(349, 6),
(350, 0),
(350, 5),
(350, 6),
(351, 0),
(351, 5),
(351, 6),
(352, 0),
(352, 5),
(352, 6),
(353, 0),
(353, 5),
(353, 6),
(354, 0),
(354, 5),
(354, 6),
(355, 0),
(355, 5),
(355, 6),
(356, 0),
(356, 5),
(356, 6),
(357, 0),
(357, 5),
(357, 6),
(359, 0),
(359, 5),
(359, 6),
(360, 0),
(360, 5),
(360, 6),
(361, 0),
(361, 5),
(361, 6),
(362, 0),
(362, 5),
(362, 6),
(363, 0),
(363, 5),
(363, 6),
(364, 0),
(364, 5),
(364, 6),
(365, 0),
(365, 5),
(365, 6),
(366, 0),
(366, 5),
(366, 6),
(367, 0),
(367, 5),
(367, 6),
(368, 0),
(368, 5),
(368, 6),
(369, 0),
(369, 5),
(369, 6),
(370, 0),
(370, 5),
(370, 6),
(371, 0),
(371, 5),
(371, 6),
(372, 0),
(372, 5),
(372, 6),
(373, 0),
(373, 5),
(373, 6),
(374, 0),
(374, 5),
(374, 6),
(375, 0),
(375, 5),
(375, 6),
(376, 0),
(376, 5),
(376, 6),
(377, 0),
(377, 5),
(377, 6),
(378, 0),
(378, 5),
(378, 6),
(379, 0),
(379, 5),
(379, 6),
(380, 0),
(380, 5),
(380, 6),
(381, 0),
(381, 5),
(381, 6),
(382, 0),
(382, 5),
(382, 6),
(383, 0),
(383, 5),
(383, 6),
(389, 0),
(389, 5),
(389, 6),
(390, 0),
(390, 5),
(390, 6),
(391, 0),
(391, 5),
(391, 6),
(392, 0),
(392, 5),
(392, 6),
(394, 0),
(394, 5),
(394, 6),
(395, 0),
(395, 5),
(395, 6),
(396, 0),
(396, 5),
(396, 6),
(398, 0),
(398, 5),
(398, 6),
(399, 0),
(399, 5),
(399, 6),
(401, 0),
(401, 5),
(401, 6),
(402, 0),
(402, 5),
(402, 6),
(403, 0),
(403, 5),
(403, 6),
(404, 0),
(404, 5),
(404, 6),
(405, 0),
(405, 5),
(405, 6),
(406, 0),
(406, 5),
(406, 6),
(407, 0),
(407, 5),
(407, 6),
(408, 0),
(408, 5),
(408, 6),
(409, 0),
(409, 5),
(409, 6),
(410, 0),
(410, 5),
(410, 6),
(411, 0),
(411, 5),
(411, 6),
(412, 0),
(412, 5),
(412, 6),
(413, 0),
(413, 5),
(413, 6),
(414, 0),
(414, 5),
(414, 6),
(415, 0),
(415, 5),
(415, 6),
(416, 0),
(416, 5),
(416, 6),
(417, 0),
(417, 5),
(417, 6),
(418, 0),
(418, 5),
(418, 6),
(419, 0),
(420, 0),
(420, 5),
(420, 6),
(421, 0),
(421, 5),
(421, 6),
(422, 0),
(422, 5),
(422, 6),
(423, 0),
(423, 5),
(423, 6),
(424, 0),
(424, 5),
(424, 6),
(425, 0),
(425, 5),
(425, 6),
(426, 0),
(426, 5),
(426, 6),
(427, 0),
(427, 5),
(427, 6),
(428, 0),
(428, 5),
(428, 6),
(429, 0),
(429, 5),
(429, 6),
(430, 0),
(430, 5),
(430, 6),
(431, 0),
(431, 5),
(431, 6),
(432, 0),
(432, 5),
(432, 6),
(433, 0),
(433, 5),
(433, 6),
(434, 0),
(434, 5),
(434, 6),
(435, 0),
(435, 5),
(435, 6),
(436, 0),
(436, 5),
(436, 6),
(437, 0),
(437, 5),
(437, 6),
(438, 0),
(438, 5),
(438, 6),
(439, 0),
(439, 5),
(439, 6),
(440, 0),
(440, 5),
(440, 6),
(441, 0),
(441, 5),
(441, 6),
(442, 0),
(443, 0),
(444, 0),
(444, 5),
(444, 6),
(445, 0),
(446, 0),
(446, 5),
(446, 6),
(447, 0),
(447, 5),
(447, 6),
(448, 0),
(448, 5),
(448, 6),
(449, 0),
(449, 5),
(449, 6),
(450, 0),
(450, 5),
(450, 6),
(451, 0),
(451, 5),
(451, 6),
(452, 0),
(453, 0),
(454, 0),
(454, 5),
(454, 6),
(455, 0),
(455, 5),
(455, 6),
(456, 0),
(456, 5),
(456, 6),
(457, 0),
(457, 5),
(457, 6),
(458, 0),
(458, 5),
(458, 6),
(459, 0),
(459, 5),
(459, 6),
(460, 0),
(460, 5),
(460, 6),
(461, 0),
(461, 5),
(461, 6),
(462, 0),
(462, 5),
(462, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_question`
--

CREATE TABLE `oc_question` (
  `question_id` int(11) NOT NULL,
  `product_id` int(1) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `text` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `answer` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `notify` tinyint(1) NOT NULL DEFAULT '1',
  `date_added` datetime DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_recurring`
--

CREATE TABLE `oc_recurring` (
  `recurring_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) UNSIGNED NOT NULL,
  `cycle` int(10) UNSIGNED NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) UNSIGNED NOT NULL,
  `trial_cycle` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_recurring_description`
--

CREATE TABLE `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return`
--

CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_action`
--

CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 2, 'Refunded'),
(2, 2, 'Credit Issued'),
(3, 2, 'Replacement Sent'),
(1, 3, 'Refunded'),
(2, 3, 'Credit Issued'),
(3, 3, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_history`
--

CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_reason`
--

CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 2, 'Dead On Arrival'),
(2, 2, 'Received Wrong Item'),
(3, 2, 'Order Error'),
(4, 2, 'Faulty, please supply details'),
(5, 2, 'Other, please supply details'),
(1, 3, 'Dead On Arrival'),
(2, 3, 'Received Wrong Item'),
(3, 3, 'Order Error'),
(4, 3, 'Faulty, please supply details'),
(5, 3, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_status`
--

CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 2, 'Pending'),
(3, 2, 'Complete'),
(2, 2, 'Awaiting Products'),
(1, 3, 'Pending'),
(3, 3, 'Complete'),
(2, 3, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_review`
--

CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_revslider_attachment_images`
--

CREATE TABLE `oc_revslider_attachment_images` (
  `ID` int(10) NOT NULL,
  `file_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_revslider_css`
--

CREATE TABLE `oc_revslider_css` (
  `id` int(9) NOT NULL,
  `handle` text NOT NULL,
  `settings` text,
  `hover` text,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_revslider_css`
--

INSERT INTO `oc_revslider_css` (`id`, `handle`, `settings`, `hover`, `params`) VALUES
(1, '.tp-caption.lightgrey_divider', NULL, NULL, '{\"text-decoration\":\"none\",\"background-color\":\"rgba(235, 235, 235, 1)\",\"width\":\"370px\",\"height\":\"3px\",\"background-position\":\"initial initial\",\"background-repeat\":\"initial initial\",\"border-width\":\"0px\",\"border-color\":\"rgb(34, 34, 34)\",\"border-style\":\"none\"}'),
(2, '.tp-caption.contrast_font_heading', NULL, NULL, '{\"font-size\":\"60px\",\"color\":\"#ffffff\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(3, '.tp-caption.contrast_font_heading_dark', NULL, NULL, '{\"font-size\":\"60px\",\"color\":\"#222222\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(4, '.tp-caption.contrast_font_heading_primary', NULL, NULL, '{\"font-size\":\"60px\",\"color\":\"#d6a916\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(5, '.tp-caption.contrast_font_heading_secondary', NULL, NULL, '{\"font-size\":\"60px\",\"line-height\":\"56px\",\"color\":\"#276658\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(6, '.tp-caption.contrast_font_heading2', NULL, NULL, '{\"font-size\":\"48px\",\"color\":\"#ffffff\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(7, '.tp-caption.contrast_font_heading2_dark', NULL, NULL, '{\"font-size\":\"48px\",\"color\":\"#222222\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(8, '.tp-caption.contrast_font_heading2_primary', NULL, NULL, '{\"font-size\":\"48px\",\"color\":\"#d6a916\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(9, '.tp-caption.contrast_font_heading2_secondary', NULL, NULL, '{\"font-size\":\"48px\",\"line-height\":\"56px\",\"color\":\"#276658\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(10, '.tp-caption.contrast_font_sub_heading', NULL, NULL, '{\"font-size\":\"30px\",\"color\":\"#ffffff\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(11, '.tp-caption.contrast_font_sub_heading_dark', NULL, NULL, '{\"font-size\":\"30px\",\"color\":\"#222222\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(12, '.tp-caption.contrast_font_sub_heading_primary', NULL, NULL, '{\"font-size\":\"30px\",\"color\":\"#d6a916\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(13, '.tp-caption.contrast_font_sub_heading_secondary', NULL, NULL, '{\"font-size\":\"30px\",\"line-height\":\"56px\",\"color\":\"#276658\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(14, '.tp-caption.contrast_font', NULL, NULL, '{\"font-size\":\"17px\",\"color\":\"rgb(255, 255, 255)\",\"font-family\":\"\\\"Roboto\\\",serif\",\"border-width\":\"0px\",\"border-color\":\"rgb(255, 255, 255)\",\"border-style\":\"none\"}'),
(15, '.tp-caption.contrast_font_dark', NULL, NULL, '{\"font-size\":\"17px\",\"color\":\"#222222\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(16, '.tp-caption.contrast_font_primary', NULL, NULL, '{\"font-size\":\"17px\",\"color\":\"#d6a916\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(17, '.tp-caption.contrast_font_secondary', NULL, NULL, '{\"font-size\":\"17px\",\"color\":\"#276658\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(18, '.tp-caption.contrast_font_slider_button', '{\"hover\":\"true\"}', '{\"border-color\":\"#ffffff\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}', '{\"color\":\"#ffffff\",\"border\":\"2px solid\",\"border-color\":\"transparent\",\"border-top-color\":\"#ffffff\",\"display\":\"inline-block\",\"padding\":\"12px 25px\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(19, '.tp-caption.contrast_font_slider_button_dark', '{\"hover\":\"true\"}', '{\"border-color\":\"#222222\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}', '{\"color\":\"#222222\",\"border\":\"2px solid\",\"border-color\":\"transparent\",\"border-top-color\":\"#222222\",\"display\":\"inline-block\",\"padding\":\"12px 25px\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(20, '.tp-caption.contrast_font_slider_button_primary', '{\"hover\":\"true\"}', '{\"border-color\":\"#d6a916\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}', '{\"color\":\"#d6a916\",\"border\":\"2px solid\",\"border-color\":\"transparent\",\"border-top-color\":\"#d6a916\",\"display\":\"inline-block\",\"padding\":\"12px 25px\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(21, '.tp-caption.contrast_font_slider_button_secondary', '{\"hover\":\"true\"}', '{\"border-color\":\"#276658\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}', '{\"color\":\"#276658\",\"border\":\"2px solid\",\"border-color\":\"transparent\",\"border-top-color\":\"#276658\",\"display\":\"inline-block\",\"padding\":\"12px 25px\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(22, '.tp-caption.main_font_heading', NULL, NULL, '{\"font-size\":\"60px\",\"color\":\"#ffffff\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(23, '.tp-caption.main_font_heading_dark', NULL, NULL, '{\"font-size\":\"60px\",\"color\":\"#222222\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(24, '.tp-caption.main_font_heading_primary', NULL, NULL, '{\"font-size\":\"60px\",\"color\":\"#d6a916\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(25, '.tp-caption.main_font_heading_secondary', NULL, NULL, '{\"font-size\":\"60px\",\"line-height\":\"56px\",\"color\":\"#276658\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(26, '.tp-caption.main_font_heading2', NULL, NULL, '{\"font-size\":\"48px\",\"color\":\"#ffffff\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(27, '.tp-caption.main_font_heading2_dark', NULL, NULL, '{\"font-size\":\"48px\",\"color\":\"#222222\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(28, '.tp-caption.main_font_heading2_primary', NULL, NULL, '{\"font-size\":\"48px\",\"color\":\"#d6a916\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(29, '.tp-caption.main_font_heading2_secondary', NULL, NULL, '{\"font-size\":\"48px\",\"line-height\":\"56px\",\"color\":\"#276658\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(30, '.tp-caption.main_font_sub_heading', NULL, NULL, '{\"font-size\":\"30px\",\"color\":\"#ffffff\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(31, '.tp-caption.main_font_sub_heading_dark', NULL, NULL, '{\"font-size\":\"30px\",\"color\":\"#222222\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(32, '.tp-caption.main_font_sub_heading_primary', NULL, NULL, '{\"font-size\":\"30px\",\"color\":\"#d6a916\",\"line-height\":\"56px\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(33, '.tp-caption.main_font_sub_heading_secondary', NULL, NULL, '{\"font-size\":\"30px\",\"line-height\":\"56px\",\"color\":\"#276658\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(34, '.tp-caption.main_font', NULL, NULL, '{\"font-size\":\"17px\",\"color\":\"#ffffff\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(35, '.tp-caption.main_font_dark', NULL, NULL, '{\"font-size\":\"17px\",\"color\":\"#222222\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(36, '.tp-caption.main_font_primary', NULL, NULL, '{\"font-size\":\"17px\",\"color\":\"#d6a916\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(37, '.tp-caption.main_font_secondary', NULL, NULL, '{\"font-size\":\"17px\",\"color\":\"#276658\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(38, '.tp-caption.main_font_slider_button', '{\"hover\":\"true\"}', '{\"border-color\":\"#ffffff\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}', '{\"color\":\"#ffffff\",\"border\":\"2px solid\",\"border-color\":\"transparent\",\"border-top-color\":\"#ffffff\",\"display\":\"inline-block\",\"padding\":\"12px 25px\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(39, '.tp-caption.main_font_slider_button_dark', '{\"hover\":\"true\"}', '{\"border-color\":\"#222222\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}', '{\"color\":\"#222222\",\"border\":\"2px solid\",\"border-color\":\"transparent\",\"border-top-color\":\"#222222\",\"display\":\"inline-block\",\"padding\":\"12px 25px\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(40, '.tp-caption.main_font_slider_button_primary', '{\"hover\":\"true\"}', '{\"border-color\":\"#d6a916\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}', '{\"color\":\"#d6a916\",\"border\":\"2px solid\",\"border-color\":\"transparent\",\"border-top-color\":\"#d6a916\",\"display\":\"inline-block\",\"padding\":\"12px 25px\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}'),
(41, '.tp-caption.main_font_slider_button_secondary', '{\"hover\":\"true\"}', '{\"border-color\":\"#276658\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}', '{\"color\":\"#276658\",\"border\":\"2px solid\",\"border-color\":\"transparent\",\"border-top-color\":\"#276658\",\"display\":\"inline-block\",\"padding\":\"12px 25px\",\"transition\":\"border-color 400ms\",\"font-family\":\"\\\"Roboto\\\", serif\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_revslider_layer_animations`
--

CREATE TABLE `oc_revslider_layer_animations` (
  `id` int(9) NOT NULL,
  `handle` text NOT NULL,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_revslider_settings`
--

CREATE TABLE `oc_revslider_settings` (
  `id` int(9) NOT NULL,
  `general` text NOT NULL,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_revslider_sliders`
--

CREATE TABLE `oc_revslider_sliders` (
  `id` int(9) NOT NULL,
  `title` tinytext NOT NULL,
  `alias` tinytext,
  `params` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_revslider_sliders`
--

INSERT INTO `oc_revslider_sliders` (`id`, `title`, `alias`, `params`) VALUES
(1, 'home_slider_fullwidth', 'home_slider_fullwidth', '{\"title\":\"home_slider_fullwidth\",\"alias\":\"home_slider_fullwidth\",\"source_type\":\"gallery\",\"post_types\":\"product\",\"post_category\":\"category_20\",\"post_sortby\":\"ID\",\"prd_img_width\":\"880\",\"prd_img_height\":\"345\",\"posts_sort_direction\":\"DESC\",\"max_slider_posts\":\"30\",\"excerpt_limit\":\"55\",\"slider_template_id\":\"\",\"posts_list\":\"\",\"slider_type\":\"fullwidth\",\"fullscreen_offset_container\":\"\",\"fullscreen_offset_size\":\"\",\"fullscreen_min_height\":\"\",\"full_screen_align_force\":\"off\",\"auto_height\":\"off\",\"force_full_width\":\"on\",\"min_height\":\"0\",\"width\":\"1140\",\"height\":\"550\",\"responsitive_w1\":\"940\",\"responsitive_sw1\":\"770\",\"responsitive_w2\":\"780\",\"responsitive_sw2\":\"500\",\"responsitive_w3\":\"510\",\"responsitive_sw3\":\"310\",\"responsitive_w4\":\"0\",\"responsitive_sw4\":\"0\",\"responsitive_w5\":\"0\",\"responsitive_sw5\":\"0\",\"responsitive_w6\":\"0\",\"responsitive_sw6\":\"0\",\"delay\":\"8000\",\"shuffle\":\"off\",\"lazy_load\":\"off\",\"use_wpml\":\"off\",\"enable_static_layers\":\"off\",\"next_slide_on_window_focus\":\"off\",\"simplify_ie8_ios4\":\"off\",\"stop_slider\":\"off\",\"stop_after_loops\":0,\"stop_at_slide\":2,\"show_timerbar\":\"bottom\",\"loop_slide\":\"loop\",\"position\":\"center\",\"margin_top\":0,\"margin_bottom\":30,\"margin_left\":0,\"margin_right\":0,\"shadow_type\":\"0\",\"padding\":0,\"background_color\":\"#E9E9E9\",\"background_dotted_overlay\":\"none\",\"show_background_image\":\"false\",\"background_image\":\"\",\"bg_fit\":\"cover\",\"bg_repeat\":\"no-repeat\",\"bg_position\":\"center top\",\"stop_on_hover\":\"on\",\"keyboard_navigation\":\"off\",\"navigation_style\":\"custom\",\"navigaion_type\":\"bullet\",\"navigation_arrows\":\"solo\",\"navigaion_always_on\":\"true\",\"hide_thumbs\":200,\"navigaion_align_hor\":\"center\",\"navigaion_align_vert\":\"bottom\",\"navigaion_offset_hor\":\"0\",\"navigaion_offset_vert\":20,\"leftarrow_align_hor\":\"left\",\"leftarrow_align_vert\":\"center\",\"leftarrow_offset_hor\":20,\"leftarrow_offset_vert\":0,\"rightarrow_align_hor\":\"right\",\"rightarrow_align_vert\":\"center\",\"rightarrow_offset_hor\":20,\"rightarrow_offset_vert\":0,\"thumb_width\":100,\"thumb_height\":50,\"thumb_amount\":5,\"use_spinner\":\"0\",\"spinner_color\":\"#FFFFFF\",\"use_parallax\":\"off\",\"disable_parallax_mobile\":\"off\",\"parallax_type\":\"mouse\",\"parallax_bg_freeze\":\"off\",\"parallax_level_1\":\"5\",\"parallax_level_2\":\"10\",\"parallax_level_3\":\"15\",\"parallax_level_4\":\"20\",\"parallax_level_5\":\"25\",\"parallax_level_6\":\"30\",\"parallax_level_7\":\"35\",\"parallax_level_8\":\"40\",\"parallax_level_9\":\"45\",\"parallax_level_10\":\"50\",\"touchenabled\":\"on\",\"swipe_velocity\":75,\"swipe_min_touches\":1,\"drag_block_vertical\":\"false\",\"disable_on_mobile\":\"off\",\"disable_kenburns_on_mobile\":\"off\",\"hide_slider_under\":0,\"hide_defined_layers_under\":0,\"hide_all_layers_under\":0,\"hide_arrows_on_mobile\":\"off\",\"hide_bullets_on_mobile\":\"off\",\"hide_thumbs_on_mobile\":\"off\",\"hide_thumbs_under_resolution\":0,\"hide_thumbs_delay_mobile\":1500,\"start_with_slide\":\"1\",\"first_transition_active\":\"false\",\"first_transition_type\":\"fade\",\"first_transition_duration\":300,\"first_transition_slot_amount\":7,\"reset_transitions\":\"\",\"reset_transition_duration\":0,\"0\":\"Execute settings on all slides\",\"jquery_noconflict\":\"off\",\"js_to_body\":\"false\",\"output_type\":\"none\",\"custom_css\":\"\",\"custom_javascript\":\"\",\"template\":\"false\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_revslider_slides`
--

CREATE TABLE `oc_revslider_slides` (
  `id` int(9) NOT NULL,
  `slider_id` int(9) NOT NULL,
  `slide_order` int(11) NOT NULL,
  `params` text NOT NULL,
  `layers` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_revslider_slides`
--

INSERT INTO `oc_revslider_slides` (`id`, `slider_id`, `slide_order`, `params`, `layers`) VALUES
(1, 1, 1, '{\"background_type\":\"image\",\"image\":\"http:\\/\\/testtheme.net\\/image\\/catalog\\/revslider_media_folder\\/slider1.jpg\",\"title\":\"Slide\",\"state\":\"published\",\"date_from\":\"\",\"date_to\":\"\",\"slide_transition\":\"fade\",\"0\":\"Remove\",\"slot_amount\":7,\"transition_rotation\":0,\"transition_duration\":300,\"delay\":\"\",\"save_performance\":\"off\",\"enable_link\":\"false\",\"link_type\":\"regular\",\"link\":\"\",\"link_open_in\":\"same\",\"slide_link\":\"nothing\",\"link_pos\":\"front\",\"slide_thumb\":\"\",\"class_attr\":\"\",\"id_attr\":\"\",\"attr_attr\":\"\",\"data_attr\":\"\",\"slide_bg_color\":\"#E7E7E7\",\"slide_bg_external\":\"\",\"bg_fit\":\"cover\",\"bg_fit_x\":\"100\",\"bg_fit_y\":\"100\",\"bg_repeat\":\"no-repeat\",\"bg_position\":\"center top\",\"bg_position_x\":\"0\",\"bg_position_y\":\"0\",\"bg_end_position_x\":\"0\",\"bg_end_position_y\":\"0\",\"bg_end_position\":\"center top\",\"kenburn_effect\":\"off\",\"kb_start_fit\":\"100\",\"kb_end_fit\":\"100\",\"kb_duration\":\"8000\",\"kb_easing\":\"Linear.easeNone\",\"0\":\"Remove\"}', '[{\"text\":\"BY CHARLES AND RAY EAMES\",\"type\":\"text\",\"left\":450,\"top\":145,\"loop_animation\":\"none\",\"loop_easing\":\"Power3.easeInOut\",\"loop_speed\":\"2\",\"loop_startdeg\":\"-20\",\"loop_enddeg\":\"20\",\"loop_xorigin\":\"50\",\"loop_yorigin\":\"50\",\"loop_xstart\":\"0\",\"loop_xend\":\"0\",\"loop_ystart\":\"0\",\"loop_yend\":\"0\",\"loop_zoomstart\":\"1\",\"loop_zoomend\":\"1\",\"loop_angle\":\"0\",\"loop_radius\":\"10\",\"animation\":\"randomrotate\",\"easing\":\"Back.easeInOut\",\"split\":\"none\",\"endsplit\":\"none\",\"splitdelay\":\"10\",\"endsplitdelay\":\"10\",\"max_height\":\"auto\",\"max_width\":\"auto\",\"2d_rotation\":\"0\",\"2d_origin_x\":\"50\",\"2d_origin_y\":\"50\",\"parallax_level\":\"-\",\"whitespace\":\"nowrap\",\"speed\":800,\"align_hor\":\"left\",\"align_vert\":\"top\",\"hiddenunder\":false,\"resizeme\":true,\"link\":\"\",\"link_open_in\":\"same\",\"link_slide\":\"nothing\",\"scrollunder_offset\":\"\",\"style\":\"main_font\",\"time\":500,\"endtime\":\"7700\",\"endspeed\":300,\"endanimation\":\"auto\",\"endeasing\":\"nothing\",\"corner_left\":\"nothing\",\"corner_right\":\"nothing\",\"width\":-1,\"height\":-1,\"serial\":\"0\",\"endTimeFinal\":7600,\"endSpeedFinal\":300,\"realEndTime\":8000,\"timeLast\":7600,\"endWithSlide\":true,\"alt\":\"\",\"scaleX\":\"\",\"scaleY\":\"\",\"scaleProportional\":false,\"attrID\":\"\",\"attrClasses\":\"\",\"attrTitle\":\"\",\"attrRel\":\"\",\"link_id\":\"\",\"link_class\":\"\",\"link_title\":\"\",\"link_rel\":\"\",\"static_end\":\"1\",\"static_start\":\"1\"},{\"text\":\"<b>EAMES MOLDED PLASTIC <\\/b>\",\"type\":\"text\",\"left\":196,\"top\":185,\"loop_animation\":\"none\",\"loop_easing\":\"Power3.easeInOut\",\"loop_speed\":\"2\",\"loop_startdeg\":\"-20\",\"loop_enddeg\":\"20\",\"loop_xorigin\":\"50\",\"loop_yorigin\":\"50\",\"loop_xstart\":\"0\",\"loop_xend\":\"0\",\"loop_ystart\":\"0\",\"loop_yend\":\"0\",\"loop_zoomstart\":\"1\",\"loop_zoomend\":\"1\",\"loop_angle\":\"0\",\"loop_radius\":\"10\",\"animation\":\"sfb\",\"easing\":\"Back.easeInOut\",\"split\":\"none\",\"endsplit\":\"none\",\"splitdelay\":\"10\",\"endsplitdelay\":\"10\",\"max_height\":\"auto\",\"max_width\":\"auto\",\"2d_rotation\":\"0\",\"2d_origin_x\":\"50\",\"2d_origin_y\":\"50\",\"parallax_level\":\"-\",\"whitespace\":\"nowrap\",\"speed\":700,\"align_hor\":\"left\",\"align_vert\":\"top\",\"hiddenunder\":false,\"resizeme\":true,\"link\":\"\",\"link_open_in\":\"same\",\"link_slide\":\"nothing\",\"scrollunder_offset\":\"\",\"style\":\"contrast_font_heading\",\"time\":1000,\"endtime\":\"7700\",\"endspeed\":300,\"endanimation\":\"auto\",\"endeasing\":\"nothing\",\"corner_left\":\"nothing\",\"corner_right\":\"nothing\",\"width\":-1,\"height\":-1,\"serial\":\"1\",\"endTimeFinal\":7650,\"endSpeedFinal\":300,\"realEndTime\":8000,\"timeLast\":7650,\"endWithSlide\":true,\"alt\":\"\",\"scaleX\":\"\",\"scaleY\":\"\",\"scaleProportional\":false,\"attrID\":\"\",\"attrClasses\":\"\",\"attrTitle\":\"\",\"attrRel\":\"\",\"link_id\":\"\",\"link_class\":\"\",\"link_title\":\"\",\"link_rel\":\"\",\"static_end\":\"1\",\"static_start\":\"1\"},{\"text\":\"<b>SIDE CHAIR<\\/b>\",\"type\":\"text\",\"left\":400,\"top\":242,\"loop_animation\":\"none\",\"loop_easing\":\"Power3.easeInOut\",\"loop_speed\":\"2\",\"loop_startdeg\":\"-20\",\"loop_enddeg\":\"20\",\"loop_xorigin\":\"50\",\"loop_yorigin\":\"50\",\"loop_xstart\":\"0\",\"loop_xend\":\"0\",\"loop_ystart\":\"0\",\"loop_yend\":\"0\",\"loop_zoomstart\":\"1\",\"loop_zoomend\":\"1\",\"loop_angle\":\"0\",\"loop_radius\":\"10\",\"animation\":\"sfb\",\"easing\":\"Back.easeInOut\",\"split\":\"none\",\"endsplit\":\"none\",\"splitdelay\":\"10\",\"endsplitdelay\":\"10\",\"max_height\":\"auto\",\"max_width\":\"auto\",\"2d_rotation\":\"0\",\"2d_origin_x\":\"50\",\"2d_origin_y\":\"50\",\"parallax_level\":\"-\",\"whitespace\":\"nowrap\",\"speed\":700,\"align_hor\":\"left\",\"align_vert\":\"top\",\"hiddenunder\":false,\"resizeme\":true,\"link\":\"\",\"link_open_in\":\"same\",\"link_slide\":\"nothing\",\"scrollunder_offset\":\"\",\"style\":\"contrast_font_heading\",\"time\":1300,\"endtime\":7700,\"endspeed\":300,\"endanimation\":\"auto\",\"endeasing\":\"nothing\",\"corner_left\":\"nothing\",\"corner_right\":\"nothing\",\"width\":394,\"height\":56,\"serial\":\"2\",\"endTimeFinal\":7700,\"endSpeedFinal\":300,\"realEndTime\":8000,\"timeLast\":7700,\"endWithSlide\":true,\"alt\":\"\",\"scaleX\":\"\",\"scaleY\":\"\",\"scaleProportional\":false,\"attrID\":\"\",\"attrClasses\":\"\",\"attrTitle\":\"\",\"attrRel\":\"\",\"link_id\":\"\",\"link_class\":\"\",\"link_title\":\"\",\"link_rel\":\"\",\"static_end\":\"1\",\"static_start\":\"1\"},{\"text\":\"<a href=\\\"http:\\/\\/www.google.com\\\">BUY NOW!<\\/a>\",\"type\":\"text\",\"left\":500,\"top\":340,\"loop_animation\":\"none\",\"loop_easing\":\"Power3.easeInOut\",\"loop_speed\":\"2\",\"loop_startdeg\":\"-20\",\"loop_enddeg\":\"20\",\"loop_xorigin\":\"50\",\"loop_yorigin\":\"50\",\"loop_xstart\":\"0\",\"loop_xend\":\"0\",\"loop_ystart\":\"0\",\"loop_yend\":\"0\",\"loop_zoomstart\":\"1\",\"loop_zoomend\":\"1\",\"loop_angle\":\"0\",\"loop_radius\":\"10\",\"animation\":\"sfb\",\"easing\":\"Back.easeInOut\",\"split\":\"none\",\"endsplit\":\"none\",\"splitdelay\":\"10\",\"endsplitdelay\":\"10\",\"max_height\":\"auto\",\"max_width\":\"auto\",\"2d_rotation\":\"0\",\"2d_origin_x\":\"50\",\"2d_origin_y\":\"50\",\"parallax_level\":\"-\",\"whitespace\":\"nowrap\",\"speed\":700,\"align_hor\":\"left\",\"align_vert\":\"top\",\"hiddenunder\":false,\"resizeme\":true,\"link\":\"\",\"link_open_in\":\"same\",\"link_slide\":\"nothing\",\"scrollunder_offset\":\"\",\"style\":\"main_font_slider_button\",\"time\":1600,\"endtime\":\"7300\",\"endspeed\":700,\"endanimation\":\"auto\",\"endeasing\":\"nothing\",\"corner_left\":\"nothing\",\"corner_right\":\"nothing\",\"width\":-1,\"height\":-1,\"serial\":\"3\",\"endTimeFinal\":7300,\"endSpeedFinal\":700,\"realEndTime\":8000,\"timeLast\":7300,\"endWithSlide\":true,\"alt\":\"\",\"scaleX\":\"\",\"scaleY\":\"\",\"scaleProportional\":false,\"attrID\":\"\",\"attrClasses\":\"\",\"attrTitle\":\"\",\"attrRel\":\"\",\"link_id\":\"\",\"link_class\":\"\",\"link_title\":\"\",\"link_rel\":\"\",\"static_end\":\"1\",\"static_start\":\"1\"},{\"style\":\"\",\"text\":\"Image 5\",\"type\":\"image\",\"image_url\":\"http:\\/\\/www.velikorodnov.com\\/opencart\\/cosyone\\/demo20\\/image\\/catalog\\/revslider_media_folder\\/circle.png\",\"left\":206,\"top\":50,\"loop_animation\":\"none\",\"loop_easing\":\"Power3.easeInOut\",\"loop_speed\":\"2\",\"loop_startdeg\":\"-20\",\"loop_enddeg\":\"20\",\"loop_xorigin\":\"50\",\"loop_yorigin\":\"50\",\"loop_xstart\":\"0\",\"loop_xend\":\"0\",\"loop_ystart\":\"0\",\"loop_yend\":\"0\",\"loop_zoomstart\":\"1\",\"loop_zoomend\":\"1\",\"loop_angle\":\"0\",\"loop_radius\":\"10\",\"animation\":\"sft\",\"easing\":\"easeOutBack\",\"split\":\"none\",\"endsplit\":\"none\",\"splitdelay\":\"10\",\"endsplitdelay\":\"10\",\"max_height\":\"auto\",\"max_width\":\"auto\",\"2d_rotation\":\"0\",\"2d_origin_x\":\"50\",\"2d_origin_y\":\"50\",\"parallax_level\":\"-\",\"whitespace\":\"nowrap\",\"speed\":700,\"align_hor\":\"left\",\"align_vert\":\"top\",\"hiddenunder\":false,\"resizeme\":true,\"link\":\"\",\"link_open_in\":\"same\",\"link_slide\":\"nothing\",\"scrollunder_offset\":\"\",\"time\":1600,\"endtime\":\"7700\",\"endspeed\":700,\"endanimation\":\"auto\",\"endeasing\":\"nothing\",\"corner_left\":\"nothing\",\"corner_right\":\"nothing\",\"width\":120,\"height\":120,\"serial\":\"4\",\"endTimeFinal\":7300,\"endSpeedFinal\":700,\"realEndTime\":8000,\"timeLast\":7300,\"endWithSlide\":true,\"alt\":\"\",\"scaleX\":\"\",\"scaleY\":\"\",\"scaleProportional\":false,\"attrID\":\"\",\"attrClasses\":\"\",\"attrTitle\":\"\",\"attrRel\":\"\",\"link_id\":\"\",\"link_class\":\"\",\"link_title\":\"\",\"link_rel\":\"\",\"static_start\":\"1\",\"static_end\":\"1\"},{\"text\":\"for only\",\"type\":\"text\",\"left\":238,\"top\":83,\"loop_animation\":\"none\",\"loop_easing\":\"Power3.easeInOut\",\"loop_speed\":\"2\",\"loop_startdeg\":\"-20\",\"loop_enddeg\":\"20\",\"loop_xorigin\":\"50\",\"loop_yorigin\":\"50\",\"loop_xstart\":\"0\",\"loop_xend\":\"0\",\"loop_ystart\":\"0\",\"loop_yend\":\"0\",\"loop_zoomstart\":\"1\",\"loop_zoomend\":\"1\",\"loop_angle\":\"0\",\"loop_radius\":\"10\",\"animation\":\"sft\",\"easing\":\"easeOutBack\",\"split\":\"none\",\"endsplit\":\"none\",\"splitdelay\":\"10\",\"endsplitdelay\":\"10\",\"max_height\":\"auto\",\"max_width\":\"auto\",\"2d_rotation\":\"0\",\"2d_origin_x\":\"50\",\"2d_origin_y\":\"50\",\"parallax_level\":\"-\",\"whitespace\":\"nowrap\",\"speed\":700,\"align_hor\":\"left\",\"align_vert\":\"top\",\"hiddenunder\":false,\"resizeme\":true,\"link\":\"\",\"link_open_in\":\"same\",\"link_slide\":\"nothing\",\"scrollunder_offset\":\"\",\"style\":\"contrast_font\",\"time\":1600,\"endtime\":7700,\"endspeed\":300,\"endanimation\":\"auto\",\"endeasing\":\"nothing\",\"corner_left\":\"nothing\",\"corner_right\":\"nothing\",\"width\":62,\"height\":17,\"serial\":\"5\",\"endTimeFinal\":7700,\"endSpeedFinal\":300,\"realEndTime\":8000,\"timeLast\":7700,\"endWithSlide\":true,\"alt\":\"\",\"scaleX\":\"\",\"scaleY\":\"\",\"scaleProportional\":false,\"attrID\":\"\",\"attrClasses\":\"\",\"attrTitle\":\"\",\"attrRel\":\"\",\"link_id\":\"\",\"link_class\":\"\",\"link_title\":\"\",\"link_rel\":\"\",\"static_start\":\"1\",\"static_end\":\"1\"},{\"text\":\"<b>$299<\\/b>\",\"type\":\"text\",\"left\":232,\"top\":90,\"loop_animation\":\"none\",\"loop_easing\":\"Power3.easeInOut\",\"loop_speed\":\"2\",\"loop_startdeg\":\"-20\",\"loop_enddeg\":\"20\",\"loop_xorigin\":\"50\",\"loop_yorigin\":\"50\",\"loop_xstart\":\"0\",\"loop_xend\":\"0\",\"loop_ystart\":\"0\",\"loop_yend\":\"0\",\"loop_zoomstart\":\"1\",\"loop_zoomend\":\"1\",\"loop_angle\":\"0\",\"loop_radius\":\"10\",\"animation\":\"sft\",\"easing\":\"easeOutBack\",\"split\":\"none\",\"endsplit\":\"none\",\"splitdelay\":\"10\",\"endsplitdelay\":\"10\",\"max_height\":\"auto\",\"max_width\":\"auto\",\"2d_rotation\":\"0\",\"2d_origin_x\":\"50\",\"2d_origin_y\":\"50\",\"parallax_level\":\"-\",\"whitespace\":\"nowrap\",\"speed\":700,\"align_hor\":\"left\",\"align_vert\":\"top\",\"hiddenunder\":false,\"resizeme\":true,\"link\":\"\",\"link_open_in\":\"same\",\"link_slide\":\"nothing\",\"scrollunder_offset\":\"\",\"style\":\"contrast_font_sub_heading\",\"time\":1600,\"endtime\":7700,\"endspeed\":300,\"endanimation\":\"auto\",\"endeasing\":\"nothing\",\"corner_left\":\"nothing\",\"corner_right\":\"nothing\",\"width\":-1,\"height\":-1,\"serial\":\"6\",\"endTimeFinal\":7700,\"endSpeedFinal\":300,\"realEndTime\":8000,\"timeLast\":7700,\"endWithSlide\":true,\"alt\":\"\",\"scaleX\":\"\",\"scaleY\":\"\",\"scaleProportional\":false,\"attrID\":\"\",\"attrClasses\":\"\",\"attrTitle\":\"\",\"attrRel\":\"\",\"link_id\":\"\",\"link_class\":\"\",\"link_title\":\"\",\"link_rel\":\"\",\"static_start\":\"1\",\"static_end\":\"1\"}]'),
(3, 1, 2, '{\"background_type\":\"image\",\"image\":\"http:\\/\\/testtheme.net\\/image\\/catalog\\/revslider_media_folder\\/slideshow-full-1980x550.png\",\"title\":\"Slide 2\",\"state\":\"published\",\"date_from\":\"\",\"date_to\":\"\",\"slide_transition\":\"slidehorizontal\",\"0\":\"Remove\",\"slot_amount\":7,\"transition_rotation\":0,\"transition_duration\":900,\"delay\":\"\",\"save_performance\":\"off\",\"enable_link\":\"false\",\"link_type\":\"regular\",\"link\":\"\",\"link_open_in\":\"same\",\"slide_link\":\"nothing\",\"link_pos\":\"front\",\"slide_thumb\":\"\",\"class_attr\":\"\",\"id_attr\":\"\",\"attr_attr\":\"\",\"data_attr\":\"\",\"slide_bg_color\":\"#E7E7E7\",\"slide_bg_external\":\"\",\"bg_fit\":\"cover\",\"bg_fit_x\":\"100\",\"bg_fit_y\":\"100\",\"bg_repeat\":\"no-repeat\",\"bg_position\":\"center top\",\"bg_position_x\":\"0\",\"bg_position_y\":\"0\",\"bg_end_position_x\":\"0\",\"bg_end_position_y\":\"0\",\"bg_end_position\":\"center top\",\"kenburn_effect\":\"off\",\"kb_start_fit\":\"100\",\"kb_end_fit\":\"100\",\"kb_duration\":\"8000\",\"kb_easing\":\"Linear.easeNone\",\"0\":\"Remove\"}', '[{\"text\":\"SHAPES, SIZES AND STYLES\",\"type\":\"text\",\"left\":1,\"top\":120,\"loop_animation\":\"none\",\"loop_easing\":\"Power3.easeInOut\",\"loop_speed\":\"2\",\"loop_startdeg\":\"-20\",\"loop_enddeg\":\"20\",\"loop_xorigin\":\"50\",\"loop_yorigin\":\"50\",\"loop_xstart\":\"0\",\"loop_xend\":\"0\",\"loop_ystart\":\"0\",\"loop_yend\":\"0\",\"loop_zoomstart\":\"1\",\"loop_zoomend\":\"1\",\"loop_angle\":\"0\",\"loop_radius\":\"10\",\"animation\":\"sfl\",\"easing\":\"easeOutBack\",\"split\":\"none\",\"endsplit\":\"none\",\"splitdelay\":\"10\",\"endsplitdelay\":\"10\",\"max_height\":\"auto\",\"max_width\":\"auto\",\"2d_rotation\":\"0\",\"2d_origin_x\":\"50\",\"2d_origin_y\":\"50\",\"parallax_level\":\"-\",\"whitespace\":\"nowrap\",\"static_start\":\"1\",\"static_end\":\"2\",\"speed\":600,\"align_hor\":\"left\",\"align_vert\":\"top\",\"hiddenunder\":false,\"resizeme\":true,\"link\":\"\",\"link_open_in\":\"same\",\"link_slide\":\"nothing\",\"scrollunder_offset\":\"\",\"style\":\"main_font\",\"time\":900,\"endtime\":\"7700\",\"endspeed\":300,\"endanimation\":\"auto\",\"endeasing\":\"nothing\",\"corner_left\":\"nothing\",\"corner_right\":\"nothing\",\"width\":-1,\"height\":-1,\"serial\":\"0\",\"endTimeFinal\":7700,\"endSpeedFinal\":300,\"realEndTime\":8000,\"timeLast\":7500,\"endWithSlide\":true,\"alt\":\"\",\"scaleX\":\"\",\"scaleY\":\"\",\"scaleProportional\":false,\"attrID\":\"\",\"attrClasses\":\"\",\"attrTitle\":\"\",\"attrRel\":\"\",\"link_id\":\"\",\"link_class\":\"\",\"link_title\":\"\",\"link_rel\":\"\"},{\"text\":\"<b>THINGS<\\/b> <span class=\\\"light_font\\\">THAT<\\/span>\",\"type\":\"text\",\"left\":0,\"top\":160,\"loop_animation\":\"none\",\"loop_easing\":\"Power3.easeInOut\",\"loop_speed\":\"2\",\"loop_startdeg\":\"-20\",\"loop_enddeg\":\"20\",\"loop_xorigin\":\"50\",\"loop_yorigin\":\"50\",\"loop_xstart\":\"0\",\"loop_xend\":\"0\",\"loop_ystart\":\"0\",\"loop_yend\":\"0\",\"loop_zoomstart\":\"1\",\"loop_zoomend\":\"1\",\"loop_angle\":\"0\",\"loop_radius\":\"10\",\"animation\":\"tp-fade\",\"easing\":\"easeOutBack\",\"split\":\"none\",\"endsplit\":\"none\",\"splitdelay\":\"10\",\"endsplitdelay\":\"10\",\"max_height\":\"auto\",\"max_width\":\"auto\",\"2d_rotation\":\"0\",\"2d_origin_x\":\"50\",\"2d_origin_y\":\"50\",\"parallax_level\":\"-\",\"whitespace\":\"nowrap\",\"static_start\":\"1\",\"static_end\":\"2\",\"speed\":600,\"align_hor\":\"left\",\"align_vert\":\"top\",\"hiddenunder\":false,\"resizeme\":true,\"link\":\"\",\"link_open_in\":\"same\",\"link_slide\":\"nothing\",\"scrollunder_offset\":\"\",\"style\":\"contrast_font_heading\",\"time\":1200,\"endtime\":\"7700\",\"endspeed\":300,\"endanimation\":\"auto\",\"endeasing\":\"nothing\",\"corner_left\":\"nothing\",\"corner_right\":\"nothing\",\"width\":-1,\"height\":-1,\"serial\":\"1\",\"endTimeFinal\":7700,\"endSpeedFinal\":300,\"realEndTime\":8000,\"timeLast\":7100,\"endWithSlide\":true,\"alt\":\"\",\"scaleX\":\"\",\"scaleY\":\"\",\"scaleProportional\":false,\"attrID\":\"\",\"attrClasses\":\"\",\"attrTitle\":\"\",\"attrRel\":\"\",\"link_id\":\"\",\"link_class\":\"\",\"link_title\":\"\",\"link_rel\":\"\"},{\"text\":\"<span class=\\\"light_font\\\">WORKS<\\/span> <b>PERFECTLY<\\/b>\",\"type\":\"text\",\"left\":1,\"top\":220,\"loop_animation\":\"none\",\"loop_easing\":\"Power3.easeInOut\",\"loop_speed\":\"2\",\"loop_startdeg\":\"-20\",\"loop_enddeg\":\"20\",\"loop_xorigin\":\"50\",\"loop_yorigin\":\"50\",\"loop_xstart\":\"0\",\"loop_xend\":\"0\",\"loop_ystart\":\"0\",\"loop_yend\":\"0\",\"loop_zoomstart\":\"1\",\"loop_zoomend\":\"1\",\"loop_angle\":\"0\",\"loop_radius\":\"10\",\"animation\":\"sfl\",\"easing\":\"easeOutBack\",\"split\":\"none\",\"endsplit\":\"none\",\"splitdelay\":\"10\",\"endsplitdelay\":\"10\",\"max_height\":\"auto\",\"max_width\":\"auto\",\"2d_rotation\":\"0\",\"2d_origin_x\":\"50\",\"2d_origin_y\":\"50\",\"parallax_level\":\"-\",\"whitespace\":\"nowrap\",\"static_start\":\"1\",\"static_end\":\"2\",\"speed\":600,\"align_hor\":\"left\",\"align_vert\":\"top\",\"hiddenunder\":false,\"resizeme\":true,\"link\":\"\",\"link_open_in\":\"same\",\"link_slide\":\"nothing\",\"scrollunder_offset\":\"\",\"style\":\"contrast_font_heading\",\"time\":1500,\"endtime\":\"7700\",\"endspeed\":300,\"endanimation\":\"auto\",\"endeasing\":\"nothing\",\"corner_left\":\"nothing\",\"corner_right\":\"nothing\",\"width\":-1,\"height\":-1,\"serial\":\"2\",\"endTimeFinal\":7700,\"endSpeedFinal\":300,\"realEndTime\":8000,\"timeLast\":6800,\"endWithSlide\":true,\"alt\":\"\",\"scaleX\":\"\",\"scaleY\":\"\",\"scaleProportional\":false,\"attrID\":\"\",\"attrClasses\":\"\",\"attrTitle\":\"\",\"attrRel\":\"\",\"link_id\":\"\",\"link_class\":\"\",\"link_title\":\"\",\"link_rel\":\"\"},{\"text\":\"<b>FOR YOU<\\/b>\",\"type\":\"text\",\"left\":0,\"top\":275,\"loop_animation\":\"none\",\"loop_easing\":\"Power3.easeInOut\",\"loop_speed\":\"2\",\"loop_startdeg\":\"-20\",\"loop_enddeg\":\"20\",\"loop_xorigin\":\"50\",\"loop_yorigin\":\"50\",\"loop_xstart\":\"0\",\"loop_xend\":\"0\",\"loop_ystart\":\"0\",\"loop_yend\":\"0\",\"loop_zoomstart\":\"1\",\"loop_zoomend\":\"1\",\"loop_angle\":\"0\",\"loop_radius\":\"10\",\"animation\":\"sfl\",\"easing\":\"easeOutBack\",\"split\":\"none\",\"endsplit\":\"none\",\"splitdelay\":\"10\",\"endsplitdelay\":\"10\",\"max_height\":\"auto\",\"max_width\":\"auto\",\"2d_rotation\":\"0\",\"2d_origin_x\":\"50\",\"2d_origin_y\":\"50\",\"parallax_level\":\"-\",\"whitespace\":\"nowrap\",\"static_start\":\"1\",\"static_end\":\"2\",\"speed\":600,\"align_hor\":\"left\",\"align_vert\":\"top\",\"hiddenunder\":false,\"resizeme\":true,\"link\":\"\",\"link_open_in\":\"same\",\"link_slide\":\"nothing\",\"scrollunder_offset\":\"\",\"style\":\"contrast_font_heading\",\"time\":1800,\"endtime\":\"7700\",\"endspeed\":300,\"endanimation\":\"auto\",\"endeasing\":\"nothing\",\"corner_left\":\"nothing\",\"corner_right\":\"nothing\",\"width\":-1,\"height\":-1,\"serial\":\"3\",\"endTimeFinal\":7700,\"endSpeedFinal\":300,\"realEndTime\":8000,\"timeLast\":6500,\"endWithSlide\":true,\"alt\":\"\",\"scaleX\":\"\",\"scaleY\":\"\",\"scaleProportional\":false,\"attrID\":\"\",\"attrClasses\":\"\",\"attrTitle\":\"\",\"attrRel\":\"\",\"link_id\":\"\",\"link_class\":\"\",\"link_title\":\"\",\"link_rel\":\"\"},{\"text\":\"<a href=\\\"#\\\">FIND IT HERE<\\/a>\",\"type\":\"text\",\"left\":0,\"top\":370,\"loop_animation\":\"none\",\"loop_easing\":\"Power3.easeInOut\",\"loop_speed\":\"2\",\"loop_startdeg\":\"-20\",\"loop_enddeg\":\"20\",\"loop_xorigin\":\"50\",\"loop_yorigin\":\"50\",\"loop_xstart\":\"0\",\"loop_xend\":\"0\",\"loop_ystart\":\"0\",\"loop_yend\":\"0\",\"loop_zoomstart\":\"1\",\"loop_zoomend\":\"1\",\"loop_angle\":\"0\",\"loop_radius\":\"10\",\"animation\":\"sfb\",\"easing\":\"easeOutBack\",\"split\":\"none\",\"endsplit\":\"none\",\"splitdelay\":\"10\",\"endsplitdelay\":\"10\",\"max_height\":\"auto\",\"max_width\":\"auto\",\"2d_rotation\":\"0\",\"2d_origin_x\":\"50\",\"2d_origin_y\":\"50\",\"parallax_level\":\"-\",\"whitespace\":\"nowrap\",\"static_start\":\"1\",\"static_end\":\"2\",\"speed\":600,\"align_hor\":\"left\",\"align_vert\":\"top\",\"hiddenunder\":false,\"resizeme\":true,\"link\":\"\",\"link_open_in\":\"same\",\"link_slide\":\"nothing\",\"scrollunder_offset\":\"\",\"style\":\"main_font_slider_button\",\"time\":1800,\"endtime\":\"7700\",\"endspeed\":300,\"endanimation\":\"auto\",\"endeasing\":\"nothing\",\"corner_left\":\"nothing\",\"corner_right\":\"nothing\",\"width\":-1,\"height\":-1,\"serial\":\"4\",\"endTimeFinal\":7700,\"endSpeedFinal\":300,\"realEndTime\":8000,\"timeLast\":6500,\"endWithSlide\":true,\"alt\":\"\",\"scaleX\":\"\",\"scaleY\":\"\",\"scaleProportional\":false,\"attrID\":\"\",\"attrClasses\":\"\",\"attrTitle\":\"\",\"attrRel\":\"\",\"link_id\":\"\",\"link_class\":\"\",\"link_title\":\"\",\"link_rel\":\"\"}]');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_revslider_static_slides`
--

CREATE TABLE `oc_revslider_static_slides` (
  `id` int(9) NOT NULL,
  `slider_id` int(9) NOT NULL,
  `params` text NOT NULL,
  `layers` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_setting`
--

CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` longtext NOT NULL,
  `serialized` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(111472, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(111471, 0, 'shipping', 'shipping_status', '1', 0),
(111470, 0, 'shipping', 'shipping_estimator', '0', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(34, 0, 'flat', 'flat_sort_order', '1', 0),
(35, 0, 'flat', 'flat_status', '1', 0),
(36, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(37, 0, 'flat', 'flat_tax_class_id', '9', 0),
(41, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(146, 0, 'category', 'category_status', '1', 0),
(158, 0, 'account', 'account_status', '1', 0),
(159, 0, 'affiliate', 'affiliate_status', '1', 0),
(795, 0, 'theme_default', 'theme_default_image_location_height', '50', 0),
(108634, 0, 'theme_default', 'theme_default_image_wishlist_height', '100', 0),
(108633, 0, 'theme_default', 'theme_default_image_wishlist_width', '100', 0),
(111525, 0, 'quickcheckout', 'quickcheckout_countdown_start', '0', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(111352, 0, 'config', 'config_compression', '0', 0),
(111353, 0, 'config', 'config_secure', '0', 0),
(111354, 0, 'config', 'config_password', '1', 0),
(111355, 0, 'config', 'config_shared', '0', 0),
(111356, 0, 'config', 'config_encryption', 'XFdp6dqwDGeKiQC8UikuOjhR1bMUPNHyDb6rey2Vn7TMVbgMPjuQpkbhb5el0lWLzDxhyGLnIbO2lwIc8ajtCJYgDpzgQcx6rQQwYMGqTfrnADok9WPHYE9aL9HJbfITGiyabXyIuRWvZC1nfQ8N4VSoKZfx65jFwogVhFI1QgTlH71800WDDpFM3yGxxVpaZhoUSOntApLFGnVGmw9IUvj2CGg0bCyMdOzfqc8Nyf1FD6qj8ToAMfjP4qQwZLGpaOlrbE4CfSlJ7me1M4gEWR8ONRfASRFDIMvJx93KZxoeEFqLenvw5CqpbFrc0kQBieK0ngdmgB2c92x9nFClcgkBSpFSVAmBiTD9J573txV4dFOmtLasuAYq845gktb0wYnxoGenRJupg4nEvTiT1fc6XDTzW08wTzKdJ5ymfegn0C2yvlr3TFQzbUL8mN15Th5ksqNLBFx5UyuhadFVMraDOCR9cr0xTGxHU3qw0dF4wDINmxrGxjKL3Ohq0aocG0wkb9A0HoCNUbWu5o1qiY5GHVwdqGjwZlIp55VSF6cg5acgvwVe5SG0d3ekCM3bJ7Gq33yu0fKLitVhDOIBEuitoXYZdrsMIpm8XGm2q8ih3uFkhIU1J80HybrGYpcuzFEH9FT7psYTwYOVAOUFhfcULTQmfO2dcng7L09s2Fv6SvkGH98Sqdn085m0FcCPzaneVjagAeu2Rj1kTNKh3iy6ZrOeYwJU3pGOlKfOpKtVhY6hc4USSy0qCSmNspr6D1DRvLep1CSOwpD6BUrTvHMaYAWGmR94FXvYDuFulOptxpAVPrLNczSQaYwdGitEz1JQuQE83OVl5Z7vnr54IEE4H7MzlI0l0uirx8fvuf3fItCjWPxX5D1FbWoXf9i9h5UgPJuSas2Sxndz0VTkdFFRBjwagulLddmKsHM5KHJM9h3PhCVkpC8B92CPQvaAA8cin7oXoDGWeXgg0EUEbKUdO1KvqjQPQrRaedFLn8z7UwM8lDl0L42C1hPmvIe6', 0),
(794, 0, 'theme_default', 'theme_default_image_location_width', '268', 0),
(108635, 0, 'theme_default', 'theme_default_image_cart_width', '100', 0),
(108636, 0, 'theme_default', 'theme_default_image_cart_height', '100', 0),
(774, 0, 'theme_default', 'theme_default_product_limit', '15', 0),
(775, 0, 'theme_default', 'theme_default_product_description_length', '100', 0),
(111317, 0, 'config', 'config_complete_status', '[\"5\",\"3\"]', 1),
(111318, 0, 'config', 'config_fraud_status_id', '7', 0),
(111319, 0, 'config', 'config_order_mail', '1', 0),
(111320, 0, 'config', 'config_api_id', '1', 0),
(111321, 0, 'config', 'config_stock_display', '0', 0),
(111322, 0, 'config', 'config_stock_warning', '0', 0),
(111323, 0, 'config', 'config_stock_checkout', '1', 0),
(111324, 0, 'config', 'config_affiliate_approval', '0', 0),
(111325, 0, 'config', 'config_affiliate_auto', '0', 0),
(111326, 0, 'config', 'config_affiliate_commission', '', 0),
(111327, 0, 'config', 'config_affiliate_id', '4', 0),
(111328, 0, 'config', 'config_affiliate_mail', '0', 0),
(111329, 0, 'config', 'config_return_id', '0', 0),
(111330, 0, 'config', 'config_return_status_id', '2', 0),
(111331, 0, 'config', 'config_captcha', '', 0),
(111332, 0, 'config', 'config_captcha_page', '[\"review\",\"return\",\"contact\"]', 1),
(111333, 0, 'config', 'config_logo', 'catalog/logo.png', 0),
(111334, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(111335, 0, 'config', 'config_ftp_hostname', 'testtheme.net', 0),
(111336, 0, 'config', 'config_ftp_port', '21', 0),
(111337, 0, 'config', 'config_ftp_username', '', 0),
(111338, 0, 'config', 'config_ftp_password', '', 0),
(111339, 0, 'config', 'config_ftp_root', '', 0),
(111340, 0, 'config', 'config_ftp_status', '0', 0),
(111341, 0, 'config', 'config_mail_protocol', 'mail', 0),
(111342, 0, 'config', 'config_mail_parameter', '', 0),
(111343, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(111344, 0, 'config', 'config_mail_smtp_username', '', 0),
(111345, 0, 'config', 'config_mail_smtp_password', '', 0),
(111346, 0, 'config', 'config_mail_smtp_port', '25', 0),
(111347, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(111348, 0, 'config', 'config_mail_alert', '', 0),
(111349, 0, 'config', 'config_maintenance', '0', 0),
(111350, 0, 'config', 'config_seo_url', '1', 0),
(111351, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(111316, 0, 'config', 'config_processing_status', '[\"5\",\"1\",\"2\",\"12\",\"3\"]', 1),
(111315, 0, 'config', 'config_order_status_id', '1', 0),
(111314, 0, 'config', 'config_checkout_id', '5', 0),
(111313, 0, 'config', 'config_checkout_guest', '1', 0),
(111312, 0, 'config', 'config_cart_weight', '0', 0),
(111311, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(111310, 0, 'config', 'config_account_mail', '0', 0),
(111309, 0, 'config', 'config_account_id', '3', 0),
(111308, 0, 'config', 'config_login_attempts', '5', 0),
(111307, 0, 'config', 'config_customer_price', '0', 0),
(111306, 0, 'config', 'config_customer_group_display', '[\"1\"]', 1),
(111305, 0, 'config', 'config_customer_group_id', '1', 0),
(111304, 0, 'config', 'config_customer_online', '0', 0),
(111303, 0, 'config', 'config_tax_customer', 'shipping', 0),
(111302, 0, 'config', 'config_tax_default', 'shipping', 0),
(111301, 0, 'config', 'config_tax', '1', 0),
(111300, 0, 'config', 'config_voucher_max', '1000', 0),
(111299, 0, 'config', 'config_voucher_min', '1', 0),
(111298, 0, 'config', 'config_review_mail', '0', 0),
(111297, 0, 'config', 'config_review_guest', '1', 0),
(111296, 0, 'config', 'config_review_status', '1', 0),
(111295, 0, 'config', 'config_limit_admin', '20', 0),
(111294, 0, 'config', 'config_product_count', '1', 0),
(111293, 0, 'config', 'config_weight_class_id', '1', 0),
(111292, 0, 'config', 'config_length_class_id', '1', 0),
(111291, 0, 'config', 'config_currency_auto', '0', 0),
(111290, 0, 'config', 'config_currency', 'UAH', 0),
(410, 0, 'shopme', 'shopme_header_style', 'header1', 0),
(411, 0, 'shopme', 'shopme_footer_columns', 'col-xs-12', 0),
(412, 0, 'shopme', 'shopme_menu_type', 'default', 0),
(413, 0, 'shopme', 'shopme_header_login', 'enabled', 0),
(414, 0, 'shopme', 'shopme_header_wishlist', 'enabled', 0),
(415, 0, 'shopme', 'shopme_header_compare', 'enabled', 0),
(416, 0, 'shopme', 'shopme_header_cart', 'enabled', 0),
(417, 0, 'shopme', 'shopme_header_search', 'enabled', 0),
(418, 0, 'shopme', 'shopme_refine_image_w', '190', 0),
(419, 0, 'shopme', 'shopme_refine_image_h', '190', 0),
(420, 0, 'shopme', 'shopme_category_thumb', '0', 0),
(421, 0, 'shopme', 'shopme_category_refine', '0', 0),
(422, 0, 'shopme', 'shopme_brands_per_row', 'grid3', 0),
(423, 0, 'shopme', 'shopme_brands_image_w', '240', 0),
(424, 0, 'shopme', 'shopme_brands_image_h', '115', 0),
(425, 0, 'shopme', 'shopme_default_view', 'grid', 0),
(426, 0, 'shopme', 'shopme_grid_category', 'grid3', 0),
(427, 0, 'shopme', 'shopme_grid_related', 'grid3', 0),
(110513, 0, 'blogsetting', 'blogsetting_post_thumbs_w', '848', 0),
(110512, 0, 'blogsetting', 'blogsetting_post_thumb', '1', 0),
(110511, 0, 'blogsetting', 'blogsetting_share', '1', 0),
(110510, 0, 'blogsetting', 'blogsetting_post_author', '1', 0),
(110509, 0, 'blogsetting', 'blogsetting_post_page_view', '1', 0),
(110508, 0, 'blogsetting', 'blogsetting_post_comments_count', '1', 0),
(110507, 0, 'blogsetting', 'blogsetting_post_date_added', '1', 0),
(110506, 0, 'blogsetting', 'blogsetting_author', '1', 0),
(110505, 0, 'blogsetting', 'blogsetting_page_view', '1', 0),
(110504, 0, 'blogsetting', 'blogsetting_comments_count', '1', 0),
(110503, 0, 'blogsetting', 'blogsetting_date_added', '1', 0),
(110502, 0, 'blogsetting', 'blogsetting_thumbs_h', '371', 0),
(110501, 0, 'blogsetting', 'blogsetting_thumbs_w', '500', 0),
(110500, 0, 'blogsetting', 'blogsetting_layout', '1', 0),
(110499, 0, 'blogsetting', 'blogsetting_blogs_per_page', '5', 0),
(110498, 0, 'blogsetting', 'blogsetting_home_meta_keyword', '{\"2\":\"\"}', 1),
(110497, 0, 'blogsetting', 'blogsetting_home_meta_description', '{\"2\":\"\"}', 1),
(110496, 0, 'blogsetting', 'blogsetting_home_description', '{\"2\":\"\"}', 1),
(110494, 0, 'blogsetting', 'blogsetting_home_title', '{\"2\":\"\"}', 1),
(110495, 0, 'blogsetting', 'blogsetting_home_page_title', '{\"2\":\"\"}', 1),
(109244, 0, 'mega_filter_seo', 'mega_filter_seo', '{\"enabled\":\"0\"}', 1),
(110519, 0, 'blogsetting', 'blogsetting_rel_characters', '100', 0),
(110520, 0, 'blogsetting', 'blogsetting_comment_per_page', '5', 0),
(110521, 0, 'blogsetting', 'blogsetting_comment_approve', '1', 0),
(110522, 0, 'blogsetting', 'blogsetting_comment_notification', '1', 0),
(110523, 0, 'blogsetting', 'blogsetting_author_change', '1', 0),
(110514, 0, 'blogsetting', 'blogsetting_post_thumbs_h', '471', 0),
(110515, 0, 'blogsetting', 'blogsetting_rel_blog_per_row', '2', 0),
(110516, 0, 'blogsetting', 'blogsetting_rel_thumb', '1', 0),
(110517, 0, 'blogsetting', 'blogsetting_rel_thumbs_w', '409', 0),
(110742, 0, 'cosyone', 'cosyone_use_font_light', '300', 0),
(110743, 0, 'cosyone', 'cosyone_use_font_regular', '400', 0),
(110744, 0, 'cosyone', 'cosyone_use_font_semibold', '500', 0),
(110745, 0, 'cosyone', 'cosyone_use_font_bold', '700', 0),
(110746, 0, 'cosyone', 'cosyone_use_custom_css', '0', 0),
(110747, 0, 'cosyone', 'cosyone_custom_css_content', '', 0),
(110748, 0, 'cosyone', 'cosyone_use_custom_javascript', '0', 0),
(110749, 0, 'cosyone', 'cosyone_custom_javascript_content', '', 0),
(110741, 0, 'cosyone', 'cosyone_font2_name', 'font-family: \'Roboto\', sans-serif;', 0),
(110739, 0, 'cosyone', 'cosyone_font1_name', 'font-family: \'Roboto\', sans-serif;', 0),
(110740, 0, 'cosyone', 'cosyone_font2_import', 'Roboto:400,300,500,700', 0),
(110738, 0, 'cosyone', 'cosyone_font1_import', 'Roboto:400,300,500,700', 0),
(110737, 0, 'cosyone', 'cosyone_use_custom_font', '1', 0),
(110736, 0, 'cosyone', 'cosyone_button2_hover_background', '8c0303', 0),
(111289, 0, 'config', 'config_admin_language', 'ru-ru', 0),
(773, 0, 'theme_default', 'theme_default_status', '1', 0),
(772, 0, 'theme_default', 'theme_default_directory', 'cosyone', 0),
(110735, 0, 'cosyone', 'cosyone_button2_hover_border', '8c0303', 0),
(110734, 0, 'cosyone', 'cosyone_button2_hover_color', 'ffffff', 0),
(110733, 0, 'cosyone', 'cosyone_button2_background', 'ffffff', 0),
(110732, 0, 'cosyone', 'cosyone_button2_border', '8c0303', 0),
(110731, 0, 'cosyone', 'cosyone_button2_color', '8c0303', 0),
(110730, 0, 'cosyone', 'cosyone_button_hover_background', '545454', 0),
(110729, 0, 'cosyone', 'cosyone_button_hover_border', '545454', 0),
(110728, 0, 'cosyone', 'cosyone_button_hover_color', 'ffffff', 0),
(110726, 0, 'cosyone', 'cosyone_button_border', '545454', 0),
(110727, 0, 'cosyone', 'cosyone_button_background', 'ffffff', 0),
(110725, 0, 'cosyone', 'cosyone_button_color', '545454', 0),
(110724, 0, 'cosyone', 'cosyone_icons_background_hover', '492a2f', 0),
(110723, 0, 'cosyone', 'cosyone_price_color', '8c0303', 0),
(110722, 0, 'cosyone', 'cosyone_salebadge_background', 'b01e3b', 0),
(110715, 0, 'cosyone', 'cosyone_menu_link_color_hover', 'ffffff', 0),
(110716, 0, 'cosyone', 'cosyone_menu_link_background_hover', '8c0303', 0),
(110717, 0, 'cosyone', 'cosyone_shortcut_separator', '', 0),
(110718, 0, 'cosyone', 'cosyone_link_hover_color', '8c0303', 0),
(110719, 0, 'cosyone', 'cosyone_primary_color', 'b01e3b', 0),
(110720, 0, 'cosyone', 'cosyone_secondary_color', '492a2f', 0),
(110721, 0, 'cosyone', 'cosyone_offer_color', 'b01e3b', 0),
(110714, 0, 'cosyone', 'cosyone_menu_link_color', '222226', 0),
(110713, 0, 'cosyone', 'cosyone_menu_background', 'ffffff', 0),
(110712, 0, 'cosyone', 'cosyone_top_border_link_hover', 'ffffff', 0),
(110711, 0, 'cosyone', 'cosyone_top_border_link', 'd7d9d9', 0),
(110710, 0, 'cosyone', 'cosyone_top_border_text', 'bdbfbf', 0),
(110709, 0, 'cosyone', 'cosyone_top_border_border', '2b2b2b', 0),
(110707, 0, 'cosyone', 'cosyone_custom_bg_icon', '', 0),
(110708, 0, 'cosyone', 'cosyone_top_border_background', '2b2b2b', 0),
(110706, 0, 'cosyone', 'cosyone_body_image', 'none.png', 0),
(110704, 0, 'cosyone', 'cosyone_container_layout', '', 0),
(110705, 0, 'cosyone', 'cosyone_body_background', 'ffffff', 0),
(110703, 0, 'cosyone', 'cosyone_use_custom', '1', 0),
(110697, 0, 'cosyone', 'cosyone_cookie_button_readmore', '{\"2\":\"\\u041f\\u043e\\u0434\\u0440\\u043e\\u0431\\u043d\\u0435\\u0435\"}', 1),
(110698, 0, 'cosyone', 'cosyone_cookie_button_accept', '{\"2\":\"Accept\"}', 1),
(110699, 0, 'cosyone', 'cosyone_use_ie', '0', 0),
(110700, 0, 'cosyone', 'cosyone_ie_text', '{\"2\":\"\"}', 1),
(110701, 0, 'cosyone', 'cosyone_ie_url', '', 0),
(110702, 0, 'cosyone', 'cosyone_ie_update_text', '{\"2\":\"\"}', 1),
(110692, 0, 'cosyone', 'cosyone_footer_custom_block', '{\"2\":\"&lt;p&gt;Ut tellus dolor, dapibus eget, elementum vel, cursus eleifend, elit. Aenean auctor wisi et urna. Aliquam erat volutpat. Duis ac turpis. Donec sit amet eros.&lt;\\/p&gt;&lt;p&gt;Email us: &lt;a href=&quot;mailto:company@companyname.com&quot;&gt;company@company.com&lt;\\/a&gt;&lt;br&gt;&lt;\\/p&gt;\"}', 1),
(110693, 0, 'cosyone', 'cosyone_footer_payment_icon', '', 0),
(110694, 0, 'cosyone', 'cosyone_use_cookie', '0', 0),
(110695, 0, 'cosyone', 'cosyone_cookie_text', '{\"2\":\"This website uses cookies in order to work correctly. No personal data is stored\"}', 1),
(110696, 0, 'cosyone', 'cosyone_readmore_url', 'index.php?route=information/information&amp;information_id=3', 0),
(110691, 0, 'cosyone', 'cosyone_footer_custom_block_title', '{\"2\":\"\\u041e \\u043d\\u0430\\u0441\"}', 1),
(110682, 0, 'cosyone', 'cosyone_text_ql', '{\"2\":\"Quicklook\"}', 1),
(110683, 0, 'cosyone', 'cosyone_default_product_style', 'style-2', 0),
(110684, 0, 'cosyone', 'cosyone_default_view', 'grid', 0),
(110685, 0, 'cosyone', 'cosyone_grid_category', 'grid3', 0),
(110686, 0, 'cosyone', 'cosyone_grid_related', 'grid3', 0),
(110687, 0, 'cosyone', 'cosyone_rollover_effect', 'enabled', 0),
(110690, 0, 'cosyone', 'cosyone_footer_columns', 'column-1', 0),
(110689, 0, 'cosyone', 'cosyone_brand', 'enabled', 0),
(110688, 0, 'cosyone', 'cosyone_percentage_sale_badge', 'enabled', 0),
(110681, 0, 'cosyone', 'cosyone_google_map', '&lt;iframe src=&quot;https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2747.844484286991!2d30.73512050521403!3d46.47158831182546!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40c63183b9f31953%3A0x2a269ca5534fb7e4!2z0LLRg9C70LjRhtGPINCc0LDQu9CwINCQ0YDQvdCw0YPRgtGB0YzQutCwLCA2NCwg0J7QtNC10YHQsCwg0J7QtNC10YHRjNC60LAg0L7QsdC70LDRgdGC0Yw!5e0!3m2!1sru!2sua!4v1468840192551&quot; width=&quot;600&quot; height=&quot;450&quot; frameborder=&quot;0&quot; style=&quot;border:0&quot; allowfullscreen&gt;&lt;/iframe&gt;', 0),
(110680, 0, 'cosyone', 'cosyone_refine_image_h', '160', 0),
(110679, 0, 'cosyone', 'cosyone_refine_image_w', '250', 0),
(110677, 0, 'cosyone', 'cosyone_category_refine', 'enabled', 0),
(110678, 0, 'cosyone', 'cosyone_category_per_row', 'grid4', 0),
(110676, 0, 'cosyone', 'cosyone_category_thumb', 'enabled', 0),
(110675, 0, 'cosyone', 'cosyone_image_options', 'thumbs', 0),
(110674, 0, 'cosyone', 'cosyone_product_zoom', 'cloud-zoom-gallery', 0),
(110673, 0, 'cosyone', 'cosyone_product_hurry', 'header_border', 0),
(110672, 0, 'cosyone', 'cosyone_product_countdown', 'header_border', 0),
(814, 0, 'cosyone_productbrand', 'cosyone_productbrand_width', '240', 0),
(815, 0, 'cosyone_productbrand', 'cosyone_productbrand_height', '115', 0),
(816, 0, 'cosyone_productbrand', 'cosyone_productbrand_status', '1', 0),
(3736, 0, 'cosyone_category', 'cosyone_category_status', '1', 0),
(3825, 0, 'showintabs', 'showintabs_tab', '{\"1\":{\"title\":{\"1\":\"Popular\"},\"data_source\":\"PG\",\"product_group\":\"PP\",\"filter_category\":\"ALL\",\"filter_manufacturer\":\"ALL\",\"sort\":\"pd.name\"},\"2\":{\"title\":{\"1\":\"Latest\"},\"data_source\":\"PG\",\"product_group\":\"LA\",\"filter_category\":\"ALL\",\"filter_manufacturer\":\"ALL\",\"sort\":\"pd.name\"},\"5\":{\"title\":{\"1\":\"Top rated\"},\"product_group\":\"BS\",\"data_source\":\"CQ\",\"filter_category\":\"ALL\",\"filter_manufacturer\":\"ALL\",\"sort\":\"rating\"}}', 1),
(2408, 0, 'testimonial', 'testimonial_admin_approved', '0', 0),
(2409, 0, 'testimonial', 'testimonial_default_rating', '3', 0),
(3824, 0, 'cosyone_twitterfeed', 'cosyone_twitterfeed_status', '1', 0),
(3823, 0, 'cosyone_twitterfeed', 'cosyone_twitterfeed_limit', '1', 0),
(3821, 0, 'cosyone_twitterfeed', 'cosyone_twitterfeed_title', '{\"en\":\"Latest Tweets\", \"1\":\"Latest Tweets\", \"2\":\"Latest Tweets\"}', 1),
(3822, 0, 'cosyone_twitterfeed', 'cosyone_twitterfeed_widget_id', 'Enter your twitter username here', 0),
(2642, 0, 'newsletter', 'newsletter_global_status', '1', 0),
(3190, 0, 'd_ajax_search', 'd_ajax_search', '{\"search_on_off\":\"1\",\"search_width\":\"100%\",\"search_max_symbols\":\"14\",\"search_max_results\":\"5\",\"search_first_symbols\":\"on\",\"search_product_on\":\"on\",\"search_product_sort\":\"1\",\"search_category_on\":\"on\",\"search_category_sort\":\"2\",\"search_manufacturer_on\":\"on\",\"search_manufacturer_sort\":\"3\",\"search_information_on\":\"on\",\"search_information_sort\":\"4\",\"search_price\":\"on\",\"search_special\":\"on\",\"search_tax\":\"on\"}', 1),
(108632, 0, 'theme_default', 'theme_default_image_compare_height', '100', 0),
(108631, 0, 'theme_default', 'theme_default_image_compare_width', '100', 0),
(108630, 0, 'theme_default', 'theme_default_image_related_height', '262', 0),
(108629, 0, 'theme_default', 'theme_default_image_related_width', '262', 0),
(108628, 0, 'theme_default', 'theme_default_image_additional_height', '100', 0),
(108627, 0, 'theme_default', 'theme_default_image_additional_width', '100', 0),
(108626, 0, 'theme_default', 'theme_default_image_product_height', '262', 0),
(108625, 0, 'theme_default', 'theme_default_image_product_width', '262', 0),
(108624, 0, 'theme_default', 'theme_default_image_popup_height', '750', 0),
(108623, 0, 'theme_default', 'theme_default_image_popup_width', '750', 0),
(108622, 0, 'theme_default', 'theme_default_image_thumb_height', '360', 0),
(108621, 0, 'theme_default', 'theme_default_image_thumb_width', '360', 0),
(108620, 0, 'theme_default', 'theme_default_image_category_height', '150', 0),
(108619, 0, 'theme_default', 'theme_default_image_category_width', '248', 0),
(111362, 0, 'config', 'config_error_filename', 'error.log', 0),
(111361, 0, 'config', 'config_error_log', '0', 0),
(111360, 0, 'config', 'config_error_display', '1', 0),
(111359, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(111358, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(111357, 0, 'config', 'config_file_max_size', '300000', 0),
(110518, 0, 'blogsetting', 'blogsetting_rel_thumbs_h', '227', 0),
(110671, 0, 'cosyone', 'cosyone_product_yousave', 'enabled', 0),
(110669, 0, 'cosyone', 'cosyone_menu_custom_block_content', '{\"2\":\"\"}', 1),
(110667, 0, 'cosyone', 'cosyone_menu_block_width', '1140', 0),
(110668, 0, 'cosyone', 'cosyone_custom_menu_block_title', '{\"2\":\"Custom block\"}', 1),
(110670, 0, 'cosyone', 'cosyone_product_share', 'content', 0),
(110666, 0, 'cosyone', 'cosyone_custom_menu_block', 'disabled', 0),
(110665, 0, 'cosyone', 'cosyone_custom_menu_url6', '##', 0),
(110660, 0, 'cosyone', 'cosyone_custom_menu_title4', '{\"2\":\"\"}', 1),
(110661, 0, 'cosyone', 'cosyone_custom_menu_url4', '', 0),
(110662, 0, 'cosyone', 'cosyone_custom_menu_title5', '{\"2\":\"5545\"}', 1),
(110663, 0, 'cosyone', 'cosyone_custom_menu_url5', '#', 0),
(110664, 0, 'cosyone', 'cosyone_custom_menu_title6', '{\"2\":\"ttttt\"}', 1),
(110659, 0, 'cosyone', 'cosyone_custom_menu_url3', 'http://testtheme.net/index.php?route=blog/home', 0),
(110658, 0, 'cosyone', 'cosyone_custom_menu_title3', '{\"2\":\"Blog\"}', 1),
(110657, 0, 'cosyone', 'cosyone_custom_menu_url2', '', 0),
(110655, 0, 'cosyone', 'cosyone_custom_menu_url1', '', 0),
(110656, 0, 'cosyone', 'cosyone_custom_menu_title2', '{\"2\":\"\"}', 1),
(110654, 0, 'cosyone', 'cosyone_custom_menu_title1', '{\"2\":\"\"}', 1),
(110652, 0, 'cosyone', 'cosyone_menu_mega_second_image_w', '165', 0),
(110653, 0, 'cosyone', 'cosyone_menu_mega_second_image_h', '100', 0),
(110651, 0, 'cosyone', 'cosyone_menu_mega_second_thumb', 'disabled', 0),
(110650, 0, 'cosyone', 'cosyone_menu_border', 'header_border', 0),
(110649, 0, 'cosyone', 'cosyone_show_home_icon', 'enabled', 0),
(110648, 0, 'cosyone', 'cosyone_menu_sticky', 'sticky_menu', 0),
(110647, 0, 'cosyone', 'cosyone_top_promo_message', '{\"2\":\"&lt;b&gt;Free shipping&lt;\\/b&gt; on orders over $100. Need Help? &lt;b&gt;866.526.3979&lt;\\/b&gt;\"}', 1),
(110646, 0, 'cosyone', 'cosyone_header_cart', 'enabled', 0),
(110645, 0, 'cosyone', 'cosyone_header_search', 'enabled', 0),
(110644, 0, 'cosyone', 'cosyone_header_compare', 'enabled', 0),
(110643, 0, 'cosyone', 'cosyone_header_wishlist', 'enabled', 0),
(110642, 0, 'cosyone', 'cosyone_header_login', 'enabled', 0),
(110641, 0, 'cosyone', 'cosyone_header_style', 'header1', 0),
(110640, 0, 'cosyone', 'cosyone_use_retina', '', 0),
(110639, 0, 'cosyone', 'cosyone_use_breadcrumb', '', 0),
(110638, 0, 'cosyone', 'cosyone_use_responsive', 'enabled', 0),
(110637, 0, 'cosyone', 'cosyone_max_width', '1140', 0),
(111286, 0, 'config', 'config_country_id', '220', 0),
(111287, 0, 'config', 'config_zone_id', '3495', 0),
(111288, 0, 'config', 'config_language', 'ru-ru', 0),
(111275, 0, 'config', 'config_layout_id', '4', 0),
(111276, 0, 'config', 'config_name', 'fidelitti', 0),
(111277, 0, 'config', 'config_owner', 'fidelitti', 0),
(111278, 0, 'config', 'config_address', 'Address 1', 0),
(111279, 0, 'config', 'config_geocode', '', 0),
(111280, 0, 'config', 'config_email', 'iragrinchuk@gmail.com', 0),
(111281, 0, 'config', 'config_telephone', '123456789', 0),
(111282, 0, 'config', 'config_fax', '', 0),
(111283, 0, 'config', 'config_image', '', 0),
(111284, 0, 'config', 'config_open', '', 0),
(111285, 0, 'config', 'config_comment', '', 0),
(111274, 0, 'config', 'config_theme', 'theme_default', 0),
(111273, 0, 'config', 'config_meta_keyword', '', 0),
(111272, 0, 'config', 'config_meta_description', 'fidelitti', 0),
(111271, 0, 'config', 'config_meta_title', 'fidelitti', 0),
(110849, 0, 'mega_filter_module', 'mega_filter_module', '{\"1\":{\"title\":{\"2\":\"Mega Filter PRO\"},\"layout_id\":[\"3\"],\"store_id\":[0],\"position\":\"column_left\",\"status\":\"1\",\"sort_order\":\"\"}}', 1),
(110850, 0, 'mega_filter_settings', 'mega_filter_settings', '{\"show_number_of_products\":\"1\",\"calculate_number_of_products\":\"1\",\"show_loader_over_results\":\"1\",\"css_style\":\"\",\"content_selector\":\"#mfilter-content-container\",\"refresh_results\":\"immediately\",\"attribs\":{\"price\":{\"enabled\":\"1\",\"sort_order\":\"-1\"}},\"layout_c\":\"3\",\"display_live_filter\":{\"items\":\"1\"}}', 1),
(110851, 0, 'mega_filter_status', 'mega_filter_status', '1', 0),
(110852, 0, 'mfilter_version', 'mfilter_version', '2.0.2.1', 0),
(110868, 0, 'adv_ajaxfilter', 'adv_ajaxfilter_status', '1', 0),
(110869, 0, 'adv_ajaxfilter', 'adv_ajaxfilter_setting', '{\"price_slider\":\"1\",\"display_manufacturer\":\"none\",\"display_categories\":\"none\",\"display_filters\":\"checkbox\",\"display_option_2\":\"none\",\"display_option_1\":\"none\",\"display_option_5\":\"none\",\"display_option_11\":\"none\",\"display_attribute_4\":\"checkbox\",\"display_attribute_5\":\"checkbox\",\"display_attribute_6\":\"checkbox\",\"display_attribute_7\":\"checkbox\",\"display_attribute_8\":\"checkbox\",\"display_attribute_9\":\"checkbox\",\"display_attribute_10\":\"checkbox\",\"display_attribute_11\":\"checkbox\",\"display_attribute_3\":\"checkbox\",\"display_attribute_1\":\"checkbox\",\"display_attribute_2\":\"checkbox\",\"attr_delimeter\":\":\",\"tax\":\"0\",\"option_mode\":\"or\",\"filter_group_mode\":\"or\",\"attribute_mode\":\"or\",\"attribute_value_mode\":\"or\",\"attr_group\":\"0\",\"adv_ajaxfilter_container\":\"list\"}', 1),
(110870, 0, 'adv_ajaxfilter', 'adv_ajaxfilter_module', '[{\"module_title\":\"\",\"module_color\":\"0088CC\",\"module_border_color\":\"39C6FA\",\"module_hover_color\":\"2896FA\",\"module_text_color\":\"FFFFFF\"}]', 1),
(111523, 0, 'quickcheckout', 'quickcheckout_delivery_days_of_week', '', 0),
(111524, 0, 'quickcheckout', 'quickcheckout_countdown', '0', 0),
(111522, 0, 'quickcheckout', 'quickcheckout_delivery_max', '30', 0),
(111521, 0, 'quickcheckout', 'quickcheckout_delivery_min', '1', 0),
(111520, 0, 'quickcheckout', 'quickcheckout_delivery_unavailable', '&quot;31-10-2013&quot;, &quot;08-11-2013&quot;, &quot;25-12-2013&quot;', 0),
(111518, 0, 'quickcheckout', 'quickcheckout_delivery_time', '0', 0),
(111519, 0, 'quickcheckout', 'quickcheckout_delivery_required', '0', 0),
(111516, 0, 'quickcheckout', 'quickcheckout_survey_type', '0', 0),
(111517, 0, 'quickcheckout', 'quickcheckout_delivery', '0', 0),
(111515, 0, 'quickcheckout', 'quickcheckout_survey_text', '{\"3\":\"\",\"2\":\"\",\"4\":\"\"}', 1),
(111513, 0, 'quickcheckout', 'quickcheckout_survey', '0', 0),
(111514, 0, 'quickcheckout', 'quickcheckout_survey_required', '0', 0),
(111512, 0, 'quickcheckout', 'quickcheckout_html_footer', '{\"3\":\"\",\"2\":\"\",\"4\":\"\"}', 1),
(111511, 0, 'quickcheckout', 'quickcheckout_html_header', '{\"3\":\"\",\"2\":\"\",\"4\":\"\"}', 1),
(111508, 0, 'quickcheckout', 'quickcheckout_shipping_module', '1', 0),
(111509, 0, 'quickcheckout', 'quickcheckout_payment_module', '1', 0),
(111510, 0, 'quickcheckout', 'quickcheckout_login_module', '1', 0),
(111506, 0, 'quickcheckout', 'quickcheckout_reward', '1', 0),
(111507, 0, 'quickcheckout', 'quickcheckout_cart', '1', 0),
(111504, 0, 'quickcheckout', 'quickcheckout_coupon', '1', 0),
(111505, 0, 'quickcheckout', 'quickcheckout_voucher', '0', 0),
(111503, 0, 'quickcheckout', 'quickcheckout_field_register', '{\"display\":\"on\",\"sort_order\":\"\"}', 1),
(111502, 0, 'quickcheckout', 'quickcheckout_field_newsletter', '{\"display\":\"on\",\"default\":\"on\",\"sort_order\":\"\"}', 1),
(111501, 0, 'quickcheckout', 'quickcheckout_field_zone', '{\"display\":\"on\",\"default\":\"1\",\"sort_order\":\"14\"}', 1),
(111500, 0, 'quickcheckout', 'quickcheckout_field_country', '{\"display\":\"on\",\"required\":\"on\",\"default\":\"1\",\"sort_order\":\"13\"}', 1),
(111499, 0, 'quickcheckout', 'quickcheckout_field_postcode', '{\"display\":\"on\",\"default\":\"\",\"sort_order\":\"12\"}', 1),
(111498, 0, 'quickcheckout', 'quickcheckout_field_city', '{\"display\":\"on\",\"required\":\"on\",\"default\":\"\",\"sort_order\":\"11\"}', 1),
(111496, 0, 'quickcheckout', 'quickcheckout_field_address_1', '{\"display\":\"on\",\"required\":\"on\",\"default\":\"\",\"sort_order\":\"9\"}', 1),
(111497, 0, 'quickcheckout', 'quickcheckout_field_address_2', '{\"default\":\"\",\"sort_order\":\"10\"}', 1),
(111495, 0, 'quickcheckout', 'quickcheckout_field_customer_group', '{\"display\":\"on\",\"sort_order\":\"7\"}', 1),
(111494, 0, 'quickcheckout', 'quickcheckout_field_company', '{\"display\":\"on\",\"default\":\"\",\"sort_order\":\"6\"}', 1),
(111493, 0, 'quickcheckout', 'quickcheckout_field_fax', '{\"default\":\"\",\"sort_order\":\"5\"}', 1),
(111492, 0, 'quickcheckout', 'quickcheckout_field_telephone', '{\"display\":\"on\",\"required\":\"on\",\"default\":\"\",\"sort_order\":\"4\"}', 1),
(111491, 0, 'quickcheckout', 'quickcheckout_field_email', '{\"display\":\"on\",\"required\":\"on\",\"default\":\"\",\"sort_order\":\"3\"}', 1),
(111490, 0, 'quickcheckout', 'quickcheckout_field_lastname', '{\"display\":\"on\",\"required\":\"on\",\"default\":\"\",\"sort_order\":\"2\"}', 1),
(111489, 0, 'quickcheckout', 'quickcheckout_field_firstname', '{\"display\":\"on\",\"required\":\"on\",\"default\":\"\",\"sort_order\":\"1\"}', 1),
(111488, 0, 'quickcheckout', 'quickcheckout_shipping_reload', '1', 0),
(111487, 0, 'quickcheckout', 'quickcheckout_payment_reload', '0', 0),
(111486, 0, 'quickcheckout', 'quickcheckout_country_reload', '1', 0),
(111485, 0, 'quickcheckout', 'quickcheckout_responsive', '0', 0),
(111484, 0, 'quickcheckout', 'quickcheckout_auto_submit', '0', 0),
(111483, 0, 'quickcheckout', 'quickcheckout_debug', '0', 0),
(111482, 0, 'quickcheckout', 'quickcheckout_slide_effect', '0', 0),
(111480, 0, 'quickcheckout', 'quickcheckout_text_error', '1', 0),
(111481, 0, 'quickcheckout', 'quickcheckout_layout', '2', 0),
(111479, 0, 'quickcheckout', 'quickcheckout_highlight_error', '1', 0),
(111478, 0, 'quickcheckout', 'quickcheckout_edit_cart', '1', 0),
(111477, 0, 'quickcheckout', 'quickcheckout_shipping', '1', 0),
(111476, 0, 'quickcheckout', 'quickcheckout_payment', '1', 0),
(111475, 0, 'quickcheckout', 'quickcheckout_payment_logo', '1', 0),
(111474, 0, 'quickcheckout', 'quickcheckout_load_screen', '1', 0),
(111473, 0, 'quickcheckout', 'quickcheckout_status', '1', 0),
(111526, 0, 'quickcheckout', 'quickcheckout_countdown_date_start', '', 0),
(111527, 0, 'quickcheckout', 'quickcheckout_countdown_date_end', '', 0),
(111528, 0, 'quickcheckout', 'quickcheckout_countdown_time', '', 0),
(111529, 0, 'quickcheckout', 'quickcheckout_countdown_text', '{\"3\":\"\",\"2\":\"\",\"4\":\"\"}', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_stock_status`
--

CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 2, 'In Stock'),
(8, 2, 'Pre-Order'),
(5, 2, 'Out Of Stock'),
(6, 2, '2-3 Days'),
(7, 3, 'In Stock'),
(8, 3, 'Pre-Order'),
(5, 3, 'Out Of Stock'),
(6, 3, '2-3 Days');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_store`
--

CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tab`
--

CREATE TABLE `oc_tab` (
  `tab_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `position` tinyint(1) NOT NULL DEFAULT '1',
  `show_empty` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tab_description`
--

CREATE TABLE `oc_tab_description` (
  `tab_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tag_cloud`
--

CREATE TABLE `oc_tag_cloud` (
  `qty` int(11) NOT NULL,
  `tag` varchar(255) COLLATE utf8_bin NOT NULL,
  `language_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `oc_tag_cloud`
--

INSERT INTO `oc_tag_cloud` (`qty`, `tag`, `language_id`, `store_id`) VALUES
(1, 'Apple', 1, 0),
(1, 'iPhone', 1, 0),
(1, 'Canon', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_class`
--

CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rate`
--

CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rate_to_customer_group`
--

CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rule`
--

CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_testimonial`
--

CREATE TABLE `oc_testimonial` (
  `testimonial_id` int(11) NOT NULL,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(96) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `rating` int(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `oc_testimonial`
--

INSERT INTO `oc_testimonial` (`testimonial_id`, `name`, `city`, `email`, `status`, `rating`, `date_added`) VALUES
(1, 'John Doe', 'New York', 'sample@example.com', 1, 5, '2015-03-06 21:08:34'),
(2, 'Johanna Doe', 'Stockholm', 'sample@example.com', 1, 5, '2015-03-06 21:09:23'),
(3, 'Some Guy', 'London', 'sample@example.com', 1, 4, '2015-03-06 21:10:02'),
(4, 'Steve Jobs', 'Los Angeles', 'sample@example.com', 1, 5, '2015-03-06 21:10:46'),
(5, 'Karl', 'Madrid', 'sample@example.com', 1, 5, '2015-03-06 21:11:26'),
(6, 'Lorem', 'Ipsum', 'test@nomail.com', 1, 5, '2016-07-20 11:03:21'),
(7, 'Lorem ', 'Ipsum', 'john@yopmail.com', 1, 3, '2016-07-20 11:03:59'),
(8, 'John', 'Ipsum', 'huiuf@hg.ui', 1, 4, '2016-07-20 11:04:43');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_testimonial_description`
--

CREATE TABLE `oc_testimonial_description` (
  `testimonial_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `oc_testimonial_description`
--

INSERT INTO `oc_testimonial_description` (`testimonial_id`, `language_id`, `title`, `description`) VALUES
(1, 1, 'Testimonial Sample Title', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
(2, 1, 'Testimonial Sample Title 2', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
(3, 1, 'Testimonial Sample Title 3', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
(4, 1, 'Testimonial Sample Title 4', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
(5, 1, 'Testimonial Sample Title 5', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'),
(6, 2, 'Lorem ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(7, 2, 'Ipsum', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(8, 2, 'John', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_upload`
--

CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_upload`
--

INSERT INTO `oc_upload` (`upload_id`, `name`, `filename`, `code`, `date_added`) VALUES
(1, 'slideshow-full-1980x550.png', 'slideshow-full-1980x550.png.ChQUIAHrsMas8YjFVVJ6jxjsXIFH8Nll', '94e9795ddfe024f4c3aa4f3b829ec91f1a69a4a1', '2016-07-20 10:31:59');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_url_alias`
--

CREATE TABLE `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(824, 'product_id=48', 'ipod-classic'),
(834, 'category_id=26', 'pc'),
(835, 'category_id=27', 'mac'),
(730, 'manufacturer_id=8', 'apple'),
(772, 'information_id=4', 'about_us'),
(859, 'category_id=34', 'mp3-players'),
(781, 'category_id=36', 'test2'),
(858, 'category_id=18', 'laptop-notebook'),
(775, 'category_id=46', 'macs'),
(776, 'category_id=45', 'windows'),
(856, 'category_id=25', 'component'),
(778, 'category_id=29', 'mouse'),
(779, 'category_id=28', 'monitor'),
(780, 'category_id=35', 'test1'),
(782, 'category_id=30', 'printer'),
(783, 'category_id=31', 'scanner'),
(784, 'category_id=32', 'web-camera'),
(862, 'category_id=57', 'tablet'),
(861, 'category_id=17', 'software'),
(860, 'category_id=24', 'smartphone'),
(865, 'category_id=33', 'camera'),
(790, 'category_id=43', 'test11'),
(791, 'category_id=44', 'test12'),
(792, 'category_id=47', 'test15'),
(793, 'category_id=48', 'test16'),
(794, 'category_id=49', 'test17'),
(795, 'category_id=50', 'test18'),
(796, 'category_id=51', 'test19'),
(797, 'category_id=52', 'test20'),
(798, 'category_id=58', 'test25'),
(799, 'category_id=53', 'test21'),
(800, 'category_id=54', 'test22'),
(801, 'category_id=55', 'test23'),
(802, 'category_id=56', 'test24'),
(803, 'category_id=38', 'test4'),
(804, 'category_id=37', 'test5'),
(805, 'category_id=39', 'test6'),
(806, 'category_id=40', 'test7'),
(807, 'category_id=41', 'test8'),
(808, 'category_id=42', 'test9'),
(867, 'product_id=30', 'canon-eos-5d'),
(840, 'product_id=47', 'hp-lp3065'),
(811, 'product_id=28', 'htc-touch-hd'),
(812, 'product_id=43', 'macbook'),
(813, 'product_id=44', 'macbook-air'),
(814, 'product_id=45', 'macbook-pro'),
(905, 'product_id=31', 'nikon-d300'),
(817, 'product_id=29', 'palm-treo-pro'),
(818, 'product_id=35', 'product-8'),
(819, 'product_id=49', 'samsung-galaxy-tab-10-1'),
(820, 'product_id=33', 'samsung-syncmaster-941bw'),
(821, 'product_id=46', 'sony-vaio'),
(837, 'product_id=41', 'imac'),
(823, 'product_id=40', 'iphone'),
(825, 'product_id=36', 'ipod-nano'),
(906, 'product_id=34', 'ipod-shuffle'),
(827, 'product_id=32', 'ipod-touch'),
(828, 'manufacturer_id=9', 'canon'),
(829, 'manufacturer_id=5', 'htc'),
(830, 'manufacturer_id=7', 'hewlett-packard'),
(831, 'manufacturer_id=6', 'palm'),
(832, 'manufacturer_id=10', 'sony'),
(841, 'information_id=6', 'delivery'),
(842, 'information_id=3', 'privacy'),
(843, 'information_id=5', 'terms'),
(869, 'account/wishlist', 'wishlist'),
(870, 'account/account', 'my-account'),
(871, 'checkout/cart', 'shopping-cart'),
(872, 'checkout/checkout', 'checkout'),
(873, 'account/login', 'login'),
(874, 'account/logout', 'logout'),
(875, 'account/order', 'order-history'),
(876, 'account/newsletter', 'newsletter'),
(877, 'product/special', 'specials'),
(878, 'affiliate/account', 'affiliates'),
(879, 'checkout/voucher', 'gift-vouchers'),
(880, 'product/manufacturer', 'brands'),
(881, 'information/contact', 'contact-us'),
(882, 'account/return/insert', 'request-return'),
(883, 'information/sitemap', 'sitemap'),
(884, 'account/forgotten', 'forgot-password'),
(885, 'account/download', 'downloads'),
(886, 'account/return', 'returns'),
(887, 'account/transaction', 'transactions'),
(888, 'account/register', 'create-account'),
(889, 'product/compare', 'compare-products'),
(890, 'product/search', 'search'),
(891, 'account/edit', 'edit-account'),
(892, 'account/password', 'change-password'),
(893, 'account/address', 'address-book'),
(894, 'account/reward', 'reward-points'),
(895, 'affiliate/edit', 'edit-affiliate-account'),
(896, 'affiliate/password', 'change-affiliate-password'),
(897, 'affiliate/payment', 'affiliate-payment-options'),
(898, 'affiliate/tracking', 'affiliate-tracking-code'),
(899, 'affiliate/transaction', 'affiliate-transactions'),
(900, 'affiliate/logout', 'affiliate-logout'),
(901, 'affiliate/forgotten', 'affiliate-forgot-password'),
(902, 'affiliate/register', 'create-affiliate-account'),
(903, 'affiliate/login', 'affiliate-login'),
(904, 'common/home', ''),
(915, 'product_id=50', '-1'),
(916, 'product_id=51', '-2'),
(917, 'product_id=52', '-3'),
(918, 'product_id=53', '-4'),
(919, 'product_id=54', '-5'),
(920, 'product_id=55', '-6'),
(921, 'product_id=56', '-7'),
(922, 'product_id=57', '-8');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_user`
--

CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '69cab140edb6bfde263615efb4ca08adcec8c6bd', '65RxkeSiw', 'John', 'Doe', 'iragrinchuk@gmail.com', '', '', '127.0.0.1', 1, '2016-07-18 12:05:12');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_user_group`
--

CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{\"access\":[\"analytics\\/google_analytics\",\"blog\\/blog\",\"blog\\/blog_category\",\"blog\\/blog_comment\",\"blog\\/blog_setting\",\"captcha\\/basic_captcha\",\"captcha\\/google_captcha\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/question\",\"catalog\\/recurring\",\"catalog\\/review\",\"catalog\\/tab\",\"catalog\\/testimonial\",\"common\\/column_left\",\"common\\/filemanager\",\"common\\/menu\",\"common\\/profile\",\"common\\/stats\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/theme\",\"event\\/theme\",\"extension\\/analytics\",\"extension\\/captcha\",\"extension\\/feed\",\"extension\\/fraud\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/module\",\"extension\\/newsletter\",\"extension\\/openbay\",\"extension\\/payment\",\"extension\\/shipping\",\"extension\\/theme\",\"extension\\/total\",\"feed\\/google_base\",\"feed\\/google_sitemap\",\"feed\\/openbaypro\",\"fraud\\/fraudlabspro\",\"fraud\\/ip\",\"fraud\\/maxmind\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"module\\/account\",\"module\\/adv_ajaxfilter\",\"module\\/affiliate\",\"module\\/amazon_login\",\"module\\/amazon_pay\",\"module\\/banner\",\"module\\/bestseller\",\"module\\/blog_category\",\"module\\/blog_latest\",\"module\\/carousel\",\"module\\/category\",\"module\\/cosyone\",\"module\\/cosyone_banner\",\"module\\/cosyone_bannerwall\",\"module\\/cosyone_carousel\",\"module\\/cosyone_category\",\"module\\/cosyone_content\",\"module\\/cosyone_deals\",\"module\\/cosyone_productbrand\",\"module\\/cosyone_recently\",\"module\\/cosyone_socials\",\"module\\/cosyone_tagcloud\",\"module\\/cosyone_testimonial\",\"module\\/cosyone_twitterfeed\",\"module\\/d_ajax_search\",\"module\\/ebay_listing\",\"module\\/faqmanager\",\"module\\/featured\",\"module\\/filter\",\"module\\/google_hangouts\",\"module\\/html\",\"module\\/information\",\"module\\/latest\",\"module\\/laybuy_layout\",\"module\\/mega_filter\",\"module\\/newsletter\",\"module\\/pp_button\",\"module\\/pp_login\",\"module\\/quickcheckout\",\"module\\/revslideropencart\",\"module\\/revslideroutput\",\"module\\/sagepay_direct_cards\",\"module\\/sagepay_server_cards\",\"module\\/showintabs\",\"module\\/showintabs_output\",\"module\\/slideshow\",\"module\\/special\",\"module\\/store\",\"openbay\\/amazon\",\"openbay\\/amazon_listing\",\"openbay\\/amazon_product\",\"openbay\\/amazonus\",\"openbay\\/amazonus_listing\",\"openbay\\/amazonus_product\",\"openbay\\/ebay\",\"openbay\\/ebay_profile\",\"openbay\\/ebay_template\",\"openbay\\/etsy\",\"openbay\\/etsy_product\",\"openbay\\/etsy_shipping\",\"openbay\\/etsy_shop\",\"openbay\\/fba\",\"payment\\/amazon_login_pay\",\"payment\\/authorizenet_aim\",\"payment\\/authorizenet_sim\",\"payment\\/bank_transfer\",\"payment\\/bluepay_hosted\",\"payment\\/bluepay_redirect\",\"payment\\/cardinity\",\"payment\\/cheque\",\"payment\\/cod\",\"payment\\/eway\",\"payment\\/firstdata\",\"payment\\/firstdata_remote\",\"payment\\/free_checkout\",\"payment\\/g2apay\",\"payment\\/globalpay\",\"payment\\/globalpay_remote\",\"payment\\/klarna_account\",\"payment\\/klarna_invoice\",\"payment\\/laybuy\",\"payment\\/liqpay\",\"payment\\/nochex\",\"payment\\/paymate\",\"payment\\/paypoint\",\"payment\\/payza\",\"payment\\/perpetual_payments\",\"payment\\/pp_express\",\"payment\\/pp_payflow\",\"payment\\/pp_payflow_iframe\",\"payment\\/pp_pro\",\"payment\\/pp_pro_iframe\",\"payment\\/pp_standard\",\"payment\\/realex\",\"payment\\/realex_remote\",\"payment\\/sagepay_direct\",\"payment\\/sagepay_server\",\"payment\\/sagepay_us\",\"payment\\/securetrading_pp\",\"payment\\/securetrading_ws\",\"payment\\/skrill\",\"payment\\/twocheckout\",\"payment\\/web_payment_software\",\"payment\\/worldpay\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"shipping\\/auspost\",\"shipping\\/citylink\",\"shipping\\/fedex\",\"shipping\\/flat\",\"shipping\\/free\",\"shipping\\/item\",\"shipping\\/parcelforce_48\",\"shipping\\/pickup\",\"shipping\\/royal_mail\",\"shipping\\/ups\",\"shipping\\/usps\",\"shipping\\/weight\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"theme\\/theme_default\",\"tool\\/backup\",\"tool\\/error_log\",\"tool\\/upload\",\"total\\/coupon\",\"total\\/credit\",\"total\\/handling\",\"total\\/klarna_fee\",\"total\\/low_order_fee\",\"total\\/reward\",\"total\\/shipping\",\"total\\/sub_total\",\"total\\/tax\",\"total\\/total\",\"total\\/voucher\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"module\\/mega_filter\",\"module\\/mega_filter\",\"module\\/category\",\"module\\/filter\",\"module\\/adv_ajaxfilter\",\"module\\/mega_filter\",\"module\\/adv_ajaxfilter\",\"module\\/quickcheckout\"],\"modify\":[\"analytics\\/google_analytics\",\"blog\\/blog\",\"blog\\/blog_category\",\"blog\\/blog_comment\",\"blog\\/blog_setting\",\"captcha\\/basic_captcha\",\"captcha\\/google_captcha\",\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/question\",\"catalog\\/recurring\",\"catalog\\/review\",\"catalog\\/tab\",\"catalog\\/testimonial\",\"common\\/column_left\",\"common\\/filemanager\",\"common\\/menu\",\"common\\/profile\",\"common\\/stats\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_group\",\"design\\/banner\",\"design\\/language\",\"design\\/layout\",\"design\\/theme\",\"event\\/theme\",\"extension\\/analytics\",\"extension\\/captcha\",\"extension\\/feed\",\"extension\\/fraud\",\"extension\\/installer\",\"extension\\/modification\",\"extension\\/module\",\"extension\\/newsletter\",\"extension\\/openbay\",\"extension\\/payment\",\"extension\\/shipping\",\"extension\\/theme\",\"extension\\/total\",\"feed\\/google_base\",\"feed\\/google_sitemap\",\"feed\\/openbaypro\",\"fraud\\/fraudlabspro\",\"fraud\\/ip\",\"fraud\\/maxmind\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"module\\/account\",\"module\\/adv_ajaxfilter\",\"module\\/affiliate\",\"module\\/amazon_login\",\"module\\/amazon_pay\",\"module\\/banner\",\"module\\/bestseller\",\"module\\/blog_category\",\"module\\/blog_latest\",\"module\\/carousel\",\"module\\/category\",\"module\\/cosyone\",\"module\\/cosyone_banner\",\"module\\/cosyone_bannerwall\",\"module\\/cosyone_carousel\",\"module\\/cosyone_category\",\"module\\/cosyone_content\",\"module\\/cosyone_deals\",\"module\\/cosyone_productbrand\",\"module\\/cosyone_recently\",\"module\\/cosyone_socials\",\"module\\/cosyone_tagcloud\",\"module\\/cosyone_testimonial\",\"module\\/cosyone_twitterfeed\",\"module\\/d_ajax_search\",\"module\\/ebay_listing\",\"module\\/faqmanager\",\"module\\/featured\",\"module\\/filter\",\"module\\/google_hangouts\",\"module\\/html\",\"module\\/information\",\"module\\/latest\",\"module\\/laybuy_layout\",\"module\\/mega_filter\",\"module\\/newsletter\",\"module\\/pp_button\",\"module\\/pp_login\",\"module\\/quickcheckout\",\"module\\/revslideropencart\",\"module\\/revslideroutput\",\"module\\/sagepay_direct_cards\",\"module\\/sagepay_server_cards\",\"module\\/showintabs\",\"module\\/showintabs_output\",\"module\\/slideshow\",\"module\\/special\",\"module\\/store\",\"openbay\\/amazon\",\"openbay\\/amazon_listing\",\"openbay\\/amazon_product\",\"openbay\\/amazonus\",\"openbay\\/amazonus_listing\",\"openbay\\/amazonus_product\",\"openbay\\/ebay\",\"openbay\\/ebay_profile\",\"openbay\\/ebay_template\",\"openbay\\/etsy\",\"openbay\\/etsy_product\",\"openbay\\/etsy_shipping\",\"openbay\\/etsy_shop\",\"openbay\\/fba\",\"payment\\/amazon_login_pay\",\"payment\\/authorizenet_aim\",\"payment\\/authorizenet_sim\",\"payment\\/bank_transfer\",\"payment\\/bluepay_hosted\",\"payment\\/bluepay_redirect\",\"payment\\/cardinity\",\"payment\\/cheque\",\"payment\\/cod\",\"payment\\/eway\",\"payment\\/firstdata\",\"payment\\/firstdata_remote\",\"payment\\/free_checkout\",\"payment\\/g2apay\",\"payment\\/globalpay\",\"payment\\/globalpay_remote\",\"payment\\/klarna_account\",\"payment\\/klarna_invoice\",\"payment\\/laybuy\",\"payment\\/liqpay\",\"payment\\/nochex\",\"payment\\/paymate\",\"payment\\/paypoint\",\"payment\\/payza\",\"payment\\/perpetual_payments\",\"payment\\/pp_express\",\"payment\\/pp_payflow\",\"payment\\/pp_payflow_iframe\",\"payment\\/pp_pro\",\"payment\\/pp_pro_iframe\",\"payment\\/pp_standard\",\"payment\\/realex\",\"payment\\/realex_remote\",\"payment\\/sagepay_direct\",\"payment\\/sagepay_server\",\"payment\\/sagepay_us\",\"payment\\/securetrading_pp\",\"payment\\/securetrading_ws\",\"payment\\/skrill\",\"payment\\/twocheckout\",\"payment\\/web_payment_software\",\"payment\\/worldpay\",\"report\\/affiliate\",\"report\\/affiliate_activity\",\"report\\/affiliate_login\",\"report\\/customer_activity\",\"report\\/customer_credit\",\"report\\/customer_login\",\"report\\/customer_online\",\"report\\/customer_order\",\"report\\/customer_reward\",\"report\\/marketing\",\"report\\/product_purchased\",\"report\\/product_viewed\",\"report\\/sale_coupon\",\"report\\/sale_order\",\"report\\/sale_return\",\"report\\/sale_shipping\",\"report\\/sale_tax\",\"sale\\/order\",\"sale\\/recurring\",\"sale\\/return\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"shipping\\/auspost\",\"shipping\\/citylink\",\"shipping\\/fedex\",\"shipping\\/flat\",\"shipping\\/free\",\"shipping\\/item\",\"shipping\\/parcelforce_48\",\"shipping\\/pickup\",\"shipping\\/royal_mail\",\"shipping\\/ups\",\"shipping\\/usps\",\"shipping\\/weight\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"theme\\/theme_default\",\"tool\\/backup\",\"tool\\/error_log\",\"tool\\/upload\",\"total\\/coupon\",\"total\\/credit\",\"total\\/handling\",\"total\\/klarna_fee\",\"total\\/low_order_fee\",\"total\\/reward\",\"total\\/shipping\",\"total\\/sub_total\",\"total\\/tax\",\"total\\/total\",\"total\\/voucher\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\",\"module\\/mega_filter\",\"module\\/mega_filter\",\"module\\/category\",\"module\\/filter\",\"module\\/adv_ajaxfilter\",\"module\\/mega_filter\",\"module\\/adv_ajaxfilter\",\"module\\/quickcheckout\"]}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher`
--

CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_history`
--

CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_theme`
--

CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_theme_description`
--

CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 2, 'Christmas'),
(7, 2, 'Birthday'),
(8, 2, 'General'),
(6, 3, 'Christmas'),
(7, 3, 'Birthday'),
(8, 3, 'General');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_weight_class`
--

CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_weight_class_description`
--

CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 2, 'Kilogram', 'kg'),
(2, 2, 'Gram', 'g'),
(5, 2, 'Pound ', 'lb'),
(6, 2, 'Ounce', 'oz'),
(1, 3, 'Kilogram', 'kg'),
(2, 3, 'Gram', 'g'),
(5, 3, 'Pound ', 'lb'),
(6, 3, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_zone`
--

CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M\'Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu\'a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark\'unik\'', 'GEG', 1),
(184, 11, 'Kotayk\'', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik\'', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots\' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Niederösterreich', 'NOS', 1),
(202, 14, 'Oberösterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore\'s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel\'skaya (Homyel\')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George\'s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith\'s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M\'Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O\'Higgins', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '\'Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma\'iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa\'id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina\'', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina\'', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d\'Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-Württemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Thüringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand\'Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Puducherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta\'mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be\'er Sheva', 'BS', 1),
(1613, 104, 'Bika\'at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '\'Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al \'Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa\'', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa\'', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma\'an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P\'yongan-bukto', 'PYB', 1),
(1769, 112, 'P\'yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P\'yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch\'ungch\'ong-bukto', 'CO', 1),
(1774, 113, 'Ch\'ungch\'ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch\'on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t\'ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al \'Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra\'', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale\'s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha\'s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al \'Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati\'', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke\'s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa\'id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul\'yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust\'-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A\'ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa\'asaleleaga', 'FA', 1),
(2856, 181, 'Gaga\'emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa\'itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va\'a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '\'Asir', 'AS', 1),
(2882, 184, 'Ha\'il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand\' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand\' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A\'ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa\'iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa\'iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'Gävleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'Jämtland', 'Z', 1),
(3080, 203, 'Jönköping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, 'Örebro', 'T', 1),
(3085, 203, 'Östergötland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'Södermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'Värmland', 'S', 1),
(3091, 203, 'Västerbotten', 'AC', 1),
(3092, 203, 'Västernorrland', 'Y', 1),
(3093, 203, 'Västmanland', 'U', 1),
(3094, 203, 'Västra Götaland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graubünden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Zürich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t\'ou', 'NT', 1),
(3145, 206, 'P\'eng-hu', 'PH', 1),
(3146, 206, 'P\'ing-tung', 'PT', 1),
(3147, 206, 'T\'ai-chung', 'TG', 1),
(3148, 206, 'T\'ai-nan', 'TA', 1),
(3149, 206, 'T\'ai-pei county', 'TP', 1),
(3150, 206, 'T\'ai-tung', 'TT', 1),
(3151, 206, 'T\'ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T\'ai-chung', 'TH', 1),
(3157, 206, 'T\'ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T\'ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha\'apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava\'u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkas\'ka Oblast\'', '71', 1),
(3481, 220, 'Chernihivs\'ka Oblast\'', '74', 1),
(3482, 220, 'Chernivets\'ka Oblast\'', '77', 1),
(3483, 220, 'Crimea', '43', 1),
(3484, 220, 'Dnipropetrovs\'ka Oblast\'', '12', 1),
(3485, 220, 'Donets\'ka Oblast\'', '14', 1),
(3486, 220, 'Ivano-Frankivs\'ka Oblast\'', '26', 1),
(3487, 220, 'Khersons\'ka Oblast\'', '65', 1),
(3488, 220, 'Khmel\'nyts\'ka Oblast\'', '68', 1),
(3489, 220, 'Kirovohrads\'ka Oblast\'', '35', 1),
(3490, 220, 'Kyiv', '30', 1),
(3491, 220, 'Kyivs\'ka Oblast\'', '32', 1),
(3492, 220, 'Luhans\'ka Oblast\'', '09', 1),
(3493, 220, 'L\'vivs\'ka Oblast\'', '46', 1),
(3494, 220, 'Mykolayivs\'ka Oblast\'', '48', 1),
(3495, 220, 'Odes\'ka Oblast\'', '51', 1),
(3496, 220, 'Poltavs\'ka Oblast\'', '53', 1),
(3497, 220, 'Rivnens\'ka Oblast\'', '56', 1),
(3498, 220, 'Sevastopol\'', '40', 1),
(3499, 220, 'Sums\'ka Oblast\'', '59', 1),
(3500, 220, 'Ternopil\'s\'ka Oblast\'', '61', 1),
(3501, 220, 'Vinnyts\'ka Oblast\'', '05', 1),
(3502, 220, 'Volyns\'ka Oblast\'', '07', 1),
(3503, 220, 'Zakarpats\'ka Oblast\'', '21', 1),
(3504, 220, 'Zaporiz\'ka Oblast\'', '23', 1),
(3505, 220, 'Zhytomyrs\'ka oblast\'', '18', 1),
(3506, 221, 'Abu Dhabi', 'ADH', 1),
(3507, 221, '\'Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubai', 'DU', 1),
(3511, 221, 'R\'as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg\'ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog\'iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma\'rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa\'dah', 'SD', 1),
(3805, 235, 'San\'a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta\'izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1),
(4222, 43, 'Arica y Parinacota', 'AP', 1),
(4223, 43, 'Los Rios', 'LR', 1),
(4224, 220, 'Kharkivs\'ka Oblast\'', '63', 1),
(4225, 118, 'Beirut', 'LB-BR', 1),
(4226, 118, 'Bekaa', 'LB-BE', 1),
(4227, 118, 'Mount Lebanon', 'LB-ML', 1),
(4228, 118, 'Nabatieh', 'LB-NB', 1),
(4229, 118, 'North', 'LB-NR', 1),
(4230, 118, 'South', 'LB-ST', 1),
(4231, 99, 'Telangana', 'TS', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_zone_to_geo_zone`
--

CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `oc_address`
--
ALTER TABLE `oc_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Индексы таблицы `oc_affiliate`
--
ALTER TABLE `oc_affiliate`
  ADD PRIMARY KEY (`affiliate_id`);

--
-- Индексы таблицы `oc_affiliate_activity`
--
ALTER TABLE `oc_affiliate_activity`
  ADD PRIMARY KEY (`affiliate_activity_id`);

--
-- Индексы таблицы `oc_affiliate_login`
--
ALTER TABLE `oc_affiliate_login`
  ADD PRIMARY KEY (`affiliate_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Индексы таблицы `oc_affiliate_transaction`
--
ALTER TABLE `oc_affiliate_transaction`
  ADD PRIMARY KEY (`affiliate_transaction_id`);

--
-- Индексы таблицы `oc_api`
--
ALTER TABLE `oc_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Индексы таблицы `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  ADD PRIMARY KEY (`api_ip_id`);

--
-- Индексы таблицы `oc_api_session`
--
ALTER TABLE `oc_api_session`
  ADD PRIMARY KEY (`api_session_id`);

--
-- Индексы таблицы `oc_attribute`
--
ALTER TABLE `oc_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Индексы таблицы `oc_attribute_description`
--
ALTER TABLE `oc_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Индексы таблицы `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Индексы таблицы `oc_attribute_group_description`
--
ALTER TABLE `oc_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Индексы таблицы `oc_banner`
--
ALTER TABLE `oc_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Индексы таблицы `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Индексы таблицы `oc_banner_image_description`
--
ALTER TABLE `oc_banner_image_description`
  ADD PRIMARY KEY (`banner_image_id`,`language_id`);

--
-- Индексы таблицы `oc_blog`
--
ALTER TABLE `oc_blog`
  ADD PRIMARY KEY (`blog_id`);

--
-- Индексы таблицы `oc_blog_category`
--
ALTER TABLE `oc_blog_category`
  ADD PRIMARY KEY (`blog_category_id`);

--
-- Индексы таблицы `oc_blog_category_description`
--
ALTER TABLE `oc_blog_category_description`
  ADD PRIMARY KEY (`blog_category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_blog_category_to_layout`
--
ALTER TABLE `oc_blog_category_to_layout`
  ADD PRIMARY KEY (`blog_category_id`,`store_id`);

--
-- Индексы таблицы `oc_blog_category_to_store`
--
ALTER TABLE `oc_blog_category_to_store`
  ADD PRIMARY KEY (`blog_category_id`,`store_id`);

--
-- Индексы таблицы `oc_blog_comment`
--
ALTER TABLE `oc_blog_comment`
  ADD PRIMARY KEY (`blog_comment_id`);

--
-- Индексы таблицы `oc_blog_to_category`
--
ALTER TABLE `oc_blog_to_category`
  ADD PRIMARY KEY (`blog_id`,`blog_category_id`);

--
-- Индексы таблицы `oc_blog_to_layout`
--
ALTER TABLE `oc_blog_to_layout`
  ADD PRIMARY KEY (`blog_id`,`store_id`);

--
-- Индексы таблицы `oc_cart`
--
ALTER TABLE `oc_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`customer_id`,`session_id`,`product_id`,`recurring_id`);

--
-- Индексы таблицы `oc_category`
--
ALTER TABLE `oc_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `oc_category_description`
--
ALTER TABLE `oc_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_category_filter`
--
ALTER TABLE `oc_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Индексы таблицы `oc_category_path`
--
ALTER TABLE `oc_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Индексы таблицы `oc_category_to_layout`
--
ALTER TABLE `oc_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_category_to_store`
--
ALTER TABLE `oc_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_country`
--
ALTER TABLE `oc_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Индексы таблицы `oc_coupon`
--
ALTER TABLE `oc_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Индексы таблицы `oc_coupon_category`
--
ALTER TABLE `oc_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- Индексы таблицы `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Индексы таблицы `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- Индексы таблицы `oc_currency`
--
ALTER TABLE `oc_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Индексы таблицы `oc_customer`
--
ALTER TABLE `oc_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Индексы таблицы `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  ADD PRIMARY KEY (`customer_activity_id`);

--
-- Индексы таблицы `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Индексы таблицы `oc_customer_group_description`
--
ALTER TABLE `oc_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Индексы таблицы `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Индексы таблицы `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Индексы таблицы `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Индексы таблицы `oc_customer_online`
--
ALTER TABLE `oc_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- Индексы таблицы `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Индексы таблицы `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Индексы таблицы `oc_customer_wishlist`
--
ALTER TABLE `oc_customer_wishlist`
  ADD PRIMARY KEY (`customer_id`,`product_id`);

--
-- Индексы таблицы `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Индексы таблицы `oc_custom_field_customer_group`
--
ALTER TABLE `oc_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_custom_field_description`
--
ALTER TABLE `oc_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Индексы таблицы `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Индексы таблицы `oc_custom_field_value_description`
--
ALTER TABLE `oc_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Индексы таблицы `oc_download`
--
ALTER TABLE `oc_download`
  ADD PRIMARY KEY (`download_id`);

--
-- Индексы таблицы `oc_download_description`
--
ALTER TABLE `oc_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Индексы таблицы `oc_event`
--
ALTER TABLE `oc_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Индексы таблицы `oc_extension`
--
ALTER TABLE `oc_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Индексы таблицы `oc_filter`
--
ALTER TABLE `oc_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Индексы таблицы `oc_filter_description`
--
ALTER TABLE `oc_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Индексы таблицы `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Индексы таблицы `oc_filter_group_description`
--
ALTER TABLE `oc_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Индексы таблицы `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Индексы таблицы `oc_information`
--
ALTER TABLE `oc_information`
  ADD PRIMARY KEY (`information_id`);

--
-- Индексы таблицы `oc_information_description`
--
ALTER TABLE `oc_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Индексы таблицы `oc_information_to_layout`
--
ALTER TABLE `oc_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Индексы таблицы `oc_information_to_store`
--
ALTER TABLE `oc_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Индексы таблицы `oc_language`
--
ALTER TABLE `oc_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_layout`
--
ALTER TABLE `oc_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Индексы таблицы `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Индексы таблицы `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Индексы таблицы `oc_length_class`
--
ALTER TABLE `oc_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- Индексы таблицы `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- Индексы таблицы `oc_location`
--
ALTER TABLE `oc_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Индексы таблицы `oc_manufacturer_to_store`
--
ALTER TABLE `oc_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Индексы таблицы `oc_marketing`
--
ALTER TABLE `oc_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Индексы таблицы `oc_mfilter_url_alias`
--
ALTER TABLE `oc_mfilter_url_alias`
  ADD PRIMARY KEY (`mfilter_url_alias_id`);

--
-- Индексы таблицы `oc_modification`
--
ALTER TABLE `oc_modification`
  ADD PRIMARY KEY (`modification_id`);

--
-- Индексы таблицы `oc_module`
--
ALTER TABLE `oc_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Индексы таблицы `oc_newsletter`
--
ALTER TABLE `oc_newsletter`
  ADD PRIMARY KEY (`email`);

--
-- Индексы таблицы `oc_option`
--
ALTER TABLE `oc_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Индексы таблицы `oc_option_description`
--
ALTER TABLE `oc_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Индексы таблицы `oc_option_value`
--
ALTER TABLE `oc_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Индексы таблицы `oc_option_value_description`
--
ALTER TABLE `oc_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Индексы таблицы `oc_order`
--
ALTER TABLE `oc_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Индексы таблицы `oc_order_custom_field`
--
ALTER TABLE `oc_order_custom_field`
  ADD PRIMARY KEY (`order_custom_field_id`);

--
-- Индексы таблицы `oc_order_history`
--
ALTER TABLE `oc_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Индексы таблицы `oc_order_option`
--
ALTER TABLE `oc_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Индексы таблицы `oc_order_product`
--
ALTER TABLE `oc_order_product`
  ADD PRIMARY KEY (`order_product_id`);

--
-- Индексы таблицы `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  ADD PRIMARY KEY (`order_recurring_id`);

--
-- Индексы таблицы `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  ADD PRIMARY KEY (`order_recurring_transaction_id`);

--
-- Индексы таблицы `oc_order_status`
--
ALTER TABLE `oc_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Индексы таблицы `oc_order_total`
--
ALTER TABLE `oc_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- Индексы таблицы `oc_product`
--
ALTER TABLE `oc_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `oc_product_attribute`
--
ALTER TABLE `oc_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Индексы таблицы `oc_product_description`
--
ALTER TABLE `oc_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_filter`
--
ALTER TABLE `oc_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Индексы таблицы `oc_product_image`
--
ALTER TABLE `oc_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_option`
--
ALTER TABLE `oc_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Индексы таблицы `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`),
  ADD KEY `option_value_id` (`option_value_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_recurring`
--
ALTER TABLE `oc_product_recurring`
  ADD PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_product_related`
--
ALTER TABLE `oc_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Индексы таблицы `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Индексы таблицы `oc_product_special`
--
ALTER TABLE `oc_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_tab`
--
ALTER TABLE `oc_product_tab`
  ADD PRIMARY KEY (`product_id`,`tab_id`,`language_id`);

--
-- Индексы таблицы `oc_product_to_category`
--
ALTER TABLE `oc_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `oc_product_to_download`
--
ALTER TABLE `oc_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Индексы таблицы `oc_product_to_layout`
--
ALTER TABLE `oc_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Индексы таблицы `oc_product_to_store`
--
ALTER TABLE `oc_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Индексы таблицы `oc_question`
--
ALTER TABLE `oc_question`
  ADD PRIMARY KEY (`question_id`);

--
-- Индексы таблицы `oc_recurring`
--
ALTER TABLE `oc_recurring`
  ADD PRIMARY KEY (`recurring_id`);

--
-- Индексы таблицы `oc_recurring_description`
--
ALTER TABLE `oc_recurring_description`
  ADD PRIMARY KEY (`recurring_id`,`language_id`);

--
-- Индексы таблицы `oc_return`
--
ALTER TABLE `oc_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Индексы таблицы `oc_return_action`
--
ALTER TABLE `oc_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- Индексы таблицы `oc_return_history`
--
ALTER TABLE `oc_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- Индексы таблицы `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- Индексы таблицы `oc_return_status`
--
ALTER TABLE `oc_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- Индексы таблицы `oc_review`
--
ALTER TABLE `oc_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_revslider_attachment_images`
--
ALTER TABLE `oc_revslider_attachment_images`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `oc_revslider_css`
--
ALTER TABLE `oc_revslider_css`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oc_revslider_layer_animations`
--
ALTER TABLE `oc_revslider_layer_animations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oc_revslider_settings`
--
ALTER TABLE `oc_revslider_settings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oc_revslider_sliders`
--
ALTER TABLE `oc_revslider_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oc_revslider_slides`
--
ALTER TABLE `oc_revslider_slides`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oc_revslider_static_slides`
--
ALTER TABLE `oc_revslider_static_slides`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oc_setting`
--
ALTER TABLE `oc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Индексы таблицы `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Индексы таблицы `oc_store`
--
ALTER TABLE `oc_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Индексы таблицы `oc_tab`
--
ALTER TABLE `oc_tab`
  ADD PRIMARY KEY (`tab_id`);

--
-- Индексы таблицы `oc_tab_description`
--
ALTER TABLE `oc_tab_description`
  ADD PRIMARY KEY (`tab_id`,`language_id`);

--
-- Индексы таблицы `oc_tag_cloud`
--
ALTER TABLE `oc_tag_cloud`
  ADD PRIMARY KEY (`tag`,`language_id`,`store_id`);

--
-- Индексы таблицы `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Индексы таблицы `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Индексы таблицы `oc_tax_rate_to_customer_group`
--
ALTER TABLE `oc_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Индексы таблицы `oc_testimonial`
--
ALTER TABLE `oc_testimonial`
  ADD PRIMARY KEY (`testimonial_id`);

--
-- Индексы таблицы `oc_testimonial_description`
--
ALTER TABLE `oc_testimonial_description`
  ADD PRIMARY KEY (`testimonial_id`,`language_id`);

--
-- Индексы таблицы `oc_upload`
--
ALTER TABLE `oc_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Индексы таблицы `oc_url_alias`
--
ALTER TABLE `oc_url_alias`
  ADD PRIMARY KEY (`url_alias_id`),
  ADD KEY `query` (`query`),
  ADD KEY `keyword` (`keyword`);

--
-- Индексы таблицы `oc_user`
--
ALTER TABLE `oc_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `oc_user_group`
--
ALTER TABLE `oc_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Индексы таблицы `oc_voucher`
--
ALTER TABLE `oc_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Индексы таблицы `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- Индексы таблицы `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- Индексы таблицы `oc_voucher_theme_description`
--
ALTER TABLE `oc_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- Индексы таблицы `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- Индексы таблицы `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- Индексы таблицы `oc_zone`
--
ALTER TABLE `oc_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Индексы таблицы `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `oc_address`
--
ALTER TABLE `oc_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `oc_affiliate`
--
ALTER TABLE `oc_affiliate`
  MODIFY `affiliate_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_affiliate_activity`
--
ALTER TABLE `oc_affiliate_activity`
  MODIFY `affiliate_activity_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_affiliate_login`
--
ALTER TABLE `oc_affiliate_login`
  MODIFY `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_affiliate_transaction`
--
ALTER TABLE `oc_affiliate_transaction`
  MODIFY `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_api`
--
ALTER TABLE `oc_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  MODIFY `api_ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `oc_api_session`
--
ALTER TABLE `oc_api_session`
  MODIFY `api_session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT для таблицы `oc_attribute`
--
ALTER TABLE `oc_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT для таблицы `oc_banner`
--
ALTER TABLE `oc_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
--
-- AUTO_INCREMENT для таблицы `oc_blog`
--
ALTER TABLE `oc_blog`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT для таблицы `oc_blog_category`
--
ALTER TABLE `oc_blog_category`
  MODIFY `blog_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT для таблицы `oc_blog_comment`
--
ALTER TABLE `oc_blog_comment`
  MODIFY `blog_comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT для таблицы `oc_cart`
--
ALTER TABLE `oc_cart`
  MODIFY `cart_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `oc_category`
--
ALTER TABLE `oc_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT для таблицы `oc_country`
--
ALTER TABLE `oc_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;
--
-- AUTO_INCREMENT для таблицы `oc_coupon`
--
ALTER TABLE `oc_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  MODIFY `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_currency`
--
ALTER TABLE `oc_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `oc_customer`
--
ALTER TABLE `oc_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  MODIFY `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_download`
--
ALTER TABLE `oc_download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_event`
--
ALTER TABLE `oc_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `oc_extension`
--
ALTER TABLE `oc_extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1461;
--
-- AUTO_INCREMENT для таблицы `oc_filter`
--
ALTER TABLE `oc_filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `oc_information`
--
ALTER TABLE `oc_information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `oc_language`
--
ALTER TABLE `oc_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `oc_layout`
--
ALTER TABLE `oc_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;
--
-- AUTO_INCREMENT для таблицы `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
--
-- AUTO_INCREMENT для таблицы `oc_length_class`
--
ALTER TABLE `oc_length_class`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `oc_location`
--
ALTER TABLE `oc_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `oc_marketing`
--
ALTER TABLE `oc_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_mfilter_url_alias`
--
ALTER TABLE `oc_mfilter_url_alias`
  MODIFY `mfilter_url_alias_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_modification`
--
ALTER TABLE `oc_modification`
  MODIFY `modification_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_module`
--
ALTER TABLE `oc_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT для таблицы `oc_option`
--
ALTER TABLE `oc_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT для таблицы `oc_option_value`
--
ALTER TABLE `oc_option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT для таблицы `oc_order`
--
ALTER TABLE `oc_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `oc_order_custom_field`
--
ALTER TABLE `oc_order_custom_field`
  MODIFY `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_order_history`
--
ALTER TABLE `oc_order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT для таблицы `oc_order_option`
--
ALTER TABLE `oc_order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_order_product`
--
ALTER TABLE `oc_order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `oc_order_recurring`
--
ALTER TABLE `oc_order_recurring`
  MODIFY `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_order_recurring_transaction`
--
ALTER TABLE `oc_order_recurring_transaction`
  MODIFY `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_order_status`
--
ALTER TABLE `oc_order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `oc_order_total`
--
ALTER TABLE `oc_order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  MODIFY `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_product`
--
ALTER TABLE `oc_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=464;
--
-- AUTO_INCREMENT для таблицы `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=516;
--
-- AUTO_INCREMENT для таблицы `oc_product_image`
--
ALTER TABLE `oc_product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17410;
--
-- AUTO_INCREMENT для таблицы `oc_product_option`
--
ALTER TABLE `oc_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_product_special`
--
ALTER TABLE `oc_product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3799;
--
-- AUTO_INCREMENT для таблицы `oc_question`
--
ALTER TABLE `oc_question`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT для таблицы `oc_recurring`
--
ALTER TABLE `oc_recurring`
  MODIFY `recurring_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_return`
--
ALTER TABLE `oc_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_return_action`
--
ALTER TABLE `oc_return_action`
  MODIFY `return_action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `oc_return_history`
--
ALTER TABLE `oc_return_history`
  MODIFY `return_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  MODIFY `return_reason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `oc_return_status`
--
ALTER TABLE `oc_return_status`
  MODIFY `return_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `oc_review`
--
ALTER TABLE `oc_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_revslider_attachment_images`
--
ALTER TABLE `oc_revslider_attachment_images`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_revslider_css`
--
ALTER TABLE `oc_revslider_css`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT для таблицы `oc_revslider_layer_animations`
--
ALTER TABLE `oc_revslider_layer_animations`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_revslider_settings`
--
ALTER TABLE `oc_revslider_settings`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_revslider_sliders`
--
ALTER TABLE `oc_revslider_sliders`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `oc_revslider_slides`
--
ALTER TABLE `oc_revslider_slides`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `oc_revslider_static_slides`
--
ALTER TABLE `oc_revslider_static_slides`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_setting`
--
ALTER TABLE `oc_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111530;
--
-- AUTO_INCREMENT для таблицы `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `oc_store`
--
ALTER TABLE `oc_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `oc_tab`
--
ALTER TABLE `oc_tab`
  MODIFY `tab_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT для таблицы `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;
--
-- AUTO_INCREMENT для таблицы `oc_testimonial`
--
ALTER TABLE `oc_testimonial`
  MODIFY `testimonial_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `oc_upload`
--
ALTER TABLE `oc_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `oc_url_alias`
--
ALTER TABLE `oc_url_alias`
  MODIFY `url_alias_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=926;
--
-- AUTO_INCREMENT для таблицы `oc_user`
--
ALTER TABLE `oc_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `oc_user_group`
--
ALTER TABLE `oc_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `oc_voucher`
--
ALTER TABLE `oc_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  MODIFY `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  MODIFY `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT для таблицы `oc_zone`
--
ALTER TABLE `oc_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4232;
--
-- AUTO_INCREMENT для таблицы `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

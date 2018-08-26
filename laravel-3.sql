-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 05 2018 г., 23:33
-- Версия сервера: 5.7.20
-- Версия PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `laravel-3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_desc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `title`, `text`, `desc`, `alias`, `img`, `created_at`, `updated_at`, `user_id`, `category_id`, `keywords`, `meta_desc`) VALUES
(3, 'This is the title of the first article. Enjoy it', '<p>Fusce rutrum lectus id nibh ullamcorper aliquet. Pellentesque pretium mauris et augue fringilla non bibendum turpis iaculis. Donec sit amet nunc lorem. Sed fringilla vehicula est at pellentesque. Aenean imperdiet elementum arcu id facilisis. Mauris sed leo eros.</p>\\n<p>Duis nulla purus, malesuada in gravida sed, viverra at elit. Praesent nec purus sem, non imperdiet quam. Praesent tincidunt tortor eu libero scelerisque quis consequat justo elementum. Maecenas aliquet facilisis ipsum, commodo eleifend odio ultrices et. Maecenas arcu arcu, luctus a laoreet et, fermentum vel lectus. Cras consectetur ipsum venenatis ligula aliquam hendrerit. Suspendisse rhoncus hendrerit fermentum. Ut eget rhoncus purus.</p>\\n<p>Cras a tellus eu justo lobortis tristique et nec mauris. Etiam tincidunt tellus ut odio elementum adipiscing. Maecenas cursus dolor sit amet leo elementum ut semper velit lobortis. Pellentesque posue</p>\', \'Fusce nec accumsan eros. Aenean ac orci a magna vestibulum posuere quis nec nisi. Maecenas rutrum vehicula condimentum. Donec volutpat nisl ac mauris consectetur gravida.\\r\\n\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel vulputate nibh. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\\r\\n\\r\\nIn facilisis ornare arcu, sodales facilisis neque blandit ac. Ut blandit ipsum quis arcu adipiscing sit amet semper sem feugiat. Nam sed dapibus arcu. Nullam eleifend molestie lectus. Nullam nec risus purus\r\n', '<p>Fusce rutrum lectus id nibh ullamcorper aliquet. Pellentesque pretium mauris et augue fringilla non bibendum turpis iaculis. Donec sit amet nunc lorem. Sed fringilla vehicula est at pellentesque. Aenean imperdiet elementum arcu id facilisis. Mauris sed leo eros.</p>', 'privet', '{\"mini\":\"003-55x55.jpg \",\"max\":\"003-816x282.jpg \",\"path\":\"0081-700x345.jpg\"}', '2018-04-09 05:15:24', NULL, 1, 1, 'ключи', 'краткое описание'),
(4, 'Nice & Clean. The best for your blog!', '<p>Fusce rutrum lectus id nibh ullamcorper aliquet. Pellentesque pretium mauris et augue fringilla non bibendum turpis iaculis. Donec sit amet nunc lorem. Sed fringilla vehicula est at pellentesque. Aenean imperdiet elementum arcu id facilisis. Mauris sed leo eros.</p>\\n<p>Duis nulla purus, malesuada in gravida sed, viverra at elit. Praesent nec purus sem, non imperdiet quam. Praesent tincidunt tortor eu libero scelerisque quis consequat justo elementum. Maecenas aliquet facilisis ipsum, commodo eleifend odio ultrices et. Maecenas arcu arcu, luctus a laoreet et, fermentum vel lectus. Cras consectetur ipsum venenatis ligula aliquam hendrerit. Suspendisse rhoncus hendrerit fermentum. Ut eget rhoncus purus.</p>\\n<p>Cras a tellus eu justo lobortis tristique et nec mauris. Etiam tincidunt tellus ut odio elementum adipiscing. Maecenas cursus dolor sit amet leo elementum ut semper velit lobortis. Pellentesque posue</p>\', \'Fusce nec accumsan eros. Aenean ac orci a magna vestibulum posuere quis nec nisi. Maecenas rutrum vehicula condimentum. Donec volutpat nisl ac mauris consectetur gravida.\\r\\n\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel vulputate nibh. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\\r\\n\\r\\nIn facilisis ornare arcu, sodales facilisis neque blandit ac. Ut blandit ipsum quis arcu adipiscing sit amet semper sem feugiat. Nam sed dapibus arcu. Nullam eleifend molestie lectus. Nullam nec risus purus.', '<p>Fusce rutrum lectus id nibh ullamcorper aliquet. Pellentesque pretium mauris et augue fringilla non bibendum turpis iaculis. Donec sit amet nunc lorem. Sed fringilla vehicula est at pellentesque. Aenean imperdiet elementum arcu id facilisis. Mauris sed leo eros.</p>', 'article-2', '{\"mini\":\"001-55x55.png \",\"max\":\"001-816x282.png \",\"path\":\"0081-700x345.jpg\"}', '2018-04-10 12:00:00', NULL, 1, 3, '', ''),
(5, 'Section shortcodes & sticky posts! 12345678', '<p>Fusce rutrum lectus id nibh ullamcorper aliquet. Pellentesque pretium mauris et augue fringilla non bibendum turpis iaculis. Donec sit amet nunc lorem. Sed fringilla vehicula est at pellentesque. Aenean imperdiet elementum arcu id facilisis. Mauris sed leo eros.</p>\r\n\r\n<p>\\n</p>\r\n\r\n<p>Duis nulla purus, malesuada in gravida sed, viverra at elit. Praesent nec purus sem, non imperdiet quam. Praesent tincidunt tortor eu libero scelerisque quis consequat justo elementum. Maecenas aliquet facilisis ipsum, commodo eleifend odio ultrices et. Maecenas arcu arcu, luctus a laoreet et, fermentum vel lectus. Cras consectetur ipsum venenatis ligula aliquam hendrerit. Suspendisse rhoncus hendrerit fermentum. Ut eget rhoncus purus.</p>\r\n\r\n<p>\\n</p>\r\n\r\n<p>Cras a tellus eu justo lobortis tristique et nec mauris. Etiam tincidunt tellus ut odio elementum adipiscing. Maecenas cursus dolor sit amet leo elementum ut semper velit lobortis. Pellentesque posue</p>\r\n\r\n<p>&#39;, &#39;Fusce nec accumsan eros. Aenean ac orci a magna vestibulum posuere quis nec nisi. Maecenas rutrum vehicula condimentum. Donec volutpat nisl ac mauris consectetur gravida.\\r\\n\\r\\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec vel vulputate nibh. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\\r\\n\\r\\nIn facilisis ornare arcu, sodales facilisis neque blandit ac. Ut blandit ipsum quis arcu adipiscing sit amet semper sem feugiat. Nam sed dapibus arcu. Nullam eleifend molestie lectus. Nullam nec risus purus.</p>', '<p>Fusce rutrum lectus id nibh ullamcorper aliquet. Pellentesque pretium mauris et augue fringilla non bibendum turpis iaculis. Donec sit amet nunc lorem. Sed fringilla vehicula est at pellentesque. Aenean imperdiet elementum arcu id facilisis. Mauris sed leo eros.</p>', 'section-shortcodes-sticky-posts-12345678', '{\"mini\":\"8GCa6v58_mini.jpg\",\"max\":\"8GCa6v58_max.jpg\",\"path\":\"8GCa6v58.jpg\"}', '2018-04-01 03:27:16', '2018-05-28 13:39:59', 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cachemenu', 's:1078:\"<div class=\"menu classic\">\r\n        <ul id=\"nav\" class=\"menu\">\r\n            <li class=active>\r\n        <a href=\"http://laravel-3\">Главная</a>\r\n            </li>\r\n    <li >\r\n        <a href=\"http://laravel-3/articles\">Блог</a>\r\n                    <ul class=\"sub-menu\">\r\n                <li >\r\n        <a href=\"http://laravel-3/articles/cat/computers\">Компьютеры</a>\r\n            </li>\r\n    <li >\r\n        <a href=\"http://laravel-3/articles/cat/iteresting\">Интересное</a>\r\n            </li>\r\n    <li >\r\n        <a href=\"http://laravel-3/articles/cat/soveti\">Советы</a>\r\n            </li>\r\n            </ul>\r\n            </li>\r\n    <li >\r\n        <a href=\"http://laravel-3/portfolios\">Портфолио</a>\r\n            </li>\r\n    <li >\r\n        <a href=\"http://laravel-3/contacts\">Контакты</a>\r\n            </li>\r\n    <li >\r\n        <a href=\"http://laravel-3/portfolios/project1\">Link New</a>\r\n            </li>\r\n    <li >\r\n        <a href=\"http://laravel-3/articles/article-2\">ggg</a>\r\n            </li>\r\n        </ul>\r\n    </div>\r\n\";', 1530652695);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `title`, `alias`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Блог', 'blog', 0, NULL, NULL),
(2, 'Компьютеры', 'computers', 1, NULL, NULL),
(3, 'Интересное', 'iteresting', 1, NULL, NULL),
(4, 'Советы', 'soveti', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `article_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `text`, `name`, `email`, `site`, `parent_id`, `created_at`, `updated_at`, `article_id`, `user_id`) VALUES
(1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea, laudantium optio magnam suscipit adipisci iusto distinctio reiciendis obcaecati voluptate consequuntur.', 'name1', 's@s.ss', 's.ru', 0, '2018-04-09 10:17:00', NULL, 3, 1),
(2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea, laudantium optio magnam suscipit adipisci iusto distinctio reiciendis obcaecati voluptate consequuntur.', '', 's@s.ss', 'site.ru', 0, '2018-04-09 04:26:00', NULL, 3, NULL),
(3, 'приветик', 'жук1', 'zhuk@aa.aa', 'sity.ru', 1, NULL, NULL, 3, 1),
(4, 'hey', 'a;slkdfj', 'ss@ss.ss', 'site.ru', 3, NULL, NULL, 3, 1),
(5, 'hello', 'teoitue', 'tt@tt.tt', 'sity.ru', 2, NULL, NULL, 3, 1),
(6, 'fsrewoit043', 'asfg3', 'si@ss.ss', 'site.ru', 4, NULL, NULL, 3, NULL),
(7, 'приветик2342', 'жук1ww', 'zhuk@aa.aa', 'sity.ru', 1, NULL, NULL, 3, NULL),
(8, 'asdfasdf', 'name1', 's211211@ukr.net', 'se.ru', 0, '2018-05-06 14:52:35', '2018-05-06 14:52:35', 3, NULL),
(9, 'asdfasdfzxcvzxc', 'name2', 's211211@ukr.net', 'sitee.ru', 1, '2018-05-06 14:53:56', '2018-05-06 14:53:56', 3, NULL),
(10, 'asdfasdfzxcvzxc', 'name3', 's211211@ukr.net', 'sitee.ru', 7, '2018-05-07 13:00:42', '2018-05-07 13:00:42', 3, NULL),
(11, 'hellu', 'hwelr', 's211211@ukr.net', 'sdf', 5, '2018-05-07 13:03:14', '2018-05-07 13:03:14', 3, NULL),
(12, 'kuku', 'sasha', 's211211@ukr.net', 'asdf', 5, '2018-05-07 13:08:04', '2018-05-07 13:08:04', 3, NULL),
(13, 'последний коммент', 'последний', 's211211@ukr.net', 'asdf', 8, '2018-05-07 15:59:33', '2018-05-07 15:59:33', 3, NULL),
(14, 'препоследний', 'фжыдвлао', 's@ss.ss', 'asfda', 13, '2018-05-07 16:01:47', '2018-05-07 16:01:47', 3, NULL),
(15, 'Хрень2', 'хрень', 's211211@ukr.net', 'asfd', 5, '2018-05-07 16:23:04', '2018-05-07 16:23:04', 3, NULL),
(16, 'фыва', 'фыыва', 's211211@ukr.net', 'asfd', 4, '2018-05-07 16:25:52', '2018-05-07 16:25:52', 3, NULL),
(17, 'zxcvxzcv', 'wfdas', 'asdf', 'asdf', 0, '2018-05-07 16:50:30', '2018-05-07 16:50:30', 3, NULL),
(18, 'new222', 'asdf', 'zzz', 'xvvx', 0, '2018-05-07 16:53:01', '2018-05-07 16:53:01', 3, NULL),
(19, 'new3', 'asdfzxc', 'vzxvczvxc', 'zxvczxvc', 0, '2018-05-07 16:53:21', '2018-05-07 16:53:21', 3, NULL),
(27, 'фыав', 'фыва', 'фыав', 'фыав', 0, '2018-05-07 17:30:48', '2018-05-07 17:30:48', 4, NULL),
(28, 'фаы', 'фыва', 'фыва', 'фаы', 0, '2018-05-07 17:31:38', '2018-05-07 17:31:38', 4, NULL),
(29, 'ыфав', 'яя', 'яя', 'яя', 28, '2018-05-07 17:32:31', '2018-05-07 17:32:31', 4, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `filters`
--

CREATE TABLE `filters` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `filters`
--

INSERT INTO `filters` (`id`, `title`, `alias`, `created_at`, `updated_at`) VALUES
(1, 'Brand Identity', 'brand-identity', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`id`, `title`, `path`, `parent`, `created_at`, `updated_at`) VALUES
(1, 'Главная', 'http://laravel-3', 0, NULL, NULL),
(2, 'Блог', 'http://laravel-3/articles', 0, NULL, NULL),
(3, 'Компьютеры', 'http://laravel-3/articles/cat/computers', 2, NULL, NULL),
(4, 'Интересное', 'http://laravel-3/articles/cat/iteresting', 2, NULL, NULL),
(5, 'Советы', 'http://laravel-3/articles/cat/soveti', 2, NULL, NULL),
(6, 'Портфолио', 'http://laravel-3/portfolios', 0, NULL, NULL),
(7, 'Контакты', 'http://laravel-3/contacts', 0, NULL, NULL),
(11, 'Link New', 'http://laravel-3/portfolios/project1', 0, '2018-06-15 19:17:52', '2018-06-17 12:27:13');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_03_25_110410_create_articles_table', 1),
(4, '2018_03_25_120428_portfolios_table', 1),
(5, '2018_03_25_120921_filters_table', 1),
(6, '2018_03_25_122038_comments_table', 1),
(7, '2018_03_25_122637_sliders_table', 1),
(8, '2018_03_25_123237_menus_table', 1),
(9, '2018_03_25_123534_categories_table', 1),
(10, '2018_03_25_125129_change_articles_table', 1),
(11, '2018_03_25_125803_change_comments_table', 1),
(12, '2018_03_25_130611_change_portfolios_table', 1),
(13, '2018_05_07_203424_change__articles__table2', 2),
(14, '2018_05_09_093111_change_portfolios_table2', 3),
(17, '2018_05_09_185724_change_users_table', 4),
(18, '2018_05_20_144332_create_roles_table', 5),
(19, '2018_05_20_144422_create_permissions_table', 6),
(20, '2018_05_20_144525_create_permission_role_table', 6),
(21, '2018_05_20_144923_create_user_role_table', 6),
(22, '2018_05_20_145811_change_role_user_table', 7),
(23, '2018_05_20_145847_change_permission_role_table', 7),
(24, '2018_07_03_210158_create_cache_table', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'VIEW_ADMIN', NULL, NULL),
(2, 'ADD_ARTICLES', NULL, NULL),
(3, 'UPDATE_ARTICLES', NULL, NULL),
(4, 'DELETE_ARTICLES', NULL, NULL),
(5, 'ADMIN_USERS', NULL, NULL),
(6, 'VIEW_ADMIN_ARTICLES', NULL, NULL),
(7, 'EDIT_USERS', NULL, NULL),
(8, 'VIEW_ADMIN_MENU', NULL, NULL),
(9, 'EDIT_MENU', NULL, NULL),
(10, 'EDIT_USERS', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `permission_role`
--

INSERT INTO `permission_role` (`id`, `created_at`, `updated_at`, `permission_id`, `role_id`) VALUES
(1, '2018-05-20 15:32:46', NULL, 1, 1),
(2, NULL, NULL, 2, 1),
(3, NULL, NULL, 3, 1),
(4, NULL, NULL, 4, 1),
(5, NULL, NULL, 5, 1),
(7, NULL, NULL, 7, 1),
(8, NULL, NULL, 3, 2),
(9, NULL, NULL, 2, 3),
(10, NULL, NULL, 3, 3),
(11, NULL, NULL, 5, 3),
(12, NULL, NULL, 6, 3),
(13, NULL, NULL, 5, 2),
(14, NULL, NULL, 4, 2),
(15, NULL, NULL, 7, 2),
(16, NULL, NULL, 6, 2),
(18, NULL, NULL, 8, 1),
(19, NULL, NULL, 9, 1),
(20, NULL, NULL, 10, 1),
(21, NULL, NULL, 10, 2),
(22, NULL, NULL, 6, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `portfolios`
--

CREATE TABLE `portfolios` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `filter_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `portfolios`
--

INSERT INTO `portfolios` (`id`, `title`, `text`, `customer`, `alias`, `img`, `created_at`, `updated_at`, `filter_alias`, `keywords`, `meta_desc`) VALUES
(1, 'Steep This!', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.\\r\\n\\r\\nDonec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum, sem lacus ultrices est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.\\r\\n\\r\\nSed porttitor eros ut purus elementum a consectetur purus vulputate ', 'Steep This!', 'project1', '{\"mini\":\"0061-175x175.jpg\",\"max\":\"0061-770x368.jpg\",\"path\":\"0061.jpg\"}', '2018-04-14 21:00:00', NULL, 'brand-identity', '', ''),
(2, 'Kineda', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.\\r\\n\\r\\nDonec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum, sem lacus ultrices est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.\\r\\n\\r\\nSed porttitor eros ut purus elementum a consectetur purus vulputate', 'customer', 'project2', '{\"mini\":\"009-175x175.jpg\",\"max\":\"009-770x368.jpg\",\"path\":\"009.jpg\"}', '2018-04-09 21:00:00', NULL, 'brand-identity', '', ''),
(3, 'Love', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.\\r\\n\\r\\nDonec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum, sem lacus ultrices est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.\\r\\n\\r\\nSed porttitor eros ut purus elementum a consectetur purus vulputate', 'customer3', 'project3', '{\"mini\":\"0011-175x175.jpg\",\"max\":\"0043-770x368.jpg\",\"path\":\"0043.jpg\"}', '2018-04-01 21:00:00', NULL, 'brand-identity', '', ''),
(4, 'Guanacos', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.\\r\\n\\r\\nDonec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum, sem lacus ultrices est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.\\r\\n\\r\\nSed porttitor eros ut purus elementum a consectetur purus vulputate', 'Steep This!', 'project4', '{\"mini\":\"0027-175x175.jpg\",\"max\":\"0027-770x368.jpg\",\"path\":\"0027.jpg\"}', '2018-03-31 21:00:00', NULL, 'brand-identity', '', ''),
(5, 'Miller Bob', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.\\r\\n\\r\\nDonec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum, sem lacus ultrices est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.\\r\\n\\r\\nSed porttitor eros ut purus elementum a consectetur purus vulputate', 'customer', 'project5', '{\"mini\":\"0071-175x175.jpg\",\"max\":\"0071-770x368.jpg\",\"path\":\"0071.jpg\"}', '2018-04-04 21:00:00', NULL, 'brand-identity', '', ''),
(6, 'Nili Studios', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.\\r\\n\\r\\nDonec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum, sem lacus ultrices est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.\\r\\n\\r\\nSed porttitor eros ut purus elementum a consectetur purus vulputate', 'customer6', 'project6', '{\"mini\":\"0052-175x175.jpg\",\"max\":\"0052-770x368.jpg\",\"path\":\"0052.jpg\"}', '2018-04-17 03:00:00', NULL, 'brand-identity', '', ''),
(7, 'VItale Premium', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.\\r\\n\\r\\nDonec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum, sem lacus ultrices est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.\\r\\n\\r\\nSed porttitor eros ut purus elementum a consectetur purus vulputate', 'Steep This!', 'project7', '{\"mini\":\"0081-175x175.jpg\",\"max\":\"0081-770x368.jpg\",\"path\":\"0081.jpg\"}', '2018-04-04 11:00:00', NULL, 'brand-identity', '', ''),
(8, 'Digitpool Medien', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.\\r\\n\\r\\nDonec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum, sem lacus ultrices est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.\\r\\n\\r\\nSed porttitor eros ut purus elementum a consectetur purus vulputate', 'customer8', 'project8', '{\"mini\":\"0071-175x175.jpg\",\"max\":\"0071.jpg\",\"path\":\"0071-770x368.jpg\"}', '2018-04-16 08:16:30', NULL, 'brand-identity', '', ''),
(9, 'Octopus', 'Nullam volutpat, mauris scelerisque iaculis semper, justo odio rutrum urna, at cursus urna nisl et ipsum. Donec dapibus lacus nec sapien faucibus eget suscipit lorem mattis.\\r\\n\\r\\nDonec non mauris ac nulla consectetur pretium sit amet rhoncus neque. Maecenas aliquet, diam sed rhoncus vestibulum, sem lacus ultrices est, eu hendrerit tortor nulla in dui. Suspendisse enim purus, euismod interdum viverra eget, ultricies eu est. Maecenas dignissim mauris id est semper suscipit. Suspendisse venenatis vestibulum quam, quis porttitor arcu vestibulum et.\\r\\n\\r\\nSed porttitor eros ut purus elementum a consectetur purus vulputate', 'customer9', 'project9', '{\"mini\":\"0081-175x175.jpg\",\"max\":\"0081.jpg\",\"path\":\"0081-770x368.jpg\"}', '2018-04-27 05:40:40', NULL, 'brand-identity', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'moderator', NULL, NULL),
(3, 'guest', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `role_id` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `role_user`
--

INSERT INTO `role_user` (`id`, `created_at`, `updated_at`, `user_id`, `role_id`) VALUES
(2, NULL, NULL, 2, 1),
(3, NULL, NULL, 3, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sliders`
--

INSERT INTO `sliders` (`id`, `img`, `desc`, `title`, `created_at`, `updated_at`) VALUES
(1, 'xx.jpg', 'Nam id quam a odio euismod pellentesque. Etiam congue rutrum risus non vestibulum. Quisque a diam at ligula blandit consequat. Mauris ac mi velit, a tempor neque', '<h2 style=\"color:#fff\">CORPORATE, MULTIPURPOSE.. <br /><span>PINK RIO</span></h2>', NULL, NULL),
(2, '00314.jpg', 'Nam id quam a odio euismod pellentesque. Etiam congue rutrum risus non vestibulum. Quisque a diam at ligula blandit consequat. Mauris ac mi velit, a tempor neque', '<h2 style=\"color:#fff\">PINKRIO. <span>STRONG AND POWERFUL.</span></h2>', NULL, NULL),
(3, 'dd.jpg', 'Nam id quam a odio euismod pellentesque. Etiam congue rutrum risus non vestibulum. Quisque a diam at ligula blandit consequat. Mauris ac mi velit, a tempor neque', '<h2 style=\"color:#fff\">PINKRIO. <span>STRONG AND POWERFUL.</span></h2>', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `login` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `login`) VALUES
(1, 'User', 'user@mail.ru', '$2y$10$emXnSuT.vhyZ0nFnFDvYuOcaTrAeu0mU/cunnoRYQ9ZpNPmj4Dixu', 'OnD1Kg9K3DY5rlN9D387lwaHBQmOZHUm4S4ajg696XuKe0SHJv2r65kFVLE0', '2018-04-11 16:10:40', '2018-04-11 16:10:40', 'user'),
(2, 'User2', 'user2@mail.ru', '$2y$10$u/W1Xt8G0NbfclRJuk66He8HWBfnupRwTWKZlQ03lAdPUobv.1Uf.', 'khu2QX9viD7e6CyKgX6wM0GxJlZ9N5sakNsLdT1zEg9kDvXKtJo6HzlI085R', '2018-05-09 16:13:11', '2018-05-09 16:13:11', 'user2'),
(3, 'User3', 'user3@mail.ru', '$2y$10$m1E00TPYKVEnFEukqQ7MeOczyG2a31SvBCuKMTLoZ9iqK33Gnq5lO', NULL, '2018-07-02 16:21:56', '2018-07-02 16:21:56', 'user3');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `articles_alias_unique` (`alias`),
  ADD KEY `articles_user_id_foreign` (`user_id`),
  ADD KEY `articles_category_id_foreign` (`category_id`);

--
-- Индексы таблицы `cache`
--
ALTER TABLE `cache`
  ADD UNIQUE KEY `cache_key_unique` (`key`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_alias_unique` (`alias`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_article_id_foreign` (`article_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Индексы таблицы `filters`
--
ALTER TABLE `filters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filters_alias_unique` (`alias`);

--
-- Индексы таблицы `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `portfolios`
--
ALTER TABLE `portfolios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `portfolios_alias_unique` (`alias`),
  ADD KEY `portfolios_filter_alias_foreign` (`filter_alias`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Индексы таблицы `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `filters`
--
ALTER TABLE `filters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `portfolios`
--
ALTER TABLE `portfolios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `articles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Ограничения внешнего ключа таблицы `portfolios`
--
ALTER TABLE `portfolios`
  ADD CONSTRAINT `portfolios_filter_alias_foreign` FOREIGN KEY (`filter_alias`) REFERENCES `filters` (`alias`);

--
-- Ограничения внешнего ключа таблицы `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

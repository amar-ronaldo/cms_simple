-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.38-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table cms_deptech.access_log
CREATE TABLE IF NOT EXISTS `access_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_ref_auth_user` int(11) DEFAULT NULL,
  `log_date` datetime DEFAULT NULL,
  `activity` varchar(130) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `detail` longtext,
  PRIMARY KEY (`id`),
  KEY `id_auth_user` (`id_ref_auth_user`),
  CONSTRAINT `access_log_ubfk1` FOREIGN KEY (`id_ref_auth_user`) REFERENCES `ref_auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.access_log: ~81 rows (approximately)
/*!40000 ALTER TABLE `access_log` DISABLE KEYS */;
INSERT INTO `access_log` (`id`, `id_ref_auth_user`, `log_date`, `activity`, `ip`, `detail`) VALUES
	(1, 1, '2018-12-19 11:16:09', 'Login', '192.168.10.71', NULL),
	(2, 1, '2019-01-03 16:58:31', 'Incorrect password', '192.168.10.46', NULL),
	(3, 1, '2019-01-03 16:59:20', 'Incorrect password', '192.168.10.46', NULL),
	(4, NULL, '2019-01-03 17:00:13', NULL, '192.168.10.71', NULL),
	(5, NULL, '2019-01-03 17:00:16', NULL, '192.168.10.71', NULL),
	(6, NULL, '2019-01-03 17:00:18', NULL, '192.168.10.71', NULL),
	(7, NULL, '2019-01-03 17:00:21', NULL, '192.168.10.71', NULL),
	(8, NULL, '2019-01-03 17:00:23', NULL, '192.168.10.71', NULL),
	(9, 1, '2019-01-03 17:00:31', 'Login', '192.168.10.71', NULL),
	(10, 1, '2019-01-03 17:00:52', 'Login', '192.168.10.46', NULL),
	(11, 1, '2019-04-18 18:10:11', 'Incorrect password', '192.168.10.203', NULL),
	(12, 1, '2019-04-18 18:12:51', 'Incorrect password', '::1', NULL),
	(13, 1, '2019-04-18 18:12:55', 'Login', '::1', NULL),
	(14, NULL, '2019-07-23 19:07:16', 'User not found : root', '192.168.10.215', NULL),
	(15, 1, '2019-07-23 19:07:26', 'Incorrect password', '192.168.10.215', NULL),
	(16, 1, '2019-07-23 19:07:28', 'Incorrect password', '192.168.10.215', NULL),
	(17, 1, '2019-07-23 19:08:15', 'Login', '192.168.10.215', NULL),
	(18, 1, '2019-07-25 13:36:18', 'Incorrect password', '192.168.10.215', NULL),
	(19, 1, '2019-07-25 13:36:27', 'Login', '192.168.10.215', NULL),
	(20, 1, '2019-07-25 13:39:33', 'Login', '192.168.10.215', NULL),
	(21, NULL, '2019-08-15 16:40:34', 'User not found : publisher@localhost.com', '192.168.10.61', NULL),
	(22, NULL, '2019-08-15 16:40:36', 'User not found : publisher@localhost.com', '192.168.10.61', NULL),
	(23, NULL, '2019-08-15 16:40:51', 'User not found : publisher@localhost.com', '192.168.10.61', NULL),
	(24, NULL, '2019-08-15 16:41:46', 'User not found : publisher', '192.168.10.61', NULL),
	(25, NULL, '2019-08-15 16:41:47', 'User not found : publisher', '192.168.10.61', NULL),
	(26, NULL, '2019-08-15 16:41:50', 'User not found : publisher@localhost.com', '192.168.10.61', NULL),
	(27, NULL, '2019-08-15 16:43:02', 'User not found : superadmin@localhost.com', '192.168.10.61', NULL),
	(28, NULL, '2019-08-15 16:43:06', 'User not found : superadmin@localhost.com', '192.168.10.61', NULL),
	(29, NULL, '2019-08-15 16:43:07', 'User not found : superadmin@localhost.com', '192.168.10.61', NULL),
	(30, NULL, '2019-08-15 16:43:10', 'User not found : superadmin@localhost.com', '192.168.10.61', NULL),
	(31, 1, '2019-10-15 21:57:04', 'Incorrect password', '114.124.214.119', NULL),
	(32, 1, '2019-11-15 09:26:38', 'Incorrect password', '192.168.10.63', NULL),
	(33, 1, '2019-11-15 09:26:40', 'Incorrect password', '192.168.10.63', NULL),
	(34, 1, '2019-11-15 09:26:41', 'Incorrect password', '192.168.10.63', NULL),
	(35, 1, '2019-11-15 09:26:42', 'Incorrect password', '192.168.10.63', NULL),
	(36, 1, '2019-11-15 09:26:43', 'Incorrect password', '192.168.10.63', NULL),
	(37, 1, '2019-11-15 09:26:46', 'Incorrect password', '192.168.10.63', NULL),
	(38, NULL, '2019-11-15 09:26:52', 'User not found : superadmin@localhost.com', '192.168.10.63', NULL),
	(39, NULL, '2019-11-15 09:26:53', 'User not found : superadmin@localhost.com', '192.168.10.63', NULL),
	(40, 1, '2019-11-15 09:26:57', 'Incorrect password', '192.168.10.63', NULL),
	(41, 1, '2019-11-15 09:47:26', 'Incorrect password', '192.168.10.63', NULL),
	(42, 1, '2019-11-15 09:47:27', 'Incorrect password', '192.168.10.63', NULL),
	(43, 1, '2019-11-15 09:47:28', 'Incorrect password', '192.168.10.63', NULL),
	(44, 1, '2019-11-15 09:47:29', 'Incorrect password', '192.168.10.63', NULL),
	(45, 1, '2019-11-15 09:47:29', 'Incorrect password', '192.168.10.63', NULL),
	(46, 1, '2019-11-15 09:47:29', 'Incorrect password', '192.168.10.63', NULL),
	(47, 1, '2019-11-15 09:47:29', 'Incorrect password', '192.168.10.63', NULL),
	(48, 1, '2019-11-15 09:48:26', 'Login', '192.168.10.63', NULL),
	(49, NULL, '2019-11-15 13:09:25', 'Logout', '::1', NULL),
	(50, 1, '2019-11-15 13:09:36', 'Login', '::1', NULL),
	(51, 1, '2019-11-15 14:24:16', 'Insert Frontend Menu', '::1', 'INSERT INTO `frontend_menu` (`id_menu_position`, `name`, `id_ref_frontend_menu_type`, `publish_date`, `id_ref_status_publish`, `seo_title`, `meta_description`, `meta_keywords`, `create_date`, `id_ref_auth_user_create`) VALUES (\'5\', \'home\', \'2\', \'2019-11-15 00:00:00\', \'2\', \'Home\', \'<p>home page</p>\\r\\n\', \'home page\', \'2019-11-15 14:24:16\', \'1\');\n'),
	(52, 1, '2019-11-15 14:42:56', 'Insert Auth Group', '::1', 'INSERT INTO `pages` (`id_ref_language`, `page_name`, `uri_path`, `teaser`, `page_content`, `create_date`, `id_ref_auth_user_create`) VALUES (\'1\', \'Visi Misi\', \'visi-misi\', \'Visi Misi\', \'<div class=\\"row\\">\\r\\n<div class=\\"col-md-12\\">\\r\\n<div class=\\"thumb-content-box\\"><img alt=\\"image\\" src=\\"http://localhost/cms_deptech/images/article/large/visi-misi.jpg\\" /></div>\\r\\n</div>\\r\\n</div>\\r\\n\\r\\n\\r\\n<div class=\\"row\\">\\r\\n<div class=\\"col-md-6\\">\\r\\n<div class=\\"content-box\\">\\r\\n<h2 class=\\"title\\"><a href=\\"#\\">Visi Fakultas Tarbiyah</a></h2>\\r\\n\\r\\n<div class=\\"content\\">\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae risus vestibulum, feugiat tellus nec, finibus nisi. Duis eu quam feugiat metus semper sollicitudin sed quis erat. Morbi hendrerit imperdiet mi ut tristique. Integer vitae viverra lacus. Donec quis erat vehicula, faucibus tellus ut, finibus nunc.</p>\\r\\n\\r\\n<p>Donec luctus, felis id varius facilisis, nulla urna suscipit nibh, sed hendrerit tellus ligula at arcu. In lorem lacus, dapibus eu congue at, consectetur sit amet leo.</p>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n\\r\\n\\r\\n<div class=\\"col-md-6\\">\\r\\n<div class=\\"content-box\\">\\r\\n<h2 class=\\"title\\"><a href=\\"#\\">Misi Fakultas Tarbiyah</a></h2>\\r\\n\\r\\n<div class=\\"content\\">\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae risus vestibulum, feugiat tellus nec, finibus nisi. Duis eu quam feugiat metus semper sollicitudin sed quis erat. Morbi hendrerit imperdiet mi ut tristique. Integer vitae viverra lacus. Donec quis erat vehicula, faucibus tellus ut, finibus nunc.</p>\\r\\n\\r\\n<p>Donec luctus, felis id varius facilisis, nulla urna suscipit nibh, sed hendrerit tellus ligula at arcu. In lorem lacus, dapibus eu congue at, consectetur sit amet leo.</p>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n\', \'2019-11-15 14:42:56\', \'1\');\n'),
	(53, 1, '2019-11-15 14:46:29', 'Update Frontend Menu', '::1', 'UPDATE `frontend_menu` SET `id_menu_position` = \'5\', `name` = \'Visi Misi\', `id_parent` = \'2\', `id_ref_frontend_menu_type` = \'1\', `id_ref_module` = \'1\', `extra_param` = \'pages/visi-misi\', `publish_date` = \'2019-11-15 00:00:00\', `description` = \'<p>Visi Misi</p>\\r\\n\', `id_ref_status_publish` = \'2\', `seo_title` = \'Visi Misi\', `meta_description` = \'<p>VISI MISI</p>\\r\\n\', `meta_keywords` = \'Visi Misi\', `id_ref_auth_user_modify` = \'1\', `modify_date` = \'2019-11-15 14:46:29\'\nWHERE `id` = \'7\';\n'),
	(54, 1, '2019-11-15 14:47:41', 'Insert Frontend Menu', '::1', 'INSERT INTO `frontend_menu` (`id_menu_position`, `name`, `id_parent`, `id_ref_frontend_menu_type`, `id_ref_module`, `extra_param`, `publish_date`, `description`, `id_ref_status_publish`, `seo_title`, `meta_description`, `meta_keywords`, `create_date`, `id_ref_auth_user_create`) VALUES (\'5\', \'Visi Misi\', \'2\', \'1\', \'1\', \'pages/visi-misi\', \'2019-11-15 00:00:00\', \'<p>Visi Misi</p>\\r\\n\', \'2\', \'Visi Misi\', \'<p>Visi Misi</p>\\r\\n\', \'Visi Misi\', \'2019-11-15 14:47:41\', \'1\');\n'),
	(55, 1, '2019-11-15 14:53:07', 'Insert Auth Group', '::1', 'INSERT INTO `pages` (`page_name`, `uri_path`, `teaser`, `page_content`, `seo_title`, `meta_keywords`, `create_date`, `id_ref_auth_user_create`) VALUES (\'Tujuan Fakultas Tarbiyah\', \'tujuan-fakultas-tarbiyah\', \'Tujuan Fakultas Tarbiyah\', \'<div class=\\"row\\">\\r\\n<div class=\\"col-md-6\\">\\r\\n<div class=\\"about-us pad-top55px\\">\\r\\n<h2 class=\\"title-about-us\\">Tujuan Fakultas Tarbiyah</h2>\\r\\n\\r\\n<div class=\\"desc\\">\\r\\n<p>Vut sagittis a, magna ridiculus! Scelerisque parturient! Cum duis nunc in, dignissim, porta porta enim, proin turpis egestas! Mauris dapibus sed integer placerat, scelerisque! Ac enim nascetur rhoncus facilisis phasellus eu sit turpis purus magna auctor nunc facilisis parturient ac tempor, montes etiam tortor rhoncus! In, aliquam. Elementum urna, tincidunt? Nisi ut urna? Arcu, odio facilisis urna magna vel, elementum integer quis nisi nisi scelerisque etiam.</p>\\r\\n\\r\\n<ul><li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\\r\\n	<li>Nam ultrices elit augue, at euismod ipsum bibendum at.</li>\\r\\n	<li>Nulla semper consectetur ex,</li>\\r\\n	<li>Integer nisl nisi, scelerisque in metus nec</li>\\r\\n	<li>Aenean suscipit ullamcorper aliquam.</li>\\r\\n</ul></div>\\r\\n</div>\\r\\n</div>\\r\\n\\r\\n\\r\\n<div class=\\"col-md-6\\">\\r\\n<div class=\\"single-image\\"><img alt=\\"image\\" src=\\"http://localhost/cms_deptech/images/article/large/about5.png\\" /></div>\\r\\n</div>\\r\\n</div>\\r\\n\', \'Tujuan Fakultas Tarbiyah\', \'Tujuan Fakultas Tarbiyah\', \'2019-11-15 14:53:07\', \'1\');\n'),
	(56, 1, '2019-11-15 14:56:36', 'Insert Auth Group', '::1', 'INSERT INTO `pages` (`page_name`, `uri_path`, `teaser`, `page_content`, `seo_title`, `meta_description`, `meta_keywords`, `create_date`, `id_ref_auth_user_create`) VALUES (\'Struktur Organisasi\', \'struktur-organisasi\', \'Struktur Organisasi\', \'<p><img alt=\\"\\" src=\\"http://localhost/cms_deptech/images/article/large/struktur-organisasi.png\\" style=\\"height:802px;\\" /></p>\\r\\n\', \'Struktur Organisasi\', \'<p>Struktur Organisasi</p>\\r\\n\', \'Struktur Organisasi\', \'2019-11-15 14:56:36\', \'1\');\n'),
	(57, 1, '2019-11-15 14:59:46', 'Insert Auth Group', '::1', 'INSERT INTO `pages` (`page_name`, `uri_path`, `teaser`, `page_content`, `seo_title`, `meta_description`, `meta_keywords`, `create_date`, `id_ref_auth_user_create`) VALUES (\'Lembaga\', \'lembaga\', \'Lembaga\', \'<div class=\\"row\\">\\r\\n<div class=\\"col-md-6\\">\\r\\n<div class=\\"single-image style1\\"><img alt=\\"image\\" src=\\"images/about4.png\\" /></div>\\r\\n</div>\\r\\n\\r\\n\\r\\n<div class=\\"col-md-6\\">\\r\\n<div class=\\"row\\">\\r\\n<div class=\\"col-md-12 col-sm-12 col-xs-12 pad-bottom50px\\">\\r\\n<div class=\\"flat-iconbox style1\\">\\r\\n<div class=\\"content\\">\\r\\n<h6 class=\\"title\\"><a href=\\"http://lp2m.ptiq.ac.id\\">Lembaga Penjamin Mutu (LPM)</a></h6>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque, odio. Dolores reprehenderit nihil, molestias eveniet.</p>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n\\r\\n<div class=\\"col-md-12 col-sm-12 col-xs-12 pad-bottom50px\\">\\r\\n<div class=\\"flat-iconbox style1\\">\\r\\n<div class=\\"content\\">\\r\\n<h6 class=\\"title\\"><a href=\\"http://lpm.ptiq.ac.id\\">Lembaga Penelitian dan Pengabdian Kepada Masyarakat (LP2M)</a></h6>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque, odio. Dolores reprehenderit nihil.</p>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n\\r\\n<div class=\\"col-md-12 col-sm-12 col-xs-12 pad-bottom50px\\">\\r\\n<div class=\\"flat-iconbox style1\\">\\r\\n<div class=\\"content\\">\\r\\n<h6 class=\\"title\\"><a href=\\"http://lpm.ptiq.ac.id\\">Lembaga Tahfizh dan Tilawah Al-Qur\\\'an (LTTQ)</a></h6>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque, odio. Dolores reprehenderit nihil.</p>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n\', \'Lembaga\', \'<p>Lembaga</p>\\r\\n\', \'Lembaga\', \'2019-11-15 14:59:46\', \'1\');\n'),
	(58, 1, '2019-11-15 15:03:05', 'Update Auth Group', '::1', 'UPDATE `pages` SET `id_ref_language` = \'1\', `page_name` = \'Lembaga\', `uri_path` = \'lembaga\', `teaser` = \'Lembaga\', `page_content` = \'<div class=\\"container\\">\\r\\n<div class=\\"row\\">\\r\\n<div class=\\"col-md-6\\">\\r\\n<div class=\\"single-image style1\\"><img alt=\\"image\\" src=\\"http://localhost/cms_deptech/images/article/large/about4.png\\" /></div>\\r\\n</div>\\r\\n\\r\\n\\r\\n<div class=\\"col-md-6\\">\\r\\n<div class=\\"row\\">\\r\\n<div class=\\"col-md-12 col-sm-12 col-xs-12 pad-bottom50px\\">\\r\\n<div class=\\"flat-iconbox style1\\">\\r\\n<div class=\\"content\\">\\r\\n<h6 class=\\"title\\"><a href=\\"http://lp2m.ptiq.ac.id\\">Lembaga Penjamin Mutu (LPM)</a></h6>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque, odio. Dolores reprehenderit nihil, molestias eveniet.</p>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n\\r\\n<div class=\\"col-md-12 col-sm-12 col-xs-12 pad-bottom50px\\">\\r\\n<div class=\\"flat-iconbox style1\\">\\r\\n<div class=\\"content\\">\\r\\n<h6 class=\\"title\\"><a href=\\"http://lpm.ptiq.ac.id\\">Lembaga Penelitian dan Pengabdian Kepada Masyarakat (LP2M)</a></h6>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque, odio. Dolores reprehenderit nihil.</p>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n\\r\\n<div class=\\"col-md-12 col-sm-12 col-xs-12 pad-bottom50px\\">\\r\\n<div class=\\"flat-iconbox style1\\">\\r\\n<div class=\\"content\\">\\r\\n<h6 class=\\"title\\"><a href=\\"http://lpm.ptiq.ac.id\\">Lembaga Tahfizh dan Tilawah Al-Qur\\\'an (LTTQ)</a></h6>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Neque, odio. Dolores reprehenderit nihil.</p>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n\', `img` = \'\', `seo_title` = \'Lembaga\', `meta_description` = \'<p>Lembaga</p>\\r\\n\', `meta_keywords` = \'Lembaga\', `id_ref_auth_user_modify` = \'1\', `modify_date` = \'2019-11-15 15:03:05\'\nWHERE `id` = \'4\';\n'),
	(59, 1, '2019-11-15 15:21:26', 'Insert Auth Group', '::1', 'INSERT INTO `pages` (`page_name`, `uri_path`, `teaser`, `page_content`, `seo_title`, `meta_description`, `meta_keywords`, `create_date`, `id_ref_auth_user_create`) VALUES (\'pai\', \'pai\', \'pai\', \'<div class=\\"row\\">\\r\\n<div class=\\"col-md-12\\">\\r\\n<div class=\\"feature-post\\"><img alt=\\"image\\" src=\\"http://localhost/cms_deptech/images/article/large/masjid-darul-quran.jpg\\" /></div>\\r\\n\\r\\n\\r\\n<div class=\\"main-post\\">\\r\\n<div class=\\"row\\">\\r\\n<div class=\\"col-md-10 col-md-offset-1\\">\\r\\n<h2 class=\\"title-post\\"><a href=\\"#\\">Pendidikan Agama Islam (PAI)</a></h2>\\r\\n\\r\\n<p>Fakultas Tarbiyah Intitut PTIQ Jakarta</p>\\r\\n\\r\\n<div class=\\"entry-post\\">\\r\\n<p><b>Ketua Program Studi : Dr. Abd. Muid N, M.A.</b></p>\\r\\n\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla ornare dignissim felis nec malesuada. Nunc fringilla est nec nisi accumsan porta. Praesent non aliquam augue, sed aliquet elit. Nam pretium eu est sed tincidunt. Donec ullamcorper odio vitae felis tempor suscipit tincidunt nec orci. Duis vulputate, nunc id vestibulum imperdiet, dui neque mattis erat, maximus ornare nisi nisi tempor ante.</p>\\r\\n\\r\\n<div class=\\"row\\">\\r\\n<div class=\\"col-md-6\\">\\r\\n<div class=\\"content-box\\">\\r\\n<h2 class=\\"title\\"><a href=\\"#\\">Visi</a></h2>\\r\\n\\r\\n<div class=\\"content\\">\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae risus vestibulum, feugiat tellus nec, finibus nisi. Duis eu quam feugiat metus semper sollicitudin sed quis erat. Morbi hendrerit imperdiet mi ut tristique. Integer vitae viverra lacus. Donec quis erat vehicula, faucibus tellus ut, finibus nunc.</p>\\r\\n\\r\\n<p>Donec luctus, felis id varius facilisis, nulla urna suscipit nibh, sed hendrerit tellus ligula at arcu. In lorem lacus, dapibus eu congue at, consectetur sit amet leo.</p>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n\\r\\n<div class=\\"col-md-6\\">\\r\\n<div class=\\"content-box\\">\\r\\n<h2 class=\\"title\\"><a href=\\"#\\">Misi</a></h2>\\r\\n\\r\\n<div class=\\"content\\">\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vitae risus vestibulum, feugiat tellus nec, finibus nisi. Duis eu quam feugiat metus semper sollicitudin sed quis erat. Morbi hendrerit imperdiet mi ut tristique. Integer vitae viverra lacus. Donec quis erat vehicula, faucibus tellus ut, finibus nunc.</p>\\r\\n\\r\\n<p>Donec luctus, felis id varius facilisis, nulla urna suscipit nibh, sed hendrerit tellus ligula at arcu. In lorem lacus, dapibus eu congue at, consectetur sit amet leo.</p>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n\\r\\n<div class=\\"load-more pad-top50px\\"><a class=\\"flat-button\\" href=\\"#\\">Lihat Kurikulum</a></div>\\r\\n</div>\\r\\n\\r\\n\\r\\n<ul class=\\"flat-socials\\"><li> </li>\\r\\n	<li> </li>\\r\\n	<li> </li>\\r\\n	<li> </li>\\r\\n</ul></div>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n\', \'pai\', \'<p>pai</p>\\r\\n\', \'pai\', \'2019-11-15 15:21:26\', \'1\');\n'),
	(60, 1, '2019-11-15 15:22:16', 'Update Auth Group', '::1', 'UPDATE `pages` SET `id_ref_language` = \'1\', `page_name` = \'Pendidikan Agama Islam (PAI)\', `uri_path` = \'pendidikan-agama-islam-pai\', `teaser` = \'Pendidikan Agama Islam (PAI)\', `page_content` = \'<div class=\\"row\\">\\r\\n<div class=\\"col-md-12\\">\\r\\n<div class=\\"feature-post\\"><img alt=\\"image\\" src=\\"http://localhost/cms_deptech/images/article/large/masjid-darul-quran.jpg\\" /></div>\\r\\n\\r\\n<div class=\\"main-post\\">\\r\\n<div class=\\"row\\"> </div>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n\', `img` = \'\', `seo_title` = \'Pendidikan Agama Islam (PAI)\', `meta_description` = \'<p><a href=\\"http://localhost/cms_deptech/design_front/pai.html#\\" style=\\"background:transparent;color:rgb(2,127,21);font-family:inherit;font-size:30px;font-weight:inherit;font-style:inherit;vertical-align:baseline;margin:0px;padding:0px;border:0px;line-height:30px;text-transform:capitalize;\\">Pendidikan Agama Islam (PAI)</a></p>\\r\\n\', `meta_keywords` = \'Pendidikan Agama Islam (PAI)\', `id_ref_auth_user_modify` = \'1\', `modify_date` = \'2019-11-15 15:22:16\'\nWHERE `id` = \'5\';\n'),
	(61, 1, '2019-11-15 15:24:02', 'Update Auth Group', '::1', 'UPDATE `pages` SET `id_ref_language` = \'1\', `page_name` = \'Pendidikan Islam Anak Usia Dini (PIAUD)\', `uri_path` = \'pendidikan-islam-anak-usia-dini-piaud\', `teaser` = \'Pendidikan Islam Anak Usia Dini (PIAUD)\', `page_content` = \'<div class=\\"row\\">\\r\\n<div class=\\"col-md-12\\">\\r\\n<div class=\\"feature-post\\"><img alt=\\"image\\" src=\\"http://localhost/cms_deptech/images/article/large/masjid-darul-quran.jpg\\" /></div>\\r\\n\\r\\n<div class=\\"main-post\\">\\r\\n<div class=\\"row\\"> </div>\\r\\n</div>\\r\\n</div>\\r\\n</div>\\r\\n\', `img` = \'\', `seo_title` = \'Pendidikan Islam Anak Usia Dini (PIAUD)\', `meta_description` = \'<p><a href=\\"http://localhost/cms_deptech/design_front/piaud.html#\\" style=\\"background:transparent;color:rgb(0,0,0);font-family:inherit;font-size:30px;font-weight:inherit;font-style:inherit;vertical-align:baseline;margin:0px;padding:0px;border:0px;line-height:30px;text-transform:capitalize;\\">Pendidikan Islam Anak Usia Dini (PIAUD)</a></p>\\r\\n\', `meta_keywords` = \'Pendidikan Islam Anak Usia Dini (PIAUD)\', `id_ref_auth_user_modify` = \'1\', `modify_date` = \'2019-11-15 15:24:02\'\nWHERE `id` = \'6\';\n'),
	(62, 1, '2019-11-15 16:21:49', 'Insert Auth Group', '::1', 'INSERT INTO `pages` (`page_name`, `uri_path`, `teaser`, `page_content`, `create_date`, `id_ref_auth_user_create`) VALUES (\'TARBIYAH INTITUT PTIQ\', \'tarbiyah-intitut-ptiq\', \'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur adipisicing elit.\', \'<p><a class=\\"flat-button style1\\" href=\\"#\\">Hubungi Kami</a></p>\\r\\n\', \'2019-11-15 16:21:49\', \'1\');\n'),
	(63, 1, '2019-11-15 16:32:18', 'Insert Auth Group', '::1', 'INSERT INTO `pages` (`page_name`, `uri_path`, `teaser`, `page_content`, `img`, `create_date`, `id_ref_auth_user_create`) VALUES (\'testimony\', \'testimony\', \'testimony\', \'<div class=\\"flat-team style1\\">\\r\\n<div class=\\"descritption\\">\\r\\n<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et velit metus. Vivamus nulla est, accumsan ut turpis sed, accumsan tincidunt lacus. Sed et nisl tincidunt sapien suscipit maximus ut non urna. Phasellus tempus arcu vel odio lobortis pretium. Proin tincidunt eget lacus nec tincidunt. Sed dapibus massa sed felis sodales, sed ornare metus gravida. Etiam tempus lobortis felis, sollicitudin ultricies ipsum porta nec. Quisque at luctus dui, eu accumsan nunc.</p></blockquote>\\r\\n</div>\\r\\n\\r\\n<div class=\\"profile\\"> </div>\\r\\n\\r\\n<div class=\\"signature\\">\\r\\n<p>Prof. Dr. H. Nasaruddin Umar, M.A.</p>\\r\\n<span class=\\"position\\">Rektor</span></div>\\r\\n</div>\\r\\n\', \'nasaruddinumar.png\', \'2019-11-15 16:32:18\', \'1\');\n'),
	(64, 1, '2019-11-15 16:35:10', 'Insert Auth Group', '::1', 'INSERT INTO `pages` (`page_name`, `uri_path`, `teaser`, `page_content`, `create_date`, `id_ref_auth_user_create`) VALUES (\'Akreditasi\', \'akreditasi\', \'Vut sagittis a, magna ridiculus! Scelerisque parturient! Cum duis nunc in, dignissim, porta porta enim, proin\\r\\nturpis egestas! Mauris dapibus sed integer placerat, scelerisque!\', \'<ul class=\\"akreditasi-list\\"><li><a href=\\"#\\"><img alt=\\"\\" src=\\"http://localhost/cms_deptech/images/article/large/computer-engineering.jpg\\" /></a></li>\\r\\n	<li><a href=\\"#\\"><img alt=\\"\\" src=\\"http://localhost/cms_deptech/images/article/large/ban-pt.jpg\\" /></a></li>\\r\\n</ul>\', \'2019-11-15 16:35:10\', \'1\');\n'),
	(65, 1, '2019-11-15 16:36:13', 'Insert Auth Group', '::1', 'INSERT INTO `pages` (`page_name`, `uri_path`, `teaser`, `create_date`, `id_ref_auth_user_create`) VALUES (\'Gallery PTIQ\', \'gallery-ptiq\', \'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat, maiores, minus! Incidunt, numquam, temporibus.\', \'2019-11-15 16:36:13\', \'1\');\n'),
	(66, 1, '2019-11-15 16:36:39', 'Insert Auth Group', '::1', 'INSERT INTO `pages` (`page_name`, `uri_path`, `teaser`, `create_date`, `id_ref_auth_user_create`) VALUES (\'Pengumuman\', \'pengumuman\', \'Dolorem omnis odit quos iste quisquam, quam maiores a expedita voluptates, atque enim consequuntur quasi soluta!\', \'2019-11-15 16:36:39\', \'1\');\n'),
	(67, 1, '2019-11-15 16:37:10', 'Insert Auth Group', '::1', 'INSERT INTO `pages` (`page_name`, `uri_path`, `teaser`, `create_date`, `id_ref_auth_user_create`) VALUES (\'Lastest News\', \'lastest-news\', \'Vut sagittis a, magna ridiculus! Scelerisque parturient! Cum duis nunc in, dignissim, porta porta enim, proin\\r\\nturpis egestas! Mauris dapibus sed integer placerat, scelerisque!\', \'2019-11-15 16:37:10\', \'1\');\n'),
	(68, 1, '2019-11-15 17:39:06', 'Insert News', '::1', 'INSERT INTO `ref_news` (`id_ref_language`, `id_ref_news_category`, `title`, `uri_path`, `teaser`, `img`, `publish_date`, `id_ref_status_publish`, `page_content`, `create_date`, `id_ref_auth_user_create`) VALUES (\'1\', \'3\', \'arek III Institut PTIQ Hadir dalam Silaturahim Forkopimko\', \'arek-iii-institut-ptiq-hadir-dalam-silaturahim-forkopimko\', \'Dalam acara tersebut Kapolres Metro Jakarta Selatan Kombes Bastoni Purnama memberikan sambutan kepada seluruh tamu undangan yang hadir terkhusus memberikan bimbingan dan arahan kepada mahasiswa yang hadir mewakili kampus se-Jakarta Selatan., “Teman-teman Mahasiswa ini merupakan generasi penerus bangsa, beberapa hari terakhir ini menjelang pelantikan DPR, MPR \', \'b2.jpg\', \'2019-11-15\', \'2\', \'<p>Dalam acara tersebut Kapolres Metro Jakarta Selatan Kombes Bastoni Purnama memberikan sambutan kepada seluruh tamu undangan yang hadir terkhusus memberikan bimbingan dan arahan kepada mahasiswa yang hadir mewakili kampus se-Jakarta Selatan., “Teman-teman Mahasiswa ini merupakan generasi penerus bangsa, beberapa hari terakhir ini menjelang pelantikan DPR, MPR</p>\\r\\n\\r\\n<p>dawadwawdawdawdddwaawwdd a w d  a wwdaaw dw a dawa dwdwadawdwadawd wawdjhjk awp daw jdiuaud awudaupdh jwpoaidjwapdh wahpdiolwakhd oa;pd uawjhdwaydjaw8odghwadoawihj</p>\\r\\n\', \'2019-11-15 17:39:06\', \'1\');\n'),
	(69, 1, '2019-11-15 21:35:16', 'Login', '::1', NULL),
	(70, 1, '2019-11-16 12:57:49', 'Incorrect password', '::1', NULL),
	(71, 1, '2019-11-16 12:57:53', 'Login', '::1', NULL),
	(72, 1, '2019-11-16 12:59:30', 'Delete Language', '::1', 'UPDATE `ref_language` SET `id_ref_delete` = 1, `id_ref_auth_user_modify` = \'1\', `modify_date` = \'2019-11-16 12:59:30\'\nWHERE `id` = \'2\';\n'),
	(73, 1, '2019-11-16 13:00:18', 'Masih Ada 2 Sub Menu!', '::1', 'SELECT *\nFROM `ref_menu_admin`\nWHERE `id_ref_menu_admin_parents` = \'28\' and `id_ref_delete` =0;\n'),
	(74, 1, '2019-11-16 13:28:47', 'Insert News', '::1', 'INSERT INTO `ref_banner` (`id_ref_language`, `title`, `teaser`, `img`, `link`, `publish_date`, `id_ref_status_publish`, `create_date`, `id_ref_auth_user_create`) VALUES (\'1\', \'Asesmen Lapangan Prodi Magister \\r\\nManajemen Pendidikan Islam\', \'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tinci\\r\\ndunt elit felis, at sagittis enim congue et. Mauris nec auctor erat,\\r\\nsed cursus lectus.\', \'4.jpg\', \'#\', \'2019-11-16\', \'2\', \'2019-11-16 13:28:47\', \'1\');\n'),
	(75, 1, '2019-11-16 13:29:11', 'Delete News', '::1', 'UPDATE `ref_banner` SET `id_ref_delete` = 1, `id_ref_auth_user_modify` = \'1\', `modify_date` = \'2019-11-16 13:29:11\'\nWHERE `id` = \'2\';\n'),
	(76, 1, '2019-11-16 13:36:12', 'Update News', '::1', 'UPDATE `ref_banner` SET `id_ref_language` = \'1\', `title` = \'Asesmen Lapangan Prodi Magister \\r\\nManajemen Pendidikan Islam\', `teaser` = \'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tinci\\r\\ndunt elit felis, at sagittis enim congue et. Mauris nec auctor erat,\\r\\nsed cursus lectus.\', `img` = \'\', `link` = \'\', `publish_date` = \'2019-11-16\', `id_ref_status_publish` = \'2\', `id_ref_auth_user_modify` = \'1\', `modify_date` = \'2019-11-16 13:36:12\'\nWHERE `id` = \'2\';\n'),
	(77, 1, '2019-11-16 13:39:15', 'Update News', '::1', 'UPDATE `ref_banner` SET `id_ref_language` = \'1\', `title` = \'Asesmen Lapangan Prodi Magister \\r\\nManajemen Pendidikan Islam\', `teaser` = \'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tinci\\r\\ndunt elit felis, at sagittis enim congue et. Mauris nec auctor erat,\\r\\nsed cursus lectus.\', `img` = \'4.jpg\', `link` = \'\', `publish_date` = \'2019-11-16\', `id_ref_status_publish` = \'2\', `id_ref_auth_user_modify` = \'1\', `modify_date` = \'2019-11-16 13:39:15\'\nWHERE `id` = \'2\';\n'),
	(78, 1, '2019-11-16 16:09:10', 'Incorrect password', '::1', NULL),
	(79, 1, '2019-11-16 16:09:12', 'Login', '::1', NULL),
	(80, 1, '2019-11-16 20:16:34', 'Incorrect password', '::1', NULL),
	(81, 1, '2019-11-16 20:16:39', 'Login', '::1', NULL),
	(82, 1, '2019-11-17 11:10:26', 'Login', '::1', NULL);
/*!40000 ALTER TABLE `access_log` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ci_sessions
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `ip_address` varchar(200) NOT NULL DEFAULT 'NULL',
  `user_agent` varchar(200) DEFAULT 'NULL',
  `last_activity` int(11) NOT NULL DEFAULT '0',
  `user_data` longtext,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table cms_deptech.ci_sessions: ~0 rows (approximately)
/*!40000 ALTER TABLE `ci_sessions` DISABLE KEYS */;
INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
	('63690aaa2f3a51a69ebb6f83881d26b0', '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 1448438274, 'a:1:{s:8:"ADM_SESS";a:7:{s:10:"admin_name";s:12:"Super Admin ";s:24:"admin_id_auth_user_group";s:1:"1";s:2:"id";s:1:"1";s:18:"admin_id_auth_user";s:1:"1";s:12:"admin_id_ref";N;s:10:"admin_type";N;s:15:"profil_mitra_id";N;}}');
/*!40000 ALTER TABLE `ci_sessions` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.comment_like
CREATE TABLE IF NOT EXISTS `comment_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_ref_news` int(11) NOT NULL COMMENT 'ID News',
  `id_ref_comment` int(11) NOT NULL COMMENT 'ID Comment',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data, Jika 1 = Data terhapus, 0 = Data Aktif',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `id_ref_lang` int(11) NOT NULL DEFAULT '1' COMMENT 'ID Language',
  `id_ref_lang_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  PRIMARY KEY (`id`),
  KEY `id_news` (`id_ref_news`,`id_ref_comment`,`id_ref_lang`),
  KEY `comment_like_ubfk2` (`id_ref_comment`),
  KEY `comment_like_ubfk3` (`id_ref_lang`),
  CONSTRAINT `comment_like_ubfk1` FOREIGN KEY (`id_ref_news`) REFERENCES `ref_news` (`id`),
  CONSTRAINT `comment_like_ubfk2` FOREIGN KEY (`id_ref_comment`) REFERENCES `ref_comment` (`id`),
  CONSTRAINT `comment_like_ubfk3` FOREIGN KEY (`id_ref_lang`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.comment_like: ~0 rows (approximately)
/*!40000 ALTER TABLE `comment_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_like` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.contact_us_reply
CREATE TABLE IF NOT EXISTS `contact_us_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Contact Us Reply',
  `id_ref_contact_us` int(11) NOT NULL COMMENT 'ID Contact Us',
  `message` varchar(500) NOT NULL COMMENT 'Pesan',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `id_ref_language` int(11) NOT NULL DEFAULT '1' COMMENT 'ID Language',
  `id_ref_language_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  PRIMARY KEY (`id`),
  KEY `id_contact_us` (`id_ref_contact_us`,`id_ref_language`),
  KEY `contact_us_reply_ubfk2` (`id_ref_language`),
  CONSTRAINT `contact_us_reply_ubfk1` FOREIGN KEY (`id_ref_contact_us`) REFERENCES `ref_contact_us` (`id`),
  CONSTRAINT `contact_us_reply_ubfk2` FOREIGN KEY (`id_ref_language`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.contact_us_reply: ~0 rows (approximately)
/*!40000 ALTER TABLE `contact_us_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_us_reply` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.email_config
CREATE TABLE IF NOT EXISTS `email_config` (
  `id` int(11) NOT NULL COMMENT 'ID Email Config',
  `smtp_host` varchar(255) DEFAULT NULL COMMENT 'Host SMTP',
  `port` varchar(10) DEFAULT NULL COMMENT 'Port',
  `is_ssl` char(2) DEFAULT NULL COMMENT 'SSL',
  `smtp_user_alias` varchar(64) DEFAULT NULL COMMENT 'Alias User SMTP',
  `smtp_user` varchar(128) DEFAULT NULL COMMENT 'SMTP User',
  `smtp_pass` varchar(255) DEFAULT NULL COMMENT 'SMTP Password',
  `type` varchar(10) DEFAULT NULL COMMENT 'Type',
  `sendmail_path` varchar(255) DEFAULT NULL COMMENT 'Path Sendmail ',
  `smtp_user_from` varchar(64) DEFAULT NULL COMMENT 'SMTP User From',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.email_config: ~0 rows (approximately)
/*!40000 ALTER TABLE `email_config` DISABLE KEYS */;
INSERT INTO `email_config` (`id`, `smtp_host`, `port`, `is_ssl`, `smtp_user_alias`, `smtp_user`, `smtp_pass`, `type`, `sendmail_path`, `smtp_user_from`, `id_ref_delete`) VALUES
	(1, 'mail.smtp2go.com', '587', 'n', 'no-reply@deptechdigital.com', 'ammar@deptechdigital.com', 'CBHmXXPM5BtT', 'smtp', '', 'Admin KSI Indonesia', 0);
/*!40000 ALTER TABLE `email_config` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.event
CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Event',
  `id_ref_event_category` int(11) NOT NULL COMMENT 'ID Event Category',
  `id_ref_status_publish` smallint(3) NOT NULL COMMENT 'ID Status Publish',
  `name` varchar(200) NOT NULL DEFAULT 'NULL' COMMENT 'Nama Event',
  `teaser` longtext COMMENT 'Teaser Event',
  `content` longtext COMMENT 'Konten',
  `uri_path` varchar(200) NOT NULL DEFAULT 'NULL' COMMENT 'Uri Path',
  `img` varchar(200) DEFAULT 'NULL' COMMENT 'Gambar Event',
  `publish_date` date NOT NULL COMMENT 'Tanggal Publish',
  `speaker` varchar(130) DEFAULT NULL COMMENT 'Speaker',
  `start_date` date DEFAULT NULL COMMENT 'Tanggal Mulai',
  `end_date` date DEFAULT NULL COMMENT 'Tanggal Akhir',
  `location` varchar(255) NOT NULL COMMENT 'Lokasi',
  `start_time` time DEFAULT NULL COMMENT 'Waktu Mulai',
  `end_time` time DEFAULT NULL COMMENT 'Waktu Akhir',
  `seo_title` longtext NOT NULL COMMENT 'Judul SEO',
  `meta_description` longtext NOT NULL COMMENT 'Deskripsi Meta',
  `meta_keywords` longtext NOT NULL COMMENT 'Kata Kunci Meta',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `id_ref_auth_user_create` int(11) NOT NULL DEFAULT '0' COMMENT 'ID Auth User Create',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_modify` int(11) DEFAULT '0' COMMENT 'ID Auth User Modify',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  `id_ref_language` int(11) DEFAULT '1' COMMENT 'ID Language',
  `id_ref_language_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  PRIMARY KEY (`id`),
  KEY `id_event_category` (`id_ref_event_category`,`id_ref_status_publish`,`id_ref_language`),
  KEY `event_ubfk2` (`id_ref_status_publish`),
  KEY `event_ubfk3` (`id_ref_language`),
  CONSTRAINT `event_ubfk1` FOREIGN KEY (`id_ref_event_category`) REFERENCES `ref_event_category` (`id`),
  CONSTRAINT `event_ubfk2` FOREIGN KEY (`id_ref_status_publish`) REFERENCES `ref_status_publish` (`id`),
  CONSTRAINT `event_ubfk3` FOREIGN KEY (`id_ref_language`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.event: ~0 rows (approximately)
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.file_manager
CREATE TABLE IF NOT EXISTS `file_manager` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'ID File Manager',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Nama File Manager',
  `is_public` smallint(3) NOT NULL DEFAULT '0' COMMENT 'Flag Public ',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Buat',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table cms_deptech.file_manager: ~13 rows (approximately)
/*!40000 ALTER TABLE `file_manager` DISABLE KEYS */;
INSERT INTO `file_manager` (`id`, `name`, `is_public`, `id_ref_delete`, `id_ref_auth_user_create`, `create_date`, `id_ref_auth_user_modify`, `modify_date`) VALUES
	(1, 'download123.png', 1, 1, 1, '2019-07-23 19:09:01', 1, '2019-07-23 19:09:22'),
	(2, 'download123.png', 1, 0, 1, '2019-07-23 19:09:49', NULL, NULL),
	(3, 'download123.png', 1, 0, 1, '2019-07-25 13:40:36', NULL, NULL),
	(4, 'visi-misi.jpg', 1, 0, 1, '2019-11-15 14:40:35', NULL, NULL),
	(5, 'about5.png', 1, 0, 1, '2019-11-15 14:51:51', NULL, NULL),
	(6, 'struktur-organisasi.png', 1, 0, 1, '2019-11-15 14:55:25', NULL, NULL),
	(7, 'about4.png', 1, 0, 1, '2019-11-15 15:01:11', NULL, NULL),
	(8, 'masjid-darul-quran.jpg', 1, 0, 1, '2019-11-15 15:19:26', NULL, NULL),
	(9, 'nasaruddinumar.png', 1, 0, 1, '2019-11-15 16:31:49', NULL, NULL),
	(10, 'computer-engineering.jpg', 1, 0, 1, '2019-11-15 16:34:08', NULL, NULL),
	(11, 'ban-pt.jpg', 1, 0, 1, '2019-11-15 16:34:28', NULL, NULL),
	(12, 'b2.jpg', 1, 0, 1, '2019-11-15 17:37:50', NULL, NULL),
	(13, '4.jpg', 1, 0, 1, '2019-11-16 13:22:15', NULL, NULL);
/*!40000 ALTER TABLE `file_manager` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.frontend_menu
CREATE TABLE IF NOT EXISTS `frontend_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Frontend Menu',
  `id_menu_position` int(11) DEFAULT NULL COMMENT 'Posisi Menu',
  `id_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Frontend Menu',
  `id_ref_frontend_menu_type` int(11) NOT NULL COMMENT 'ID Frontend Menu ',
  `id_ref_module` int(11) DEFAULT NULL COMMENT 'ID Module',
  `id_ref_status_publish` smallint(3) NOT NULL COMMENT 'ID Status Publish',
  `name` varchar(64) NOT NULL COMMENT 'Nama Frontend Menu',
  `extra_param` varchar(50) DEFAULT NULL COMMENT 'Extra Param',
  `publish_date` datetime NOT NULL COMMENT 'Tanggal Publish',
  `position` int(11) DEFAULT NULL COMMENT 'Posisi',
  `img` varchar(100) DEFAULT NULL,
  `seo_title` longtext COMMENT 'Judul SEO',
  `meta_description` longtext COMMENT 'Deskripsi Meta',
  `meta_keywords` longtext COMMENT 'Kata kunci Meta',
  `description` longtext COMMENT 'Deskripsi',
  `id_ref_delete` smallint(3) DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  `id_ref_language` int(11) NOT NULL DEFAULT '1' COMMENT 'ID Language',
  `id_ref_language_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  PRIMARY KEY (`id`),
  KEY `id_language` (`id_ref_language`),
  KEY `id_menu_position` (`id_menu_position`,`id_parent`,`id_ref_frontend_menu_type`,`id_ref_module`,`id_ref_status_publish`),
  KEY `frontend_menu_ubfk2` (`id_parent`),
  KEY `frontend_menu_ubfk3` (`id_ref_frontend_menu_type`),
  KEY `frontend_menu_ubfk4` (`id_ref_module`),
  KEY `frontend_menu_ubfk5` (`id_ref_status_publish`),
  CONSTRAINT `frontend_menu_ubfk1` FOREIGN KEY (`id_menu_position`) REFERENCES `menu_position` (`id`),
  CONSTRAINT `frontend_menu_ubfk2` FOREIGN KEY (`id_parent`) REFERENCES `frontend_menu` (`id`),
  CONSTRAINT `frontend_menu_ubfk3` FOREIGN KEY (`id_ref_frontend_menu_type`) REFERENCES `ref_frontend_menu_type` (`id`),
  CONSTRAINT `frontend_menu_ubfk4` FOREIGN KEY (`id_ref_module`) REFERENCES `ref_module` (`id`),
  CONSTRAINT `frontend_menu_ubfk5` FOREIGN KEY (`id_ref_status_publish`) REFERENCES `ref_status_publish` (`id`),
  CONSTRAINT `frontend_menu_ubfk6` FOREIGN KEY (`id_ref_language`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.frontend_menu: ~21 rows (approximately)
/*!40000 ALTER TABLE `frontend_menu` DISABLE KEYS */;
INSERT INTO `frontend_menu` (`id`, `id_menu_position`, `id_parent`, `id_ref_frontend_menu_type`, `id_ref_module`, `id_ref_status_publish`, `name`, `extra_param`, `publish_date`, `position`, `img`, `seo_title`, `meta_description`, `meta_keywords`, `description`, `id_ref_delete`, `create_date`, `id_ref_auth_user_create`, `id_ref_auth_user_modify`, `modify_date`, `id_ref_language`, `id_ref_language_parent`) VALUES
	(1, 5, NULL, 2, NULL, 2, 'HOME', 'home', '2019-11-15 00:00:00', NULL, NULL, 'Home', '<p>home page</p>\r\n', 'home page', NULL, 0, '2019-11-15 14:24:16', 1, NULL, NULL, 1, NULL),
	(2, 5, NULL, 2, NULL, 2, 'PROFIL FAKULTAS', NULL, '2019-11-15 00:00:00', NULL, NULL, 'PROFIL FAKULTAS', 'PROFIL FAKULTAS', 'PROFIL FAKULTAS', NULL, 0, '2019-11-15 14:24:16', 1, NULL, NULL, 1, NULL),
	(3, 5, NULL, 2, NULL, 2, 'PROGRAM STUDI', NULL, '2019-11-15 00:00:00', NULL, NULL, 'PROGRAM STUDI', 'PROGRAM STUDI', 'PROGRAM STUDI', NULL, 0, '2019-11-15 14:24:16', 1, NULL, NULL, 1, NULL),
	(4, 5, NULL, 2, NULL, 2, 'STAF DOSEN', NULL, '2019-11-15 00:00:00', NULL, NULL, 'STAF DOSEN', 'STAF DOSEN', 'STAF DOSEN', NULL, 0, '2019-11-15 14:24:16', 1, NULL, NULL, 1, NULL),
	(5, 5, NULL, 2, NULL, 2, 'FASILITAS', NULL, '2019-11-15 00:00:00', NULL, NULL, 'FASILITAS', 'FASILITAS', 'FASILITAS', NULL, 0, '2019-11-15 14:24:16', 1, NULL, NULL, 1, NULL),
	(6, 5, NULL, 2, NULL, 2, 'KEGIATAN', NULL, '2019-11-15 00:00:00', NULL, NULL, 'KEGIATAN', 'KEGIATAN', 'KEGIATAN', NULL, 0, '2019-11-15 14:24:16', 1, NULL, NULL, 1, NULL),
	(8, 5, 2, 1, 1, 2, 'Visi Misi', 'pages/visi-misi', '2019-11-15 00:00:00', NULL, NULL, 'Visi Misi', 'Visi Misi', 'Visi Misi', 'Visi Misi', 0, '2019-11-15 14:47:41', 1, NULL, NULL, 1, NULL),
	(9, 5, 2, 1, 1, 2, 'Tujuan Fakultas Tarbiyah', 'pages/tujuan-fakultas-tarbiyah', '2019-11-15 00:00:00', NULL, NULL, 'Tujuan Fakultas Tarbiyah', 'Tujuan Fakultas Tarbiyah', 'Tujuan Fakultas Tarbiyah', 'Tujuan Fakultas Tarbiyah', 0, '2019-11-15 14:47:41', 1, NULL, NULL, 1, NULL),
	(10, 5, 2, 1, 1, 2, 'Struktur Organisasi', 'pages/struktur-organisasi', '2019-11-15 00:00:00', NULL, NULL, 'Struktur Organisasi', 'Struktur Organisasi', 'Struktur Organisasi', 'Struktur Organisasi', 0, '2019-11-15 14:47:41', 1, NULL, NULL, 1, NULL),
	(11, 5, 2, 1, 1, 2, 'Lembaga', 'pages/lembaga', '2019-11-15 00:00:00', NULL, NULL, 'Lembaga', 'Lembaga', 'Lembaga', 'Lembaga', 0, '2019-11-15 14:47:41', 1, NULL, NULL, 1, NULL),
	(12, 5, 2, 2, NULL, 2, 'Kerjasama/MOU', 'kerjasama', '2019-11-15 00:00:00', NULL, NULL, 'Kerjasama/MOU', 'Kerjasama/MOU', 'Kerjasama/MOU', 'kerjasama', 0, '2019-11-15 14:47:41', 1, NULL, NULL, 1, NULL),
	(13, 5, 3, 1, 1, 2, 'Pendidikan Agama Islam (PAI)', 'pages/pendidikan-agama-islam-pai', '2019-11-15 00:00:00', NULL, NULL, 'Pendidikan Agama Islam (PAI)', 'Pendidikan Agama Islam (PAI)', 'Pendidikan Agama Islam (PAI)', 'Pendidikan Agama Islam (PAI)', 0, '2019-11-15 14:47:41', 1, NULL, NULL, 1, NULL),
	(14, 5, 3, 1, 1, 2, 'Pendidikan Islam Anak Usia Dini (PIAUD)', 'pages/pendidikan-islam-anak-usia-dini-piaud', '2019-11-15 00:00:00', NULL, NULL, 'Pendidikan Islam Anak Usia Dini (PIAUD)', 'Pendidikan Islam Anak Usia Dini (PIAUD)', 'Pendidikan Islam Anak Usia Dini (PIAUD)', 'Pendidikan Islam Anak Usia Dini (PIAUD)', 0, '2019-11-15 14:47:41', 1, NULL, NULL, 1, NULL),
	(15, 5, 4, 2, NULL, 2, 'Dosen Pendidikan Agama Islam (PAI)', 'dosen/pai', '2019-11-15 00:00:00', NULL, NULL, 'Dosen Pendidikan Agama Islam (PAI)', 'Dosen Pendidikan Agama Islam (PAI)', 'Dosen Pendidikan Agama Islam (PAI)', 'Dosen Pendidikan Agama Islam (PAI)', 0, '2019-11-15 14:47:41', 1, NULL, NULL, 1, NULL),
	(16, 5, 4, 2, NULL, 2, 'Dosen Islam Anak Usia Dini (PIAUD)', 'dosen/piaud', '2019-11-15 00:00:00', NULL, NULL, 'Dosen Islam Anak Usia Dini (PIAUD)', 'Dosen Islam Anak Usia Dini (PIAUD)', 'Dosen Islam Anak Usia Dini (PIAUD)', 'Dosen Islam Anak Usia Dini (PIAUD)', 0, '2019-11-15 14:47:41', 1, NULL, NULL, 1, NULL),
	(17, 5, 5, 2, NULL, 2, 'Ruang Kuliah', 'gallery/detail/fasilitas/ruang-kuliah', '2019-11-15 00:00:00', NULL, NULL, 'Perpustakaan', 'Perpustakaan', 'Perpustakaan', 'Perpustakaan', 0, '2019-11-15 14:47:41', 1, NULL, NULL, 1, NULL),
	(18, 5, 5, 2, NULL, 2, 'Masjid/Mushola', 'gallery/detail/fasilitas/masjidmushola', '2019-11-15 00:00:00', NULL, NULL, 'Masjid/Mushola', 'Masjid/Mushola', 'Masjid/Mushola', 'Masjid/Mushola', 0, '2019-11-15 14:47:41', 1, NULL, NULL, 1, NULL),
	(19, 5, 5, 2, NULL, 2, 'Tempat Parkir', 'gallery/detail/fasilitas/tempat-parkir', '2019-11-15 00:00:00', NULL, NULL, 'Tempat Parkir', 'Tempat Parkir', 'Tempat Parkir', 'Tempat Parkir', 0, '2019-11-15 14:47:41', 1, NULL, NULL, 1, NULL),
	(20, 5, 5, 2, NULL, 2, 'Kantin (Fasilitas Umum)', 'gallery/detail/fasilitas/kantin-fasilitas-umum', '2019-11-15 00:00:00', NULL, NULL, 'Kantin (Fasilitas Umum)', 'Kantin (Fasilitas Umum)', 'Kantin (Fasilitas Umum)', 'Kantin (Fasilitas Umum)', 0, '2019-11-15 14:47:41', 1, NULL, NULL, 1, NULL),
	(21, 5, 5, 2, NULL, 2, 'Perpustakaan', 'gallery/detail/fasilitas/perpustakaan', '2019-11-15 00:00:00', NULL, NULL, 'Perpustakaan', 'Perpustakaan', 'Perpustakaan', 'Perpustakaan', 0, '2019-11-15 14:47:41', 1, NULL, NULL, 1, NULL),
	(22, 5, 6, 2, NULL, 2, 'Kegiatan Akademik', 'kegiatan/kegiatan-akademik', '2019-11-15 00:00:00', NULL, NULL, 'Kegiatan Akademik', 'Kegiatan Akademik', 'Kegiatan Akademik', 'Kegiatan Akademik', 0, '2019-11-15 14:47:41', 1, NULL, NULL, 1, NULL),
	(23, 5, 6, 2, NULL, 2, 'Kegiatan Kemahasiswaan', 'kegiatan/kegiatan-kemahasiswaan', '2019-11-15 00:00:00', NULL, NULL, 'Kegiatan Kemahasiswaan', 'Kegiatan Kemahasiswaan', 'Kegiatan Kemahasiswaan', 'Kegiatan Kemahasiswaan', 0, '2019-11-15 14:47:41', 1, NULL, NULL, 1, NULL);
/*!40000 ALTER TABLE `frontend_menu` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.login_transaction
CREATE TABLE IF NOT EXISTS `login_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Login Transaction',
  `id_ref_auth_user` int(11) NOT NULL COMMENT 'ID Pengguna',
  `ip_address` varchar(150) NOT NULL COMMENT 'IP Address',
  `user_agent` varchar(130) NOT NULL COMMENT 'Nama Browser',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `last_activity` datetime NOT NULL COMMENT 'Activiitas Terakhir Dilakukan',
  `id_ref_active` smallint(3) NOT NULL COMMENT 'ID Status Active',
  `lock_date` datetime NOT NULL COMMENT 'Tanggal Lock',
  PRIMARY KEY (`id`),
  KEY `is_active` (`id_ref_active`),
  CONSTRAINT `login_transaction_ufbk1` FOREIGN KEY (`id_ref_active`) REFERENCES `ref_active` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.login_transaction: ~14 rows (approximately)
/*!40000 ALTER TABLE `login_transaction` DISABLE KEYS */;
INSERT INTO `login_transaction` (`id`, `id_ref_auth_user`, `ip_address`, `user_agent`, `create_date`, `last_activity`, `id_ref_active`, `lock_date`) VALUES
	(1, 1, '192.168.10.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '2018-12-19 11:16:09', '2019-01-03 17:00:31', 2, '2019-01-03 17:00:31'),
	(2, 1, '192.168.10.71', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '2019-01-03 17:00:31', '2019-01-03 17:00:31', 1, '0000-00-00 00:00:00'),
	(3, 1, '192.168.10.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36', '2019-01-03 17:00:52', '2019-01-03 17:00:52', 1, '0000-00-00 00:00:00'),
	(4, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.103 Safari/537.36', '2019-04-18 18:12:55', '2019-11-15 21:35:16', 2, '2019-11-15 21:35:16'),
	(5, 1, '192.168.10.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', '2019-07-23 19:08:15', '2019-07-25 13:36:27', 2, '2019-07-25 13:36:27'),
	(6, 1, '192.168.10.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', '2019-07-25 13:36:27', '2019-07-25 13:39:33', 2, '2019-07-25 13:39:33'),
	(7, 1, '192.168.10.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.142 Safari/537.36', '2019-07-25 13:39:33', '2019-07-25 13:39:33', 1, '0000-00-00 00:00:00'),
	(8, 1, '192.168.10.63', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '2019-11-15 09:48:26', '2019-11-15 09:48:26', 1, '0000-00-00 00:00:00'),
	(9, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '2019-11-15 13:09:36', '2019-11-15 21:35:16', 2, '2019-11-15 21:35:16'),
	(10, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '2019-11-15 21:35:16', '2019-11-16 12:57:53', 2, '2019-11-16 12:57:53'),
	(11, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '2019-11-16 12:57:53', '2019-11-16 16:09:12', 2, '2019-11-16 16:09:12'),
	(12, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '2019-11-16 16:09:12', '2019-11-16 20:16:39', 2, '2019-11-16 20:16:39'),
	(13, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '2019-11-16 20:16:39', '2019-11-17 11:10:26', 2, '2019-11-17 11:10:26'),
	(14, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36', '2019-11-17 11:10:26', '2019-11-17 11:10:26', 1, '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `login_transaction` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.log_email
CREATE TABLE IF NOT EXISTS `log_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Log Email',
  `id_ref_email_tmp` int(11) NOT NULL COMMENT 'ID Email Template',
  `from_email` varchar(30) NOT NULL COMMENT 'Email Dari',
  `to_email` varchar(30) NOT NULL COMMENT 'Email Untuk ',
  `process_date` datetime NOT NULL COMMENT 'Tanggal Proses',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.log_email: ~25 rows (approximately)
/*!40000 ALTER TABLE `log_email` DISABLE KEYS */;
INSERT INTO `log_email` (`id`, `id_ref_email_tmp`, `from_email`, `to_email`, `process_date`) VALUES
	(1, 1, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-28 15:18:24'),
	(2, 1, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-28 15:19:17'),
	(3, 1, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-28 16:01:40'),
	(4, 1, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-28 16:02:04'),
	(5, 1, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-28 16:03:18'),
	(6, 1, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-28 16:12:11'),
	(7, 1, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-28 16:32:31'),
	(8, 13, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-28 17:17:25'),
	(9, 13, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-28 17:18:37'),
	(10, 1, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-28 17:23:18'),
	(11, 13, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-28 17:23:51'),
	(12, 13, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-28 17:25:00'),
	(13, 1, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-29 10:20:55'),
	(14, 13, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-29 10:21:35'),
	(15, 1, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-29 13:52:04'),
	(16, 1, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-29 13:52:15'),
	(17, 13, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-29 13:53:12'),
	(18, 1, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-29 16:49:27'),
	(19, 1, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-29 16:49:52'),
	(20, 13, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-29 16:56:44'),
	(21, 1, 'ammar@deptechdigital.com', 'ismatul.maula@deptechdigital.c', '2018-11-30 14:14:56'),
	(22, 1, 'ammar@deptechdigital.com', 'anisafitri891@gmail.com', '2018-12-04 19:38:48'),
	(23, 1, 'ammar@deptechdigital.com', 'anisafitri891@gmail.com', '2018-12-04 19:40:03'),
	(24, 1, 'ammar@deptechdigital.com', 'anisafitri891@gmail.com', '2018-12-04 19:40:34'),
	(25, 15, 'ammar@deptechdigital.com', 'anisa@deptechdigital.com', '2018-12-05 10:42:58');
/*!40000 ALTER TABLE `log_email` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.menu_position
CREATE TABLE IF NOT EXISTS `menu_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Menu Position',
  `name` varchar(50) DEFAULT '' COMMENT 'Nama Menu Position',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_modify` int(11) NOT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  `id_ref_delete` smallint(3) NOT NULL COMMENT 'ID Status Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table cms_deptech.menu_position: ~5 rows (approximately)
/*!40000 ALTER TABLE `menu_position` DISABLE KEYS */;
INSERT INTO `menu_position` (`id`, `name`, `id_ref_auth_user_create`, `create_date`, `id_ref_auth_user_modify`, `modify_date`, `id_ref_delete`) VALUES
	(1, 'Top Menu', 1, '2018-12-03 14:59:00', 0, '0000-00-00 00:00:00', 0),
	(2, 'Left Menu', 1, '2018-12-03 14:59:00', 0, '0000-00-00 00:00:00', 0),
	(3, 'Right Menu', 1, '2018-12-03 14:59:00', 0, '0000-00-00 00:00:00', 0),
	(4, 'Bottom Menu', 1, '2018-12-03 14:59:00', 0, '0000-00-00 00:00:00', 0),
	(5, 'Header Menu', 1, '2018-12-03 14:59:00', 0, '0000-00-00 00:00:00', 0);
/*!40000 ALTER TABLE `menu_position` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.news_tags
CREATE TABLE IF NOT EXISTS `news_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID News Tags',
  `id_ref_news` int(11) DEFAULT NULL COMMENT 'ID News',
  `id_ref_tags` int(11) DEFAULT NULL COMMENT 'ID Tags',
  `id_ref_auth_user_create` int(11) DEFAULT NULL COMMENT 'ID Auth User Create',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  PRIMARY KEY (`id`),
  KEY `id_tags` (`id_ref_tags`),
  KEY `id_news` (`id_ref_news`),
  KEY `is_delete` (`id_ref_delete`),
  CONSTRAINT `news_tags_ufbk1` FOREIGN KEY (`id_ref_news`) REFERENCES `ref_news` (`id`),
  CONSTRAINT `news_tags_ufbk2` FOREIGN KEY (`id_ref_tags`) REFERENCES `ref_tags` (`id`),
  CONSTRAINT `news_tags_ufbk3` FOREIGN KEY (`id_ref_delete`) REFERENCES `ref_delete` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table cms_deptech.news_tags: ~0 rows (approximately)
/*!40000 ALTER TABLE `news_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_tags` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.pages
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Pages',
  `page_name` varchar(60) NOT NULL DEFAULT 'NULL' COMMENT 'Nama Halaman / Pages',
  `teaser` varchar(255) DEFAULT NULL COMMENT 'Teaser',
  `page_content` text COMMENT 'Halaman Konten',
  `uri_path` varchar(60) NOT NULL DEFAULT 'NULL' COMMENT 'Uri Path',
  `img` varchar(70) DEFAULT 'NULL' COMMENT 'Gambar',
  `seo_title` longtext NOT NULL COMMENT 'Judul SEO',
  `meta_description` longtext NOT NULL COMMENT 'Deskripsi META',
  `meta_keywords` longtext NOT NULL COMMENT 'Kata Kunci META',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL DEFAULT '0' COMMENT 'ID Auth User Create',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `id_ref_language` int(11) DEFAULT '1' COMMENT 'ID Language',
  `id_ref_language_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`id_ref_delete`),
  KEY `id_language` (`id_ref_language`),
  KEY `id_parent_language` (`id_ref_language_parent`),
  CONSTRAINT `pages_ufbk1` FOREIGN KEY (`id_ref_language`) REFERENCES `ref_language` (`id`),
  CONSTRAINT `pages_ufbk2` FOREIGN KEY (`id_ref_language_parent`) REFERENCES `ref_language` (`id`),
  CONSTRAINT `pages_ufbk3` FOREIGN KEY (`id_ref_delete`) REFERENCES `ref_delete` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table cms_deptech.pages: ~12 rows (approximately)
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` (`id`, `page_name`, `teaser`, `page_content`, `uri_path`, `img`, `seo_title`, `meta_description`, `meta_keywords`, `id_ref_delete`, `create_date`, `id_ref_auth_user_create`, `modify_date`, `id_ref_auth_user_modify`, `id_ref_language`, `id_ref_language_parent`) VALUES
	(1, 'Visi Misi', 'Visi Misi', '<div class="row">\r\n<div class="col-md-12">\r\n<div class="thumb-content-box"><img alt="image" src="http://localhost/cms_deptech/images/article/large/visi-misi.jpg" /></div>\r\n</div>\r\n</div>\r\n\r\n\r\n<div class="row">\r\n<div class="col-md-6">\r\n<div class="content-', 'visi-misi', 'NULL', '', '', '', 0, '2019-11-15 14:42:56', 1, NULL, NULL, 1, NULL),
	(2, 'Tujuan Fakultas Tarbiyah', 'Tujuan Fakultas Tarbiyah', '<div class="row">\r\n<div class="col-md-6">\r\n<div class="about-us pad-top55px">\r\n<h2 class="title-about-us">Tujuan Fakultas Tarbiyah</h2>\r\n\r\n<div class="desc">\r\n<p>Vut sagittis a, magna ridiculus! Scelerisque parturient! Cum duis nunc in, dignissim, porta p', 'tujuan-fakultas-tarbiyah', 'NULL', 'Tujuan Fakultas Tarbiyah', '', 'Tujuan Fakultas Tarbiyah', 0, '2019-11-15 14:53:07', 1, NULL, NULL, 1, NULL),
	(3, 'Struktur Organisasi', 'Struktur Organisasi', '<p><img alt="" src="http://localhost/cms_deptech/images/article/large/struktur-organisasi.png" style="height:802px;" /></p>\r\n', 'struktur-organisasi', 'NULL', 'Struktur Organisasi', '<p>Struktur Organisasi</p>\r\n', 'Struktur Organisasi', 0, '2019-11-15 14:56:36', 1, NULL, NULL, 1, NULL),
	(4, 'Lembaga', 'Lembaga', '<div class="container">\r\n<div class="row">\r\n<div class="col-md-6">\r\n<div class="single-image style1"><img alt="image" src="http://localhost/cms_deptech/images/article/large/about4.png" /></div>\r\n</div>\r\n\r\n\r\n<div class="col-md-6">\r\n<div class="row">\r\n<div ', 'lembaga', '', 'Lembaga', '<p>Lembaga</p>\r\n', 'Lembaga', 0, '2019-11-15 14:59:46', 1, '2019-11-15 15:03:05', 1, 1, NULL),
	(5, 'Pendidikan Agama Islam (PAI)', 'Pendidikan Agama Islam (PAI)', '<div class="row">\r\n<div class="col-md-12">\r\n<div class="feature-post"><img alt="image" src="http://localhost/cms_deptech/images/article/large/masjid-darul-quran.jpg" /></div>\r\n\r\n<div class="main-post">\r\n<div class="row"> </div>\r\n</div>\r\n</div>\r\n</div>\r\n', 'pendidikan-agama-islam-pai', '', 'Pendidikan Agama Islam (PAI)', '<p><a href="http://localhost/cms_deptech/design_front/pai.html#" style="background:transparent;color:rgb(2,127,21);font-family:inherit;font-size:30px;font-weight:inherit;font-style:inherit;vertical-align:baseline;margin:0px;padding:0px;border:0px;line-height:30px;text-transform:capitalize;">Pendidikan Agama Islam (PAI)</a></p>\r\n', 'Pendidikan Agama Islam (PAI)', 0, '2019-11-15 15:21:26', 1, '2019-11-15 15:22:16', 1, 1, NULL),
	(6, 'Pendidikan Islam Anak Usia Dini (PIAUD)', 'Pendidikan Islam Anak Usia Dini (PIAUD)', '<div class="row">\r\n<div class="col-md-12">\r\n<div class="feature-post"><img alt="image" src="http://localhost/cms_deptech/images/article/large/masjid-darul-quran.jpg" /></div>\r\n\r\n<div class="main-post">\r\n<div class="row"> </div>\r\n</div>\r\n</div>\r\n</div>\r\n', 'pendidikan-islam-anak-usia-dini-piaud', '', 'Pendidikan Islam Anak Usia Dini (PIAUD)', '<p><a href="http://localhost/cms_deptech/design_front/piaud.html#" style="background:transparent;color:rgb(0,0,0);font-family:inherit;font-size:30px;font-weight:inherit;font-style:inherit;vertical-align:baseline;margin:0px;padding:0px;border:0px;line-height:30px;text-transform:capitalize;">Pendidikan Islam Anak Usia Dini (PIAUD)</a></p>\r\n', 'Pendidikan Islam Anak Usia Dini (PIAUD)', 0, '2019-11-15 15:21:26', 1, '2019-11-15 15:24:02', 1, 1, NULL),
	(7, 'TARBIYAH INTITUT PTIQ', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Consectetur adipisicing elit.', '<p><a class="flat-button style1" href="#">Hubungi Kami</a></p>\r\n', 'tarbiyah-intitut-ptiq', 'NULL', '', '', '', 0, '2019-11-15 16:21:49', 1, NULL, NULL, 1, NULL),
	(8, 'testimony', 'testimony', '<div class="flat-team style1">\r\n<div class="descritption">\r\n<blockquote><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam et velit metus. Vivamus nulla est, accumsan ut turpis sed, accumsan tincidunt lacus. Sed et nisl tincidunt sapien suscipit maximus ut non urna. Phasellus tempus arcu vel odio lobortis pretium. Proin tincidunt eget lacus nec tincidunt. Sed dapibus massa sed felis sodales, sed ornare metus gravida. Etiam tempus lobortis felis, sollicitudin ultricies ipsum porta nec. Quisque at luctus dui, eu accumsan nunc.</p></blockquote>\r\n</div>\r\n\r\n<div class="profile"> </div>\r\n\r\n<div class="signature">\r\n<p>Prof. Dr. H. Nasaruddin Umar, M.A.</p>\r\n<span class="position">Rektor</span></div>\r\n</div>\r\n', 'testimony', 'nasaruddinumar.png', '', '', '', 0, '2019-11-15 16:32:18', 1, NULL, NULL, 1, NULL),
	(9, 'Akreditasi', 'Vut sagittis a, magna ridiculus! Scelerisque parturient! Cum duis nunc in, dignissim, porta porta enim, proin\r\nturpis egestas! Mauris dapibus sed integer placerat, scelerisque!', '<ul class="akreditasi-list"><li><a href="#"><img alt="" src="http://localhost/cms_deptech/images/article/large/computer-engineering.jpg" /></a></li>\r\n	<li><a href="#"><img alt="" src="http://localhost/cms_deptech/images/article/large/ban-pt.jpg" /></a></li>\r\n</ul>', 'akreditasi', 'NULL', '', '', '', 0, '2019-11-15 16:35:10', 1, NULL, NULL, 1, NULL),
	(10, 'Gallery PTIQ', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quaerat, maiores, minus! Incidunt, numquam, temporibus.', NULL, 'gallery-ptiq', 'NULL', '', '', '', 0, '2019-11-15 16:36:13', 1, NULL, NULL, 1, NULL),
	(11, 'Pengumuman', 'Dolorem omnis odit quos iste quisquam, quam maiores a expedita voluptates, atque enim consequuntur quasi soluta!', NULL, 'pengumuman', 'NULL', '', '', '', 0, '2019-11-15 16:36:39', 1, NULL, NULL, 1, NULL),
	(12, 'Lastest News', 'Vut sagittis a, magna ridiculus! Scelerisque parturient! Cum duis nunc in, dignissim, porta porta enim, proin\r\nturpis egestas! Mauris dapibus sed integer placerat, scelerisque!', NULL, 'lastest-news', 'NULL', '', '', '', 0, '2019-11-15 16:37:10', 1, NULL, NULL, 1, NULL),
	(13, 'Maps', '.', '<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d11216.898255925085!2d106.77228020662959!3d-6.293613057626703!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x36b42fd414c5904c!2sInstitut%20PTIQ%20Jakarta!5e0!3m2!1sid!2sid!4v1572757088228!5m2!1sid!2sid" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>', 'maps', 'NULL', '', '', '', 0, '2019-11-15 16:37:10', 1, NULL, NULL, 1, NULL);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_active
CREATE TABLE IF NOT EXISTS `ref_active` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT COMMENT 'ID Active',
  `name` varchar(30) NOT NULL COMMENT 'Nama Status Aktif',
  `id_ref_delete` smallint(3) NOT NULL COMMENT 'ID Status Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.ref_active: ~2 rows (approximately)
/*!40000 ALTER TABLE `ref_active` DISABLE KEYS */;
INSERT INTO `ref_active` (`id`, `name`, `id_ref_delete`) VALUES
	(1, 'Active', 0),
	(2, 'Not Active', 0);
/*!40000 ALTER TABLE `ref_active` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_auth_pages
CREATE TABLE IF NOT EXISTS `ref_auth_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_ref_auth_user_group` int(11) NOT NULL COMMENT 'id auth user group',
  `id_ref_menu_admin` int(11) NOT NULL COMMENT 'id menu admin',
  `c` smallint(3) NOT NULL COMMENT 'create',
  `r` smallint(3) NOT NULL COMMENT 'read',
  `u` smallint(3) NOT NULL COMMENT 'update',
  `d` smallint(3) NOT NULL COMMENT 'delete',
  `create_date` datetime NOT NULL COMMENT 'tanggal dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL DEFAULT '1' COMMENT 'id auth user create',
  `modify_date` datetime DEFAULT NULL COMMENT 'tanggal perubahan',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'id auth user modify',
  `id_ref_delete` smallint(3) DEFAULT '0' COMMENT 'status data',
  PRIMARY KEY (`id`),
  KEY `id_auth_user_grup` (`id_ref_auth_user_group`),
  KEY `id_ref_menu_admin` (`id_ref_menu_admin`),
  CONSTRAINT `auth_pages_ubfk1` FOREIGN KEY (`id_ref_auth_user_group`) REFERENCES `ref_auth_user_group` (`id`),
  CONSTRAINT `auth_pages_ubfk2` FOREIGN KEY (`id_ref_menu_admin`) REFERENCES `ref_menu_admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.ref_auth_pages: ~160 rows (approximately)
/*!40000 ALTER TABLE `ref_auth_pages` DISABLE KEYS */;
INSERT INTO `ref_auth_pages` (`id`, `id_ref_auth_user_group`, `id_ref_menu_admin`, `c`, `r`, `u`, `d`, `create_date`, `id_ref_auth_user_create`, `modify_date`, `id_ref_auth_user_modify`, `id_ref_delete`) VALUES
	(1, 1, 1, 1, 1, 1, 1, '2018-11-23 02:03:05', 1, NULL, NULL, 0),
	(2, 2, 1, 0, 0, 0, 0, '2018-11-23 03:05:06', 1, NULL, NULL, 0),
	(3, 3, 1, 0, 0, 0, 0, '2018-11-23 04:09:11', 1, NULL, NULL, 0),
	(4, 4, 1, 0, 0, 0, 0, '2018-11-23 06:08:06', 1, NULL, NULL, 0),
	(5, 5, 1, 0, 0, 0, 0, '2018-11-23 02:03:06', 1, NULL, NULL, 0),
	(6, 1, 2, 1, 1, 1, 1, '2018-11-23 04:06:06', 1, NULL, NULL, 0),
	(7, 2, 2, 0, 0, 0, 0, '2018-11-23 00:00:00', 1, NULL, NULL, 0),
	(8, 3, 2, 0, 0, 0, 0, '2018-11-23 03:06:06', 1, NULL, NULL, 0),
	(9, 4, 2, 0, 0, 0, 0, '2018-11-23 02:05:05', 1, NULL, NULL, 0),
	(10, 5, 2, 0, 0, 0, 0, '2018-11-23 03:04:06', 1, NULL, NULL, 0),
	(11, 1, 3, 1, 1, 1, 1, '2018-11-23 03:05:05', 1, NULL, NULL, 0),
	(12, 2, 3, 0, 0, 0, 0, '2018-11-23 04:05:07', 1, NULL, NULL, 0),
	(13, 3, 3, 0, 0, 0, 0, '2018-11-23 04:05:06', 1, NULL, NULL, 0),
	(14, 4, 3, 0, 0, 0, 0, '2018-11-23 03:05:04', 1, NULL, NULL, 0),
	(15, 5, 3, 0, 0, 0, 0, '2018-11-23 04:07:05', 1, NULL, NULL, 0),
	(16, 1, 4, 1, 1, 1, 1, '2018-11-23 05:05:06', 1, NULL, NULL, 0),
	(17, 2, 4, 0, 0, 0, 0, '2018-11-23 02:08:06', 1, NULL, NULL, 0),
	(18, 3, 4, 0, 0, 0, 0, '2018-11-23 01:05:08', 1, NULL, NULL, 0),
	(19, 4, 4, 0, 0, 0, 0, '2018-11-23 05:07:10', 1, NULL, NULL, 0),
	(20, 5, 4, 0, 0, 0, 0, '2018-11-23 03:05:05', 1, NULL, NULL, 0),
	(21, 1, 5, 1, 1, 1, 1, '2018-11-23 05:05:06', 1, NULL, NULL, 0),
	(22, 2, 5, 0, 0, 0, 0, '2018-11-23 02:08:06', 1, NULL, NULL, 0),
	(23, 3, 5, 0, 0, 0, 0, '2018-11-23 01:05:08', 1, NULL, NULL, 0),
	(24, 4, 5, 0, 0, 0, 0, '2018-11-23 05:07:10', 1, NULL, NULL, 0),
	(25, 5, 5, 0, 0, 0, 0, '2018-11-23 03:05:05', 1, NULL, NULL, 0),
	(26, 1, 6, 1, 1, 1, 1, '2018-11-23 02:04:05', 1, NULL, NULL, 0),
	(27, 2, 6, 0, 0, 0, 0, '2018-11-23 03:04:09', 1, NULL, NULL, 0),
	(28, 3, 6, 0, 0, 0, 0, '2018-11-23 03:07:10', 1, NULL, NULL, 0),
	(29, 4, 6, 0, 0, 0, 0, '2018-11-23 03:04:06', 1, NULL, NULL, 0),
	(30, 5, 6, 0, 0, 0, 0, '2018-11-23 04:06:05', 1, NULL, NULL, 0),
	(31, 1, 7, 1, 1, 1, 1, '2018-11-23 02:03:04', 1, NULL, NULL, 0),
	(32, 2, 7, 0, 0, 0, 0, '2018-11-23 03:04:04', 1, NULL, NULL, 0),
	(33, 3, 7, 0, 0, 0, 0, '2018-11-23 03:07:06', 1, NULL, NULL, 0),
	(34, 4, 7, 0, 0, 0, 0, '2018-11-23 02:05:03', 1, NULL, NULL, 0),
	(35, 5, 7, 0, 0, 0, 0, '2018-11-23 02:05:05', 1, NULL, NULL, 0),
	(36, 1, 8, 1, 1, 1, 1, '2018-11-23 01:01:03', 1, NULL, NULL, 0),
	(37, 2, 8, 0, 0, 0, 0, '2018-11-23 01:04:04', 1, NULL, NULL, 0),
	(38, 3, 8, 0, 0, 0, 0, '2018-11-23 02:04:05', 1, NULL, NULL, 0),
	(39, 4, 8, 0, 0, 0, 0, '2018-11-23 03:07:04', 1, NULL, NULL, 0),
	(40, 5, 8, 0, 0, 0, 0, '2018-11-23 02:04:06', 1, NULL, NULL, 0),
	(41, 1, 9, 1, 1, 1, 1, '2018-11-23 02:04:04', 1, NULL, NULL, 0),
	(42, 2, 9, 0, 0, 0, 0, '2018-11-23 02:04:02', 1, NULL, NULL, 0),
	(43, 3, 9, 0, 0, 0, 0, '2018-11-23 03:04:03', 1, NULL, NULL, 0),
	(44, 4, 9, 0, 0, 0, 0, '2018-11-23 02:06:06', 1, NULL, NULL, 0),
	(45, 5, 9, 0, 0, 0, 0, '2018-11-23 04:02:05', 1, NULL, NULL, 0),
	(46, 1, 10, 1, 1, 1, 1, '2018-11-23 02:04:03', 1, NULL, NULL, 0),
	(47, 2, 10, 0, 0, 0, 0, '2018-11-23 04:04:04', 1, NULL, NULL, 0),
	(48, 3, 10, 0, 0, 0, 0, '2018-11-23 01:04:02', 1, NULL, NULL, 0),
	(49, 4, 10, 0, 0, 0, 0, '2018-11-23 02:06:03', 1, NULL, NULL, 0),
	(50, 5, 10, 0, 0, 0, 0, '2018-11-23 03:07:05', 1, NULL, NULL, 0),
	(51, 1, 11, 1, 1, 1, 1, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(52, 2, 11, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(53, 3, 11, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(54, 4, 11, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(55, 5, 11, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(56, 1, 12, 1, 1, 1, 1, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(57, 2, 12, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(58, 3, 12, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(59, 4, 12, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(60, 5, 12, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(61, 1, 13, 1, 1, 1, 1, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(62, 2, 13, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(63, 3, 13, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(64, 4, 13, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(65, 5, 13, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(66, 1, 14, 1, 1, 1, 1, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(67, 2, 14, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(68, 3, 14, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(69, 4, 14, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(70, 5, 14, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(71, 1, 15, 1, 1, 1, 1, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(72, 2, 15, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(73, 3, 15, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(74, 4, 15, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(75, 5, 15, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(76, 1, 16, 1, 1, 1, 1, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(77, 2, 16, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(78, 3, 16, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(79, 4, 16, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(80, 5, 16, 0, 0, 0, 0, '2018-11-23 01:03:03', 1, NULL, NULL, 0),
	(81, 1, 17, 1, 1, 1, 1, '0000-00-00 00:00:00', 1, NULL, NULL, 0),
	(82, 2, 17, 0, 1, 0, 0, '0000-00-00 00:00:00', 1, NULL, NULL, 0),
	(83, 3, 17, 0, 0, 0, 0, '0000-00-00 00:00:00', 1, NULL, NULL, 0),
	(84, 4, 17, 0, 1, 0, 0, '0000-00-00 00:00:00', 1, NULL, NULL, 0),
	(85, 5, 17, 0, 0, 0, 0, '0000-00-00 00:00:00', 1, NULL, NULL, 0),
	(86, 1, 18, 1, 1, 1, 1, '2018-11-29 17:45:48', 1, NULL, NULL, 0),
	(87, 2, 18, 1, 1, 1, 1, '2018-11-29 17:45:48', 1, NULL, NULL, 0),
	(88, 3, 18, 0, 0, 0, 0, '2018-11-29 17:45:48', 1, NULL, NULL, 0),
	(89, 4, 18, 0, 0, 0, 0, '2018-11-29 17:45:48', 1, NULL, NULL, 0),
	(90, 5, 18, 0, 0, 0, 0, '2018-11-29 17:45:48', 1, NULL, NULL, 0),
	(91, 1, 19, 1, 1, 1, 1, '2018-11-29 18:24:23', 1, NULL, NULL, 0),
	(92, 2, 19, 1, 1, 1, 1, '2018-11-29 18:24:23', 1, NULL, NULL, 0),
	(93, 3, 19, 0, 0, 0, 0, '2018-11-29 18:24:23', 1, NULL, NULL, 0),
	(94, 4, 19, 0, 0, 0, 0, '2018-11-29 18:24:23', 1, NULL, NULL, 0),
	(95, 5, 19, 0, 0, 0, 0, '2018-11-29 18:24:23', 1, NULL, NULL, 0),
	(96, 1, 20, 1, 1, 1, 1, '2018-11-29 18:43:53', 1, NULL, NULL, 0),
	(97, 2, 20, 1, 1, 1, 1, '2018-11-29 18:43:53', 1, NULL, NULL, 0),
	(98, 3, 20, 0, 0, 0, 0, '2018-11-29 18:43:53', 1, NULL, NULL, 0),
	(99, 4, 20, 0, 0, 0, 0, '2018-11-29 18:43:53', 1, NULL, NULL, 0),
	(100, 5, 20, 0, 0, 0, 0, '2018-11-29 18:43:53', 1, NULL, NULL, 0),
	(101, 1, 21, 1, 1, 1, 1, '2018-11-29 18:44:42', 1, NULL, NULL, 0),
	(102, 2, 21, 1, 1, 1, 1, '2018-11-29 18:44:42', 1, NULL, NULL, 0),
	(103, 3, 21, 0, 0, 0, 0, '2018-11-29 18:44:42', 1, NULL, NULL, 0),
	(104, 4, 21, 0, 0, 0, 0, '2018-11-29 18:44:42', 1, NULL, NULL, 0),
	(105, 5, 21, 0, 0, 0, 0, '2018-11-29 18:44:42', 1, NULL, NULL, 0),
	(106, 1, 22, 1, 1, 1, 1, '2018-11-30 14:52:48', 1, NULL, NULL, 0),
	(107, 2, 22, 0, 0, 0, 0, '2018-11-30 14:52:48', 1, NULL, NULL, 0),
	(108, 3, 22, 0, 0, 0, 0, '2018-11-30 14:52:48', 1, NULL, NULL, 0),
	(109, 4, 22, 0, 0, 0, 0, '2018-11-30 14:52:48', 1, NULL, NULL, 0),
	(110, 5, 22, 0, 0, 0, 0, '2018-11-30 14:52:48', 1, NULL, NULL, 0),
	(111, 1, 23, 1, 1, 1, 1, '2018-12-04 10:28:30', 1, NULL, NULL, 0),
	(112, 2, 23, 1, 1, 1, 1, '2018-12-04 10:28:30', 1, NULL, NULL, 0),
	(113, 3, 23, 0, 0, 0, 0, '2018-12-04 10:28:30', 1, NULL, NULL, 0),
	(114, 4, 23, 0, 0, 0, 0, '2018-12-04 10:28:30', 1, NULL, NULL, 0),
	(115, 5, 23, 0, 0, 0, 0, '2018-12-04 10:28:30', 1, NULL, NULL, 0),
	(116, 1, 24, 1, 1, 1, 1, '2018-12-04 10:32:51', 1, NULL, NULL, 0),
	(117, 2, 24, 1, 1, 1, 1, '2018-12-04 10:32:51', 1, NULL, NULL, 0),
	(118, 3, 24, 0, 0, 0, 0, '2018-12-04 10:32:51', 1, NULL, NULL, 0),
	(119, 4, 24, 0, 0, 0, 0, '2018-12-04 10:32:51', 1, NULL, NULL, 0),
	(120, 5, 24, 0, 0, 0, 0, '2018-12-04 10:32:51', 1, NULL, NULL, 0),
	(121, 1, 25, 1, 1, 1, 1, '2018-12-04 10:32:52', 1, NULL, NULL, 0),
	(122, 2, 25, 1, 1, 1, 1, '2018-12-04 10:32:52', 1, NULL, NULL, 0),
	(123, 3, 25, 0, 0, 0, 0, '2018-12-04 10:32:52', 1, NULL, NULL, 0),
	(124, 4, 25, 0, 0, 0, 0, '2018-12-04 10:32:52', 1, NULL, NULL, 0),
	(125, 5, 25, 0, 0, 0, 0, '2018-12-04 10:32:52', 1, NULL, NULL, 0),
	(126, 1, 26, 1, 1, 1, 1, '2018-12-04 10:32:52', 1, NULL, NULL, 1),
	(127, 2, 26, 1, 1, 1, 1, '2018-12-04 10:32:52', 1, NULL, NULL, 1),
	(128, 3, 26, 0, 0, 0, 0, '2018-12-04 10:32:52', 1, NULL, NULL, 1),
	(129, 4, 26, 0, 0, 0, 0, '2018-12-04 10:32:52', 1, NULL, NULL, 1),
	(130, 5, 26, 0, 0, 0, 0, '2018-12-04 10:32:52', 1, NULL, NULL, 1),
	(131, 1, 27, 1, 1, 1, 1, '2018-12-04 10:36:10', 1, NULL, NULL, 0),
	(132, 2, 27, 1, 1, 1, 1, '2018-12-04 10:36:10', 1, NULL, NULL, 0),
	(133, 3, 27, 0, 0, 0, 0, '2018-12-04 10:36:10', 1, NULL, NULL, 0),
	(134, 4, 27, 0, 0, 0, 0, '2018-12-04 10:36:10', 1, NULL, NULL, 0),
	(135, 5, 27, 0, 0, 0, 0, '2018-12-04 10:36:10', 1, NULL, NULL, 0),
	(136, 1, 28, 1, 1, 1, 1, '2018-12-04 13:14:50', 1, NULL, NULL, 0),
	(137, 2, 28, 0, 0, 0, 0, '2018-12-04 13:14:50', 1, NULL, NULL, 0),
	(138, 3, 28, 0, 0, 0, 0, '2018-12-04 13:14:50', 1, NULL, NULL, 0),
	(139, 4, 28, 0, 0, 0, 0, '2018-12-04 13:14:50', 1, NULL, NULL, 0),
	(140, 5, 28, 0, 0, 0, 0, '2018-12-04 13:14:50', 1, NULL, NULL, 0),
	(141, 1, 29, 1, 1, 1, 1, '2018-12-04 13:34:04', 1, NULL, NULL, 0),
	(142, 2, 29, 0, 0, 0, 0, '2018-12-04 13:34:04', 1, NULL, NULL, 0),
	(143, 3, 29, 0, 0, 0, 0, '2018-12-04 13:34:04', 1, NULL, NULL, 0),
	(144, 4, 29, 0, 0, 0, 0, '2018-12-04 13:34:04', 1, NULL, NULL, 0),
	(145, 5, 29, 0, 0, 0, 0, '2018-12-04 13:34:04', 1, NULL, NULL, 0),
	(146, 1, 30, 1, 1, 1, 1, '2018-12-04 16:38:13', 1, NULL, NULL, 0),
	(147, 2, 30, 1, 1, 1, 1, '2018-12-04 16:38:13', 1, NULL, NULL, 0),
	(148, 3, 30, 0, 0, 0, 0, '2018-12-04 16:38:13', 1, NULL, NULL, 0),
	(149, 4, 30, 0, 0, 0, 0, '2018-12-04 16:38:13', 1, NULL, NULL, 0),
	(150, 5, 30, 0, 0, 0, 0, '2018-12-04 16:38:13', 1, NULL, NULL, 0),
	(151, 1, 31, 1, 1, 1, 1, '2019-11-15 15:58:35', 1, '2019-11-15 16:00:27', NULL, 0),
	(152, 2, 31, 1, 1, 1, 1, '2019-11-15 15:58:35', 1, '2019-11-15 16:00:27', NULL, 0),
	(153, 3, 31, 1, 1, 1, 1, '2019-11-15 15:58:35', 1, '2019-11-15 16:00:27', NULL, 0),
	(154, 4, 31, 1, 1, 1, 1, '2019-11-15 15:58:35', 1, '2019-11-15 16:00:27', NULL, 0),
	(155, 5, 31, 1, 1, 1, 1, '2019-11-15 15:58:35', 1, '2019-11-15 16:00:27', NULL, 0),
	(156, 1, 32, 1, 1, 1, 1, '2019-11-15 16:05:42', 1, NULL, NULL, 0),
	(157, 2, 32, 1, 1, 1, 1, '2019-11-15 16:05:42', 1, NULL, NULL, 0),
	(158, 3, 32, 1, 1, 1, 1, '2019-11-15 16:05:42', 1, NULL, NULL, 0),
	(159, 4, 32, 1, 1, 1, 1, '2019-11-15 16:05:42', 1, NULL, NULL, 0),
	(160, 5, 32, 1, 1, 1, 1, '2019-11-15 16:05:42', 1, NULL, NULL, 0),
	(161, 1, 33, 1, 1, 1, 1, '2019-11-15 16:19:55', 1, NULL, NULL, 0),
	(162, 2, 33, 1, 1, 1, 1, '2019-11-15 16:19:55', 1, NULL, NULL, 0),
	(163, 3, 33, 1, 1, 1, 1, '2019-11-15 16:19:55', 1, NULL, NULL, 0),
	(164, 4, 33, 1, 1, 1, 1, '2019-11-15 16:19:55', 1, NULL, NULL, 0),
	(165, 5, 33, 1, 1, 1, 1, '2019-11-15 16:19:55', 1, NULL, NULL, 0),
	(166, 1, 34, 1, 1, 1, 1, '2019-11-15 16:39:21', 1, NULL, NULL, 0),
	(167, 2, 34, 1, 1, 1, 1, '2019-11-15 16:39:21', 1, NULL, NULL, 0),
	(168, 3, 34, 1, 1, 1, 1, '2019-11-15 16:39:21', 1, NULL, NULL, 0),
	(169, 4, 34, 1, 1, 1, 1, '2019-11-15 16:39:21', 1, NULL, NULL, 0),
	(170, 5, 34, 1, 1, 1, 1, '2019-11-15 16:39:21', 1, NULL, NULL, 0);
/*!40000 ALTER TABLE `ref_auth_pages` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_auth_user
CREATE TABLE IF NOT EXISTS `ref_auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Auth User',
  `id_ref_auth_user_group` int(11) NOT NULL COMMENT 'ID Auth User Group',
  `id_ref_gender` smallint(3) NOT NULL DEFAULT '1' COMMENT 'ID Gender',
  `fullname` varchar(130) NOT NULL COMMENT 'Nama Lengkap',
  `username` varchar(100) NOT NULL COMMENT 'username',
  `password` varchar(50) NOT NULL COMMENT 'password',
  `email` varchar(100) NOT NULL COMMENT 'email',
  `phone` varchar(20) DEFAULT NULL COMMENT 'nomor telepon',
  `img` varchar(150) DEFAULT NULL COMMENT 'image user',
  `activation_code` varchar(50) DEFAULT NULL COMMENT 'activasi kode ',
  `change_email` varchar(100) DEFAULT NULL COMMENT 'perubahan email',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'status data',
  `create_date` datetime NOT NULL COMMENT 'tanggal dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'id auth user create  ',
  `modify_date` datetime DEFAULT NULL COMMENT 'tanggal perubahan',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'id auth user modify',
  PRIMARY KEY (`id`),
  KEY `id_auth_user_grup` (`id_ref_auth_user_group`),
  KEY `id_ref_gender` (`id_ref_gender`),
  CONSTRAINT `auth_user_ubfk1` FOREIGN KEY (`id_ref_auth_user_group`) REFERENCES `ref_auth_user_group` (`id`),
  CONSTRAINT `auth_user_ubfk2` FOREIGN KEY (`id_ref_gender`) REFERENCES `ref_gender` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.ref_auth_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `ref_auth_user` DISABLE KEYS */;
INSERT INTO `ref_auth_user` (`id`, `id_ref_auth_user_group`, `id_ref_gender`, `fullname`, `username`, `password`, `email`, `phone`, `img`, `activation_code`, `change_email`, `id_ref_delete`, `create_date`, `id_ref_auth_user_create`, `modify_date`, `id_ref_auth_user_modify`) VALUES
	(1, 1, 2, 'Super Admin', 'superadmin', 'e86fdc2283aff4717103f2d44d0610f7', 'ismatul.maula@deptechdigital.com', '085675646353', 'life-has-no-ctrl-z.jpg', '5aea153c3a4e901f57258d40911b9c23', NULL, 0, '2018-11-15 03:08:00', 1, '2018-11-30 14:14:53', NULL);
/*!40000 ALTER TABLE `ref_auth_user` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_auth_user_group
CREATE TABLE IF NOT EXISTS `ref_auth_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Auth User Group',
  `name` varchar(130) NOT NULL COMMENT 'Nama Auth User Group',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.ref_auth_user_group: ~5 rows (approximately)
/*!40000 ALTER TABLE `ref_auth_user_group` DISABLE KEYS */;
INSERT INTO `ref_auth_user_group` (`id`, `name`, `id_ref_delete`, `create_date`, `id_ref_auth_user_create`, `modify_date`, `id_ref_auth_user_modify`) VALUES
	(1, 'Superadmin', 0, '2018-11-13 16:18:00', 1, '2018-11-16 20:05:50', 1),
	(2, 'Administrator', 0, '2018-11-13 16:18:00', 1, '2018-11-29 13:49:43', 1),
	(3, 'Writer', 0, '2018-11-13 16:18:00', 1, NULL, NULL),
	(4, 'Publisher', 0, '2018-11-13 16:18:00', 1, NULL, NULL),
	(5, 'Editor', 0, '2018-11-13 16:18:00', 1, '2018-12-05 14:37:54', 1);
/*!40000 ALTER TABLE `ref_auth_user_group` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_banner
CREATE TABLE IF NOT EXISTS `ref_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID News',
  `id_ref_status_publish` smallint(3) NOT NULL DEFAULT '1' COMMENT 'ID Status Publish',
  `title` varchar(255) NOT NULL COMMENT 'Judul Berita',
  `teaser` varchar(255) DEFAULT NULL COMMENT 'Teaser',
  `publish_date` date DEFAULT NULL COMMENT 'Tanggal Publish',
  `img` varchar(30) DEFAULT NULL COMMENT 'Gambar',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT 'hits',
  `link` text COMMENT 'Link Youtube Video',
  `sort` int(11) DEFAULT '0' COMMENT 'sortir',
  `expected_publish_date` date DEFAULT NULL COMMENT 'Expected Tanggal Publish',
  `id_ref_language` int(11) DEFAULT '1' COMMENT 'ID Language',
  `id_ref_language_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  PRIMARY KEY (`id`),
  KEY `id_status_publish` (`id_ref_status_publish`),
  KEY `is_delete` (`id_ref_delete`),
  KEY `id_language` (`id_ref_language`),
  CONSTRAINT `ref_banner_ibfk_2` FOREIGN KEY (`id_ref_status_publish`) REFERENCES `ref_status_publish` (`id`),
  CONSTRAINT `ref_banner_ibfk_3` FOREIGN KEY (`id_ref_delete`) REFERENCES `ref_delete` (`id`),
  CONSTRAINT `ref_banner_ibfk_4` FOREIGN KEY (`id_ref_language`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table cms_deptech.ref_banner: ~3 rows (approximately)
/*!40000 ALTER TABLE `ref_banner` DISABLE KEYS */;
INSERT INTO `ref_banner` (`id`, `id_ref_status_publish`, `title`, `teaser`, `publish_date`, `img`, `hits`, `link`, `sort`, `expected_publish_date`, `id_ref_language`, `id_ref_language_parent`, `id_ref_delete`, `create_date`, `id_ref_auth_user_create`, `id_ref_auth_user_modify`, `modify_date`) VALUES
	(2, 2, 'Asesmen Lapangan Prodi Magister \r\nManajemen Pendidikan Islam', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tinci\r\ndunt elit felis, at sagittis enim congue et. Mauris nec auctor erat,\r\nsed cursus lectus.', '2019-11-16', '4.jpg', 0, '', 0, NULL, 1, NULL, 0, '2019-11-16 13:28:47', 1, 1, '2019-11-16 13:39:15'),
	(3, 2, '2', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tinci\r\ndunt elit felis, at sagittis enim congue et. Mauris nec auctor erat,\r\nsed cursus lectus.', '2019-11-16', '4.jpg', 0, '#', 0, NULL, 1, NULL, 0, '2019-11-16 13:28:47', 1, 1, '2019-11-16 13:29:11'),
	(4, 2, '3', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce tinci\r\ndunt elit felis, at sagittis enim congue et. Mauris nec auctor erat,\r\nsed cursus lectus.', '2019-11-16', '4.jpg', 0, '#', 0, NULL, 1, NULL, 0, '2019-11-16 13:28:47', 1, 1, '2019-11-16 13:29:11');
/*!40000 ALTER TABLE `ref_banner` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_city
CREATE TABLE IF NOT EXISTS `ref_city` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT 'ID Kota/Kabupate',
  `code_city_note` varchar(255) NOT NULL COMMENT 'Kode kabupaten/Kota saat pencatatan',
  `id_ref_province` int(11) DEFAULT NULL COMMENT 'ID Provinsi',
  `code_province` varchar(255) NOT NULL COMMENT 'Kode Provinsi ',
  `name` varchar(255) NOT NULL COMMENT 'Nama Kabupaten',
  `code_city` varchar(255) NOT NULL COMMENT 'Kode Kabupaten',
  `code_prov` varchar(255) NOT NULL COMMENT 'Kode Provinsi Saat Pencatatan',
  `uri_path` varchar(255) DEFAULT NULL COMMENT 'Uri Path',
  `id_ref_delete` int(2) NOT NULL DEFAULT '0' COMMENT 'Status Data',
  `id_ref_status_publish` int(2) NOT NULL DEFAULT '0' COMMENT 'Status Publish',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `create_date` datetime DEFAULT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan Data',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`),
  KEY `kode_provinsi` (`code_province`),
  KEY `kode_kabupaten` (`code_city`)
) ENGINE=InnoDB AUTO_INCREMENT=525 DEFAULT CHARSET=latin1 COMMENT='Table untuk mengolah referensi kabupaten';

-- Dumping data for table cms_deptech.ref_city: ~517 rows (approximately)
/*!40000 ALTER TABLE `ref_city` DISABLE KEYS */;
INSERT INTO `ref_city` (`id`, `code_city_note`, `id_ref_province`, `code_province`, `name`, `code_city`, `code_prov`, `uri_path`, `id_ref_delete`, `id_ref_status_publish`, `id_ref_auth_user_create`, `create_date`, `id_ref_auth_user_modify`, `modify_date`) VALUES
	(1, '1', 1, '1100000000', 'Kabupaten Simeulue', '1101000000', '11', 'kabupaten-simeulue', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(2, '2', 1, '1100000000', 'Kabupaten Aceh Singkil', '1102000000', '11', 'kabupaten-aceh-singkil', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(3, '3', 1, '1100000000', 'Kabupaten Aceh Selatan', '1103000000', '11', 'kabupaten-aceh-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(4, '4', 1, '1100000000', 'Kabupaten Aceh Tenggara', '1104000000', '11', 'kabupaten-aceh-tenggara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(5, '5', 1, '1100000000', 'Kabupaten Aceh Timur', '1105000000', '11', 'kabupaten-aceh-timur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(6, '6', 1, '1100000000', 'Kabupaten Aceh Tengah', '1106000000', '11', 'kabupaten-aceh-tengah', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(7, '7', 1, '1100000000', 'Kabupaten Aceh Barat', '1107000000', '11', 'kabupaten-aceh-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(8, '8', 1, '1100000000', 'Kabupaten Aceh Besar', '1108000000', '11', 'kabupaten-aceh-besar', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(9, '9', 1, '1100000000', 'Kabupaten Pidie', '1109000000', '11', 'kabupaten-pidie', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(10, '10', 1, '1100000000', 'Kabupaten Bireuen', '1110000000', '11', 'kabupaten-bireuen', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(11, '11', 1, '1100000000', 'Kabupaten Aceh Utara', '1111000000', '11', 'kabupaten-aceh-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(12, '12', 1, '1100000000', 'Kabupaten Aceh Barat Daya', '1112000000', '11', 'kabupaten-aceh-barat-daya', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(13, '13', 1, '1100000000', 'Kabupaten Gayo Lues', '1113000000', '11', 'kabupaten-gayo-lues', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(14, '14', 1, '1100000000', 'Kabupaten Aceh Tamiang', '1114000000', '11', 'kabupaten-aceh-tamiang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(15, '15', 1, '1100000000', 'Kabupaten Nagan Raya', '1115000000', '11', 'kabupaten-nagan-raya', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(16, '16', 1, '1100000000', 'Kabupaten Aceh Jaya', '1116000000', '11', 'kabupaten-aceh-jaya', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(17, '17', 1, '1100000000', 'Kabupaten Bener Meriah', '1117000000', '11', 'kabupaten-bener-meriah', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(18, '18', 1, '1100000000', 'Kabupaten Pidie Jaya', '1118000000', '11', 'kabupaten-pidie-jaya', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(19, '71', 1, '1100000000', 'Kota Banda Aceh', '1171000000', '11', 'kota-banda-aceh', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(20, '72', 1, '1100000000', 'Kota Sabang', '1172000000', '11', 'kota-sabang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(21, '73', 1, '1100000000', 'Kota Langsa', '1173000000', '11', 'kota-langsa', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(22, '74', 1, '1100000000', 'Kota Lhokseumawe', '1174000000', '11', 'kota-lhokseumawe', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(23, '75', 1, '1100000000', 'Kota Subulussalam', '1175000000', '11', 'kota-subulussalam', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(24, '1', 2, '1200000000', 'Kabupaten Nias', '1201000000', '12', 'kabupaten-nias', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(25, '2', 2, '1200000000', 'Kabupaten Mandailing Natal', '1202000000', '12', 'kabupaten-mandailing-natal', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(26, '3', 2, '1200000000', 'Kabupaten Tapanuli Selatan', '1203000000', '12', 'kabupaten-tapanuli-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(27, '4', 2, '1200000000', 'Kabupaten Tapanuli Tengah', '1204000000', '12', 'kabupaten-tapanuli-tengah', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(28, '5', 2, '1200000000', 'Kabupaten Tapanuli Utara', '1205000000', '12', 'kabupaten-tapanuli-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(29, '6', 2, '1200000000', 'Kabupaten Toba Samosir', '1206000000', '12', 'kabupaten-toba-samosir', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(30, '7', 2, '1200000000', 'Kabupaten Labuhan Batu', '1207000000', '12', 'kabupaten-labuhan-batu', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(31, '8', 2, '1200000000', 'Kabupaten Asahan', '1208000000', '12', 'kabupaten-asahan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(32, '9', 2, '1200000000', 'Kabupaten Simalungun', '1209000000', '12', 'kabupaten-simalungun', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(33, '10', 2, '1200000000', 'Kabupaten Dairi', '1210000000', '12', 'kabupaten-dairi', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(34, '11', 2, '1200000000', 'Kabupaten Karo', '1211000000', '12', 'kabupaten-karo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(35, '12', 2, '1200000000', 'Kabupaten Deli Serdang', '1212000000', '12', 'kabupaten-deli-serdang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(36, '13', 2, '1200000000', 'Kabupaten Langkat', '1213000000', '12', 'kabupaten-langkat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(37, '14', 2, '1200000000', 'Kabupaten Nias Selatan', '1214000000', '12', 'kabupaten-nias-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(38, '15', 2, '1200000000', 'Kabupaten Humbang Hasundutan', '1215000000', '12', 'kabupaten-humbang-hasundutan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(39, '16', 2, '1200000000', 'Kabupaten Pakpak Bharat', '1216000000', '12', 'kabupaten-pakpak-bharat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(40, '17', 2, '1200000000', 'Kabupaten Samosir', '1217000000', '12', 'kabupaten-samosir', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(41, '18', 2, '1200000000', 'Kabupaten Serdang Bedagai', '1218000000', '12', 'kabupaten-serdang-bedagai', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(42, '19', 2, '1200000000', 'Kabupaten Batu Bara', '1219000000', '12', 'kabupaten-batu-bara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(43, '20', 2, '1200000000', 'Kabupaten Padang Lawas Utara', '1220000000', '12', 'kabupaten-padang-lawas-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(44, '21', 2, '1200000000', 'Kabupaten Padang Lawas', '1221000000', '12', 'kabupaten-padang-lawas', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(45, '22', 2, '1200000000', 'Kabupaten Labuhan Batu Selatan', '1222000000', '12', 'kabupaten-labuhan-batu-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(46, '23', 2, '1200000000', 'Kabupaten Labuhan Batu Utara', '1223000000', '12', 'kabupaten-labuhan-batu-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(47, '24', 2, '1200000000', 'Kabupaten Nias Utara', '1224000000', '12', 'kabupaten-nias-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(48, '25', 2, '1200000000', 'Kabupaten Nias Barat', '1225000000', '12', 'kabupaten-nias-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(49, '71', 2, '1200000000', 'Kota Sibolga', '1271000000', '12', 'kota-sibolga', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(50, '72', 2, '1200000000', 'Kota Tanjung Balai', '1272000000', '12', 'kota-tanjung-balai', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(51, '73', 2, '1200000000', 'Kota Pematang Siantar', '1273000000', '12', 'kota-pematang-siantar', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(52, '74', 2, '1200000000', 'Kota Tebing Tinggi', '1274000000', '12', 'kota-tebing-tinggi', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(53, '75', 2, '1200000000', 'Kota Medan', '1275000000', '12', 'kota-medan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(54, '76', 2, '1200000000', 'Kota Binjai', '1276000000', '12', 'kota-binjai', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(55, '77', 2, '1200000000', 'Kota Padangsidimpuan', '1277000000', '12', 'kota-padangsidimpuan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(56, '78', 2, '1200000000', 'Kota Gunungsitoli', '1278000000', '12', 'kota-gunungsitoli', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(57, '1', 3, '1300000000', 'Kabupaten Kepulauan Mentawai', '1301000000', '13', 'kabupaten-kepulauan-mentawai', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(58, '2', 3, '1300000000', 'Kabupaten Pesisir Selatan', '1302000000', '13', 'kabupaten-pesisir-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(59, '3', 3, '1300000000', 'Kabupaten Solok', '1303000000', '13', 'kabupaten-solok', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(60, '4', 3, '1300000000', 'Kabupaten Sijunjung', '1304000000', '13', 'kabupaten-sijunjung', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(61, '5', 3, '1300000000', 'Kabupaten Tanah Datar', '1305000000', '13', 'kabupaten-tanah-datar', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(62, '6', 3, '1300000000', 'Kabupaten Padang Pariaman', '1306000000', '13', 'kabupaten-padang-pariaman', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(63, '7', 3, '1300000000', 'Kabupaten Agam', '1307000000', '13', 'kabupaten-agam', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(64, '8', 3, '1300000000', 'Kabupaten Lima Puluh Kota', '1308000000', '13', 'kabupaten-lima-puluh-kota', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(65, '9', 3, '1300000000', 'Kabupaten Pasaman', '1309000000', '13', 'kabupaten-pasaman', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(66, '10', 3, '1300000000', 'Kabupaten Solok Selatan', '1310000000', '13', 'kabupaten-solok-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(67, '11', 3, '1300000000', 'Kabupaten Dharmasraya', '1311000000', '13', 'kabupaten-dharmasraya', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(68, '12', 3, '1300000000', 'Kabupaten Pasaman Barat', '1312000000', '13', 'kabupaten-pasaman-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(69, '71', 3, '1300000000', 'Kota Padang', '1371000000', '13', 'kota-padang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(70, '72', 3, '1300000000', 'Kota Solok', '1372000000', '13', 'kota-solok', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(71, '73', 3, '1300000000', 'Kota Sawah Lunto', '1373000000', '13', 'kota-sawah-lunto', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(72, '74', 3, '1300000000', 'Kota Padang Panjang', '1374000000', '13', 'kota-padang-panjang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(73, '75', 3, '1300000000', 'Kota Bukittinggi', '1375000000', '13', 'kota-bukittinggi', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(74, '76', 3, '1300000000', 'Kota Payakumbuh', '1376000000', '13', 'kota-payakumbuh', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(75, '77', 3, '1300000000', 'Kota Pariaman', '1377000000', '13', 'kota-pariaman', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(76, '1', 4, '1400000000', 'Kabupaten Kuantan Singingi', '1401000000', '14', 'kabupaten-kuantan-singingi', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(77, '2', 4, '1400000000', 'Kabupaten Indragiri Hulu', '1402000000', '14', 'kabupaten-indragiri-hulu', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(78, '3', 4, '1400000000', 'Kabupaten Indragiri Hilir', '1403000000', '14', 'kabupaten-indragiri-hilir', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(79, '4', 4, '1400000000', 'Kabupaten Pelalawan', '1404000000', '14', 'kabupaten-pelalawan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(80, '5', 4, '1400000000', 'Kabupaten Siak', '1405000000', '14', 'kabupaten-s-i-a-k', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(81, '6', 4, '1400000000', 'Kabupaten Kampar', '1406000000', '14', 'kabupaten-kampar', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(82, '7', 4, '1400000000', 'Kabupaten Rokan Hulu', '1407000000', '14', 'kabupaten-rokan-hulu', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(83, '8', 4, '1400000000', 'Kabupaten Bengkalis', '1408000000', '14', 'kabupaten-bengkalis', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(84, '9', 4, '1400000000', 'Kabupaten Rokan Hilir', '1409000000', '14', 'kabupaten-rokan-hilir', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(85, '10', 4, '1400000000', 'Kabupaten Kepulauan Meranti', '1410000000', '14', 'kabupaten-kepulauan-meranti', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(86, '71', 4, '1400000000', 'Kota Pekanbaru', '1471000000', '14', 'kota-pekanbaru', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(87, '73', 4, '1400000000', 'Kota Dumai', '1473000000', '14', 'kota-dumai', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(88, '1', 5, '1500000000', 'Kabupaten Kerinci', '1501000000', '15', 'kabupaten-kerinci', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(89, '2', 5, '1500000000', 'Kabupaten Merangin', '1502000000', '15', 'kabupaten-merangin', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(90, '3', 5, '1500000000', 'Kabupaten Sarolangun', '1503000000', '15', 'kabupaten-sarolangun', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(91, '4', 5, '1500000000', 'Kabupaten Batang Hari', '1504000000', '15', 'kabupaten-batang-hari', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(92, '5', 5, '1500000000', 'Kabupaten Muaro Jambi', '1505000000', '15', 'kabupaten-muaro-jambi', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(93, '6', 5, '1500000000', 'Kabupaten Tanjung Jabung Timur', '1506000000', '15', 'kabupaten-tanjung-jabung-timur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(94, '7', 5, '1500000000', 'Kabupaten Tanjung Jabung Barat', '1507000000', '15', 'kabupaten-tanjung-jabung-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(95, '8', 5, '1500000000', 'Kabupaten Tebo', '1508000000', '15', 'kabupaten-tebo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(96, '9', 5, '1500000000', 'Kabupaten Bungo', '1509000000', '15', 'kabupaten-bungo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(97, '71', 5, '1500000000', 'Kota Jambi', '1571000000', '15', 'kota-jambi', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(98, '72', 5, '1500000000', 'Kota Sungai Penuh', '1572000000', '15', 'kota-sungai-penuh', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(99, '1', 6, '1600000000', 'Kabupaten Ogan Komering Ulu', '1601000000', '16', 'kabupaten-ogan-komering-ulu', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(100, '2', 6, '1600000000', 'Kabupaten Ogan Komering Ilir', '1602000000', '16', 'kabupaten-ogan-komering-ilir', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(101, '3', 6, '1600000000', 'Kabupaten Muara Enim', '1603000000', '16', 'kabupaten-muara-enim', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(102, '4', 6, '1600000000', 'Kabupaten Lahat', '1604000000', '16', 'kabupaten-lahat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(103, '5', 6, '1600000000', 'Kabupaten Musi Rawas', '1605000000', '16', 'kabupaten-musi-rawas', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(104, '6', 6, '1600000000', 'Kabupaten Musi Banyuasin', '1606000000', '16', 'kabupaten-musi-banyuasin', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(105, '7', 6, '1600000000', 'Kabupaten Banyu Asin', '1607000000', '16', 'kabupaten-banyu-asin', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(106, '8', 6, '1600000000', 'Kabupaten Ogan Komering Ulu Selatan', '1608000000', '16', 'kabupaten-ogan-komering-ulu-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(107, '9', 6, '1600000000', 'Kabupaten Ogan Komering Ulu Timur', '1609000000', '16', 'kabupaten-ogan-komering-ulu-timur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(108, '10', 6, '1600000000', 'Kabupaten Ogan Ilir', '1610000000', '16', 'kabupaten-ogan-ilir', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(109, '11', 6, '1600000000', 'Kabupaten Empat Lawang', '1611000000', '16', 'kabupaten-empat-lawang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(110, '12', 6, '1600000000', 'Kabupaten Penukal Abab Lematang Ilir', '1612000000', '16', 'kabupaten-penukal-abab-lematang-ilir', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(111, '13', 6, '1600000000', 'Kabupaten Musi Rawas Utara', '1613000000', '16', 'kabupaten-musi-rawas-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(112, '71', 6, '1600000000', 'Kota Palembang', '1671000000', '16', 'kota-palembang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(113, '72', 6, '1600000000', 'Kota Prabumulih', '1672000000', '16', 'kota-prabumulih', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(114, '73', 6, '1600000000', 'Kota Pagar Alam', '1673000000', '16', 'kota-pagar-alam', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(115, '74', 6, '1600000000', 'Kota Lubuklinggau', '1674000000', '16', 'kota-lubuklinggau', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(116, '1', 7, '1700000000', 'Kabupaten Bengkulu Selatan', '1701000000', '17', 'kabupaten-bengkulu-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(117, '2', 7, '1700000000', 'Kabupaten Rejang Lebong', '1702000000', '17', 'kabupaten-rejang-lebong', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(118, '3', 7, '1700000000', 'Kabupaten Bengkulu Utara', '1703000000', '17', 'kabupaten-bengkulu-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(119, '4', 7, '1700000000', 'Kabupaten Kaur', '1704000000', '17', 'kabupaten-kaur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(120, '5', 7, '1700000000', 'Kabupaten Seluma', '1705000000', '17', 'kabupaten-seluma', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(121, '6', 7, '1700000000', 'Kabupaten Mukomuko', '1706000000', '17', 'kabupaten-mukomuko', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(122, '7', 7, '1700000000', 'Kabupaten Lebong', '1707000000', '17', 'kabupaten-lebong', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(123, '8', 7, '1700000000', 'Kabupaten Kepahiang', '1708000000', '17', 'kabupaten-kepahiang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(124, '9', 7, '1700000000', 'Kabupaten Bengkulu Tengah', '1709000000', '17', 'kabupaten-bengkulu-tengah', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(125, '71', 7, '1700000000', 'Kota Bengkulu', '1771000000', '17', 'kota-bengkulu', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(126, '1', 8, '1800000000', 'Kabupaten Lampung Barat', '1801000000', '18', 'kabupaten-lampung-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(127, '2', 8, '1800000000', 'Kabupaten Tanggamus', '1802000000', '18', 'kabupaten-tanggamus', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(128, '3', 8, '1800000000', 'Kabupaten Lampung Selatan', '1803000000', '18', 'kabupaten-lampung-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(129, '4', 8, '1800000000', 'Kabupaten Lampung Timur', '1804000000', '18', 'kabupaten-lampung-timur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(130, '5', 8, '1800000000', 'Kabupaten Lampung Tengah', '1805000000', '18', 'kabupaten-lampung-tengah', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(131, '6', 8, '1800000000', 'Kabupaten Lampung Utara', '1806000000', '18', 'kabupaten-lampung-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(132, '7', 8, '1800000000', 'Kabupaten Way Kanan', '1807000000', '18', 'kabupaten-way-kanan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(133, '8', 8, '1800000000', 'Kabupaten Tulangbawang', '1808000000', '18', 'kabupaten-tulangbawang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(134, '9', 8, '1800000000', 'Kabupaten Pesawaran', '1809000000', '18', 'kabupaten-pesawaran', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(135, '10', 8, '1800000000', 'Kabupaten Pringsewu', '1810000000', '18', 'kabupaten-pringsewu', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(136, '11', 8, '1800000000', 'Kabupaten Mesuji', '1811000000', '18', 'kabupaten-mesuji', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(137, '12', 8, '1800000000', 'Kabupaten Tulang Bawang Barat', '1812000000', '18', 'kabupaten-tulang-bawang-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(138, '13', 8, '1800000000', 'Kabupaten Pesisir Barat', '1813000000', '18', 'kabupaten-pesisir-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(139, '71', 8, '1800000000', 'Kota Bandar Lampung', '1871000000', '18', 'kota-bandar-lampung', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(140, '72', 8, '1800000000', 'Kota Metro', '1872000000', '18', 'kota-metro', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(141, '1', 9, '1900000000', 'Kabupaten Bangka', '1901000000', '19', 'kabupaten-bangka', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(142, '2', 9, '1900000000', 'Kabupaten Belitung', '1902000000', '19', 'kabupaten-belitung', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(143, '3', 9, '1900000000', 'Kabupaten Bangka Barat', '1903000000', '19', 'kabupaten-bangka-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(144, '4', 9, '1900000000', 'Kabupaten Bangka Tengah', '1904000000', '19', 'kabupaten-bangka-tengah', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(145, '5', 9, '1900000000', 'Kabupaten Bangka Selatan', '1905000000', '19', 'kabupaten-bangka-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(146, '6', 9, '1900000000', 'Kabupaten Belitung Timur', '1906000000', '19', 'kabupaten-belitung-timur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(147, '71', 9, '1900000000', 'Kota Pangkal Pinang', '1971000000', '19', 'kota-pangkal-pinang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(148, '1', 10, '2100000000', 'Kabupaten Karimun', '2101000000', '21', 'kabupaten-karimun', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(149, '2', 10, '2100000000', 'Kabupaten Bintan', '2102000000', '21', 'kabupaten-bintan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(150, '3', 10, '2100000000', 'Kabupaten Natuna', '2103000000', '21', 'kabupaten-natuna', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(151, '4', 10, '2100000000', 'Kabupaten Lingga', '2104000000', '21', 'kabupaten-lingga', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(152, '5', 10, '2100000000', 'Kabupaten Kepulauan Anambas', '2105000000', '21', 'kabupaten-kepulauan-anambas', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(153, '71', 10, '2100000000', 'Kota Batam', '2171000000', '21', 'kota-b-a-t-a-m', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(154, '72', 10, '2100000000', 'Kota Tanjung Pinang', '2172000000', '21', 'kota-tanjung-pinang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(155, '1', 11, '3100000000', 'Kabupaten Kepulauan Seribu', '3101000000', '31', 'kabupaten-kepulauan-seribu', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(156, '71', 11, '3100000000', 'Kota Jakarta Selatan', '3171000000', '31', 'kota-jakarta-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(157, '72', 11, '3100000000', 'Kota Jakarta Timur', '3172000000', '31', 'kota-jakarta-timur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(158, '73', 11, '3100000000', 'Kota Jakarta Pusat', '3173000000', '31', 'kota-jakarta-pusat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(159, '74', 11, '3100000000', 'Kota Jakarta Barat', '3174000000', '31', 'kota-jakarta-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(160, '75', 11, '3100000000', 'Kota Jakarta Utara', '3175000000', '31', 'kota-jakarta-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(161, '1', 12, '3200000000', 'Kabupaten Bogor', '3201000000', '32', 'kabupaten-bogor', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(162, '2', 12, '3200000000', 'Kabupaten Sukabumi', '3202000000', '32', 'kabupaten-sukabumi', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(163, '3', 12, '3200000000', 'Kabupaten Cianjur', '3203000000', '32', 'kabupaten-cianjur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(164, '4', 12, '3200000000', 'Kabupaten Bandung', '3204000000', '32', 'kabupaten-bandung', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(165, '5', 12, '3200000000', 'Kabupaten Garut', '3205000000', '32', 'kabupaten-garut', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(166, '6', 12, '3200000000', 'Kabupaten Tasikmalaya', '3206000000', '32', 'kabupaten-tasikmalaya', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(167, '7', 12, '3200000000', 'Kabupaten Ciamis', '3207000000', '32', 'kabupaten-ciamis', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(168, '8', 12, '3200000000', 'Kabupaten Kuningan', '3208000000', '32', 'kabupaten-kuningan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(169, '9', 12, '3200000000', 'Kabupaten Cirebon', '3209000000', '32', 'kabupaten-cirebon', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(170, '10', 12, '3200000000', 'Kabupaten Majalengka', '3210000000', '32', 'kabupaten-majalengka', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(171, '11', 12, '3200000000', 'Kabupaten Sumedang', '3211000000', '32', 'kabupaten-sumedang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(172, '12', 12, '3200000000', 'Kabupaten Indramayu', '3212000000', '32', 'kabupaten-indramayu', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(173, '13', 12, '3200000000', 'Kabupaten Subang', '3213000000', '32', 'kabupaten-subang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(174, '14', 12, '3200000000', 'Kabupaten Purwakarta', '3214000000', '32', 'kabupaten-purwakarta', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(175, '15', 12, '3200000000', 'Kabupaten Karawang', '3215000000', '32', 'kabupaten-karawang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(176, '16', 12, '3200000000', 'Kabupaten Bekasi', '3216000000', '32', 'kabupaten-bekasi', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(177, '17', 12, '3200000000', 'Kabupaten Bandung Barat', '3217000000', '32', 'kabupaten-bandung-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(178, '18', 12, '3200000000', 'Kabupaten Pangandaran', '3218000000', '32', 'kabupaten-pangandaran', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(179, '71', 12, '3200000000', 'Kota Bogor', '3271000000', '32', 'kota-bogor', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(180, '72', 12, '3200000000', 'Kota Sukabumi', '3272000000', '32', 'kota-sukabumi', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(181, '73', 12, '3200000000', 'Kota Bandung', '3273000000', '32', 'kota-bandung', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(182, '74', 12, '3200000000', 'Kota Cirebon', '3274000000', '32', 'kota-cirebon', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(183, '75', 12, '3200000000', 'Kota Bekasi', '3275000000', '32', 'kota-bekasi', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(184, '76', 12, '3200000000', 'Kota Depok', '3276000000', '32', 'kota-depok', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(185, '77', 12, '3200000000', 'Kota Cimahi', '3277000000', '32', 'kota-cimahi', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(186, '78', 12, '3200000000', 'Kota Tasikmalaya', '3278000000', '32', 'kota-tasikmalaya', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(187, '79', 12, '3200000000', 'Kota Banjar', '3279000000', '32', 'kota-banjar', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(188, '1', 13, '3300000000', 'Kabupaten Cilacap', '3301000000', '33', 'kabupaten-cilacap', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(189, '2', 13, '3300000000', 'Kabupaten Banyumas', '3302000000', '33', 'kabupaten-banyumas', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(190, '3', 13, '3300000000', 'Kabupaten Purbalingga', '3303000000', '33', 'kabupaten-purbalingga', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(191, '4', 13, '3300000000', 'Kabupaten Banjarnegara', '3304000000', '33', 'kabupaten-banjarnegara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(192, '5', 13, '3300000000', 'Kabupaten Kebumen', '3305000000', '33', 'kabupaten-kebumen', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(193, '6', 13, '3300000000', 'Kabupaten Purworejo', '3306000000', '33', 'kabupaten-purworejo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(194, '7', 13, '3300000000', 'Kabupaten Wonosobo', '3307000000', '33', 'kabupaten-wonosobo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(195, '8', 13, '3300000000', 'Kabupaten Magelang', '3308000000', '33', 'kabupaten-magelang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(196, '9', 13, '3300000000', 'Kabupaten Boyolali', '3309000000', '33', 'kabupaten-boyolali', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(197, '10', 13, '3300000000', 'Kabupaten Klaten', '3310000000', '33', 'kabupaten-klaten', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(198, '11', 13, '3300000000', 'Kabupaten Sukoharjo', '3311000000', '33', 'kabupaten-sukoharjo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(199, '12', 13, '3300000000', 'Kabupaten Wonogiri', '3312000000', '33', 'kabupaten-wonogiri', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(200, '13', 13, '3300000000', 'Kabupaten Karanganyar', '3313000000', '33', 'kabupaten-karanganyar', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(201, '14', 13, '3300000000', 'Kabupaten Sragen', '3314000000', '33', 'kabupaten-sragen', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(202, '15', 13, '3300000000', 'Kabupaten Grobogan', '3315000000', '33', 'kabupaten-grobogan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(203, '16', 13, '3300000000', 'Kabupaten Blora', '3316000000', '33', 'kabupaten-blora', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(204, '17', 13, '3300000000', 'Kabupaten Rembang', '3317000000', '33', 'kabupaten-rembang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(205, '18', 13, '3300000000', 'Kabupaten Pati', '3318000000', '33', 'kabupaten-pati', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(206, '19', 13, '3300000000', 'Kabupaten Kudus', '3319000000', '33', 'kabupaten-kudus', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(207, '20', 13, '3300000000', 'Kabupaten Jepara', '3320000000', '33', 'kabupaten-jepara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(208, '21', 13, '3300000000', 'Kabupaten Demak', '3321000000', '33', 'kabupaten-demak', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(209, '22', 13, '3300000000', 'Kabupaten Semarang', '3322000000', '33', 'kabupaten-semarang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(210, '23', 13, '3300000000', 'Kabupaten Temanggung', '3323000000', '33', 'kabupaten-temanggung', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(211, '24', 13, '3300000000', 'Kabupaten Kendal', '3324000000', '33', 'kabupaten-kendal', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(212, '25', 13, '3300000000', 'Kabupaten Batang', '3325000000', '33', 'kabupaten-batang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(213, '26', 13, '3300000000', 'Kabupaten Pekalongan', '3326000000', '33', 'kabupaten-pekalongan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(214, '27', 13, '3300000000', 'Kabupaten Pemalang', '3327000000', '33', 'kabupaten-pemalang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(215, '28', 13, '3300000000', 'Kabupaten Tegal', '3328000000', '33', 'kabupaten-tegal', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(216, '29', 13, '3300000000', 'Kabupaten Brebes', '3329000000', '33', 'kabupaten-brebes', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(217, '71', 13, '3300000000', 'Kota Magelang', '3371000000', '33', 'kota-magelang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(218, '72', 13, '3300000000', 'Kota Surakarta (Solo)', '3372000000', '33', 'kota-surakarta', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(219, '73', 13, '3300000000', 'Kota Salatiga', '3373000000', '33', 'kota-salatiga', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(220, '74', 13, '3300000000', 'Kota Semarang', '3374000000', '33', 'kota-semarang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(221, '75', 13, '3300000000', 'Kota Pekalongan', '3375000000', '33', 'kota-pekalongan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(222, '76', 13, '3300000000', 'Kota Tegal', '3376000000', '33', 'kota-tegal', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(223, '1', 14, '3400000000', 'Kabupaten Kulon Progo', '3401000000', '34', 'kabupaten-kulon-progo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(224, '2', 14, '3400000000', 'Kabupaten Bantul', '3402000000', '34', 'kabupaten-bantul', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(225, '3', 14, '3400000000', 'Kabupaten Gunung Kidul', '3403000000', '34', 'kabupaten-gunung-kidul', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(226, '4', 14, '3400000000', 'Kabupaten Sleman', '3404000000', '34', 'kabupaten-sleman', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(227, '71', 14, '3400000000', 'Kota Yogyakarta', '3471000000', '34', 'kota-yogyakarta', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(228, '1', 15, '3500000000', 'Kabupaten Pacitan', '3501000000', '35', 'kabupaten-pacitan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(229, '2', 15, '3500000000', 'Kabupaten Ponorogo', '3502000000', '35', 'kabupaten-ponorogo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(230, '3', 15, '3500000000', 'Kabupaten Trenggalek', '3503000000', '35', 'kabupaten-trenggalek', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(231, '4', 15, '3500000000', 'Kabupaten Tulungagung', '3504000000', '35', 'kabupaten-tulungagung', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(232, '5', 15, '3500000000', 'Kabupaten Blitar', '3505000000', '35', 'kabupaten-blitar', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(233, '6', 15, '3500000000', 'Kabupaten Kediri', '3506000000', '35', 'kabupaten-kediri', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(234, '7', 15, '3500000000', 'Kabupaten Malang', '3507000000', '35', 'kabupaten-malang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(235, '8', 15, '3500000000', 'Kabupaten Lumajang', '3508000000', '35', 'kabupaten-lumajang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(236, '9', 15, '3500000000', 'Kabupaten Jember', '3509000000', '35', 'kabupaten-jember', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(237, '10', 15, '3500000000', 'Kabupaten Banyuwangi', '3510000000', '35', 'kabupaten-banyuwangi', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(238, '11', 15, '3500000000', 'Kabupaten Bondowoso', '3511000000', '35', 'kabupaten-bondowoso', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(239, '12', 15, '3500000000', 'Kabupaten Situbondo', '3512000000', '35', 'kabupaten-situbondo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(240, '13', 15, '3500000000', 'Kabupaten Probolinggo', '3513000000', '35', 'kabupaten-probolinggo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(241, '14', 15, '3500000000', 'Kabupaten Pasuruan', '3514000000', '35', 'kabupaten-pasuruan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(242, '15', 15, '3500000000', 'Kabupaten Sidoarjo', '3515000000', '35', 'kabupaten-sidoarjo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(243, '16', 15, '3500000000', 'Kabupaten Mojokerto', '3516000000', '35', 'kabupaten-mojokerto', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(244, '17', 15, '3500000000', 'Kabupaten Jombang', '3517000000', '35', 'kabupaten-jombang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(245, '18', 15, '3500000000', 'Kabupaten Nganjuk', '3518000000', '35', 'kabupaten-nganjuk', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(246, '19', 15, '3500000000', 'Kabupaten Madiun', '3519000000', '35', 'kabupaten-madiun', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(247, '20', 15, '3500000000', 'Kabupaten Magetan', '3520000000', '35', 'kabupaten-magetan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(248, '21', 15, '3500000000', 'Kabupaten Ngawi', '3521000000', '35', 'kabupaten-ngawi', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(249, '22', 15, '3500000000', 'Kabupaten Bojonegoro', '3522000000', '35', 'kabupaten-bojonegoro', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(250, '23', 15, '3500000000', 'Kabupaten Tuban', '3523000000', '35', 'kabupaten-tuban', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(251, '24', 15, '3500000000', 'Kabupaten Lamongan', '3524000000', '35', 'kabupaten-lamongan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(252, '25', 15, '3500000000', 'Kabupaten Gresik', '3525000000', '35', 'kabupaten-gresik', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(253, '26', 15, '3500000000', 'Kabupaten Bangkalan', '3526000000', '35', 'kabupaten-bangkalan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(254, '27', 15, '3500000000', 'Kabupaten Sampang', '3527000000', '35', 'kabupaten-sampang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(255, '28', 15, '3500000000', 'Kabupaten Pamekasan', '3528000000', '35', 'kabupaten-pamekasan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(256, '29', 15, '3500000000', 'Kabupaten Sumenep', '3529000000', '35', 'kabupaten-sumenep', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(257, '71', 15, '3500000000', 'Kota Kediri', '3571000000', '35', 'kota-kediri', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(258, '72', 15, '3500000000', 'Kota Blitar', '3572000000', '35', 'kota-blitar', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(259, '73', 15, '3500000000', 'Kota Malang', '3573000000', '35', 'kota-malang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(260, '74', 15, '3500000000', 'Kota Probolinggo', '3574000000', '35', 'kota-probolinggo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(261, '75', 15, '3500000000', 'Kota Pasuruan', '3575000000', '35', 'kota-pasuruan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(262, '76', 15, '3500000000', 'Kota Mojokerto', '3576000000', '35', 'kota-mojokerto', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(263, '77', 15, '3500000000', 'Kota Madiun', '3577000000', '35', 'kota-madiun', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(264, '78', 15, '3500000000', 'Kota Surabaya', '3578000000', '35', 'kota-surabaya', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(265, '79', 15, '3500000000', 'Kota Batu', '3579000000', '35', 'kota-batu', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(266, '1', 16, '3600000000', 'Kabupaten Pandeglang', '3601000000', '36', 'kabupaten-pandeglang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(267, '2', 16, '3600000000', 'Kabupaten Lebak', '3602000000', '36', 'kabupaten-lebak', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(268, '3', 16, '3600000000', 'Kabupaten Tangerang', '3603000000', '36', 'kabupaten-tangerang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(269, '4', 16, '3600000000', 'Kabupaten Serang', '3604000000', '36', 'kabupaten-serang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(270, '71', 16, '3600000000', 'Kota Tangerang', '3671000000', '36', 'kota-tangerang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(271, '72', 16, '3600000000', 'Kota Cilegon', '3672000000', '36', 'kota-cilegon', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(272, '73', 16, '3600000000', 'Kota Serang', '3673000000', '36', 'kota-serang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(273, '74', 16, '3600000000', 'Kota Tangerang Selatan', '3674000000', '36', 'kota-tangerang-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(274, '1', 17, '5100000000', 'Kabupaten Jembrana', '5101000000', '51', 'kabupaten-jembrana', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(275, '2', 17, '5100000000', 'Kabupaten Tabanan', '5102000000', '51', 'kabupaten-tabanan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(276, '3', 17, '5100000000', 'Kabupaten Badung', '5103000000', '51', 'kabupaten-badung', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(277, '4', 17, '5100000000', 'Kabupaten Gianyar', '5104000000', '51', 'kabupaten-gianyar', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(278, '5', 17, '5100000000', 'Kabupaten Klungkung', '5105000000', '51', 'kabupaten-klungkung', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(279, '6', 17, '5100000000', 'Kabupaten Bangli', '5106000000', '51', 'kabupaten-bangli', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(280, '7', 17, '5100000000', 'Kabupaten Karang Asem', '5107000000', '51', 'kabupaten-karang-asem', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(281, '8', 17, '5100000000', 'Kabupaten Buleleng', '5108000000', '51', 'kabupaten-buleleng', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(282, '71', 17, '5100000000', 'Kota Denpasar', '5171000000', '51', 'kota-denpasar', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(283, '1', 18, '5200000000', 'Kabupaten Lombok Barat', '5201000000', '52', 'kabupaten-lombok-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(284, '2', 18, '5200000000', 'Kabupaten Lombok Tengah', '5202000000', '52', 'kabupaten-lombok-tengah', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(285, '3', 18, '5200000000', 'Kabupaten Lombok Timur', '5203000000', '52', 'kabupaten-lombok-timur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(286, '4', 18, '5200000000', 'Kabupaten Sumbawa', '5204000000', '52', 'kabupaten-sumbawa', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(287, '5', 18, '5200000000', 'Kabupaten Dompu', '5205000000', '52', 'kabupaten-dompu', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(288, '6', 18, '5200000000', 'Kabupaten Bima', '5206000000', '52', 'kabupaten-bima', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(289, '7', 18, '5200000000', 'Kabupaten Sumbawa Barat', '5207000000', '52', 'kabupaten-sumbawa-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(290, '8', 18, '5200000000', 'Kabupaten Lombok Utara', '5208000000', '52', 'kabupaten-lombok-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(291, '71', 18, '5200000000', 'Kota Mataram', '5271000000', '52', 'kota-mataram', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(292, '72', 18, '5200000000', 'Kota Bima', '5272000000', '52', 'kota-bima', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(293, '1', 19, '5300000000', 'Kabupaten Sumba Barat', '5301000000', '53', 'kabupaten-sumba-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(294, '2', 19, '5300000000', 'Kabupaten Sumba Timur', '5302000000', '53', 'kabupaten-sumba-timur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(295, '3', 19, '5300000000', 'Kabupaten Kupang', '5303000000', '53', 'kabupaten-kupang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(296, '4', 19, '5300000000', 'Kabupaten Timor Tengah Selatan', '5304000000', '53', 'kabupaten-timor-tengah-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(297, '5', 19, '5300000000', 'Kabupaten Timor Tengah Utara', '5305000000', '53', 'kabupaten-timor-tengah-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(298, '6', 19, '5300000000', 'Kabupaten Belu', '5306000000', '53', 'kabupaten-belu', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(299, '7', 19, '5300000000', 'Kabupaten Alor', '5307000000', '53', 'kabupaten-alor', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(300, '8', 19, '5300000000', 'Kabupaten Lembata', '5308000000', '53', 'kabupaten-lembata', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(301, '9', 19, '5300000000', 'Kabupaten Flores Timur', '5309000000', '53', 'kabupaten-flores-timur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(302, '10', 19, '5300000000', 'Kabupaten Sikka', '5310000000', '53', 'kabupaten-sikka', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(303, '11', 19, '5300000000', 'Kabupaten Ende', '5311000000', '53', 'kabupaten-ende', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(304, '12', 19, '5300000000', 'Kabupaten Ngada', '5312000000', '53', 'kabupaten-ngada', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(305, '13', 19, '5300000000', 'Kabupaten Manggarai', '5313000000', '53', 'kabupaten-manggarai', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(306, '14', 19, '5300000000', 'Kabupaten Rote Ndao', '5314000000', '53', 'kabupaten-rote-ndao', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(307, '15', 19, '5300000000', 'Kabupaten Manggarai Barat', '5315000000', '53', 'kabupaten-manggarai-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(308, '16', 19, '5300000000', 'Kabupaten Sumba Tengah', '5316000000', '53', 'kabupaten-sumba-tengah', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(309, '17', 19, '5300000000', 'Kabupaten Sumba Barat Daya', '5317000000', '53', 'kabupaten-sumba-barat-daya', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(310, '18', 19, '5300000000', 'Kabupaten Nagekeo', '5318000000', '53', 'kabupaten-nagekeo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(311, '19', 19, '5300000000', 'Kabupaten Manggarai Timur', '5319000000', '53', 'kabupaten-manggarai-timur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(312, '20', 19, '5300000000', 'Kabupaten Sabu Raijua', '5320000000', '53', 'kabupaten-sabu-raijua', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(313, '21', 19, '5300000000', 'Kabupaten Malaka', '5321000000', '53', 'kabupaten-malaka', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(314, '71', 19, '5300000000', 'Kota Kupang', '5371000000', '53', 'kota-kupang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(315, '1', 20, '6100000000', 'Kabupaten Sambas', '6101000000', '61', 'kabupaten-sambas', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(316, '2', 20, '6100000000', 'Kabupaten Bengkayang', '6102000000', '61', 'kabupaten-bengkayang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(317, '3', 20, '6100000000', 'Kabupaten Landak', '6103000000', '61', 'kabupaten-landak', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(318, '4', 20, '6100000000', 'Kabupaten Mempawah', '6104000000', '61', 'kabupaten-mempawah', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(319, '5', 20, '6100000000', 'Kabupaten Sanggau', '6105000000', '61', 'kabupaten-sanggau', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(320, '6', 20, '6100000000', 'Kabupaten Ketapang', '6106000000', '61', 'kabupaten-ketapang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(321, '7', 20, '6100000000', 'Kabupaten Sintang', '6107000000', '61', 'kabupaten-sintang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(322, '8', 20, '6100000000', 'Kabupaten Kapuas Hulu', '6108000000', '61', 'kabupaten-kapuas-hulu', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(323, '9', 20, '6100000000', 'Kabupaten Sekadau', '6109000000', '61', 'kabupaten-sekadau', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(324, '10', 20, '6100000000', 'Kabupaten Melawi', '6110000000', '61', 'kabupaten-melawi', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(325, '11', 20, '6100000000', 'Kabupaten Kayong Utara', '6111000000', '61', 'kabupaten-kayong-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(326, '12', 20, '6100000000', 'Kabupaten Kubu Raya', '6112000000', '61', 'kabupaten-kubu-raya', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(327, '71', 20, '6100000000', 'Kota Pontianak', '6171000000', '61', 'kota-pontianak', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(328, '72', 20, '6100000000', 'Kota Singkawang', '6172000000', '61', 'kota-singkawang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(329, '1', 21, '6200000000', 'Kabupaten Kotawaringin Barat', '6201000000', '62', 'kabupaten-kotawaringin-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(330, '2', 21, '6200000000', 'Kabupaten Kotawaringin Timur', '6202000000', '62', 'kabupaten-kotawaringin-timur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(331, '3', 21, '6200000000', 'Kabupaten Kapuas', '6203000000', '62', 'kabupaten-kapuas', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(332, '4', 21, '6200000000', 'Kabupaten Barito Selatan', '6204000000', '62', 'kabupaten-barito-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(333, '5', 21, '6200000000', 'Kabupaten Barito Utara', '6205000000', '62', 'kabupaten-barito-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(334, '6', 21, '6200000000', 'Kabupaten Sukamara', '6206000000', '62', 'kabupaten-sukamara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(335, '7', 21, '6200000000', 'Kabupaten Lamandau', '6207000000', '62', 'kabupaten-lamandau', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(336, '8', 21, '6200000000', 'Kabupaten Seruyan', '6208000000', '62', 'kabupaten-seruyan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(337, '9', 21, '6200000000', 'Kabupaten Katingan', '6209000000', '62', 'kabupaten-katingan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(338, '10', 21, '6200000000', 'Kabupaten Pulang Pisau', '6210000000', '62', 'kabupaten-pulang-pisau', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(339, '11', 21, '6200000000', 'Kabupaten Gunung Mas', '6211000000', '62', 'kabupaten-gunung-mas', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(340, '12', 21, '6200000000', 'Kabupaten Barito Timur', '6212000000', '62', 'kabupaten-barito-timur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(341, '13', 21, '6200000000', 'Kabupaten Murung Raya', '6213000000', '62', 'kabupaten-murung-raya', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(342, '71', 21, '6200000000', 'Kota Palangka Raya', '6271000000', '62', 'kota-palangka-raya', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(343, '1', 22, '6300000000', 'Kabupaten Tanah Laut', '6301000000', '63', 'kabupaten-tanah-laut', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(344, '2', 22, '6300000000', 'Kabupaten Kota Baru', '6302000000', '63', 'kabupaten-kota-baru', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(345, '3', 22, '6300000000', 'Kabupaten Banjar', '6303000000', '63', 'kabupaten-banjar', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(346, '4', 22, '6300000000', 'Kabupaten Barito Kuala', '6304000000', '63', 'kabupaten-barito-kuala', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(347, '5', 22, '6300000000', 'Kabupaten Tapin', '6305000000', '63', 'kabupaten-tapin', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(348, '6', 22, '6300000000', 'Kabupaten Hulu Sungai Selatan', '6306000000', '63', 'kabupaten-hulu-sungai-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(349, '7', 22, '6300000000', 'Kabupaten Hulu Sungai Tengah', '6307000000', '63', 'kabupaten-hulu-sungai-tengah', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(350, '8', 22, '6300000000', 'Kabupaten Hulu Sungai Utara', '6308000000', '63', 'kabupaten-hulu-sungai-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(351, '9', 22, '6300000000', 'Kabupaten Tabalong', '6309000000', '63', 'kabupaten-tabalong', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(352, '10', 22, '6300000000', 'Kabupaten Tanah Bumbu', '6310000000', '63', 'kabupaten-tanah-bumbu', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(353, '11', 22, '6300000000', 'Kabupaten Balangan', '6311000000', '63', 'kabupaten-balangan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(354, '71', 22, '6300000000', 'Kota Banjarmasin', '6371000000', '63', 'kota-banjarmasin', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(355, '72', 22, '6300000000', 'Kota Banjar Baru', '6372000000', '63', 'kota-banjar-baru', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(356, '1', 23, '6400000000', 'Kabupaten Paser', '6401000000', '64', 'kabupaten-paser', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(357, '2', 23, '6400000000', 'Kabupaten Kutai Barat', '6402000000', '64', 'kabupaten-kutai-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(358, '3', 23, '6400000000', 'Kabupaten Kutai Kartanegara', '6403000000', '64', 'kabupaten-kutai-kartanegara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(359, '4', 23, '6400000000', 'Kabupaten Kutai Timur', '6404000000', '64', 'kabupaten-kutai-timur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(360, '5', 23, '6400000000', 'Kabupaten Berau', '6405000000', '64', 'kabupaten-berau', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(361, '9', 23, '6400000000', 'Kabupaten Penajam Paser Utara', '6409000000', '64', 'kabupaten-penajam-paser-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(362, '11', 23, '6400000000', 'Kabupaten Mahakam Hulu', '6411000000', '64', 'kabupaten-mahakam-hulu', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(363, '71', 23, '6400000000', 'Kota Balikpapan', '6471000000', '64', 'kota-balikpapan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(364, '72', 23, '6400000000', 'Kota Samarinda', '6472000000', '64', 'kota-samarinda', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(365, '74', 23, '6400000000', 'Kota Bontang', '6474000000', '64', 'kota-bontang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(366, '1', 24, '6500000000', 'Kabupaten Malinau', '6501000000', '65', 'kabupaten-malinau', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(367, '2', 24, '6500000000', 'Kabupaten Bulungan', '6502000000', '65', 'kabupaten-bulungan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(368, '3', 24, '6500000000', 'Kabupaten Tana Tidung', '6503000000', '65', 'kabupaten-tana-tidung', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(369, '4', 24, '6500000000', 'Kabupaten Nunukan', '6504000000', '65', 'kabupaten-nunukan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(370, '71', 24, '6500000000', 'Kota Tarakan', '6571000000', '65', 'kota-tarakan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(371, '1', 25, '7100000000', 'Kabupaten Bolaang Mongondow', '7101000000', '71', 'kabupaten-bolaang-mongondow', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(372, '2', 25, '7100000000', 'Kabupaten Minahasa', '7102000000', '71', 'kabupaten-minahasa', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(373, '3', 25, '7100000000', 'Kabupaten Kepulauan Sangihe', '7103000000', '71', 'kabupaten-kepulauan-sangihe', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(374, '4', 25, '7100000000', 'Kabupaten Kepulauan Talaud', '7104000000', '71', 'kabupaten-kepulauan-talaud', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(375, '5', 25, '7100000000', 'Kabupaten Minahasa Selatan', '7105000000', '71', 'kabupaten-minahasa-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(376, '6', 25, '7100000000', 'Kabupaten Minahasa Utara', '7106000000', '71', 'kabupaten-minahasa-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(377, '7', 25, '7100000000', 'Kabupaten Bolaang Mongondow Utara', '7107000000', '71', 'kabupaten-bolaang-mongondow-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(378, '8', 25, '7100000000', 'Kabupaten Siau Tagulandang Biaro', '7108000000', '71', 'kabupaten-siau-tagulandang-biaro', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(379, '9', 25, '7100000000', 'Kabupaten Minahasa Tenggara', '7109000000', '71', 'kabupaten-minahasa-tenggara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(380, '10', 25, '7100000000', 'Kabupaten Bolaang Mongondow Selatan', '7110000000', '71', 'kabupaten-bolaang-mongondow-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(381, '11', 25, '7100000000', 'Kabupaten Bolaang Mongondow Timur', '7111000000', '71', 'kabupaten-bolaang-mongondow-timur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(382, '71', 25, '7100000000', 'Kota Manado', '7171000000', '71', 'kota-manado', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(383, '72', 25, '7100000000', 'Kota Bitung', '7172000000', '71', 'kota-bitung', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(384, '73', 25, '7100000000', 'Kota Tomohon', '7173000000', '71', 'kota-tomohon', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(385, '74', 25, '7100000000', 'Kota Kotamobagu', '7174000000', '71', 'kota-kotamobagu', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(386, '1', NULL, '7200000000', 'Kabupaten Banggai Kepulauan', '7201000000', '72', 'kabupaten-banggai-kepulauan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(387, '2', NULL, '7200000000', 'Kabupaten Banggai', '7202000000', '72', 'kabupaten-banggai', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(388, '3', NULL, '7200000000', 'Kabupaten Morowali', '7203000000', '72', 'kabupaten-morowali', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(389, '4', NULL, '7200000000', 'Kabupaten Poso', '7204000000', '72', 'kabupaten-poso', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(390, '5', NULL, '7200000000', 'Kabupaten Donggala', '7205000000', '72', 'kabupaten-donggala', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(391, '6', NULL, '7200000000', 'Kabupaten Toli-toli', '7206000000', '72', 'kabupaten-toli-toli', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(392, '7', NULL, '7200000000', 'Kabupaten Buol', '7207000000', '72', 'kabupaten-buol', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(393, '8', NULL, '7200000000', 'Kabupaten Parigi Moutong', '7208000000', '72', 'kabupaten-parigi-moutong', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(394, '9', NULL, '7200000000', 'Kabupaten Tojo Una-una', '7209000000', '72', 'kabupaten-tojo-una-una', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(395, '10', NULL, '7200000000', 'Kabupaten Sigi', '7210000000', '72', 'kabupaten-sigi', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(396, '11', NULL, '7200000000', 'Kabupaten Banggai Laut', '7211000000', '72', 'kabupaten-banggai-laut', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(397, '12', NULL, '7200000000', 'Kabupaten Morowali Utara', '7212000000', '72', 'kabupaten-morowali-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(398, '71', NULL, '7200000000', 'Kota Palu', '7271000000', '72', 'kota-palu', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(399, '1', 27, '7300000000', 'Kabupaten Kepulauan Selayar', '7301000000', '73', 'kabupaten-kepulauan-selayar', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(400, '2', 27, '7300000000', 'Kabupaten Bulukumba', '7302000000', '73', 'kabupaten-bulukumba', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(401, '3', 27, '7300000000', 'Kabupaten Bantaeng', '7303000000', '73', 'kabupaten-bantaeng', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(402, '4', 27, '7300000000', 'Kabupaten Jeneponto', '7304000000', '73', 'kabupaten-jeneponto', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(403, '5', 27, '7300000000', 'Kabupaten Takalar', '7305000000', '73', 'kabupaten-takalar', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(404, '6', 27, '7300000000', 'Kabupaten Gowa', '7306000000', '73', 'kabupaten-gowa', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(405, '7', 27, '7300000000', 'Kabupaten Sinjai', '7307000000', '73', 'kabupaten-sinjai', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(406, '8', 27, '7300000000', 'Kabupaten Maros', '7308000000', '73', 'kabupaten-maros', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(407, '9', 27, '7300000000', 'Kabupaten Pangkajene Dan Kepulauan', '7309000000', '73', 'kabupaten-pangkajene-dan-kepulauan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(408, '10', 27, '7300000000', 'Kabupaten Barru', '7310000000', '73', 'kabupaten-barru', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(409, '11', 27, '7300000000', 'Kabupaten Bone', '7311000000', '73', 'kabupaten-bone', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(410, '12', 27, '7300000000', 'Kabupaten Soppeng', '7312000000', '73', 'kabupaten-soppeng', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(411, '13', 27, '7300000000', 'Kabupaten Wajo', '7313000000', '73', 'kabupaten-wajo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(412, '14', 27, '7300000000', 'Kabupaten Sidenreng Rappang', '7314000000', '73', 'kabupaten-sidenreng-rappang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(413, '15', 27, '7300000000', 'Kabupaten Pinrang', '7315000000', '73', 'kabupaten-pinrang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(414, '16', 27, '7300000000', 'Kabupaten Enrekang', '7316000000', '73', 'kabupaten-enrekang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(415, '17', 27, '7300000000', 'Kabupaten Luwu', '7317000000', '73', 'kabupaten-luwu', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(416, '18', 27, '7300000000', 'Kabupaten Tana Toraja', '7318000000', '73', 'kabupaten-tana-toraja', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(417, '22', 27, '7300000000', 'Kabupaten Luwu Utara', '7322000000', '73', 'kabupaten-luwu-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(418, '25', 27, '7300000000', 'Kabupaten Luwu Timur', '7325000000', '73', 'kabupaten-luwu-timur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(419, '26', 27, '7300000000', 'Kabupaten Toraja Utara', '7326000000', '73', 'kabupaten-toraja-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(420, '71', 27, '7300000000', 'Kota Makassar', '7371000000', '73', 'kota-makassar', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(421, '72', 27, '7300000000', 'Kota Parepare', '7372000000', '73', 'kota-parepare', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(422, '73', 27, '7300000000', 'Kota Palopo', '7373000000', '73', 'kota-palopo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(423, '1', NULL, '7400000000', 'Kabupaten Buton', '7401000000', '74', 'kabupaten-buton', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(424, '2', NULL, '7400000000', 'Kabupaten Muna', '7402000000', '74', 'kabupaten-muna', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(425, '3', NULL, '7400000000', 'Kabupaten Konawe', '7403000000', '74', 'kabupaten-konawe', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(426, '4', NULL, '7400000000', 'Kabupaten Kolaka', '7404000000', '74', 'kabupaten-kolaka', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(427, '5', NULL, '7400000000', 'Kabupaten Konawe Selatan', '7405000000', '74', 'kabupaten-konawe-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(428, '6', NULL, '7400000000', 'Kabupaten Bombana', '7406000000', '74', 'kabupaten-bombana', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(429, '7', NULL, '7400000000', 'Kabupaten Wakatobi', '7407000000', '74', 'kabupaten-wakatobi', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(430, '8', NULL, '7400000000', 'Kabupaten Kolaka Utara', '7408000000', '74', 'kabupaten-kolaka-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(431, '9', NULL, '7400000000', 'Kabupaten Buton Utara', '7409000000', '74', 'kabupaten-buton-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(432, '10', NULL, '7400000000', 'Kabupaten Konawe Utara', '7410000000', '74', 'kabupaten-konawe-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(433, '11', NULL, '7400000000', 'Kabupaten Kolaka Timur', '7411000000', '74', 'kabupaten-kolaka-timur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(434, '12', NULL, '7400000000', 'Kabupaten Konawe Kepulauan', '7412000000', '74', 'kabupaten-konawe-kepulauan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(435, '13', NULL, '7400000000', 'Kabupaten Muna Barat', '7413000000', '74', 'kabupaten-muna-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(436, '14', NULL, '7400000000', 'Kabupaten Buton Tengah', '7414000000', '74', 'kabupaten-buton-tengah', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(437, '15', NULL, '7400000000', 'Kabupaten Buton Selatan', '7415000000', '74', 'kabupaten-buton-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(438, '71', NULL, '7400000000', 'Kota Kendari', '7471000000', '74', 'kota-kendari', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(439, '72', NULL, '7400000000', 'Kota Baubau', '7472000000', '74', 'kota-baubau', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(440, '1', 29, '7500000000', 'Kabupaten Boalemo', '7501000000', '75', 'kabupaten-boalemo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(441, '2', 29, '7500000000', 'Kabupaten Gorontalo', '7502000000', '75', 'kabupaten-gorontalo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(442, '3', 29, '7500000000', 'Kabupaten Pohuwato', '7503000000', '75', 'kabupaten-pohuwato', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(443, '4', NULL, '7500000000', 'Kabupaten Bone Bolango', '7504000000', '75', 'kabupaten-bone-bolango', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(444, '5', 29, '7500000000', 'Kabupaten Gorontalo Utara', '7505000000', '75', 'kabupaten-gorontalo-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(445, '71', NULL, '7500000000', 'Kota Gorontalo', '7571000000', '75', 'kota-gorontalo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(446, '1', NULL, '7600000000', 'Kabupaten Majene', '7601000000', '76', 'kabupaten-majene', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(447, '2', NULL, '7600000000', 'Kabupaten Polewali Mandar', '7602000000', '76', 'kabupaten-polewali-mandar', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(448, '3', NULL, '7600000000', 'Kabupaten Mamasa', '7603000000', '76', 'kabupaten-mamasa', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(449, '4', NULL, '7600000000', 'Kabupaten Mamuju', '7604000000', '76', 'kabupaten-mamuju', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(450, '5', NULL, '7600000000', 'Kabupaten Mamuju Utara', '7605000000', '76', 'kabupaten-mamuju-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(451, '6', NULL, '7600000000', 'Kabupaten Mamuju Tengah', '7606000000', '76', 'kabupaten-mamuju-tengah', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(452, '1', 31, '8100000000', 'Kabupaten Maluku Tenggara Barat', '8101000000', '81', 'kabupaten-maluku-tenggara-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(453, '2', 31, '8100000000', 'Kabupaten Maluku Tenggara', '8102000000', '81', 'kabupaten-maluku-tenggara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(454, '3', 31, '8100000000', 'Kabupaten Maluku Tengah', '8103000000', '81', 'kabupaten-maluku-tengah', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(455, '4', 31, '8100000000', 'Kabupaten Buru', '8104000000', '81', 'kabupaten-buru', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(456, '5', 31, '8100000000', 'Kabupaten Kepulauan Aru', '8105000000', '81', 'kabupaten-kepulauan-aru', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(457, '6', 31, '8100000000', 'Kabupaten Seram Bagian Barat', '8106000000', '81', 'kabupaten-seram-bagian-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(458, '7', 31, '8100000000', 'Kabupaten Seram Bagian Timur', '8107000000', '81', 'kabupaten-seram-bagian-timur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(459, '8', 31, '8100000000', 'Kabupaten Maluku Barat Daya', '8108000000', '81', 'kabupaten-maluku-barat-daya', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(460, '9', 31, '8100000000', 'Kabupaten Buru Selatan', '8109000000', '81', 'kabupaten-buru-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(461, '71', 31, '8100000000', 'Kota Ambon', '8171000000', '81', 'kota-ambon', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(462, '72', 31, '8100000000', 'Kota Tual', '8172000000', '81', 'kota-tual', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(463, '1', 32, '8200000000', 'Kabupaten Halmahera Barat', '8201000000', '82', 'kabupaten-halmahera-barat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(464, '2', 32, '8200000000', 'Kabupaten Halmahera Tengah', '8202000000', '82', 'kabupaten-halmahera-tengah', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(465, '3', 32, '8200000000', 'Kabupaten Kepulauan Sula', '8203000000', '82', 'kabupaten-kepulauan-sula', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(466, '4', 32, '8200000000', 'Kabupaten Halmahera Selatan', '8204000000', '82', 'kabupaten-halmahera-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(467, '5', 32, '8200000000', 'Kabupaten Halmahera Utara', '8205000000', '82', 'kabupaten-halmahera-utara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(468, '6', 32, '8200000000', 'Kabupaten Halmahera Timur', '8206000000', '82', 'kabupaten-halmahera-timur', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(469, '7', 32, '8200000000', 'Kabupaten Pulau Morotai', '8207000000', '82', 'kabupaten-pulau-morotai', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(470, '8', 32, '8200000000', 'Kabupaten Pulau Taliabu', '8208000000', '82', 'kabupaten-pulau-taliabu', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(471, '71', 32, '8200000000', 'Kota Ternate', '8271000000', '82', 'kota-ternate', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(472, '72', 32, '8200000000', 'Kota Tidore Kepulauan', '8272000000', '82', 'kota-tidore-kepulauan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(473, '1', 33, '9100000000', 'Kabupaten Fakfak', '9101000000', '91', 'kabupaten-fakfak', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(474, '2', 33, '9100000000', 'Kabupaten Kaimana', '9102000000', '91', 'kabupaten-kaimana', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(475, '3', 33, '9100000000', 'Kabupaten Teluk Wondama', '9103000000', '91', 'kabupaten-teluk-wondama', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(476, '4', 33, '9100000000', 'Kabupaten Teluk Bintuni', '9104000000', '91', 'kabupaten-teluk-bintuni', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(477, '5', 33, '9100000000', 'Kabupaten Manokwari', '9105000000', '91', 'kabupaten-manokwari', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(478, '6', 33, '9100000000', 'Kabupaten Sorong Selatan', '9106000000', '91', 'kabupaten-sorong-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(479, '7', 33, '9100000000', 'Kabupaten Sorong', '9107000000', '91', 'kabupaten-sorong', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(480, '8', 33, '9100000000', 'Kabupaten Raja Ampat', '9108000000', '91', 'kabupaten-raja-ampat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(481, '9', 33, '9100000000', 'Kabupaten Tambrauw', '9109000000', '91', 'kabupaten-tambrauw', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(482, '10', 33, '9100000000', 'Kabupaten Maybrat', '9110000000', '91', 'kabupaten-maybrat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(483, '11', 33, '9100000000', 'Kabupaten Manokwari Selatan', '9111000000', '91', 'kabupaten-manokwari-selatan', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(484, '12', 33, '9100000000', 'Kabupaten Pegunungan Arfak', '9112000000', '91', 'kabupaten-pegunungan-arfak', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(485, '71', 33, '9100000000', 'Kota Sorong', '9171000000', '91', 'kota-sorong', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(486, '1', 34, '9400000000', 'Kabupaten Merauke', '9401000000', '94', 'kabupaten-merauke', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(487, '2', 34, '9400000000', 'Kabupaten Jayawijaya', '9402000000', '94', 'kabupaten-jayawijaya', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(488, '3', 34, '9400000000', 'Kabupaten Jayapura', '9403000000', '94', 'kabupaten-jayapura', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(489, '4', 34, '9400000000', 'Kabupaten Nabire', '9404000000', '94', 'kabupaten-nabire', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(490, '8', 34, '9400000000', 'Kabupaten Kepulauan Yapen', '9408000000', '94', 'kabupaten-kepulauan-yapen', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(491, '9', 34, '9400000000', 'Kabupaten Biak Numfor', '9409000000', '94', 'kabupaten-biak-numfor', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(492, '10', 34, '9400000000', 'Kabupaten Paniai', '9410000000', '94', 'kabupaten-paniai', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(493, '11', 34, '9400000000', 'Kabupaten Puncak Jaya', '9411000000', '94', 'kabupaten-puncak-jaya', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(494, '12', 34, '9400000000', 'Kabupaten Mimika', '9412000000', '94', 'kabupaten-mimika', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(495, '13', 34, '9400000000', 'Kabupaten Boven Digoel', '9413000000', '94', 'kabupaten-boven-digoel', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(496, '14', 34, '9400000000', 'Kabupaten Mappi', '9414000000', '94', 'kabupaten-mappi', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(497, '15', 34, '9400000000', 'Kabupaten Asmat', '9415000000', '94', 'kabupaten-asmat', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(498, '16', 34, '9400000000', 'Kabupaten Yahukimo', '9416000000', '94', 'kabupaten-yahukimo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(499, '17', 34, '9400000000', 'Kabupaten Pegunungan Bintang', '9417000000', '94', 'kabupaten-pegunungan-bintang', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(500, '18', 34, '9400000000', 'Kabupaten Tolikara', '9418000000', '94', 'kabupaten-tolikara', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(501, '19', 34, '9400000000', 'Kabupaten Sarmi', '9419000000', '94', 'kabupaten-sarmi', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(502, '20', 34, '9400000000', 'Kabupaten Keerom', '9420000000', '94', 'kabupaten-keerom', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(503, '26', 34, '9400000000', 'Kabupaten Waropen', '9426000000', '94', 'kabupaten-waropen', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(504, '27', 34, '9400000000', 'Kabupaten Supiori', '9427000000', '94', 'kabupaten-supiori', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(505, '28', 34, '9400000000', 'Kabupaten Mamberamo Raya', '9428000000', '94', 'kabupaten-mamberamo-raya', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(506, '29', 34, '9400000000', 'Kabupaten Nduga', '9429000000', '94', 'kabupaten-nduga', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(507, '30', 34, '9400000000', 'Kabupaten Lanny Jaya', '9430000000', '94', 'kabupaten-lanny-jaya', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(508, '31', 34, '9400000000', 'Kabupaten Mamberamo Tengah', '9431000000', '94', 'kabupaten-mamberamo-tengah', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(509, '32', 34, '9400000000', 'Kabupaten Yalimo', '9432000000', '94', 'kabupaten-yalimo', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(510, '33', 34, '9400000000', 'Kabupaten Puncak', '9433000000', '94', 'kabupaten-puncak', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(511, '34', 34, '9400000000', 'Kabupaten Dogiyai', '9434000000', '94', 'kabupaten-dogiyai', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(512, '35', 34, '9400000000', 'Kabupaten Intan Jaya', '9435000000', '94', 'kabupaten-intan-jaya', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(513, '36', 34, '9400000000', 'Kabupaten Deiyai', '9436000000', '94', 'kabupaten-deiyai', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(514, '71', 34, '9400000000', 'Kota Jayapura', '9471000000', '94', 'kota-jayapura', 0, 2, 1, '2017-07-25 14:35:23', NULL, NULL),
	(522, '6', 6, '1600000000', 'Kabupaten Banyuasin', '1606060000', '16', 'kabupaten-banyuasin', 0, 2, 1, '2018-10-26 15:35:23', 0, NULL),
	(523, '8', 8, '1800000000', 'Kabupaten Tulang Bawang', '1808080000', '18', 'kabupaten-tulang-bawang', 0, 2, 1, '2018-10-26 15:56:35', NULL, NULL),
	(524, '112233', NULL, '1100000000', 'tes', '223344', '', 'tes', 0, 2, 0, NULL, NULL, NULL);
/*!40000 ALTER TABLE `ref_city` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_comment
CREATE TABLE IF NOT EXISTS `ref_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Comment',
  `id_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Comment',
  `id_ref_news` int(11) NOT NULL COMMENT 'ID News',
  `id_ref_auth_user` int(11) NOT NULL COMMENT 'ID Auth User',
  `id_ref_status_publish` smallint(3) NOT NULL DEFAULT '1' COMMENT 'ID Status Publish',
  `id_ref_language` int(11) NOT NULL DEFAULT '1' COMMENT 'ID Language',
  `id_ref_language_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  `commentar` varchar(500) NOT NULL COMMENT 'Komentar',
  `is_admin` smallint(3) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0' COMMENT 'Flag',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  PRIMARY KEY (`id`),
  KEY `id_news` (`id_ref_news`),
  KEY `id_status_publish` (`id_ref_status_publish`),
  KEY `parent_id` (`id_parent`),
  KEY `id_auth_user` (`id_ref_auth_user`),
  KEY `id_lang` (`id_ref_language`),
  CONSTRAINT `comment_ubfk1` FOREIGN KEY (`id_ref_news`) REFERENCES `ref_news` (`id`),
  CONSTRAINT `comment_ubfk2` FOREIGN KEY (`id_ref_auth_user`) REFERENCES `ref_auth_user` (`id`),
  CONSTRAINT `comment_ubfk3` FOREIGN KEY (`id_parent`) REFERENCES `ref_comment` (`id`),
  CONSTRAINT `comment_ubfk4` FOREIGN KEY (`id_ref_status_publish`) REFERENCES `ref_status_publish` (`id`),
  CONSTRAINT `comment_ubfk5` FOREIGN KEY (`id_ref_language`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.ref_comment: ~0 rows (approximately)
/*!40000 ALTER TABLE `ref_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_comment` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_contact_us
CREATE TABLE IF NOT EXISTS `ref_contact_us` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Contact US',
  `id_ref_contact_us_topic` int(11) NOT NULL COMMENT 'ID Contact Us Topic',
  `subject` varchar(255) NOT NULL,
  `message` varchar(500) NOT NULL COMMENT 'Pesan',
  `fullname` varchar(130) NOT NULL COMMENT 'Nama Lengkap',
  `phone` varchar(20) NOT NULL COMMENT 'Nomor Telepon',
  `email` varchar(50) NOT NULL COMMENT 'Email',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Ref Auth User Create',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Ref Auth User Modify',
  `id_ref_language` int(11) NOT NULL DEFAULT '1' COMMENT 'ID Language',
  `id_ref_language_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  PRIMARY KEY (`id`),
  KEY `id_contact_us_topic` (`id_ref_contact_us_topic`,`id_ref_language`),
  KEY `contact_us_ubfk2` (`id_ref_language`),
  CONSTRAINT `contact_us_ubfk1` FOREIGN KEY (`id_ref_contact_us_topic`) REFERENCES `ref_contact_us_topic` (`id`),
  CONSTRAINT `contact_us_ubfk2` FOREIGN KEY (`id_ref_language`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.ref_contact_us: ~0 rows (approximately)
/*!40000 ALTER TABLE `ref_contact_us` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_contact_us` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_contact_us_topic
CREATE TABLE IF NOT EXISTS `ref_contact_us_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL COMMENT 'Nama Topic Contact Us',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `id_ref_language` int(11) NOT NULL DEFAULT '1' COMMENT 'ID  Language',
  `id_ref_language_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  PRIMARY KEY (`id`),
  KEY `id_lang` (`id_ref_language`),
  CONSTRAINT `contact_us_topic_ubfk1` FOREIGN KEY (`id_ref_language`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.ref_contact_us_topic: ~6 rows (approximately)
/*!40000 ALTER TABLE `ref_contact_us_topic` DISABLE KEYS */;
INSERT INTO `ref_contact_us_topic` (`id`, `name`, `create_date`, `id_ref_delete`, `id_ref_language`, `id_ref_language_parent`, `id_ref_auth_user_create`, `modify_date`, `id_ref_auth_user_modify`) VALUES
	(1, 'Umum', '2018-07-20 13:42:55', 0, 1, NULL, 10, '2018-09-18 17:40:39', 1),
	(2, 'Magang', '2018-07-20 13:43:27', 0, 1, NULL, 10, NULL, NULL),
	(3, 'Pesan Produk', '2018-07-20 13:43:40', 0, 1, NULL, 10, NULL, NULL),
	(4, 'General', '2018-07-20 13:44:17', 0, 2, 1, 10, '2018-09-18 17:40:39', 1),
	(5, 'Apprentice', '2018-07-20 13:45:02', 0, 2, 2, 10, NULL, NULL),
	(6, 'Order Product', '2018-07-20 13:45:46', 0, 2, 3, 10, NULL, NULL);
/*!40000 ALTER TABLE `ref_contact_us_topic` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_delete
CREATE TABLE IF NOT EXISTS `ref_delete` (
  `id` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Delete',
  `name` char(20) NOT NULL COMMENT 'Nama Status Delete',
  `id_ref_delete` smallint(3) NOT NULL COMMENT 'ID Status Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.ref_delete: ~2 rows (approximately)
/*!40000 ALTER TABLE `ref_delete` DISABLE KEYS */;
INSERT INTO `ref_delete` (`id`, `name`, `id_ref_delete`) VALUES
	(0, 'Not Deleted', 0),
	(1, 'Deleted', 0);
/*!40000 ALTER TABLE `ref_delete` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_dosen
CREATE TABLE IF NOT EXISTS `ref_dosen` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID News',
  `id_ref_dosen_category` int(11) NOT NULL COMMENT 'ID News Category',
  `id_ref_status_publish` smallint(3) NOT NULL DEFAULT '1' COMMENT 'ID Status Publish',
  `name` varchar(255) NOT NULL COMMENT 'Judul Berita',
  `uri_path` varchar(50) NOT NULL COMMENT 'Uri Path',
  `pangkat` text NOT NULL,
  `pangkat_date` date DEFAULT NULL,
  `page_content` text COMMENT 'Halaman Konten',
  `jabatan` text,
  `alamat` text,
  `no_telepon` text,
  `prodi` text,
  `id_ref_dosen_status` int(11) DEFAULT NULL,
  `img` varchar(30) DEFAULT NULL COMMENT 'Gambar',
  `publish_date` date DEFAULT NULL COMMENT 'Tanggal Publish',
  `expected_publish_date` date DEFAULT NULL COMMENT 'Expected Tanggal Publish',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT 'hits',
  `sort` int(11) DEFAULT '0' COMMENT 'sortir',
  `seo_title` longtext COMMENT 'Judul SEO',
  `meta_description` longtext COMMENT 'Deskripsi META',
  `meta_keywords` longtext COMMENT 'Kata kunci META',
  `id_ref_language` int(11) DEFAULT '1' COMMENT 'ID Language',
  `id_ref_language_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  PRIMARY KEY (`id`),
  KEY `id_status_publish` (`id_ref_status_publish`),
  KEY `is_delete` (`id_ref_delete`),
  KEY `id_language` (`id_ref_language`),
  CONSTRAINT `ref_dosen_ibfk_1` FOREIGN KEY (`id_ref_status_publish`) REFERENCES `ref_status_publish` (`id`),
  CONSTRAINT `ref_dosen_ibfk_2` FOREIGN KEY (`id_ref_delete`) REFERENCES `ref_delete` (`id`),
  CONSTRAINT `ref_dosen_ibfk_3` FOREIGN KEY (`id_ref_language`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table cms_deptech.ref_dosen: ~0 rows (approximately)
/*!40000 ALTER TABLE `ref_dosen` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_dosen` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_dosen_category
CREATE TABLE IF NOT EXISTS `ref_dosen_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID News',
  `name` varchar(255) NOT NULL COMMENT 'Judul Berita',
  `id_ref_language` int(11) DEFAULT '1' COMMENT 'ID Language',
  `id_ref_language_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`id_ref_delete`),
  KEY `id_language` (`id_ref_language`),
  CONSTRAINT `ref_dosen_category_ibfk_1` FOREIGN KEY (`id_ref_delete`) REFERENCES `ref_delete` (`id`),
  CONSTRAINT `ref_dosen_category_ibfk_2` FOREIGN KEY (`id_ref_language`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table cms_deptech.ref_dosen_category: ~1 rows (approximately)
/*!40000 ALTER TABLE `ref_dosen_category` DISABLE KEYS */;
INSERT INTO `ref_dosen_category` (`id`, `name`, `id_ref_language`, `id_ref_language_parent`, `id_ref_delete`, `create_date`, `id_ref_auth_user_create`, `id_ref_auth_user_modify`, `modify_date`) VALUES
	(1, 'PAI', 1, NULL, 0, '0000-00-00 00:00:00', 0, NULL, NULL),
	(2, 'PIAUD', 1, NULL, 0, '0000-00-00 00:00:00', 0, NULL, NULL);
/*!40000 ALTER TABLE `ref_dosen_category` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_dosen_status
CREATE TABLE IF NOT EXISTS `ref_dosen_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID News',
  `name` varchar(255) NOT NULL COMMENT 'Judul Berita',
  `id_ref_language` int(11) DEFAULT '1' COMMENT 'ID Language',
  `id_ref_language_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`id_ref_delete`),
  KEY `id_language` (`id_ref_language`),
  CONSTRAINT `ref_dosen_status_ibfk_1` FOREIGN KEY (`id_ref_delete`) REFERENCES `ref_delete` (`id`),
  CONSTRAINT `ref_dosen_status_ibfk_2` FOREIGN KEY (`id_ref_language`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table cms_deptech.ref_dosen_status: ~1 rows (approximately)
/*!40000 ALTER TABLE `ref_dosen_status` DISABLE KEYS */;
INSERT INTO `ref_dosen_status` (`id`, `name`, `id_ref_language`, `id_ref_language_parent`, `id_ref_delete`, `create_date`, `id_ref_auth_user_create`, `id_ref_auth_user_modify`, `modify_date`) VALUES
	(1, 'Active', 1, NULL, 0, '0000-00-00 00:00:00', 0, NULL, NULL);
/*!40000 ALTER TABLE `ref_dosen_status` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_email_tmp
CREATE TABLE IF NOT EXISTS `ref_email_tmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Email Template',
  `template_name` varchar(200) NOT NULL DEFAULT 'NULL' COMMENT 'Nama Template',
  `subject` varchar(200) NOT NULL DEFAULT 'NULL' COMMENT 'Subyek',
  `page_content` longtext COMMENT 'Halaman Content',
  `code` char(10) DEFAULT NULL COMMENT 'Code Email Template',
  `id_ref_status_publish` smallint(3) NOT NULL DEFAULT '1' COMMENT 'ID Status Publish',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `id_ref_auth_user_create` int(11) NOT NULL DEFAULT '0' COMMENT 'ID Auth User Create',
  `create_date` datetime DEFAULT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_modify` int(11) DEFAULT '0' COMMENT 'ID Auth User Modify',
  `modify_date` date DEFAULT NULL COMMENT 'Tanggal Perubahan',
  `id_ref_language` int(11) NOT NULL DEFAULT '1' COMMENT 'ID Language',
  PRIMARY KEY (`id`),
  KEY `id_status_publish` (`id_ref_status_publish`,`id_ref_language`),
  KEY `email_tmp_ubfk2` (`id_ref_language`),
  CONSTRAINT `email_tmp_ubfk1` FOREIGN KEY (`id_ref_status_publish`) REFERENCES `ref_status_publish` (`id`),
  CONSTRAINT `email_tmp_ubfk2` FOREIGN KEY (`id_ref_language`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table cms_deptech.ref_email_tmp: ~3 rows (approximately)
/*!40000 ALTER TABLE `ref_email_tmp` DISABLE KEYS */;
INSERT INTO `ref_email_tmp` (`id`, `template_name`, `subject`, `page_content`, `code`, `id_ref_status_publish`, `id_ref_delete`, `id_ref_auth_user_create`, `create_date`, `id_ref_auth_user_modify`, `modify_date`, `id_ref_language`) VALUES
	(1, 'Request Forgot Password ID', 'Permintaan Lupa Kata Sandi', '<p>Halo {fullname},</p>\n\n<p>&nbsp;</p>\n\n<p>Anda baru saja melakukan permintaa lupa kata sandi. Gunakan link dibawah ini untuk melakukan perubahan kata sandi.</p>\n\n<p>&nbsp;</p>\n\n<p>{click_btn}</p>\n\n<p>&nbsp;</p>\n\n<p>Terima kasih,</p>\n\n<p>Tim Deptech Digital Indonesia</p>\n', 'RFP', 2, 0, 1, '2018-11-28 14:43:02', 0, NULL, 2),
	(2, 'Success Change Password ID', 'Berhasil Ganti Kata Sandi', '<p>Halo {fullname},</p>\n\n<p>&nbsp;</p>\n\n<p>Anda baru saja mengganti kata sandi Anda di Deptech Digital Indonesia sistem. Mohon diingat kata sandi Anda yang baru. Gunakan kata sandi tersebut untuk masuk kedalam CMS.</p>\n\n<p>&nbsp;</p>\n\n<p>{click_btn}</p>\n\n<p>&nbsp;</p>\n\n<p>Terima kasih,</p>\n\n<p>Deptech Digital Indonesia Tim</p>\n', 'SCP', 2, 0, 1, '2018-11-28 17:05:27', 0, NULL, 2),
	(3, 'Contact Us Replay ID ID', 'Balas Pesan', '<p>Halo {fullname},</p>\r\n\r\n<p>Terima kasih telah menghubungi Prodealer.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Terima kasih,</p>\r\n\r\n<p>Tim Deptech Digital Indonesia&nbsp;</p>\r\n', 'CUR', 2, 0, 1, '2018-12-04 17:49:57', 1, '2018-12-04', 2);
/*!40000 ALTER TABLE `ref_email_tmp` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_event_category
CREATE TABLE IF NOT EXISTS `ref_event_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Event Category',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'Nama Event Category',
  `img` varchar(70) DEFAULT NULL COMMENT 'Gambar',
  `uri_path` varchar(50) DEFAULT '' COMMENT 'Uri Path',
  `id_ref_language` int(11) DEFAULT NULL COMMENT 'ID Language',
  `id_ref_parent_language` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  `is_hide` int(11) NOT NULL DEFAULT '0' COMMENT 'Is Hide',
  `id_ref_delete` smallint(6) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  PRIMARY KEY (`id`),
  KEY `id_language` (`id_ref_language`),
  KEY `id_parent_language` (`id_ref_parent_language`),
  CONSTRAINT `ref_event_category_ufbk1` FOREIGN KEY (`id_ref_language`) REFERENCES `ref_language` (`id`),
  CONSTRAINT `ref_event_category_ufbk2` FOREIGN KEY (`id_ref_parent_language`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table cms_deptech.ref_event_category: ~0 rows (approximately)
/*!40000 ALTER TABLE `ref_event_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_event_category` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_frontend_menu_type
CREATE TABLE IF NOT EXISTS `ref_frontend_menu_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Tipe Frontend Menu',
  `name` varchar(45) DEFAULT NULL COMMENT 'Nama Tipe Frontend Menu',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.ref_frontend_menu_type: ~2 rows (approximately)
/*!40000 ALTER TABLE `ref_frontend_menu_type` DISABLE KEYS */;
INSERT INTO `ref_frontend_menu_type` (`id`, `name`) VALUES
	(1, 'Module'),
	(2, 'External Link');
/*!40000 ALTER TABLE `ref_frontend_menu_type` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_gallery
CREATE TABLE IF NOT EXISTS `ref_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID News',
  `id_ref_gallery_category` int(11) NOT NULL COMMENT 'ID News Category',
  `id_ref_status_publish` smallint(3) NOT NULL DEFAULT '1' COMMENT 'ID Status Publish',
  `name` varchar(255) NOT NULL COMMENT 'Judul Berita',
  `uri_path` varchar(50) NOT NULL COMMENT 'Uri Path',
  `img` varchar(30) DEFAULT NULL COMMENT 'Gambar',
  `publish_date` date DEFAULT NULL COMMENT 'Tanggal Publish',
  `expected_publish_date` date DEFAULT NULL COMMENT 'Expected Tanggal Publish',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT 'hits',
  `sort` int(11) DEFAULT '0' COMMENT 'sortir',
  `seo_title` longtext COMMENT 'Judul SEO',
  `meta_description` longtext COMMENT 'Deskripsi META',
  `meta_keywords` longtext COMMENT 'Kata kunci META',
  `id_ref_language` int(11) DEFAULT '1' COMMENT 'ID Language',
  `id_ref_language_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  PRIMARY KEY (`id`),
  KEY `id_status_publish` (`id_ref_status_publish`),
  KEY `is_delete` (`id_ref_delete`),
  KEY `id_language` (`id_ref_language`),
  CONSTRAINT `ref_gallery_ibfk_1` FOREIGN KEY (`id_ref_status_publish`) REFERENCES `ref_status_publish` (`id`),
  CONSTRAINT `ref_gallery_ibfk_2` FOREIGN KEY (`id_ref_delete`) REFERENCES `ref_delete` (`id`),
  CONSTRAINT `ref_gallery_ibfk_3` FOREIGN KEY (`id_ref_language`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table cms_deptech.ref_gallery: ~0 rows (approximately)
/*!40000 ALTER TABLE `ref_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_gallery` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_gallery_category
CREATE TABLE IF NOT EXISTS `ref_gallery_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID News',
  `name` text COMMENT 'Tanggal Perubahan',
  `id_ref_language` int(11) DEFAULT '1' COMMENT 'ID Language',
  `id_ref_language_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table cms_deptech.ref_gallery_category: ~2 rows (approximately)
/*!40000 ALTER TABLE `ref_gallery_category` DISABLE KEYS */;
INSERT INTO `ref_gallery_category` (`id`, `name`, `id_ref_language`, `id_ref_language_parent`, `id_ref_delete`, `create_date`, `id_ref_auth_user_create`, `id_ref_auth_user_modify`, `modify_date`) VALUES
	(1, 'Gallery', 1, NULL, 0, '0000-00-00 00:00:00', 0, NULL, NULL),
	(2, 'Fasilitas', 1, NULL, 0, '0000-00-00 00:00:00', 0, NULL, NULL);
/*!40000 ALTER TABLE `ref_gallery_category` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_gallery_detail
CREATE TABLE IF NOT EXISTS `ref_gallery_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID News',
  `id_ref_gallery` int(11) NOT NULL COMMENT 'ID News Category',
  `name` varchar(255) NOT NULL COMMENT 'Judul Berita',
  `uri_path` varchar(50) NOT NULL COMMENT 'Uri Path',
  `publish_date` date DEFAULT NULL COMMENT 'Tanggal Publish',
  `expected_publish_date` date DEFAULT NULL COMMENT 'Expected Tanggal Publish',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT 'hits',
  `sort` int(11) DEFAULT '0' COMMENT 'sortir',
  `seo_title` longtext COMMENT 'Judul SEO',
  `meta_description` longtext COMMENT 'Deskripsi META',
  `meta_keywords` longtext COMMENT 'Kata kunci META',
  `id_ref_language` int(11) DEFAULT '1' COMMENT 'ID Language',
  `id_ref_language_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`id_ref_delete`),
  KEY `id_language` (`id_ref_language`),
  CONSTRAINT `ref_gallery_detail_ibfk_1` FOREIGN KEY (`id_ref_delete`) REFERENCES `ref_delete` (`id`),
  CONSTRAINT `ref_gallery_detail_ibfk_2` FOREIGN KEY (`id_ref_language`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table cms_deptech.ref_gallery_detail: ~0 rows (approximately)
/*!40000 ALTER TABLE `ref_gallery_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_gallery_detail` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_gender
CREATE TABLE IF NOT EXISTS `ref_gender` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT COMMENT 'ID Gender',
  `name` char(30) NOT NULL COMMENT 'Nama Jenis Kelamin',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.ref_gender: ~2 rows (approximately)
/*!40000 ALTER TABLE `ref_gender` DISABLE KEYS */;
INSERT INTO `ref_gender` (`id`, `name`, `id_ref_delete`) VALUES
	(1, 'Laki-laki', 0),
	(2, 'Perempuan', 0);
/*!40000 ALTER TABLE `ref_gender` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_kerjasama
CREATE TABLE IF NOT EXISTS `ref_kerjasama` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID News',
  `publish_date` date DEFAULT NULL COMMENT 'Tanggal Publish',
  `id_ref_status_publish` smallint(3) NOT NULL DEFAULT '1' COMMENT 'ID Status Publish',
  `name` varchar(255) NOT NULL COMMENT 'Judul Berita',
  `id_ref_kerjasama_category` int(11) NOT NULL DEFAULT '0',
  `kurun_waktu_awal` date NOT NULL,
  `kurun_waktu_akhir` date NOT NULL,
  `id_ref_language` int(11) DEFAULT '1' COMMENT 'ID Language',
  `id_ref_language_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  PRIMARY KEY (`id`),
  KEY `id_status_publish` (`id_ref_status_publish`),
  KEY `is_delete` (`id_ref_delete`),
  KEY `id_language` (`id_ref_language`),
  CONSTRAINT `ref_kerjasama_ibfk_2` FOREIGN KEY (`id_ref_status_publish`) REFERENCES `ref_status_publish` (`id`),
  CONSTRAINT `ref_kerjasama_ibfk_3` FOREIGN KEY (`id_ref_delete`) REFERENCES `ref_delete` (`id`),
  CONSTRAINT `ref_kerjasama_ibfk_4` FOREIGN KEY (`id_ref_language`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table cms_deptech.ref_kerjasama: ~0 rows (approximately)
/*!40000 ALTER TABLE `ref_kerjasama` DISABLE KEYS */;
INSERT INTO `ref_kerjasama` (`id`, `publish_date`, `id_ref_status_publish`, `name`, `id_ref_kerjasama_category`, `kurun_waktu_awal`, `kurun_waktu_akhir`, `id_ref_language`, `id_ref_language_parent`, `id_ref_delete`, `create_date`, `id_ref_auth_user_create`, `id_ref_auth_user_modify`, `modify_date`) VALUES
	(1, '2019-11-15', 1, '	Institut PTIQ Jakarta dengan Universitas Islam Minnesota', 1, '0000-00-00', '0000-00-00', 1, NULL, 0, '0000-00-00 00:00:00', 0, NULL, NULL);
/*!40000 ALTER TABLE `ref_kerjasama` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_kerjasama_category
CREATE TABLE IF NOT EXISTS `ref_kerjasama_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID News',
  `name` varchar(255) NOT NULL COMMENT 'Judul Berita',
  `id_ref_language` int(11) DEFAULT '1' COMMENT 'ID Language',
  `id_ref_language_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  PRIMARY KEY (`id`),
  KEY `is_delete` (`id_ref_delete`),
  KEY `id_language` (`id_ref_language`),
  CONSTRAINT `ref_kerjasama_category_ibfk_2` FOREIGN KEY (`id_ref_delete`) REFERENCES `ref_delete` (`id`),
  CONSTRAINT `ref_kerjasama_category_ibfk_3` FOREIGN KEY (`id_ref_language`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table cms_deptech.ref_kerjasama_category: ~2 rows (approximately)
/*!40000 ALTER TABLE `ref_kerjasama_category` DISABLE KEYS */;
INSERT INTO `ref_kerjasama_category` (`id`, `name`, `id_ref_language`, `id_ref_language_parent`, `id_ref_delete`, `create_date`, `id_ref_auth_user_create`, `id_ref_auth_user_modify`, `modify_date`) VALUES
	(1, 'Pendidikan', 1, NULL, 0, '0000-00-00 00:00:00', 0, NULL, NULL),
	(2, 'Kerjasama di Bidang Pendidikan, Penelitian dan Pengabdian Kepada Masyarakat', 1, NULL, 0, '0000-00-00 00:00:00', 0, NULL, NULL);
/*!40000 ALTER TABLE `ref_kerjasama_category` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_language
CREATE TABLE IF NOT EXISTS `ref_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Bahasa',
  `name` varchar(80) NOT NULL COMMENT 'Nama Bahasa',
  `code` char(3) DEFAULT NULL COMMENT 'Kode Bahasa',
  `status_lang` int(11) NOT NULL DEFAULT '0' COMMENT 'jk 1 = default language',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.ref_language: ~2 rows (approximately)
/*!40000 ALTER TABLE `ref_language` DISABLE KEYS */;
INSERT INTO `ref_language` (`id`, `name`, `code`, `status_lang`, `id_ref_delete`, `id_ref_auth_user_create`, `create_date`, `id_ref_auth_user_modify`, `modify_date`) VALUES
	(1, 'Indonesia', 'ID', 1, 0, 1, '2018-12-10 11:07:00', 0, NULL),
	(2, 'English', 'EN', 0, 1, 1, '2018-12-10 11:07:00', 1, '2019-11-16 12:59:30');
/*!40000 ALTER TABLE `ref_language` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_menu_admin
CREATE TABLE IF NOT EXISTS `ref_menu_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_ref_menu_admin_parents` int(11) DEFAULT '0' COMMENT 'ID master menu admin',
  `menu` varchar(60) NOT NULL DEFAULT '' COMMENT 'nama menu',
  `controller` varchar(60) NOT NULL DEFAULT '' COMMENT 'nama controller',
  `urut` decimal(3,0) DEFAULT NULL COMMENT 'nomor urut menu',
  `img_icon` varchar(50) DEFAULT '' COMMENT 'icon menu',
  `breadcrumb` varchar(255) DEFAULT '' COMMENT 'breadcrumb',
  `id_ref_delete` smallint(3) NOT NULL COMMENT 'status data',
  `create_date` datetime DEFAULT NULL COMMENT 'tanggal dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `modify_date` datetime DEFAULT NULL COMMENT 'tanggal perubahan',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID  Auth User Modify',
  PRIMARY KEY (`id`),
  KEY `id_parent_menu_admin` (`id_ref_menu_admin_parents`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- Dumping data for table cms_deptech.ref_menu_admin: ~33 rows (approximately)
/*!40000 ALTER TABLE `ref_menu_admin` DISABLE KEYS */;
INSERT INTO `ref_menu_admin` (`id`, `id_ref_menu_admin_parents`, `menu`, `controller`, `urut`, `img_icon`, `breadcrumb`, `id_ref_delete`, `create_date`, `id_ref_auth_user_create`, `modify_date`, `id_ref_auth_user_modify`) VALUES
	(1, 0, 'Admin', '#', 2, 'list-icon feather feather-square', 'Admin', 0, '2018-11-15 04:09:13', 1, '2018-12-07 15:12:36', 1),
	(2, 1, 'Menu Management', 'auth_menu', 1, '#', 'Menu Management', 0, '2018-11-15 04:08:07', 1, NULL, NULL),
	(3, 0, 'My Accounts', '#', 6, 'list-icon feather feather-user', 'My Accounts', 0, '2018-11-15 04:04:07', 1, NULL, NULL),
	(4, 0, 'Settings', '#', 5, 'list-icon feather feather-settings', 'Setting', 0, '2018-11-15 02:05:04', 1, NULL, NULL),
	(5, 0, 'Home', 'home', 1, 'list-icon feather feather-home', 'Beranda', 0, '2018-11-15 05:05:05', 1, NULL, NULL),
	(6, 1, 'Group Authentication', 'auth_group', 3, '#', 'Group Authentication', 0, '2018-11-15 05:05:05', 1, NULL, NULL),
	(7, 3, 'Manage Profile', 'myaccount', 1, '#', 'Manage Account', 0, '2018-11-15 02:05:04', 1, NULL, NULL),
	(8, 3, 'Change Password', 'change_pw', 2, '#', 'Change Password', 0, '2018-11-15 02:05:04', 1, NULL, NULL),
	(9, 4, 'Icons', 'icons', 3, '#', 'Icon-Icon', 1, '2018-11-15 02:05:04', 1, '2018-11-29 18:06:04', 1),
	(10, 1, 'User Management', 'auth_user', 4, '#', 'User Management', 0, '2018-11-15 02:05:04', 1, NULL, NULL),
	(11, 4, 'Email Config', 'email_config', 1, 'a', 'Email Config', 0, '2018-11-15 02:05:04', 1, NULL, NULL),
	(12, 4, 'Email Template', 'email_tmp', 2, '#', 'Email Template', 0, '2018-11-15 02:05:04', 1, NULL, NULL),
	(13, 3, 'Logs', 'logs', 3, '#', 'Logs', 0, NULL, 0, NULL, NULL),
	(14, 4, 'Icons', 'icons', 4, '#', 'Icons', 0, '2018-11-29 17:45:47', 1, NULL, NULL),
	(15, 16, 'Pages', 'pages', 1, 'list-icon feather feather-file', 'Pages', 0, '2018-11-29 18:24:23', 1, '2018-11-29 18:45:18', 1),
	(16, 1, 'Frontend Management', '#', 5, '#', 'Frontend Management', 0, '2018-11-29 18:43:53', 1, NULL, NULL),
	(17, 16, 'Frontend Menu', 'frontend_menu', 1, '#', 'Frontend Menu', 0, '2018-11-29 18:44:42', 1, NULL, NULL),
	(18, 4, 'Language', 'language', 5, '', 'Language', 0, '2018-11-30 14:52:48', 1, NULL, NULL),
	(19, 0, 'News', '#', 4, 'list-icon feather feather-layout', 'News', 0, '2018-12-04 10:28:30', 1, NULL, NULL),
	(20, 19, 'News Category', 'news_category', 2, '#', 'News Category', 0, '2018-12-04 10:32:51', 1, NULL, NULL),
	(21, 19, 'News Tags', 'news_tags', 3, '#', 'News Tags', 1, '2018-12-04 10:32:52', 1, '2018-12-04 10:36:51', 1),
	(22, 19, 'News Category', 'news_category', 4, '#', 'News Category', 1, '2018-12-04 10:32:52', 1, NULL, NULL),
	(23, 19, 'News', 'news', 1, '#', 'News', 0, '2018-12-04 10:36:10', 1, NULL, NULL),
	(24, 0, 'Contact Us', '#', 3, 'list-icon feather feather-phone', 'Contact Us', 0, '2018-12-04 13:14:50', 1, '2018-12-04 13:32:36', 1),
	(25, 24, 'Contact Us', 'contactus', 1, '#', 'Contact Us', 0, '2018-12-04 13:34:04', 1, NULL, NULL),
	(26, 1, 'Backup Data', 'backup_data', 6, '#', 'Backup Data', 0, '2018-12-04 16:38:13', 1, NULL, NULL),
	(27, 19, 'All Tags', 'tags', 5, '#', 'All Tags', 1, '2018-12-06 19:07:57', 1, NULL, NULL),
	(28, 0, 'Master', '#', 9, 'list-icon feather feather-grid', 'Master', 1, '2018-12-07 10:40:11', 1, '2018-12-07 10:40:57', 1),
	(29, 28, 'Province', 'province', 1, '', 'Province', 0, '2018-12-07 10:42:19', 1, '2018-12-07 15:12:41', 1),
	(30, 28, 'City', 'City', 2, '', 'City', 0, '2018-12-07 10:43:59', 1, NULL, NULL),
	(31, 0, 'Gallery', 'gallery', 10, 'list-icon feather feather-image ', 'Gallery', 0, '2019-11-15 15:58:35', 1, '2019-11-15 16:00:27', 1),
	(32, 0, 'Dosen', 'dosen', 11, 'list-icon feather feather-users', 'Dosen', 0, '2019-11-15 16:05:42', 1, NULL, NULL),
	(33, 4, 'Web Config', 'web_config', 6, '-', 'Web Config', 0, '2019-11-15 16:19:55', 1, NULL, NULL),
	(34, 0, 'Banner', 'Banner', 12, 'list-icon feather feather-flag', 'Banner', 0, '2019-11-15 16:39:21', 1, NULL, NULL);
/*!40000 ALTER TABLE `ref_menu_admin` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_module
CREATE TABLE IF NOT EXISTS `ref_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Module',
  `name` varchar(50) DEFAULT '' COMMENT 'Nama Module',
  `controller` varchar(50) DEFAULT '' COMMENT 'Controller',
  `callback` varchar(50) DEFAULT '' COMMENT 'Callback',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_modify` int(11) NOT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime NOT NULL COMMENT 'Tanggal Perubahan',
  `id_ref_delete` smallint(3) NOT NULL COMMENT 'ID Status Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table cms_deptech.ref_module: ~3 rows (approximately)
/*!40000 ALTER TABLE `ref_module` DISABLE KEYS */;
INSERT INTO `ref_module` (`id`, `name`, `controller`, `callback`, `id_ref_auth_user_create`, `create_date`, `id_ref_auth_user_modify`, `modify_date`, `id_ref_delete`) VALUES
	(1, 'Pages', 'pages', 'pages/select_pages', 0, '2018-12-05 18:59:00', 0, '0000-00-00 00:00:00', 0),
	(2, 'News', 'news', 'news/select_category', 0, '2018-12-05 18:59:00', 0, '0000-00-00 00:00:00', 0),
	(3, 'Event', 'event', 'event/select_category', 0, '2018-12-05 18:59:00', 0, '0000-00-00 00:00:00', 1),
	(4, 'Home', 'home', 'home/', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1);
/*!40000 ALTER TABLE `ref_module` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_news
CREATE TABLE IF NOT EXISTS `ref_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID News',
  `id_ref_news_category` int(11) NOT NULL COMMENT 'ID News Category',
  `id_ref_status_publish` smallint(3) NOT NULL DEFAULT '1' COMMENT 'ID Status Publish',
  `title` varchar(255) NOT NULL COMMENT 'Judul Berita',
  `uri_path` varchar(50) NOT NULL COMMENT 'Uri Path',
  `teaser` varchar(255) DEFAULT NULL COMMENT 'Teaser',
  `page_content` text COMMENT 'Halaman Konten',
  `youtube_link` varchar(70) DEFAULT NULL COMMENT 'Link Youtube Video',
  `img` text COMMENT 'Gambar',
  `publish_date` date DEFAULT NULL COMMENT 'Tanggal Publish',
  `expected_publish_date` date DEFAULT NULL COMMENT 'Expected Tanggal Publish',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT 'hits',
  `link` text COMMENT 'Link Youtube Video',
  `sort` int(11) DEFAULT '0' COMMENT 'sortir',
  `seo_title` longtext COMMENT 'Judul SEO',
  `meta_keywords` longtext COMMENT 'Kata kunci META',
  `meta_description` longtext COMMENT 'Deskripsi META',
  `id_ref_language` int(11) DEFAULT '1' COMMENT 'ID Language',
  `id_ref_language_parent` int(11) DEFAULT NULL COMMENT 'ID Parent Language',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  PRIMARY KEY (`id`),
  KEY `id_news_category` (`id_ref_news_category`),
  KEY `id_status_publish` (`id_ref_status_publish`),
  KEY `is_delete` (`id_ref_delete`),
  KEY `id_language` (`id_ref_language`),
  CONSTRAINT `news_ufbk3` FOREIGN KEY (`id_ref_delete`) REFERENCES `ref_delete` (`id`),
  CONSTRAINT `news_ufbk4` FOREIGN KEY (`id_ref_language`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.ref_news: ~6 rows (approximately)
/*!40000 ALTER TABLE `ref_news` DISABLE KEYS */;
INSERT INTO `ref_news` (`id`, `id_ref_news_category`, `id_ref_status_publish`, `title`, `uri_path`, `teaser`, `page_content`, `youtube_link`, `img`, `publish_date`, `expected_publish_date`, `hits`, `link`, `sort`, `seo_title`, `meta_keywords`, `meta_description`, `id_ref_language`, `id_ref_language_parent`, `id_ref_delete`, `create_date`, `id_ref_auth_user_create`, `id_ref_auth_user_modify`, `modify_date`) VALUES
	(1, 3, 2, 'arek III Institut PTIQ Hadir dalam Silaturahim Forkopimko', 'arek-iii-institut-ptiq-hadir-dalam-silaturahim-for', 'Dalam acara tersebut Kapolres Metro Jakarta Selatan Kombes Bastoni Purnama memberikan sambutan kepada seluruh tamu undangan yang hadir terkhusus memberikan bimbingan dan arahan kepada mahasiswa yang hadir mewakili kampus se-Jakarta Selatan., “Teman-teman ', '<p>Dalam acara tersebut Kapolres Metro Jakarta Selatan Kombes Bastoni Purnama memberikan sambutan kepada seluruh tamu undangan yang hadir terkhusus memberikan bimbingan dan arahan kepada mahasiswa yang hadir mewakili kampus se-Jakarta Selatan., “Teman-tem', NULL, 'b2.jpg', '2020-11-15', NULL, 0, NULL, 0, NULL, NULL, NULL, 1, NULL, 0, '2019-11-15 17:39:06', 1, NULL, NULL),
	(2, 3, 2, '2', '2', '2', '<p>Dalam acara tersebut Kapolres Metro Jakarta Selatan Kombes Bastoni Purnama memberikan sambutan kepada seluruh tamu undangan yang hadir terkhusus memberikan bimbingan dan arahan kepada mahasiswa yang hadir mewakili kampus se-Jakarta Selatan., “Teman-tem', NULL, 'b2.jpg', '2020-11-15', NULL, 0, NULL, 0, NULL, NULL, NULL, 1, NULL, 0, '2019-11-15 17:39:06', 1, NULL, NULL),
	(3, 3, 2, '3', '3', '3', '<p>Dalam acara tersebut Kapolres Metro Jakarta Selatan Kombes Bastoni Purnama memberikan sambutan kepada seluruh tamu undangan yang hadir terkhusus memberikan bimbingan dan arahan kepada mahasiswa yang hadir mewakili kampus se-Jakarta Selatan., “Teman-tem', NULL, 'b2.jpg', '2020-11-15', NULL, 0, NULL, 0, NULL, NULL, NULL, 1, NULL, 0, '2019-11-15 17:39:06', 1, NULL, NULL),
	(4, 3, 2, '4', '4', '4', '<p>Dalam acara tersebut Kapolres Metro Jakarta Selatan Kombes Bastoni Purnama memberikan sambutan kepada seluruh tamu undangan yang hadir terkhusus memberikan bimbingan dan arahan kepada mahasiswa yang hadir mewakili kampus se-Jakarta Selatan., “Teman-tem', NULL, 'b2.jpg', '2020-11-15', NULL, 0, NULL, 0, NULL, NULL, NULL, 1, NULL, 0, '2019-11-15 17:39:06', 1, NULL, NULL),
	(5, 3, 2, '5', '5', '5', '<p>Dalam acara tersebut Kapolres Metro Jakarta Selatan Kombes Bastoni Purnama memberikan sambutan kepada seluruh tamu undangan yang hadir terkhusus memberikan bimbingan dan arahan kepada mahasiswa yang hadir mewakili kampus se-Jakarta Selatan., “Teman-tem', NULL, 'b2.jpg', '2020-11-15', NULL, 0, NULL, 0, NULL, NULL, NULL, 1, NULL, 0, '2019-11-15 17:39:06', 1, NULL, NULL),
	(6, 3, 2, '6', '6', '6', '<p>Dalam acara tersebut Kapolres Metro Jakarta Selatan Kombes Bastoni Purnama memberikan sambutan kepada seluruh tamu undangan yang hadir terkhusus memberikan bimbingan dan arahan kepada mahasiswa yang hadir mewakili kampus se-Jakarta Selatan., “Teman-tem', NULL, 'b2.jpg', '2020-11-15', NULL, 0, NULL, 0, NULL, NULL, NULL, 1, NULL, 0, '2019-11-15 17:39:06', 1, NULL, NULL);
/*!40000 ALTER TABLE `ref_news` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_news_category
CREATE TABLE IF NOT EXISTS `ref_news_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID News Category',
  `id_parent_category` int(11) DEFAULT NULL COMMENT 'ID Category',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT 'Nama News Category',
  `img` varchar(60) DEFAULT NULL COMMENT 'Gambar',
  `uri_path` varchar(50) DEFAULT '' COMMENT 'Uri Path',
  `id_ref_language` smallint(3) DEFAULT '1' COMMENT 'ID Bahasa',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  PRIMARY KEY (`id`),
  KEY `id_parent_category` (`id_parent_category`),
  KEY `id_language` (`id_ref_language`),
  KEY `user_id_create` (`id_ref_auth_user_create`),
  KEY `user_id_modify` (`id_ref_auth_user_modify`),
  CONSTRAINT `ref_news_category_ufbk1` FOREIGN KEY (`id_parent_category`) REFERENCES `ref_news_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table cms_deptech.ref_news_category: ~3 rows (approximately)
/*!40000 ALTER TABLE `ref_news_category` DISABLE KEYS */;
INSERT INTO `ref_news_category` (`id`, `id_parent_category`, `name`, `img`, `uri_path`, `id_ref_language`, `id_ref_delete`, `create_date`, `id_ref_auth_user_create`, `modify_date`, `id_ref_auth_user_modify`) VALUES
	(1, NULL, 'Kegiatan Akademik', NULL, 'kegiatan-akademik', 1, 0, '0000-00-00 00:00:00', 0, NULL, NULL),
	(2, NULL, 'Kegiatan Kemahasiswaan', NULL, 'kegiatan-kemahasiswaan', 1, 0, '0000-00-00 00:00:00', 0, NULL, NULL),
	(3, NULL, 'Berita', NULL, 'berita', 1, 0, '0000-00-00 00:00:00', 0, NULL, NULL),
	(4, NULL, 'Pengumuman', NULL, 'pengumuman', 1, 0, '0000-00-00 00:00:00', 0, NULL, NULL);
/*!40000 ALTER TABLE `ref_news_category` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_news_image
CREATE TABLE IF NOT EXISTS `ref_news_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID News',
  `id_ref_news` int(11) NOT NULL COMMENT 'ID News Category',
  `img` text COMMENT 'Gambar',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table cms_deptech.ref_news_image: ~0 rows (approximately)
/*!40000 ALTER TABLE `ref_news_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_news_image` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_province
CREATE TABLE IF NOT EXISTS `ref_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Provinsi',
  `code_prov` varchar(90) NOT NULL COMMENT 'Kode provinsi saat pencatatan',
  `code_province` varchar(90) NOT NULL COMMENT 'Kode provinsi saat pencatatan',
  `id_path_maps` varchar(255) DEFAULT NULL COMMENT 'Path Maps',
  `point_path_maps` longtext COMMENT 'Point Path Maps',
  `name` varchar(90) NOT NULL COMMENT 'Nama Provinsi',
  `uri_path` varchar(255) DEFAULT NULL COMMENT 'Uri Path',
  `id_ref_delete` int(2) NOT NULL DEFAULT '0' COMMENT 'Status Data',
  `id_ref_status_publish` int(2) NOT NULL DEFAULT '0' COMMENT 'Status Publish',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `create_date` datetime DEFAULT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `modify_date` datetime NOT NULL COMMENT 'Tanggal Perubahan',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 COMMENT='Table untuk mengolah referensi provinsi';

-- Dumping data for table cms_deptech.ref_province: ~35 rows (approximately)
/*!40000 ALTER TABLE `ref_province` DISABLE KEYS */;
INSERT INTO `ref_province` (`id`, `code_prov`, `code_province`, `id_path_maps`, `point_path_maps`, `name`, `uri_path`, `id_ref_delete`, `id_ref_status_publish`, `id_ref_auth_user_create`, `create_date`, `id_ref_auth_user_modify`, `modify_date`) VALUES
	(1, '11', '1100000000', 'ID-AC', 'M36.45,91.68l-0.17,0.1l-1.97,-2.44l-1.58,-0.55l-0.13,-0.31l3.05,-0.07l1.03,2.06L36.45,91.68zM8.9,30.57l2.59,1.42l0.36,1.11l2.8,2.4l4.79,1.32l4.04,0.27l1.91,-0.35l2.23,-0.88l1.26,0.48L30.4,36l2.53,0.66l0.7,1.19l0.62,0.21l5.38,-1.7l4.12,4.66l1.56,1.32l1.21,0.28l0.89,1.77l0.15,1.52l0.85,1.56l-0.09,0.93l0.82,-0.1l0.97,0.36l2.7,1.88l0.14,1.33l-0.36,0.86l0,0l-1.2,-0.01l-0.77,0.21l-0.33,0.44l-0.95,0.03l0.18,1.12l-0.41,0.24l0.15,0.47l-0.47,0.68l-0.41,2.59l-1.21,0.65l-0.09,0.65l-0.74,-0.35l0.21,1.41l-1.92,1.8l1.06,1.83l-0.03,0.74l0.74,0.35l0.21,0.88l0.56,0.41l-0.33,0.53l0.3,1l0.65,0.44l0.27,-0.12l0.38,0.71l-0.24,0.79l-2.37,0.65l1.18,0.79l0.06,0.74l0.62,0.65l-0.09,0.97l-0.8,0.06l0.44,2.74l0.92,0.24l0.59,1.06l0.95,0.12l0.21,0.56l-0.38,0.88l0.68,1.41l-0.62,0.21l-0.24,1.41l0.18,1l0.41,0.56l-0.06,0.71l0.83,0.35l0.53,1.62l-0.61,2.79l0,0l-3.51,-1.98l-1.33,0.46l-2.1,-0.53l-1.65,-2.3l-0.1,-4l-0.9,-3.95l-2.57,-0.84l-1.15,-0.86l-1.24,-1.73l-0.46,-1.96l-0.47,-0.77l-1.53,-0.52l-2.82,-4.85l-1.87,-1.3l-0.3,-1.13l-1.6,-1.12l-2.64,-0.15l-1.33,0.22l-1.2,-0.44l-1.68,-1.64l-1.86,-2.77l-1.7,-1.81l-3.05,-1.69l-3.13,-3.4l-5.14,-4.52l-1.87,-2.83l-2.41,-4.69l0.28,-0.97l-1.17,-1.87l0.4,-2.12L0,32.4l0.17,-1.57l0.86,0.01l2.58,-1.47l2.87,0.44L8.9,30.57z', 'Aceh', 'aceh', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(2, '12', '1200000000', 'ID-SU', 'M55.34,130.93l0.42,0.04l0.71,0.82l0.55,1.42l-0.33,0.36l0.15,1.48l-0.46,0.42l0.31,0.97l-0.59,0.17l0.13,-0.76l-0.84,0.17l-0.08,0.97l-0.9,-0.82L53,135.7l0.59,-0.25l0.38,0.21l0.21,-0.84l0.33,-0.23l0.15,-1.99l0.86,-0.55l0.17,-0.42L55.34,130.93zM54.8,126.68l0.1,0.23l0.32,-0.23v0.49l1.11,1.29l0.21,1.79l1.4,1.27l-0.08,0.91l-0.44,0.25l0.15,0.8l-0.5,-1.18l-2.64,-3.68l-0.32,-1.1l-0.96,-0.47l0.99,-0.46L54.8,126.68zM58.71,123.68l1.53,-0.03l0.29,0.32l1.26,-0.25l1.04,0.99l-0.04,0.56l-1.22,-0.23l-0.53,0.42h-1.67l-2.12,-0.55l-0.11,-0.67l0.79,-0.54L58.71,123.68zM39.79,102.22l2.79,4.11l1.77,0.62l2.11,1.87l0.46,1.18l-0.7,1.61l-0.16,4.02l-1.31,1.6l-1.93,-0.49l-1.51,-4.1l-2.06,-2.14l-1.42,-0.26l-2.77,-5.22l-2.35,-2.29l0.75,-0.31l1.63,-0.07l1.39,-1.24l1.11,-0.23l1.49,0.54L39.79,102.22zM56.65,98.17l0.68,0.12l0.3,-0.51l0.82,0.94l-1.96,0.03l-0.71,-0.26l-0.19,-0.49l0.48,-0.63l0.59,0.25V98.17zM20.9,86.43l-2.04,-0.35l-0.3,-1l-4.1,-2.69l-4.16,-1.31l-2.02,-1.93l-0.09,-0.89l1.62,-2.03l1.61,0.31l1.96,2.43l1.81,0.44l1.95,2.1l2.31,1.59l1.46,0.6l0.91,2.27L20.9,86.43zM50.64,89.71l0.61,-2.79l-0.53,-1.62l-0.83,-0.35l0.06,-0.71l-0.41,-0.56l-0.18,-1l0.24,-1.41l0.62,-0.21l-0.68,-1.41l0.38,-0.88l-0.21,-0.56l-0.95,-0.12l-0.59,-1.06l-0.92,-0.24l-0.44,-2.74l0.8,-0.06l0.09,-0.97l-0.62,-0.65l-0.06,-0.74l-1.18,-0.79l2.37,-0.65l0.24,-0.79l-0.38,-0.71l-0.27,0.12l-0.65,-0.44l-0.3,-1l0.33,-0.53l-0.56,-0.41l-0.21,-0.88l-0.74,-0.35l0.03,-0.74l-1.06,-1.83l1.92,-1.8l-0.21,-1.41l0.74,0.35l0.09,-0.65l1.21,-0.65l0.41,-2.59l0.47,-0.68l-0.15,-0.47l0.41,-0.24l-0.18,-1.12l0.95,-0.03l0.33,-0.44l0.77,-0.21l1.2,0.01l0,0l0.1,2.71l0.77,1.04l1.19,-0.04l2.61,1.3l0.82,1.3l1.74,0.44l0.35,0.59l0.13,1.36l2.14,1.41l2.23,0.73l1.77,0.98l3.96,2.5l1.18,1.06l1.21,0.47l0.92,0.65l1.08,1.63l3.74,1.76l3.74,3.46l0.23,2.53l-0.71,1.39l0.04,0.44l1.14,1.28l-0.27,0.26l0.51,-0.15l-0.31,-0.75l0.24,-0.46l-0.94,-0.5l0.94,-0.63l0.4,0.07l0.71,0.77l-0.07,1.39l0.73,1.7l-0.27,-2.39l0.89,-0.88l0.62,0.02l1.91,2.7l0.22,0.56l-0.4,1.27l0.12,2l0.87,2.51l-1.22,6.35l0.28,0.31l1.89,0.35l0.24,0.78l-0.35,0.71l0.59,0.12l0.12,1.02l-0.51,1.18l0.04,1.1l-0.83,0.71h-0.79l-0.32,0.55h-1.06v0.35l-3,0.16l-0.39,0.27l1.02,1.53l0.2,1.59l0.95,1.25l-1.18,0.39l-0.04,0.43l0.39,0.16l0.35,1.02l-0.39,0.9l-0.75,0.04v0.23l0.43,0.47l0.43,-0.04v1.14l-0.28,0.2l1.06,1.17l-3.71,-1.53l-0.32,-0.71l-0.67,0.12l-0.67,-0.39l-0.59,0.35l0.08,2.08l-0.28,0.63l0.28,0.78l1.26,0.24l0.08,1.17l0.67,0.51v0.67l-0.67,0.82l-1.22,0.43l-1.54,-0.31l-0.83,0.43l-0.63,-0.47l-0.59,-1.06l-1.46,0.51l-1.06,-0.43l-1.7,0.9l-1.5,2.39l-1.54,0.43l-0.93,1.39L68,122.48l-0.26,-0.21l0.32,-0.15l0,-0.87l-0.79,-0.48l0.42,-1.16l-0.58,-2.95l-4.58,-12.48l-1.33,-3.04l-0.83,-1.06l0.2,-0.32l0.45,0.48l0.38,-0.08l0.85,-1.33L62.28,98l-1.69,-1.97l-0.49,0.31l0.5,0.15l0.21,0.68l-1.15,-0.44l-2.59,-3.27L50.64,89.71z', 'Sumatera Utara', 'sumatera-utara', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(3, '13', '1300000000', 'ID-SB', 'M90.64,179.48l0.17,1.33l-1.47,0.37l1.37,2.66l-0.37,0.5l-0.6,-0.83l-0.63,-0.3l0.2,-0.17l-0.2,-0.33l-0.77,-0.27l0.03,-1.76l-0.6,-0.8l-0.6,0.07l-1.33,-2.02l0.27,-0.83l-0.4,-2.22l1.03,-0.37l1.37,1.73l0.9,0.53l1.7,1.89L90.64,179.48zM85.14,175.06l-0.03,0.4l-1.07,0.17l-0.53,-0.46l-0.4,0.63l-0.43,-0.37l0.13,-0.33l-0.37,-0.4l0.3,-1.89l-0.33,-1.36l-0.47,-0.3l0.4,-1.46l0.5,0.1l0.73,1.03l2.04,1.36l0.83,1.46l-0.17,0.76L85.14,175.06zM77.66,163.67l1.23,2.26l0.6,0.33l0.43,0.7l0.33,0.73l-0.17,0.36l-0.37,-0.73l-0.6,0.2l-0.23,-0.5h-0.8l-0.97,-0.83l-1.37,-0.1l-1.27,-2.19l0.27,-0.4l0.47,0.1l-0.3,-0.4l0.03,-1.26l0.53,-0.43h0.6l1.33,1.13L77.66,163.67zM64.16,143.1l0.33,0.99l-0.53,-0.33l0.4,1.29l1,0.8l0.1,0.76l1.1,1.86l-0.13,0.3l0.57,0.66l0.03,0.63l1.17,1.33l0.1,0.7l-0.6,-0.2l0.4,0.53l0.73,0.27l0.4,1.69l0.67,-0.23l0.47,0.66l0.1,1.46l-0.33,0.5l-0.73,-1.13l0.47,1.56l-0.43,0.4l-1.13,-0.33l-1.07,0.53l-4.1,-2.22l-0.8,-1.09l0.2,-0.33l-0.63,-1.23l-3.47,-5.14l-0.1,-0.43l1.17,-2.55l-0.03,-1.06l0.63,-0.66h1.97l1.47,-0.8L64.16,143.1zM80.68,111.16l0.39,0.35l0.67,-0.12l0.32,0.71l1.58,0.82l2.13,0.71l-0.2,-0.15l0,0l1.06,0.43l0.47,0.73l-0.83,1.29l-0.09,0.94l1.27,2.64l0.15,1.59l1.18,-0.47l0.38,0.15l0.38,0.26l0.77,1.73l2.84,0.79l1.09,0.03l1.33,-1.32l0.65,-0.23l0.53,0.32l0.38,1l-0.27,1.33l0.38,0.94l-0.09,0.85l-0.59,1.03l-0.53,-0.44l-0.5,0.73l0.65,3l0.86,0.79l0.27,0.94l1.03,0.47l0.21,-0.73l1.24,-0.21l0.8,0.59l-0.21,1.06l0.71,1.53l2.01,0.97l0.12,0.41l1.09,0.82l1.71,0.61l-0.09,0.41l0.92,0.41l0.09,0.56l1.69,1.23l1.57,0.71l1.01,1.06l-0.03,0.29l1.77,0.68h0.89l0,0l0.24,0.15l0,0l0.06,1.88l0.53,0.44l0.47,-0.18l-1.12,1.88l-1.57,0.35l-0.62,0.62l0.41,1.62l-0.41,0.68l0.41,0.59l-0.62,1.11l-2.01,1.23l-1.18,1.79l-1,0.26l-0.38,-0.35l-1.18,0.15l-1.6,0.24l-0.56,0.35l-0.68,-0.71l-0.33,0.38l-0.68,-0.32l0.21,3.64l0.77,1.41l1.06,0.73l0.38,0.73l0.74,3.32l0,0l-0.24,0.53l0,0l-0.8,0.97l-3.86,2.55l0,0l-2.28,-2.75l-0.4,-1.59l-0.84,-1.17l0.04,-0.46l1.04,-1.26l0.01,-1.18l-0.45,-1.67l-3.43,-4.62l-0.9,-2.38l-0.76,-0.78l0.41,-1.16l-0.43,-0.98l-1.15,-0.37l-0.8,-0.75l-0.4,0.29l-0.38,-0.11l0.13,-0.62l0.44,0.07l-1.22,-1.62l-0.02,-0.29l0.33,-0.02l-0.33,-0.73l0.3,-0.67l-1.09,-3.49l-3.27,-3.43l-1.38,-2.28l-2.3,-1.89l-0.49,-0.94l-1.13,-0.68l-0.38,-1.37l-0.91,-1.31l0.26,-1.34l-0.58,-0.87l-2.83,-1.96l-2.97,-1.1l-0.78,-1.27l-0.8,-0.1L69.42,123l-1.18,-0.42l0.93,-1.39l1.54,-0.43l1.5,-2.39l1.7,-0.9l1.06,0.43l1.46,-0.51l0.59,1.06l0.63,0.47l0.83,-0.43l1.54,0.31l1.22,-0.43l0.67,-0.82v-0.67l-0.67,-0.51l-0.08,-1.17l-1.26,-0.24l-0.28,-0.78l0.28,-0.63l-0.08,-2.08L80.68,111.16z', 'Sumatera Barat', 'sumatera-barat', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(4, '14', '1400000000', 'ID-RI', 'M137.72,117.95l-0.59,-0.17l-0.31,-0.8l0.47,-1.73l1.04,-0.66l1.19,1.23l0.13,1.39l-0.4,0.36L137.72,117.95zM128.02,109.59l2.36,-0.28l2.84,1.65l2.03,1.69l0.18,0.77l-0.25,1.05l-0.55,0.3l-1.23,-1.23l-1.06,-0.49l-3.49,-0.1l-2.22,0.42l-1.1,-0.55l-1.28,-1.23l0.53,-0.8l1.05,-0.28l0,-0.74l-0.52,-1.13l0.34,-1.4l1.18,0.16l1.04,1.34l-0.17,0.47L128.02,109.59zM135.16,108.84l2.22,2.51l0.06,0.52l-0.35,0.39l-1.1,0.05l-2.44,-1.71l-3.16,-1.62l-1.19,0.11l-0.6,-0.53l0.95,-1.65l1.22,-0.2l3,1.15L135.16,108.84zM124.1,110.78l-0.42,0l-1.53,-1.44l-0.79,-1.16l-0.65,-3.48l0.16,-2.14l1.35,-0.04l3.24,3.11l-0.54,2.04l0.35,2.47L124.1,110.78zM125.79,101.8l0.17,2.88l-0.24,0.35l-3.17,-2.76l-3.6,-0.78l-0.96,-0.93l-0.88,-1.49l1.07,-0.26l1.85,0.75l4.7,0.87l0.75,0.43L125.79,101.8zM110.33,97.3l-1.9,-0.35l-0.77,-0.71l-0.93,-2.49l0.08,-1.32l0.19,-0.69l0.55,-0.52l3.47,-0.99l1,0.48l1.26,1.7l0.05,0.89l-0.76,0.97l-0.22,1.82l-1.28,0.99L110.33,97.3zM93.41,90.23l0.82,-0.13l1.71,0.74l0.51,-0.39l-1.14,-0.71l-0.32,-0.63l0.12,-1.18l0.95,-0.55l2.4,-0.27l2.46,0.31l-0.12,0.51l0.35,0.77l3.45,2.31l0.74,0.79l0.28,2.15l1.4,3.2l2.34,1.09l2.47,-0.36l1.21,0.33l4.51,3.78l2.02,1.07l1.09,3.06l-0.19,1.73l0.4,1.37l3.72,3.74l2.07,1.13l5.54,0.01l1.16,0.63l2.56,3.08l0.02,1.2l-8.84,4.63l-1.43,-1.18l-1,0.01l1.9,1.34l0.82,0.24l1.24,-1.12l4.24,-0.78l4.47,-2.52l0.99,-1.34l2.26,-0.84l1.72,0.63l5,3.76l1.24,4.89l-3.61,0.41l-0.39,1.3l-2.66,1.83l0.49,0.22l0.68,-0.57l1.26,-0.1l-0.32,0.63l1.63,0.21l1.68,0.73l0.89,1.31l-1.52,0.05l-1.68,0.73l-0.35,1.13l-2.63,1.75l-0.38,2.14l1.1,1.4l0,0l-1.18,0.12l-0.84,0.47l-0.39,-0.31l-3.61,-0.62l-2.02,0.14l-1.71,2.32l-2.1,1.5l-1.1,1.66l-0.69,0.08l-0.81,0.66l-0.61,-0.43l-2.24,-0.25l-0.47,-0.76l-1.22,-0.12l0.04,-0.64l-1,-0.51l-0.29,-0.76l-1.82,0.57l-0.61,-0.8l-0.77,0.29l-2.18,-0.68l-0.59,0.62l-0.24,-0.21l-0.59,0.29l-0.18,0.62l-0.81,0.18l-0.04,0.31l-0.6,-0.1l0,0l-0.21,-0.13l0,0h-0.89l-1.77,-0.68l0.03,-0.29l-1.01,-1.06l-1.57,-0.71l-1.69,-1.23l-0.09,-0.56l-0.92,-0.41l0.09,-0.41l-1.71,-0.61l-1.09,-0.82l-0.12,-0.41l-2.01,-0.97l-0.71,-1.53l0.21,-1.06l-0.8,-0.59l-1.24,0.21L98.38,133l-1.03,-0.47l-0.27,-0.94l-0.86,-0.79l-0.65,-3l0.5,-0.73l0.53,0.44l0.59,-1.03l0.09,-0.85l-0.38,-0.94l0.27,-1.33l-0.38,-1l-0.53,-0.32l-0.65,0.23l-1.33,1.32l-1.09,-0.03l-2.84,-0.79l-0.77,-1.73l-0.38,-0.26l-0.38,-0.15l-1.18,0.47l-0.15,-1.59l-1.27,-2.64l0.09,-0.94l0.83,-1.29l-0.47,-0.73l-1.06,-0.43l0,0l-0.87,-1.02l0.28,-0.2v-1.14l-0.43,0.04l-0.43,-0.71l0.75,-0.04l0.39,-0.9l-0.35,-1.02l-0.39,-0.16l0.04,-0.43l1.18,-0.39l-0.95,-1.25l-0.2,-1.59l-1.02,-1.53l0.39,-0.27l3,-0.16v-0.35h1.06l0.32,-0.55h0.79l0.83,-0.71l-0.04,-1.1l0.51,-1.18l-0.12,-1.02l-0.59,-0.12L90.06,97l-0.24,-0.78l-1.89,-0.35l-0.28,-0.31l1.22,-6.35l-0.87,-2.51l-0.16,-1.33l0.39,-1.92l1.39,3.69l1.34,1.39L93.41,90.23z', 'Riau', 'riau', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(5, '15', '1500000000', 'ID-JA', 'M160.35,155.27L159.07,154.75L158.53,154.86L158.05,155.29L158.15,156.04L157.83,156.47L155.84,156.63L153.57,157.38L152.49,157.11L151.24,157.29L149.78,156.69L149.06,157.05L148.77,157.57L147.11,157.65L144.93,158.46L143.84,159.42L143.52,163.04L144.08,163.52L142.3,164.28L142.34,167.22L140.28,165.69L139.47,164.69L139.39,163.92L138.58,163.48L137.37,165.17L138.06,165.85L138.22,166.58L136.68,167.18L135.27,166.54L134.98,167.06L132.36,166.46L131.79,167.3L132.4,168.3L130.86,170.44L130.41,170.8L129.85,170.68L128.15,171.76L127.34,172.93L126.86,172.73L125.85,173.25L125,173.09L124.31,172.93L123.22,172.08L122.73,172.28L121.88,171.76L121.32,172L121.24,172.73L120.83,173.17L119.21,173.65L118.81,174.38L118.81,174.38L118.24,174.21L118.24,174.21L116.93,173.57L115.59,173.73L114.9,173.53L113.49,172.45L111.59,170.19L110.54,170.6L109.81,170.48L109.53,170.96L109.69,168.87L104.98,165.91L104.98,165.91L105.21,165.4L105.21,165.4L104.47,162.08L104.08,161.34L103.02,160.61L102.25,159.2L102.04,155.55L102.72,155.88L103.05,155.49L103.73,156.2L104.29,155.85L105.89,155.61L107.07,155.46L107.45,155.82L108.46,155.55L109.64,153.76L111.65,152.53L112.27,151.41L111.86,150.83L112.27,150.15L111.86,148.53L112.48,147.92L114.05,147.56L115.17,145.68L114.7,145.86L114.17,145.42L114.11,143.54L114.11,143.54L114.08,143.52L114.08,143.52L114.68,143.62L114.72,143.31L115.52,143.13L115.7,142.51L116.29,142.22L116.53,142.43L117.11,141.81L119.3,142.49L120.06,142.2L120.67,143L122.49,142.43L122.79,143.19L123.79,143.7L123.75,144.34L124.97,144.46L125.44,145.22L127.68,145.48L128.29,145.9L129.09,145.24L129.78,145.16L130.88,143.5L132.98,142L134.69,139.68L136.72,139.54L140.33,140.17L140.72,140.48L141.57,140.01L142.75,139.9L142.75,139.9L143.96,140.69L145.75,142.52L149.01,144.09L151.04,143.57L155.6,145.06L158.21,144.38L158.96,146.12L158.65,147.56L159.61,149.55L159.43,152.56z', 'Jambi', 'jambi', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(6, '16', '1600000000', 'ID-SS', 'M147.97,209.18L147.69,208.25L146.31,208.03L146.7,207.54L146.22,206.24L145.58,205.74L144.8,205.7L145.51,205.08L144.42,204.04L145.25,202.98L144.93,201.76L144.37,201.58L143.39,201.94L142.5,201.03L140.8,200.9L139.58,199.9L137.67,199.59L137.66,197.96L136.7,195.92L136.01,195.63L133.81,195.71L132.94,194.92L132.33,195.21L131.57,195.01L129.15,193.03L128.58,192.23L127.91,192.03L129.94,191.02L130.06,189.88L131.18,188.81L131.25,187.36L131.94,187.62L132.83,188.82L133.72,188.13L134.4,187.18L134.69,185.07L134.48,184.62L133.69,184.53L132.87,184.85L132.75,183.98L132.19,184.23L131.36,184.09L130.79,183.17L128.24,184.32L127.36,183.97L125.69,182.45L125.89,181.95L125.66,181.8L125.77,180.58L125.48,179.84L124.85,179.26L123.88,179.04L122.73,179.44L121.64,178.86L120.94,177.03L119.49,176.07L119.35,175.36L118.5,174.82L118.29,174.23L118.29,174.23L118.81,174.38L118.81,174.38L119.21,173.65L120.83,173.17L121.24,172.73L121.32,172L121.88,171.76L122.73,172.28L123.22,172.08L124.31,172.93L125,173.09L125.85,173.25L126.86,172.73L127.34,172.93L128.15,171.76L129.85,170.68L130.41,170.8L130.86,170.44L132.4,168.3L131.79,167.3L132.36,166.46L134.98,167.06L135.27,166.54L136.68,167.18L138.22,166.58L138.06,165.85L137.37,165.17L138.58,163.48L139.39,163.92L139.47,164.69L140.28,165.69L142.34,167.22L142.3,164.28L144.08,163.52L143.52,163.04L143.84,159.42L144.93,158.46L147.11,157.65L148.77,157.57L149.06,157.05L149.78,156.69L151.24,157.29L152.49,157.11L153.57,157.38L155.84,156.63L157.83,156.47L158.15,156.04L158.05,155.29L158.53,154.86L159.07,154.75L160.35,155.27L160.35,155.27L160.99,156.26L161.15,157.16L160.18,158.79L160.41,159.93L161.13,158.65L161.54,158.72L164.88,161.07L166.25,161.13L167.2,162.27L167.46,164.31L166.41,165.41L166.09,165.35L165.5,165.83L164.38,167.62L165.26,167.77L166.56,166.15L167.61,165.92L168.05,166.72L169.18,166.78L171.2,167.55L172.68,166.72L175.09,167.56L179.78,167.88L180.06,168.48L179.6,170.21L179.87,171.64L180.76,172.66L182.6,172.99L182.81,173.61L182.62,175.61L183.25,176.9L183.96,177.52L186.02,177.47L187.26,178.21L187.28,180.43L188.06,182.4L186.05,183.7L184.94,184.86L183.42,188.49L183.27,189.62L183.51,190.52L185.26,191.72L185.67,192.69L185.46,193.54L183.95,196.22L183.73,197.87L183.45,198.23L183.45,198.23L182.64,197.41L182.08,197.87L181.32,197.79L180.95,196.85L180.3,196.85L180.52,196.26L179.58,196.39L180.03,195.56L179.28,194.62L179.66,194.62L179.55,194.3L178.88,194.22L178.93,193.77L178.58,193.5L178.58,193.5L178.04,193.5L178.04,193.5L178.18,192.69L176.62,192.48L176.51,191.76L176.19,191.68L175.32,192.02L174.81,190.82L173.95,192.16L174.22,192.77L174.01,193.26L173.31,193.9L172.63,193.66L172.09,193.93L171.99,194.44L171.61,194.38L171.34,195.45L170.91,195.88L171.21,196.23L170.53,196.61L170.21,197.57L169.22,198.51L167.98,198.72L166.85,199.29L166.77,199.63L165.29,199.88L163.08,199.77L162.46,199.21L159.96,200.76L159.34,200.71L158.03,201.86L157.41,203.15L157.71,205.85L157.06,206.5L156.79,207.27L157.33,207.6L157.39,208.43L158.17,209.39L157.41,210.68L155.5,210.33L153.99,211.32L152.81,210.76L151.17,211.14L150.66,210.76L150.2,212L149.1,211.27L149.53,210.65L149.53,210.12L149.15,209.63L148.72,209.61L148.67,209.1L148.02,209.15L148.02,209.15z', 'Sumatera Selatan', 'sumatera-selatan', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(7, '17', '1700000000', 'ID-BE', 'M118.29,174.23L118.5,174.82L119.35,175.36L119.49,176.07L120.94,177.03L121.64,178.86L122.73,179.44L123.88,179.04L124.85,179.26L125.48,179.84L125.77,180.58L125.66,181.8L125.89,181.95L125.69,182.45L127.36,183.97L128.24,184.32L130.79,183.17L131.36,184.09L132.19,184.23L132.75,183.98L132.87,184.85L133.69,184.53L134.48,184.62L134.69,185.07L134.4,187.18L133.72,188.13L132.83,188.82L131.94,187.62L131.25,187.36L131.18,188.81L130.06,189.88L129.94,191.02L127.91,192.03L128.58,192.23L129.15,193.03L131.57,195.01L132.33,195.21L132.94,194.92L133.81,195.71L136.01,195.63L136.7,195.92L137.66,197.96L137.67,199.59L139.58,199.9L140.8,200.9L142.5,201.03L143.39,201.94L144.37,201.58L144.93,201.76L145.25,202.98L144.42,204.04L145.51,205.08L144.8,205.7L145.58,205.74L146.22,206.24L146.7,207.54L146.31,208.03L147.69,208.25L147.97,209.18L147.97,209.18L147.89,209.23L147.89,209.23L146.97,209.29L146.84,209.8L145.01,210.87L144.83,211.4L144.83,211.4L144.03,211.3L143.03,210.5L141.57,210.37L141.72,209.97L141.46,209.58L140.95,209.2L140.35,209.47L139.95,209.16L140.14,208.64L138.55,206.9L135.41,204.82L132.77,203.85L132.23,202.78L131.1,201.72L122.21,195.02L122.06,193.74L122.52,193.36L121.65,191.63L121.39,190.02L119.17,188.22L115.91,186.51L115.97,186.19L110.39,182.16L108.92,180.28L108.23,178.54L106.7,176.54L105.5,173.64L102.29,171.84L100.31,169.45L100.31,169.45L104.17,166.9L104.97,165.93L104.97,165.93L104.98,165.91L104.98,165.91L109.69,168.87L109.53,170.96L109.81,170.48L110.54,170.6L111.59,170.19L113.49,172.45L114.9,173.53L115.59,173.73L116.93,173.57L118.24,174.21L118.24,174.21z', 'Bengkulu', 'bengkulu', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(8, '18', '1800000000', 'ID-LA', 'M148.02,209.15l0.65,-0.05l0.05,0.51l0.43,0.03l0.38,0.48v0.54l-0.43,0.62l1.1,0.72l0.46,-1.23l0.51,0.38l1.64,-0.38l1.18,0.56l1.51,-0.99l1.91,0.35l0.75,-1.29l-0.78,-0.97l-0.05,-0.83l-0.54,-0.32l0.27,-0.78l0.65,-0.64l-0.3,-2.71l0.62,-1.29l1.31,-1.15l0.62,0.05l2.5,-1.55l0.62,0.56l2.21,0.11l1.48,-0.24l0.08,-0.35l1.13,-0.56l1.24,-0.21l1,-0.94l0.32,-0.96l0.67,-0.38l-0.3,-0.35l0.43,-0.43l0.27,-1.07l0.38,0.05l0.11,-0.51l0.54,-0.27l0.67,0.24l0.7,-0.64l0.22,-0.48l-0.27,-0.62l0.86,-1.34l0.51,1.21l0.86,-0.35l0.32,0.08l0.11,0.72l1.56,0.21l-0.13,0.8l0,0h0.54l0,0l0.35,0.27l-0.05,0.46l0.67,0.08l0.11,0.32h-0.38l0.75,0.94l-0.46,0.83l0.94,-0.13l-0.22,0.59h0.65l0.38,0.94l0.75,0.08l0.57,-0.46l0.8,0.82l0,0l-0.19,2.7l1.5,2.74v1.25l-0.34,0.83l0.51,0.84l-0.6,1.22l-0.36,1.87l0.78,1.86l-0.53,0.48l-0.27,1.24l0.15,3.61l-0.78,1.39l-0.08,3.78l0.21,0.73l-0.58,2.13l0.07,1.18l-0.36,1.05l-1.06,1.23l-0.16,-0.97l-2.02,-0.49l-0.09,-1.59l-0.58,-0.55l-0.53,0l-1.58,-1.01l-0.83,-0.78l-1.42,-2.43l-0.33,-0.07l-0.51,0.46l-0.13,2.04l-0.73,-0.25l-0.6,0.41l0.4,0.81l0.32,-0.01l-0.48,0.34l0.65,0.88l-0.73,0.12l-0.37,0.4l0.26,0.46l0.75,-0.08l-0.51,0.53l-0.57,0.1l-3.35,-1.62l-3.02,-1.91l-1.53,-1.53l-1.6,-0.29l-0.86,0.4l-0.46,0.4l2.21,2.83l-0.18,0.46l1.18,1.77l0.33,1.46l-0.09,0.2l-2.48,0.13l-0.44,-0.44l0.31,-0.16l-0.18,-0.73l-2.12,-1.93l-0.41,-0.72l-2.02,-1.17l0.33,-0.46l-0.94,-1.15l-2.96,-2.09l-1.48,-1.71l-0.12,-1.03l-1.63,-0.59l-0.04,-0.42l0.53,-0.55l-0.55,-0.95l-0.6,-0.22l-1.46,-1.37l-0.69,0.13l0.07,-0.71l-0.78,-0.66l-0.71,0.04l-1.17,-0.68l0,0l0.18,-0.53l1.83,-1.07l0.13,-0.51l0.92,-0.05l0,0L148.02,209.15z', 'Lampung', 'lampung', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(9, '19', '1900000000', 'ID-BB', 'M201.84,178.68l-1.21,0.01l-1.69,-0.97l0.32,-0.77l1.15,-0.51l1.7,0.73L201.84,178.68zM218.12,170.27l4.36,1.21l3.09,2.51l0.52,1.76l-1.52,2.63l-0.13,1.93l-1.62,0.74l-0.46,1.13l-1.6,0.37l-0.28,-1.44l-1.72,-1.95l-0.83,0.61l0.34,0.42l-0.07,0.76l-0.39,0.26l-2.95,0.95l-0.56,-0.24l-0.57,-3.51l0.56,-1.65l0.06,-2.3l0.36,-0.43l0.24,-2.89l0.28,-0.37l1.79,-0.04L218.12,170.27zM187.99,157.15l1.31,2.73l0.37,3.73l0.92,2.81l1.29,2.08l1.23,0.9l3.98,0.73l2.86,1.12l-1.73,1.59l-1.39,4.1l0.13,0.44l0.78,0.46l1.51,0.48l0,1.23l-0.41,0.43l-3.43,0.07l-1.3,-2.08l-2.82,-1.27l-5.34,-1.6l-0.93,-1.55l-0.31,-1.34l0.65,-2.09l-0.08,-0.89l-1.36,-0.72l-0.59,-0.74l-0.36,-3.52l-0.93,-0.89l-4.62,-0.52l-2.38,0.44l-3.55,-0.88l-0.26,-0.85l0.35,-1.31l2.49,-1.13l1.94,-1.54l-0.19,-0.93l-0.9,-0.55l0.16,-0.91l1.91,-1.53l2.1,-0.66l0.49,0.12l0.74,1.75l0.15,1.67l0.92,0.74l1.73,0.24l-1.74,-4.21l3.08,-0.98l0.41,0.09l2.3,1.78l-0.27,0.83l0.14,0.57L187.99,157.15z', 'Kepulauan Bangka Belitung', 'kepulauan-bangka-belitung', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(10, '21', '2100000000', 'ID-KR', 'M160.19,132.56l0.89,0.49l1.06,1.93l-1.03,0.83l-0.54,1.88h-0.54l-0.86,-0.88l-0.49,0.2l-0.15,1.27l-0.49,0.2l-0.71,-2.52l-1.18,-0.9l0.44,-1.52l0.74,-0.22l0.07,-0.78l0.22,0.76l-0.44,0.42l0.42,0.64l0.15,-0.86l0.98,0.27l0.49,-0.32l0.17,-0.78L160.19,132.56zM165.45,130.19h0.52l-0.02,-0.9l0.25,-0.2l1.18,1.59l0.94,0.76l0.76,0.07l0.07,0.44l-1.45,-0.44l-0.29,0.27l0.44,0.51l-0.12,0.24l-0.91,-0.46l-0.39,0.12l-2.49,-1.93l-0.89,0.15l-0.89,0.61l-0.54,-0.1l-0.66,0.51l-0.52,-0.59l-0.71,0.15l-0.54,-0.46l0.02,-0.64l1.38,-0.95l-0.17,-2.27l0.81,-0.37l1.67,1.08l1.65,1.81l0.22,0.71L165.45,130.19zM158.53,124.18l0.17,0.22l0.07,-0.44l0.52,0.05l1.92,2.05l-0.98,0.42l-0.49,-0.29l-1.28,-1.42l-0.91,-1.56L158.53,124.18zM160.94,122.64l1.75,2.15l1.33,1.1l-0.07,0.56l-2.21,-1.54l-1.62,-1.83l-0.02,-0.51L160.94,122.64zM158.93,121.05l0.57,0.39l-0.57,0.17l0.34,0.34l-0.86,-0.34l0.07,0.27l-0.44,0.46l-0.3,-0.07l-0.47,-0.83l-0.22,0.07l-0.07,-0.64l0.71,0.2l0.07,-0.44l-0.66,-0.54L158.93,121.05zM156.54,113.14l-0.17,0.83l0.7,0.53l-0.8,0.34l0.93,0.18l0.07,-0.32l0.39,0.29l-0.2,0.29l-0.64,-0.15l-0.12,1.03l-0.57,-0.46l-1.3,-2.2l1.45,-0.51L156.54,113.14zM150.53,113.56l-0.1,0.17l-1.53,-1.54l-0.3,-0.93l1.65,1l0.54,0.93L150.53,113.56zM149.03,113.31l-0.22,0.49l-0.17,-0.42l-1.21,-0.61l-0.47,-1.2l0.59,-0.44l1.13,1.27L149.03,113.31zM142.85,111.42l0.11,0.64l1.14,1.32l-0.2,0.35l-0.98,-0.75l0.41,0.72l-0.17,0.79l0.31,0.37l-0.39,0.97l-0.52,0.2l-0.24,-0.37l-0.72,-0.06l-0.92,-1.34l-0.18,-1.8l0.37,-1.21l0.76,0.44l-0.09,-1.12l0.55,-0.42l0.66,0.35L142.85,111.42zM153.91,110.41l0.32,0.1l0.15,-0.44l0.42,-0.05l0.32,0.39l-0.15,0.51l-0.3,0.07l0.1,0.51l0.79,0.07l0.79,0.54l-1.62,1.05l-0.37,-1.2l-0.91,-0.22l-0.02,-0.95l-0.2,-0.17l-0.34,0.32l-0.27,-0.24l0.17,-0.66l0.49,-0.1L153.91,110.41zM148.44,110.11l-0.91,-0.78l0.42,-0.66l0.49,0.49V110.11zM149.62,108.18l-0.05,0.27l0.84,0.86l1.23,0.66l0.05,0.49l-0.42,0.1l-0.17,0.73l-2.12,-1.37l0.2,-0.78l-0.64,-0.61l0.12,-0.29l0.34,0.17l0.37,-0.24v-0.49L149.62,108.18zM141.59,107.06l-0.07,0.24l-0.35,-0.11l-0.06,0.75l1.11,1.78l-0.87,-0.04l-1.4,-0.83l0.3,-1.38l0.7,-0.2l0.33,-0.57L141.59,107.06zM154.37,107.03l-0.17,1.91l-0.74,0.05l0.02,0.88l-0.84,-0.22l-0.25,0.22l-2.12,-0.93l-0.27,-1.3l0.4,-0.06l-0.08,0.55l0.37,-0.02l-0.27,-1.05l1.21,0.12l0.17,-0.81l0.37,-0.07l0.91,0.81l0.17,-0.24l-0.25,-0.51l0.57,-0.24L154.37,107.03zM161.83,106.49l0.15,0.66l0.74,0.44l0.47,1.2l-0.25,1.22l0.27,1l-0.27,0.32l0.86,0.05l-0.89,1.54l-1.53,-0.22l-1.33,-0.86l-0.94,-0.07l0.71,-0.34l-0.94,-1.22l0.22,-0.34l0.57,0.05l-0.2,-0.44l0.42,-0.51l-0.44,-0.42l-0.79,0.42l-0.15,0.71l-0.71,-0.54l-0.39,0.49l-1.18,-0.07l-0.64,-0.93l-0.12,-0.44l0.52,-0.76l1.5,-0.24l-0.27,-0.76l0.39,-0.17l0.71,0.15l0.49,-0.34l1.75,0.49l1.21,-1L161.83,106.49z', 'Kepulauan Riau', 'kepulauan-riau', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(11, '31', '3100000000', 'ID-JK', 'M199.3,231.73l1.8,0.34l0.73,-0.41l1.4,-0.09l0,0l-0.06,1.98l-0.41,0.86l-0.64,0.17l0.27,0.93l-0.21,0.95l-1.03,-0.44l-0.9,0.25l0.13,-0.83l-0.53,0.06l0,0l0,0l0,0l-0.6,-1.49l-0.39,-0.08l0.02,-0.66l-0.61,-0.33l0.03,-1.12l0.6,-0.26l0,0L199.3,231.73z', 'DKI Jakarta', 'dki-jakarta', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(12, '32', '3200000000', 'ID-JB', 'M205.41,228.89L206.6,229.77L208.8,229.27L209.71,229.53L211.81,232.53L214.48,233.28L215.34,234.22L215.76,233.88L216.47,233.99L217.78,233.2L218.4,233.22L218.52,233.64L219.13,233.31L219.08,234.07L223.19,235.75L224.61,234.66L224.19,233.94L224.83,234.28L226.17,234.25L226.8,234.7L227.02,234.14L227.63,236.08L228.97,237.58L230.33,238.39L230.76,242.01L231.41,243.16L232,243.31L232.28,242.97L232.76,243.23L232.84,243.8L234.01,244.08L234.94,243.62L234.99,243.25L234.68,243.14L234.91,242.87L235.38,242.84L235.38,242.84L235.31,244.31L234.07,245.85L234.18,247L234.83,247.37L234.52,247.96L234.5,249.01L233.56,249.32L233.08,249.9L231.82,249.66L230.84,250.14L231.1,251.49L230.63,252.3L230.72,253.12L231.11,253.34L232.28,253.25L232.79,253.73L233.45,254.8L233.42,255.7L234.06,257.01L233.69,257.97L234.87,258.95L234.87,258.95L234.19,259.38L232.93,259.02L232.46,259.33L232.61,259.95L232.12,259.22L230.15,259.39L229.75,259.78L229.67,260.9L229.22,261.22L226.91,261.46L222.44,260.69L220.9,260.17L218.4,260.06L217.67,259.21L215.68,258.84L215.35,258.11L214.13,257.24L211.59,256.14L207.71,255.7L205.7,255.17L196.23,254.51L194.01,253.51L193.46,253.7L192.98,251.49L193.55,250.58L194.43,250.39L194.29,249.5L195.23,248.91L195.86,248.06L195.79,247.15L195.28,246.64L194.05,246.49L193.27,246.98L193.27,246.98L193.19,245.6L193.84,244.91L193.92,244.2L195.26,243.24L193.79,241.79L193.88,240.06L193.32,238.82L193.43,237.86L194.3,237.44L193.86,236.04L194.53,235.4L194.86,235.5L195.07,236.15L195.61,236.11L195.4,235.64L196.42,235.91L196.72,236.27L199.63,236.25L199.81,235.64L199.81,235.64L199.85,235.49L199.85,235.49L200.37,235.44L200.25,236.27L201.15,236.02L202.18,236.46L202.39,235.51L202.13,234.58L202.76,234.41L203.17,233.55L203.23,231.56L203.23,231.56L203.78,231.25L203.53,230.84L203.95,230.56L203.57,230.09L203.99,229.17L203.53,228.92L204.13,228.51z', 'Jawa Barat', 'jawa-barat', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(13, '33', '3300000000', 'ID-JT', 'M284.95,243.04L284.41,243.41L284.3,244.23L283.64,244.32L283.4,245.67L282.7,246.35L283.68,247.02L283.55,249.2L282.21,251.18L280.58,251.87L280.23,252.76L280.69,252.76L280.52,253.31L280.82,253.46L280.73,253.73L277.04,252.11L276.58,251.55L275.47,251.86L275.36,253.6L274.9,254.56L275.47,255.91L275.63,257.35L276.27,257.77L276.06,259.54L276.89,260.23L277.85,260.18L277.75,260.75L278.33,262.05L277.22,263.68L276.24,263.5L276.16,263.21L275.35,263.56L275.19,265.1L274.74,265.8L274.19,265.49L273.35,266.1L272.08,265.77L271.39,266.69L271.26,268.42L271.26,268.42L270.07,268.13L270.07,268.13L270.11,267.63L269.73,267.65L269.97,267.04L269.43,267.41L269.2,267.23L269.25,266.48L268.68,264.87L269.23,261.49L268.94,261.32L268.7,261.59L268.01,261L267.43,261.27L267.24,260.94L265.76,261.26L265.55,260.92L264.96,261.06L264.21,260.6L263.4,256.71L261.01,258.59L260.44,259.36L260.01,258.46L257.85,258.61L257.87,260.2L256.67,261.47L256.36,262.75L255.78,262.72L255.78,262.72L250.47,261.11L246.67,260.4L245.48,260.66L245.02,260.32L245.19,259.82L243.32,259.4L239.47,259.29L238.72,259.94L238.63,260.32L239.22,260.63L239.03,260.87L234.82,260.16L234.83,259.59L234.58,259.51L235.92,258.74L234.87,258.95L234.87,258.95L233.69,257.97L234.06,257.01L233.42,255.7L233.45,254.8L232.79,253.73L232.28,253.25L231.11,253.34L230.72,253.12L230.63,252.3L231.1,251.49L230.84,250.14L231.82,249.66L233.08,249.9L233.56,249.32L234.5,249.01L234.52,247.96L234.83,247.37L234.18,247L234.07,245.85L235.31,244.31L235.38,242.84L235.38,242.84L235.38,243.34L235.92,243.84L237.55,244.31L237.79,243.91L239.13,243.49L239.47,243.1L239.61,243.99L240.27,244.61L242.82,245.07L245.61,244.68L247.33,243.46L248.29,244.48L249.77,244.65L253.52,245.86L255.8,245.88L258.13,245.11L258.61,244.59L259.37,244.83L259.87,245.65L261.07,246.24L262.08,246.55L263.21,246.3L263.33,246.53L263.94,246.3L264.63,244.45L265.6,243.2L265.05,243.16L264.9,242.93L265.3,243L265.05,242.54L265.67,242.62L266.71,241.48L266.86,239.63L267.41,239.01L267.12,238.69L268.1,237.73L271.25,236.95L273.67,237.35L274.7,240.44L275.35,241.3L277.08,241.9L279.39,242.13L280.79,241.52L280.97,241.03L281.46,240.76L282.83,241.17z', 'Jawa Tengah', 'jawa-tengah', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(14, '34', '3400000000', 'ID-YO', 'M270.07,268.13L268.03,268.04L262.18,265.91L261.52,265.1L259.55,264.48L255.78,262.72L255.78,262.72L256.36,262.75L256.67,261.47L257.87,260.2L257.85,258.61L260.01,258.46L260.44,259.36L261.01,258.59L263.4,256.71L264.21,260.6L264.96,261.06L265.55,260.92L265.76,261.26L267.24,260.94L267.43,261.27L268.01,261L268.7,261.59L268.94,261.32L269.23,261.49L268.68,264.87L269.25,266.48L269.2,267.23L269.43,267.41L269.97,267.04L269.73,267.65L270.11,267.63z', 'DI Yogyakarta', 'di-yogyakarta', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(15, '35', '3500000000', 'ID-JI', 'M312.78,272.41l1.51,0.08l0.48,0.3l-0.17,0.37l-1.01,0.24l-1.44,-0.14l0.03,-0.52L312.78,272.41zM355.4,249.19l0.54,0.18l0.16,0.45l0.88,0.27l0.84,-1.05l-0.27,1.55l-1.09,0.28l-1.3,-0.64l-0.17,-0.33l0.27,-1.14L355.4,249.19zM331.6,250.38l-0.98,-0.13l-0.79,-0.55l-0.32,-0.62l0.23,-0.57l0.85,-0.26l0.49,0.34l0.74,1.51L331.6,250.38zM353.29,246.76l0.72,0.7l-1.62,-0.24l-0.45,-0.64l0.26,-0.33L353.29,246.76zM324.86,245.28l1.76,0.91l0.32,0.77l-3.02,0.85l-0.66,-0.08l1.02,0.76l1.44,0.08l0.23,0.66l-1.6,-0.19l-0.98,-0.98l-0.7,0.74l0.21,0.83l-3.59,-0.43l-0.6,0.38l-0.79,0.02l-0.83,1.68l-0.68,0.45l-0.15,-0.44l-0.76,-0.15l-4.7,0.09l-0.3,-0.49l-0.34,0.06l0.19,-0.49l-0.34,-0.3l-0.38,0.45l0.55,0.72l-0.93,0.09l-4.04,-1.15l-1.49,-0.09l-1.06,0.26l-0.45,-0.36l0.23,-0.94h-0.28l-0.26,-0.68l0.21,-0.47l0.6,0.15l1.23,-1.02l0.57,-1.23l1.06,-0.38l2.27,-0.17l8.42,0.32l7.18,-0.57L324.86,245.28zM347.12,244.35l3.18,0.48l1.49,0.84l0.24,0.44l-0.44,0.6l-0.88,-0.23l-0.43,-0.43l-1.02,0.16l-0.33,-0.38l-1.01,0.14l1.16,1.11l-1.16,0.13l-0.45,-0.37l-0.45,0.6l-0.67,-0.64l0.47,-0.54l-1.15,0.01l-0.14,-0.31l0.18,-0.62l0.74,-0.41l-0.33,-0.51L347.12,244.35zM285.73,243.34l1.96,0.48l2.07,-0.59l1.15,1.9l1.3,0.42l1.92,-0.48l3.26,-0.1l1.78,0.74l0.37,-0.46l-0.23,-0.29l0.23,-0.53l0.53,0.27l0.31,0.7l0.5,0.27l-0.38,0.45l0.32,1.01l0.61,0.45l0.09,0.55l-0.53,1.23l0.78,0.71l-0.26,0.86l0.89,0.22l0.17,-0.39l0.81,-0.09l1.45,1.54l-0.25,0.76l0.2,0.1l-0.1,2.43l-0.37,0.06l0.94,0.97l-0.14,0.86l0.44,0.54l0.79,0.28l0.24,-0.18l0.85,0.64l0.86,-0.06l0.74,0.84l1.43,0.73l1.39,-0.02l0.59,0.7l3.79,-1.46l2.87,0.61l0.75,-0.42l0.9,0.44l1.51,-0.95l1.26,0.31l1.07,-1.09l0.86,-0.43l0.56,0.39l0.75,1.3l1.6,0.12l0.65,-0.31l0.85,0.8l1.55,0.26l0.99,0.6l0.45,0.63l0,0.92l-0.78,0.69l0.18,2.42l-0.81,2.23l0.1,0.74l-0.78,3l-0.05,0.58l0.42,0.84l-0.22,0.66l0.4,0.12l0.22,-1.49l0.62,2.76l0.48,0.58l0.48,-0.38l0.62,0.6l0.98,0.16l0.59,0.9l-0.25,0.78l-1.04,0.43l-1.63,-0.55l-1.55,-0.09l0.52,-0.79l-0.16,-0.57l-0.61,-0.62l-1.22,-0.55l-0.54,0.05l-0.27,0.75l-1.94,-0.51l-1.06,0.3l-0.55,-0.76l-0.3,0.37l-0.61,0.05l-0.23,-0.25l0.39,-0.36l-0.28,-0.33l-0.62,0.34l-1.42,-0.46l0.02,-0.41l-0.46,0.31l-0.18,-0.96l-1.42,0.61l-0.06,-0.73l-0.73,0.23l-0.79,-0.92l-0.83,-0.1l-0.12,-0.25l-0.79,0.08l-0.78,-0.37l-0.02,-0.41l-0.37,-0.16l-1.2,0.42l-0.94,-1.32l-1.73,-0.76l-3.55,0.39l-1.02,0.6l-0.86,1.03l-3.65,0.5l0.08,0.5l-0.39,0.13l-2.28,-0.96l-2.93,-0.46l-1.59,-0.83l-0.59,0.31l-1.18,-0.39l-2.53,-0.09l-1.84,-0.69l0,0.34h-0.78l-0.71,-0.59l-0.34,0.22l-1.12,-0.23l0.09,1.06l-0.31,0.18l-0.33,-0.04l-0.11,-0.72l-0.34,0.01l0.12,0.52l-0.48,0.22l0.46,0.57l-0.5,0.13l-1.21,-0.39l0.08,-0.53l-0.74,0.22l-0.61,-0.5l-0.24,0.46l-1.29,-0.31l-0.17,-0.78l-0.33,-0.2l-0.66,0.37l-2.5,-0.53l-0.52,0.35l-1.24,0.11l-0.83,-0.58l-0.04,-0.34l-0.28,-0.02l-0.08,0.45l-1,0.11l-1.96,-0.65l0,0l0.13,-1.73l0.7,-0.92l1.26,0.33l0.84,-0.61l0.55,0.31l0.44,-0.7l0.16,-1.55l0.82,-0.34l0.07,0.28l0.98,0.18l1.11,-1.62l-0.58,-1.31l0.1,-0.56l-0.96,0.04l-0.83,-0.68l0.21,-1.77l-0.64,-0.42l-0.16,-1.44l-0.56,-1.35l0.46,-0.97l0.1,-1.74l1.11,-0.31l0.46,0.56l3.69,1.62l0.09,-0.27l-0.3,-0.15l0.16,-0.55h-0.46l0.36,-0.89l1.63,-0.7l1.33,-1.98l0.13,-2.18l-0.98,-0.67l0.7,-0.68l0.24,-1.35l0.67,-0.09l0.1,-0.82l0.54,-0.37l0,0L285.73,243.34zM302.4,225.36l0.39,0.1l0.25,0.84l-0.18,0.82l-0.76,0.39l-1.63,-0.01l-0.29,-0.52l0.27,-0.89l1.63,-1.02L302.4,225.36z', 'Jawa Timur', 'jawa-timur', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(16, '36', '3600000000', 'ID-BT', 'M173.73,239.14l-0.4,1.83l-0.64,0.23l-0.42,0.57l-0.21,-0.28l0.42,-0.85l-0.33,-0.26l0.02,-0.42l-0.82,0.52l-0.05,0.31l-0.26,-0.16l0.28,-0.59l0.99,-0.75L173.73,239.14zM198.91,231.55L198.31,231.8L198.27,232.92L198.88,233.25L198.86,233.92L199.25,234L199.85,235.49L199.85,235.49L199.81,235.64L199.81,235.64L199.63,236.25L196.72,236.27L196.42,235.91L195.4,235.64L195.61,236.11L195.07,236.15L194.86,235.5L194.53,235.4L193.86,236.04L194.3,237.44L193.43,237.86L193.32,238.82L193.88,240.06L193.79,241.79L195.26,243.24L193.92,244.2L193.84,244.91L193.19,245.6L193.27,246.98L193.27,246.98L191.77,247.22L191.68,246.94L191.02,246.91L190.59,246.58L190.62,246.15L188.16,245.21L186.92,244.17L185.48,244.05L182.54,244.66L181.04,244.47L178.92,244.8L178.52,245.09L177.48,245.02L176.87,244.47L176.22,244.74L176.29,244.48L175.72,244.1L174.57,243.86L173.72,244.64L173.31,244.54L173.16,243.54L172.72,243L173.7,243.07L174.83,242.04L174.71,241.61L175.54,241.21L176.11,242.48L175.86,242.76L176.36,243.09L176.73,244.06L177.25,244.27L177.77,243.64L177.91,242.65L179.71,240.83L179.84,239.32L180.38,238.38L180.78,238.07L180.73,238.79L181.14,239.11L182.5,238.96L183.37,237.42L183.45,234.34L184.06,232.09L184.45,231.85L184.42,231.24L186.22,229.73L186.4,228.86L187,228.07L187.74,227.96L188.3,228.61L188.28,229.9L189.3,230.45L190.32,230.13L190.93,229.18L192.21,229.76L192.61,229.35L193.2,229.64L193.34,230.31L193.83,230.57L194.94,230.73L195.67,230.2L196.16,230.51L197.3,230.18L197.73,230.43L198.22,230.28L198.69,230.74z', 'Banten', 'banten', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(17, '51', '5100000000', 'ID-BA', 'M352.31,278.62l-1.59,-0.65l-0.83,-0.67l0.13,-0.37l0.91,-0.65l1.27,0.16l0.62,1.15L352.31,278.62zM333.09,266.18l1.05,0.85l0.67,-0.37l5.19,1.27l2.4,-0.4l1.67,-1.47l1.27,-0.33l4.56,1.7l1.87,1.17l1.27,1.64l1.3,0.7l0.06,0.7l-1.64,1.55l-1.95,0.99l-3.11,0.97l-1,0.94l0.04,0.75l-1.34,0.79l0.53,0.67l0.12,-0.38l0.22,0.71l-0.36,0.51l-1.07,0.3l-0.96,-0.12l-0.19,-0.34l1.41,-0.91l-0.24,-0.45l0.28,-0.63l-0.35,-0.5l-4.69,-4.12l-3.01,-0.89l-2.13,0.12l-2.43,-3.08l-0.27,-1.87l0.13,-0.43L333.09,266.18z', 'Bali', 'bali', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(18, '52', '5200000000', 'ID-NB', 'M416.08,271.58l0.12,0.32l0.67,-0.3l0.24,0.5l-0.27,0.41l-0.33,-0.23l-0.14,0.32l-0.34,-0.09l-0.15,-0.95L416.08,271.58zM371.92,270.97l-0.2,1.4l-0.57,0.51l-0.42,1.71l-2.6,3.94l-0.1,0.58l1.52,0.45l-0.47,0.63l-2.02,0.33l0.47,-1.48l-0.85,0.18l-0.4,0.38v1.56l-0.4,-0.03l-0.17,-0.35l-1.17,-0.4l-2.17,0.08l-0.15,-0.75l-0.3,-0.05l-1.12,0.4l-0.9,-0.25l-0.42,0.45l-1.15,-1.08l-1.45,-0.13l-0.35,-0.4l-0.2,-0.63l0.4,-0.75l0.35,-0.08l0.07,0.38l1.07,0.43l0.57,-0.58l0.87,0.2l0.85,-0.6l0.1,-3.19l-0.55,-0.54l-0.17,-0.78l0.45,-0.65l0.82,-0.48l0.1,-0.5l0.3,0.1l1.02,-0.58l1.4,-1.48l1.65,-0.6l1.12,0.1l3.65,1.1L371.92,270.97zM386.97,267.29l1.15,-0.07l0.53,0.46l-1.26,0.92l-1.54,2.79l-1,-0.63l0.61,-1.24l-0.44,-0.39l0.01,-1.23l1.33,-0.79L386.97,267.29zM412.5,269.08h-0.69l-0.49,-0.4l-0.04,-0.9l0.83,-0.93l0.79,0.08l0.54,0.93l-0.26,0.7L412.5,269.08zM393.25,266.42h1.97l1.3,0.5l0.37,1.88l0.75,0.6l0.38,0.95l1.2,0.63l1.37,-0.53l0.3,-0.65l1.07,-0.88l3.4,0.78l0.6,1.38l-0.45,2.58l0.62,-0.2l0.22,-0.4l-0.1,-1.63l0.45,-0.85l1.35,-1.13l3.22,0.55l-0.1,1.13l0.95,1.43l0.05,0.95l-0.54,0.25l-0.1,0.58l0.39,0.62l-0.03,0.79l0.69,0.18l0.95,-0.38l-0.36,-0.56l0.64,-0.1l0.4,-0.55l0.33,0.5l-0.45,1.13l0.15,1.13l-0.65,0.53l-1.57,-0.28l-1.2,0.23l-1.12,-1.05l-0.87,0.6l-1.6,-0.38l-1,0.95l0.52,0.23l2.75,-0.02l0.8,0.45l0.17,0.45l-0.4,0.33l-1.37,0.18l-2.1,-0.83l-4.52,1.51l-1.25,-0.48l-0.33,-0.73l0.11,-0.64l0.65,-0.8l0.17,-1.05l-0.6,-0.88v1.1l-0.72,0.08l-0.38,0.58l-0.65,0.3l-0.13,0.53l-0.47,0.11l-1.37,1.38l-0.92,0.38l-0.82,-0.6l-1.31,0.28l-0.32,0.6l-1.92,0.88l-0.62,-0.23l-0.18,-0.5l-0.8,0.48l-1.12,-0.23l-2.87,1.48l-2.37,0.8l-1.3,0.08l-1.65,-0.55l-1,0.05l-0.97,1.01l-1.67,0.4l-1,-0.35l-0.32,-0.4l-0.65,-0.13l-0.37,0.25l-2.71,-1.21l-0.3,-0.5l0.32,-1.76l0.55,-0.28l-0.08,-0.4l0.77,-0.15l-0.8,-1.53l0.27,-0.23l-0.42,-1l0.67,-1.41l0.57,-0.33l-0.22,-0.83l0.47,0.33l1.58,-0.25l3.5,-2.61l4.45,1.76l0.65,-0.88l2.24,-0.2l1.12,0.78l0.62,-0.05l0.32,0.95l-0.85,0.6l0.65,0.48l0.9,-0.08l-0.32,-1.3l0.4,-0.13l0.37,0.95l0.55,0.02l0.05,0.45l-0.8,0.08l0.32,0.38l-0.1,0.6l0.62,1.66l1.5,-0.3l1.65,0.55l1.47,-1.21l1.37,-0.3l1.05,0.43l1.57,-0.63l-0.2,-0.75l-0.5,-0.45l-0.57,-0.15l-0.15,0.25l-2.15,-2.08l-1.67,0.2l-2.92,-1.86l-1.72,-1.86l-0.17,-0.35l0.32,-1l1.15,-0.83l0.7,0.05l1.7,-0.8L393.25,266.42z', 'Nusa Tenggara Barat', 'nusa-tenggara-barat', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(19, '53', '5300000000', 'ID-NT', 'M487.29,308.08l0.82,0.08l-1.55,1.53l1.13,0.33l0.21,0.82l-0.48,0.59l-0.94,-0.03l-1.64,0.94l-0.48,1.56l-0.63,0.15l-0.87,-0.38l-0.85,0.77l-1.76,0.09l-0.57,0.41l0.34,0.34l-0.29,0.53l-1.03,-0.41l-0.6,0.15l-0.12,0.37l-0.5,-0.3l0.05,-1.29l-0.46,-0.88l0.13,-0.37l2.13,-0.74l0.73,0.11l1.15,-0.32l1.41,-1.37l0.99,-0.28l0.22,-0.65l0.44,0.03l-0.07,-0.4l0.83,-0.88l1.73,-0.78l0.2,-0.83l0.61,0.63L487.29,308.08zM462.44,307.04l0.87,0.29l-0.19,1.32l-2.19,1.58l-2.1,-0.06l-1.1,-0.67l2.61,-1.46l0.22,-0.83l0.41,-0.25l0.67,-0.22L462.44,307.04zM488.61,302.24l0.53,-0.11l0.09,0.45l-0.78,0.26l-0.51,0.6l-0.18,-0.35l-0.44,-0.04l0.43,0.9l0.04,0.63l-0.43,-0.06l0.31,0.35l-0.11,0.42l-0.4,-0.01l-0.33,-0.52l-0.79,0.57l-0.34,-1.23l0.95,-0.85l0.67,-1.45l0.99,-0.39L488.61,302.24zM428.93,288.78l1.26,1.49l1.77,0.05l0.52,1.07l0.07,1.21l0.39,0.5l0.69,0.05l0.57,0.45l2.44,-0.82l0.54,0.97l1.7,0.87l1.48,3.08l2.07,0.97l0.49,0.7l0.34,1.07l-0.22,0.8l-1.16,0.67l-0.62,0.94l-0.86,0.57l-1.04,0.37l-1.53,-0.07l-0.91,0.47l-0.32,0.62l-1.11,-0.42l-0.57,-0.55l-2.59,0.02l-1.11,-0.5l-1.85,-1.74l-0.44,-0.1l-0.22,-1.12l-1.04,-1.19l-1.21,-0.52l-0.05,-0.47l-1.55,-0.12l-1.51,-1.26l-0.49,-1.04L422.2,296l-0.71,-0.57l-2.04,-0.47l-0.94,0.4l-0.27,0.5l-1.01,-0.52l-0.37,0.1l-0.22,-0.35l-2.12,-0.02l-2.54,-1.11l-2,-2.41l1.21,-1.64l3.25,-1.41l0.54,0.35l1.5,-0.57l0.76,0.32l1.97,-0.3l1.26,0.32l0.79,-0.52l1.03,-0.02l0.74,0.52l1.93,0.4l2.54,-2.16L428.93,288.78zM514.04,281.26l0.2,0.08l-0.31,1.16l0.75,0.61l1.73,-0.7l0.6,-0.97l1.28,1.02l-0.09,2.49l-0.69,0.08l-0.67,0.53l-0.72,-0.56l-1.04,0.02l-0.28,0.57l0.21,1.46l0.97,0.67l0.67,2.32l0,0l-1.68,1.51l-0.17,1.64l-0.53,0.56l-1.61,0.91l-2.07,2.88l-3.36,2.15l-0.65,1.39l-1.42,1.07l-1.04,0.28l-3.9,-0.21l-2.18,1.98l-1.01,0.13l-2.72,1.24l-1.67,0.22l-0.84,-0.25l-0.71,0.35l-1.24,-0.73l-1.36,0.51l0.65,-1.54l-0.13,-0.69l0.58,-0.22l0.07,-0.66l3.65,-1.43l0.49,-0.86l-1.22,-0.63l-0.9,0.01l-0.65,0.53l-0.42,-0.28l-0.01,-1.81l1.37,-0.96l0.11,-1.07l-0.45,-0.66l0.68,-0.56l-0.18,-1.81l1.2,-1.24l0.77,-0.31l0.46,-0.85l1.29,-0.58l0.33,-0.6l0.54,-0.18l1,-1.31l0.87,-0.06l0,0l0.88,1.19l0.46,-0.02l0.26,0.32l1.52,-0.97l0.83,0.81l0.25,0.61l-0.14,0.86l1.21,-0.28l0.23,-0.5l-0.22,-0.45l0.55,-0.68l-0.02,-0.55l0.97,-0.44l0.43,-0.59l-0.12,-0.56l0.41,-1.58l0,0l1.3,0.03l0.88,-0.31l1.51,-1.21l0.08,-0.56l0.79,-0.09l0.96,-0.7L514.04,281.26zM425.09,278.91l-0.42,-0.02l0.25,-0.54l0.25,0.14L425.09,278.91zM422.78,278.72l-0.55,-0.17l0.44,-0.22L422.78,278.72zM421.78,276l-0.7,0.08l-0.15,0.28l-0.34,-0.11l1.06,-0.68L421.78,276zM422.48,275.22l0.29,0.01l0.18,1.3l0.56,-0.24l-0.31,-0.59l0.4,0.15l0.17,-0.46l1.16,0.1l-0.09,0.63l-0.44,0.07l-0.34,0.55l-0.43,-0.22l-0.23,0.37l-0.08,0.37l0.63,0.49l-0.65,0.95l-0.27,-0.01l-0.29,-0.6l-0.74,0.31l-0.21,-0.67l0.27,-0.86l0.65,-0.01l-0.15,-0.5l-0.37,0.13l0.22,-0.47l-0.43,-0.8L422.48,275.22zM469.7,272.06l0.8,0.32l-0.57,0.89l-0.93,-0.6l0.05,-0.52L469.7,272.06zM419.48,272.47l0.17,0.58l1.15,0.21l0.38,-0.19l0.11,0.91l-0.37,-0.27l-0.09,0.19l0.39,1.05l-0.91,0.13l0,-0.48l-0.37,-0.08l-0.39,0.62l-0.37,0.03l0.18,0.35l0.5,-0.13l-0.33,0.61l-0.39,-0.06l-0.33,0.46l0.38,0.45l-0.14,0.37l0.41,0.23l-0.52,0.25l-0.61,-0.48l-0.52,0.22l0.57,-1.44l-0.59,-0.4l0.24,-0.5l-0.25,-0.25l1.05,-1.05l-0.34,-0.36l0.42,-0.3l-0.28,-0.77l0.5,0.12l0.06,-0.44L419.48,272.47zM483.28,272.06l0.08,0.32l-0.33,0.28l-1.33,0.5l-0.82,-0.24l-0.72,0.61l-0.78,1.45l-0.86,0.23l-0.28,-0.47l0.25,-1.02l1.08,-0.58l0.48,-0.94l0.78,0.2L483.28,272.06zM458.37,269.78l0.42,0.52l-0.1,0.34l-1.21,0.03l0.34,-0.83L458.37,269.78zM484.17,268.74l0.56,-0.21l1.57,0.68l-0.52,0.55l0.06,1.02l-0.28,0.6l-2.01,-0.06l-3.04,0.43l-0.05,-0.72l0.61,-1.06l1.88,-1.28l0.66,0.09l0.43,-0.26L484.17,268.74zM502.34,270.71l-0.84,1.05l-0.15,1.07l-1.34,1.24l-1.26,-0.01l0.2,-0.81l-0.55,-1.3l-0.8,-0.04l-0.7,0.67l-0.56,-0.16l0.8,-1.73l1.63,-0.93l0.51,0.3l0.04,0.67l0.56,0.04l0.83,-1.13l0.66,-0.38l0.72,-1.22l0.42,-0.35l0.64,-0.01l0.32,0.58l-0.44,0.82l0.08,0.98L502.34,270.71zM495.07,268.24l1,0.12l0.44,0.63l-1.47,0.55l-0.63,-0.16l-0.72,0.28l-1.5,2.36l-0.91,-0.36l-1,0.82l-0.15,0.38l0.48,0.98l-0.53,0.62l-0.58,-0.04l-0.5,-0.79l-1.58,1.16l-1.49,-0.99l-0.41,0.35l-0.88,-0.13l-0.19,0.24l-0.35,-0.3l0.03,-0.42l0.38,-0.01l1.28,-1.07l0.43,-0.85l2.39,-1.05l-0.74,-0.75l-1.39,0.11l0.6,-0.73l0.45,-0.2l0.92,0.32l0.48,-0.48l1.2,-0.01l-1.03,1.95l0.94,0.32l0.71,-0.56l-0.33,-0.9h0.5l0.01,0.51l0.58,-0.5l-0.55,-1.14l0.7,-0.09l0.19,0.52l0.71,0.15l0.01,-0.6l1.52,-0.93L495.07,268.24zM506.78,266.72l1.44,0.1l-0.2,1.02l0.25,0.16l0.83,-0.5l1.68,-0.32l2.79,0.3l0.77,-0.36l2.41,0.08l0.7,1.39l0.04,1.65l-1.29,0.58l-3,0.12l-1.57,0.61l-2.44,-0.1l-1.96,0.89l-0.81,-0.44l-1.21,0.71l-0.23,-0.35l-0.88,0.1l-0.36,-0.72l1.1,-1.83l2.38,-1.19l-0.82,-0.02l-1.59,0.79l-0.09,-0.86l0.96,-1.29l0.35,-0.37L506.78,266.72zM479.25,266.46l0.78,0.51l-0.17,1l1.03,2.03l-0.71,0.68l-1.17,-0.27l-0.58,0.85l0.1,1.17l-1.77,-0.31l0.11,0.87l0.88,0.93l-0.16,0.97l-1.73,0.33l-0.11,0.41l-1.03,-0.16l-1.82,0.72l-0.58,0.74l-1.97,0.65l-1.29,-0.12l-1.08,0.26l-1.4,-0.12l-0.35,-0.32l-1.05,0.04l-1.46,1.1l-1.89,0.67l-0.96,0.02l-1.41,0.78l-1.91,-0.56l-0.28,0.94l-0.25,0.07l-0.31,-0.14l0.32,-1.03l-1.08,-0.64l-0.74,0.15l-2.52,-0.32l-0.4,0.64l0.06,0.85l-0.43,0.42l-0.57,0.17l-0.71,-0.39l-1.65,-0.01l-2.93,1.19l-1.47,-0.49l-0.92,-0.75l-0.52,-0.89l-0.81,0.18l-0.34,0.75l-0.46,0.12l-1.76,-0.45l-0.89,-0.9l-3.62,0.03l-1.23,0.63l-0.59,-0.02l-1.15,-0.3l-1.14,-0.89l-2.23,0.61l-1.29,0.03l-0.57,0.78l-0.42,-0.13l-0.02,-0.82l-0.8,-0.07l-0.67,-0.75l0.06,-3.21l1.26,-1.2l0.08,-0.55l-0.41,-0.83l0.42,-0.04l0.04,0.58l0.4,0.23l1.12,-0.73l0.5,0.47l0.24,-0.36l-0.23,-0.38l0.35,-0.56l0.75,-0.13l0.57,0.63l-0.18,0.36l0.38,0.04l0.22,-1.4l0.63,0.29l0.74,-1.17l1.45,-0.4l1.49,0.17l0.71,-0.25l0.26,-0.64l0.85,0.95l0.85,-0.33l1.24,0.31l0.04,-0.68l0.75,0.35l0.73,0.89l0.49,-0.04l0.43,0.38l4.25,0.01l0.1,0.47l0.5,-0.03l0.21,0.75l0.71,-0.1l3.62,1.06l0.49,0.21l0.75,1.21l1.22,0.56l0.85,-0.45l0.79,0.96l0.51,-0.6l0.61,-0.2l-0.26,-0.57l0.82,0.36l-0.22,-0.43l0.31,-1.05l1.06,0.68l0.86,-0.31l1.17,0.28l0.8,-0.51l1.17,0.26l0.82,-0.91l-0.06,0.5l1,-0.56l0.23,0.06l-0.17,1.48l0.92,-0.11l0.29,0.36l0.31,-0.25l0.96,0.45l1.21,1.21l1.15,0.28l1.13,-0.49l1.92,-0.07l0.76,-1.05l-0.04,-0.39l-0.61,-0.54l0.22,-0.34l1.12,-0.32l0.63,-0.55l0.14,-0.55l1.08,-0.05l1.2,-0.54l0.55,0.1l0.76,-1.11l1.47,-0.35l0.36,-1.12l0.43,-0.26l-0.61,-0.34l-1.57,0.3l-0.41,0.68l-0.98,-0.19l0.86,-1.28v-0.77l0.82,-0.21l0.62,-0.53L479.25,266.46z', 'Nusa Tenggara Timur', 'nusa-tenggara-timur', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(20, '61', '6100000000', 'ID-KB', 'M235.75,155.4l-0.39,-0.07l-0.58,-1.45l0.15,-0.3l1.59,-0.47l0.62,0.14l0.55,0.61l-0.3,0.89L235.75,155.4zM247.56,143.86l1.58,-0.24l0.85,0.59l0.67,-0.54l0.47,0.24l0.64,2.41l-5.01,2.89l-1.31,-0.43l-0.44,-0.45l0.73,-1.12l0.37,-2.63l0.75,-1.05L247.56,143.86zM249.5,91.1l-0.5,1.38l-0.67,0.97l-0.6,0.07L247.67,94l0.17,0.65l0.85,0.94l1.2,0.3l0.15,0.35l-0.42,2.14l0.3,0.65l2.17,1.96l0.83,1.29l1.77,0.25l0.42,1.69l1.49,0.74l0.35,0.87l0.43,0.35l1.32,0.07l1.5,2.31l0.32,0.97l1.95,0.25l0.9,1.37l1.55,0.7l1.27,-0.05l0.4,-0.67l0.45,0.45l0.45,-0.02l2.83,-1.25l0.9,-1.14l3.85,-0.5l1.95,-0.57l2.57,1.19l1.2,-0.32l0.77,0.12l0.7,1.17l0.32,-0.55l1.65,-0.89l1.27,0.5l0.58,-0.17l1.7,0.35l0.32,-0.77l1.35,-1.39l3.22,-0.22l0.37,-2.73l0.85,-0.84l0.05,-0.65l-0.42,-0.65l0.5,-0.55l1.7,-0.79l1.57,-0.35l1.65,-0.94l2.9,0.37l1.65,-0.12l0.9,0.42l1.12,-0.82l2.37,0.27l0.65,0.7l-1.62,1.96l0.75,0.07l1.35,-0.45l0.37,0.05l0.38,0.67l0.75,0.22l2.37,0.05l1.8,1.59l2.12,-0.55l0.67,0.3l0.75,1.34l0.32,0.1l2.92,-1.44l0.23,-1.22l1.92,-0.79l0.4,-0.45l3.05,-0.32l1.17,0.93l0,0l-0.03,0.01l0,0l-0.82,0.42l-0.12,1.72l0.21,0.18l-0.33,0.42l-0.21,1.39l-1.37,0.57l-1,-0.09l-0.52,0.42l-0.09,0.66l-0.97,0.39l-0.09,0.36l0.46,0.72l-0.79,1.3l0.85,1.48l-0.52,0.63l-0.12,1.18l-0.67,0.27l-0.06,0.78l0,0l-0.51,0.29l-0.23,0.71l-1.11,1.27l-1.08,0.42l-0.27,1.09l-1.31,0.76l-1.71,1.77l-0.92,0.56l-1.38,-0.26l-1.37,0.58l1,1.2l1.55,0.82l-0.15,1.34l0.55,0.6l-0.44,1.14l0.44,0.27l-0.36,0.79l-0.44,0.26l0.34,0.2l-0.08,0.33l-0.36,0.07l-0.84,1.09l-0.85,0.18l-1.44,1.78l0.78,0.71l0.19,0.78l-0.82,1.29l-0.56,-0.56l-0.49,-0.01l-0.14,-0.35l-1.36,0.87l-1.33,-0.14l-1.77,0.73l-0.67,0.63l-1.85,0.1l-0.08,0.86l-0.74,0.03l-0.25,0.42l-0.89,0.03l-0.6,0.56l-1.01,0.27l-0.85,-0.16l-0.31,0.69l-0.37,-0.26l-0.01,-0.61l-0.37,-0.14l-1.34,0.75l-0.41,-0.18l-0.36,0.44l-1.05,-1.69l-0.89,-0.31l-0.82,1.14l0.14,0.79l-2.23,-0.42l-0.19,0.18l0.25,1.43l-1.21,0.34l-0.86,-0.68l-0.14,0.86l0.29,0.76l-0.67,-0.15l-0.78,0.9l-1.01,-0.07l-1.92,1.13l-0.59,0.04l-0.3,0.37l0.18,0.69l-0.94,0.63l-0.27,0.54l0.31,0.64l-0.26,0.48l0.33,0.29l-0.12,0.3l-2.84,0.65l-0.12,0.54h-0.3l-0.36,0.75l-0.63,0.33l-0.75,1.4l-1.11,-0.22l-0.12,0.53l-0.38,-0.14l0.05,1.44l-0.63,-0.79l-0.82,0.49l0.33,0.84l-0.81,0.22l-0.37,-0.42l-0.78,0.45l-0.49,-0.39l-2.15,1.56l0.04,0.78l0.44,0.11l0.44,0.63l1.14,-0.86l0.51,0.68l0.12,1.2l-0.63,1.16l-0.03,0.64l0.33,0.41l-0.38,0.79l0.49,0.65l1.45,0.14l-0.08,0.82l-0.7,0.59l0.64,1.52l-0.78,1.24l0.69,1.13l0.52,1.82l0.62,3.37l-0.33,0.82l0.79,0.26l0.15,0.45l-0.52,0.91l-2.36,0.82l-0.15,0.57l-0.62,0.52l-1.18,0.2l-1.99,0.89l-0.72,1.22l0,0L267,179l-0.34,-0.14l-0.03,-1.83l-0.37,-0.87l-0.47,-0.57l-0.64,-0.07l-2.39,0.97l-1.95,1.6l-0.67,-0.37l-0.5,-1.5l0.64,-1.67l-0.75,-0.66l-0.18,-1.66l-1.26,-0.37l0.67,-0.8l0.25,-1.26l-1.04,-3.8l-0.73,-0.87l0.54,-3.25l-0.7,-1.8l-2.36,-1.2l-0.78,-0.75l0.19,-0.92l1.34,-0.79l0.69,-1.2l0.65,-3.33l-0.2,-2.26l-0.87,-0.9l-0.8,-0.18l-0.87,-1.1l0.52,-1.4l-1.92,-0.63l-1.17,-1.61l-0.67,-0.41l-0.73,0.49l-1.13,-0.75l-0.71,-1.03l-2.28,-0.82l-0.48,0.12l0.2,0.84l-0.52,0.49l-1.72,-0.57l-0.56,-0.57l-0.46,-0.89l0.2,-2.6l0.81,0.49l1.94,0.37l1.05,0.63l0.02,-0.51l-0.97,-0.73l-0.87,-0.03l-0.23,-0.46l0.3,-1.13l-1.82,0.16l-1.68,-0.6l-0.72,-0.81l-1.41,-4.52l0.34,-0.59l0.64,-0.13l-0.17,-0.81l1.13,-1.79l0.38,-1.61l-0.2,-1.18l-0.84,-1.89l-1.1,-1.16l-2.33,-0.55l0.48,-1.57l0,-0.52l-0.71,-0.84l0.47,-2.12l-0.27,-0.92l-0.73,-0.79l0.25,-0.87l-0.75,-0.89l0.15,-0.43l1.21,-0.6l0.67,-0.69l0.39,-1.14l-1.38,-3.2l0.13,-0.2l0.73,0.17v-0.76l1.33,-1.85l0.23,-0.79l-0.2,-1.26l0.5,-1.59l3.49,-2.62l0.5,-1.55l0.7,-0.96l-0.13,-1.92l1.85,-0.19l0.78,-0.64l1.69,-0.03L249.5,91.1zM235.53,77.73l-1.14,-0.67l0.92,-0.77l0.31,-1.05l0.48,-0.17l0.45,0.43l-0.18,1.49L235.53,77.73zM181.92,77.95l-0.64,-0.25l-0.33,-2.69l0.3,-0.92l2.55,1.42l-0.61,1.34L181.92,77.95zM226.4,63.5l-2.29,0.48l-1.46,-0.81l0.6,-0.84l1.25,-0.91l-2.42,-0.96l-0.98,-1.85l-0.23,-1.12l0.59,-0.71l0.74,-0.21l1.96,-2.05l1.21,0.28l0.33,1.32l2.2,2.17l0.16,1.79l-0.22,0.78L226.4,63.5z', 'Kalimantan Barat', 'kalimantan-barat', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(21, '62', '6200000000', 'ID-KT', 'M268.36,178.17L269.09,176.95L271.07,176.07L272.25,175.86L272.87,175.34L273.02,174.77L275.38,173.95L275.9,173.04L275.74,172.59L274.95,172.33L275.28,171.52L274.66,168.15L274.14,166.32L273.46,165.19L274.24,163.95L273.59,162.43L274.29,161.84L274.38,161.03L272.92,160.89L272.43,160.24L272.81,159.45L272.49,159.04L272.51,158.4L273.14,157.24L273.02,156.04L272.51,155.36L271.38,156.22L270.94,155.59L270.5,155.48L270.46,154.71L272.61,153.14L273.1,153.54L273.88,153.09L274.25,153.51L275.06,153.29L274.73,152.45L275.55,151.96L276.18,152.75L276.13,151.3L276.51,151.44L276.64,150.91L277.75,151.13L278.5,149.73L279.13,149.4L279.49,148.65L279.79,148.65L279.91,148.11L282.75,147.45L282.87,147.15L282.54,146.87L282.8,146.39L282.48,145.75L282.76,145.21L283.7,144.58L283.53,143.89L283.83,143.52L284.42,143.48L286.33,142.35L287.35,142.42L288.12,141.52L288.8,141.67L288.51,140.91L288.65,140.05L289.51,140.73L290.71,140.39L290.47,138.97L290.66,138.79L292.89,139.21L292.75,138.42L293.58,137.28L294.47,137.59L295.52,139.28L295.88,138.84L296.29,139.02L297.63,138.27L298,138.41L298.01,139.02L298.38,139.28L298.7,138.58L299.55,138.75L300.56,138.48L301.16,137.92L302.05,137.89L302.3,137.47L303.04,137.44L303.12,136.59L304.97,136.49L305.64,135.86L307.41,135.13L308.74,135.27L310.1,134.4L310.23,134.75L310.73,134.76L311.29,135.32L312.11,134.03L311.92,133.25L311.14,132.54L312.57,130.76L313.43,130.58L314.26,129.5L314.62,129.43L314.7,129.1L314.36,128.9L314.8,128.64L315.15,127.85L314.71,127.58L315.15,126.43L314.6,125.84L314.76,124.49L313.21,123.68L312.21,122.48L313.58,121.9L314.96,122.15L315.88,121.6L317.59,119.83L318.91,119.07L319.18,117.98L320.26,117.56L321.37,116.29L321.6,115.58L322.11,115.29L322.11,115.29L323.02,115.62L326.69,114.66L327.42,115.11L327.75,116.08L327.42,116.62L328.05,116.95L328.15,117.37L330.12,117.37L332.06,118.1L332.27,118.04L332.21,117.37L332.88,116.92L333.88,116.89L334.09,115.87L334.88,115.84L336.26,114.55L337.13,114.59L337.95,113.99L338.84,113.82L340.04,114.69L339.78,113.98L340.58,113.23L341.54,113.74L342.22,116.05L343.83,118.72L344.48,119.29L344.43,120L342.89,121.54L342.38,121.04L341.34,121.25L340.96,120.98L340.29,121.41L339.76,122.54L339.18,122.81L338.73,123.64L338.44,124.94L338.73,125.44L339.32,125.33L340.25,125.97L340.93,129.9L341.95,129.71L342.85,129.95L343.61,129.29L344.55,129.05L344.84,128.39L347.26,127.22L347.62,128.34L346.76,129.18L346.76,129.85L346.21,130.8L346.46,131.73L346.04,131.81L346.23,133.27L346.6,133.37L346.39,134.46L347.34,135.26L347.73,136.29L348.23,136.72L348.48,139.81L348.89,140.82L350.57,141.12L351.96,142.79L353.28,143.63L353.72,144.87L354.14,144.82L354.88,145.4L355.07,146.09L355.3,146.23L355.96,145.83L356.72,146.49L355.33,147.94L355.1,149.24L355.1,149.24L354.75,149.55L354.75,149.55L353.76,150.33L353.26,150.22L351.06,151.21L349.07,151.53L347.47,157.63L347.58,158.41L348.25,159.33L348,160.14L347.04,160.88L347.75,162.82L347.15,164.94L346.44,164.69L340.55,168.96L339.98,168.93L339.8,169.88L338.6,171.21L338.28,173.01L337.82,173.61L336.61,173.82L336.36,174.67L335.01,175.23L333.49,178.23L333.1,180.49L331.64,182.79L330.86,185.15L330.86,186.06L330.86,186.06L328.44,184.91L326.58,184.41L325.36,184.5L321.77,186.22L319.12,186.47L318.05,185.82L318.54,184.26L318.61,182.68L317.99,181.24L315.73,181.38L315.11,182.47L313.84,182.76L311.75,181.43L308.63,178.17L308.11,178.1L306.64,179.7L306.53,180.27L306.97,180.84L306.67,181.84L303.36,183.87L301.48,185.42L299.41,185.93L297.43,184.36L295.5,183.69L294.46,183.67L293.01,184.23L289.32,187.75L288.3,188.15L286.85,187.55L287.5,185.27L287.03,181.61L287.28,178.99L285.92,176.56L285.52,174.96L285.04,174.89L285.11,175.69L284.54,176.53L284.97,176.88L284.87,177.33L283.93,177.5L282.39,178.6L281.31,177.33L280.14,176.69L278.66,176.69L274.39,178.97L271.94,179.47L269.76,177.93z', 'Kalimantan Tengah', 'kalimantan-tengah', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(22, '63', '6300000000', 'ID-KS', 'M366.16,189.16l-0.17,0.2l-1.1,-1.78l0.65,-1.65l1.09,-1.14l0.2,1.04L366.16,189.16zM361.45,196.11l-0.56,0.16l-0.61,-0.27l0.45,-2.05l-0.06,-1.79l-0.9,-1.25l-0.23,-1.47l1.9,-5.56l2.45,-1.75l0.29,0.41l-0.36,2.29l0.27,2.65l0.82,3.98l-0.24,2.43L361.45,196.11zM355.11,149.23l-0.25,0.99l-1.06,1.27l-0.25,-0.07l0.14,-0.78l-0.32,-0.07l-1.95,2.29l0.18,0.35l1.21,-0.14l0.28,0.39l-0.14,0.71l0.85,0.88l-0.04,0.81l0.85,1.31l0.14,1.87l-0.39,1.41l0.28,0.74l-0.21,0.6l0.53,0.25l0.5,-0.14l0.75,0.49l-0.35,0.56l-0.18,1.52l0.71,1.73l-0.04,1.02l0.28,0.53l2.34,-1.62l0.92,0.56l2.73,0.14l1.28,0.42l2.7,0.04l2.43,0.9l0,0l-0.39,1.87l-0.52,0.66l-0.4,0.02l-0.28,-0.78l-0.76,-0.4l-1.98,0.4l-0.05,1.62l1.01,0.91l0.2,3.11l-0.33,0.85l-1.39,1.8l-0.73,0.21l-0.45,-1.55l-0.95,-1.65l-0.33,-0.05l-0.38,1.72l0.19,0.89l1.55,1.9l0.1,0.98l-0.77,0.39l-1.25,1.71l-1.52,2.87l-0.62,2.92l-2.36,0.51l-1.8,1.51l-13.96,5.6l-3.79,2.28l-1.24,0.16l-0.49,-0.96l-0.12,-8.15l-2.09,-2.71l-0.73,0.08l-1.54,-0.88l0,0l0,-0.91l0.78,-2.37l1.46,-2.29l0.39,-2.26l1.53,-3l1.35,-0.56l0.25,-0.85l1.21,-0.21l0.46,-0.6l0.32,-1.8l1.2,-1.32l0.18,-0.95l0.57,0.04l5.9,-4.27l0.71,0.25l0.6,-2.12l-0.71,-1.94l0.96,-0.74l0.25,-0.81l-0.67,-0.92l-0.11,-0.78l1.6,-6.1l1.99,-0.32l2.2,-0.99l0.5,0.11l0.99,-0.78l0,0L355.11,149.23z', 'Kalimantan Selatan', 'kalimantan-selatan', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(23, '64', '6400000000', 'ID-KI', 'M393.51,84.34L394.95,85.91L395.69,87.14L395.67,87.57L395.06,88.49L392.35,90.94L391.05,90.53L391.73,91.68L391.79,94.45L396.34,98.41L401.27,101.31L401.8,102.66L403.12,103.27L404.31,103.36L407.41,106.02L408.52,107.83L411.21,108.68L411.46,109.79L410.17,111.28L407.75,112.95L405.71,112.18L402.74,112.46L399.95,112.21L396.87,111.63L395.24,110.89L394.54,110.17L393.87,108.37L393.2,107.8L392.15,107.49L392.12,107.93L394.52,112.03L394.61,112.77L394,113.21L392.33,112.31L390.74,112.82L389.54,113.99L389.18,114.76L389.17,115.67L387.46,119.2L386.55,119.86L385.74,121.59L384.79,124.92L385.85,127.26L385.03,128.36L384.24,130.83L384.85,132.58L384.4,135.7L386.97,134.03L387.63,133.98L386.64,137.84L387.49,140.05L384.56,141.51L382.42,141.39L381.72,140.56L381.3,140.82L381.16,141.62L379.21,143.97L377.16,147.31L375.38,148.26L373.54,148.59L372.22,145.62L372.53,144.5L372.21,144.36L371.74,146.19L372.44,146.89L373.03,148.2L372.48,150.2L370.23,150.98L368.73,152.03L368.69,152.95L369.18,153.74L368.74,154.62L366.37,155.56L363.28,157.27L363.93,157.85L366.04,157.05L367.11,157.34L367.33,161.85L366.94,162.34L365.6,163L367.73,163.28L368.14,162.88L368.43,163.96L369.85,164.34L369.04,168.2L369.04,168.2L366.61,167.3L363.91,167.27L362.63,166.85L359.9,166.7L358.98,166.14L356.63,167.76L356.35,167.23L356.38,166.21L355.67,164.48L355.85,162.96L356.21,162.4L355.46,161.9L354.96,162.04L354.43,161.8L354.64,161.2L354.36,160.46L354.75,159.04L354.61,157.17L353.76,155.87L353.79,155.06L352.94,154.17L353.08,153.47L352.8,153.08L351.59,153.22L351.41,152.87L353.37,150.58L353.69,150.65L353.54,151.42L353.79,151.49L354.86,150.22L355.11,149.23L355.11,149.23L355.1,149.24L355.1,149.24L355.33,147.94L356.72,146.49L355.96,145.83L355.3,146.23L355.07,146.09L354.88,145.4L354.14,144.82L353.72,144.87L353.28,143.63L351.96,142.79L350.57,141.12L348.89,140.82L348.48,139.81L348.23,136.72L347.73,136.29L347.34,135.26L346.39,134.46L346.6,133.37L346.23,133.27L346.04,131.81L346.46,131.73L346.21,130.8L346.76,129.85L346.76,129.18L347.62,128.34L347.26,127.22L344.84,128.39L344.55,129.05L343.61,129.29L342.85,129.95L341.95,129.71L340.93,129.9L340.25,125.97L339.32,125.33L338.73,125.44L338.44,124.94L338.73,123.64L339.18,122.81L339.76,122.54L340.29,121.41L340.96,120.98L341.34,121.25L342.38,121.04L342.89,121.54L344.43,120L344.48,119.29L343.83,118.72L342.22,116.05L341.54,113.74L340.58,113.23L339.78,113.98L340.04,114.69L338.84,113.82L337.95,113.99L337.13,114.59L336.26,114.55L334.88,115.84L334.09,115.87L333.88,116.89L332.88,116.92L332.21,117.37L332.27,118.04L332.06,118.1L330.12,117.37L328.15,117.37L328.05,116.95L327.42,116.62L327.75,116.08L327.42,115.11L326.69,114.66L323.02,115.62L322.11,115.29L322.11,115.29L322.17,114.51L322.84,114.24L322.96,113.06L323.48,112.43L322.63,110.95L323.42,109.66L322.96,108.93L323.05,108.57L324.02,108.18L324.12,107.52L324.63,107.09L325.63,107.18L327,106.61L327.21,105.23L327.54,104.8L327.33,104.62L327.45,102.9L328.27,102.48L328.27,102.48L328.64,102.33L328.64,102.33L328.88,101.88L331.16,101.12L331.73,100.58L334.31,102.09L334.92,101.54L334.92,101.54L336.58,102.93L338.17,103.39L338.95,104.26L339.36,105.54L340.18,105.08L340.9,105.18L341.42,105.39L342.29,106.87L343.42,107.12L344.3,106.15L346.97,106.51L347.8,105.59L348.83,105.79L350.11,104.62L350.37,103.03L350.78,102.62L352.74,102.68L355.05,101.81L357.37,101.76L358.4,100.89L358.96,99.71L361.43,96.8L362.72,94.34L362.51,92.5L364.98,90.3L365.39,86.57L366.58,84.93L367.14,83.29L367.66,83.24L369,84.11L369.3,84.83L370.64,85.08L371.67,84.78L373.42,83.65L375.68,82.88L377.69,81.71L380.42,81.96L382.89,81.55L383.4,82.68L384.02,83.14L385.82,83.86L386.9,83.6L388.5,85.29L389.88,85.8L390.25,85.85L391.53,85.08L392.82,84.93z', 'Kalimantan Timur', 'kalimantan-timur', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(24, '65', '6500000000', 'ID-KU', 'M388.19,70.24l-0.56,0.43l-1.29,-1.02l-0.47,-1.24l0.18,-0.63l1.46,-0.12l0.82,0.25L388.19,70.24zM383.46,65.45l2.19,1.51l-0.54,0.47l-1.69,-0.74l-1.93,-0.1l-1.04,-0.85l0.08,-0.43l0.91,-0.38L383.46,65.45zM389.15,58.05l-0.78,0.29l-1.19,-0.87l-0.12,-1.1l0.78,-0.85l0.49,0.05l1.25,1.01l0.1,0.47L389.15,58.05zM391.93,54.74l0.43,0.19l0.42,2.01l-1.07,0.51l-4.13,-3.13l0.97,-0.99l0.51,-0.03l1,0.35l0.77,0.8L391.93,54.74zM353.97,56.18l0.37,-1.6l0.37,0.03l0.79,-0.91l0.54,0.4l0.41,-0.11l0.13,-0.57l0.72,-0.6l-0.02,-1.46l0.53,-0.19l0.33,0.57l1.51,0.3l1.02,1.2l0.59,-0.89l0.85,-0.33l0.28,-0.75l1.71,0.4l1.52,-0.35l1.17,0.97L367,52.9l0.59,-0.14l0.23,-0.54l0.84,0.09l-0.05,-0.62l0.54,-0.67l0.79,0.57l0.25,0.61l1.6,-0.17l0.54,-0.67l0.79,0.73l0.74,0.17l1.22,-0.61l1.95,0.77l0.34,-0.39l2.35,0.09l1.25,-0.57l3.02,2.15l0.64,1.01l1.21,0.34l0.89,-0.26l0.24,0.17l0,0l-1.72,0.79l-1.56,-0.45l-0.17,0.74l1.35,0.54l2.64,2.22l-1.75,0.26l1.66,0.95l1.56,0.17l1.27,1.34l-0.21,0.9l1.06,0.32L391.05,63l-1.2,1.12l-1.07,0.21l-3.17,0.23l-2.67,-0.38l-1.8,0.3l-0.93,0.94l0.03,0.41l0.56,0.87l1.48,0.93l1.26,-0.15l0.8,0.21l-0.26,1.37l1.76,0.92l-0.17,0.28l-2.12,0.51l-0.29,0.46l-0.97,0.17l-0.17,0.34l2.55,0.67l2.71,1.18l1.22,2.08l-0.3,2.87l1.83,0.67l0.58,2.38l2.78,2.74l0,0l-0.69,0.59l-1.29,0.15l-1.29,0.77l-0.36,-0.05l-1.39,-0.51l-1.59,-1.69l-1.08,0.26l-1.8,-0.72l-0.62,-0.46l-0.51,-1.13l-2.47,0.41l-2.73,-0.26l-2.01,1.18l-2.26,0.77l-1.75,1.13l-1.03,0.31l-1.34,-0.26L369,84.11l-1.34,-0.87l-0.51,0.05l-0.57,1.64l-1.18,1.64l-0.41,3.73l-2.47,2.2l0.21,1.84l-1.29,2.45l-2.47,2.91l-0.57,1.18l-1.03,0.87l-2.32,0.05l-2.31,0.87l-1.96,-0.05l-0.41,0.41l-0.26,1.58l-1.29,1.18l-1.03,-0.2l-0.82,0.92l-2.68,-0.36l-0.87,0.97l-1.13,-0.26l-0.87,-1.48l-0.51,-0.2l-0.72,-0.1l-0.82,0.46l-0.41,-1.28l-0.77,-0.87l-1.59,-0.46l-1.66,-1.39l0,0l0.49,-0.81l-0.06,-1.06l0.8,-0.47l0.9,-1.22l-0.11,-2.3l0.42,-0.93l0.56,-0.16l0.54,0.25l0.45,-0.64l1.03,-0.45l-0.4,-0.81l0.72,-0.97l-0.51,-0.25l-0.76,0.34l-0.04,-1.41l-0.51,-0.48l0.32,-2.13l1.84,-0.2l0.78,-0.49l-0.29,-0.66l0.31,-0.63l0.67,0.11l0.94,-0.83h0.67l0.65,-1.01l1.36,-0.16l0.6,-0.5l0.07,-0.31l-1.25,-1.47l-0.99,0.31l-0.31,-0.47l0.4,-0.79l-0.23,-1.01l0.6,-0.52l0.18,-0.77l-0.72,-0.58l0.96,-0.77l0.25,-1.06l1.59,-1.06l0.34,-0.83l0.65,1.06l1.23,-0.09l0.81,-0.77l1.03,-0.14l0.31,-1.44l0.81,-0.67l-0.76,-0.9l0.42,-2.81l0.63,-1.26l0.34,0.02l0.4,0.63l0.4,-0.58l-0.58,-1.01l-0.67,-2.43l0.05,-1.55l0.7,-2.31l-0.96,-1.04l1.3,-0.65l0.67,-2.08l0,0L353.97,56.18z', 'Kalimantan Utara', 'kalimantan-utara', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(25, '71', '7100000000', 'ID-SA', 'M517.55,102.27l-0.89,1.24l-0.77,2.53l-2.54,3.95l-1.32,0.57l-2.73,2.31l-1.93,3.68l-1.93,2.33l-2.09,1.07l-1.29,0.31l-5.19,0.66l-2.95,0.7l-2.24,0.26l-1.02,-0.31l-2.22,0.02l0,0l1.09,-2.41l0.08,-2.09l-0.31,-0.85l-0.54,-0.58l-2.02,-0.35l-1.21,-0.89l-0.62,-0.54l-0.23,-1.31l-0.7,-0.7l-1.4,-0.62l-0.2,-0.81l0,0l2.33,-0.11l5.29,1.48l0.9,-0.3l3.84,0.91l1.58,-0.06l6.57,-3.09l1.25,-2.68l0.99,-0.4l2.91,0.04l0.42,-0.58l-0.01,-0.61l-1.18,-0.29l-0.26,-0.45l0.44,-1.14l1.13,-0.82l1.69,0.31l2.02,-1.14l0.21,-0.54l-0.49,-1.34l2.62,-2.05l1.07,-0.09l1.71,0.49l0.68,0.55l-0.08,1.03l1.44,1.22l-0.32,0.85L517.55,102.27zM522.29,81.48l-0.68,-0.13l-0.38,-1.48l0.45,-1.18l0.53,-0.24l0.67,0.6l-0.83,1.18l0.41,1.02L522.29,81.48zM525.31,64.5l-0.22,0.56l1.01,1.29l0.59,0.16l0.12,1.26l-0.64,0.96l-0.37,-0.06l-0.09,0.62l-0.47,-0.98l-0.5,0.02l-0.69,-0.71l-0.28,0.05l-0.33,-1.16l0.47,-1.04l-0.45,-0.54l0.33,-0.12l-1.59,-0.79l-0.13,-1.27l0.73,-0.26l1.03,0.19L525.31,64.5zM544.73,61.35l-0.49,-0.25l-1.27,-2.8l-0.13,-1.03l0.68,0.28l1.39,1.87L544.73,61.35zM545.58,58.13l-1.08,-0.15l-0.16,-1.28l0.72,-0.61l0.98,-1.85l-0.21,-0.6l-1.16,-0.4l-0.29,-0.96l0.5,-3.05l0.35,-0.63l1.27,0.23l0.78,0.7l0.96,3.62l-0.78,1.17l-1.28,3.23L545.58,58.13z', 'Sulawesi Utara', 'sulawesi-utara', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(26, '72', '7200000000', 'ID-ST', 'M491.45,219.17l-1.17,-0.09l-0.65,-1.23l-0.08,-0.8l1.31,0.15l0.49,0.4L491.45,219.17zM463.54,220.9l-1,0.06l-2.66,-3.58l0.92,-3.06l0.85,-0.57l1.22,0.38l1.36,2.6l-0.11,3.33l-0.17,0.61L463.54,220.9zM475.63,206.47l0.81,4.37l-0.08,1.01l-2.23,1.93l-0.8,1.74l0.99,1.86l-0.24,1.32l-0.71,1.21l-0.94,0.26l-1.63,-0.58l-2.94,-0.38l-0.19,-0.93l0.84,-3.01l0.26,-0.61l1.03,-0.86l-0.13,-1.46l-1.01,-2.32l0.74,-1.61l2.55,-0.58l1.43,-1.12l1.63,-0.79L475.63,206.47zM484.18,207.51l-0.15,2.99l-0.61,-0.66l0.15,-1.02l-0.73,-1.1l-0.4,0.21l0.16,2.07l-0.36,0.25l-0.76,-0.51l0.36,-1.27l-0.56,0.07l-0.96,3.26l-0.18,2.77l0.73,0.62l0.37,-0.08l2.93,2.31l0.03,0.37l-1.24,1.59l-1.61,0.7l-0.91,-0.54l-2.12,1.2l-0.23,0.69l0.68,0.05l0.23,0.33l-1.48,2.59l-0.44,0.27l-2.56,-0.12l-1.5,-3.08l2.87,-4.36l0.8,-2.15l1.25,-5.5l-0.16,-2.8l1.21,-3.05l2.04,-1.44l0.82,0l-0.3,0.52l0.24,0.76l1.01,0.56l1,1.4L484.18,207.51zM481.88,195.84l1.84,-0.3l1.07,1.41l-0.09,0.72l-1.82,2.19l-1.36,-0.08l-1.95,-2.56l-0.02,-0.73l0.94,-1.04l0.66,-0.14L481.88,195.84zM484.04,146.88l0.48,0.99l-0.7,1.14l0.85,1.58l0.44,-0.07l0.41,-0.99l1.26,-1.51l0.81,-0.37l2.51,1.18l-0.44,2.76l-1.26,1.25l-0.52,0.04l-1.18,-0.55l-0.92,-1.25l-0.78,0.7l-0.48,2.57l-0.81,0.33l-0.96,-0.26l-0.41,-0.55l1.37,-1.21l-0.74,-3.56l-1.59,1.58l-0.26,1.07l-0.78,1.21l-1.18,1.07l-0.96,0.07l-0.7,-1.62l-0.74,-0.55v-0.85l0.48,-1.84l1.26,-1.73l0.33,-0.4l0.44,-0.04l0.74,0.44l2.33,-0.85l0.63,0.7l0.44,-0.88L484.04,146.88zM450.09,105.51l2.45,-0.25l1.24,-0.82l0.32,0.22v0.42l-0.2,0.29l-0.83,0.17l0.97,1.65l1.49,1.22l0.66,0.17l5.74,-0.78l1.08,1.43l1.22,-0.81l2.32,0.76l0,0l-2.52,0.82l-0.52,0.6h-0.38l-0.42,0.92l-0.91,-0.69l-0.48,-0.8l-0.85,0.14l-0.79,0.61l-3.19,1.25l-1.45,0l-0.48,0.42l-1.33,-0.05l-0.89,-0.51l-0.35,0.41l-0.02,0.96l-0.52,0.1l-0.97,-0.38l-1.06,0.38l-0.35,0.34l-0.06,1.06l-0.32,0.17l1.33,1.52l1.76,0.37l0.17,1.46l-0.29,0.5l0,0l-1.37,-0.41l-1.73,0.44l-0.62,0.82l-2,-0.24l-1.53,0.35l-3.75,-1.75l-3.39,-0.19l-2.82,1.23l-1.7,1.71l-2.12,3.1l0.35,0.33l-0.54,0.83l-0.2,2.11l-0.59,0.63l-0.49,-0.07l0.07,1.34l-0.46,1l-0.05,1.36l1.03,2.87l-0.4,3.06l0.29,0.72l3.78,4.9l0.84,0.25l1.09,-0.59l0.81,0.98l1.1,0.11l1.44,2.34l-0.38,2.1l0.8,0.68l1.03,2.16l0.51,0.06l0.82,-0.43l0.25,-0.56l0.51,-0.22l0.68,0.01l0,0.72l0.72,0.52l1.18,-0.16l2.43,0.3l1.38,-1.54l1.08,-2.17l2.22,-2.78l1.54,-1.27l0.66,-1.19l1.77,-0.63l0.21,-0.93l0.5,-0.15l0.67,0.27l-0.33,1.48l0.25,0.37l1.38,0.65l2.18,0.25l0.91,0.39l1.32,-0.88l0.75,-0.14l1.18,0.3l0.51,-0.51l0.39,-1.97l1.5,-0.58l0.97,0.43l2.68,-1l3.73,0.53l4.31,-0.27l0.7,-0.36l-0.07,-0.26l-1.44,-0.51l-1.99,-0.2l-0.44,-0.57l1.48,-0.63l3.33,-0.18l1.08,-0.81l2.66,0.11l1.54,0.59l1.69,0.91l0.75,1.92l-0.14,1.24l-0.79,0.92l-0.34,1.94l-0.82,0.89l-1.54,-0.38l-1.26,-1.46l-0.33,-0.9l-1.46,-0.34l-4.31,0.63l-1,2.18l-1.3,1.42l-1,1.73l-1.18,0.94l-3.18,3.63l-3.72,2.08l-2.62,0.34l-1.01,0.66l-2,0.39l-0.66,0.5l-0.97,2.39l-1.34,1.12l-2.2,0.14l-1.6,-1.9l-1.95,-0.84l-0.51,0.26l-0.17,1l0.87,2.52l0.38,-0.3l1.08,-0.06l2.44,3.23l0.85,0.34l0.91,-0.16l0.78,0.23l2.11,2.17l2.27,3.87l0.78,2.54l5.07,3.79l0.02,0.68l-0.74,1.48l1.91,1.71l0.8,-0.1l0.93,0.68l-1.09,1.29l-0.98,-0.27l-0.33,0.32l0,0l-0.01,-0.63l-0.7,-0.13l-0.42,-1.04l-0.55,0.1l-0.87,-0.79l-0.05,-1.21l-1.08,-0.21l-0.51,-0.69l-2.21,-0.32l-0.65,0.33l-4.62,-1.63l0,0l1.44,-2.48l0.9,-0.44l-1.26,-2.55l-0.64,-0.5l-0.45,0.06l-0.67,-1l-1.45,-0.28l-1.27,-0.98l-1.54,-0.06l-0.96,-0.58l-1.72,-0.29l-5.71,-2.31l-1.01,-0.15l-0.46,0.13l-0.08,0.33h-0.84l-0.76,-0.33l-1.3,-0.67l-1.13,-1.08l-2.9,-3.96l-0.29,0.12l-0.8,2.88l-1.34,-0.58h-1.8l-0.84,-0.38l-0.13,-0.58l-1.8,-0.04l-1.85,1.38l-0.4,-0.54l0,0l-0.24,-0.89l0.36,-0.21l-0.19,-3.09l-1.48,-0.03l-0.4,-0.27l0.44,-0.94l-0.44,-0.77l-0.39,-0.12l0.08,-0.63l-1.04,-0.98l-0.28,-0.85l0.63,-0.83l-1.33,-0.99l-1.57,0.53l-1.55,-1.35l0,-0.26l1.22,-0.41l-0.11,-0.25l-0.55,0.2l0.19,-0.38l1.55,-0.19l0.7,-2.14l-0.03,-0.5l-0.38,0.08l-0.09,-0.25l-0.41,-2.28l0.11,-2.41l0,0l1.92,-1.56l0.15,-0.99l0.91,-0.6l1.69,3.79l0.5,-0.5l-0.23,-2.34l-0.82,-1.07l-0.84,-2.81l0.14,-2.57l0.94,-2.41l-0.33,-1.19l-1.36,0.42l-0.32,-0.15l-0.71,-0.49l-0.98,-1.82l1.1,0.19l-0.08,-0.58l0.86,0.44l0.51,0.41l-0.05,0.41l0.71,0.87l0.71,0.17l0.68,-0.78l0.39,-1l-0.04,-1.63l-1.8,-2.36l0.42,-0.27l1.73,0.32l-0.23,-1.23l-0.62,-0.94l1,-2.14l2.15,-0.92l0.14,-0.78l-0.36,-1.65l0.21,-0.86l0.74,-0.62l0.75,0l1.75,-0.97l0.54,-2.72l0.62,-0.45l0.91,0.2l-0.01,2.04l1.39,0.93l2.68,0.49l0.6,-1.94l0.63,-1.02l0.7,-0.73l1.12,-0.39l0.82,-0.87l0.5,-2.27l-0.18,-1.4l0.2,-0.77l2.11,-0.32l2.48,0.31L450.09,105.51z', 'Sulawesi Tengah', 'sulawesi-tengah', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(27, '73', '7300000000', 'ID-SN', 'M444.71,252.2l1.11,-0.05l1.17,0.37l-0.33,0.47l-0.77,0.12l-3.17,-0.52l-0.44,-0.52l0.41,-0.27L444.71,252.2zM440.44,248.05l1.12,0.55l0.46,-0.28l-0.1,1.28l-1.67,0.22l-0.61,-0.43l-0.22,-0.64l0.15,-1.19L440.44,248.05zM437.32,237.37l-0.42,0.95l-0.34,-1.8l0.2,-1.27l-0.46,-2.48l-0.08,-4.31l0.39,-2.09l0.42,-0.36l1.28,4.46L437.32,237.37zM426.28,161.27l0.4,0.54l1.85,-1.38l1.8,0.04l0.13,0.58l0.84,0.38h1.8l1.34,0.58l0.8,-2.88l0.29,-0.12l2.9,3.96l1.13,1.08l1.3,0.67l0.76,0.33h0.84l0.08,-0.33l0.46,-0.13l1.01,0.15l5.71,2.31l1.72,0.29l0.96,0.58l1.54,0.06l1.27,0.98l1.45,0.28l0.67,1l0.45,-0.06l0.64,0.5l1.26,2.55l-0.9,0.44l-1.44,2.48l0,0l-1.52,0.58l-1.54,1.37l-1.2,-0.15l-1.26,-0.86l0.31,-0.9l-0.6,-1.35l-1.11,0.12l-0.7,0.57l-1.42,-0.94l-1.64,-0.42l0,0l0.42,-0.46l-0.77,-1.11l-4.37,-1.02l-3.47,1.71l-6.39,4.33l1.14,3l1.91,1.21l0.52,0.88l-0.24,4.34l0.57,1.33l0.32,2.23L434.7,194l-0.18,3.35l0.77,1.06l-0.51,3.74l0.67,1.83l0.46,3.2l-0.54,1.82l-1.42,1.21l-0.01,2.37l-0.73,2.79l2.04,3.47l1.24,4.79l-0.83,-0.28l-1.37,-1.77l-4.03,1.45l-2.91,-0.58l-1.3,1.09l-0.25,0.75l-0.92,0.61l-1.93,-0.05l-0.83,-1.41l-2.76,-0.96l-1.9,-2.82l0.41,-3.77l1.58,-2.36l0.87,-2.18l0.08,-0.77l-0.57,-2.35l1.79,-2.95l0.49,-4.11l0.05,-2.35l-0.49,-3.72l-2.59,-4.7l1.17,-2.28l-0.46,-1.39l0,0l-0.93,-3.96l-0.71,-0.67v-0.42l0.38,-0.29l0.38,-0.04l0.21,0.29l0.88,-0.25l0.46,-0.79l0.67,-0.25l1.05,0.04l0.04,-0.38l-1.08,-1.84l0.29,-0.7l-0.36,-0.95l0.2,-1.9l0.32,-0.75l0.75,0.29l1.55,-0.42l0.71,-0.79l0.21,-0.73l1.25,-0.92l0.23,-0.59l-0.3,-1.15l-1.65,-0.69l-0.56,-1.7l-1.52,-0.73l0.04,-1.3l1.78,-1.28l0.59,-0.79l0.72,-0.1l-0.13,-1.22L426.28,161.27z', 'Sulawesi Selatan', 'sulawesi-selatan', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(28, '74', '7400000000', 'ID-SG', 'M446.67,174.2L448.3,174.62L449.72,175.56L450.42,174.99L451.54,174.86L452.13,176.21L451.82,177.12L453.08,177.97L454.28,178.13L455.83,176.75L457.34,176.17L457.34,176.17L461.97,177.81L462.61,177.48L464.83,177.8L465.34,178.48L466.42,178.69L466.47,179.9L467.34,180.69L467.89,180.59L468.31,181.63L469.01,181.75L469.03,182.39L469.03,182.39L468.15,183.61L468.34,184.38L470.52,185.34L471.23,186.5L471.08,186.91L470.72,187.06L468.29,184.88L467.54,184.87L468.26,186.16L467.84,187.42L466.66,187.89L466.63,188.28L467.46,189.6L471.33,192.02L471.94,193.46L472.4,193.76L474.58,193.72L474.68,194.12L474.18,194.48L474.02,195.45L474.68,195.79L474.79,196.15L474.46,196.58L475.03,197.88L477.65,197.83L477.54,197.41L476.7,196.8L476.51,196.38L476.72,196.27L477.35,196.31L478.04,196.8L478.89,199.44L478.76,202.2L477.56,203.16L475.09,201.2L474.79,201.25L474.84,201.81L476.36,203.37L476.44,203.8L475.8,204.29L475.5,203.88L474.94,204.14L474.28,202.82L473.52,202.32L471.44,203.33L470.62,203.23L467.88,203.99L467.13,203.85L465.8,204.59L464.87,204.76L463.9,207.33L464.23,208.41L465.11,209.52L463.86,210.82L462.18,210.86L460.65,210.16L458.59,209.94L457.62,210.11L456.96,209.4L455.39,208.79L453.92,206.77L454.17,204.95L454.92,202.67L454.83,201.25L455.24,200.09L455.75,199.84L456.41,198.42L456.1,196.45L454.78,195.94L452.39,195.59L450.82,193.62L450.36,193.42L450.16,192.56L449.04,192.56L448.02,191.2L443.84,187.49L443.61,186.81L443.94,185.07L445.55,182.88L446.25,182.53L446.86,180.99L446.81,178.67L447.31,177.67L447.27,176.03L446.76,176L446.51,175.21L446.37,175.65L445.8,175.52L446.14,175.86L446.1,176.09L445.79,176.06L445.39,174.93L445.86,175.08z', 'Sulawesi Tenggara', 'sulawesi-tenggara', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(29, '75', '7500000000', 'ID-GO', 'M466.56,109.2L471.23,109.53L474.64,110.52L477.84,112.7L478.95,112.01L479.8,110.79L482.35,110.42L482.35,110.42L482.56,111.24L483.96,111.86L484.66,112.55L484.89,113.87L485.51,114.41L486.72,115.3L488.75,115.65L489.29,116.23L489.6,117.08L489.52,119.17L488.43,121.58L488.43,121.58L486.29,121.61L484.79,121.21L481.67,117.94L481.16,118.32L479.78,118.46L471.35,118.15L464.1,118.41L462.99,119.06L459.61,119.44L458.13,117.77L455.2,117.45L454.47,118.5L451.7,118.82L451.7,118.82L451.98,118.32L451.81,116.85L450.05,116.48L448.72,114.96L449.03,114.79L449.09,113.72L449.43,113.38L450.49,113L451.46,113.38L451.98,113.28L452,112.32L452.35,111.91L453.24,112.42L454.57,112.47L455.05,112.06L456.5,112.05L459.68,110.8L460.47,110.19L461.32,110.05L461.81,110.85L462.72,111.54L463.15,110.62L463.52,110.62L464.04,110.02z', 'Gorontalo', 'gorontalo', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(30, '76', '7600000000', 'ID-SR', 'M421.05,141.06L420.95,143.47L421.36,145.75L421.45,146L421.83,145.92L421.86,146.43L421.17,148.57L419.62,148.76L419.43,149.13L419.98,148.94L420.09,149.18L418.87,149.59L418.88,149.85L420.42,151.19L421.99,150.66L423.32,151.65L422.69,152.48L422.98,153.33L424.02,154.31L423.94,154.94L424.33,155.07L424.77,155.83L424.33,156.77L424.73,157.04L426.21,157.07L426.4,160.17L426.04,160.38L426.28,161.27L426.28,161.27L425.26,161.73L425.39,162.96L424.67,163.05L424.07,163.84L422.3,165.12L422.26,166.42L423.78,167.15L424.34,168.85L425.98,169.54L426.28,170.68L426.05,171.27L424.8,172.19L424.59,172.92L423.87,173.71L422.32,174.13L421.57,173.84L421.24,174.59L421.04,176.49L421.41,177.44L421.11,178.14L422.2,179.97L422.15,180.35L421.1,180.31L420.43,180.56L419.97,181.35L419.09,181.6L418.88,181.31L418.5,181.35L418.13,181.64L418.13,182.06L418.84,182.73L419.77,186.69L419.77,186.69L416.37,185.63L415.11,186.73L412.2,186.96L410.02,188.14L408.49,184.17L408.45,179.57L409.38,176.43L408.99,175.76L408.04,175.59L407.33,175.92L407.14,174.39L407.88,172.04L408.25,171.81L408.95,172.37L409.66,172.37L411.4,171.22L413.79,168.86L413.47,165.99L414.89,161.44L415.8,160.58L416.53,160.34L417.11,160.61L417.7,158.33L416.93,157.51L416.46,155.79L416.91,154.21L416.35,150.74L417.04,150L416.65,148.44L417.39,146.95L419.14,145.44L420.11,142.08z', 'Sulawesi Barat', 'sulawesi-barat', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(31, '81', '8100000000', 'ID-MA', 'M584.56,269.25l-1.56,-0.07l-1.47,-0.72l-0.16,-0.33l1.05,-0.38l1.36,0.07l1.03,0.51l0.06,0.52L584.56,269.25zM564.29,266.37l1.84,0.65h2.6l0.47,0.52l-1.77,1.72l-3.85,-1.42l-0.68,-1.31L564.29,266.37zM615.5,270.73l-0.67,0.05l-0.01,-0.23l1.59,-1.72l1.23,-0.67l1.49,-1.98l2.85,0.71l-0.63,0.62l-3.16,1.22l-1.08,0.77l-0.15,0.44L615.5,270.73zM597.56,265.67l-1.26,-0.3l-1.91,-2.34l0.01,-1.12l0.38,-0.68l1.63,-0.22l2.44,0.87l0.34,1.44L597.56,265.67zM544.84,258.92l0.81,0.01l0.43,1.34l-1.41,0.06l-1.68,0.51l-1.87,1.83l-1.47,0.78l-6.17,-0.8l-2.3,0.48l-2.23,1.79l-0.48,-0.19l0.7,-2.67l2.76,-3.36l3.69,1.09l2.65,-0.46l1.24,-1.07l3.59,-1.17l0.29,0.82L544.84,258.92zM556.51,258.57l-0.6,0.06l-0.24,-0.41l0.37,-2l0.36,-0.23l1.69,0.55l0.06,0.26l-0.13,0.7L556.51,258.57zM620.15,256.14l-1.34,-0.42l-0.23,-0.53l0.31,-0.48l3.07,-0.29L620.15,256.14zM631.69,250.9l-1.11,0.24l-0.61,0.5l0.67,3.98l-0.85,2.56l-1,1.3l-2.96,2.18l-0.99,1.6l-0.26,1.6l-0.46,0.24l-3.36,-0.52l-0.42,-2.3l1.82,-3.14l-0.23,-0.51l1.05,-2.85l2.57,-2.05l1.23,-1.49l1.36,-2.4l0.76,-0.41l1.3,-0.14l0.98,0.49L631.69,250.9zM634.93,249.14l1.05,1.98l-0.45,0.57l-0.84,-0.58l-0.41,-0.89l-0.99,-0.18l-1.17,0.26l-0.65,-0.32l0.39,-0.68L634.93,249.14zM578.32,250.89l-0.49,0.17l-1.51,-0.94l-0.17,-0.62l1.54,-1.1l1.39,0.76L578.32,250.89zM686.38,236.06l-1.65,3.67l-0.73,-0.17l0.4,1.42l-0.66,0.2l-0.79,1.72l-0.83,0.5l-0.56,-0.43l0.07,-0.46l0.5,-0.46l0.79,-2.21l-0.53,-0.26l-0.23,-1.39l1.39,-0.73l0.13,-0.96l0.69,-0.33l1.29,-1.32l0.83,0.33L686.38,236.06zM649.59,228.88l-0.61,0.25l-1.26,-0.69l-0.18,-3.39l-0.37,-1.68l1.12,-0.32l1.81,3.45v1.13L649.59,228.88zM683.44,224.49l0.5,2.11l-0.63,0.13v0.3l1.32,0.66l-0.03,0.33l-0.56,0.36l-0.76,-0.33l0.36,1.42l-0.63,0.07l-0.63,-0.5l-0.17,0.43l2.05,1.95l-0.66,3.24l-0.66,1.12l-1.98,0.76l0.36,0.99l0.53,0.33l-0.07,0.5l-1.09,0.99l-0.89,-0.26l-0.33,0.17l-0.23,0.56l0.1,0.33l0.5,-0.17l-0.03,0.5l-0.63,1.02l-2.02,1.98l-0.03,0.66l-0.5,0.63l-2.35,1.22l-0.46,-0.05l-0.36,-0.89l-0.33,-0.3h-0.69l-0.76,-1.32l0.59,-2.08l0.23,-3.11l0.56,-2.18l-0.56,-3.27l0.66,-0.07l-0.43,-1.19l0.23,-1.06l0.43,-0.36l0.17,0.5l1.26,-0.26l0.3,0.83l0.79,-0.56l0.53,-1.32l-0.46,-0.79l1.42,-1.98l-0.36,-0.36l-0.5,0.3l-0.73,-0.59l-0.83,-0.1l-0.5,-0.53l0.07,-0.33l0.63,-0.69l1.36,0.66l1.29,-0.99l0.63,-1.65l0.76,-0.5l0.03,-1.95l0.89,-1.22l0.63,-0.17l1.82,2.28l0.46,0.99l0.03,1.12l0.83,1.06l-0.07,0.5L683.44,224.49zM652.71,227.67l-2,2.33l1.6,-5.32l0.93,-1.16l2.22,-5.58l0.98,-0.09l0.33,0.7l-1.35,4.39l-1.39,1.15l-1.17,1.6l-0.28,1.01L652.71,227.67zM576.04,188.89l-2.08,0.41l0.12,-1.69l0.53,-0.39l1.21,0.12l0.92,0.91L576.04,188.89zM577.78,187.24l0.82,0.29l0.36,-0.65l0.26,0.03l0.29,1.97l-1.67,0.12l-1.23,-1.99l0.49,-0.23L577.78,187.24zM572.79,189.04l-0.64,1.16l-1,0.84l-2.11,0.61l-0.38,-0.04l2.03,-2.16l-0.28,-0.12l-3.66,2.28l-0.75,-0.05l-0.42,-0.53l-0.03,-0.84l0.9,-0.99l1.08,-0.69l2.71,-0.52l0.77,-0.95l0.71,-0.29l1.27,0.7L572.79,189.04zM560.64,184.56L558.7,184l-0.69,-0.68l0.75,-0.6l0.78,0.1l1.4,1.54L560.64,184.56zM563.07,182.65l-1.74,-0.01l-0.6,-0.5l1.21,-1.1l0.83,-0.13l0.58,0.46l-0.04,1.13L563.07,182.65zM549.59,180.77l1.87,1.18l0.21,0.97l-1.03,-0.05l-0.22,0.36l0.2,0.74l0.75,0.68l0.84,-0.53l2,0.66l-0.41,4.13l-0.34,0.63l-1.93,0.17l-4.13,2.02l-3,0.93l-5.38,-2.15l-2.42,-1.63l-3.43,-3.25l-0.47,-1.3l-0.14,-2.87l0.27,-0.56l1.23,-0.84l0.41,0.09l1,1.08l0.61,0.03l1.23,-1.13l2.29,-0.6l5.55,-0.22l1.55,0.26L549.59,180.77zM598.06,176.69l3.87,1.54l5.5,-0.32l0.66,0.17l3.68,2.61l0.71,1.81l0.27,2.27l0.45,0.52l2.04,0.17l0.64,0.64l0.82,2.39l-0.07,0.62l-0.6,0.85l-0.1,3.35l-3.7,-1.45l-1.01,-1.06l-2.76,-1.61l-4.57,-1.54l-2.47,-1.26l-0.56,-0.74l-0.03,-0.85l-1.19,-0.76l-6.44,-0.64l-0.29,0.32l0.12,0.54l0.92,1.42l-0.25,0.57l-0.47,0.12l-4.71,-0.98l-2.38,-1.08l-2.88,0.12l-0.32,-0.26l0.85,-1.01l0.04,-0.67l-0.69,-0.49l-0.88,-0.13l-1.92,1.21l-2.74,2.7l-2.47,0.42l-1.14,-0.69l-1.76,-2.61l-1.47,-0.99l-0.62,-2.36l-0.69,0.02l-0.78,0.79l-0.62,1.51l-0.33,2.23l-0.46,0.64l-0.43,0.11l-0.93,1.67l-0.33,1.39l-0.16,-0.25l-0.25,-1.04l0.52,-1.15l0.12,-1.25l-0.87,-1.35l-0.45,-1.37l2.21,-1.72l3.26,-3.96l11.76,0.15l2.13,-0.48l0.88,-0.71l0.36,0.03l0.45,0.55l-0.03,1.35l1.08,0.93l1.38,-0.29l2.31,-1.47l0.5,-0.96l2.61,-0.37l4.22,1.56L598.06,176.69z', 'Maluku', 'maluku', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(32, '82', '8200000000', 'ID-MU', 'M533.6,169.24l-0.51,0.08l-1,-0.88l-0.6,-2.36l-0.89,-1.29l-0.62,-2.48l0.44,-1.09l0.61,-0.63l0.59,0.08l0.79,0.69l-0.54,2.5l2.04,4.47L533.6,169.24zM522.63,157.74l3.77,0.32l1.85,-0.49l3.94,-0.12l6.23,0.53l-0.25,0.38l-1.41,0.6l-13.59,1.08l-2.19,-1.19l-0.01,-0.83l0.63,-0.73l0.59,-0.09L522.63,157.74zM514.32,155.93l0.97,0.34l1.85,-0.5l2.98,0.71l0.48,0.98l0.03,1.67l-2.77,-0.21l-1.8,0.27l-0.97,0.93l-2.51,-0.82l-4.86,1.81l-2.91,0.23l-1.33,-2.3l-0.02,-1.07l0.7,-2.15l0.48,-0.55l2.34,-0.46l1.81,-0.01L514.32,155.93zM564.91,151.22l4.53,2.77l0.31,0.94l-0.36,0.76l-1.37,0.52l-6.1,-0.48l-1.14,0.66l-1.66,0.25l-1.94,-0.89l-0.93,-0.97l0.81,-3.32l0.3,-0.34l0.32,0.25l2.91,-1.8l1.61,0.31L564.91,151.22zM560.33,148.31l-2.06,0.19l-0.67,-0.63l1.56,-1.04l1.8,0.72L560.33,148.31zM555.2,140.35l-0.7,0.24l-2.02,-0.46l-0.11,-0.69l0.82,-2.08l0.87,-0.01L555.2,140.35zM559.58,132.22l1.94,2.51l-0.31,0.95l-1.08,1.48l0.78,1.63l0.54,0.31l1.86,-0.56l1.1,0.49l0.77,1.02l-0.06,0.51l-1.34,1.1l-1.06,0.29l-1.36,-0.58l-1.21,-1.47l-2.12,0.9l-0.44,-0.15l-0.95,-3.27l-1.72,-1.82l-0.23,-1.01l0.53,-1.97l0.87,-0.22l0.72,0.64l1.19,-0.26l0.88,-0.71L559.58,132.22zM552.86,135.79l-1.15,-0.07l-0.16,-0.44l-0.02,-3.52l0.65,-0.47l1.6,-0.17l0.4,0.46l0.38,1.67l-0.46,2L552.86,135.79zM564.76,95.65l1.22,0.2l0.96,0.87l0.69,3.85l-0.82,2.98l-1.41,2.47l-4.43,3.2l-0.39,0.59l0.05,1.02l0.42,0.71l2.36,1.48l0.86,-0.13l1.26,-0.95l0.2,-2.27l0.79,-1.33l1.11,-0.85l1.66,0.03l0.57,-0.29l0.49,-1.03l-0.15,-0.47l-0.75,-0.31l-0.21,-0.82l1,-1.59l3.22,-2.23l1.17,-0.49l3.21,-0.71l1.67,0.35l-0.47,7.82l-0.58,0.67l-3.78,2.21l-2.54,0.74l-1.49,1.48l-0.01,0.44l0.42,0.85l1.94,1.43l4.13,1.49l1.5,0.13l0.32,2.48l-0.17,0.88l0.66,0.48l1.87,0.5l0.78,0.64l0.53,1.02l-1.56,-0.9l-4.69,-1.1l-1.57,-1.32l-2.99,0.19l-1.14,-0.3l-0.93,-0.82l-1.5,-0.26l-2.01,-0.18l-0.63,0.38l-0.73,2.66l0.48,0.38l0.3,2.37l-0.69,1.13l0.04,1.35l2.61,6.84l3.05,5.1l3.26,3.24l-2.58,-0.27l-0.38,-0.36l0.13,-0.35l-1.73,-1.32l-2.03,-1.05l-2.8,-5.4l-2.42,-1.36l-0.95,-1.46l0.64,-4.83l-0.22,-2.24l-0.55,-2.46l-1.48,-1.24l-0.84,-3.27l0.39,-1.96l0.73,-0.76l0.54,-1.08l-0.08,-0.52l-1.85,-0.55l-0.2,-0.3l0.26,-0.98l-0.47,-1.64l-1.4,0.26l-0.13,-0.39l0.11,-2.59l2.16,-3.91l-0.02,-1.38l0.75,-3.76l2.14,-3.19l3.77,-4.02l0.66,-0.56l1.85,-0.01l-0.24,1.12l-1.61,2.44l-1.58,1.19l-0.09,1.56L564.76,95.65zM575.61,91.47l-1.92,0.09l-1.91,0.47l-0.54,-1.42l-0.23,-3.54l1.98,-3.1l1.5,-1.46l2.22,-1.05l2.13,2.63l0.15,0.79l-1.28,3.75l-0.89,1.6L575.61,91.47z', 'Maluku Utara', 'maluku-utara', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(33, '91', '9100000000', 'ID-PB', 'M663.38,199.77l0.76,0.9l-5,-2.24l-0.16,-1.15L663.38,199.77zM604.91,162.17l-1.23,0.04l-3.61,-1.07l-3.03,-1.57l-0.33,-0.42l0.58,-0.54l4.95,-1.98l5.41,-1.05l1.41,2.5l0.06,2.57l-0.94,0.62L604.91,162.17zM600.4,147.5l-1.71,0.55l-1.58,-0.54l0.42,-0.67l1.8,-0.5l1.55,0.52L600.4,147.5zM617.15,142.02l0.59,0.77l1.75,-0.42l0.69,1.04l-0.05,1.91l-0.58,2.67l-0.72,1.64l-0.61,0.38l-1.5,-0.28l-2.04,-1.69l-1.1,-2.06l0.35,-0.54l-0.27,-0.73l-1.01,-1.06l0.43,-0.44L617.15,142.02zM617.46,140.29l-0.45,0.77l-1.64,0.7l-2.22,0.47l-3.3,0.05l-1.38,0.3l1.54,-1.52l4.17,-0.12l1.33,-0.3l0.63,-0.7l0.79,0L617.46,140.29zM612.08,136l-2.44,-0.27l-0.16,-0.97l2.74,-1l0.8,0.28l0.59,0.71l-0.45,0.75L612.08,136zM663.43,139.65l3.04,0.05l0.08,-0.56l3.91,0.1l2.24,1.81l-1.41,2.26l1.69,3.19l1.35,1.19l1.31,2.39l-0.79,0.87l-0.24,2.51l-2.3,2.07l0.59,3.54l0.39,0.86l-0.21,2.02l0.46,4.6l1.09,1.87l0.53,0.18l1.15,1.14l2.47,6.13l0.55,0.02l0.54,-0.46l-0.9,-3.57l0.19,-1.76l0.94,-0.96l1.77,0.89l0.26,0.91l0.1,4.32l0,0l-2.48,2.27l-1.55,0.81l-0.24,1.95l-1.63,0.97l-0.98,1.22l-1.14,2.52l3.35,1.38l6.45,1.87l8.49,3.09l-2.29,2.84l-1.71,3.01l-1.06,0.81l-1.64,2.37l0,0l-1.16,-0.49l-2.68,-2.25l0.65,-3.04l0.43,-0.22l2.5,0.31l1.04,0.45l0.93,-0.67l-5.1,-0.45l-0.96,0.74l-0.34,0.9l-1.31,0.28l-1.53,-1.94l-1.16,-0.28l-0.45,1.63l-0.64,0.33l-2.08,-1.31l-0.35,-0.72l0.52,-1.11l-0.88,-1.21l-0.25,-0.11l-1.74,0.91l-1.75,-0.94l-1.6,-2.78l-0.63,0.44l0.14,0.98l-0.44,0.1l-1.23,-0.78l-1.24,-2.73l1.1,-1.04l-0.2,-2.35l0.44,-1.45l2.55,-1.9l0.03,-1.29l-0.58,-0.79l-2.94,3.01l-0.28,4.72l-1.71,0.85l0.79,1.27l-0.07,0.58l-3.22,2.83l0.12,1.2l0.6,0.52l0.17,0.64l-3.7,3.57l-3.27,-0.25l-0.99,0.96l-1.36,-0.34l-1.67,-2.78l0.2,-0.16l-0.16,-0.61l-1.16,-2.99l0.56,-1.47l1.83,-0.66l0.66,-0.68l-0.77,-1.44l-0.56,0.06l-0.47,-0.38l-0.37,-1.4l0.3,-1.14l-0.91,-0.63l-0.6,0.24l-0.17,1.04l-1.01,-0.31l-1.16,-1.56l-0.08,-0.85l-0.62,-1.18l-1.58,-1.24l-3.33,-1.83h-1.44l-1.9,0.49l-2.14,-3.1l3.14,-1.61l3.1,-0.19l4.4,0.6l2.6,1.72l2.07,-1.49l3.05,-4.02l1.51,-0.87l2.42,-0.49l1.1,0.53l1.32,1.27l2.08,0.76l1.71,-0.47l0.76,0.09l0.51,0.73l0.01,2.26l0.25,-0.34l0.22,-3.13l0.61,0.12l1.31,2.34l0.07,-2.02l-0.29,-0.8l-0.39,-0.24l1.02,-0.97l1.28,-0.61l0.71,-1.04l-0.15,-2.04l-0.4,1.05l-1.47,0.49l-0.88,-0.75l2.72,-1.48l-0.2,-1.15l-1.01,0.17l-3.98,2.12l-3.59,0.03l-2.43,-0.65l-1.67,0.22l-4.11,1.28l-1.09,-0.07l-1.44,-0.62l-2.21,1.04l-0.88,-0.43l-0.4,-1.01l-0.71,-0.6l-2.05,0.52l-1.09,0.68l-1.63,0.15l-2.47,-2.01l-1.99,-1.13l-1.9,-3.61l-0.07,-1.12l0.76,-0.83l-0.25,-0.93l-1.28,-1.13l-2.76,-1.04l-0.31,-0.65l-1.98,-0.92l-5.48,-1.83l0.98,0.94l0.04,0.38l-0.78,0.65l-1.38,0.5l-0.52,-0.85l-1.15,-0.45l-1.07,0.06l-1.48,-0.9l1.66,-2.74l2.06,-0.42l1.21,-2.1l0.64,-3.07l-0.53,-1.64l4.46,-1.52l1.12,0.48l5.11,-1.18l0.78,-1.22l3.25,-2.69l2.83,-1.42l2.84,-0.68l4.83,0.39l6.95,2.92l1.01,0.09l3.48,3.04L663.43,139.65zM616.77,127.03l2.85,0.81l1.68,0.16l2.77,1.58l0.39,1.82l-1.15,1.97l-1.49,-0.83l-1.1,-0.1l-2.22,0.52l-1.77,-1.94l-1.46,-0.58l-1.77,-2.36l-1.29,0.15l0.22,0.83l1.75,1.85l3.28,1.31l0.44,0.74l-0.47,0.76l-1.17,0.55l-1.54,0.21l-0.87,-0.61l-0.5,-1.96l-1.58,0.35l-0.8,0.73l-0.53,-1.92l-1.45,0.36l-1.19,-0.14l-2.43,-0.96l0.35,-0.22l2.52,0.39l0.75,-0.41l-0.48,-0.82l-1.07,0.03l0.11,0.62l-0.85,-0.19l-0.35,-0.64l0.13,-0.56l7.18,-1.2l0.36,0.26l0.84,-0.07l-0.29,-0.27l0.56,-0.34L616.77,127.03zM593.89,130.37l-0.32,0.15l-4.26,-4.56l0.84,0.35l3.54,2.85l0.39,0.68L593.89,130.37z', 'Papua Barat', 'papua-barat', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(34, '94', '9400000000', 'ID-PA', 'M755.3,271.78l-5.32,-0.63l-0.57,-0.75l2.81,-2.6l1.94,-0.43l1.55,3.59L755.3,271.78zM750.41,269.05l-2.6,2.13l-2.65,0.84l-1.5,-0.56l-5.96,-0.4l-2.85,0.69l-0.51,0.35l-0.5,0.06l-0.24,-0.42l1.67,-4.74l3.07,-5.93l2.48,-3.53l2.98,-2.1l2.44,-0.96l4.78,-0.89l2.12,0.11l1.16,0.55l1.67,2.43l1.32,0.25l0.62,0.98l-0.96,2.7l-1.18,1.89l-0.54,2.73l-1.72,1.79l-1.99,0.44L750.41,269.05zM750.85,242.54l0.61,0.5l1.3,0.24l0.82,1.21l-0.99,0.62l-0.75,-0.28l-1.16,-1.53l-0.13,-0.51L750.85,242.54zM710.46,155.72l2.86,0.57l5.96,0.44l1.68,0.84l-0.43,0.46l-3.22,0.55l-2.54,0.83l-5.61,-0.5l-4.02,-0.96l-1.92,-1.1l-2.55,-0.77l-4.23,-0.46l-1.08,-1.28l0.93,-0.28l1.17,0.38l11.08,0.79L710.46,155.72zM754.93,160.39l1.2,0.01l1.96,0.66l12.71,6.22l1.79,0.26l2.55,-0.31l1.28,-0.61l0.99,0.06l0.86,1.38l1.91,0.88l0.92,-0.17l0.1,-0.27l1.66,0.03l2.67,0.39l1.57,0.56l0.46,0.67l-0.83,1.47l0.46,0.38l1.67,-0.47l3.15,0.07v64.11l-0.68,0.07l-0.67,1.97l0.33,0.85l-1.46,2.27l-0.07,0.81l0.21,1.87l0.55,1.2l0.81,0.83l0.98,-0.18l0.02,38.79l-2.86,-1.43l-1.46,-1.85l-2.57,-2.39l-1.82,-2.97l-7.82,-6.31l-1.15,-1.31l-0.05,-0.97l1.38,-1.15l1.49,-3.22l-1.63,0.71l-0.24,2.21l-2.15,1.05l-5.11,0.18l-1.58,0.91l-2.82,0.51l-0.7,-0.08l-0.87,-0.55l-1,-1.4l-2.32,0.88l-1.91,1.4l-0.6,1.29l-0.5,0.06l-1.27,-2.92l1.17,-1.61l0.12,-2.16l1.4,-0.79l0.21,-1.85l0.89,-2.23l0.66,-0.7l0.02,-0.51l-2.78,-1.7l-1.23,-2.2l-3.32,-1.95l-0.15,-0.4l4.71,0.03l2,0.85l2.17,-0.22l0.81,-1.32l-1.05,0.7l-2.06,0.19l-3.37,-1.03l-1.71,-0.78l-2.89,-2.55l-0.32,-0.95l0.61,-0.49l2.48,0.33l1.1,-0.71l1.8,-0.22l1.28,0.44l2.14,1.76l1.38,-0.05l-1.69,-0.59l-1.77,-1.41l-1.8,-0.45l-3.47,-1.82l-0.26,-1.09l0.66,-0.19l-3.86,-3.9l-1.27,-2.16l-0.75,-3.38l-1.2,-2.22l0.02,-2.02l-1.48,-0.41l-0.76,-0.66l0.41,-0.6l2.77,-1.35l-0.64,-0.17l-1.61,0.25l-0.99,0.57l-1.61,0.23l-0.32,-1.8l0.22,-3.76l-0.5,0.88l-1.52,-0.57l-4.94,-3.51l-1.52,-0.61l0.32,-0.57l-1.3,-0.01l-1.89,-0.85l-2.43,-2.05l-1,0.44l-3.58,-1.01l-3.13,-0.41l-8.01,-4.27l-1.76,0.02l-3.86,-1.56l-1.09,-1.33l-0.76,-0.31l-3.53,0.05l-5.17,-1.12l-3.34,0.52l-6.29,-3.14l0,0l1.64,-2.37l1.06,-0.81l1.71,-3.01l2.29,-2.84l-8.49,-3.09l-6.45,-1.87l-3.35,-1.38l1.14,-2.52l0.98,-1.22l1.63,-0.97l0.24,-1.95l1.55,-0.81l2.48,-2.27l0,0l0.61,2.49l0.47,0.36l1.38,-0.63l0.41,-0.86l0.45,0.04l-0.07,1.85l-0.49,0.45l-0.17,1.43l1.11,2.15l2.05,1.51l2.13,0.55l3.73,0.43l2.22,-0.42l1.63,-1.11l0.23,-1l0.64,-0.78l1.86,-0.74l0.92,-0.73l-0.45,-0.58l0.4,-0.51l2.48,-1.07l0.51,-0.79l0.32,-2.73l1.23,-1.46l2.71,-1.14l1.25,-1.01l1.51,-3.6l-0.14,-1.45l0.39,-0.49l0.91,-0.63l1.27,-0.1l0.87,0.05l0.24,0.41l0.96,0.24l2.63,-0.03l4.11,-1.99l1.31,-0.41l2.1,-0.1l0.83,-0.81l-0.64,-1.8l-0.63,-0.29l-0.91,-1.04l0.19,-1.23l3.88,-1.57l4.49,-2.61l4.17,-1.47l1.48,0.26l2.24,2.02l6.1,2.16l4.19,1l1.53,0.96l0.76,1.02L754.93,160.39zM686.74,146.26l-0.97,-0.01l-1.13,-1.66l0.19,-1l0.5,-0.67l0.81,-0.05l0.73,0.35l1.08,1.11l-0.08,1.04l-0.49,0.69L686.74,146.26zM696.37,138.25l3.32,0.28l1.62,1.07l0.97,-0.75l0.54,-0.07l3.69,2.93l2.23,3.23l1.25,-0.22l2.08,1.13l-2.1,1.44l-1.85,0.4l-1.04,-0.02l-1.35,-0.8l-2.34,0.19l-0.88,-0.87l-0.78,-3.16l0.03,-0.92l-0.57,-1.23l-0.5,-0.05l-1.81,0.86l-1.79,-1.52l-0.66,-0.15l0.08,0.54l-0.42,-0.16l-1,-0.95l-0.62,-1.33l0.26,-0.49L696.37,138.25z', 'Papua', 'papua', 0, 2, 0, '0000-00-00 00:00:00', NULL, '0000-00-00 00:00:00'),
	(36, 'hshh1', 'h1', NULL, NULL, 'h1', NULL, 1, 2, 1, '2018-12-07 18:09:54', NULL, '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ref_province` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_status_publish
CREATE TABLE IF NOT EXISTS `ref_status_publish` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `id_ref_delete` smallint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.ref_status_publish: ~2 rows (approximately)
/*!40000 ALTER TABLE `ref_status_publish` DISABLE KEYS */;
INSERT INTO `ref_status_publish` (`id`, `name`, `id_ref_delete`) VALUES
	(1, 'Unpublish', 0),
	(2, 'Publish', 0);
/*!40000 ALTER TABLE `ref_status_publish` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_tags
CREATE TABLE IF NOT EXISTS `ref_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Tags',
  `name` varchar(50) DEFAULT '' COMMENT 'Nama Tags',
  `uri_path` varchar(50) DEFAULT '' COMMENT 'Uri Path',
  `id_ref_delete` smallint(3) NOT NULL DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table cms_deptech.ref_tags: ~0 rows (approximately)
/*!40000 ALTER TABLE `ref_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_tags` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.ref_web_config
CREATE TABLE IF NOT EXISTS `ref_web_config` (
  `id` smallint(3) NOT NULL AUTO_INCREMENT COMMENT 'ID Active',
  `name` varchar(30) NOT NULL COMMENT 'Nama Status Aktif',
  `value` text NOT NULL,
  `is_image` smallint(1) NOT NULL DEFAULT '0',
  `id_ref_delete` smallint(3) NOT NULL COMMENT 'ID Status Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table cms_deptech.ref_web_config: ~13 rows (approximately)
/*!40000 ALTER TABLE `ref_web_config` DISABLE KEYS */;
INSERT INTO `ref_web_config` (`id`, `name`, `value`, `is_image`, `id_ref_delete`) VALUES
	(1, 'email', 'tarbiyahptiq@gmail.com ', 0, 0),
	(2, 'phone', '021-759 169 1', 0, 0),
	(3, 'address', 'Jl. Batan 1 No. 2 Lebak Bulus ', 0, 0),
	(4, 'footer_copyright', '© Copyright Fakultas Tarbiyah ', 0, 0),
	(5, 'header_logo', 'images/logo@2x.png', 1, 0),
	(6, 'header_logo_name', 'Fakultas Tarbiyah <br>Intitut PTIQ Jakarta', 0, 0),
	(7, 'footer_logo', 'images/logo-f1.png', 1, 0),
	(8, 'footer_subscribe', 'Subscribe now and receive weekly newsletter with educational materials, new courses, interesting posts, popular books and much more!', 0, 0),
	(9, 'dosen_pai_header', 'Staf Dosen', 1, 0),
	(10, 'dosen_pai_subheader', 'Vut sagittis a, magna ridiculus! Scelerisque parturient! Cum duis nunc in, dignissim, porta porta enim, proin', 1, 0),
	(11, 'dosen_piaud_subheader', 'Vut sagittis a, magna ridiculus! Scelerisque parturient! Cum duis nunc in, dignissim, porta porta enim, proin', 1, 0),
	(12, 'dosen_piaud_header', 'Staf Dosen', 1, 0),
	(13, 'maps_iframe', '<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d11216.898255925085!2d106.77228020662959!3d-6.293613057626703!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x36b42fd414c5904c!2sInstitut%20PTIQ%20Jakarta!5e0!3m2!1sid!2sid!4v1572757088228!5m2!1sid!2sid" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>', 0, 0);
/*!40000 ALTER TABLE `ref_web_config` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.slideshow
CREATE TABLE IF NOT EXISTS `slideshow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_status_publish` smallint(3) NOT NULL DEFAULT '1',
  `slideshow_title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `img` varchar(70) DEFAULT NULL,
  `publish_date` date DEFAULT NULL,
  `url` varchar(70) DEFAULT NULL,
  `is_delete` smallint(3) NOT NULL DEFAULT '0',
  `user_id_create` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `user_id_modify` int(11) DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL,
  `position` smallint(6) NOT NULL DEFAULT '0',
  `is_background` smallint(3) NOT NULL DEFAULT '0',
  `sort` int(11) DEFAULT NULL,
  `is_box` smallint(3) NOT NULL DEFAULT '0',
  `color` varchar(50) DEFAULT NULL,
  `background` varchar(50) DEFAULT NULL,
  `description2` varchar(255) NOT NULL,
  `menu` varchar(40) NOT NULL,
  `id_parent_language` int(11) DEFAULT NULL,
  `id_language` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_status_publish` (`id_status_publish`),
  KEY `id_language` (`id_language`),
  KEY `id_parent_language` (`id_parent_language`),
  CONSTRAINT `slideshow_ufbk2` FOREIGN KEY (`id_parent_language`) REFERENCES `ref_language` (`id`),
  CONSTRAINT `slideshow_ufbk3` FOREIGN KEY (`id_language`) REFERENCES `ref_language` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.slideshow: ~0 rows (approximately)
/*!40000 ALTER TABLE `slideshow` DISABLE KEYS */;
/*!40000 ALTER TABLE `slideshow` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.social_media
CREATE TABLE IF NOT EXISTS `social_media` (
  `id` int(7) NOT NULL COMMENT 'ID Sosial Media',
  `name` varchar(70) NOT NULL COMMENT 'Nama Sosial Media',
  `url` varchar(70) NOT NULL COMMENT 'URL',
  `description` varchar(255) DEFAULT NULL COMMENT 'Deskripsi',
  `img` varchar(80) NOT NULL COMMENT 'Gambar',
  `id_ref_status_publish` smallint(3) NOT NULL COMMENT 'ID Status Publish',
  `id_ref_language` smallint(3) DEFAULT NULL COMMENT 'ID Language',
  `id_ref_delete` smallint(3) DEFAULT '0' COMMENT 'ID Status Data',
  `id_ref_auth_user_create` int(11) NOT NULL COMMENT 'ID Auth User Create ',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.social_media: ~0 rows (approximately)
/*!40000 ALTER TABLE `social_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_media` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.top_news
CREATE TABLE IF NOT EXISTS `top_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Top News',
  `id_ref_news` int(11) DEFAULT NULL COMMENT 'ID News',
  `id_ref_news_category` int(11) DEFAULT NULL COMMENT 'ID News Category',
  `sort` int(11) DEFAULT NULL COMMENT 'Sortir',
  `is_featured` smallint(3) DEFAULT NULL,
  `id_ref_delete` smallint(3) DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime DEFAULT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) DEFAULT NULL COMMENT 'ID Auth User Create',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  PRIMARY KEY (`id`),
  KEY `id_news` (`id_ref_news`,`id_ref_news_category`),
  KEY `top_news_ufbk2` (`id_ref_news_category`),
  CONSTRAINT `top_news_ufbk1` FOREIGN KEY (`id_ref_news`) REFERENCES `ref_news` (`id`),
  CONSTRAINT `top_news_ufbk2` FOREIGN KEY (`id_ref_news_category`) REFERENCES `ref_news_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table cms_deptech.top_news: ~0 rows (approximately)
/*!40000 ALTER TABLE `top_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_news` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.top_news_log
CREATE TABLE IF NOT EXISTS `top_news_log` (
  `id` int(11) NOT NULL COMMENT 'ID Top News Log',
  `id_ref_news` int(11) DEFAULT NULL COMMENT 'ID News',
  `id_ref_news_category` int(11) DEFAULT NULL COMMENT 'ID News Category',
  `sort` int(11) DEFAULT NULL COMMENT 'Sortir',
  `is_featured` smallint(3) DEFAULT NULL COMMENT 'Is Feature',
  `id_ref_delete` smallint(3) DEFAULT '0' COMMENT 'ID Status Data',
  `create_date` datetime DEFAULT NULL COMMENT 'Tanggal Dibuat',
  `id_ref_auth_user_create` int(11) DEFAULT NULL COMMENT 'ID Auth User Create',
  `modify_date` datetime DEFAULT NULL COMMENT 'Tanggal Perubahan',
  `id_ref_auth_user_modify` int(11) DEFAULT NULL COMMENT 'ID Auth User Modify',
  KEY `id_news` (`id_ref_news`,`id_ref_news_category`,`id_ref_delete`),
  KEY `top_news_log_ufbk2` (`id_ref_news_category`),
  KEY `top_news_log_ufbk3` (`id_ref_delete`),
  CONSTRAINT `top_news_log_ufbk1` FOREIGN KEY (`id_ref_news`) REFERENCES `ref_news` (`id`),
  CONSTRAINT `top_news_log_ufbk2` FOREIGN KEY (`id_ref_news_category`) REFERENCES `ref_news_category` (`id`),
  CONSTRAINT `top_news_log_ufbk3` FOREIGN KEY (`id_ref_delete`) REFERENCES `ref_delete` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table cms_deptech.top_news_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `top_news_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_news_log` ENABLE KEYS */;

-- Dumping structure for table cms_deptech.user_activity_log
CREATE TABLE IF NOT EXISTS `user_activity_log` (
  `id` int(11) NOT NULL COMMENT 'ID User Activity Log',
  `id_ref_auth_user` int(11) NOT NULL COMMENT 'ID Auth User',
  `id_ref_log_category` int(11) DEFAULT NULL COMMENT 'ID Log Category',
  `id_ref_news` int(11) DEFAULT NULL COMMENT 'ID News',
  `create_date` datetime NOT NULL COMMENT 'Tanggal Dibuat',
  `last_date_read` datetime DEFAULT NULL COMMENT 'Tanggal Terakhir',
  `log_count` int(11) DEFAULT NULL COMMENT 'Log Count',
  `id_ask_expert` int(11) DEFAULT NULL COMMENT 'ID Ahli Pertanyaan ',
  KEY `id_user` (`id_ref_auth_user`,`id_ref_log_category`),
  KEY `id_news` (`id_ref_news`),
  CONSTRAINT `user_activity_log_ufbk1` FOREIGN KEY (`id_ref_auth_user`) REFERENCES `ref_auth_user` (`id`),
  CONSTRAINT `user_activity_log_ufbk2` FOREIGN KEY (`id_ref_news`) REFERENCES `ref_news` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table cms_deptech.user_activity_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `user_activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_activity_log` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

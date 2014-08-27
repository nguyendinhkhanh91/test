-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 27, 2014 at 06:34 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 NOT NULL,
  `body` text CHARACTER SET utf8 NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `body`, `created`, `modified`) VALUES
(9, 1, 'A title once again 1', 'And the post body follows.', '2014-08-26 09:43:50', '2014-08-27 05:18:00'),
(14, 1, 'A title once again', 'And the post body follows.', '2014-08-26 10:03:48', '2014-08-26 10:03:48'),
(16, 1, 'A title once again', 'And the post body follows.', '2014-08-26 10:11:01', '2014-08-26 10:11:01'),
(17, 1, 'A title once again', 'And the post body follows.', '2014-08-26 10:11:08', '2014-08-26 10:11:08'),
(22, 1, 'this is post title', 'this is post content', '2014-08-26 10:16:15', '2014-08-26 10:16:15'),
(23, 1, 'this is post title', 'this is post content', '2014-08-26 10:18:36', '2014-08-26 10:18:36'),
(24, 1, 'this is post title', 'this is post content', '2014-08-26 10:19:01', '2014-08-26 10:19:01'),
(27, 1, 'this is post title', 'this is post content', '2014-08-26 10:23:15', '2014-08-26 10:23:15'),
(29, 1, 'this is post title', 'this is post content', '2014-08-26 10:23:21', '2014-08-26 10:23:21'),
(34, 1, 'A title once again', 'And the post body follows.', '2014-08-27 04:32:06', '2014-08-27 04:32:06'),
(35, 0, 'A title once again 1', 'And the post body follows.', '2014-08-27 05:44:50', '2014-08-27 05:44:50'),
(36, 0, 'A title once again 1', 'And the post body follows.', '2014-08-27 05:44:58', '2014-08-27 05:44:58'),
(37, 0, 'A title once again 1', 'And the post body follows.', '2014-08-27 05:45:46', '2014-08-27 05:45:46'),
(38, 0, 'A title once again 1', 'And the post body follows.', '2014-08-27 05:46:30', '2014-08-27 05:46:30'),
(39, 0, 'A title once again 1', 'And the post body follows.', '2014-08-27 06:20:19', '2014-08-27 06:20:19'),
(40, 0, 'A title once again 1', 'And the post body follows.', '2014-08-27 06:20:45', '2014-08-27 06:20:45'),
(41, 0, 'A title once again 1', 'And the post body follows.', '2014-08-27 06:20:47', '2014-08-27 06:20:47'),
(42, 0, 'A title once again 1', 'And the post body follows.', '2014-08-27 06:20:47', '2014-08-27 06:20:47'),
(43, 0, 'A title once again 1', 'And the post body follows.', '2014-08-27 06:20:48', '2014-08-27 06:20:48'),
(44, 0, 'A title once again 1', 'And the post body follows.', '2014-08-27 06:20:48', '2014-08-27 06:20:48'),
(45, 0, 'A title once again 1', 'And the post body follows.', '2014-08-27 06:20:49', '2014-08-27 06:20:49'),
(46, 0, 'A title once again 1', 'And the post body follows.', '2014-08-27 06:20:49', '2014-08-27 06:20:49'),
(47, 0, 'A title once again 1', 'And the post body follows.', '2014-08-27 06:20:49', '2014-08-27 06:20:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `role` varchar(20) CHARACTER SET utf8 NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `created`, `modified`) VALUES
(1, 'khanh', '$2a$10$oHZDY2yKO4nPuOBiKhlOZe5Iwd8DSk7MY2Zs45wIydPYY4sN8sYrO', 'admin', '2014-08-05 10:16:34', '2014-08-05 10:16:34'),
(2, 'khanh', '$2a$10$HonfWIjHqbfipi8hWp0Pp.JGlyY0TTqmEPVOwm4TPPY5qJR1hz30y', 'admin', '2014-08-05 10:26:11', '2014-08-05 10:26:11');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

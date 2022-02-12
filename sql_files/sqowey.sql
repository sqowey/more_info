-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 13. Feb 2022 um 00:53
-- Server-Version: 10.4.22-MariaDB
-- PHP-Version: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `sqowey`
--
CREATE DATABASE IF NOT EXISTS `sqowey` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sqowey`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `activity`
--

DROP TABLE IF EXISTS `activity`;
CREATE TABLE IF NOT EXISTS `activity` (
  `voice_channel_id` varchar(8) NOT NULL COMMENT 'Die id des Sprachkanals in dem der user ist.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `badges`
--

DROP TABLE IF EXISTS `badges`;
CREATE TABLE IF NOT EXISTS `badges` (
  `user_id` int(11) NOT NULL,
  `team` tinyint(1) NOT NULL DEFAULT 0,
  `support` tinyint(1) NOT NULL DEFAULT 0,
  `beta` tinyint(1) NOT NULL DEFAULT 0,
  `developer` int(11) NOT NULL DEFAULT 0,
  `admin` int(11) NOT NULL DEFAULT 0,
  `bot` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID of the message, that is only given once.',
  `channel_type` tinyint(1) NOT NULL COMMENT '0 = Direct message\r\n1 = Server message',
  `reciever_id` int(8) NOT NULL COMMENT 'Id of the channel or person to send the message to',
  `sender_id` int(8) NOT NULL COMMENT 'ID, of the person who sent the message',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Unix timestamp of the message',
  `message_encrypted` tinyint(1) NOT NULL COMMENT '0 = Normal\r\n1 = Verschluesselt',
  `message` varchar(255) NOT NULL COMMENT 'Inhalt der Nachricht',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `support`
--

DROP TABLE IF EXISTS `support`;
CREATE TABLE IF NOT EXISTS `support` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Einmalige ticket-id',
  `error-id` int(11) NOT NULL COMMENT 'Die Problem-art',
  `date_opened` date NOT NULL COMMENT 'Zeitpunkt, an dem das Ticket geöffnet wurde',
  `e_mail` varchar(50) NOT NULL COMMENT 'Die E-mail des Ticketöffners',
  `title` varchar(255) NOT NULL COMMENT 'Der Titel des Problems',
  `problem` varchar(255) NOT NULL COMMENT 'Der Text aus dem Problem-Feld',
  `sonstiges` varchar(255) NOT NULL COMMENT 'Der Text aus dem Sonstiges-Feld',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

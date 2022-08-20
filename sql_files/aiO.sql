-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 20. Aug 2022 um 12:51
-- Server-Version: 10.4.24-MariaDB
-- PHP-Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `accounts`
--
DROP DATABASE IF EXISTS `accounts`;
CREATE DATABASE IF NOT EXISTS `accounts` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `accounts`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` text NOT NULL,
  `displayname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(80) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `account_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `account_version` int(11) NOT NULL,
  `delete_until` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `accounts`
--
ALTER TABLE `accounts`
  ADD UNIQUE KEY `id` (`id`) USING HASH;
--
-- Datenbank: `sqowey`
--
DROP DATABASE IF EXISTS `sqowey`;
CREATE DATABASE IF NOT EXISTS `sqowey` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sqowey`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `activities`
--

DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities` (
  `user_id` text NOT NULL,
  `status` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `badges`
--

DROP TABLE IF EXISTS `badges`;
CREATE TABLE `badges` (
  `user_id` text NOT NULL,
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
CREATE TABLE `messages` (
  `message_id` text NOT NULL COMMENT 'ID of the message, that is only given once.',
  `channel_type` tinyint(1) NOT NULL COMMENT '0 = Direct message\r\n1 = Server message',
  `reciever_id` text NOT NULL COMMENT 'Id of the channel or person to send the message to',
  `sender_id` text NOT NULL COMMENT 'ID, of the person who sent the message',
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Unix timestamp of the message',
  `message_encrypted` tinyint(1) NOT NULL COMMENT '0 = Normal\r\n1 = Verschluesselt',
  `message` varchar(255) NOT NULL COMMENT 'Inhalt der Nachricht'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `settings`
--

DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `user_id` text NOT NULL,
  `language` varchar(2) NOT NULL DEFAULT 'de',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '0=Online\r\n1=Away\r\n2=Do not disturb',
  `privacy_messages` int(1) NOT NULL DEFAULT 1 COMMENT '0: Nobody\r\n1: Friends\r\n2: All',
  `privacy_friends` int(1) NOT NULL DEFAULT 2 COMMENT '0: Nobody\r\n1: Servermembers\r\n2: All',
  `theme` int(1) NOT NULL DEFAULT 0 COMMENT 'Dark: 0\r\nLight: 1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `support`
--

DROP TABLE IF EXISTS `support`;
CREATE TABLE `support` (
  `id` int(11) NOT NULL COMMENT 'Einmalige ticket-id',
  `error-id` int(11) NOT NULL COMMENT 'Die Problem-art',
  `date_opened` date NOT NULL COMMENT 'Zeitpunkt, an dem das Ticket geöffnet wurde',
  `e_mail` varchar(50) NOT NULL COMMENT 'Die E-mail des Ticketöffners',
  `title` varchar(255) NOT NULL COMMENT 'Der Titel des Problems',
  `problem` varchar(255) NOT NULL COMMENT 'Der Text aus dem Problem-Feld',
  `sonstiges` varchar(255) NOT NULL COMMENT 'Der Text aus dem Sonstiges-Feld'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `activities`
--
ALTER TABLE `activities`
  ADD UNIQUE KEY `user_id` (`user_id`) USING HASH;

--
-- Indizes für die Tabelle `settings`
--
ALTER TABLE `settings`
  ADD UNIQUE KEY `user_id` (`user_id`) USING HASH;

--
-- Indizes für die Tabelle `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `support`
--
ALTER TABLE `support`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Einmalige ticket-id';
--
-- Datenbank: `sqowey_mails`
--
DROP DATABASE IF EXISTS `sqowey_mails`;
CREATE DATABASE IF NOT EXISTS `sqowey_mails` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sqowey_mails`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accountdeletion`
--

DROP TABLE IF EXISTS `accountdeletion`;
CREATE TABLE `accountdeletion` (
  `user_id` text NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `send_timestamp` timestamp NULL DEFAULT NULL,
  `deletion_timestamp` timestamp NULL DEFAULT NULL,
  `type` int(1) NOT NULL DEFAULT 1,
  `mail_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `twofactor`
--

DROP TABLE IF EXISTS `twofactor`;
CREATE TABLE `twofactor` (
  `mail_id` int(11) NOT NULL,
  `reciever` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `code` int(6) NOT NULL,
  `sent` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `accountdeletion`
--
ALTER TABLE `accountdeletion`
  ADD PRIMARY KEY (`mail_id`);

--
-- Indizes für die Tabelle `twofactor`
--
ALTER TABLE `twofactor`
  ADD PRIMARY KEY (`mail_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `accountdeletion`
--
ALTER TABLE `accountdeletion`
  MODIFY `mail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `twofactor`
--
ALTER TABLE `twofactor`
  MODIFY `mail_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Datenbank: `sqowey_tmp`
--
DROP DATABASE IF EXISTS `sqowey_tmp`;
CREATE DATABASE IF NOT EXISTS `sqowey_tmp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sqowey_tmp`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accountdeletion`
--

DROP TABLE IF EXISTS `accountdeletion`;
CREATE TABLE `accountdeletion` (
  `user_id` text NOT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `delete_until` timestamp NULL DEFAULT NULL,
  `mails_created` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pw_reset_auth`
--

DROP TABLE IF EXISTS `pw_reset_auth`;
CREATE TABLE `pw_reset_auth` (
  `username` varchar(128) NOT NULL,
  `usermail` varchar(128) NOT NULL,
  `auth_code` text NOT NULL,
  `valid_until` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `accountdeletion`
--
ALTER TABLE `accountdeletion`
  ADD UNIQUE KEY `user_id` (`user_id`) USING HASH;

--
-- Indizes für die Tabelle `pw_reset_auth`
--
ALTER TABLE `pw_reset_auth`
  ADD UNIQUE KEY `username` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 11. Mai 2023 um 13:56
-- Server-Version: 10.4.28-MariaDB
-- PHP-Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `pizza`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `pizza`
--

CREATE TABLE `pizza` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `durchmesser` int(11) NOT NULL,
  `preis` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `pizza`
--

INSERT INTO `pizza` (`id`, `name`, `durchmesser`, `preis`) VALUES
(1, 'Margherita', 30, 7.50),
(2, 'Salami', 30, 8.50),
(3, 'Funghi', 30, 7.00),
(4, 'Prosciutto', 30, 8.00),
(5, 'Quattro Formaggi', 30, 9.50),
(6, 'Capricciosa', 30, 9.00);

--
-- Trigger `pizza`
--
DELIMITER $$
CREATE TRIGGER `pizza_insert_trigger` BEFORE INSERT ON `pizza` FOR EACH ROW BEGIN
  IF NEW.durchmesser < 20 THEN
    SET NEW.preis = 5.00;
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_pizza_preis_trigger` BEFORE INSERT ON `pizza` FOR EACH ROW BEGIN
  IF NEW.durchmesser >= 20 AND NEW.durchmesser <= 30 THEN
    SET NEW.preis = 7.50;
  END IF;
END
$$
DELIMITER ;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `pizza`
--
ALTER TABLE `pizza`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

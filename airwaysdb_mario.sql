-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 02. Apr 2020 um 13:56
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `airwaysdb_mario`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `aircraft`
--

CREATE TABLE `aircraft` (
  `aircraftNR` int(8) NOT NULL,
  `typeID` int(8) DEFAULT NULL,
  `int_registr_nr` int(8) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `entry_into_service` date DEFAULT NULL,
  `aircraft_range` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `aircraft_type`
--

CREATE TABLE `aircraft_type` (
  `typeID` int(8) NOT NULL,
  `manufacturer` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `airline`
--

CREATE TABLE `airline` (
  `threedigitsCode` varchar(3) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `headquarters` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `airport`
--

CREATE TABLE `airport` (
  `APID` varchar(3) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `capacity_in_aircraft` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `boarding_card`
--

CREATE TABLE `boarding_card` (
  `fp_sequenceNR` int(8) NOT NULL,
  `threedigitsCode` varchar(3) NOT NULL,
  `sequenceNR` int(3) NOT NULL,
  `flight_date` date DEFAULT NULL,
  `departure_airport` varchar(3) DEFAULT NULL,
  `destination_airport` varchar(3) DEFAULT NULL,
  `ticketNR` int(11) DEFAULT NULL,
  `rowNR` int(3) DEFAULT NULL,
  `seatDigit` varchar(1) DEFAULT NULL,
  `smoking_license` tinyint(1) DEFAULT NULL,
  `location` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `distances_between_airports`
--

CREATE TABLE `distances_between_airports` (
  `departure_airport` varchar(3) NOT NULL,
  `arrival_airport` varchar(3) NOT NULL,
  `distance` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `flight`
--

CREATE TABLE `flight` (
  `threedigitsCode` varchar(3) NOT NULL,
  `sequenceNR` int(3) NOT NULL,
  `departure_airport` varchar(3) DEFAULT NULL,
  `destination_airport` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `flightplan`
--

CREATE TABLE `flightplan` (
  `fp_sequenceNR` int(8) NOT NULL,
  `threedigitsCode` varchar(3) DEFAULT NULL,
  `sequenceNR` int(3) DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `delay_departure_time` time DEFAULT NULL,
  `delay_arrival_time` time DEFAULT NULL,
  `daily` tinyint(1) DEFAULT NULL,
  `daily_except_sat_and_sun` tinyint(1) DEFAULT NULL,
  `weekly` tinyint(1) DEFAULT NULL,
  `individual_flights` varchar(32) DEFAULT NULL,
  `first_class_seats_total` int(8) DEFAULT NULL,
  `first_class_seats_reserved` int(8) DEFAULT NULL,
  `business_class_seats_total` int(8) DEFAULT NULL,
  `business_class_seats_reserved` int(8) DEFAULT NULL,
  `economy_class_seats_total` int(8) DEFAULT NULL,
  `economy_class_seats_reserved` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `passenger`
--

CREATE TABLE `passenger` (
  `PNR` int(8) NOT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `gender` varchar(32) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `seating_arrangement`
--

CREATE TABLE `seating_arrangement` (
  `typeID` int(8) NOT NULL,
  `rowNR` int(3) NOT NULL,
  `seatDigit` varchar(1) NOT NULL,
  `class` varchar(32) DEFAULT NULL,
  `location` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ticket`
--

CREATE TABLE `ticket` (
  `ticketNR` int(11) NOT NULL,
  `PNR` int(8) DEFAULT NULL,
  `date_of_issue` date DEFAULT NULL,
  `price` double DEFAULT NULL,
  `currency` varchar(32) DEFAULT NULL,
  `sales_office` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `aircraft`
--
ALTER TABLE `aircraft`
  ADD PRIMARY KEY (`aircraftNR`),
  ADD KEY `typeID` (`typeID`);

--
-- Indizes für die Tabelle `aircraft_type`
--
ALTER TABLE `aircraft_type`
  ADD PRIMARY KEY (`typeID`);

--
-- Indizes für die Tabelle `airline`
--
ALTER TABLE `airline`
  ADD PRIMARY KEY (`threedigitsCode`);

--
-- Indizes für die Tabelle `airport`
--
ALTER TABLE `airport`
  ADD PRIMARY KEY (`APID`),
  ADD KEY `APID` (`APID`);

--
-- Indizes für die Tabelle `boarding_card`
--
ALTER TABLE `boarding_card`
  ADD PRIMARY KEY (`fp_sequenceNR`,`threedigitsCode`,`sequenceNR`),
  ADD KEY `departure_airport` (`departure_airport`,`destination_airport`,`ticketNR`,`rowNR`,`seatDigit`),
  ADD KEY `ticketNR` (`ticketNR`),
  ADD KEY `rowNR` (`rowNR`,`seatDigit`),
  ADD KEY `seatDigit` (`seatDigit`);

--
-- Indizes für die Tabelle `distances_between_airports`
--
ALTER TABLE `distances_between_airports`
  ADD PRIMARY KEY (`departure_airport`,`arrival_airport`),
  ADD KEY `arrival_airport` (`arrival_airport`),
  ADD KEY `departure_airport` (`departure_airport`);

--
-- Indizes für die Tabelle `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`threedigitsCode`,`sequenceNR`),
  ADD KEY `departure_airport` (`departure_airport`,`destination_airport`),
  ADD KEY `sequenceNR` (`sequenceNR`),
  ADD KEY `destination_airport` (`destination_airport`);

--
-- Indizes für die Tabelle `flightplan`
--
ALTER TABLE `flightplan`
  ADD PRIMARY KEY (`fp_sequenceNR`),
  ADD KEY `threedigitsCode` (`threedigitsCode`,`sequenceNR`),
  ADD KEY `sequenceNR` (`sequenceNR`);

--
-- Indizes für die Tabelle `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`PNR`);

--
-- Indizes für die Tabelle `seating_arrangement`
--
ALTER TABLE `seating_arrangement`
  ADD PRIMARY KEY (`typeID`,`rowNR`,`seatDigit`),
  ADD KEY `rowNR` (`rowNR`),
  ADD KEY `seatDigit` (`seatDigit`);

--
-- Indizes für die Tabelle `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticketNR`),
  ADD KEY `PNR` (`PNR`),
  ADD KEY `sales_office` (`sales_office`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `aircraft`
--
ALTER TABLE `aircraft`
  ADD CONSTRAINT `aircraft_ibfk_1` FOREIGN KEY (`typeID`) REFERENCES `aircraft_type` (`typeID`) ON DELETE CASCADE;

--
-- Constraints der Tabelle `aircraft_type`
--
ALTER TABLE `aircraft_type`
  ADD CONSTRAINT `aircraft_type_ibfk_1` FOREIGN KEY (`typeID`) REFERENCES `seating_arrangement` (`typeID`);

--
-- Constraints der Tabelle `airline`
--
ALTER TABLE `airline`
  ADD CONSTRAINT `airline_ibfk_1` FOREIGN KEY (`threedigitsCode`) REFERENCES `flightplan` (`threedigitsCode`);

--
-- Constraints der Tabelle `airport`
--
ALTER TABLE `airport`
  ADD CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`APID`) REFERENCES `flight` (`destination_airport`);

--
-- Constraints der Tabelle `boarding_card`
--
ALTER TABLE `boarding_card`
  ADD CONSTRAINT `boarding_card_ibfk_1` FOREIGN KEY (`ticketNR`) REFERENCES `ticket` (`ticketNR`),
  ADD CONSTRAINT `boarding_card_ibfk_2` FOREIGN KEY (`fp_sequenceNR`) REFERENCES `flightplan` (`fp_sequenceNR`),
  ADD CONSTRAINT `boarding_card_ibfk_3` FOREIGN KEY (`seatDigit`) REFERENCES `seating_arrangement` (`seatDigit`);

--
-- Constraints der Tabelle `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`sequenceNR`) REFERENCES `flightplan` (`sequenceNR`),
  ADD CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`departure_airport`) REFERENCES `distances_between_airports` (`departure_airport`),
  ADD CONSTRAINT `flight_ibfk_3` FOREIGN KEY (`destination_airport`) REFERENCES `distances_between_airports` (`arrival_airport`),
  ADD CONSTRAINT `flight_ibfk_4` FOREIGN KEY (`departure_airport`) REFERENCES `airport` (`APID`),
  ADD CONSTRAINT `flight_ibfk_5` FOREIGN KEY (`destination_airport`) REFERENCES `airport` (`APID`);

--
-- Constraints der Tabelle `flightplan`
--
ALTER TABLE `flightplan`
  ADD CONSTRAINT `flightplan_ibfk_1` FOREIGN KEY (`threedigitsCode`) REFERENCES `flight` (`threedigitsCode`);

--
-- Constraints der Tabelle `seating_arrangement`
--
ALTER TABLE `seating_arrangement`
  ADD CONSTRAINT `seating_arrangement_ibfk_1` FOREIGN KEY (`rowNR`) REFERENCES `boarding_card` (`rowNR`);

--
-- Constraints der Tabelle `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`PNR`) REFERENCES `passenger` (`PNR`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

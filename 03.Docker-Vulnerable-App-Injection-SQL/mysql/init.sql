-- phpMyAdmin SQL Dump
-- version 3.5.8
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2017 at 04:42 PM
-- Server version: 5.5.54-0ubuntu0.14.04.1
-- PHP Version: 5.4.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `payroll`
--

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `first_name`, `last_name`, `password`, `salary`) VALUES
('james_kirk','James','Kirk','kobayashi_maru','25000'),
('mr_spock','Mr','Spock','0nlyL0g!c','99000'),
('leonard_mccoy','Leonard','McCoy','hesDEADjim!','45000'),
('nyota_uhura','Nyota','Uhura','StarShine','39000'),
('montgomery_scott','Montgomery','Scott','ScottyDoesntKnow','1250'),
('hiraku_sulu','Hikaru','Sulu','parking-break-on','3500'),
('pavel_chekov','Pavel','Chekov','99victorvictor2','2500'),
('fenelon', 'spectateur', 'bavette', 'savourons', '666'),
('jean_luc_picard','Jean-Luc','Picard','maketitso','75000'),
('william_ryker','William','Ryker','number1','50000'),
('data','Data','','c0mput3r','100000'),
('deanna_troi','Deanna','Troi','empath1','45000'),
('beverly_crusher','Beverly','Crusher','healer1','60000'),
('geordi_laforge','Geordi','LaForge','visor','55000'),
('worf','Worf','','batlh','62000'),
('wesley_crusher','Wesley','Crusher','boygenius','30000'),
('q','Q','','0mn1p0t3nt','1000000'),
('guinan','Guinan','','listener','49000'),
('tasha_yar','Tasha','Yar','security1','47000'),
('miles_obrien','Miles','O\'Brien','engineer1','43000'),
('keiko_obrien','Keiko','O\'Brien','botanist1','35000'),
('kathryn_janeway','Kathryn','Janeway','coffee','82000'),
('chakotay','Chakotay','','spirit_guide','54000'),
('tuvok','Tuvok','','logic','66000'),
('b_elanna_torres','B\'Elanna','Torres','engineer2','58000'),
('tom_paris','Tom','Paris','helmboy','45000'),
('seven_of_nine','Seven','of Nine','borgqueen','78000'),
('neelix','Neelix','','chef','32000'),
('harry_kim','Harry','Kim','operations','47000'),
('the_doctor','The','Doctor','hologram','73000'),
('ensign_kim','Ensign','Kim','operations','42000'),
('quark','Quark','','profit','39000'),
('odo','Odo','','changeling','65000'),
('jadzia_dax','Jadzia','Dax','symbiont','50000'),
('benjamin_sisko','Benjamin','Sisko','emissary','80000'),
('kira_nerys','Kira','Nerys','freedom_fighter','48000'),
('ezri_dax','Ezri','Dax','counselor','47000'),
('julian_bashir','Julian','Bashir','doctor','58000'),
('jake_sisko','Jake','Sisko','writer','32000'),
('rom','Rom','','engineer','34000'),
('nog','Nog','','cadet','30000'),
('martok','Martok','','general','70000'),
('weyoun','Weyoun','','vorta','68000'),
('dukat','Dukat','','villain','67000'),
('garak','Garak','','tailor','50000'),
('dax','Dax','','symbiont','52000'),
('vic_fontaine','Vic','Fontaine','singer','60000'),
('elam_garak','Elam','Garak','spy','55000'),
('tasha_yar','Tasha','Yar','security2','47000'),
('brunt','Brunt','','liquidator','48000'),
('weyoun','Weyoun','','cloner','68000'),
('sarek','Sarek','','ambassador','65000'),
('saavik','Saavik','','lieutenant','54000'),
('ro_laren','Ro','Laren','maquis','47000'),
('hugh','Hugh','','drone','55000'),
('jane_way','Jane','Way','pathfinder','80000'),
('q2','Q2','','omniscient','1000000'),
('barclay','Reginald','Barclay','holoaddict','48000'),
('tomas_ryker','Thomas','Ryker','double','51000'),
('moogie','Moogie','','mother','35000'),
('damar','Damar','','cardassian','67000'),
('kurn','Kurn','','warrior','62000'),
('sela','Sela','','romulan','70000'),
('kurros','Kurros','','think_tank','71000'),
('cullah','Cullah','','kazon','55000'),
('annorax','Annorax','','time_scientist','72000'),
('braxton','Braxton','','temporal_agent','69000'),
('seska','Seska','','spy','64000'),
('kashyk','Kashyk','','devore','66000'),
('soval','Soval','','ambassador','63000'),
('shran','Shran','','andorian','61000'),
('phlox','Phlox','','doctor','59000'),
('trip_tucker','Trip','Tucker','chief_engineer','58000'),
('t_pol','T','Pol','science_officer','62000'),
('hoshi_sato','Hoshi','Sato','linguist','52000'),
('travis_mayweather','Travis','Mayweather','helmsman','50000'),
('malcolm_reed','Malcolm','Reed','security','51000'),
('silk','Silk','','mirror','47000'),
('neelix','Neelix','','guide','32000'),
('kes','Kes','','ocampa','48000'),
('seska','Seska','','traitor','53000'),
('vorik','Vorik','','engineer','55000'),
('suder','Suder','','psychopath','49000'),
('katherine_pulaski','Katherine','Pulaski','doctor2','60000'),
('lyta_alexander','Lyta','Alexander','telepath','47000'),
('zefram_cochrane','Zefram','Cochrane','warpdrive','73000'),
('richard_castillo','Richard','Castillo','captain','52000'),
('demora_sulu','Demora','Sulu','helmswoman','51000');


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--
-- Table structure for table `wei_ili_to_blc`
--

CREATE TABLE IF NOT EXISTS `wei_ili_to_blc` (
  `blc` varchar(25) collate utf8_bin NOT NULL,
  `iliOffset` varchar(17) collate utf8_bin NOT NULL,
  `iliPos` char(1) collate utf8_bin NOT NULL,
  `iliWnId` varchar(6) collate utf8_bin NOT NULL,
  `modif` char(1) collate utf8_bin NOT NULL default '#',
  PRIMARY KEY  (`blc`,`iliOffset`,`iliPos`,`iliWnId`,`modif`),
  KEY `iliOffset` (`iliOffset`,`iliPos`,`iliWnId`),
  KEY `blc` (`blc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


--
-- Table data for table `wei_ili_to_blc`
--

LOAD DATA LOCAL INFILE '/home/ubuntu/Escriptori/feina/MCR/BLC/sql/data.tsv' INTO TABLE `wei_ili_to_blc`;

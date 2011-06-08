-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 08, 2011 at 04:27 PM
-- Server version: 5.5.9
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `hunchWorks`
--

-- --------------------------------------------------------

--
-- Table structure for table `Album`
--

CREATE TABLE `Album` (
  `albumId` int(11) NOT NULL AUTO_INCREMENT,
  `hunchId` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`albumId`),
  KEY `hunchId` (`hunchId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Album`
--


-- --------------------------------------------------------

--
-- Table structure for table `Attachments`
--

CREATE TABLE `Attachments` (
  `hunchId` int(11) NOT NULL,
  `evidenceId` int(11) NOT NULL,
  `fileLocation` varchar(100) NOT NULL,
  `attachmentType` enum('photo','link','video') NOT NULL,
  `albumId` int(11) DEFAULT NULL,
  `attachmentId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`attachmentId`),
  KEY `albumId` (`albumId`),
  KEY `hunchId` (`hunchId`),
  KEY `evidenceId` (`evidenceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Attachments`
--


-- --------------------------------------------------------

--
-- Table structure for table `Evidence`
--

CREATE TABLE `Evidence` (
  `hunchId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `text` varchar(1000) DEFAULT NULL,
  `timeCreated` datetime NOT NULL,
  `attachmentIds` varchar(1000) DEFAULT NULL,
  `language` varchar(30) DEFAULT NULL,
  `strength` int(11) NOT NULL DEFAULT '0',
  `evidenceId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`evidenceId`),
  KEY `hunchId` (`hunchId`,`userId`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Evidence`
--


-- --------------------------------------------------------

--
-- Table structure for table `GroupMembership`
--

CREATE TABLE `GroupMembership` (
  `userId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `accessLevel` enum('Admin','Member') NOT NULL DEFAULT 'Member',
  `trustFromUser` tinyint(1) NOT NULL DEFAULT '1',
  `trustFromGroup` tinyint(1) NOT NULL DEFAULT '1',
  `recieveUpdates` tinyint(1) NOT NULL DEFAULT '1',
  `invitedBy` varchar(1000) DEFAULT NULL,
  `hasInvited` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`userId`,`groupId`),
  KEY `userId` (`userId`),
  KEY `groupId` (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `GroupMembership`
--


-- --------------------------------------------------------

--
-- Table structure for table `Groups`
--

CREATE TABLE `Groups` (
  `name` varchar(30) NOT NULL,
  `groupType` enum('Ad-Hoc','Alumni','Complement','Corporate','Interest','Non-Profit') NOT NULL,
  `privacy` enum('Open','Closed','Secret') NOT NULL DEFAULT 'Secret',
  `location` varchar(100) DEFAULT NULL,
  `pictureLocation` varchar(100) DEFAULT NULL,
  `groupId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `Hunch`
--

CREATE TABLE `Hunch` (
  `timeCreated` datetime NOT NULL,
  `hunchConfirmed` enum('confirmed','denied') DEFAULT NULL,
  `creatorId` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `privacy` enum('Open','Closed','Hidden') NOT NULL DEFAULT 'Hidden',
  `invitedUsers` varchar(1000) DEFAULT NULL,
  `invitedGroups` varchar(1000) DEFAULT NULL,
  `additionalInvites` varchar(1000) DEFAULT NULL,
  `language` varchar(30) NOT NULL DEFAULT 'English',
  `location` varchar(100) DEFAULT NULL,
  `tags` varchar(100) DEFAULT NULL,
  `description` varchar(1000) NOT NULL,
  `neededExpertise` varchar(200) DEFAULT NULL,
  `neededSkills` varchar(200) DEFAULT NULL,
  `neededLanguages` varchar(200) DEFAULT NULL,
  `hunchId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`hunchId`),
  KEY `creatorId` (`creatorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Hunch`
--


-- --------------------------------------------------------

--
-- Table structure for table `Messages`
--

CREATE TABLE `Messages` (
  `fromUserId` int(11) NOT NULL,
  `toUserId` int(11) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `messageId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`messageId`),
  KEY `fromUserId` (`fromUserId`),
  KEY `toUserId` (`toUserId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Messages`
--


-- --------------------------------------------------------

--
-- Table structure for table `UserConnections`
--

CREATE TABLE `UserConnections` (
  `userOneId` int(11) NOT NULL,
  `userTwoId` int(11) NOT NULL,
  `userOneFollowingUserTwo` tinyint(1) NOT NULL DEFAULT '0',
  `userTwoFollowingUserOne` tinyint(1) NOT NULL DEFAULT '0',
  `userOneSharedContactInfo` tinyint(1) NOT NULL DEFAULT '0',
  `userTwoSharedContactInfo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userOneId`,`userTwoId`),
  KEY `userOneId` (`userOneId`),
  KEY `userTwoId` (`userTwoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UserConnections`
--


-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `location` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `expertise` varchar(200) DEFAULT NULL,
  `skills` varchar(200) DEFAULT NULL,
  `invitedBy` varchar(1000) DEFAULT NULL,
  `hasInvited` varchar(1000) DEFAULT NULL,
  `education` varchar(1000) DEFAULT NULL,
  `notInterestedInFinishingProfile` tinyint(1) NOT NULL DEFAULT '0',
  `languagesKnown` varchar(200) DEFAULT NULL,
  `hometown` varchar(100) DEFAULT NULL,
  `privacy` enum('Open','Closed','Hidden') NOT NULL DEFAULT 'Hidden',
  `preferredLanguage` varchar(30) DEFAULT NULL,
  `workphone` varchar(30) DEFAULT NULL,
  `locationInterests` varchar(200) DEFAULT NULL,
  `organization` varchar(50) DEFAULT NULL,
  `bioText` varchar(1000) DEFAULT NULL,
  `workHistory` varchar(1000) DEFAULT NULL,
  `skypeName` varchar(30) DEFAULT NULL,
  `instantMessanger` varchar(30) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `profilePictureLocation` varchar(100) DEFAULT NULL,
  `blockedUsers` varchar(1000) DEFAULT NULL,
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Users`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `Album`
--
ALTER TABLE `Album`
  ADD CONSTRAINT `Album_ibfk_1` FOREIGN KEY (`hunchId`) REFERENCES `Hunch` (`hunchId`);

--
-- Constraints for table `Attachments`
--
ALTER TABLE `Attachments`
  ADD CONSTRAINT `Attachments_ibfk_1` FOREIGN KEY (`albumId`) REFERENCES `Album` (`albumId`),
  ADD CONSTRAINT `Attachments_ibfk_2` FOREIGN KEY (`evidenceId`) REFERENCES `Evidence` (`evidenceId`),
  ADD CONSTRAINT `Attachments_ibfk_3` FOREIGN KEY (`hunchId`) REFERENCES `Hunch` (`hunchId`);

--
-- Constraints for table `Evidence`
--
ALTER TABLE `Evidence`
  ADD CONSTRAINT `Evidence_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `Users` (`userId`),
  ADD CONSTRAINT `Evidence_ibfk_1` FOREIGN KEY (`hunchId`) REFERENCES `Hunch` (`hunchId`);

--
-- Constraints for table `GroupMembership`
--
ALTER TABLE `GroupMembership`
  ADD CONSTRAINT `GroupMembership_ibfk_2` FOREIGN KEY (`groupId`) REFERENCES `Groups` (`groupId`),
  ADD CONSTRAINT `GroupMembership_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `Users` (`userId`);

--
-- Constraints for table `Hunch`
--
ALTER TABLE `Hunch`
  ADD CONSTRAINT `Hunch_ibfk_1` FOREIGN KEY (`creatorId`) REFERENCES `Users` (`userId`);

--
-- Constraints for table `Messages`
--
ALTER TABLE `Messages`
  ADD CONSTRAINT `Messages_ibfk_2` FOREIGN KEY (`toUserId`) REFERENCES `Users` (`userId`),
  ADD CONSTRAINT `Messages_ibfk_1` FOREIGN KEY (`fromUserId`) REFERENCES `Users` (`userId`);

--
-- Constraints for table `UserConnections`
--
ALTER TABLE `UserConnections`
  ADD CONSTRAINT `UserConnections_ibfk_2` FOREIGN KEY (`userTwoId`) REFERENCES `Users` (`userId`),
  ADD CONSTRAINT `UserConnections_ibfk_1` FOREIGN KEY (`userOneId`) REFERENCES `Users` (`userId`);
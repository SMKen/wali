--mysql 
-- Table `wali`.`smdiary_admin`
DROP TABLE IF EXISTS `wali`.`smdiary_admin` ;

CREATE TABLE IF NOT EXISTS `wali`.`smdiary_admin` (
  `UID` VARCHAR(32) NOT NULL,
  `name` VARCHAR(32) NOT NULL,
  `pwd` VARCHAR(64) NOT NULL,
  `email` VARCHAR(64) NOT NULL,
  `logo` VARCHAR(64) NULL,
  `profile_img` VARCHAR(64) NULL,
  `logintimes` INT NOT NULL DEFAULT 0,
  `diarycount` INT NOT NULL DEFAULT 0,
  `create_time` TIMESTAMP NOT NULL,
  `update_time` TIMESTAMP NOT NULL,
  PRIMARY KEY (`UID`))
ENGINE = InnoDB;

-- Table `wali`.`smdiary_diary`
DROP TABLE IF EXISTS `wali`.`smdiary_diary` ;
CREATE TABLE IF NOT EXISTS `wali`.`smdiary_diary` (
  `UID` VARCHAR(32) NOT NULL,
  `diary_day` TIMESTAMP NOT NULL,
  `day_weather` VARCHAR(32) NOT NULL,
  `mood` VARCHAR(32) NOT NULL,
  `admin_UID` VARCHAR(32) NOT NULL,
  `outline` TEXT NOT NULL,
  `diary` TEXT NOT NULL,
  `category` VARCHAR(255) NOT NULL,
  `viewtimes` INT NOT NULL DEFAULT 0,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NOT NULL,
  PRIMARY KEY (`UID`));

-- Table `wali`.`smdiary_category`
DROP TABLE IF EXISTS `wali`.`smdiary_category` ;
CREATE TABLE IF NOT EXISTS `wali`.`smdiary_category` (
  `name` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` TIMESTAMP NOT NULL,
  PRIMARY KEY (`name`));

--h2
DROP TABLE IF EXISTS smdiary_admin ;
CREATE TABLE IF NOT EXISTS smdiary_admin (
  UID VARCHAR(32) NOT NULL,
  name VARCHAR(32) NOT NULL,
  pwd VARCHAR(64) NOT NULL,
  email VARCHAR(64) NOT NULL,
  logo VARCHAR(64) NULL,
  profile_img VARCHAR(64) NULL,
  logintimes INT NOT NULL DEFAULT 0,
  diarycount INT NOT NULL DEFAULT 0,
  create_time TIMESTAMP NOT NULL,
  update_time TIMESTAMP NOT NULL,
  PRIMARY KEY (UID))
;

DROP TABLE IF EXISTS smdiary_diary ;
CREATE TABLE IF NOT EXISTS smdiary_diary (
  UID VARCHAR(32) NOT NULL,
  diary_day TIMESTAMP NOT NULL,
  day_weather VARCHAR(32) NOT NULL,
  mood VARCHAR(32) NOT NULL,
  admin_UID VARCHAR(32) NOT NULL,
  outline TEXT NOT NULL,
  diary TEXT NOT NULL,
  category VARCHAR(255) NOT NULL,
  viewtimes INT NOT NULL DEFAULT 0,
  create_time TIMESTAMP NOT NULL ,
  update_time TIMESTAMP NOT NULL,
  PRIMARY KEY (UID));

DROP TABLE IF EXISTS smdiary_category ;
CREATE TABLE IF NOT EXISTS smdiary_category (
  name VARCHAR(32) NOT NULL,
  create_time TIMESTAMP NOT NULL ,
  update_time TIMESTAMP NOT NULL,
  PRIMARY KEY (name));
  
--jdbc:h2:tcp://localhost/~/smdiary
--org.h2.Driver sa 
  
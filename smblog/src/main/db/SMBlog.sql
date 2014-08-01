/**帐户表*/
CREATE TABLE `smblog_admin` (
  `email` VARCHAR(255) NOT NULL,
  `usernaem` VARCHAR(255) NOT NULL,
  `userpwd` VARCHAR(255) NOT NULL,
  `role` VARCHAR(255) NOT NULL,
  `accounts` VARCHAR(255) NOT NULL, 
  `blogs_count` INT(11) NOT NULL,
  `comments_count` INT(11) NOT NULL,
  `uid` VARCHAR(255) NOT NULL,
  `profile_url` VARCHAR(255) NOT NULL,
  `profile_image_url` VARCHAR(255) NOT NULL,
  `logo` VARCHAR(255) NOT NULL, 
  `logintimes` INT(11) NOT NULL,
  `CREATED` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastLogin` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`email`), 
) ENGINE=INNODB  AUTO_INCREMENT=1  DEFAULT CHARSET=UTF8;

CREATE TABLE `smblog_article` ( 
  `title` VARCHAR(255) NOT NULL DEFAULT '',
  `slug_url` VARCHAR(255) NOT NULL DEFAULT '',
  `view_count` INT(11) NOT NULL DEFAULT '1',
  `blog_content_id` INT(11) NOT NULL DEFAULT '1',
  `CREATED` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `account_id` VARCHAR(32) DEFAULT NULL,
  `comments_count` INT(11) NOT NULL DEFAULT '1',
  `content_updated_at` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `commentable` boolean NOT NULL DEFAULT '1', 
  `cached_tag_list` varchar(32) DEFAULT 'S213',
  `category` varchar(128) DEFAULT '/',
  PRIMARY KEY (`ID`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `smblog_attachments` ( 
  `file` VARCHAR(23) NOT NULL, 
  `account_id` VARCHAR(32) DEFAULT NULL,
  `blog_id` VARCHAR(128) NOT NULL, 
  `CREATED` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `smblog_blog_comments` ( 
  `content` text, 
  `account_id` VARCHAR(32) DEFAULT NULL,
  `blog_id` VARCHAR(128) NOT NULL, 
  `CREATED` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

   
CREATE TABLE `smblog_blog_contents` ( 
  `content` text,  
  PRIMARY KEY (`ID`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `smblog_taggings` (  
  `tag_id` INT(11) NOT NULL DEFAULT '1',
  `taggable_id` INT(11) NOT NULL DEFAULT '1',
  `CREATED` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
  `taggable_type` VARCHAR(32) DEFAULT NULL,
  `tagger_id` INT(11) NOT NULL DEFAULT '1',
  `context` varchar(32) DEFAULT 'S213',
  `category` varchar(128) DEFAULT '/',
  PRIMARY KEY (`ID`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;

CREATE TABLE `smblog_tags` (   
  `name` varchar(32) DEFAULT 'S213', 
  PRIMARY KEY (`ID`)
) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=UTF8;
 
CREATE TABLE `campaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `register_due_date` date DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'open',
  `price` decimal(10,0) DEFAULT NULL,
  `discount_price` decimal(10,0) DEFAULT NULL,
  `training_room_id` int(11) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `register_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `catalogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  `parent_catalog_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `catalogs_courses` (
  `catalog_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `short_description` text,
  `long_description` text,
  `duration_in_hours` int(11) DEFAULT NULL,
  `total_rating` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `discount_price` decimal(10,0) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `total_interesting_count` int(11) DEFAULT '0',
  `total_register_count` int(11) DEFAULT '0',
  `display_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `invitations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `friend_email` varchar(255) DEFAULT NULL,
  `friend_name` varchar(255) DEFAULT NULL,
  `my_name` varchar(255) DEFAULT NULL,
  `content` text,
  `last_resend_time` datetime DEFAULT NULL,
  `signed_up` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `key_numbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pattern` varchar(255) DEFAULT NULL,
  `next_value` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL,
  `contact_phone` varchar(50) DEFAULT NULL,
  `map_url` varchar(250) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `discount_price` decimal(10,0) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `joiner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,0) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `payable` tinyint(1) DEFAULT '0',
  `comment` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `paid_time` datetime DEFAULT NULL,
  `reason` text,
  `refunded_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notify_id` varchar(255) DEFAULT NULL,
  `notify_time` datetime DEFAULT NULL,
  `trade_no` varchar(255) DEFAULT NULL,
  `trade_status` varchar(255) DEFAULT NULL,
  `total_amount` decimal(10,0) DEFAULT NULL,
  `buyer_email` varchar(255) DEFAULT NULL,
  `raw_post` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `out_trade_no` varchar(255) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_payment` datetime DEFAULT NULL,
  `use_coupon` tinyint(1) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `quantity` decimal(10,0) DEFAULT NULL,
  `sign_type` varchar(255) DEFAULT NULL,
  `sign` varchar(255) DEFAULT NULL,
  `notify_type` varchar(255) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `roles_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `id_card` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `company_size` varchar(50) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(128) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `gender` varchar(20) DEFAULT 'male',
  `true_name` varchar(20) DEFAULT NULL,
  `contact_phone` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'user',
  `reference_to` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_username` (`username`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO schema_migrations (version) VALUES ('20110321024736');

INSERT INTO schema_migrations (version) VALUES ('20110323151309');

INSERT INTO schema_migrations (version) VALUES ('20110327124528');

INSERT INTO schema_migrations (version) VALUES ('20110327142733');

INSERT INTO schema_migrations (version) VALUES ('20110328034302');

INSERT INTO schema_migrations (version) VALUES ('20110507144412');

INSERT INTO schema_migrations (version) VALUES ('20110508080910');

INSERT INTO schema_migrations (version) VALUES ('20110524081147');

INSERT INTO schema_migrations (version) VALUES ('20110704065404');

INSERT INTO schema_migrations (version) VALUES ('20110706141135');

INSERT INTO schema_migrations (version) VALUES ('20110706141827');

INSERT INTO schema_migrations (version) VALUES ('20110715091019');

INSERT INTO schema_migrations (version) VALUES ('20110715092836');

INSERT INTO schema_migrations (version) VALUES ('20110716133722');

INSERT INTO schema_migrations (version) VALUES ('20110719071218');

INSERT INTO schema_migrations (version) VALUES ('20110722082915');

INSERT INTO schema_migrations (version) VALUES ('20110725071335');

INSERT INTO schema_migrations (version) VALUES ('20110725071945');

INSERT INTO schema_migrations (version) VALUES ('20110726102211');

INSERT INTO schema_migrations (version) VALUES ('20110726163216');

INSERT INTO schema_migrations (version) VALUES ('20110726163315');

INSERT INTO schema_migrations (version) VALUES ('20110803150837');

INSERT INTO schema_migrations (version) VALUES ('20110803151004');

INSERT INTO schema_migrations (version) VALUES ('20110812010615');

INSERT INTO schema_migrations (version) VALUES ('20110812150923');
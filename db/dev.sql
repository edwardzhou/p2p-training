PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
INSERT INTO "schema_migrations" VALUES('20110321024736');
INSERT INTO "schema_migrations" VALUES('20110323151309');
INSERT INTO "schema_migrations" VALUES('20110327124528');
INSERT INTO "schema_migrations" VALUES('20110327142733');
INSERT INTO "schema_migrations" VALUES('20110328034302');
INSERT INTO "schema_migrations" VALUES('20110507144412');
INSERT INTO "schema_migrations" VALUES('20110508080910');
INSERT INTO "schema_migrations" VALUES('20110524081147');
INSERT INTO "schema_migrations" VALUES('20110704065404');
INSERT INTO "schema_migrations" VALUES('20110706141135');
INSERT INTO "schema_migrations" VALUES('20110706141827');
INSERT INTO "schema_migrations" VALUES('20110715091019');
INSERT INTO "schema_migrations" VALUES('20110715092836');
INSERT INTO "schema_migrations" VALUES('20110716133722');
INSERT INTO "schema_migrations" VALUES('20110719071218');
INSERT INTO "schema_migrations" VALUES('20110722082915');
INSERT INTO "schema_migrations" VALUES('20110725071335');
INSERT INTO "schema_migrations" VALUES('20110725071945');
INSERT INTO "schema_migrations" VALUES('20110726102211');
INSERT INTO "schema_migrations" VALUES('20110726163216');
INSERT INTO "schema_migrations" VALUES('20110726163315');
INSERT INTO "schema_migrations" VALUES('20110803150837');
INSERT INTO "schema_migrations" VALUES('20110803151004');
INSERT INTO "schema_migrations" VALUES('20110812010615');
INSERT INTO "schema_migrations" VALUES('20110812150923');
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(128) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "confirmation_token" varchar(255), "confirmed_at" datetime, "confirmation_sent_at" datetime, "username" varchar(20), "gender" varchar(20) DEFAULT 'male', "true_name" varchar(20), "contact_phone" varchar(20), "role" varchar(20) DEFAULT 'user', "reference_to" varchar(20), "created_at" datetime, "updated_at" datetime);
INSERT INTO "users" VALUES(1,'edward.zhq@gmail.com','$2a$10$fqyZu2MmQ2pBWWOZff90uOHbwFmUia3r0DXkt8p6ggGhTKhz0Mqp6',NULL,NULL,NULL,24,'2011-08-15 07:19:53.748266','2011-08-14 11:12:27.333422','192.168.1.90','192.168.1.90',NULL,'2011-05-15 15:23:42.888487','2011-05-13 14:40:43.968803','edwardzhou','male','edwardzhou','13798310591','admin',NULL,'2011-05-13 14:40:43.969774','2011-08-15 07:19:53.748751');
INSERT INTO "users" VALUES(2,'abc123@abc123.com','$2a$10$PEhuXQOM.AaIGIzYPRz2I.NJmWGbbzIFT7VPkNV1iWOb8jx2QMtU2','YZvCGjuC8TqEHzPWixOF','2011-07-30 14:33:12.571691',NULL,2,'2011-08-14 08:45:11.999309','2011-07-30 14:40:07.265897','192.168.1.90','192.168.1.30',NULL,'2011-07-30 14:40:07.229192','2011-07-30 14:36:59.029359','abc123','male','abc123','13798310591','user',NULL,'2011-07-30 09:53:03.584788','2011-08-14 08:45:11.999849');
INSERT INTO "users" VALUES(3,'def@noexist.com','$2a$10$EahFGUquP4zSurr8EOZX8ungyZqFp9x17VxyHjHfowcE4jOsci5lO',NULL,NULL,NULL,4,'2011-08-15 07:20:09.274397','2011-08-15 06:39:03.708589','192.168.1.90','192.168.1.90',NULL,'2011-08-14 10:26:48.874160','2011-08-14 10:24:26.481635','def','male','def','1111','user',NULL,'2011-08-14 10:24:26.481763','2011-08-15 07:20:09.274884');
CREATE TABLE "user_details" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "id_card" varchar(20), "birthday" date, "company" varchar(100), "title" varchar(20), "company_size" varchar(50), "address" varchar(200), "zip" varchar(10), "created_at" datetime, "updated_at" datetime);
INSERT INTO "user_details" VALUES(1,1,'','1978-01-24','','','less_50','','','2011-05-13 14:40:58.961753','2011-07-31 06:24:47.277412');
INSERT INTO "user_details" VALUES(2,2,'',NULL,'','','less_50','','','2011-07-30 09:53:15.070179','2011-07-30 09:53:15.070179');
INSERT INTO "user_details" VALUES(3,3,'',NULL,'','','less_50','','','2011-08-14 10:24:36.540483','2011-08-14 10:24:36.540483');
CREATE TABLE "courses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "course_name" varchar(255), "version" varchar(255), "status" varchar(255), "short_description" text, "long_description" text, "duration_in_hours" integer, "total_rating" integer, "price" decimal, "discount_price" decimal, "avatar" varchar(255), "created_at" datetime, "updated_at" datetime, "total_interesting_count" integer DEFAULT 0, "total_register_count" integer DEFAULT 0, "display_order" integer);
INSERT INTO "courses" VALUES(1,'IT职场FAQ',NULL,'open','<span style="text-decoration:underline;font-weight:bold;">IT职场FAQ</span> 是作者在多年工作中所经历到人和事的经验总结。<br />
目标群体是 全体开发人员及团队组长(Team Leader or Project Leader)。<br />
它能帮助你：<br />
&nbsp; 1、明了职场规则，规避办公室政治和冲突解决。<br />
&nbsp; 2、清晰职业规划路线，了解每一个阶段需要掌握的知识与技能。<br />
&nbsp; 3、了解常见的软件开发过程（瀑布模型、迭代模型、RUP等）。<br />
&nbsp; 4、了解项目的生命周期，各个角色的定义、职责及相互关系。<br />
&nbsp; 5、日常工作的开展与协作步骤与方法(时间管理等)，工作完成的定义。<br />
&nbsp; 6、交流与沟通中应注意的问题。<br />
&nbsp; 7、加薪升职的诀窍。<br />
&nbsp; 8、压力释放与调节。<br />
&nbsp; 9、问＆答。<br />','<span style="text-decoration:underline;font-weight:bold;">IT职场FAQ</span> 是作者在多年工作中所经历到人和事的经验总结。<br />
目标群体是 全体开发人员及团队组长(Team Leader or Project Leader)。<br />
它能帮助你：<br />
&nbsp; 1、明了职场规则，规避办公室政治和冲突解决。<br />
&nbsp; 2、清晰职业规划路线，了解每一个阶段需要掌握的知识与技能。<br />
&nbsp; 3、了解常见的软件开发过程（瀑布模型、迭代模型、RUP等）。<br />
&nbsp; 4、了解项目的生命周期，各个角色的定义、职责及相互关系。<br />
&nbsp; 5、日常工作的开展与协作步骤与方法(时间管理等)，工作完成的定义。<br />
&nbsp; 6、交流与沟通中应注意的问题。<br />
&nbsp; 7、加薪升职的诀窍。<br />
&nbsp; 8、压力释放与调节。<br />
&nbsp; 9、问＆答。',3,NULL,380,280,'chengzhang.gif','2011-05-15 15:35:03.108850','2011-08-14 10:31:29.480733',0,2,1);
INSERT INTO "courses" VALUES(2,'测试驱动开发',NULL,'open','测试驱动开发','测试驱动开发',NULL,NULL,580,480,NULL,'2011-08-11 10:50:12.016031','2011-08-12 01:11:04.077626',0,0,2);
CREATE TABLE "catalogs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" varchar(255), "enabled" boolean DEFAULT 't', "parent_catalog_id" integer, "created_at" datetime, "updated_at" datetime);
INSERT INTO "catalogs" VALUES(2,'项目管理',NULL,'t',NULL,'2011-05-15 15:33:50.352123','2011-05-15 15:34:02.682215');
INSERT INTO "catalogs" VALUES(3,'编程',NULL,'t',NULL,'2011-05-15 15:34:19.407357','2011-05-15 15:34:19.407357');
CREATE TABLE "catalogs_courses" ("catalog_id" integer NOT NULL, "course_id" integer NOT NULL);
INSERT INTO "catalogs_courses" VALUES(3,1);
INSERT INTO "catalogs_courses" VALUES(2,1);
INSERT INTO "catalogs_courses" VALUES(3,2);
INSERT INTO "catalogs_courses" VALUES(2,2);
CREATE TABLE "campaigns" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(50), "start_date" date, "end_date" date, "register_due_date" date, "course_id" integer, "trainer_id" integer, "status" varchar(50) DEFAULT 'open', "price" decimal, "discount_price" decimal, "training_room_id" integer, "description" text, "created_at" datetime, "updated_at" datetime, "register_count" integer DEFAULT 0);
INSERT INTO "campaigns" VALUES(1,'第一期福田班',NULL,NULL,NULL,1,NULL,'open',380,280,2,NULL,'2011-07-09 04:38:38.130988','2011-08-14 10:31:29.398923',2);
INSERT INTO "campaigns" VALUES(2,'福田班第一期',NULL,NULL,NULL,2,NULL,'open',580,480,2,NULL,'2011-08-11 10:50:53.356438','2011-08-11 10:50:53.356438',0);
CREATE TABLE "locations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "city" varchar(50), "address" varchar(200), "zip" varchar(20), "contact_phone" varchar(50), "map_url" varchar(250), "created_at" datetime, "updated_at" datetime);
INSERT INTO "locations" VALUES(2,'深圳市','福田区竹子林如家快捷酒店三楼会议室','518001',NULL,'http://sz.edushi.com/?oid=11997','2011-07-14 15:19:40.139438','2011-08-07 16:43:16.022377');
CREATE TABLE "favorites" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "course_id" integer, "created_at" datetime, "updated_at" datetime);
INSERT INTO "favorites" VALUES(1,1,1,'2011-05-31 13:47:36.399956','2011-05-31 13:47:36.399956');
CREATE TABLE "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "course_id" integer, "content" varchar(255), "created_at" datetime, "updated_at" datetime);
INSERT INTO "comments" VALUES(1,1,1,'test','2011-07-06 11:02:50.213991','2011-07-06 11:02:50.213991');
INSERT INTO "comments" VALUES(2,1,1,'ttt','2011-07-06 11:02:57.603323','2011-07-06 11:02:57.603323');
CREATE TABLE "order_items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "order_id" integer, "campaign_id" integer, "qty" integer, "price" decimal, "discount_price" decimal, "amount" decimal, "created_at" datetime, "updated_at" datetime, "joiner_id" integer);
INSERT INTO "order_items" VALUES(9,9,1,1,380,280,280,'2011-08-04 14:11:12.484780','2011-08-04 14:11:12.484780',NULL);
INSERT INTO "order_items" VALUES(10,10,1,1,380,280,280,'2011-08-04 14:26:26.325627','2011-08-04 14:26:26.325627',NULL);
INSERT INTO "order_items" VALUES(11,11,1,1,380,280,280,'2011-08-08 03:31:41.189153','2011-08-08 03:31:41.189153',NULL);
INSERT INTO "order_items" VALUES(12,12,1,1,380,280,280,'2011-08-14 10:31:29.337956','2011-08-14 10:31:29.337956',NULL);
CREATE TABLE "roles" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" varchar(255), "created_at" datetime, "updated_at" datetime);
INSERT INTO "roles" VALUES(1,'guest',NULL,'2011-07-15 13:07:42.478195','2011-07-15 13:07:42.478195');
INSERT INTO "roles" VALUES(2,'user',NULL,'2011-07-15 13:07:46.352878','2011-07-15 13:07:46.352878');
INSERT INTO "roles" VALUES(3,'trainer',NULL,'2011-07-15 13:07:52.521110','2011-07-15 13:07:52.521110');
INSERT INTO "roles" VALUES(4,'admin',NULL,'2011-07-15 13:07:57.292231','2011-07-15 13:07:57.292231');
CREATE TABLE "roles_users" ("role_id" integer NOT NULL, "user_id" integer NOT NULL);
INSERT INTO "roles_users" VALUES(4,1);
INSERT INTO "roles_users" VALUES(3,1);
INSERT INTO "roles_users" VALUES(2,2);
INSERT INTO "roles_users" VALUES(2,3);
CREATE TABLE "key_numbers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "pattern" varchar(255), "next_value" integer, "created_at" datetime, "updated_at" datetime);
INSERT INTO "key_numbers" VALUES(1,'order_id','%y%{index}',11,'2011-07-24 06:30:40.955079','2011-08-14 10:31:29.150433');
CREATE TABLE "payments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "notify_id" varchar(255), "notify_time" datetime, "trade_no" varchar(255), "trade_status" varchar(255), "total_amount" decimal, "buyer_email" varchar(255), "raw_post" text, "created_at" datetime, "updated_at" datetime, "out_trade_no" varchar(255), "gmt_create" datetime, "gmt_payment" datetime, "use_coupon" boolean, "subject" varchar(255), "body" varchar(255), "price" decimal, "quantity" decimal, "sign_type" varchar(255), "sign" varchar(255), "notify_type" varchar(255), "order_id" integer);
CREATE TABLE "orders" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "order_code" varchar(20), "user_id" integer, "total_amount" decimal, "status" varchar(20), "payable" boolean DEFAULT 'f', "comment" text, "created_at" datetime, "updated_at" datetime, "campaign_id" integer, "paid_time" datetime, "reason" text, "refunded_time" datetime);
INSERT INTO "orders" VALUES(9,'1100007',1,280,'cancelled','f','','2011-08-04 14:11:12.404649','2011-08-04 14:11:51.359721',1,NULL,'原因至少要填4个字符.',NULL);
INSERT INTO "orders" VALUES(10,'1100008',1,280,'cancelled','f','','2011-08-04 14:26:26.256215','2011-08-08 03:18:14.147340',1,NULL,'测试取消',NULL);
INSERT INTO "orders" VALUES(11,'1100009',1,280,'pending_payment','f','','2011-08-08 03:31:41.113421','2011-08-08 03:31:41.113421',1,NULL,NULL,NULL);
INSERT INTO "orders" VALUES(12,'1100010',3,280,'pending_payment','f','','2011-08-14 10:31:29.326238','2011-08-14 14:48:51.207725',1,NULL,NULL,NULL);
CREATE TABLE "invitations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "friend_email" varchar(255), "friend_name" varchar(255), "my_name" varchar(255), "content" text, "last_resend_time" datetime, "signed_up" boolean, "created_at" datetime, "updated_at" datetime);
INSERT INTO "invitations" VALUES(1,1,'zhou-hui-qing@163.com',NULL,NULL,NULL,NULL,NULL,'2011-08-13 08:40:49.371096','2011-08-13 08:40:49.371096');
INSERT INTO "invitations" VALUES(2,1,'zhou-hui-qing@163.com',NULL,NULL,NULL,NULL,NULL,'2011-08-13 08:42:27.709828','2011-08-13 08:42:27.709828');
INSERT INTO "invitations" VALUES(3,1,'z','','edwardzhou',NULL,NULL,NULL,'2011-08-13 08:52:02.910873','2011-08-13 08:52:02.910873');
INSERT INTO "invitations" VALUES(4,1,'zhou-hui-qing@163.com','周辉庆','edwardzhou',NULL,NULL,NULL,'2011-08-13 08:52:28.824192','2011-08-13 08:52:28.824192');
INSERT INTO "invitations" VALUES(5,1,'','','edwardzhou',NULL,NULL,NULL,'2011-08-13 13:51:42.142167','2011-08-13 13:51:42.142167');
INSERT INTO "invitations" VALUES(6,1,'abc@aaa','aaa','edwardzhou',NULL,NULL,NULL,'2011-08-13 14:15:33.854359','2011-08-13 14:15:33.854359');
INSERT INTO "invitations" VALUES(7,1,'abc@aaa','def','edwardzhou',NULL,NULL,NULL,'2011-08-13 14:25:20.412508','2011-08-13 14:25:20.412508');
INSERT INTO "invitations" VALUES(8,1,'abc@aaa.net','abc','edwardzhou',NULL,NULL,NULL,'2011-08-13 14:27:18.022602','2011-08-13 14:27:18.022602');
INSERT INTO "invitations" VALUES(9,1,'zhou-hui-qing@163.com','zhou-hui-qing@163.com','edwardzhou',NULL,NULL,NULL,'2011-08-13 14:43:05.313339','2011-08-13 14:43:05.313339');
INSERT INTO "invitations" VALUES(10,1,'zhou-hui-qing@163.com','demo','edwardzhou',NULL,NULL,NULL,'2011-08-13 15:13:14.285965','2011-08-13 15:13:14.285965');
INSERT INTO "invitations" VALUES(11,1,'zhou-hui-qing@163.com','zhou-hui-qing@163.com','edwardzhou',NULL,NULL,NULL,'2011-08-14 04:14:29.037493','2011-08-14 04:14:29.037493');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('users',3);
INSERT INTO "sqlite_sequence" VALUES('user_details',3);
INSERT INTO "sqlite_sequence" VALUES('catalogs',3);
INSERT INTO "sqlite_sequence" VALUES('courses',2);
INSERT INTO "sqlite_sequence" VALUES('favorites',1);
INSERT INTO "sqlite_sequence" VALUES('comments',2);
INSERT INTO "sqlite_sequence" VALUES('campaigns',2);
INSERT INTO "sqlite_sequence" VALUES('order_items',12);
INSERT INTO "sqlite_sequence" VALUES('locations',2);
INSERT INTO "sqlite_sequence" VALUES('roles',4);
INSERT INTO "sqlite_sequence" VALUES('key_numbers',1);
INSERT INTO "sqlite_sequence" VALUES('orders',12);
INSERT INTO "sqlite_sequence" VALUES('invitations',11);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE UNIQUE INDEX "index_users_on_username" ON "users" ("username");
CREATE UNIQUE INDEX "index_users_on_confirmation_token" ON "users" ("confirmation_token");
COMMIT;

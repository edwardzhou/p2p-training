CREATE TABLE "catalogs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" varchar(255), "enabled" boolean DEFAULT 't', "parent_catalog_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "catalogs_courses" ("catalog_id" integer NOT NULL, "course_id" integer NOT NULL);
CREATE TABLE "courses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "course_name" varchar(255), "version" varchar(255), "status" varchar(255), "short_description" text, "long_description" text, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "user_details" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "id_card" varchar(20), "birthday" date, "company" varchar(100), "company_size" varchar(50), "address" varchar(200), "zip" varchar(10), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(128) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "reset_password_sent_at" datetime, "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255), "confirmation_token" varchar(255), "confirmed_at" datetime, "confirmation_sent_at" datetime, "username" varchar(20), "gender" varchar(20) DEFAULT 'male', "true_name" varchar(20), "contact_phone" varchar(20), "role" varchar(20) DEFAULT 'user', "reference_to" varchar(20), "created_at" datetime, "updated_at" datetime);
CREATE UNIQUE INDEX "index_users_on_confirmation_token" ON "users" ("confirmation_token");
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE UNIQUE INDEX "index_users_on_username" ON "users" ("username");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20110321024736');

INSERT INTO schema_migrations (version) VALUES ('20110323151309');

INSERT INTO schema_migrations (version) VALUES ('20110327124528');

INSERT INTO schema_migrations (version) VALUES ('20110327142733');

INSERT INTO schema_migrations (version) VALUES ('20110328034302');
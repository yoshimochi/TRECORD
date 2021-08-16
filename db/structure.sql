CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "users" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "name" varchar NOT NULL, "is_active" boolean DEFAULT 0 NOT NULL, "profile_image_id" integer, "introduction" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "uid" varchar, "provider" varchar);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_reset_password_token" ON "users" ("reset_password_token");
CREATE TABLE "posts" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "image_id" integer, "body" text NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "post_comments" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "post_id" integer NOT NULL, "comment" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "favorites" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "post_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "admins" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar DEFAULT '' NOT NULL, "encrypted_password" varchar DEFAULT '' NOT NULL, "reset_password_token" varchar, "reset_password_sent_at" datetime, "remember_created_at" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE UNIQUE INDEX "index_admins_on_email" ON "admins" ("email");
CREATE UNIQUE INDEX "index_admins_on_reset_password_token" ON "admins" ("reset_password_token");
CREATE TABLE "genres" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" text NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "relationships" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer, "follower_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, CONSTRAINT "fk_rails_8c9a6d4759"
FOREIGN KEY ("follower_id")
  REFERENCES "users" ("id")
);
CREATE INDEX "index_relationships_on_user_id" ON "relationships" ("user_id");
CREATE INDEX "index_relationships_on_follower_id" ON "relationships" ("follower_id");
CREATE UNIQUE INDEX "index_relationships_on_user_id_and_follower_id" ON "relationships" ("user_id", "follower_id");
CREATE TABLE "records" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "user_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "comment" text, "start_time" datetime, "rate" float);
CREATE TABLE "user_tags" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "tag_id" integer NOT NULL, "user_id" integer NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "tags" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar NOT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "event_data" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "event_id" integer, "weight" float, "rep" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "record_id" integer);
CREATE TABLE "trainings" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "comment" text, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "event_id" integer, "record_id" integer);
CREATE TABLE "eventdata" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "event_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "record_id" integer);
CREATE TABLE "set_events" ("id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, "weight" float DEFAULT 0.0, "rep" integer DEFAULT 0, "set" integer DEFAULT 0, "event_id" integer, "user_id" integer, "record_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "events" ("id" integer NOT NULL PRIMARY KEY, "genre_id" integer DEFAULT NULL, "name" text NOT NULL, "weight" float DEFAULT NULL, "repetition" integer DEFAULT NULL, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "training_id" integer DEFAULT NULL, "record"  DEFAULT NULL, "start_time" datetime DEFAULT NULL);
CREATE TABLE "training_records" ("id" integer NOT NULL PRIMARY KEY, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "event"  DEFAULT NULL, "name" varchar DEFAULT NULL, "record_id" integer DEFAULT NULL);
INSERT INTO "schema_migrations" (version) VALUES
('20210729132611'),
('20210729135546'),
('20210729141517'),
('20210729141530'),
('20210729143012'),
('20210729143451'),
('20210729153602'),
('20210729154504'),
('20210729160901'),
('20210729160917'),
('20210729164213'),
('20210729164226'),
('20210802015456'),
('20210802015952'),
('20210802020203'),
('20210802020400'),
('20210802052200'),
('20210802054728'),
('20210803135206'),
('20210808045910'),
('20210815160719');



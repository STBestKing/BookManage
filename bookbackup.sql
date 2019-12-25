BEGIN TRANSACTION;
CREATE TABLE books(
       book_id text primary key,
       book_name text not null,
       author text not null,
       publish_com text not null,
       publish_date text not null
);
INSERT INTO "books" VALUES('9781234567890','demo1','admin','admin','2019-1-1');
INSERT INTO "books" VALUES('9781234567891','demo2','guest','guest','2019-2-2');
INSERT INTO "books" VALUES('9781234567892','demo3','author','author','2019-3-3');
CREATE TABLE borrows(
       user_name text not null,
       book_id text not null,
       date_borrow text not null,
       date_return text not null,
       primary key (user_name, book_id)
);
INSERT INTO "borrows" VALUES('suntao','9781234567891','2019-12-25','2020-01-24');
CREATE TABLE historys(
       history_id integer primary key autoincrement,
       book_id text not null,
       user_name text not null,
       date_borrow text not null,
       date_return text,
       status text not null default 'not return'
);
INSERT INTO "historys" VALUES(1,'9781234567891','suntao','2019-12-25',NULL,'not return');
INSERT INTO "historys" VALUES(2,'9781234567892','suntao','2019-12-25','2019-12-25','retruned');
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('users',3);
INSERT INTO "sqlite_sequence" VALUES('historys',2);
CREATE TABLE users (
        user_id integer primary key autoincrement,
	user_name text not null,
	pwd text not null,
	college text,
	num text,
	email text
);
INSERT INTO "users" VALUES(1,'suntao','pbkdf2:sha256:150000$e58gGV0M$544eb892cdbc2c6bbadb89562bba0c42fa14e2ed2e299595f3fe9281db42d549','信工','123456','123456@123.com');
INSERT INTO "users" VALUES(2,'guest','pbkdf2:sha256:150000$c5S0R9af$e6ab41b49e899ccf22dd1f2012cfef3a7005061cdf1b752a7e0a35cae310d91c','guest','guest','guest@123.com');
INSERT INTO "users" VALUES(3,'test','pbkdf2:sha256:150000$Nqw0guDT$06fc48370d19a64af2eef9ed8002b574b2c46932c35a4e7e85e70fb64b8b418c','test','test','test@test.com');
CREATE INDEX books_id_index on books (book_id asc);
CREATE INDEX books_name_index on books (book_name asc);
CREATE INDEX books_author_index on books (author asc);
COMMIT;

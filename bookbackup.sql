BEGIN TRANSACTION;
CREATE TABLE books(
       book_id text primary key,
       book_name text not null,
       author text not null,
       publish_com text not null,
       publish_date text not null
);
INSERT INTO "books" VALUES('9781234567890','demo1','admin','admin','2019-1-1');
CREATE TABLE borrows(
       user_name text not null,
       book_id text not null,
       date_borrow text not null,
       date_return text not null,
       primary key (user_name, book_id)
);
CREATE TABLE historys(
       history_id integer primary key autoincrement,
       book_id text not null,
       user_name text not null,
       date_borrow text not null,
       date_return text,
       status text not null default 'not return'
);
DELETE FROM "sqlite_sequence";
CREATE TABLE users (
        user_id integer primary key autoincrement,
	user_name text not null,
	pwd text not null,
	college text,
	num text,
	email text
);
CREATE INDEX books_id_index on books (book_id asc);
CREATE INDEX books_name_index on books (book_name asc);
CREATE INDEX books_author_index on books (author asc);
COMMIT;

-- Database: bookishDB

-- DROP DATABASE "bookishDB";

CREATE
DATABASE "bookishDB"
    WITH 
    OWNER = bookish
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United Kingdom.1252'
    LC_CTYPE = 'English_United Kingdom.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

CREATE TABLE book
(
    id               serial PRIMARY KEY,
    title            VARCHAR(100) NOT NULL,
    publication_year SMALLINT,
    isbn             VARCHAR(13) UNIQUE,
);

CREATE TABLE author
(
    id         serial PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
)

CREATE TABLE book_author
(
    id serial PRIMARY KEY,
    FOREIGN KEY (book_id) REFERENCES book (id),
    FOREIGN KEY (author_id) REFERENCES author (id),
)

CREATE TABLE copies
(
    id serial PRIMARY KEY,
    FOREIGN KEY (book_id) REFERENCES book (id),
)

CREATE TABLE user
(
    id         serial PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name  VARCHAR(50) NOT NULL,
    address    VARCHAR(100),
)

CREATE TABLE lending
(
    id         serial PRIMARY KEY,
    FOREIGN KEY (copy_id) REFERENCES copies (id),
    FOREIGN KEY (user_id) REFERENCES user (id),
    start_date DATE NOT NULL DEFAULT CURRENT_DATE,
    end_date   DATE,
    due_date   DATE NOT NULL DEFAULT CURRENT_DATE + '14 days':: INTERVAL,
)
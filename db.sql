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

CREATE TABLE Book
(
    Id               serial PRIMARY KEY,
    Title            VARCHAR(100) NOT NULL,
    PublicationYear SMALLINT,
    Isbn             VARCHAR(13) UNIQUE
);

CREATE TABLE Author
(
    Id         serial PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName  VARCHAR(50) NOT NULL
);

CREATE TABLE BookAuthor
(
    Id        serial PRIMARY KEY,
    BookId   int,
    AuthorId int,
    FOREIGN KEY (BookId) REFERENCES Book (Id),
    FOREIGN KEY (AuthorId) REFERENCES Author (Id)
);

CREATE TABLE Print
(
    Id      serial PRIMARY KEY,
    BookId int,
    FOREIGN KEY (BookId) REFERENCES Book (Id)
);

CREATE TABLE Customer
(
    Id         serial PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName  VARCHAR(50) NOT NULL,
    Address    VARCHAR(100)
);

CREATE TABLE lending
(
    Id         serial PRIMARY KEY,
    PrintId   int,
    UserId    int,
    FOREIGN KEY (PrintId) REFERENCES Print (Id),
    FOREIGN KEY (UserId) REFERENCES Customer (Id),
    StartDate DATE NOT NULL DEFAULT CURRENT_DATE,
    EndDate   DATE,
    DueDate   DATE NOT NULL DEFAULT CURRENT_DATE + '14 days':: INTERVAL
);

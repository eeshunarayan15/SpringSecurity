-- create table users(username varchar_ignorecase(50) not null primary key,password varchar_ignorecase(500) not null,enabled boolean not null);
-- create table authorities (username varchar_ignorecase(50) not null,authority varchar_ignorecase(50) not null,constraint fk_authorities_users foreign key(username) references users(username));
-- create unique index ix_auth_username on authorities (username,authority);



-- Drop tables if they exist
-- DROP TABLE IF EXISTS authorities;
-- DROP TABLE IF EXISTS users;

-- CREATE TABLE users (
--     username VARCHAR(255) NOT NULL PRIMARY KEY,
--     password VARCHAR(255) NOT NULL,
--     enabled BOOLEAN NOT NULL
-- );

-- CREATE TABLE authorities (
--     username VARCHAR(255) NOT NULL,
--     authority VARCHAR(50) NOT NULL,
--     FOREIGN KEY (username) REFERENCES users(username)
-- );

-- CREATE UNIQUE INDEX ix_auth_username ON authorities (username, authority);






-- Drop tables if they already exist
DROP TABLE IF EXISTS authorities;
DROP TABLE IF EXISTS users;

-- Create 'users' table
CREATE TABLE users (
    username VARCHAR(255) NOT NULL PRIMARY KEY,
    password VARCHAR(255) NOT NULL,
    enabled TINYINT(1) NOT NULL -- MySQL uses TINYINT for boolean
);

-- Create 'authorities' table
CREATE TABLE authorities (
    username VARCHAR(255) NOT NULL,
    authority VARCHAR(50) NOT NULL,
    PRIMARY KEY (username, authority), -- Composite primary key
    CONSTRAINT fk_authorities_users FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE
);

-- Create unique index on 'authorities'
CREATE UNIQUE INDEX ix_auth_username ON authorities (username, authority);

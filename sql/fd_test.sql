-- CREATE EXTENTION "uuid-ossp";
-- DROP TABLE IF EXISTS users;
-- CREATE TABLE users(
-- id UUID PRIMARY KEY DEFAULT uuid_generate_v1,
-- firs_name VARCHAR(64) NOT NULL CHECK(firs_name != ''),
-- last_name VARCHAR(128) NOT NULL CHECK(last_name != ''),
-- email VARCHAR(256) NOT NULL CHECK(email != '') UNIQUE,
-- is_male BOOLEAN NOT NULL,
-- birthday DATE NOT NULL CHECK(birthday < CURRENT_DATE),
-- height NUMERIC(3,2) NOT NULL CHECK(height > 1.10 AND height < 2.55)
-- );


DROP TABLE IF EXISTS users;
CREATE TABLE users(
id SERIAL PRIMARY KEY,
firs_name VARCHAR(64) NOT NULL CHECK(firs_name != ''),
last_name VARCHAR(128) NOT NULL CHECK(last_name != ''),
email VARCHAR(256) NOT NULL CHECK(email != '') UNIQUE,
is_male BOOLEAN NOT NULL,
birthday DATE NOT NULL CHECK(birthday < CURRENT_DATE),
height NUMERIC(3,2) NOT NULL CHECK(height > 1.10 AND height < 2.55)
);

INSERT INTO users(
    firs_name,
    last_name,
    email,
    is_male,
    birthday,
    height
)
VALUES 
("Pitt", "Bred", "bred@gmail.com", FALSE, "1963-12-18", 1.87),
("Fred", "Grid", "grid@gmail.com", TRUE, "1963-12-18", 1.37),
("Rot", "Tom", "rot@gmail.com", TRUE, "1963-12-18", 2.17);

DROP TABLE IF EXISTS messages;
CREATE TABLE messages(
    id SERIAL PRIMARY KEY,
    body VARCHAR(4096) NOT NULL CHECK(body != ''),
    is_read BOOLEAN NOT NULL DEFAULT FALSE,
    user_id INTEGER REFERENCES users(id),
    -- author VARCHAR(128) NOT NULL CHECK(author != ''),
    created_at TIMESTEMP NOT NULL DEFAULT CURRENT_TIMESTEMP
);

INSERT INTO messages(user_id, body)
VALUES (1, "hi!"), (2, ")"), (3, "hi!") (1, ")");
 
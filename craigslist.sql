DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE,
    email TEXT NOT NULL,
    preferred_region INTEGER REFERENCES regions
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    region INTEGER NOT NULL REFERENCES regions,
    category INTEGER NOT NULL REFERENCES category,
    user INTEGER NOT NULL REFERENCES users,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    price DECIMAL(14, 2)
);
DROP DATABASE IF EXISTS medical;

CREATE DATABASE medical;

\c medical

CREATE TABLE medical centers
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    department TEXT,
    residency INTEGER REFERENCES medical centers ON DELETE SET NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    birthday DATE,
    gender TEXT
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL, 
    is_treateable BINARY DEFAULT IS true
);

CREATE TABLE care_relationships
(
    id SERIAL PRIMARY KEY,
    doctor INTEGER NOT NULL REFERENCES doctors,
    patient INTEGER NOT NULL REFERENCES patients
);

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    patient INTEGER NOT NULL REFERENCES patients,
    disease INTEGER REFERENCES diseases,
    doctor INTEGER NOT NULL REFERENCES doctors
);
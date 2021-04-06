DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE league
(
    id SERIAL PRIMARY KEY,
    name UNIQUE TEXT NOT NULL,
    start DATE, 
    end DATE
);

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    city TEXT UNIQUE NOT NULL,
    league INTEGER REFERENCES league,
    ranking INTEGER
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    team INTEGER REFERENCES teams
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE games 
(
    id SERIAL PRIMARY KEY,
    home_team INTEGER NOT NULL REFERENCES teams,
    away_team INTEGER NOT NULL REFERENCES teams,
    referee INTEGER UNIQUE NOT NULL REFERENCES referees,
    linesman_home INTEGER UNIQUE NOT NULL REFERENCES referees,
    linesman_away INTEGER UNIQUE NOT NULL REFERENCES referees,
    date DATE NOT NULL,
    WINNER INTEGER REFERENCES teams DEFAULT IS NULL
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    game INTEGER REFERENCES games
    scorer INTEGER NOT NULL REFERENCES players,
    assist INTEGER REFERENCES players
);

CREATE TABLE cards
(
    id SERIAL PRIMARY KEY,
    player INTEGER NOT NULL REFERENCES players,
    referee INTEGER NOT NULL REFERENCES referees,
    game INTEGER NOT NULL REFERENCES games,
    red_or_yellow TEXT NOT NULL
);
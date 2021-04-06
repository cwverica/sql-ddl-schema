-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE albums
(
 id SERIAL PRIMARY KEY,
 name TEXT NOT NULL,
 release_date DATE NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL
);

CREATE TABLE artists_on_song
(
  id SERIAL PRIMARY KEY,
  song INTEGER NOT NULL REFERENCES songs,
  artist INTEGER NOT NULL REFERENCES artists
);

CREATE TABLE producers_on_song
(
  id SERIAL PRIMARY KEY,
  song INTEGER NOT NULL REFERENCES songs,
  producer INTEGER NOT NULL REFERENCES producers
);

CREATE TABLE songs_on_album
(
  id SERIAL PRIMARY KEY,
  album INTEGER NOT NULL REFERENCES albums,
  song INTEGER NOT NULL REFERENCES songs
);



INSERT INTO songs
  (title, duration_in_seconds)
VALUES
  ('MMMBop', 238),
  ('Bohemian Rhapsody', 355),
  ('One Sweet Day', 282),
  ('Shallow', 216),
  ('How You Remind Me', 223),
  ('New York State of Mind', 276),
  ('Dark Horse', 215),
  ('Moves Like Jagger', 201),
  ('Complicated', 244),
  ('Say My Name', 240);


INSERT INTO artists
 (name)
VALUES
 ('Hanson'), ('Queen'), ('Mariah Carey'), ('Boyz II Men'),
 ('Lady Gaga'), ('Bradley Cooper'), ('Nickelback'),
 ('Jay Z'), ('Alicia Keys'), ('Katy Perry'), ('Juicy J'),
 ('Maroon 5'), ('Christina Aguilera'), ('Avril Lavigne'),
 ('Destiny''s Child');

INSERT INTO producers
 (name)
VALUES
 ('Dust Brothers'), ('Stephen Lironi'), ('Roy Thomas Baker'),
 ('Walter Afanasieff'), ('Benjamin Rice'), ('Rick Parashar'),
 ('Al Shux'), ('Max Martin'), ('Cirkut'), ('Shellback'),
 ('Benny Blanco'), ('The Matrix'), ('Darkchild');

INSERT INTO albums
 (name, release_date)
VALUES
('Middle of Nowhere', '04-15-1997'),
('A Night at the Opera', '10-31-1975'),
('Daydream', '11-14-1995'),
('A Star Is Born', '09-27-2018'),
('Silver Side Up', '08-21-2001'),
('The Blueprint 3', '10-20-2009'),
('Prism', '12-17-2013'),
('Hands All Over', '06-21-2011'),
('Let Go', '05-14-2002'),
('The Writing''s on the Wall', '11-07-1999');

INSERT INTO artists_on_song
 (song, artist)
VALUES
 (1, 1), (2, 2), (3, 3), (3, 4), (4, 5), (4, 6), (5, 7),
 (6, 8), (6, 9), (7, 10), (7, 11), (8, 12), (8, 13),
 (9, 14), (10, 15);

INSERT INTO producers_on_song
 (song, producer)
VALUES
 (1, 1), (1, 2), (2, 3), (3, 4), (4, 5), (5, 6), (6, 7),
 (7, 8), (7, 9), (8, 10), (8, 11), (9, 12), (10, 13);

INSERT INTO songs_on_album
 (album, song)
VALUES
 (1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6), (7, 7),
 (8, 8), (9, 9), (10, 10);
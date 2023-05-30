INSERT INTO Musician (musician_name)
VALUES
('The Prodigy'),
('Noisia'),
('Aphrodite'),
('Bou'),
('Goldie'),
('A.M.C.'),
('Pendulum'),
('TC');

INSERT INTO Genre (genre_name)
VALUES
('intelligent'),
('neurofunk'),
('big beat'),
('liquid'),
('jungle');

INSERT INTO  Album (album_name, year)
VALUES
('The fat of the land', '30-06-1997'),
('Could this be', '15-07-2018'),
('Urban junglist', '22-12-2003'),
('Scorpio', '17-03-2019'),
('Inner city life', '11-02-1994'),
('Energy', '16-06-2019'),
('Hold your color', '14-10-2005'),
('Do not play', '01-01-2016');

INSERT INTO Collection (collection_name, collection_year)
VALUES
('Pirate Station', '14-02-2007'),
('Drum and bass Arena', '15-01-2001'),
('Ultra', '15-06-2006'),
('Time of night', '02-03-2015'),
('Tommorowland', '09-05-2019'),
('Love parade', '16-04-2006'),
('Dubplate', '30-08-1990'),
('Bassportal', '12-11-2022');

INSERT INTO Track (track_name, track_length, album_id)
VALUES
('Smack My Bitch Up (feat. Shahin Badar)', '343', 1),
('Breathe', '335', 1),
('Diesel Power', '258', 1),
('Funky Shit', '318', 1),
('Serial Thrilla', '311', 1),
('Mindfields', '340', 1),
('Narayan', '566', 1),
('Firestarter', '282', 1),
('Stigma', '356', 2),
('Stalker', '331', 3),
('Streetside', '219', 4),
('Inner city life', '261', 5),
('Bass', '276', 6),
('Hold your color', '322', 7),
('Tap ho', '280' , 8);

INSERT INTO MusicianAlbum (album_id, musician_id)
VALUES
(1, 6),
(2, 1),
(3, 3),
(3, 7),
(5, 1),
(6, 2),
(7, 2),
(8, 4);

INSERT INTO GenreMusician (genre_id, musician_id)
VALUES
(1, 8),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(2, 2),
(2, 4),
(2, 5),
(3, 1),
(4, 4),
(4, 6),
(5, 3);

INSERT INTO CollectionTrack (track_id, collection_id)
values
(46,1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1);
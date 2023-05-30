CREATE TABLE IF NOT EXISTS Genre
(
	genre_id serial PRIMARY KEY,
	genre_name VARCHAR(60) NOT NULL
);
CREATE TABLE IF NOT EXISTS Musician
(
	musician_id serial PRIMARY KEY,
	musician_name VARCHAR(60) NOT NULL
);
CREATE TABLE IF NOT EXISTS GenreMusician
(
	genre_id int REFERENCES Genre(genre_id),
	musician_id int REFERENCES Musician(musician_id),
	CONSTRAINT genre_musician_id PRIMARY KEY (genre_id, musician_id)
);
CREATE TABLE IF NOT EXISTS Album
(
	album_id serial PRIMARY KEY,
	album_name VARCHAR(70) NOT NULL,
	YEAR date NOT NULL
);
CREATE TABLE IF NOT EXISTS MusicianAlbum
(
	musician_id int REFERENCES Musician(musician_id),
	album_id int REFERENCES Album(album_id),
	CONSTRAINT musician_album_id PRIMARY KEY (musician_id,album_id)
);
CREATE TABLE IF NOT EXISTS Collection
(
	collection_id serial PRIMARY KEY,
	collection_name VARCHAR(70) NOT NULL,
	collection_year date NOT NULL
);
CREATE TABLE IF NOT EXISTS Track
(
	track_id serial PRIMARY KEY,
	track_name VARCHAR(70) NOT NULL,
	track_length int NOT NULL,
	album_id int REFERENCES Album(album_id)
);
CREATE TABLE IF NOT EXISTS CollectionTrack
(
	track_id int REFERENCES Track(track_id),
	collection_id int REFERENCES Collection(collection_id),
	CONSTRAINT collection_track_id PRIMARY KEY (track_id,collection_id)
);

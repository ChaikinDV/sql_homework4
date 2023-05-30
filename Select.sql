--1 кол-во исполнителей в каждом жанре.
SELECT genre_name, COUNT(musician_name) 
FROM genre g
JOIN genremusician gm ON g.genre_id = gm.genre_id
JOIN musician m ON gm.musician_id = m.musician_id 
GROUP BY genre_name;


--2 кол-во треков, вошедших в альбомы 2019-2020.

SELECT	COUNT(t.track_name) FROM track t
JOIN album a ON t.album_id = a.album_id
WHERE a.year BETWEEN '01-01-2019' AND '01-01-2020';

--3 Средняя продолжительность треков по каждому альбому.

SELECT a.album_name, AVG (t.track_length)
FROM album a JOIN track t 
ON a.album_id = t.album_id
GROUP BY a.album_name;

--4 Все исполнители, которые не выпустили альбомы в 2020 году.

SELECT musician_name FROM musician 
WHERE musician_name  NOT IN (SELECT musician_name
				FROM musician m
				JOIN musicianalbum ma ON m.musician_id = ma.musician_id 
				JOIN album a ON ma.album_id = a.album_id
				WHERE year BETWEEN '01-01-2020' AND '31-12-2020');
			
-- 5 Названия сборников, в которых присутствует конкретный исполнитель.
SELECT collection_name FROM collection c
JOIN collectiontrack ct ON ct.collection_id = c.collection_id
JOIN album a ON a.album_id  = c.collection_id
JOIN musicianalbum ma ON ma.album_id  = a.album_id 
JOIN musician m ON m.musician_id  = ma.musician_id 
WHERE musician_name = 'The Prodigy';

--6 Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT DISTINCT(album_name) FROM album a
JOIN musicianalbum ma ON a.album_id = ma.album_id 
JOIN musician m ON ma.musician_id = m.musician_id
JOIN genremusician gm ON m.musician_id  = gm.musician_id 
JOIN genre g ON gm.genre_id = g.genre_id
GROUP BY album_name, m.musician_id
HAVING COUNT(gm.genre_id) > 1;

--7 Наименования треков, которые не входят в сборники.
SELECT track_name FROM track t 
LEFT JOIN collectiontrack ct ON t.track_id = ct.track_id 
WHERE ct.track_id IS  NULL;

--8 Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.

SELECT musician_name FROM musician m 
JOIN musicianalbum ma ON m.musician_id =  ma.musician_id 
JOIN album a ON ma.album_id = a.album_id
JOIN track t ON a.album_id = t.album_id 
WHERE track_length = (SELECT min(track_length) FROM track);

--9 Названия альбомов, содержащих наименьшее количество треков.
SELECT album_name FROM album a
JOIN track t ON a.album_id = t.album_id
GROUP BY a.album_name
HAVING COUNT(t.track_name) = (SELECT count(t.track_name)
FROM track t JOIN album a ON t.album_id = a.album_id
GROUP BY a.album_name
ORDER BY COUNT(t.track_name)
LIMIT 1);
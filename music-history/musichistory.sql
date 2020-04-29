/* 1. Query all of the entries in the Genre table */
SELECT * FROM Genre;


/* 2. Using the INSERT statement, add one of your favorite artists to the Artist table. */
INSERT INTO Artist (ArtistName, YearEstablished)
VALUES("George", 1900);

SELECT * FROM Artist;

/* 3. Using the INSERT statement, add one, or more, albums by your artist to the Album table. */
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES("George Album", 1900, 2345, "George Records", 28, 1);

SELECT * FROM Album;


/* 4. Using the INSERT statement, add some songs that are on that album to the Song table. */
INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES("Song1", 100, "01/01/1900", 01, 28, 23);

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES("Song2", 200, "01/01/1900", 01, 28, 23);

INSERT INTO Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES("Song3", 300, "01/01/1900", 01, 28, 23);

/* DELETE FROM Song
WHERE SongId=26; */

SELECT * FROM Song;

/* 5. Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added. */

SELECT Song.Title, Album.Title, Artist.ArtistName
FROM Song
LEFT JOIN Album
LEFT JOIN Artist
WHERE Artist.ArtistId=28 AND Song.ArtistId=28 AND Album.ArtistId=28;

/* 6. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence. */
SELECT COUNT(Song.Title), Album.Title
FROM Song
LEFT JOIN Album
WHERE Song.AlbumId = Album.AlbumId
GROUP BY Song.AlbumId;

/*7. Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence. */
SELECT COUNT(Song.Title), Artist.ArtistName
FROM Song
LEFT JOIN Artist
WHERE Song.ArtistId = Artist.ArtistId
GROUP BY Song.ArtistId;

/*8. Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence. */
SELECT COUNT(Song.Title), Genre.Label
FROM Song
LEFT JOIN Genre
WHERE Song.GenreId = Genre.GenreId
GROUP BY Song.GenreId;

/* 9. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration. */
SELECT Title, MAX(AlbumLength)
FROM Album;

/* 10. Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration. */
SELECT Title, MAX(SongLength)
FROM Song;

/* 11. Modify the previous query to also display the title of the album.*/
SELECT Album.Title, Song.Title, MAX(Song.SongLength)
FROM Album
LEFT JOIN SONG
WHERE Song.AlbumId = Album.AlbumId;
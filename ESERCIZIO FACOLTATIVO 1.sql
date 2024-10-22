SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'CHINOOK';

SELECT *
FROM ALBUM
LIMIT 10;

SELECT*
FROM TRACK;

SELECT *
FROM GENRE;

 SELECT Track.Name, Genre.Name
FROM Track
JOIN Genre ON Track.GenreId = Genre.GenreId;

SELECT TITLE, NAME
FROM ARTIST ART 
JOIN ALBUM AL ON art.ArtistId = al.ArtistId;

SELECT 
    Track.Name, 
    Genre.Name, 
    Track.Milliseconds
FROM Track
JOIN Genre ON Track.GenreId = Genre.GenreId;

SELECT *
FROM (
    SELECT Album.TITLE, AVG(Track.Milliseconds) AS AvgDurata
    FROM Track
    JOIN Album ON Track.AlbumId = Album.AlbumId
    GROUP BY Album.TITLE
) AS AlbumDurataMedia;


SELECT *
FROM ARTIST 
JOIN ALBUM ON ARTIST.ARTISTID=ALBUM.ARTISTID;





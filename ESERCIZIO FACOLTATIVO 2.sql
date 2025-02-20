-- 1)
SELECT G.NAME, T.NAME
FROM TRACK T
JOIN GENRE G ON G.GENREID= T.GENREID
WHERE G.NAME = 'POP'OR G.NAME='ROCK';
-- 2)
SELECT AR.NAME, AL.TITLE
FROM ARTIST AS AR
JOIN ALBUM AS AL ON AL.ARTISTID = AR.ARTISTID
WHERE AL.TITLE LIKE '%A%' OR AR.NAME LIKE '%A%';
-- 3)
SELECT T.MILLISECONDS, G.NAME
FROM GENRE AS G
JOIN TRACK AS T ON G.GENREID=T.GENREID
WHERE G.NAME = 'JAZZ' OR T.MILLISECONDS <= 180000;
-- 4)
SELECT TRACKID, MILLISECONDS
FROM TRACK 
WHERE MILLISECONDS >=(SELECT AVG (MILLISECONDS)FROM TRACK);
-- 5)
SELECT MILLISECONDS T, G.NAME
FROM GENRE G
JOIN TRACK T ON T.GENREID =G.GENREID
WHERE MILLISECONDS >= 240000;
-- 6)
SELECT AR.NAME, COUNT(AL.ALBUMID) AS ALBUM_COUNT
FROM ARTIST AS AR
JOIN ALBUM AS AL ON AR.ARTISTID = AL.ARTISTID
GROUP BY AR.NAME
HAVING COUNT(AL.ALBUMID) > 1;
-- 7)
SELECT AL.TITLE 
,T.NAME
, T.MILLISECONDS
FROM TRACK T
JOIN ALBUM AL 
ON AL.ALBUMID = T.ALBUMID
WHERE T.MILLISECONDS = (
    SELECT MAX(TR.MILLISECONDS)
    FROM TRACK TR
    WHERE TR.ALBUMID = AL.ALBUMID
);
-- 8)
SELECT AL.TITLE, T.TRACKID, T.NAME, T.MILLISECONDS
FROM TRACK T
JOIN ALBUM AL ON AL.ALBUMID = T.ALBUMID
WHERE T.MILLISECONDS > (
    SELECT AVG(TR.MILLISECONDS)
    FROM TRACK TR
    WHERE TR.ALBUMID = AL.ALBUMID
);
-- 9)
SELECT AL.TITLE, COUNT(T.TRACKID) AS NUMERO_TRACCE
FROM ALBUM AL
JOIN TRACK T ON AL.ALBUMID = T.ALBUMID
GROUP BY AL.ALBUMID, AL.TITLE
HAVING COUNT(T.TRACKID) > 20;









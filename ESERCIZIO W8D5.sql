-- 1)
SELECT  G.NAME, COUNT(T.TRACKID) AS NUMERO_TRACCE
FROM TRACK T
JOIN GENRE G ON T.GENREID = G.GENREID
GROUP BY  G.NAME
HAVING COUNT(T.TRACKID) >= 10
ORDER BY NUMERO_TRACCE DESC;
-- 2)
SELECT TRACKID, NAME, UNITPRICE
FROM TRACK
where mediatypeid <> 3
ORDER BY UNITPRICE DESC
LIMIT 3;
-- 3)
SELECT  AR.NAME, T.NAME AS TRACK_NAME, T.MILLISECONDS
FROM TRACK T
JOIN ALBUM AL ON T.ALBUMID = AL.ALBUMID
JOIN ARTIST AR ON AL.ARTISTID = AR.ARTISTID
WHERE T.MILLISECONDS > 360000;
-- 4)
SELECT  G.NAME
,AVG(T.MILLISECONDS) AS DURATA_MEDIA
FROM TRACK T
JOIN GENRE G
ON T.GENREID = G.GENREID
GROUP BY  G.NAME;
-- 5)
SELECT T.NAME AS TRACK_NAME
, G.NAME AS GENRE_NAME
FROM TRACK T
JOIN GENRE G 
ON T.GENREID = G.GENREID
WHERE T.NAME LIKE '%Love %'
ORDER BY G.NAME ASC, T.NAME ASC;
-- 6)
SELECT M.MEDIATYPEID, M.NAME AS MEDIATYPE_NAME, AVG(T.UNITPRICE) AS COSTO_MEDIO
FROM TRACK T
JOIN MEDIATYPE M ON T.MEDIATYPEID = M.MEDIATYPEID
GROUP BY M.MEDIATYPEID, M.NAME;
-- 7)
SELECT G.NAME AS GENRE_NAME, COUNT(T.TRACKID) AS NUMERO_TRACCE
FROM TRACK T
JOIN GENRE G ON T.GENREID = G.GENREID
GROUP BY  G.NAME
ORDER BY NUMERO_TRACCE DESC
LIMIT 1;


-- 8)
SELECT AR.ARTISTID, AR.NAME, COUNT(AL.ALBUMID) AS NUMERO_ALBUM
FROM ARTIST AR
JOIN ALBUM AL ON AR.ARTISTID = AL.ARTISTID
GROUP BY AR.ARTISTID, AR.NAME
HAVING COUNT(AL.ALBUMID) = (
    SELECT COUNT(AL.ALBUMID)
    FROM ARTIST AR
    JOIN ALBUM AL ON AR.ARTISTID = AL.ARTISTID
    WHERE AR.NAME = 'Rolling Stones'
);

-- 9)
SELECT AR.ARTISTID, AR.NAME, SUM(T.UNITPRICE) AS COSTO_TOTALE_ALBUM
FROM TRACK T
JOIN ALBUM AL ON T.ALBUMID = AL.ALBUMID
JOIN ARTIST AR ON AL.ARTISTID = AR.ARTISTID
GROUP BY AR.ARTISTID, AR.NAME, AL.ALBUMID
ORDER BY COSTO_TOTALE_ALBUM DESC
LIMIT 1;
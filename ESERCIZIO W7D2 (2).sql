SELECT *
FROM dimproduct;

SELECT 
    ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    Color,
    StandardCost,
    FinishedGoodsFlag
FROM dimproduct;

SELECT 
    ProductKey,
    ProductAlternateKey,
    EnglishProductName,
    Color,
    StandardCost,
    FinishedGoodsFlag
FROM dimproduct
WHERE FinishedGoodsFlag = 1;

SELECT ProductKey,StandardCost,ListPrice
FROM dimproduct
WHERE ProductAlternateKey IN ('FR%', 'BK%');

SELECT ProductKey,StandardCost,ListPrice, ListPrice - StandardCost AS Markup
FROM dimproduct
WHERE ProductAlternateKey IN ('FR%', 'BK%');

SELECT FinishedGoodsFlag
FROM dimproduct
WHERE FinishedGoodsFlag=1
AND ListPrice BETWEEN 1000 AND 2000 
order by ListPrice ASC;

SELECT *
FROM dimemployee
WHERE SalesPersonFlag = 1;

SELECT *
FROM factinternetsales
WHERE OrderDate >= '2020-01-01'
AND ProductKey IN (597,598,477,214);




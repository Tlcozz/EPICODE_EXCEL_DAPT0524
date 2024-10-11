SELECT p.productkey, p.EnglishProductName
FROM DimProduct P
JOIN DimProductSubcategory S ON P.ProductSubcategoryKey = S.ProductSubcategoryKey;

SELECT p.productkey, p.EnglishProductName
FROM dimproduct p
JOIN DimProductSubcategory S ON P.ProductSubcategoryKey = S.ProductSubcategoryKey
JOIN dimproductcategory C ON S. ProductSubcategoryKey = C. ProductCategoryKey;

SELECT DISTINCT P.PRODUCTKEY, P. ENGLISHPRODUCTNAME
FROM DIMPRODUCT P 
JOIN factresellersales R ON P.ProductKey = R.ProductKey;

SELECT P.PRODUCTKEY, P.EnglishProductName
FROM DIMPRODUCT P
LEFT JOIN factresellersales R ON P. PRODUCTKEY= R.PRODUCTKEY
WHERE R.PRODUCTKEY IS NULL AND P.FinishedGoodsFlag=1;

SELECT R.SALESORDERNUMBER, P.EnglishProductName, R.ORDERDATE, R.SALESAMOUNT
FROM factresellersales r
JOIN DIMPRODUCT P ON R.PRODUCTKEY=P. PRODUCTKEY;

SELECT R.SALESORDERNUMBER, P.EnglishProductName, R.ORDERDATE, R.SALESAMOUNT
FROM factresellersales r
JOIN DIMPRODUCT P ON R.PRODUCTKEY=P. PRODUCTKEY
JOIN dimproductsubcategory S ON P.ProductSubcategoryKey= S.ProductSubcategoryKey
JOIN dimproductcategory C ON S.ProductCategoryKey= C.ProductCategoryKey;

SELECT *
FROM DIMRESELLER;

SELECT R.RESELLERKEY, G.GeographyKey
FROM DIMRESELLER R
JOIN dimgeography G ON R.GeographyKey= G.GeographyKey;

SELECT salesordernumber, salesorderlinenumber, orderdate, unitprice, orderquantity, totalproductcost
FROM FactResellerSales R
JOIN DimProduct P ON R.ProductKey = P.ProductKey
JOIN DimProductSubcategory S ON P.ProductSubcategoryKey = S.ProductSubcategoryKey
JOIN DimProductCategory C ON S.PRODUCTCATEGORYKEY = C.ProductCATEGORYKEY
JOIN DimReseller RE ON R.ResellerKEY = RE.ResellerKEY
JOIN DimGeography G ON RE.GeographyKey = G.GeographyKey;






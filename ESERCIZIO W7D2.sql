DESCRIBE DimProduct;
SELECT COLUMN_NAME, DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'DimProduct';
SELECT 
    ProductKey AS CodiceProdotto, 
    ProductAlternateKey AS ModelloProdotto, 
    EnglishProductName AS NomeProdotto, 
    Color AS Colore, 
    StandardCost AS CostoStandard, 
    FinishedGoodsFlag AS ProdottoFinito
FROM DimProduct;
SELECT 
    ProductKey AS CodiceProdotto, 
    ProductAlternateKey AS ModelloProdotto, 
    EnglishProductName AS NomeProdotto, 
    Color AS Colore, 
    StandardCost AS CostoStandard, 
    FinishedGoodsFlag AS ProdottoFinito
FROM DimProduct
WHERE FinishedGoodsFlag = 1;
SELECT 
    ProductKey AS CodiceProdotto, 
    ProductAlternateKey AS ModelloProdotto, 
    EnglishProductName AS NomeProdotto, 
    StandardCost AS CostoStandard, 
    ListPrice AS PrezzoDiListino
FROM DimProduct
WHERE ProductAlternateKey LIKE 'FR%' OR ProductAlternateKey LIKE 'BK%';
SELECT 
    ProductKey AS CodiceProdotto, 
    ProductAlternateKey AS ModelloProdotto, 
    EnglishProductName AS NomeProdotto, 
    StandardCost AS CostoStandard, 
    ListPrice AS PrezzoDiListino,
    (ListPrice - StandardCost) AS Markup
FROM DimProduct
WHERE ProductAlternateKey LIKE 'FR%' OR ProductAlternateKey LIKE 'BK%';
SELECT 
    ProductKey AS CodiceProdotto, 
    ProductAlternateKey AS ModelloProdotto, 
    EnglishProductName AS NomeProdotto, 
    StandardCost AS CostoStandard, 
    ListPrice AS PrezzoDiListino
FROM DimProduct
WHERE FinishedGoodsFlag = 1
  AND ListPrice BETWEEN 1000 AND 2000;
DESCRIBE DimEmployee;
SELECT 
    EmployeeKey AS CodiceImpiegato, 
    FirstName AS Nome, 
    LastName AS Cognome
FROM DimEmployee
WHERE SalespersonFlag = 1;
SELECT 
    ProductKey AS CodiceProdotto, 
    SalesOrderNumber AS NumeroOrdine, 
    SalesAmount AS ImportoVendita, 
    TotalProductCost AS CostoProdottoTotale, 
    (SalesAmount - TotalProductCost) AS Profitto
FROM FactResellerSales
WHERE OrderDate >= '2020-01-01'
  AND ProductKey IN (597, 598, 477, 214);



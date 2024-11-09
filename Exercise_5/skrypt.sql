-- A)
SELECT OrderDate, COUNT(OrderQuantity) AS Orders_cnt
FROM dbo.FactInternetSales
GROUP BY OrderDate
HAVING COUNT(OrderQuantity) < 100
ORDER BY Orders_cnt DESC;

-- B)
WITH RankedProducts AS (
    SELECT 
        OrderDate,
        ProductKey,
        UnitPrice,
        ROW_NUMBER() OVER (PARTITION BY OrderDate ORDER BY UnitPrice DESC) AS RowNum
    FROM 
        dbo.FactInternetSales
)
SELECT 
    OrderDate,
    ProductKey,
    UnitPrice
FROM 
    RankedProducts
WHERE 
    RowNum <= 3
ORDER BY 
    OrderDate, UnitPrice DESC;

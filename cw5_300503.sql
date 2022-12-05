--Ta sama analiza co SSIS
SELECT COUNT (OrderDateKey) AS Orders_cnt, OrderDate  FROM [FactInternetSales]
GROUP BY OrderDate 
ORDER BY Orders_cnt DESC

--Dodatkowe warunki z zad 8
--pkt a).
SELECT COUNT (OrderDateKey) AS Orders_cnt, OrderDate FROM [FactInternetSales]
GROUP BY OrderDate 
HAVING  COUNT (OrderDateKey) < 100
ORDER BY Orders_cnt DESC

--pkt b).
WITH TOP3 AS
(
SELECT OrderDate, UnitPrice, ROW_NUMBER() OVER(PARTITION BY OrderDate ORDER BY UnitPrice DESC) AS TopPricePosition 
FROM [FactInternetSales]
)
SELECT OrderDate, UnitPrice FROM TOP3
WHERE TopPricePosition <= 3
ORDER BY OrderDate
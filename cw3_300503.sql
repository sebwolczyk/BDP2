--EXECUTE cw3_300503 @YearsAgo = 9

CREATE PROCEDURE cw3_300503 @YearsAgo INT
AS
BEGIN
SELECT * FROM AdventureWorksDW2019.dbo.FactCurrencyRate AS FCR INNER JOIN AdventureWorksDW2019.dbo.DimCurrency AS DC 
ON FCR.CurrencyKey=DC.CurrencyKey
WHERE DATEDIFF("year",FCR.Date,GETDATE()) = @YearsAgo
AND MONTH(FCR.Date) = MONTH(GETDATE())
AND DAY(FCR.Date) = DAY(GETDATE())
AND (DC.CurrencyAlternateKey = 'GBP' OR DC.CurrencyAlternateKey = 'EUR');
END
GO

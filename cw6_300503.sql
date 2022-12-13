--2.
--SELECT * FROM DimEmployee
--DROP TABLE stg_dimemp

SELECT EmployeeKey, FirstName, LastName, Title INTO stg_dimemp FROM DimEmployee
WHERE EmployeeKey <= 275
AND EmployeeKey >= 270

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = N'stg_dimemp')
	BEGIN
		DROP TABLE stg_dimemp
		SELECT EmployeeKey, FirstName, LastName, Title INTO stg_dimemp FROM DimEmployee
		WHERE EmployeeKey <= 275
		AND EmployeeKey >= 270

		PRINT 'Table created successfully'
	END
ELSE PRINT 'Table does not exist'
GO

--DROP TABLE scd_dimemp;
CREATE TABLE scd_dimemp (
 EmployeeKey int ,
 FirstName nvarchar(50) not null,
 LastName nvarchar(50) not null,
 Title nvarchar(50),
 StartDate datetime,
 EndDate datetime,
 PRIMARY KEY(EmployeeKey)
);
INSERT INTO scd_dimemp 
SELECT EmployeeKey, FirstName, LastName, Title, StartDate, EndDate FROM DimEmployee
WHERE EmployeeKey <= 275
AND EmployeeKey >= 270

update STG_DimEmp
set LastName = 'Nowak'
where EmployeeKey = 270;

update STG_DimEmp
set TITLE = 'Senior Design Engineer'
where EmployeeKey = 274;

update STG_DimEmp
set FIRSTNAME = 'Ryszard'
where EmployeeKey = 275

SELECT * FROM stg_dimemp
SELECT * FROM scd_dimemp
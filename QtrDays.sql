CREATE FUNCTION RPT.QTRDAYS (@DATE [datetime]) RETURNS DECIMAL(10,2)
AS
BEGIN
  
DECLARE @Q1 INT
SET @Q1 = 91
DECLARE @Q2 INT
SET @Q2 = 92
DECLARE @Q3 INT
SET @Q3 = 92
DECLARE @Q4 INT
SET @Q4 =  (CASE WHEN YEAR(@DATE)%4 == 0 THEN 91 ELSE 90 END)

IF MONTH(@DATE) = 1
BEGIN RETURN CAST(DAY(@DATE) AS DECIMAL(10,2))/@Q4 END

IF MONTH(@DATE) = 2
BEGIN RETURN CAST(31 + DAY(@DATE) AS DECIMAL(10,2))/@Q4 END

IF MONTH(@DATE) = 3
BEGIN RETURN CAST(31 + (CASE WHEN YEAR(@DATE)%4 == 0 THEN 29 ELSE 28 END) + DAY(@DATE) AS DECIMAL(10,2))/@Q4 END

IF MONTH(@DATE) = 4
BEGIN RETURN CAST(DAY(@DATE) AS DECIMAL(10,2))/@Q1 END

IF MONTH(@DATE) = 5
BEGIN RETURN CAST(30 + DAY(@DATE) AS DECIMAL(10,2))/@Q1 END

IF MONTH(@DATE) = 6
BEGIN RETURN CAST(30 + 31 + DAY(@DATE) AS DECIMAL(10,2))/@Q1 END

IF MONTH(@DATE) = 7
BEGIN RETURN CAST(DAY(@DATE) AS DECIMAL(10,2))/@Q2 END

IF MONTH(@DATE) = 8
BEGIN RETURN CAST(31 + DAY(@DATE) AS DECIMAL(10,2))/@Q2 END

IF MONTH(@DATE) = 9
BEGIN RETURN CAST(31 + 31 + DAY(@DATE) AS DECIMAL(10,2))/@Q2 END

IF MONTH(@DATE) = 10
BEGIN RETURN CAST(DAY(@DATE) AS DECIMAL(10,2))/@Q3 END

IF MONTH(@DATE) = 11
BEGIN RETURN CAST(31 + DAY(@DATE) AS DECIMAL(10,2))/@Q3 END 

IF MONTH(@DATE) = 12
BEGIN RETURN CAST(31 + 30 + DAY(@DATE) AS DECIMAL(10,2))/@Q3 END

END
GO

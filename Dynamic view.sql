DECLARE @SQL NVARCHAR(1000) 
SET @SQL = N'EXEC(''CREATE VIEW DBO.TEST AS SELECT * FROM DBO.SALES'')
EXEC @SQL
   

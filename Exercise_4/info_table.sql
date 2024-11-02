EXEC sp_help 'dbo.FactInternetSales'; --MSSQL

SELECT * FROM all_tab_cols WHERE table_name = 'FACTINTERNETSALES' --ORACLE

SELECT * FROM information_schema.columns WHERE table_name = 'factinternetsales'; --PostgreSQL

DESCRIBE dbo.FactInternetSales; --MySQL

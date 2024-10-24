DECLARE @YearsAgo INT = 12

SELECT *
  FROM [AdventureWorksDW2019].[dbo].[FactCurrencyRate] fcr
  INNER JOIN [dbo].DimCurrency dc ON fcr.CurrencyKey = dc.CurrencyKey
  WHERE (CAST(Date AS DATE) = CAST(DATEADD(YEAR, -@YearsAgo, GETDATE()) AS DATE))
  AND (CurrencyAlternateKey = 'GBP' OR CurrencyAlternateKey = 'EUR')

--RӯNICE POMI�DZY KWEREND�, PROCESEM ETL

--K - Dane pobierane s� z bazy danych, nast�pnie przetwarzane za pomoc� zapyta�
--E - Dane mog� by� pobierane z r�nych �r�de�, integrowane i zapisywane do r�nego docelowego tyu b�d� systemu

--K -Proces obejmuje zapytania 
--E -Proces sk�ada si� z ekstrkcji, transformacji i �adowania

--K -Wykorzystuje np. SQL Server, Oracle, MySQL
--E -Wykorzystuje np. SSIS, Informatica

--Wady i zalety

--ZALETY:
--* �atwiejsza centralizacja danych dzi�ki ��czeniu ich z r�nych system�w
--* Korzystniejsze podej�cie dla hurtowni danych
--* Latwiejsze w utrzymaniu ni� r�czne poprawianie kodu
--* �atwiejsze do zrozumienia przy skomplikowanych transformacjach danych
--* ETL mo�e by� zaplanowane i zautomatyzowane, co pozwala na regularne aktualizowanie danych w hurtowniach danych bez interwencji manualnej

--WADY:
--* Wdro�enie i utrzymanie systemu ETL mo�e by� kosztowne i trudne
--* Nie nadaj� si� do real-time danych
--* B��dy w procesie ETL mog� prowadzi� do utraty danych lub b��dnych wynik�w analizy.
--* ETL jest silnie uzale�niony od �r�de� danych. Zmiany w strukturze danych lub format�w w �r�d�ach mog� wymaga� aktualizacji w procesie ETL
 
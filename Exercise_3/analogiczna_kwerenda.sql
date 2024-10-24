DECLARE @YearsAgo INT = 12

SELECT *
  FROM [AdventureWorksDW2019].[dbo].[FactCurrencyRate] fcr
  INNER JOIN [dbo].DimCurrency dc ON fcr.CurrencyKey = dc.CurrencyKey
  WHERE (CAST(Date AS DATE) = CAST(DATEADD(YEAR, -@YearsAgo, GETDATE()) AS DATE))
  AND (CurrencyAlternateKey = 'GBP' OR CurrencyAlternateKey = 'EUR')

--RÓ¯NICE POMIÊDZY KWEREND¥, PROCESEM ETL

--K - Dane pobierane s¹ z bazy danych, nastêpnie przetwarzane za pomoc¹ zapytañ
--E - Dane mog¹ byæ pobierane z ró¿nych Ÿróde³, integrowane i zapisywane do ró¿nego docelowego tyu b¹dŸ systemu

--K -Proces obejmuje zapytania 
--E -Proces sk³ada siê z ekstrkcji, transformacji i ³adowania

--K -Wykorzystuje np. SQL Server, Oracle, MySQL
--E -Wykorzystuje np. SSIS, Informatica

--Wady i zalety

--ZALETY:
--* £atwiejsza centralizacja danych dziêki ³¹czeniu ich z ró¿nych systemów
--* Korzystniejsze podejœcie dla hurtowni danych
--* Latwiejsze w utrzymaniu ni¿ rêczne poprawianie kodu
--* £atwiejsze do zrozumienia przy skomplikowanych transformacjach danych
--* ETL mo¿e byæ zaplanowane i zautomatyzowane, co pozwala na regularne aktualizowanie danych w hurtowniach danych bez interwencji manualnej

--WADY:
--* Wdro¿enie i utrzymanie systemu ETL mo¿e byæ kosztowne i trudne
--* Nie nadaj¹ siê do real-time danych
--* B³êdy w procesie ETL mog¹ prowadziæ do utraty danych lub b³êdnych wyników analizy.
--* ETL jest silnie uzale¿niony od Ÿróde³ danych. Zmiany w strukturze danych lub formatów w Ÿród³ach mog¹ wymagaæ aktualizacji w procesie ETL
 
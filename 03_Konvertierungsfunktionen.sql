USE Northwind;

SELECT CAST(GETDATE() AS date); --Nur Datum von heute ausgeben

SELECT CAST(GETDATE() AS time); --Nur Zeit von heute ausgeben

SELECT HireDate, CAST(HireDate AS date) FROM Employees; --CAST auf eine Spalte

SELECT '123' + 3; --Automatische konvertierung (123 + 3 = 126)

SELECT '123.4' + 3; --Nicht möglich (nur int möglich)

SELECT CAST('123.4' AS float) + 3; --Explizit konvertieren

SELECT CAST('123.4' AS decimal(4, 2)) + 3; --DECIMAL: Dezimalzahl mit fixer Anzahl Vor- und Nachkommastellen

SELECT CAST(GETDATE() AS varchar); --Etwas schönere Form von einem Datum

SELECT CAST(GETDATE() AS varchar(11)); --Bei Konvertierung nur die ersten 11 Zeichen nehmen (nicht praktikabel)

SELECT CAST('2022-08-01' AS date); --String zu Datum konvertieren

SELECT CAST('2022-08-01' AS datetime); --Auch Zeit hinzufügen

SELECT CAST('01/08/2022' AS date); --Format beachten
SELECT CAST('01.08.2022' AS date); --Funktionieren hier beide

--------------------------------------------------------------------------

SELECT CONVERT(DATE, GETDATE()); --CONVERT: selbiges wie Cast nur andere Schreibweise (Typ zuerst, dann Wert)

--https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-2017#date-and-time-styles
SELECT CONVERT(varchar, GETDATE(), 104); --01.08.2022

SELECT CONVERT(varchar, GETDATE(), 4); --01.08.22

---------------------------------------------------------------------------

/*
Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, n = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

SELECT FORMAT(GETDATE(), 'yyyy-MM-dd'); --Datumsformat mit hoher Präzision angeben

SELECT FORMAT(GETDATE(), 'yyyy MM dd');

SELECT FORMAT(GETDATE(), 'MMMM dddd'); --MMMM: schönes Monat, dddd: schöner Tag

SELECT FORMAT(GETDATE(), 'dddd, dd. MMMM yyyy hh:mm:ss'); --Schönstes mögliches deutsches Datum

SELECT FORMAT(GETDATE(), 'd'); --01.08.2022

SELECT FORMAT(GETDATE(), 'D'); --Montag, 01. August 2022

SELECT FORMAT(1234, 'Die Zahl ist ####'); --mit # einen Platzhalter schaffen für den Wert

SELECT FORMAT(1234, '#-#'); --Erste # hält 3 Zeichen, zweite eines

SELECT FORMAT(12345, '#§#_#'); --Letzte Rauten haben jeweils 1 Zeichen, die erste hat den Rest

SELECT FORMAT(HireDate, 'dd.MM.yyyy') FROM Employees; --Spalte in Tabelle formatieren

SELECT FORMAT(HireDate, 'd') FROM Employees; --Gleiches Ergebnis wie oben nur kürzer

SELECT FORMAT(HireDate, 'D') FROM Employees; --Gleiches Ergebnis wie oben nur kürzer
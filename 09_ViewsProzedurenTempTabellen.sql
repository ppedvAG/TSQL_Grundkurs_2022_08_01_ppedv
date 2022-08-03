USE Northwind;
GO --Mit GO ein Batch schließen

--CREATE VIEW <Name> AS <SQL-Statement> GO
--Statische Snapshot eines Teils der Datenbank
--v_ um Views von anderen Datenbankobjekten zu differenzieren
--kein ORDER BY

CREATE VIEW v_Countries
AS
	SELECT DISTINCT Country FROM Customers;
GO

--View ansprechen
SELECT * FROM v_Countries;

--View mit WHERE
SELECT * FROM v_Countries
WHERE Country LIKE 'A%';

--ORDER BY erst nach Erstellung der View möglich
SELECT * FROM v_Countries ORDER BY 1;

--View löschen
DROP VIEW v_Countries;

--Vorher prüfen ob View existiert um Fehler zu vermeiden
DROP VIEW IF EXISTS v_Countries;
GO

--CREATE VIEW mit GROUP BY
CREATE VIEW v_CustomersPerCountry
AS
	SELECT Country, COUNT(*) AS AnzKunden
	FROM Customers
	GROUP BY Country;
GO

------------------------------------------------------------------------

--Prozeduren: CREATE PROCEDURE <Name> AS <SQL-Statement(s)> GO
--Fixes Verhalten auf Datenbankebene speichern (u.a. für andere Entwickler oder Clientsoftware)

CREATE PROCEDURE p_Test
AS
	SELECT DISTINCT Country FROM Customers;
	SELECT DISTINCT City FROM Customers;
GO

EXECUTE p_Test; --Prozedur ausführen mit EXECUTE
GO

--Prozedur mit Argument(en) (@Year int -> @<Name> <Typ>)
--PROC statt PROCEDURE (Kurzform)
CREATE PROC p_OrdersByYear @Year int
AS
	SELECT * FROM Orders WHERE YEAR(OrderDate) = @Year; --Parameter einbauen in Abfrage
GO

--EXEC statt EXECUTE (Kurzform)
EXEC p_OrdersByYear @Year = 1997; --Parameter setzen
GO

--Prozedur auch ohne EXEC ausführen
p_Test;
GO

--Prozedur mit zwei Parametern
CREATE PROC p_OrdersBetweenDates @StartDate date, @EndDate date
AS
	SELECT * FROM Orders WHERE OrderDate BETWEEN @StartDate AND @EndDate;
GO

--Prozedur mit mehreren Parametern ausführen, getrennt mit Beistrichen
EXEC p_OrdersBetweenDates @StartDate = '19961130', @EndDate = '19970228';

DROP PROC p_OrdersByYear;
GO

---------------------------------------------------------------------------------

--SELECT INTO: Ergebnis einer Abfrage in eine neue Tabelle schreiben (funktioniert nicht wenn Tabelle bereits existiert)
SELECT CustomerID, Freight
INTO Test
FROM Orders;

--Ergebnis einer Abfrage in eine Temporäre Tabelle einfügen mit # am Anfang des Tabellennamens
SELECT CustomerID, Freight
INTO #Test
FROM Orders;

--Temporäre Tabelle bleibt nur bis zu Ende der Session bestehen + ein paar Minuten
SELECT * FROM #Test;

--Globale Temporäre Tabelle (mit zwei #), kann jeder Datenbankbenutzer angreifen, wird gelöscht der Ersteller die Session beendet
SELECT CustomerID, Freight
INTO ##Test
FROM Orders;
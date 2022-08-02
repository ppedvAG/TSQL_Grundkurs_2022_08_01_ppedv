USE Northwind;

SELECT * FROM Customers ORDER BY Country; --ORDER BY: Tabelle nach einer Spalte sortieren

SELECT * FROM Customers ORDER BY Country, City; --Sortierung nach mehreren Spalten (Primär: Country, Sekundär: City)

SELECT * FROM Customers ORDER BY Country DESC, ContactName ASC; --ASC/DESC: Sortierrichtung angeben (DESC -> Absteigend, ASC -> Aufsteigend, Standard)

SELECT CustomerID, Address, Phone, Country FROM Customers ORDER BY 3; --Nach Phone sortieren

SELECT CustomerID, Address, Phone, Country FROM Customers ORDER BY 3, 1; --Nach Phone, danach nach CustomerID sortieren

SELECT * FROM Customers ORDER BY 2; --Funktioniert auch bei *

SELECT CONCAT_WS(' ', TitleOfCourtesy, FirstName, LastName) AS FullName FROM Employees ORDER BY FullName; --Nach Alias sortieren

-------------------------------------------------------------------------------------------

SELECT Country FROM Customers ORDER BY 1; --Duplikate

SELECT DISTINCT Country
FROM Customers ORDER BY 1; --Keine Duplikate mehr (91 -> 22)

SELECT DISTINCT City, Country FROM Customers ORDER BY 1; --Kombinationen von Duplikaten entfernen

SELECT COUNT(*) FROM Customers; --Anzahl der Customer

SELECT COUNT(DISTINCT Country) FROM Customers; --Einzigartige Countries zählen

-------------------------------------------------------------------------------------------

SELECT TOP 10 * FROM Orders; --Obersten 10 Datensätze der Tabelle

SELECT TOP 10 * FROM Orders ORDER BY Freight; --TOP macht nur wirklich Sinn mit ORDER BY oder WHERE (10 billigsten Bestellungen)

SELECT TOP 10 * FROM Orders ORDER BY Freight DESC; --10 teuersten Bestellungen

SELECT TOP 2 PERCENT * FROM Orders ORDER BY Freight; --Top 2% der billigsten Bestellungen

SELECT TOP 2 PERCENT * FROM Orders ORDER BY Freight DESC; --Top 2% der teuersten Bestellungen

SELECT TOP 5 PERCENT
CustomerID,
CompanyName,
ContactName,
Phone,
City
FROM Customers
ORDER BY City; --Einzelne Spalten statt *

SELECT TOP 1 PERCENT WITH TIES *
FROM [Order Details]
ORDER BY Quantity; --WITH TIES: Mit unentschieden (22 -> 69)
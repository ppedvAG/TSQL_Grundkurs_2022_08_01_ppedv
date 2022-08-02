USE Northwind;

SELECT COUNT(*) FROM Customers; --Anzahl an Customers

SELECT COUNT(*) FROM Customers WHERE Country = 'UK'; --Anzahl Customer aus UK (7)

SELECT COUNT(DISTINCT Country) FROM Customers; --Anzahl Countries (22)

SELECT 
MIN(Freight) AS BilligsteBestellung, --MIN: kleinster Wert der Spalte 
MAX(Freight) AS TeuersteBestellung, --MAX: größter Wert der Spalte
AVG(Freight) AS Durchschnittskosten, --AVG: Durchschnittlicher Wert der Spalte
SUM(Freight) AS Gesamtkosten --SUM: Summe der Spalte
FROM Orders;

SELECT TOP 1 Freight FROM Orders ORDER BY Freight; --Billigste
SELECT TOP 1 Freight FROM Orders ORDER BY Freight DESC; --Teuerste

SELECT AVG(Freight) FROM Orders WHERE Freight >= 50; --Mit WHERE Datenmenge noch weiter eingrenzen

-------------------------------------------------------------------------------------------

SELECT * FROM Orders ORDER BY EmployeeID; --1er Gruppe (10258, 10270, 10275, ...), 2er Gruppe (11073, 11070, 11060, ...) , ...

SELECT * FROM Orders GROUP BY EmployeeID; --Nicht möglich

SELECT COUNT(*) FROM Orders GROUP BY EmployeeID; --Anzahl aller Datensätze in jeder Gruppe

SELECT COUNT(*), AVG(Freight) FROM Orders GROUP BY EmployeeID; --Anzahl aller Datensätze + Durchschnittskosten pro Gruppe

SELECT 
EmployeeID, --EmployeeID hier möglich da diese Spalte im GROUP BY enthalten ist
COUNT(*) AS AnzahlOrders, 
AVG(Freight) AS Durchschnittskosten,
SUM(Freight) AS Summe --Alle Aggregatsfunktionen hier möglich
FROM Orders
GROUP BY EmployeeID;

SELECT 
EmployeeID, --EmployeeID hier möglich da diese Spalte im GROUP BY enthalten ist
COUNT(*) AS AnzahlOrders, 
AVG(Freight) AS Durchschnittskosten,
SUM(Freight) AS Summe
FROM Orders
GROUP BY EmployeeID
ORDER BY EmployeeID; --Auch ORDER BY hier möglich

SELECT Country, City, COUNT(*)
FROM Customers
GROUP BY Country, City; --GROUP BY mit mehreren Spalten

SELECT Country, City, COUNT(*)
FROM Customers
GROUP BY Country, City
ORDER BY COUNT(*) DESC; --COUNT(*) im ORDER BY

SELECT Country, City, COUNT(*) AS AnzKunden
FROM Customers
GROUP BY Country, City
ORDER BY AnzKunden DESC; --ORDER BY mit AS bei COUNT(*)

-------------------------------------------------------------------------------------

--WHERE vs GROUP BY + HAVING
--WHERE filtert alle Daten bevor sie geholt werden
--HAVING holt alle Daten (nach WHERE) und filtert danach

SELECT CustomerID, COUNT(*) AS Anz
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) > 10 --"WHERE" für GROUP BY
ORDER BY Anz DESC; --Alle Kunden mit mindestens 10 Bestellungen

SELECT CustomerID, COUNT(*) AS Anz, SUM(Freight) AS Summe
FROM Orders
GROUP BY CustomerID
HAVING SUM(Freight) > 1000 --Hier SUM statt COUNT
ORDER BY Summe DESC; --Alle Kunden die mindestens 1000$ Frachtkosten verursacht haben

SELECT
c.CustomerID,
c.ContactName, --Über JOIN ContactName holen
COUNT(o.OrderID) AS AnzBestellungen
FROM Orders o
INNER JOIN Customers c
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.ContactName --Um ID und Name auszugeben müssen beide Spalten im GROUP BY stehen
ORDER BY AnzBestellungen DESC;
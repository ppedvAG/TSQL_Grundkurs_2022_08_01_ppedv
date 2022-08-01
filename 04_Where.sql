--<, >, <=, >=  kleiner, größer, kleiner-gleich, größer-gleich
--=, !=, <>  gleich, ungleich, ungleich (selbe Funktion)
--BETWEEN, IN, LIKE -> BETWEEN: zwischen X und Y (Grenzen inkludiert), IN: Liste für valide Werte angeben
--AND, OR: Bedingungen verknüpfen#
--NOT: Bedingung invertieren

USE Northwind;

SELECT * FROM Orders WHERE Freight >= 50; --Order mit Freight mindestens 50

SELECT * FROM Orders WHERE Freight <= 50; --Order mit Freight nicht mehr als 50

SELECT * FROM Orders WHERE Freight >= 100 AND EmployeeID = 3; --Beide Bedingungen müssen erfüllt sein

SELECT * FROM Orders WHERE Freight >= 50 OR EmployeeID = 1; --Eine von Bedingungen müssen erfüllt sein

SELECT * FROM Orders WHERE Freight BETWEEN 50 AND 100; --BETWEEN: zwischen zwei Werten

SELECT * FROM Orders WHERE EmployeeID BETWEEN 1 AND 3; --Grenzen sind dabei (auch Employees mit IDs 1 und 3 dabei)

SELECT * FROM Orders WHERE CONVERT(DATE, ShippedDate) BETWEEN '1997-01-01' AND '1997-12-31'; --Erster Versuch für BETWEEN mit Datumswerten

SELECT * FROM Orders WHERE ShippedDate BETWEEN '1997-01-01' AND '1997-12-31'; --In MySQL möglich, hier nicht

SELECT * FROM Orders WHERE ShippedDate BETWEEN '19970101' AND '19971231'; --Ohne Bindestriche auch in TSQL möglich

SELECT * FROM Orders WHERE YEAR(ShippedDate) = 1997; --Funktionen auch im WHERE möglich

SELECT * FROM Orders WHERE DATEPART(DAY, ShippedDate) = 12;

SELECT * FROM Orders WHERE ShipCountry = 'Austria' OR ShipCountry = 'Germany' OR ShipCountry = 'Sweden'; --Lang und unübersichtlich

SELECT * FROM Orders WHERE ShipCountry IN('Austria', 'Germany', 'Sweden'); --Selbiges wie oben nur mit IN

SELECT * FROM Orders WHERE EmployeeID IN(1, 4, 5); --Parameter in IN werden mit OR verknüpft

SELECT * FROM Customers WHERE Country = 'Germany'; --WHERE mit String

SELECT * FROM Customers WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Köln'); --Bedingung in Klammer wird zuerst ausgewertet

SELECT * FROM Customers WHERE Country = 'Germany' ORDER BY PostalCode; --Nach Postleitzahl sortieren

SELECT * FROM Customers WHERE Country = 'Germany' ORDER BY PostalCode DESC; --Nach Postleitzahl sortieren (absteigend)

SELECT * FROM Customers WHERE Fax = NULL; --= NULL funktioniert nicht

SELECT * FROM Customers WHERE Fax IS NULL; --NULL Vergleich muss mit IS gemacht werden

SELECT * FROM Customers WHERE Fax IS NOT NULL; --IS NOT NULL um zu schauen welche Datensätze nicht leer sind

SELECT * FROM Orders WHERE Freight NOT BETWEEN 50 AND 100; --NOT kann auch bei BETWEEN verwendet werden

SELECT * FROM Orders WHERE ShipCountry NOT IN('Austria', 'Germany', 'Sweden'); --NOT kann auch bei IN verwendet werden
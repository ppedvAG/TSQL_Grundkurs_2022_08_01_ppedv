USE Northwind;

SELECT 'Test1', 'Test2'; --Zwei Spalten

SELECT 'Test1'
UNION
SELECT 'Test2'; --Einzelne Spalte statt UNION

SELECT 'Test1' AS Spalte --AS möglich aber nur beim ersten SELECT
UNION
SELECT 'Test2';

SELECT * FROM Customers;
SELECT * FROM Suppliers;

SELECT CompanyName FROM Customers
UNION
SELECT CompanyName FROM Suppliers; --Alle CompanyNames in einer Ausgabe

SELECT CompanyName FROM Customers
UNION
SELECT Address FROM Suppliers; --Felder müssen nicht den selben Namen haben aber den selben Typen

SELECT CompanyName, ContactName FROM Customers
UNION
SELECT CompanyName FROM Suppliers; --Unterschiedlich viele Spalten funktionieren nicht

SELECT CompanyName, ContactName FROM Customers
UNION
SELECT CompanyName, NULL FROM Suppliers; --Weitere Spalte hinzufügen mit NULL oder ''

SELECT CompanyName FROM Customers
UNION
SELECT SupplierID FROM Suppliers; --Unterschiedliche Typen sind auch nicht möglich

SELECT CompanyName FROM Customers
UNION
SELECT CONVERT(VARCHAR, SupplierID) FROM Suppliers; --Konvertierung zu VARCHAR würde hier funktionieren

SELECT CompanyName, ContactName, Phone, Address FROM Customers
UNION
SELECT CompanyName, ContactName, Phone, Address FROM Suppliers; --Sinnvolle Spalten auswählen

SELECT Phone FROM Customers
UNION
SELECT Phone FROM Suppliers
UNION
SELECT HomePhone FROM Employees; --Mehr als zwei Tabellen fusionieren

SELECT CompanyName FROM Customers
UNION ALL
SELECT CompanyName FROM Customers; --UNION filtert Duplikate, UNION ALL behält Duplikate

SELECT CompanyName FROM Customers
UNION ALL
SELECT CompanyName FROM Customers
ORDER BY 1; --ORDER BY mit UNION auf die ganze kombinierte Tabelle (nur am Ende, nicht auf einzelne SELECTs)

SELECT CompanyName, Phone FROM Customers
WHERE CompanyName LIKE 'A%'
UNION
SELECT CompanyName, Phone FROM Suppliers
WHERE CompanyName LIKE 'A%'; --WHERE bezieht sich nur auf einzelne Tabellen (statt wie bei ORDER BY)

SELECT * FROM Umsatz2019
UNION ALL
SELECT * FROM Umsatz2020
UNION ALL
SELECT * FROM Umsatz2021; --Nützlich für historische Daten
GO

CREATE VIEW v_Umsatz2019bis2021
AS
SELECT * FROM Umsatz2019
UNION ALL
SELECT * FROM Umsatz2020
UNION ALL
SELECT * FROM Umsatz2021; --View erstellen aus allen Daten mit UNION ALL
GO

INSERT INTO UmsatzDiesesJahr
SELECT * FROM Umsatz2019
UNION ALL
SELECT * FROM Umsatz2020
UNION ALL
SELECT * FROM Umsatz2021;

SELECT * FROM v_Umsatz2019bis2021
ORDER BY 1;

----------------------------------------------------------------------------

SELECT * FROM v_Umsatz2019bis2021
INTERSECT
SELECT * FROM Umsatz2019; --INTERSECT: Gibt die Schnittmenge von beiden SELECTs zurück

SELECT * FROM v_Umsatz2019bis2021
EXCEPT
SELECT * FROM Umsatz2019; --EXCEPT: Gibt alle Daten außer die Schnittmenge zurück
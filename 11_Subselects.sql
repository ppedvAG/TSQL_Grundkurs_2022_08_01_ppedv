USE Northwind;

--Alle Order die teuerer als der Durchschnitt sind
SELECT * FROM Orders
WHERE Freight >= AVG(Freight) --Keine Aggregatsfunktionen in WHERE möglich

--Abfrage funktioniert mit Subselect
SELECT * FROM Orders
WHERE Freight >= (SELECT AVG(Freight) FROM Orders) --Wichtig: ein einzelner Wert als Ergebnis
ORDER BY Freight;

--Abfrage funktioniert mit Subselect
SELECT * FROM Orders
WHERE Freight >= (SELECT TOP 1 Freight FROM Orders) --Auch durch TOP 1 kommt genau ein Wert hinaus
ORDER BY Freight;

SELECT * FROM Customers
WHERE Country IN(SELECT DISTINCT Country FROM Suppliers); --Mehrere Werte kommen heraus, werden danach ins IN eingefüllt

SELECT Freight, (SELECT TOP 1 AVG(Freight) FROM Orders) AS Average
FROM Orders; --Unterabfrage im SELECT, maximal ein Wert

SELECT *
FROM
(
	SELECT
	Orders.EmployeeID,
	Orders.Freight,
	Employees.FirstName + ' ' + Employees.LastName AS FullName --Alle Spalten müssen einen Namen haben
	FROM Orders
	INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
) AS Ergebnis --FROM muss einen Alias haben
WHERE Ergebnis.Freight > 50; --Inneres SELECT filtern

SELECT * FROM Customers
WHERE EXISTS (SELECT Country FROM Customers WHERE Country LIKE 'X%'); --Keine Countries mit X

SELECT * FROM Customers
WHERE EXISTS (SELECT Country FROM Customers WHERE Country LIKE 'A%'); --EXISTS gibt true oder false zurück, daher findet Abfrage alle Datensätze
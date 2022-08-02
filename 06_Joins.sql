USE Northwind;

SELECT * FROM Orders; --EmployeeID
SELECT * FROM Employees; --Datensätze kombinieren über EmployeeID

SELECT * FROM Orders
INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID; --Bei jedem Order den entsprechenden Employee hinzufügen

SELECT
Orders.OrderID,
Orders.EmployeeID, --Ambiguous column name (gleicher Spaltenname bei beiden Tabellen, eine Tabelle explizit angeben)
Employees.FirstName + ' ' + Employees.LastName AS FullName,
Orders.ShippedDate
FROM Orders
INNER JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID; --Sinnvolle Spalten auswählen

SELECT
o.OrderID,
o.EmployeeID,
e.FirstName + ' ' + e.LastName,
o.ShippedDate
FROM Orders o
INNER JOIN Employees e
ON o.EmployeeID = e.EmployeeID; --Aliases um Joins zu vereinfachen

SELECT 
o.OrderID,
o.CustomerID,
c.ContactName,
c.CompanyName,
o.ShippedDate,
o.ShipCountry
FROM Orders o
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID; --Orders und Customers Joinen

SELECT * FROM [Order Details] WHERE OrderID = 10248;

SELECT * FROM Orders o
INNER JOIN [Order Details] od
ON o.OrderID = od.OrderID; --Tabellen im FROM und JOIN vertauschen um Ausgabe anzupassen (Orders als Linke Tabelle)

SELECT
o.OrderID,
p.ProductName,
od.UnitPrice,
od.Quantity
FROM Orders o
INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
INNER JOIN Products p ON p.ProductID = od.ProductID; --JOIN mit mehreren Tabellen

SELECT 
o.OrderID,
e.FirstName + ' ' + e.LastName AS FullName,
c.CompanyName,
c.ContactName,
o.Freight
FROM Orders o
INNER JOIN Employees e ON e.EmployeeID = o.EmployeeID
INNER JOIN Customers c ON c.CustomerID = o.CustomerID; --JOINs mit Orders, Employees und Customers

SELECT * FROM Orders
RIGHT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID; --832 Zeilen statt 830 weil es Customer gibt die keine Order getätigt haben

SELECT * FROM Orders
RIGHT JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
WHERE OrderID IS NULL; --Zwei Customer gefunden die keine Order haben (Orders werden mit NULL Werten ausgefüllt)

SELECT * FROM Customers
LEFT JOIN Orders
ON Orders.CustomerID = Customers.CustomerID
WHERE OrderID IS NULL; --Jetzt Customer links und Order rechts

SELECT * FROM Orders CROSS JOIN Customers; --Gibt alle Kombinationen zurück (ohne ON)

SELECT 
e.EmployeeID,
e.FirstName + ' ' + e.LastName AS FullName,
chef.EmployeeID AS ChefID,
chef.FirstName + ' ' + chef.LastName AS ChefName
FROM Employees e
INNER JOIN Employees chef
ON e.ReportsTo = chef.EmployeeID; --Alle Chefs von Mitarbeitern ausgeben (ein Mitarbeiter fehlt)

SELECT 
e.EmployeeID,
e.FirstName + ' ' + e.LastName AS FullName,
chef.EmployeeID AS ChefID,
chef.FirstName + ' ' + chef.LastName AS ChefName
FROM Employees e
LEFT JOIN Employees chef
ON e.ReportsTo = chef.EmployeeID; --Mit Left Join ist Chef auch dabei, da ReportsTo NULL ist und durch den Join aufgefüllt wird
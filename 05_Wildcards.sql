USE Northwind;

SELECT * FROM Customers WHERE Country LIKE 'A%'; --Alle Customer in Ländern die mit A anfangen (A und danach beliebig viele Zeichen)

SELECT * FROM Customers WHERE Country LIKE 'a%'; --Case-Insensitive wie Funktionen

SELECT * FROM Customers WHERE Country LIKE '%A'; --Alle Länder die mit A enden

SELECT * FROM Customers WHERE Country LIKE '%A%'; --A in der Mitte (Andorra fällt auch hinein, da beliebig viele Zeichen auch keine Zeichen sein können)

SELECT * FROM Customers WHERE Country LIKE '%A%A%'; --Alle Länder die 2 A's in der Mitte haben

SELECT * FROM Customers WHERE City LIKE '_ünchen'; --Underscore: Genau ein Zeichen suchen

SELECT * FROM Customers WHERE PostalCode LIKE '____'; --Genau Vier beliebige Zeichen suchen

SELECT * FROM Customers WHERE PostalCode LIKE '1____'; --Alle Postleitzahlen finden die mit 1 anfangen und dann 4 beliebige Zeichen haben

SELECT * FROM Customers WHERE ContactName LIKE '[agn]%'; --Alle Kunden die mit A, G oder N anfangen

SELECT * FROM Orders WHERE EmployeeID LIKE '[126]'; --Suche Employees mit ID 1, 2 oder 6 (funktioniert nur bei einstelligen IDs)

SELECT * FROM Customers WHERE ContactName LIKE '[a-d]%'; --Alle Customer mit ContactName von A bis D

SELECT * FROM Customers WHERE ContactName LIKE '[^a-d]%' ORDER BY ContactName; --Mit ^ Klammer invertieren

SELECT * FROM Customers WHERE ContactName LIKE '[a-c|x-z]%' ORDER BY ContactName; --Ranges verbinden mit | (Customer von A-C und X-Z)

SELECT * FROM Customers WHERE PostalCode LIKE '[0-9][0-9][0-9][0-9]'; --PIN Überprüfung

SELECT * FROM Customers WHERE CompanyName LIKE '%[%]%'; --Sonderfall: Nach Prozent suchen

SELECT * FROM Customers WHERE CompanyName LIKE '%['']%'; --Sonderfall: Nach Hochkomma suchen
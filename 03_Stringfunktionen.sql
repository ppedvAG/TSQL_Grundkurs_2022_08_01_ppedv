USE Northwind;

SELECT CompanyName, Address + ' ' + City + ', ' + PostalCode + ' ' + Country AS Adresse FROM Customers;

SELECT CompanyName, CONCAT(Address, ' ', City, ', ', PostalCode, ' ', Country) AS Adresse FROM Customers; --CONCAT: Alle Spalten kombinieren wie bei + (aber performanter)

SELECT CompanyName, CONCAT_WS(' ', Address, City, PostalCode, Country) AS Adresse FROM Customers; --CONCAT_WS: Concat with Seperator, verbindet alle angegebenen Spalten mit dem entsprechenden Seperator (hier Leerzeichen)

SELECT TRIM('   Test    '); --Alle Abstände links und rechts entfernen
SELECT RTRIM('   Test    '); --Nur Rechts
SELECT LTRIM('    Test    '); --Nur Links

SELECT LOWER('Test'); --Alle Zeichen klein
SELECT UPPER('Test'); --Alle Zeichen groß

SELECT LEN('Test'); --Länge von einem Text (4)
SELECT LEN(' Test '); --Len macht automatisch ein RTRIM (hier 5 Zeichen)
SELECT DATALENGTH(' Test '); --Kein RTRIM

SELECT REVERSE('Test'); --Dreht Inhalt um

SELECT LEFT('Testtext', 4); --Von links X Zeichen nehmen
SELECT RIGHT('Testtext', 4); --Von rechts X Zeichen nehmen
SELECT SUBSTRING('Testtext', 2, 4); --Von Zeichen 2 Vier Zeichen nehmen (4: Anzahl)

SELECT STUFF('Testtext', 2, 0, '_Hallo_'); --String wird vor der Stelle 2 eingebaut (T_Hallo_esttext)
SELECT STUFF('Testtexttest', 2, 7, '_Hallo_'); --Dritter Parameter zum überschreiben (hier 7 Zeichen vor E überschreiben)

DECLARE @str varchar(10) = '_Hallo_'; --Feld definiert mit Wert
SELECT STUFF('Testtexttest', 2, LEN(@str), @str); --Wert vom Feld einfügen

SELECT REPLICATE('xy', 4); --xyxyxyxy: Schreibe einen String X mal

SELECT REPLACE('Testtext', 'e', '_'); --Ersetze alle E's mit Unterstrichen
SELECT REPLACE('Testtext', 't', '_'); --Nicht Case-Sensitive (auch großes T am Anfang wird ersetzt)

SELECT CHARINDEX('s', 'Testtext'); --Suche ein Zeichen und gib den ersten Index des Zeichens zurück (0 wenn nicht gefunden)
SELECT CHARINDEX('t', 'Testtext'); --Auch wieder Case-Insensitive (t findet das erste T)
SELECT CHARINDEX('e', 'Testtext', 4); --Startindex angeben (starte zu Suchen bei Stelle 4 -> t)

----------------------------------------------------------------------------------------------------

SELECT REPLACE(CompanyName, 'A', 'B') FROM Customers;
SELECT LEFT(CompanyName, 4) FROM Customers;
SELECT UPPER(LEFT(CompanyName, 4)) FROM Customers; --Funktionen verschachteln

SELECT 
CONCAT
(
	UPPER(LEFT(CompanyName, 4)),
	LOWER(RIGHT(CompanyName, 4))
)
FROM Customers; --Umbrüche in Queries möglich
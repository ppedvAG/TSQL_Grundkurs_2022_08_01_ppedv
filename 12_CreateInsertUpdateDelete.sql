USE Northwind;

--Tabelle löschen
DROP TABLE Test;

--CREATE TABLE <Name> (<Spalte1> <Typ>, ...)
CREATE TABLE Test
(
	--primary key: Primärschlüssel, eindeutige Spalte, kann nicht null sein, häufig IDs
	--identity: Erhöht Spalte bei jedem INSERT um 1 automatisch
	--identity(<Startwert>, <Inkrement>): Start bei 1 erhöhe um 3
	ID int primary key identity, --(1, 3),
	Vorname varchar(20),
	Nachname varchar(20) not null --Werte können nicht NULL sein
);

--INSERT INTO <Name>(<Spalte1>, <Spalte2>, ...) VALUES (<Wert1>, <Wert2>), (<Wert1>, <Wert2>)
INSERT INTO Test(Vorname, Nachname) VALUES
('Mustermann', 'Max');

--Nachname und Vorname vertauschen, Mehrere Zeilen gleichzeitig einfügen
INSERT INTO Test(Nachname, Vorname) VALUES
('Mustermann', 'Max'),
('Ein', 'Name');

--Spaltennamen müssen nicht angegeben werden (Reihenfolge beachten)
INSERT INTO Test VALUES
('Test', 'Test');

--Nicht möglich, da Nachname nicht nullable
INSERT INTO Test VALUES
('Text', NULL);

--Ergebnis von Prozedur in Tabelle schreiben, Ergebnis muss kompatibel sein mit Spalten der Tabelle
INSERT INTO Test
EXEC p_test;

--INSERT INTO ... SELECT: Ergebnis aus SELECT in Tabelle schreiben
INSERT INTO Test
SELECT FirstName, LastName
FROM Employees;

--SELECT INTO: Daten in eine neue Tabelle speichern
SELECT *
INTO Test2
FROM Customers;

--UPDATE <Name> SET <Spalte> = <Wert>
UPDATE Test
SET Nachname = 'Test';

--WHERE unbedingt verwenden um nicht alle Daten zu verändern
UPDATE Test
SET Nachname = 'Noch ein Test'
WHERE LEN(Nachname) < 5;

SELECT * INTO Test2 FROM Orders;

--Subselect im WHERE von UPDATE
UPDATE Test2
SET Freight = 0
WHERE Freight >= (SELECT AVG(Freight) FROM Test2);

--Bei SET auf das Feld selbst zugreifen
UPDATE Test
SET Nachname = Nachname + 'Test';

--CREATE SEQUENCE <Name> AD <Datentyp> (Numerischer Datentyp)
--Standardmäßig (1, 1)
CREATE SEQUENCE TestSeq AS int;

--Anpassbar mit START WITH <Zahl>, INCREMENT BY <Zahl>
CREATE SEQUENCE TestSeq AS int
START WITH 1
INCREMENT BY 3;

--Wert aus Sequenz entnehmen
SELECT NEXT VALUE FOR TestSeq;

--Bei INSERT nächsten Wert abrufen
INSERT INTO Test VALUES
(CONVERT(varchar(20), NEXT VALUE FOR TestSeq), 'Test')

--Sequenz zurücksetzen auf <Wert>
ALTER SEQUENCE TestSeq RESTART WITH 1;

--Sequenz löschen
DROP SEQUENCE TestSeq;

--DELETE FROM <Tabelle>
--Löscht ALLE Daten ohne WHERE
DELETE FROM Test;

--WHERE zum Einschränken
DELETE FROM Test WHERE ID >= 20;

--TRUNCATE löscht alle Daten aus der Tabelle genauso wie DELETE ohne WHERE
--WHERE nicht möglich bei TRUNCATE
--Programmierer wollte explizit alle Daten löschen und hat kein WHERE vergessen
TRUNCATE TABLE Test;

--ALTER: Ein Objekt anpassen (Tabelle, Prozedur, Sequenz, ...)
ALTER TABLE Test ADD Seq int; --Spalte hinzufügen

ALTER TABLE Test DROP COLUMN Seq; --Spalte löschen

SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'

SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Categories';
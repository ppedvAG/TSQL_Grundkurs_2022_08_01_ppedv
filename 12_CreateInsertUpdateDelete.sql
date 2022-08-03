USE Northwind;

--Tabelle l�schen
DROP TABLE Test;

--CREATE TABLE <Name> (<Spalte1> <Typ>, ...)
CREATE TABLE Test
(
	--primary key: Prim�rschl�ssel, eindeutige Spalte, kann nicht null sein, h�ufig IDs
	--identity: Erh�ht Spalte bei jedem INSERT um 1 automatisch
	--identity(<Startwert>, <Inkrement>): Start bei 1 erh�he um 3
	ID int primary key identity, --(1, 3),
	Vorname varchar(20),
	Nachname varchar(20) not null --Werte k�nnen nicht NULL sein
);

--INSERT INTO <Name>(<Spalte1>, <Spalte2>, ...) VALUES (<Wert1>, <Wert2>), (<Wert1>, <Wert2>)
INSERT INTO Test(Vorname, Nachname) VALUES
('Mustermann', 'Max');

--Nachname und Vorname vertauschen, Mehrere Zeilen gleichzeitig einf�gen
INSERT INTO Test(Nachname, Vorname) VALUES
('Mustermann', 'Max'),
('Ein', 'Name');

--Spaltennamen m�ssen nicht angegeben werden (Reihenfolge beachten)
INSERT INTO Test VALUES
('Test', 'Test');

--Nicht m�glich, da Nachname nicht nullable
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

--WHERE unbedingt verwenden um nicht alle Daten zu ver�ndern
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
--Standardm��ig (1, 1)
CREATE SEQUENCE TestSeq AS int;

--Anpassbar mit START WITH <Zahl>, INCREMENT BY <Zahl>
CREATE SEQUENCE TestSeq AS int
START WITH 1
INCREMENT BY 3;

--Wert aus Sequenz entnehmen
SELECT NEXT VALUE FOR TestSeq;

--Bei INSERT n�chsten Wert abrufen
INSERT INTO Test VALUES
(CONVERT(varchar(20), NEXT VALUE FOR TestSeq), 'Test')

--Sequenz zur�cksetzen auf <Wert>
ALTER SEQUENCE TestSeq RESTART WITH 1;

--Sequenz l�schen
DROP SEQUENCE TestSeq;

--DELETE FROM <Tabelle>
--L�scht ALLE Daten ohne WHERE
DELETE FROM Test;

--WHERE zum Einschr�nken
DELETE FROM Test WHERE ID >= 20;

--TRUNCATE l�scht alle Daten aus der Tabelle genauso wie DELETE ohne WHERE
--WHERE nicht m�glich bei TRUNCATE
--Programmierer wollte explizit alle Daten l�schen und hat kein WHERE vergessen
TRUNCATE TABLE Test;

--ALTER: Ein Objekt anpassen (Tabelle, Prozedur, Sequenz, ...)
ALTER TABLE Test ADD Seq int; --Spalte hinzuf�gen

ALTER TABLE Test DROP COLUMN Seq; --Spalte l�schen

SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE'

SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Categories';
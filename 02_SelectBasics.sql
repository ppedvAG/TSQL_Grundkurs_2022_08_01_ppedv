--Kommentar, wird nicht ausgeführt

/*
Mehrzeiliger
Kommentar
*/

USE Northwind; --Datenbank auswählen

SELECT 100; --Einzelnen Wert ausgeben

SELECT 'Test'; --Markieren, Strg + E: einzelnes Statement ausführen

SELECT 100 * 3; --Berechnung

SELECT '100 * 3'; --Interpretiert als Text durch Hochkommas

--Strg + R: Ergebnisansicht schließen

SELECT 'Test' AS Text; --AS: Spalte einen Namen geben

SELECT 10 AS Zahl, 'Test' AS Text; --Mehrere Werte auswählen mit Beistrich getrennt

SELECT 10.5; --Kommazahlen mit Punkt statt mit Beistrich

--Strg + K, C: Ausgewählte Zeilen auskommentieren
--Strg + K, U: Ausgewählte Zeilen einkommentieren
--Alt + Pfeiltaste (Hoch, Hinunter): Derzeitige Zeile(n) bewegen

SELECT * FROM Customers; --*: Alles

SELECT CompanyName FROM Customers; --Bestimmte Spalte(n) auswählen

SELECT CompanyName, ContactName FROM Customers; --Mehrere Spalten auswählen

SELECT Freight * 2 FROM Orders; --Auf Spalten berechnungen durchführen

SELECT Freight % 5 AS Mod5 FROM Orders; --Modulo Operator (%): Rest einer Division

SELECT CompanyName + Address + City + PostalCode + Country FROM Customers; --Strings verbinden (unschön)

SELECT CompanyName + ' ' +  Address + ' ' + City + ', ' + PostalCode + ' ' + Country AS [Volle Adresse] FROM Customers; --Strings verbinden mit Leerzeichen dazwischen, Namen mit Abstand drinnen mit [] oder "" angeben

SELECT cd.CustomerDesc FROM CustomerDemographics AS cd; --Tabellenalias (cd)

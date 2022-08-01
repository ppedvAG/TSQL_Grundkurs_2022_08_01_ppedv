USE Northwind;

SELECT GETDATE(); --Jetztige Datum, Millisekundengenau

SELECT SYSDATETIME(); --Jetztiges Datum, Nanosekundengenau

/*
Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, m = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

SELECT DATEADD(YEAR, 3, GETDATE()); --DATEADD: Intervall auf ein Datum hinzufügen

SELECT DATEADD(DAY, 40, GETDATE()); --Überschlag möglich

SELECT DATEADD(DAY, 730, GETDATE()); --Wegen Schalttag einen Tag hinterher (31.07. statt 01.08.)

SELECT DATEADD(HOUR, 20, GETDATE()); --Auch bei Stunden Überschlag möglich

SELECT DATEADD(HOUR, -20, GETDATE()); --Mit negativer Zahl in die Vergangenheit gehen

SELECT DATEADD(QUARTER, 1, GETDATE()); --Ein Quartal addieren

SELECT YEAR(GETDATE()); --Jahr vom derzeitigen Datum erhalten
SELECT MONTH(GETDATE()); --Selbiges wie oben nur mit Monat
SELECT DAY(GETDATE());

SELECT DATEPART(HOUR, GETDATE()); --Teil von einem Datum ausgeben (selbe Funktionsweise wie YEAR(...), MONTH(...), ...)

SELECT DATEPART(QQ, GETDATE()); --Heutiges Quartal finden

SELECT DATEPART(DAYOFYEAR, GETDATE()); --Heutigen Tag finden (1-365)

SELECT DATEPART(WEEKDAY, GETDATE()); --Heutiger Wochentag (1-7)

SELECT DATEDIFF(YEAR, 2000, GETDATE()); --2000 wird als Tage interpretiert -> umgewandelt zu 24.06.1905

SELECT DATEDIFF(YEAR, '2000', GETDATE()); --Hier unbedingt string machen

SELECT DATEDIFF(DAY, '1998-07-18', GETDATE()); --Differenz von Tagen seit Anfangsdatum bis jetzt

--yyyy.MM.dd: ISO-Datum (standardisiert)
--dd.MM.yyyy: Deutsches Datum
--funktioniert beides hier aber in Amerika vielleicht nicht (aufpassen)

SELECT DATENAME(WEEKDAY, GETDATE()); --Heutigen Tag schön ausgeben (Montag)

SELECT DATENAME(MONTH, GETDATE()); --Heutigen Monat schön ausgeben (August)

SELECT DATEFROMPARTS(2022, 8, 1); --Datum aus einzelnen Werten kombinieren

------------------------------------------------------------------------------

SELECT HireDate, DATENAME(WEEKDAY, HireDate) FROM Employees; --DATENAME auf Spalte anwenden

SELECT HireDate, DATEDIFF(YEAR, HireDate, GETDATE()) FROM Employees; --Wie lange sind unsere Mitarbeiter schon angestellt?

SELECT YEAR(HireDate) FROM Employees; --Nur das Jahr finden
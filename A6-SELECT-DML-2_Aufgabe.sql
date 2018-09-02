/*
*****************************
Autor: Daan de Dios
Datum: 2018-09-02
Aufgabe: A6 - SELECT-DML 2
*****************************
######################################
!! Um diese Aufgabe zu lösen Benötigt ihr die "artikel" Datenbbakt.
!! Installationsanleitung für die DB unter: https://github.com/daandedios/M105_A6-SELECT-DML-2/blob/master/DB_Installation%20-%20Artikel/A5-DB_Installation-Artikel.txt

!! Bei Fragen stehe ich euch gerne zu Verfügung: "SQL.dedios@gmail.com" oder per WhatsApp.
######################################
*/

-- 1. Studieren Sie das ERM der Datenbank „Artikel“.
  --  Link: https://raw.githubusercontent.com/daandedios/M105_A6-SELECT-DML-2/master/ERM_artikel.JPG

-- 2. Erstellen Sie eine Liste aller Kunden mit Bestellungen, sortiert nach den Name und Vorname.

-- 3. Erstellen Sie eine Liste aller Kunden und bei jenen Kunden mit Bestellungen, zeigen Sie das Bestelldatum an sortiert nach der Firma (Mid - Mandanten-Id -) und der Kundennummer (Kid).

-- 4. Wie Aufgabe 3, jedoch verwenden Sie hier den Join mit der entgegengesetzten Seite.

-- 5. Untersuchen Sie, ob es zu jeder Warengruppe auch Artikel gibt.

-- 6. Zeigen Sie in einer Liste die Warengruppen an, zu welchen es keine Artikel gibt. Beachte, für die Abfrage, ob ein Feld den NULL-Wert hat, verwenden Sie IS [NOT] NULL.

-- 7. Zeigen Sie in einer Liste die Artikel an, die in keiner Warengruppe stehen.

-- 7/b. Füge einen Artikel Hinzu um zu testen

-- 8. Suchen Sie alle Artikel, die noch nie bestellt wurden.

-- 9. Welche Kunden haben welche Artikel bestellt, inklusive jener, die noch nie bestellt haben.

-- 10. Welche Artikel wurden am häufigsten verkauft. Erstellen sie eine Häufigkeitsliste.

-- 11. In welchen Warengruppe wurde am häufigsten verkauft, zeigen Sie alle Warengruppen an. Hinweis: verwenden Sie COUNT() nicht mit * sondern mit Attributnamen, z.B.  artikel.Anr.

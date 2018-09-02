/*
*****************************
Autor: Daan de Dios
Datum: 2018-09-02
Aufgabe: A6 - SELECT-DML 2
*****************************
######################################
!! Dies sind die Musterlösungen !!
!! Um diese Aufgabe zu lösen Benötigt ihr die "artikel" Datenbbakt.
!! Installationsanleitung für die DB unter: https://github.com/daandedios/M105_A6-SELECT-DML-2/blob/master/DB_Installation%20-%20Artikel/A5-DB_Installation-Artikel.txt

!! Aufgaben ohne Lösungen sind unter folgendem Link zu finden: https://github.com/daandedios/M105_A6-SELECT-DML-2/blob/master/A6-SELECT-DML-2_Aufgabe.sql
!! Bei Fragen stehe ich euch gerne zu Verfügung: "SQL.dedios@gmail.com" oder per WhatsApp.
######################################
*/

-- 1. Studieren Sie das ERM der Datenbank „Artikel“.
  --  Link: https://raw.githubusercontent.com/daandedios/M105_A6-SELECT-DML-2/master/ERM_artikel.JPG


-- 2. Erstellen Sie eine Liste aller Kunden mit Bestellungen, sortiert nach den Name und Vorname.
SELECT kunden.anrede, kunden.nachname, kunden.vorname, bestellung.bestelldatum
  FROM kunden
    JOIN bestellung
      ON kunden.kid = bestellung.kid
        ORDER BY artikel.kunden.nachname, vorname;


-- 3. Erstellen Sie eine Liste aller Kunden und bei jenen Kunden mit Bestellungen, zeigen Sie das Bestelldatum an sortiert nach der Firma (Mid - Mandanten-Id -) und der Kundennummer (Kid).
SELECT kunden.anrede, kunden.nachname, kunden.vorname, bestellung.bestelldatum
  FROM kunden
    LEFT JOIN bestellung
      ON kunden.kid = bestellung.kid
        ORDER BY kunden.mid ,kunden.kid;


-- 4. Wie Aufgabe 3, jedoch verwenden Sie hier den Join mit der entgegengesetzten Seite.
SELECT kunden.anrede, kunden.nachname, kunden.vorname, bestellung.bestelldatum
  FROM kunden
    RIGHT JOIN bestellung
      ON kunden.kid = bestellung.kid
        ORDER BY kunden.mid ,kunden.kid;


-- 5. Untersuchen Sie, ob es zu jeder Warengruppe auch Artikel gibt.
SELECT warengruppe.warengruppe, artikel.bezeichnung FROM warengruppe
  LEFT JOIN artikel
    ON artikel.warengruppe.kennziffer = artikel.artikel.wgknz;


-- 6. Zeigen Sie in einer Liste die Warengruppen an, zu welchen es keine Artikel gibt. Beachte, für die Abfrage, ob ein Feld den NULL-Wert hat, verwenden Sie IS [NOT] NULL.
SELECT warengruppe.warengruppe, artikel.bezeichnung FROM warengruppe
  LEFT JOIN artikel
    ON artikel.warengruppe.kennziffer = artikel.artikel.wgknz
      WHERE artikel.artikel.bezeichnung IS NULL ;


-- 7. Zeigen Sie in einer Liste die Artikel an, die in keiner Warengruppe stehen.
SELECT artikel.bezeichnung, warengruppe.warengruppe
  FROM warengruppe
    RIGHT JOIN  artikel
      ON artikel.warengruppe.kennziffer = artikel.artikel.wgknz
        WHERE artikel.artikel.wgknz = 0;


-- 7/b. Füge einen Artikel Hinzu um zu testen
INSERT INTO artikel
    (anr, bezeichnung, gebinde, einheit, einstandspreis, listenpreis, mwst_art, bestand, letzte_aenderung)
      VALUE (9999, 'SD Card', 24, 'Pack', 20.50, 40.80, 'voll', 300, NOW());


-- 8. Suchen Sie alle Artikel, die noch nie bestellt wurden.
SELECT artikel.artikel.bezeichnung, bestell_position.mid
  FROM artikel
    LEFT JOIN bestell_position
      ON artikel.anr = bestell_position.anr
        WHERE bestell_position.mid IS NULL;


-- 9. Welche Kunden haben welche Artikel bestellt, inklusive jener, die noch nie bestellt haben.
SELECT artikel.kunden.vorname, kunden.nachname, kunden.firma, artikel.artikel.bezeichnung, bestell_position.anzahl
  FROM kunden
    LEFT JOIN bestellung
    ON kunden.kid = bestellung.kid
        LEFT JOIN bestell_position
        ON bestellung.bnr = bestell_position.bnr
          LEFT JOIN artikel
          ON bestell_position.anr = artikel.artikel.anr;


-- 10. Welche Artikel wurden am häufigsten verkauft. Erstellen sie eine Häufigkeitsliste.
SELECT artikel.bezeichnung, bestell_position.anzahl
  FROM artikel
    LEFT JOIN bestell_position
      ON artikel.artikel.anr = bestell_position.anr
        ORDER BY bestell_position.anzahl DESC;


-- 11. In welchen Warengruppe wurde am häufigsten verkauft, zeigen Sie alle Warengruppen an. Hinweis: verwenden Sie COUNT() nicht mit * sondern mit Attributnamen, z.B.  artikel.Anr.
SELECT warengruppe.*, COUNT(artikel.artikel.anr) AS 'Anzahl'
  FROM warengruppe
    LEFT JOIN artikel
    ON warengruppe.kennziffer = artikel.artikel.wgknz
      LEFT JOIN bestell_position
      ON artikel.artikel.anr = bestell_position.anr
        GROUP BY warengruppe
          ORDER BY Anzahl DESC;

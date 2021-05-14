-- Exercise 10
-- Miszczuk, Streit

-- Aufhabe 3 - Handelsfirma
-- 3.3
-- a
SELECT produktname FROM produkt AS p
JOIN verkauf AS v
    ON v.produktID = p.produktID
WHERE v.lieferdatum < "2005-12-01"
GROUP BY produktID;

-- b
SELECT produktname FROM produkt AS p
JOIN verkauf AS v
    ON v.produktID = p.produktID
JOIN kunde AS k
    ON v.kundeID = k.kundeID
WHERE k.kundenname = "ABC Holding"
GROUP BY produktID;

-- c
SELECT produktname, filialen.kundenname, firmen.kundenname, holding.kundenname FROM produkt AS p
JOIN verkauf AS v
    ON v.produktID = p.produktID
JOIN kunde AS holding
    ON v.kundeID = holding.kundeID
JOIN kunde AS firmen
    ON firmen.holdingID = k.kundeID
JOIN kunde AS filialen
    ON filialen.firmaID = k.kundeID
WHERE k.kundenname = "ABC Holding";
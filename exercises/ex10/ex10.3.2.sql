-- Exercise 10
-- Miszczuk, Streit

-- Aufhabe 3 - Handelsfirma
-- 3.2
DROP TABLE IF EXISTS kunde;
CREATE TABLE kunde(
kundeID INT NOT NULL,
holdingID INT,
firmaID INT,
typ TEXT,
kundenname TEXT,
CONSTRAINT kunde_pkey
PRIMARY KEY (kundeID),
CONSTRAINT kunde_holding_fkey
FOREIGN KEY (holdingID)
REFERENCES kunde (kundeID),
CONSTRAINT kunde_firma_fkey
FOREIGN KEY (firmaID)
REFERENCES kunde (kundeID)
);

DROP TABLE IF EXISTS produkt;
CREATE TABLE produkt (
produktID INT NOT NULL,
produktname TEXT NOT NULL,
CONSTRAINT produkt_pkey
PRIMARY KEY (produktID)
);

DROP TABLE IF EXISTS verkauf;
CREATE TABLE verkauf (
verkaufID INT NOT NULL,
kundeID INT NOT NULL,
produktID INT NOT NULL,
preis DECIMAL(10,2) NOT NULL,
menge INT NOT NULL,
lieferdatum TEXT NOT NULL,
CONSTRAINT verkauf_pkey
PRIMARY KEY (verkaufID),
CONSTRAINT verkauf_kunde_fkey
FOREIGN KEY (kundeID)
REFERENCES kunde (kundeID),
CONSTRAINT verkauf_produkt_fkey
FOREIGN KEY (produktID)
REFERENCES produkt (produktID)
);
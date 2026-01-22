CREATE TABLE clienti (
    id_cliente        NUMBER PRIMARY KEY,
    nome              VARCHAR2(50),
    cognome           VARCHAR2(50),
    citta             VARCHAR2(50),
    stato_cliente     CHAR(1),      -- A=attivo, I=inactive
    data_registrazione DATE
);

CREATE TABLE ordini (
    id_ordine     NUMBER PRIMARY KEY,
    id_cliente    NUMBER,
    data_ordine   DATE,
    importo       NUMBER(10,2),
    stato_ordine  VARCHAR2(20),
    FOREIGN KEY (id_cliente) REFERENCES clienti(id_cliente)
);

CREATE TABLE prodotti (
    id_prodotto   NUMBER PRIMARY KEY,
    nome          VARCHAR2(100),
    categoria     VARCHAR2(30),
    prezzo        NUMBER(10,2)
);


CREATE TABLE dettagli_ordine (
    id_ordine     NUMBER,
    id_prodotto   NUMBER,
    quantita      NUMBER,
    prezzo_unit   NUMBER(10,2),
    FOREIGN KEY (id_ordine) REFERENCES ordini(id_ordine),
    FOREIGN KEY (id_prodotto) REFERENCES prodotti(id_prodotto)
);

--INDEX per creazione e analisi dei piani
--da creare o cancellare opportunamente per verificare i piani di esecuzione
CREATE INDEX idx_clienti_cognome ON clienti(cognome);
CREATE BITMAP INDEX idx_clienti_stato ON clienti(stato_cliente);
CREATE INDEX idx_ordini_cliente ON ordini(id_cliente);
CREATE INDEX idx_ordini_data ON ordini(data_ordine);
CREATE INDEX idx_dettagli_prodotto ON dettagli_ordine(id_prodotto);

 

INSERT INTO clienti VALUES (1, 'Mario', 'Rossi', 'Milano', 'A', DATE '2020-01-10');
INSERT INTO clienti VALUES (2, 'Luca', 'Bianchi', 'Roma', 'A', DATE '2021-03-22');
INSERT INTO clienti VALUES (3, 'Anna', 'Verdi', 'Milano', 'I', DATE '2019-11-05');

INSERT INTO ordini VALUES (1001, 1, DATE '2023-01-10', 250.00, 'COMPLETATO');
INSERT INTO ordini VALUES (1002, 1, DATE '2023-02-15', 120.00, 'COMPLETATO');
INSERT INTO ordini VALUES (1003, 2, DATE '2023-02-20', 80.00, 'PENDING');

INSERT INTO prodotti VALUES (10, 'Mouse', 'ELETTRONICA', 25.00);
INSERT INTO prodotti VALUES (11, 'Monitor', 'ELETTRONICA', 199.00);
INSERT INTO prodotti VALUES (12, 'Cavo HDMI', 'ACCESSORI', 9.99);

INSERT INTO dettagli_ordine VALUES (1001, 10, 2, 25.00);
INSERT INTO dettagli_ordine VALUES (1001, 11, 1, 199.00);
INSERT INTO dettagli_ordine VALUES (1002, 12, 3, 9.99);

 
--Esercizio 1 — Effetto di un indice B Tree
SELECT *
FROM clienti
WHERE cognome = 'Rossi';
--Esercizio 2 — Bitmap vs B Tree
SELECT *
FROM clienti
WHERE stato_cliente = 'A';
--Esercizio 3 — Join pesante
SELECT c.nome, o.data_ordine, d.quantita
FROM clienti c
JOIN ordini o ON c.id_cliente = o.id_cliente
JOIN dettagli_ordine d ON o.id_ordine = d.id_ordine
WHERE c.citta = 'Milano';
--Esercizio 4 — Range scan
SELECT *
FROM ordini
WHERE data_ordine = '2023-01-01';


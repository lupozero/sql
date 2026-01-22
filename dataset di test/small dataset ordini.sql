CREATE TABLE clienti (
    id_cliente      NUMBER PRIMARY KEY,
    nome            VARCHAR2(50),
    cognome         VARCHAR2(50),
    citta           VARCHAR2(50),
    cap             VARCHAR2(5),
    email           VARCHAR2(100),
    telefono        VARCHAR2(20)
);
CREATE TABLE categorie (
    id_categoria    NUMBER PRIMARY KEY,
    nome_categoria  VARCHAR2(50)
);
CREATE TABLE prodotti (
    id_prodotto     NUMBER PRIMARY KEY,
    nome_prodotto   VARCHAR2(100),
    prezzo          NUMBER(10,2),
    id_categoria    NUMBER,
    CONSTRAINT fk_cat
        FOREIGN KEY (id_categoria)
        REFERENCES categorie(id_categoria)
);

CREATE TABLE ordini_mono (
    id_ordine       NUMBER PRIMARY KEY,
    id_cliente      NUMBER,
    id_prodotto     NUMBER,
    data_ordine     DATE,
    importo         NUMBER(10,2),
    CONSTRAINT fk_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES clienti(id_cliente),
    CONSTRAINT fk_prodotto
        FOREIGN KEY (id_prodotto)
        REFERENCES prodotti(id_prodotto)
);
 

--CLIENTI
INSERT INTO clienti VALUES (1, 'Marco', 'Rossi', 'Milano', '12345','marco.rossi@gmail.com', '3331222');
INSERT INTO clienti VALUES (2, 'Anna', 'Verdi', 'Roma', '123','anna.verdi@gmail.com', NULL);
INSERT INTO clienti VALUES (3, 'Luca', 'Bianchi', 'Torino', '12345','luca.bianchi@yahoo.it', '3395556666');
INSERT INTO clienti VALUES (4, 'Sara', 'Neri', 'Milano', '12345','sara.neri@gmail.com', '3204445555');
INSERT INTO clienti VALUES (5, 'Paolo', 'Gialli', 'Roma', '123','paolo.gialli@gmail.com', NULL);
INSERT INTO clienti VALUES (6, 'Paola', 'Turchese', 'Roma', '123','paolo.gialli@gmail.com', NULL);
--CATEGORIE
INSERT INTO categorie VALUES (1, 'Elettronica');
INSERT INTO categorie VALUES (2, 'Casa');
INSERT INTO categorie VALUES (3, 'Sport');
--PRODOTTI
INSERT INTO prodotti VALUES (1, 'Smartphone X', 599.99, 1);
INSERT INTO prodotti VALUES (2, 'TV 55"', 799.99, 1);
INSERT INTO prodotti VALUES (3, 'Aspirapolvere', 129.99, 2);
INSERT INTO prodotti VALUES (4, 'Bicicletta', 349.99, 3);
INSERT INTO prodotti VALUES (5, 'Cuffie Wireless', 89.99, 1);
 
--ORDINI_MONO
INSERT INTO ordini_mono VALUES (101, 1, 1, DATE '2025-01-10', 599.99);
INSERT INTO ordini_mono VALUES (102, 1, 4, DATE '2025-02-12', 89.99);
INSERT INTO ordini_mono VALUES (107, 1, 3, DATE '2025-03-12', 89.99);
INSERT INTO ordini_mono VALUES (103, 2, 3, DATE '2025-04-15', 129.99);
INSERT INTO ordini_mono VALUES (104, 3, 4, DATE '2025-05-20', 349.99);
INSERT INTO ordini_mono VALUES (105, 1, 2, DATE '2025-06-22', 799.99);
INSERT INTO ordini_mono VALUES (106, 4, 1, DATE '2025-07-25', 599.99);
 

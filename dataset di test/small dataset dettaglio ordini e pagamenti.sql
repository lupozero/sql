CREATE TABLE CLIENTI (
    cliente_id      INT PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    citta           VARCHAR(50),
    iscrizione      DATE NOT NULL
);

CREATE TABLE PRODOTTI (
    prodotto_id     INT PRIMARY KEY,
    nome            VARCHAR(100) NOT NULL,
    categoria       VARCHAR(50) NOT NULL,
    prezzo          DECIMAL(10,2) NOT NULL
);

CREATE TABLE ORDINI (
    ordine_id       INT PRIMARY KEY,
    cliente_id      INT NOT NULL,
    data_ordine     DATE NOT NULL,
    stato           VARCHAR(30) NOT NULL,
    CONSTRAINT fk_ordini_clienti
        FOREIGN KEY (cliente_id) REFERENCES CLIENTI(cliente_id)
);

CREATE TABLE DETTAGLI_ORDINE (
    ordine_id       INT NOT NULL,
    prodotto_id     INT NOT NULL,
    quantita        INT NOT NULL,
    prezzo_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_dettagli PRIMARY KEY (ordine_id, prodotto_id),
    CONSTRAINT fk_dettagli_ordini
        FOREIGN KEY (ordine_id) REFERENCES ORDINI(ordine_id),
    CONSTRAINT fk_dettagli_prodotti
        FOREIGN KEY (prodotto_id) REFERENCES PRODOTTI(prodotto_id)
);


CREATE TABLE PAGAMENTI (
    pagamento_id    INT PRIMARY KEY,
    ordine_id       INT NOT NULL,
    importo         DECIMAL(10,2) NOT NULL,
    metodo          VARCHAR(30) NOT NULL,
    data_pagamento  DATE NOT NULL,
    CONSTRAINT fk_pagamenti_ordini
        FOREIGN KEY (ordine_id) REFERENCES ORDINI(ordine_id)
);

-- CLIENTI
INSERT INTO CLIENTI VALUES (1, 'Mario Rossi', 'Torino', '15-oct-2021');
INSERT INTO CLIENTI VALUES (2, 'Lucia Bianchi', 'Milano', '03-nov-2020');
INSERT INTO CLIENTI VALUES (3, 'Paolo Verdi', NULL, '22-may-2022');
INSERT INTO CLIENTI VALUES (4, 'Anna Neri', 'Torino', '10-feb-2023');



-- PRODOTTI
INSERT INTO PRODOTTI VALUES (10, 'Smartphone X', 'Elettronica', 699.90);
INSERT INTO PRODOTTI VALUES (11, 'Cuffie Pro', 'Elettronica', 129.00);
INSERT INTO PRODOTTI VALUES (12, 'Tostapane 3000', 'Casa', 39.99);
INSERT INTO PRODOTTI VALUES (13, 'Bicicletta Road', 'Sport', 899.00);

-- ORDINI
INSERT INTO ORDINI VALUES (100, 1, '10-jan-2023', 'Spedito');
INSERT INTO ORDINI VALUES (101, 2, '12-jan-2023', 'Annullato');
INSERT INTO ORDINI VALUES (102, 1, '05-feb-2023', 'Spedito');
INSERT INTO ORDINI VALUES (103, 4, '20-feb-2023', 'In elaborazione');

-- DETTAGLI_ORDINE
INSERT INTO DETTAGLI_ORDINE VALUES (100, 10, 1, 699.90);
INSERT INTO DETTAGLI_ORDINE VALUES (100, 11, 2, 129.00);
INSERT INTO DETTAGLI_ORDINE VALUES (102, 12, 1, 39.99);
INSERT INTO DETTAGLI_ORDINE VALUES (103, 13, 1, 899.00);

-- PAGAMENTI
INSERT INTO PAGAMENTI VALUES (500, 100, 957.90, 'Carta', '11-jan-2023');
INSERT INTO PAGAMENTI VALUES (501, 102, 39.99, 'PayPal', '06-feb-2023'); 

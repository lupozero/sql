CREATE INDEX idx_clienti_cognome ON clienti(cognome);
CREATE BITMAP INDEX idx_clienti_stato ON clienti(stato_cliente);
CREATE INDEX idx_ordini_cliente ON ordini(id_cliente);
CREATE INDEX idx_ordini_data ON ordini(data_ordine);
CREATE INDEX idx_dettagli_prodotto ON dettagli_ordine(id_prodotto);

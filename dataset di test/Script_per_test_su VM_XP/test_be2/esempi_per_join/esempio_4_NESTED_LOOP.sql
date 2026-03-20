--NESTED LOOP (con indici)
CREATE INDEX idx_ordini_cliente ON ordini_2 (id_cliente);

CREATE INDEX idx_ordini_prodotto ON ordini_2 (id_prodotto);


SELECT c.nome, o.id_ordine
FROM clienti_2 c -- driving table 
JOIN ordini_2 o ON c.id_cliente = o.id_cliente
WHERE c.id_cliente = 10;

--Piano atteso:  INDEX UNIQUE SCAN + INDEX RANGE SCAN + NESTED LOOPS,

/*
Cerca il cliente con id_cliente = 10 nella tabella clienti_2.

Per quel cliente, cerca tutti gli ordini nella tabella ordini_2 che hanno lo stesso id_cliente.

Restituisce nome del cliente + id dell’ordine.

*/
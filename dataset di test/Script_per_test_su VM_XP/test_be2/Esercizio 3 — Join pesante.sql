SELECT c.nome, o.data_ordine, d.quantita
FROM clienti c
JOIN ordini o ON c.id_cliente = o.id_cliente
JOIN dettagli_ordine d ON o.id_ordine = d.id_ordine
WHERE c.citta = 'Milano';



CREATE INDEX idx_cliente_citta  ON clienti(citta);

drop index idx_cliente_citta;


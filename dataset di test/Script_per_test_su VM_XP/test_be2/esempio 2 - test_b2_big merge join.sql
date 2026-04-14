/* Formatted on 3/2/2026 4:11:52 PM (QP5 v5.252.13127.32847) */
SELECT c.nome, o.data_ordine, o.importo
  FROM clienti c JOIN ordini o ON c.id_cliente = o.id_cliente
 WHERE c.citta = 'Milano';



CREATE INDEX idx_cliente_citta
   ON clienti (citta);

drop index idx_cliente_citta;
--ANTI JOIN (NOT EXISTS)


CREATE INDEX idx_ordini_cliente ON ordini_2 (id_cliente);
CREATE INDEX idx_ordini_prodotto ON ordini_2 (id_prodotto);

SELECT c.id_cliente
FROM clienti_2 c
WHERE NOT EXISTS (
  SELECT 1 FROM ordini_2 o WHERE o.id_cliente = c.id_cliente
);

--Piano atteso:  HASH JOIN ANTI oppure NESTED LOOPS ANTI
--MERGE JOIN (ordinamento naturale o indici)


SELECT c.id_cliente, o.id_ordine
FROM clienti_2 c
JOIN ordini_2 o ON c.id_cliente = o.id_cliente
ORDER BY c.id_cliente;

-- Piano atteso:  SORT JOIN + MERGE JOIN  (se gli indici sono presenti -> niente SORT)

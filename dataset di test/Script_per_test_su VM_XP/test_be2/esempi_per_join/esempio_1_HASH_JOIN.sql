--HASH JOIN (tabelle grandi, no indici)

drop index idx_ordini_cliente;

drop index idx_ordini_prodotto;

SELECT c.citta, COUNT(*)
FROM ordini_2 o
JOIN clienti_2 c ON c.id_cliente = o.id_cliente
GROUP BY c.citta;

--Piano atteso:  FULL TABLE SCAN + HASH JOIN

/*
entrambe le tabelle hanno molte righe

non ci sono filtri selettivi

il join è su una chiave semplice

il costo di un Nested Loop sarebbe troppo alto
*(

CREATE INDEX idx_ordini_cliente ON ordini_2 (id_cliente);
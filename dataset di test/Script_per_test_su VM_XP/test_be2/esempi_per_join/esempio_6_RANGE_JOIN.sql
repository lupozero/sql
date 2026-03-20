--RANGE JOIN ? MERGE JOIN obbligata

CREATE INDEX idx_ordini_cliente ON ordini_2 (id_cliente);
CREATE INDEX idx_ordini_prodotto ON ordini_2 (id_prodotto);


SELECT o.*, p.*
FROM ordini_2 o
JOIN prodotti_2 p 
  ON o.data_ordine BETWEEN SYSDATE - 30 AND SYSDATE;
  
-- Piano atteso:  MERGE JOIN (HASH JOIN non applicabile)
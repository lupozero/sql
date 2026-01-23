

SELECT id_cliente, SUM(importo) AS totale
FROM ordini_mono
GROUP BY id_cliente
HAVING SUM(importo) >
       (SELECT AVG(tot) FROM (
            SELECT SUM(importo) AS tot
            FROM ordini_mono
            GROUP BY id_cliente
       ));

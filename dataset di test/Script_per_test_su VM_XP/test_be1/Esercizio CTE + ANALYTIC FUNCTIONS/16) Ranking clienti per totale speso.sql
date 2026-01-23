WITH totali AS (
    SELECT id_cliente, SUM(importo) AS totale
    FROM ordini_mono
    GROUP BY id_cliente
)
SELECT id_cliente, totale,
       RANK() OVER (ORDER BY totale DESC) AS posizione
FROM totali;

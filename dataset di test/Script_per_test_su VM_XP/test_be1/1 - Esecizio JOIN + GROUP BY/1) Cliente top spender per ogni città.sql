SELECT citta, id_cliente, totale
FROM (
    SELECT c.citta,
           c.id_cliente,
           SUM(o.importo) AS totale,
           ROW_NUMBER() OVER (PARTITION BY c.citta ORDER BY SUM(o.importo) DESC) AS rn
    FROM clienti c
    JOIN ordini_mono o ON c.id_cliente = o.id_cliente
    GROUP BY c.citta, c.id_cliente
)
WHERE rn = 1;
 
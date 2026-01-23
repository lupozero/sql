SELECT cliente, data_vendita, importo,
       SUM(importo) OVER (
           PARTITION BY cliente
           ORDER BY data_vendita
       ) AS totale_cumulato
FROM vendite;

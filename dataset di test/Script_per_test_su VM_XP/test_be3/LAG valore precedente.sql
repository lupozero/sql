SELECT cliente, data_vendita, importo,
       LAG(importo) OVER (
           PARTITION BY cliente
           ORDER BY data_vendita
       ) AS importo_precedente
FROM vendite;

SELECT cliente, data_vendita, importo,
       LAG(importo,2,-999) OVER (
           PARTITION BY cliente
           ORDER BY data_vendita
       ) AS importo_precedente
FROM vendite;

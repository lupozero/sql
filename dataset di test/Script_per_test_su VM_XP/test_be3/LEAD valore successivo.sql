SELECT cliente, data_vendita, importo,
       LEAD(importo) OVER (
           PARTITION BY cliente
           ORDER BY data_vendita
       ) AS importo_successivo
FROM vendite;

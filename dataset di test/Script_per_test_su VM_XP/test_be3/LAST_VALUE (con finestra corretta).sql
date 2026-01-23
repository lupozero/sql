SELECT cliente, data_vendita, importo,
       LAST_VALUE(importo) OVER (
           PARTITION BY cliente
           ORDER BY data_vendita
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS ultimo_importo
FROM vendite;

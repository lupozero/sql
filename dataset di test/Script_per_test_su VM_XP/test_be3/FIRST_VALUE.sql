SELECT cliente, data_vendita, importo,
       FIRST_VALUE(importo) OVER (
           PARTITION BY cliente
           ORDER BY data_vendita
       ) AS primo_importo
FROM vendite;

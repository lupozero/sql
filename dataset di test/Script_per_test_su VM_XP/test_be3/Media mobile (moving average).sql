 SELECT cliente, data_vendita, importo,
       AVG(importo) OVER (
           PARTITION BY cliente
           ORDER BY data_vendita
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS media_mobile_3
FROM vendite;

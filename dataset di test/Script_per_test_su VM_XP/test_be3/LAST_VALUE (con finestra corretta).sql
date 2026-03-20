SELECT cliente, data_vendita, importo,
       LAST_VALUE(importo) OVER (
           PARTITION BY cliente
           ORDER BY data_vendita
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS ultimo_importo,
       LAST_VALUE(importo) OVER (
           PARTITION BY cliente
           ORDER BY data_vendita
       ) AS ultimo_importo_alla_data    
FROM vendite
--order by cliente, data_vendita DESC
SELECT id_ordine, data_ordine, importo,
       AVG(importo) OVER (
           ORDER BY data_ordine
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS media_mobile
FROM ordini_mono;

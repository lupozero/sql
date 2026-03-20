
SELECT EXTRACT(YEAR FROM data_ordine) AS anno,
       EXTRACT(MONTH FROM data_ordine) AS mese,
       AVG(importo) AS media_importi
FROM ordini_mono
GROUP BY EXTRACT(YEAR FROM data_ordine),
         EXTRACT(MONTH FROM data_ordine)
ORDER BY anno, mese;

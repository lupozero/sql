SELECT id_cliente
FROM ordini_mono
GROUP BY id_cliente
HAVING COUNT(DISTINCT EXTRACT(MONTH FROM data_ordine)) = 4;

SELECT id_cliente, COUNT(*) AS num_ordini_mono
FROM ordini_mono
GROUP BY id_cliente
HAVING COUNT(*) >= 3;

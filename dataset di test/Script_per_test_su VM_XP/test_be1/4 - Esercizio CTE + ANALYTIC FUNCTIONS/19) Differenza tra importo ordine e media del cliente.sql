SELECT id_cliente, id_ordine, importo,
       importo - AVG(importo) OVER (PARTITION BY id_cliente) AS differenza
FROM ordini_mono;

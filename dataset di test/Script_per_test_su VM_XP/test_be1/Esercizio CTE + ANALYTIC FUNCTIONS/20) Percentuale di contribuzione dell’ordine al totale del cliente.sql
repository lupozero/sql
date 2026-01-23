SELECT id_cliente, id_ordine, importo,
       importo / SUM(importo) OVER (PARTITION BY id_cliente) * 100 AS percentuale
FROM ordini_mono;

SELECT o.*
FROM ordini_mono o
WHERE o.importo =
      (SELECT MAX(importo)
       FROM ordini_mono
       WHERE id_cliente = o.id_cliente);

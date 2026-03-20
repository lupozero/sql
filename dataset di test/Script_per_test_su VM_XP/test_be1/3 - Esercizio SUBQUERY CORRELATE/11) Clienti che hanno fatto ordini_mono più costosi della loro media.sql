SELECT DISTINCT o1.id_cliente
FROM ordini_mono o1
WHERE o1.importo >
      (SELECT AVG(o2.importo)
       FROM ordini_mono o2
       WHERE o2.id_cliente = o1.id_cliente);

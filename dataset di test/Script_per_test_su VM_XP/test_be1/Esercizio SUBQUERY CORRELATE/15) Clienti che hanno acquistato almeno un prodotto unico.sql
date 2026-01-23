SELECT DISTINCT c.id_cliente
FROM clienti c
JOIN ordini_mono o ON c.id_cliente = o.id_cliente
WHERE EXISTS (
    SELECT 1
    FROM ordini_mono o2
    WHERE o2.id_prodotto = o.id_prodotto
    GROUP BY o2.id_prodotto
    HAVING COUNT(*) = 1
);

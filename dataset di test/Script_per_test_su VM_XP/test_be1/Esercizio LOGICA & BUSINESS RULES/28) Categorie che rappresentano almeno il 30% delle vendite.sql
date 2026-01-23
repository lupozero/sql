WITH tot AS (
    SELECT SUM(importo) AS totale FROM ordini_mono
)
SELECT c.nome_categoria, SUM(o.importo) AS fatturato
FROM ordini_mono o
JOIN prodotti p ON o.id_prodotto = p.id_prodotto
JOIN categorie c ON p.id_categoria = c.id_categoria
GROUP BY c.nome_categoria
HAVING SUM(o.importo) >= 0.30 * (SELECT totale FROM tot);

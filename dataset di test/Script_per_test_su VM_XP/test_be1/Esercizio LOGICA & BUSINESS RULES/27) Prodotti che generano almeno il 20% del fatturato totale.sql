WITH tot AS (
    SELECT SUM(importo) AS totale FROM ordini_mono
) 
SELECT p.nome_prodotto, SUM(o.importo) AS fatturato
FROM ordini_mono o
JOIN prodotti p ON o.id_prodotto = p.id_prodotto
GROUP BY p.nome_prodotto
HAVING SUM(o.importo) >= 0.20 * (SELECT totale FROM tot);

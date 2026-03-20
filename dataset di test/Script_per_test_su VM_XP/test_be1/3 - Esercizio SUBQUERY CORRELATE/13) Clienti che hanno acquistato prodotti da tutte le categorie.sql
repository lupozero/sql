SELECT id_cliente
FROM ordini_mono o
JOIN prodotti p ON o.id_prodotto = p.id_prodotto
GROUP BY id_cliente
HAVING COUNT(DISTINCT id_categoria) =
       (SELECT COUNT(*) FROM categorie);


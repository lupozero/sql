SELECT DISTINCT id_cliente
FROM ordini_mono o
JOIN prodotti p ON o.id_prodotto = p.id_prodotto
WHERE p.prezzo >
      (SELECT AVG(prezzo) FROM prodotti);

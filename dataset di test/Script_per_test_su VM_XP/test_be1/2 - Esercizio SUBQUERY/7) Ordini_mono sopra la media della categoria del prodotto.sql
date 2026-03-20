SELECT o.*
FROM ordini_mono o
JOIN prodotti p ON o.id_prodotto = p.id_prodotto
WHERE o.importo >
      (SELECT AVG(prezzo)
       FROM prodotti
       WHERE id_categoria = p.id_categoria);

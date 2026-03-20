SELECT p.*
FROM prodotti p
LEFT JOIN ordini_mono o ON p.id_prodotto = o.id_prodotto
WHERE o.id_ordine IS NULL;

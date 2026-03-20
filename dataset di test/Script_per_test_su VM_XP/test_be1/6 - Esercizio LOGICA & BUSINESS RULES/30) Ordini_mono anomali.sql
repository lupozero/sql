--(importo > 150% del prezzo del prodotto)

SELECT o.*, p.prezzo
FROM ordini_mono o
JOIN prodotti p ON o.id_prodotto = p.id_prodotto
WHERE o.importo > p.prezzo * 1.5;

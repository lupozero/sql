--Skew e HASH JOIN inefficiente

drop index idx_ordini_cliente;

drop index idx_ordini_prodotto;


SELECT p.id_prodotto, COUNT(*)
FROM ordini_2 o
JOIN prodotti_2 p ON o.id_prodotto = p.id_prodotto
GROUP BY p.id_prodotto;

-- Piano atteso:  HASH JOIN con possibile spill su TEMP
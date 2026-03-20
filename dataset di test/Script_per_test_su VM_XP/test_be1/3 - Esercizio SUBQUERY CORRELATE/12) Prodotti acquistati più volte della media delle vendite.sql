SELECT id_prodotto, COUNT(*) AS vendite
FROM ordini_mono
GROUP BY id_prodotto
HAVING COUNT(*) >
       (SELECT AVG(cnt)
        FROM (
            SELECT COUNT(*) AS cnt
            FROM ordini_mono
            GROUP BY id_prodotto
        ));

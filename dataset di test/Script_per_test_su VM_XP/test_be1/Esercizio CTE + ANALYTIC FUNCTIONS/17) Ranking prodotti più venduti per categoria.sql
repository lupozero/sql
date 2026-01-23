WITH vendite AS (
    SELECT p.id_categoria, p.nome_prodotto, COUNT(*) AS num_vendite
    FROM ordini_mono o
    JOIN prodotti p ON o.id_prodotto = p.id_prodotto
    GROUP BY p.id_categoria, p.nome_prodotto
) 
SELECT vendite.*,
       RANK() OVER (PARTITION BY id_categoria ORDER BY num_vendite DESC) AS pos
FROM vendite;

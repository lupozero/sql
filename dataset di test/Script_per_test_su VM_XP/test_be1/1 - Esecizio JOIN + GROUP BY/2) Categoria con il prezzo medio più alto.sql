SELECT nome_categoria, AVG(prezzo) AS prezzo_medio
FROM categorie cat
JOIN prodotti p ON cat.id_categoria = p.id_categoria
GROUP BY nome_categoria
ORDER BY prezzo_medio DESC;

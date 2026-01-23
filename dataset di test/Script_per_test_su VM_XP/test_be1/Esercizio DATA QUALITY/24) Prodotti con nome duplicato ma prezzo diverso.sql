SELECT nome_prodotto
FROM prodotti
GROUP BY nome_prodotto
HAVING COUNT(DISTINCT prezzo) > 1;

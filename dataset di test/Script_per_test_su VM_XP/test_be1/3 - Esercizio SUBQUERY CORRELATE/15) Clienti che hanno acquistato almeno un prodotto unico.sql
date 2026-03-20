SELECT  c.id_cliente,o.id_prodotto,o.id_ordine
FROM clienti c
JOIN ordini_mono o ON c.id_cliente = o.id_cliente
WHERE EXISTS (
    SELECT 1
    FROM ordini_mono o2
    WHERE o2.id_prodotto = o.id_prodotto
    GROUP BY o2.id_prodotto
    HAVING COUNT(*) = 1
);


La query restituisce tutti gli ordini (e i relativi clienti) che riguardano prodotti acquistati una sola volta in tutta la tabella ordini_mono.

In altre parole:

Mostra gli ordini relativi a prodotti che compaiono una sola volta nella tabella degli ordini.

Questa sottoquery:

prende il prodotto dell’ordine corrente (o.id_prodotto)

cerca tutti gli ordini che hanno lo stesso prodotto

li raggruppa per prodotto

verifica che il numero di occorrenze sia esattamente 1

Quindi la condizione è vera solo se quel prodotto compare una sola volta nella tabella.
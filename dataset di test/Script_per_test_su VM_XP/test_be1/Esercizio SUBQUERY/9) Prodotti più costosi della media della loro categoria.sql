SELECT p.*
FROM prodotti p
WHERE prezzo >
      (SELECT AVG(prezzo)
       FROM prodotti
       WHERE id_categoria = p.id_categoria);

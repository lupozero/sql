SELECT *
FROM clienti
WHERE telefono IS NOT NULL
  AND LENGTH(telefono) < 10;

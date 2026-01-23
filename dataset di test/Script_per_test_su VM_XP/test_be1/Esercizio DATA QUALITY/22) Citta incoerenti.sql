SELECT citta, COUNT(*)
FROM clienti
GROUP BY citta
HAVING citta <> INITCAP(TRIM(citta));

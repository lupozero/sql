SELECT LOWER(TRIM(email)) AS email_norm, COUNT(*)
FROM clienti
GROUP BY LOWER(TRIM(email))
HAVING COUNT(*) > 1;

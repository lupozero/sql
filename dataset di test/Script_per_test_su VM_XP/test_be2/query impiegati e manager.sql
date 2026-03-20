SELECT 
    E.Nome || ' ' || E.Cognome AS Dipendente,
    M.Nome || ' ' || M.Cognome AS Responsabile,
    E.Ruolo
FROM Impiegati E
LEFT JOIN Impiegati M
       ON E.ResponsabileID = M.ID
ORDER BY E.ID;

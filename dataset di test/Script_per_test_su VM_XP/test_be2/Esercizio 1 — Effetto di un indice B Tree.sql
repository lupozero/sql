SELECT *
FROM clienti
WHERE cognome = 'Rossi';

CREATE INDEX idx_clienti_cognome ON clienti(cognome);
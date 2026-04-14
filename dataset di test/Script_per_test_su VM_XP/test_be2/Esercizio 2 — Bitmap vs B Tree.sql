SELECT *
FROM clienti
WHERE stato_cliente = 'A';


CREATE  INDEX  idx_clienti_stato ON clienti(stato_cliente);

CREATE BITMAP INDEX idx_cli_stato_bmp ON clienti (stato_cliente);

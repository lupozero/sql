SELECT * FROM clienti WHERE stato_cliente = 'N';

CREATE  INDEX idx_cli_stato_bmp ON clienti(stato_cliente);

drop index idx_cli_stato_bmp ;
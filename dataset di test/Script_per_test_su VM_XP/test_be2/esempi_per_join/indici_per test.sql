

CREATE INDEX idx_ordini_cliente ON ordini_2 (id_cliente);

CREATE INDEX idx_ordini_prodotto ON ordini_2 (id_prodotto);

drop index idx_ordini_cliente;
drop index idx_ordini_prodotto;

SELECT *
FROM ordini
WHERE data_ordine = '2023-01-01';


CREATE INDEX idx_ordini_data ON ordini(data_ordine);
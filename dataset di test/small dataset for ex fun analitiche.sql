CREATE TABLE vendite (
    id INT,
    cliente VARCHAR(50),
    categoria VARCHAR(50),
    data_vendita DATE,
    importo DECIMAL(10,2)
);

--DML per popolamento tabelle
INSERT INTO vendite VALUES
(1, 'Marco', 'Elettronica', date '2024-01-01', 120),
(2, 'Marco', 'Elettronica', date '2024-01-05', 80),
(3, 'Anna',  'Casa',        date '2024-01-03', 45),
(4, 'Anna',  'Casa',        date '2024-01-10', 60),
(5, 'Luca',  'Sport',       date '2024-01-02', 200),
(6, 'Luca',  'Sport',       date '2024-01-15', 150),
(7, 'Marco', 'Elettronica', date '2024-01-20', 99); 

--Funzioni di Finestra: PARTITION BY e ORDER BY
--Somma cumulativa (running total)
SELECT cliente, data_vendita, importo,
       SUM(importo) OVER (
           PARTITION BY cliente
           ORDER BY data_vendita
       ) AS totale_cumulato
FROM vendite;


--Media mobile (moving average)
SELECT cliente, data_vendita, importo,
       AVG(importo) OVER (
           PARTITION BY cliente
           ORDER BY data_vendita
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS media_mobile_3
FROM vendite;

 
--Funzioni di Ranking
--RANK()
SELECT cliente, importo,
       RANK() OVER (ORDER BY importo DESC) AS posizione
FROM vendite;
--DENSE_RANK()
SELECT cliente, importo,
       DENSE_RANK() OVER (ORDER BY importo DESC) AS posizione
FROM vendite;
--ROW_NUMBER()
SELECT cliente, importo,
       ROW_NUMBER() OVER (ORDER BY importo DESC) AS numero_riga
FROM vendite;


--Funzioni LAG e LEAD
--LAG: valore precedente
SELECT cliente, data_vendita, importo,
       LAG(importo) OVER (
           PARTITION BY cliente
           ORDER BY data_vendita
       ) AS importo_precedente
FROM vendite;

--LEAD: valore successivo
SELECT cliente, data_vendita, importo,
       LEAD(importo) OVER (
           PARTITION BY cliente
           ORDER BY data_vendita
       ) AS importo_successivo
FROM vendite;

--Funzioni FIRST_VALUE e LAST_VALUE
--FIRST_VALUE
SELECT cliente, data_vendita, importo,
       FIRST_VALUE(importo) OVER (
           PARTITION BY cliente
           ORDER BY data_vendita
       ) AS primo_importo
FROM vendite;

--LAST_VALUE (con finestra corretta)
SELECT cliente, data_vendita, importo,
       LAST_VALUE(importo) OVER (
           PARTITION BY cliente
           ORDER BY data_vendita
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS ultimo_importo
FROM vendite;


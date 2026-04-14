-- ORACLE
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100),
    phone VARCHAR2(15),
    created_at DATE DEFAULT SYSDATE
);

CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100),
    price NUMBER,
    created_at DATE DEFAULT SYSDATE
);

CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    product_id NUMBER,
    order_date DATE DEFAULT SYSDATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

--SQL SERVER

CREATE TABLE customers (
    customer_id int PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    created_at DATEtime DEFAULT GETDATE()
);

CREATE TABLE products (
    product_id int PRIMARY KEY,
    product_name VARCHAR(100),
    price int,
    created_at DATEtime DEFAULT GETDATE()
);

CREATE TABLE orders (
    order_id int PRIMARY KEY,
    customer_id int,
    product_id int,
    order_date DATEtime DEFAULT GETDATE(),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

--ORACLE
BEGIN
    FOR i IN 1..1000 LOOP
        INSERT INTO customers (customer_id, first_name, last_name, email, phone)
        VALUES (i, 'FirstName' || i, 'LastName' || i, 'email' || i || '@example.com', '1234567890');
    END LOOP;

    FOR i IN 1..100 LOOP
        INSERT INTO products (product_id, product_name, price)
        VALUES (i, 'ProductName' || i, ROUND(DBMS_RANDOM.VALUE(10, 100), 2));
    END LOOP;

    FOR i IN 1..200 LOOP
        INSERT INTO orders (order_id, customer_id, product_id)
        VALUES (i, MOD(i, 1000) + 1, MOD(i, 100) + 1);
        INSERT INTO orders (order_id, customer_id, product_id)
        VALUES (i + 200, MOD(i, 1000) + 1, MOD(i + 1, 100) + 1);
    END LOOP;

    COMMIT;
END;
/

--SQL SERVER
DECLARE @i INT = 1;

WHILE @i <= 100
BEGIN
    INSERT INTO customers (customer_id, first_name, last_name, email, phone)
    VALUES (
        @i,
        CONCAT('Nome_', @i),
        CONCAT('Cognome_', @i),
        CONCAT('cliente', @i, '@mail.com'),
        CONCAT('320', RIGHT('000000' + CAST(@i AS VARCHAR(6)), 6))
    );

    SET @i = @i + 1;
END;


DECLARE @p INT = 1;

WHILE @p <= 20
BEGIN
    INSERT INTO products (product_id, product_name, price)
    VALUES (
        @p,
        CONCAT('Prodotto_', @p),
        (FLOOR(RAND() * 200) + 10)   -- prezzo tra 10 e 210
    );

    SET @p = @p + 1;
END;


DECLARE @o INT = 1;

WHILE @o <= 100
BEGIN
    INSERT INTO orders (order_id, customer_id, product_id, order_date)
    VALUES (
        @o,
        FLOOR(RAND() * 100) + 1,   -- customer_id valido
        FLOOR(RAND() * 20) + 1,    -- product_id valido
        DATEADD(DAY, -FLOOR(RAND() * 30), GETDATE())  -- ultimi 30 giorni
    );

    SET @o = @o + 1;
END;



select first_name,last_name,sum(price) as tot_order, count(*) as qta_order
from orders o
join products p on p.product_id = o.product_id
join customers c on c.customer_id = o.customer_id
group by first_name,last_name
order by first_name,last_name;

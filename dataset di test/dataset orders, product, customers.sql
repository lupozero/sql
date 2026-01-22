
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


select first_name,last_name,sum(price) as tot_order, count(*) as qta_order
from orders o
join products p on p.product_id = o.product_id
join customers c on c.customer_id = o.customer_id
group by first_name,last_name
order by first_name,last_name;

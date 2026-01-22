CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100),
    phone VARCHAR2(15),
    created_at DATE DEFAULT SYSDATE
);


BEGIN
    FOR i IN 1..20 LOOP
        INSERT INTO customers (customer_id, first_name, last_name, email, phone)
        VALUES (i, 'FirstName' || i, 'LastName' || i, 'email' || i || '@example.com', '1234567890');
    END LOOP;
    COMMIT;
END;
/

SELECT * FROM customers;

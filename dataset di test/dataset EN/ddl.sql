CREATE TABLE customers (
    customer_id     INT PRIMARY KEY,
    name            VARCHAR(100),
    region          VARCHAR(50),
    signup_date     DATE
);

CREATE TABLE products (
    product_id      INT PRIMARY KEY,
    name            VARCHAR(100),
    category        VARCHAR(50),
    price           DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id        INT PRIMARY KEY,
    customer_id     INT REFERENCES customers(customer_id),
    order_date      DATE,
    amount          DECIMAL(10,2),
    status          VARCHAR(20)
);

CREATE TABLE order_items (
    order_id        INT REFERENCES orders(order_id),
    product_id      INT REFERENCES products(product_id),
    quantity        INT,
    unit_price      DECIMAL(10,2),
    PRIMARY KEY (order_id, product_id)
);

CREATE TABLE payments (
    payment_id      INT PRIMARY KEY,
    customer_id     INT REFERENCES customers(customer_id),
    payment_date    DATE,
    amount          DECIMAL(10,2),
    method          VARCHAR(30)
);

CREATE TABLE daily_metrics (
    metric_date     DATE,
    region          VARCHAR(50),
    visits          INT,
    signups         INT,
    PRIMARY KEY (metric_date, region)
);

CREATE TABLE accounts (
    account_id      INT PRIMARY KEY,
    balance         DECIMAL(12,2),
    last_update     DATE
);

CREATE TABLE dept (
    id          INT PRIMARY KEY,
    parent_id   INT NULL REFERENCES dept(id),
    name        VARCHAR(100)
);

--oracle
CREATE TABLE raw_events (
    event_id        INT PRIMARY KEY,
    event_time      TIMESTAMP,
    payload_json    CLOB CHECK (payload_json IS JSON)
);

--sql server
CREATE TABLE raw_events (
    event_id        INT PRIMARY KEY,
    event_time      DATETIME2,
    payload_json    NVARCHAR(MAX)
);

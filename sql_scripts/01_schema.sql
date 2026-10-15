-- Retail database schema
-- Created: 2026-10-14

CREATE TABLE customers (
    customer_id   VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    region        VARCHAR(50)
);

CREATE TABLE products (
    product_id    VARCHAR(10) PRIMARY KEY,
    product_name  VARCHAR(100) NOT NULL,
    category      VARCHAR(50),
    unit_price    NUMERIC(10,2)
);

CREATE TABLE orders (
    order_id       VARCHAR(10) PRIMARY KEY,
    order_date     DATE,
    customer_id    VARCHAR(10) REFERENCES customers(customer_id),
    product_id     VARCHAR(10) REFERENCES products(product_id),
    quantity       INTEGER,
    unit_price_ghs NUMERIC(10,2),
    salesperson    VARCHAR(50)
);
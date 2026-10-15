-- Retail Sales Analysis
-- Database: retail
-- Tables: customers, products, orders

-- ============================================
-- Q1: Total revenue overall
-- ============================================
 SELECT SUM(quantity * unit_price_ghs) AS total_revenue
FROM orders;

--Result = GHS 4,731,304.02

-- Q2: Revenue by region
SELECT
    c.region,
    SUM(o.quantity * o.unit_price_ghs) AS revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.region
ORDER BY revenue DESC;

-- Result 
"Greater Accra"	1558419.20
"Ashanti"	1422383.92
"Western"	460154.86
"Eastern"	425069.14
"Central"	344225.28
"Northern"	288906.64
"Volta"	    232144.98

-- Q3: Top 5 customers by revenue
SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.quantity * o.unit_price_ghs) AS revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY revenue DESC
LIMIT 5;

-- Result
"C0083"	 "Priscilla Owusu"	143462.35
"C0111"	 "Daniel Osei"	    129150.74
"C0162"	 "Efua Antwi"	    87181.92
"C0080"	 "Esi Adjei"	    83342.11
"C0122"	 "Efua Owusu"	    79429.76


-- Q4: Top 5 products by revenue
SELECT
    p.product_name,
    SUM(o.quantity * o.unit_price_ghs) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;

-- Result
"Performance Laptop"	1452562.16
"Office Laptop"	        992991.13
"Mini PC"	            830370.59
"27-inch Monitor"	    390588.31
"Standing Desk"	        218909.17


-- Q5: Revenue by category
SELECT
    p.category,
    SUM(o.quantity * o.unit_price_ghs) AS revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- Result
"Computers"	    3275923.88
"Displays"	    604339.37
"Furniture"	    368279.24
"Networking"	102619.01
"Power"	        102553.49
"Storage"	    98631.29
"Accessories"	89711.48
"Audio"	        89246.26


-- Q6: Revenue by salesperson
SELECT
    salesperson,
    SUM(quantity * unit_price_ghs) AS revenue
FROM orders
GROUP BY salesperson
ORDER BY revenue DESC;

-- Result
"Esther"	747277.78
"Henry"	    674444.90
"Akua"	    650079.96
"Cynthia"	570442.70
"Gifty"	    550152.07
"Felix"	    550048.03
"David"	    520779.88
"Bernard"	468078.70


-- Q7: Yearly revenue
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    SUM(quantity * unit_price_ghs) AS revenue
FROM orders
GROUP BY year
ORDER BY year;

-- Result
2025	3104477.28
2026	1626826.74


-- Q8: Total orders
SELECT COUNT(*) AS total_orders FROM orders;

-- Result
1200


-- Q9: Unique customers who ordered
SELECT COUNT(DISTINCT customer_id) AS unique_customers FROM orders;

-- Result
180


-- Q10: Monthly sales trend
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(quantity * unit_price_ghs) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

-- Result
"2025-01-01 00:00:00+00"	235343.81
"2025-02-01 00:00:00+00"	181338.88
"2025-03-01 00:00:00+00"	273260.27
"2025-04-01 00:00:00+00"	210430.32
"2025-05-01 00:00:00+00"	145899.50
"2025-06-01 00:00:00+00"	236314.72
"2025-07-01 00:00:00+00"	294845.59
"2025-08-01 00:00:00+00"	280160.87
"2025-09-01 00:00:00+00"	240260.71
"2025-10-01 00:00:00+00"	356189.90
"2025-11-01 00:00:00+00"	368458.32
"2025-12-01 00:00:00+00"	281974.39
"2026-01-01 00:00:00+00"	177715.23
"2026-02-01 00:00:00+00"	246225.01
"2026-03-01 00:00:00+00"	185017.94
"2026-04-01 00:00:00+00"	142940.52
"2026-05-01 00:00:00+00"	193731.03
"2026-06-01 00:00:00+00"	233942.29
"2026-07-01 00:00:00+00"	176358.16
"2026-08-01 00:00:00+00"	270896.56




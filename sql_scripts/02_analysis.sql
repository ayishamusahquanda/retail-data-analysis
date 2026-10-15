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


-- Q11: Average order value
SELECT
    ROUND(AVG(quantity * unit_price_ghs), 2) AS avg_order_value
FROM orders;

-- Result
3942.75


--Q12: Revenue by customer, region and category
SELECT
    c.region,
    p.category,
    SUM(o.quantity * o.unit_price_ghs) AS revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p  ON o.product_id  = p.product_id
GROUP BY c.region, p.category
ORDER BY c.region, revenue DESC;

-- Result
"Ashanti"	    "Computers"	    1032372.36
"Ashanti"	    "Displays"	    218557.38
"Ashanti"	    "Furniture"	    70877.22
"Ashanti"	    "Power"	        29041.49
"Ashanti"	    "Networking"	22122.16
"Ashanti"	    "Accessories"	16970.79
"Ashanti"	    "Audio"	        16533.10
"Ashanti"	    "Storage"	    15909.42
"Central"	    "Computers"	    219286.62
"Central"	    "Furniture"	    37270.69
"Central"	    "Displays"	    31583.32
"Central"	    "Audio"	        15326.31
"Central"	    "Networking"	13211.04
"Central"	    "Accessories"	10799.99
"Central"	    "Power"	        8788.51
"Central"	    "Storage"	    7958.80
"Eastern"	    "Computers"	    289944.58
"Eastern"	    "Displays"	    57475.54
"Eastern"	    "Furniture"	    28454.04
"Eastern"	    "Audio"	1       4717.27
"Eastern"	    "Storage"	    13531.31
"Eastern"	    "Accessories"	11513.71
"Eastern"	    "Networking"	9432.69
"Greater Accra"	    "Computers" 	1132978.04
"Greater Accra"	    "Displays"	    170474.35
"Greater Accra"	    "Furniture" 	136829.04
"Greater Accra"	    "Power"	        33532.57
"Greater Accra"	    "Storage"	    25982.18
"Greater Accra"	    "Audio"	        21799.89
"Greater Accra"	    "Networking"	18637.04
"Greater Accra"	    "Accessories"	18186.09
"Northern"	    "Computers"	    170803.63
"Northern"	    "Displays"	    43779.26
"Northern"	    "Furniture"	    33296.30
"Northern"	    "Power"	        11782.79
"Northern"	    "Accessories"	10805.94
"Northern"	    "Networking"	6979.33
"Northern"	    "Storage"	    5837.81
"Northern"	    "Audio"	        5621.58
"Volta"	        "Computers"	    140327.03
"Volta"	        "Displays"	    28739.46
"Volta"	        "Storage"	    19483.23
"Volta"	        "Furniture"	    10955.69
"Volta"	        "Networking"	10727.42
"Volta"	        "Accessories"	8703.60
"Volta"	        "Power"	        8225.09
"Volta"	        "Audio"	        4983.46
"Western"	    "Computers"	    290211.62
"Western"	    "Displays"	    53730.06
"Western"	    "Furniture"	    50596.26
"Western"	    "Networking"	21509.33
"Western"	    "Accessories"	12731.36
"Western"	    "Power"	        11183.04
"Western"	    "Audio"	        10264.65
"Western"	    "Storage"	    9928.54


-- Q13: Orders with negative quantity (returns)
SELECT
    order_id,
    order_date,
    customer_id,
    product_id,
    quantity,
    unit_price_ghs
FROM orders
WHERE quantity < 0;

-- Result
0


-- Q14 : Customers who ordered only once
SELECT
    c.customer_id,
    c.customer_name,
    COUNT(*) AS order_count
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(*) = 1
ORDER BY c.customer_name;

-- Result
"C0101" 	"Abena Agyeman"	    1
"C0072" 	"Akosua Nyarko"	    1
"C0034"	    "Ama Osei"	        1
"C0018" 	"Kojo Osei"	        1


--Q15: Top 3 products per category
SELECT category, product_name, revenue
FROM (
    SELECT
        p.category,
        p.product_name,
        SUM(o.quantity * o.unit_price_ghs) AS revenue,
        ROW_NUMBER() OVER (PARTITION BY p.category ORDER BY SUM(o.quantity * o.unit_price_ghs) DESC) AS rn
    FROM orders o
    JOIN products p ON o.product_id = p.product_id
    GROUP BY p.category, p.product_name
) ranked
WHERE rn <= 3
ORDER BY category, rn;

--Result
"Accessories"	"Mechanical Keyboard"	26440.19
"Accessories"	"USB-C Hub"	            20463.33
"Accessories"	"Webcam"	            18914.99
"Audio"	        "Bluetooth Speaker"	    50657.08
"Audio"	        "Headset"	            38589.18
"Computers"	    "Performance Laptop"	1452562.16
"Computers"	    "Office Laptop"	        992991.13
"Computers"	     "Mini PC"	            830370.59
"Displays"	    "27-inch Monitor"	    390588.31
"Displays"	    "24-inch Monitor"	    213751.06
"Furniture"	    "Standing Desk"	        218909.17
"Furniture"	    "Office Chair"	        129984.67
"Furniture"	    "Desk Lamp"	            19385.40
"Networking"	"Wi-Fi Router"	        58454.49
"Networking"	"Ethernet Switch"	    44164.52
"Power"	        "UPS"	                102553.49
"Storage"	    "External SSD 1TB"	    84254.27
"Storage"	    "Flash Drive 128GB"	    14377.02


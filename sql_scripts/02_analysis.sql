-- Retail Sales Analysis
-- Database: retail
-- Tables: customers, products, orders

-- ============================================
-- Q1: Total revenue overall
-- ============================================
 SELECT SUM(quantity * unit_price_ghs) AS total_revenue
FROM orders;

--Result = GHS 4,731,304.02


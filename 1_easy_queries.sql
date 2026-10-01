-- ====================================================================
-- QUESTION SET 1: EASY
-- ====================================================================

-- Q1: Who is the senior most employee based on job title?
-- Objective: Identify the employee with the highest organizational level.

SELECT 
    employee_id,
    first_name,
    last_name,
    title,
    levels
FROM employee
ORDER BY levels DESC
LIMIT 1;


-- Q2: Which countries have the most Invoices?
-- Objective: Count total invoices grouped by billing country to find market density.

SELECT 
    billing_country,
    COUNT(invoice_id) AS total_invoices
FROM invoice
GROUP BY billing_country
ORDER BY total_invoices DESC;


-- Q3: What are the top 3 values of total invoice?
-- Objective: Isolate the highest transaction amounts recorded.

SELECT 
    total
FROM invoice
ORDER BY total DESC
LIMIT 3;


-- Q4: Which city has the best customers for a promotional Music Festival?
-- Objective: Find the city generating the highest aggregate revenue.

SELECT 
    billing_city,
    SUM(total) AS aggregate_revenue
FROM invoice
GROUP BY billing_city
ORDER BY aggregate_revenue DESC
LIMIT 1;


-- Q5: Who is the best customer based on total spending?
-- Objective: Identify the customer with the highest cumulative invoice totals across tables.   

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(i.total) AS total_spent
FROM customer c
INNER JOIN invoice i 
    ON c.customer_id = i.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC
LIMIT 1;

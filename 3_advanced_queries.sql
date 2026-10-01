-- ====================================================================
-- QUESTION SET 3: ADVANCED
-- ====================================================================

-- Q1: Find how much amount spent by each customer on artists? 
-- Write a query to return customer name, artist name and total spent.
WITH artist_spend AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        a.name AS artist_name,
        SUM(il.unit_price * il.quantity) AS total_spent
    FROM customer c
    INNER JOIN invoice i       ON c.customer_id = i.customer_id
    INNER JOIN invoice_line il ON i.invoice_id = il.invoice_id
    INNER JOIN track t         ON il.track_id = t.track_id
    INNER JOIN album al        ON t.album_id = al.album_id
    INNER JOIN artist a        ON al.artist_id = a.artist_id
    GROUP BY c.customer_id, c.first_name, c.last_name, a.name
)
SELECT 
    first_name || ' ' || last_name AS customer_name,
    artist_name,
    ROUND(CAST(total_spent AS NUMERIC), 2) AS total_spent
FROM artist_spend
ORDER BY total_spent DESC;


-- Q2: We want to find out the most popular music Genre for each country. 
-- We determine the most popular genre as the genre with the highest amount of purchases. 
-- For countries where the maximum number of purchases is shared, return all Genres.
WITH genre_popularity AS (
    SELECT 
        i.billing_country AS country,
        g.name AS genre_name,
        COUNT(il.invoice_line_id) AS purchases,
        DENSE_RANK() OVER (PARTITION BY i.billing_country ORDER BY COUNT(il.invoice_line_id) DESC) AS rank
    FROM invoice_line il
    INNER JOIN invoice i ON il.invoice_id = i.invoice_id
    INNER JOIN track t   ON il.track_id = t.track_id
    INNER JOIN genre g   ON t.genre_id = g.genre_id
    GROUP BY i.billing_country, g.name
)
SELECT 
    country,
    genre_name,
    purchases
FROM genre_popularity
WHERE rank = 1
ORDER BY country ASC;


-- Q3: Write a query that determines the customer that has spent the most on music for each country. 
-- Write a query that returns the country along with the top customer and how much they spent. 
-- For countries where the top amount spent is shared, provide all customers who spent this amount.
WITH customer_country_spend AS (
    SELECT 
        c.customer_id,
        c.first_name,
        c.last_name,
        i.billing_country AS country,
        SUM(i.total) AS total_spent,
        DENSE_RANK() OVER (PARTITION BY i.billing_country ORDER BY SUM(i.total) DESC) AS rank
    FROM customer c
    INNER JOIN invoice i ON c.customer_id = i.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name, i.billing_country
)
SELECT 
    country,
    first_name || ' ' || last_name AS customer_name,
    ROUND(CAST(total_spent AS NUMERIC), 2) AS total_spent
FROM customer_country_spend
WHERE rank = 1
ORDER BY country ASC;

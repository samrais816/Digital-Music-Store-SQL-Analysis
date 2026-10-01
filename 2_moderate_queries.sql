-- ====================================================================
-- QUESTION SET 2: MODERATE / INTERMEDIATE
-- ====================================================================

-- Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners.
-- Return your list ordered alphabetically by email starting with A.
SELECT DISTINCT 
    c.email, 
    c.first_name, 
    c.last_name, 
    g.name AS genre_name
FROM customer c
INNER JOIN invoice i      ON c.customer_id = i.customer_id
INNER JOIN invoice_line il ON i.invoice_id = il.invoice_id
INNER JOIN track t        ON il.track_id = t.track_id
INNER JOIN genre g        ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
ORDER BY c.email ASC;


-- Q2: Let's invite the artists who have written the most rock music in our dataset.
-- Write a query that returns the Artist name and total track count of the top 10 rock bands.
SELECT 
    a.artist_id,
    a.name AS artist_name, 
    COUNT(t.track_id) AS total_songs
FROM artist a
INNER JOIN album al ON a.artist_id = al.artist_id
INNER JOIN track t  ON al.album_id = t.album_id
INNER JOIN genre g  ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
GROUP BY a.artist_id, a.name
ORDER BY total_songs DESC
LIMIT 10;


-- Q3: Return all the track names that have a song length longer than the average song length.
-- Return the Name and milliseconds for each track. Order by the song length with the longest first.
SELECT 
    name AS track_name, 
    milliseconds
FROM track
WHERE milliseconds > (
    SELECT AVG(milliseconds) 
    FROM track
)
ORDER BY milliseconds DESC;


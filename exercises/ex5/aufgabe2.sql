 -- 2.1
SELECT  *
FROM authors
WHERE city = "San Francisco"; 

-- 2.2 
SELECT  COUNT(*)
FROM titles
WHERE title LIKE "S%"; 

-- 2.3 
SELECT  AVG(price)
FROM titles; 

-- 2.4
SELECT  sales.date
FROM sales
LEFT JOIN stores
ON sales.stor_id = stores.stor_id
WHERE stores.stor_name = "Bookbeat"; -- 2.5 

SELECT  titles.title
FROM salesdetail AS s
LEFT JOIN titles
ON s.title_id = titles.title_id
LEFT JOIN stores
ON s.stor_id = stores.stor_id
WHERE stores.stor_name = "Bookbeat"; -- 2.6 

SELECT  title
       ,price
FROM titles
ORDER BY price DESC
LIMIT 1; 

-- 2.7
SELECT  *
FROM titles
WHERE price > ( 
SELECT  price
FROM titles
WHERE type LIKE "%psychology%"
ORDER BY price ASC 
LIMIT 1); 

-- 2.8
SELECT  *
FROM authors
WHERE city NOT IN ( SELECT city FROM stores GROUP BY city); 

-- 2.9 
SELECT  city
FROM authors
WHERE city IN ( SELECT city FROM publishers GROUP BY city) 
GROUP BY  city; 

-- 2.10
SELECT  title
FROM titles
WHERE type = ( 
SELECT  type
FROM titles
WHERE title = "Net Etiquette"); 

-- 2.11 
SELECT  type
       ,COUNT(*) AS "Anzahl"
FROM titles
GROUP BY  type; 

-- 2.12
SELECT  type
       ,COUNT(*) AS "Anzahl"
FROM titles
GROUP BY  type
HAVING COUNT(*) > 2; 

-- 2.13
SELECT  state
       ,COUNT(*) AS "Anzahl Authoren"
FROM authors
GROUP BY  state
ORDER BY COUNT(*) DESC; 

-- 2.14
SELECT  p.pub_name
FROM titles AS t
LEFT JOIN publishers AS p
ON t.pub_id = p.pub_id
GROUP BY  p.pub_id
HAVING COUNT(*) <
SELECT  AVG(a.number)
FROM 
(
	SELECT  COUNT(*) AS number
	FROM titles AS t
	LEFT JOIN publishers AS p
	ON t.pub_id = p.pub_id
	GROUP BY  p.pub_id
) AS a;
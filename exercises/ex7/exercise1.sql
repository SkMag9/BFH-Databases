-- Aufgabe 1 
-- Sebastian Miszczuk, Miriam Streit

-- 1.1
SELECT  st.stor_name AS "Laden"
       ,a.au_lname   AS "Author"
       ,SUM(t.price) AS "Gesamtpreis"
FROM titles AS t
JOIN titleauthor AS ta
    ON ta.title_id = t.title_id
JOIN authors AS a
    ON a.au_id = ta.au_id
JOIN salesdetail AS sd
    ON t.title_id = sd.title_id
JOIN sales AS s
    ON (sd.stor_id = s.stor_id AND sd.ord_num = s.ord_num)
JOIN stores AS st
    ON st.stor_id = s.stor_id
GROUP BY  st.stor_id
         ,a.au_id
ORDER BY Gesamtpreis DESC;

-- 1.2
SELECT  au_id
       ,au_fname
       ,au_lname
FROM 
(
    SELECT  a.au_id
           ,a.au_fname
           ,a.au_lname
           ,COUNT() AS pb
    FROM authors AS a
    JOIN titleauthor AS ta
        ON ta.au_id = a.au_id
    JOIN titles AS t
        ON t.title_id = ta.title_id
    WHERE t.type LIKE "psychology%" 
    GROUP BY  a.au_id
    HAVING pb < 
    (
        SELECT  COUNT() AS pb
        FROM authors AS a
        JOIN titleauthor AS ta
            ON ta.au_id = a.au_id
        JOIN titles AS t
            ON t.title_id = ta.title_id
        WHERE a.au_fname = "Livia" 
            AND a.au_lname = "Karsen" 
            AND t.type LIKE "psychology%" 
    ) 
    UNION 
    SELECT  a.au_id
           ,a.au_fname
           ,au_lname
           ,0 AS pb
    FROM authors AS a
    JOIN titleauthor AS ta
        ON ta.au_id = a.au_id
    JOIN titles AS t
        ON t.title_id = ta.title_id
    WHERE t.type NOT LIKE "psychology%" 
    GROUP BY  a.au_id 
)
GROUP BY  au_id;

-- 1.3
SELECT  t.title
       ,t.price
       ,t.total_sales
       ,(r.royalty * 0.01 * t.total_sales * t.price) AS "Tantieme"
FROM titles AS t
JOIN roysched AS r
    ON r.title_id = t.title_id
WHERE (t.total_sales > r.lorange AND t.total_sales < r.hirange) 
GROUP BY  t.title
         ,r.lorange
         ,r.hirange
ORDER BY t.title ASC; 

 -- 1.4
SELECT  t.title 
       ,t.total_sales AS "Wert" 
       ,t2.anzahl
FROM titles AS t
LEFT JOIN 
(
	SELECT  ta.title_id 
	       ,SUM(sd.qty) AS anzahl
	FROM titles AS ta
	LEFT JOIN salesdetail AS sd
	ON ta.title_id = sd.title_id
	GROUP BY  ta.title_id 
) t2
    ON (t2.title_id = t.title_id)
WHERE ((t.total_sales != t2.anzahl) 
    OR (t.total_sales IS NULL AND t2.anzahl IS NOT NULL) 
    OR (t.total_sales IS NOT NULL AND t2.anzahl IS NULL)
);  

-- 1.5
--- all book types
SELECT t.type FROM titles AS t
GROUP BY t.type;

--- all book types a store has sold: 
SELECT s.stor_name, t.type FROM stores AS s
JOIN salesdetail as sd
    ON sd.stor_id = s.stor_id
JOIN titles AS t
    ON sd.title_id = t.title_id
GROUP BY s.stor_id, t.type;

--- complete query
SELECT s.stor_name, t.type FROM stores AS s
JOIN salesdetail as sd
    ON sd.stor_id = s.stor_id
JOIN titles AS t
    ON sd.title_id = t.title_id
GROUP BY s.stor_id, t.type;
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
       ,t2.anzahl
       ,(r.royalty * 0.01 * t2.anzahl * t.price) AS "Tantieme"
FROM titles AS t
JOIN roysched AS r
ON r.title_id = t.title_id
JOIN 
(
	SELECT  ta.title_id
	       ,COUNT() AS anzahl
	FROM titles AS ta
	JOIN salesdetail AS sd
	ON ta.title_id = sd.title_id
	GROUP BY  ta.title_id
) t2
ON (t2.title_id = t.title_id)
WHERE ( t2.anzahl > r.lorange AND t2.anzahl < r.hirange) 
GROUP BY  t.title
         ,r.lorange
         ,r.hirange
ORDER BY t.title ASC; 

-- 1.4
SELECT 
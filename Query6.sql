--Min / Max Country
(SELECT DISTINCT country,
                COUNT(user_id) AS users_per_country
        
                FROM query_6
                GROUP BY country
                ORDER BY 2 DESC
                LIMIT 1)

UNION      
      
(SELECT DISTINCT country,
                COUNT(user_id) AS users_per_country
        
                FROM query_6
                GROUP BY 1
                ORDER BY 2 ASC
                LIMIT 1)


-- Get first and last user from each country
SELECT country, user_id, created_at
FROM 
(SELECT country,
		user_id,
 		created_at,
 		RANK() OVER(PARTITION BY country ORDER BY created_at) AS last_user,
		RANK() OVER(PARTITION BY country ORDER BY created_at DESC) AS first_user
 FROM query_6
 ORDER BY country, created_at
)sub
WHERE sub.last_user = 1 OR sub.first_user = 1
ORDER BY country, created_at                
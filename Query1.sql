SELECT user_id,  
difference AS time_dif
FROM( 
	SELECT user_id, 
	unix_timestamp - LAG(unix_timestamp) OVER
	(PARTITION BY user_id ORDER BY unix_timestamp) as difference
	FROM query_one
) sub
WHERE sub.difference IS NOT NULL
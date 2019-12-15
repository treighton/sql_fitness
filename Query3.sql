SELECT 
user_id, 
sub.became_powerful
FROM(
	SELECT user_id, 
	date AS became_powerful, 
	RANK() OVER(PARTITION BY user_id ORDER BY date) as rank
	FROM query_3
)sub
WHERE sub.rank = 10
order by user_id
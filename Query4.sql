-- Part 1
SELECT s.user_id::int, sum(s.amount) as user_tot 
FROM (
	SELECT 
		user_id,
		sum(transaction_amount) as amount
	FROM query_4_mar
	GROUP BY user_id
	UNION
	SELECT 
		user_id,
		sum(transaction_amount) as amount
	FROM query_4_apr
	GROUP BY user_id
) s
GROUP by user_id
ORDER BY user_id

--Part 2
SELECT 
	s.user_id::int, s.date, 
	SUM(s.amount) OVER 
	(PARTITION BY s.user_id ORDER BY s.date) as cum_user_tot
	
FROM (
	SELECT 
		user_id,
		date,
		sum(transaction_amount) as amount
	FROM query_4_mar
	GROUP BY user_id, date
	UNION
	SELECT 
		user_id,
		date,
		sum(transaction_amount) as amount
	FROM query_4_apr
	GROUP BY user_id, date
) s
ORDER BY s.user_id
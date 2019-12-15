--Avg
SELECT AVG(transactions.transaction_amount) as average_amount
FROM query_5_user users
JOIN query_5_transaction transactions
ON users.user_id = transactions.user_id
WHERE users.sign_up_date = DATE_TRUNC('day', transaction_date)

--Median
-- I had to rely on some median calcs i found online for this one...
SELECT ROUND(AVG(CASE WHEN sub.total_count%2 = 0 AND
                (sub.row_count = sub.total_count/2 OR sub.row_count = sub.total_count/2+1)
                THEN sub.transaction_amount 
            WHEN sub.total_count%2 != 0 AND 
                (sub.row_count = sub.total_count/2+1)
                THEN sub.transaction_amount
                ELSE NULL END)) AS median
  FROM
      (SELECT *,
        ROW_NUMBER() OVER (ORDER BY transactions.transaction_amount)
                      AS row_count,
        COUNT(1) OVER ()
                      AS total_count
      FROM query_5_user users
      JOIN query_5_transaction transactions
        ON users.user_id = transactions.user_id
        WHERE users.sign_up_date = DATE_TRUNC('day', transaction_date)
        
        ORDER BY transactions.transaction_amount) sub
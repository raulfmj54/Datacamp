WITH user_activity AS (
SELECT DISTINCT    
	DATE_TRUNC('month', order_date) :: DATEAS delivr_month,    
user_id
FROM orders)

SELECT  
	previous.delivr_month,
	ROUND(COUNT(DISTINCT current.user_id) :: NUMERIC /
	GREATEST(COUNT(DISTINCT previous.user_id), 1),2) AS retention
FROM user_activity AS previous
LEFT JOIN user_activity AS current
ON previous.user_id = current.user_id
AND previous.delivr_month = (current.delivr_month - INTERVAL '1 month')
GROUP BY previous.delivr_month
ORDER BY previous.delivr_month ASCLIMIT 3;
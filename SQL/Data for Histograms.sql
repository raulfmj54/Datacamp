WITH user_revenues AS (
	SELECT    
		user_id,
		SUM(meal_price * order_quantity) AS revenue
	FROM meals
	JOIN orders 
	ON meals.meal_id = orders.meal_id
	GROUP BY user_id)
SELECT
	ROUND(revenue :: NUMERIC, -2) AS revenue_100,
	COUNT(DISTINCT user_id) ASusers
FROM user_revenues
GROUP BY revenue_100
ORDER BY revenue_100 ASC;


WITH user_revenues AS (
	SELECT    
		user_id,
		SUM(meal_price * order_quantity) AS revenue
	FROM meals
	JOIN orders 
	ON meals.meal_id = orders.meal_id
	GROUP BY user_id)
SELECT
	ROUND(revenue :: NUMERIC, -2) AS revenue_100,
	COUNT(DISTINCT user_id) ASusers
FROM user_revenues
GROUP BY revenue_100
ORDER BY revenue_100 ASC;
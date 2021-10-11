SELECT date,
			 amount,
			 lag(amount) OVER(ORDER BY date),
			 amount - lag(amount) OVER(ORDER BY date) as change
FROM sales
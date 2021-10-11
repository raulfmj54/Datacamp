
SELECT AVG(gap)
	FROM (SELECT date - lag(date) OVER(ORDER BY date) AS gap
				FROM sales) as gaps

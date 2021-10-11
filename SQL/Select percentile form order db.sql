select
        lob,
        count(1) orders,
        ----We use any value as our original database is at order_id level----
        any_value(p25) p25,
        any_value(p50) p50,
        any_value(p75) p75,
        any_value(p90) p90,
        any_value(p95) p95,
        any_value(p99) p99,
        any_value(p100) p100
from(
select
        line_of_business as lob,
        percentile_cont(order_total_usd, 0.25) over(partition by lob) as p25,
        percentile_cont(order_total_usd, 0.50) over(partition by lob) as p50,
        percentile_cont(order_total_usd, 0.75) over(partition by lob) as p75,
        percentile_cont(order_total_usd, 0.90) over(partition by lob) as p90,
        percentile_cont(order_total_usd, 0.95) over(partition by lob) as p95,
        percentile_cont(order_total_usd, 0.99) over(partition by lob) as p99,
        percentile_cont(order_total_usd, 1) over(partition by lob) as p100
from production.orders
where 1=1
and order_status in ("OD", "RD", "TD")
and mo_key between 202101 and 202108
and country!="VE")
group by lob;
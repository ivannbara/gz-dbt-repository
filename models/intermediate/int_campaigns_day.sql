SELECT date_date,sum(ads_cost), sum(impression), sum(click) FROM {{ ref("int_campaigns") }}
group by date_date
order by date_date desc
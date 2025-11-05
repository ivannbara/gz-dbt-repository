with om as (
    select 
        date_date,
        count(distinct orders_id) as nb_transactions,
        ROUND(sum(revenue), 2) as revenue,
        ROUND(avg(revenue), 2) as average_basket,
        ROUND(sum(purchase_cost), 2) as purchase_cost,
        ROUND(sum(quantity), 2) as quantity
    from {{ ref("int_orders_margin") }}
    group by date_date
),

oo as (
    select 
        date_date,
        ROUND(sum(operational_margin), 2) as operational_margin,
        ROUND(sum(shipping_fee), 2) as shipping_fee,
        ROUND(sum(logcost), 2) as log_cost
    from {{ ref("int_orders_operational") }}
    group by date_date
)

select 
    date_date,
    nb_transactions,
    revenue,
    average_basket,
    operational_margin,
    purchase_cost,
    shipping_fee,
    log_cost,
    quantity 
from om
left join oo using(date_date)


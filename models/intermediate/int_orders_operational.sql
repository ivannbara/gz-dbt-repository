select orders_id,date_date,round((margin+shipping_fee - (logcost+ship_cost)),2) as margin from {{ ref("int_orders_margin") }}
Left join {{ ref("stg_raw__ship") }} 
using(orders_id)
order by orders_id desc
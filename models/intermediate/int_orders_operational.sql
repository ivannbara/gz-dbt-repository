select *, purchase_price*quantity as purchase_cost, round(revenue -(purchase_price*quantity),2) as margin from {{ ref("stg_raw__sales") }}
Left join {{ ref("stg_raw__product") }} 
on products_id=pdt_id

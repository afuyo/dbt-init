with
orders as (
    select * from {{ref('stg_orders')}}
),
payments as (
    select payment_id,order_id from {{ ref('stg_payments')}}
),
final as (
    select orders.order_id, 
    payments.payment_id, 
    orders.customer_id 
    from orders
    left join payments using(order_id)

)
select * from final

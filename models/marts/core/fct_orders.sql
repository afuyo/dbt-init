with
orders as (
    select * from {{ref('stg_orders')}}
),
payments as (
    select * from {{ ref('stg_payments')}}
),
final as (
    select orders.order_id, 
    payments.payment_id, 
    orders.customer_id,
    payments.amount ,
    orders.status
    from orders
    left join payments using(order_id)

)
select * from final

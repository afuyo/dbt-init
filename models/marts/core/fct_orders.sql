with orders as
(
    select order_id, customer_id from {{ref('stg_orders')}}
),
payments as (
    select payments_id from {{ ref('stg_payments')}}
),
final as (
    select orders.order_id, payments.payments_id, orders.customer_id 
    from orders
    left join orders using(order_id)

)
select * from final

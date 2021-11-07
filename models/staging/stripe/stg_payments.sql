with payments as (
    select  id as payment_id ,
    orderid as order_id,
    paymentmethod as payment_method,
    amount
    
    from raw.stripe.payment
)
select * from payments
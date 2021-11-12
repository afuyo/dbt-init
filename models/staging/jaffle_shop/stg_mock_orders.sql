with orders as (
    
    select
       *
    from {{ source('jaffle_shop', 'mock_orders') }}
)

select * from orders
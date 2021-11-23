with car_sales3 as (
    
    select 
        *
    from {{ source('jaffle_shop', 'car_sales3') }}
)

select * from car_sales3
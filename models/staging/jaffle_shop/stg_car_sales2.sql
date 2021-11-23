with car_sales2 as (
    
    select 
        *
    from {{ source('jaffle_shop', 'car_sales2') }}
)

select * from car_sales2
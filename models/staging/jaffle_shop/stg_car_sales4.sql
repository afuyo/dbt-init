with car_sales4 as (
    
    select 
        *
    from {{ source('jaffle_shop', 'car_sales4') }}
)

select * from car_sales4
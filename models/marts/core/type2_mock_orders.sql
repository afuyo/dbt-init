with mock_orders as (
    select * from {{ ref('stg_mock_orders')}}
),
final as ( select * from mock_orders)
select  order_id, created_at, updated_at,latest_update  from (select *, 
lag(updated_at) 
over (partition by order_id order by updated_at desc range between unbounded preceding and unbounded following) as latest_update 
from final order by order_id ) 
with 

customers as (
    select * from {{ ref('stg_customers')}}
)

select *
from customers
having first_name like '%[^a-z]%'
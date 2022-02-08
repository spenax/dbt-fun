
with orders as (
    select * from {{ ref('stg_orders') }}

),

payments as (
    select * from {{ ref('stg_payments') }}
),


order_payments as (
    select order_id
    , sum(case when status = 'success' then amount_usd end) as amount_usd
    from payments
    group by 1
),

final as (
    select orders.order_id
    , orders.customer_id
    , orders.order_date
    , coalesce(order_payments.amount_usd, 0) as amount_usd

    from orders
    left join order_payments on orders.order_id = order_payments.order_id
)

select * from final
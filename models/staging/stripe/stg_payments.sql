select 
    id as payment_id
    , orderid as order_id
    , paymentmethod as payment_method
    , status

    -- amount stored in cents. Must convert to dollars
    , amount / 100 as amount_usd
    , created as created_at

from {{ source('stripe', 'payment')}}

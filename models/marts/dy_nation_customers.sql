{{ config(
    materialized = 'dynamic_table',
    target_lag = '10 minutes',
    snowflake_warehouse = 'TRANSFORM_WH',
    refresh_mode = 'incremental'
) }}

select
    n.name as nation_name,
    count(c.customer_id) as num_of_customers,
    sum(c.account_balance) as Account_balance
from {{ ref('stg_customers') }} c
join {{ ref('stg_nations') }} n on c.nation_id = n.nation_id
group by n.name
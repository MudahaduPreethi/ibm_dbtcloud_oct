
with
    supplier as (
        select
            s.s_suppkey as supplier_id,
            s.s_nationkey as nation_id,

            su.Sname as supplier_name,
            s.s_address as supplier_address,
            s.s_phone as phone_number,
            s.s_comment as comment,

            s.s_acctbal as account_balance,
            updated_time
        from {{ source("src", "suppliers") }} as  s 
        join {{ ref("suppliers") }} as su on 
        s.s_suppkey = su.SKey
    )
select *
from supplier

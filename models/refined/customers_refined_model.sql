select
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state,
    {{ dbt_utils.generate_surrogate_key(["CUSTOMER_ID"]) }} as customer_skey
from {{ ref("customers_raw_model") }}

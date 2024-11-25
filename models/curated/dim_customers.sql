select
    customer_skey,
    customer_id as id,
    customer_unique_id,
    customer_zip_code_prefix as zipcode,
    customer_city as city,
    customer_state as state
from {{ ref("customers_refined_model") }}

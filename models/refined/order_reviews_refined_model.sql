select
    review_id,
    order_id,
    review_score,
    {{ dbt_utils.generate_surrogate_key(["ORDER_ID"]) }} as ORDER_SKEY,
    {{ dbt_utils.generate_surrogate_key(["ORDER_ID", "REVIEW_ID"]) }} as ORDER_REVIEW_SKEY
from {{ ref("order_reviews_raw_model") }}

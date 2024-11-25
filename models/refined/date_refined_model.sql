select *, {{ dbt_utils.generate_surrogate_key(["DATE"]) }} as date_skey
from {{ ref("date_raw_model") }}

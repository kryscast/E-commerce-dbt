select
    product_id,
    product_category_name,
    product_name_length,
    product_description_length,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm,
    {{ dbt_utils.generate_surrogate_key(["PRODUCT_ID"]) }} as product_skey
from {{ ref("products_raw_model") }}
where
    product_category_name is not null
    and product_name_length is not null
    and product_description_length is not null
    and product_photos_qty is not null

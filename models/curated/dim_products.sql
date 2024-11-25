select
    product_skey,
    product_id as id,
    product_category_name as category_name,
    product_name_length as name_length,
    product_description_length as description_length,
    product_photos_qty as photos_qty,
    product_weight_g as weight_g,
    product_length_cm as length_cm,
    product_height_cm as height_cm,
    product_width_cm as width_cm,
from {{ ref("products_refined_model") }}

select
    date_skey,
    date,
    month,
    day_of_week,
    day_name,
    year_quarter,
    quarter,
    year,
    is_weekday
from {{ ref("date_refined_model") }}

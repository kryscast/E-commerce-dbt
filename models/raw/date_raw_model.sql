with
    date_spine as (
        {{
            dbt_utils.date_spine(
                datepart="day",
                start_date="cast('2016-09-04' as date)",
                end_date="cast('2020-12-31' as date)",
            )
        }}
    )

select
    date_day as date, 
    extract(month from date_day) as month, 
    extract(dayofweekiso from date_day) as day_of_week, 
    to_char(date_day, 'Day') as day_name, 
    concat(
        extract(year from date_day), '-Q', extract(quarter from date_day)
    ) as year_quarter,  
    extract(quarter from date_day) as quarter,  
    extract(year from date_day) as year,  
    case
        when extract(dayofweekiso from date_day) in (6, 7)
        then false  
        else true 
    end as is_weekday 

from date_spine

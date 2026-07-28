with source as (
    select
        chart_week,
        current_week                    as chart_position,
        title                           as song_title,
        performer                       as artist_name,
        last_week                       as last_week_position,
        peak_pos                        as peak_position,
        wks_on_chart                    as weeks_on_chart,
        year(chart_week)                as chart_year,
        floor((year(chart_week) - 1) / 10) * 10 as decade
    from {{ ref('hot-100-current') }}
)

select * from source

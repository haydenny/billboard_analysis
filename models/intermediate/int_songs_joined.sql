with billboard as (
    select * from {{ ref('stg_billboard') }}
),

grammys as (
    select * from {{ ref('stg_grammys') }}
),

joined as (
    select
        b.chart_week,
        b.chart_position,
        b.song_title,
        b.artist_name,
        b.peak_position,
        b.weeks_on_chart,
        b.chart_year,
        b.decade,
        g.award_name,
        g.is_winner,
        case when g.artist_name is not null then 1 else 0 end as has_grammy_nomination
    from billboard b
    left join grammys g
        on lower(trim(b.artist_name)) = lower(trim(g.artist_name))
        and b.chart_year = g.award_year
)

select * from joined

with base as (
    select * from {{ ref('int_songs_joined') }}
),

decade_trends as (
    select
        decade,
        artist_name,
        count(distinct song_title)      as unique_songs,
        count(*)                        as total_chart_entries,
        min(peak_position)              as best_peak_position,
        avg(weeks_on_chart)             as avg_weeks_on_chart,
        sum(has_grammy_nomination)      as grammy_nominations
    from base
    group by decade, artist_name
)

select * from decade_trends
order by decade, total_chart_entries desc

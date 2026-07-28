with base as (
    select * from {{ ref('int_songs_joined') }}
),
grammy_vs_commercial as (
    select
        chart_year,
        decade,
        artist_name,
        song_title,
        min(chart_position)             as best_chart_position,
        max(weeks_on_chart)             as weeks_on_chart,
        min(peak_position)              as peak_position,
        max(has_grammy_nomination)      as has_grammy_nomination,
        max(is_winner)                  as is_grammy_winner
    from base
    group by chart_year, decade, artist_name, song_title
)
select * from grammy_vs_commercial
order by chart_year, best_chart_position

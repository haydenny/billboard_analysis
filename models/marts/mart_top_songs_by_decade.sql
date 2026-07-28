with base as (
    select * from {{ ref('int_songs_joined') }}
),

song_summary as (
    select
        decade,
        song_title,
        artist_name,
        max(weeks_on_chart)             as max_weeks_on_chart,
        min(peak_position)              as best_peak_position
    from base
    group by decade, song_title, artist_name
),

ranked as (
    select
        *,
        row_number() over (
            partition by decade
            order by max_weeks_on_chart desc
        ) as rank_in_decade
    from song_summary
)

select * from ranked
where rank_in_decade <= 5
order by decade, rank_in_decade

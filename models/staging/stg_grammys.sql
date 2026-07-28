with source as (
    select
        Year                            as award_year,
        Ceremony                        as ceremony_number,
        `Award Name`                    as award_name,
        Work                            as work_title,
        Nominee                         as artist_name,
        Winner                          as is_winner
    from {{ ref('Grammy Award Nominees and Winners 1958-2024') }}
)

select * from source

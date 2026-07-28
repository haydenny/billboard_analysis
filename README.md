# Billboard & Grammy Analysis

A dbt + MySQL + Tableau project analyzing 60+ years of Billboard Hot 100 and Grammy Award data.

## Stack
- MySQL (data warehouse)
- dbt (data transformation)
- Tableau Public (visualization)

## Setup
1. Start MySQL: `mysql.server start`
2. Connect to MySQL: `mysql -u root`
3. Run pipeline: `dbt run`
4. Export CSVs: run export script in /exports

## Data Sources
- Billboard Hot 100 (1958-present) via Kaggle - 343,600 rows
- Grammy Award Nominees & Winners (1958-2024) via Kaggle - 25,305 rows

## Models
- stg_billboard: cleaned Billboard Hot 100 data with decade field
- stg_grammys: cleaned Grammy nominees/winners
- int_songs_joined: Billboard and Grammy data joined on artist name and year
- mart_decade_trends: chart activity aggregated by decade and artist
- mart_grammy_vs_commercial: Grammy status vs commercial chart performance
- mart_top_songs_by_decade: top 5 longest charting songs per decade

## Key Findings
- Grammy winners average 13.7 weeks on chart vs 12.6 for non-nominated songs
- Chart activity peaked in the 2000s, likely driven by digital music streaming
- "Blinding Lights" and "Radioactive" among longest charting songs of their decades

## Tableau Dashboard
https://public.tableau.com/app/profile/hayden.denny/viz/BillboardHot100GrammyAnalysis/BillboardHot100GrammyAnalysis

## Notes
- Billboard/Grammy join uses exact artist name matching - fuzzy matching with rapidfuzz would improve accuracy
- 2020s data is incomplete as dataset ends ~2022
- 1950s data is partial as Billboard Hot 100 launched in August 1958

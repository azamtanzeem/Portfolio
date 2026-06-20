# UAE Luxury Watch Market Dataset

**Tools:** Python, Pandas, BeautifulSoup4, Selenium  
**Records:** 515 cleaned listings | **Source:** Chrono24 UAE schema

## What I built
Attempted live scraping of Chrono24 UAE. Documented Cloudflare and JS rendering 
blocks — pivoted to structured data simulation mirroring the exact Chrono24 UAE 
listing schema. A real-world data engineering decision.

## Cleaning pipeline
Deduplication → brand standardisation → missing value imputation (group median) 
→ bad year removal → feature engineering (price bands, age categories, brand 
tiers, USD conversion)

## Files
- `scraper.py` — Data collection script
- `cleaner.py` — Full cleaning and feature engineering pipeline
- `data/watch_listings_raw.csv` — 535 rows with injected quality issues
- `data/watch_listings_clean.csv` — 515 rows, analysis-ready
- `data_dictionary.md` — Field definitions, types, and cleaning log

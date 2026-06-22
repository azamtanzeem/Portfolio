# UAE Luxury Watch Market Dataset

**Tools:** 
Python · Pandas · Matplotlib · Seaborn · Jupyter

**Records:** 515 cleaned listings 

**Source:** Chrono24 UAE schema

## What I built
Attempted live scraping of Chrono24 UAE. Documented Cloudflare and JS rendering 
blocks — pivoted to structured data simulation mirroring the exact Chrono24 UAE 
listing schema. A real-world data engineering decision.

## Cleaning pipeline
Deduplication → brand standardisation → missing value imputation (group median) 
→ bad year removal → feature engineering (price bands, age categories, brand 
tiers, USD conversion)

## Key Findings
- Richard Mille commands the highest average listing price in the UAE market
- Dubai accounts for the majority of secondary market supply
- Price distribution is heavily right-skewed — median sits well below the mean
- Brand identity is a stronger price driver than condition

## Files
- `scraper.py` — Data collection script
- `cleaner.py` — Full cleaning and feature engineering pipeline
- `data/watch_listings_raw.csv` — 535 rows with injected quality issues
- `data/watch_listings_clean.csv` — 515 rows, analysis-ready
- `data_dictionary.md` — Field definitions, types, and cleaning log
## Links
- [Kaggle Dataset](https://www.kaggle.com/datasets/azamtanzeem/uae-luxury-watch-market)
- [Kaggle Notebook](https://www.kaggle.com/code/azamtanzeem/uae-luxury-watch-market-analysis)

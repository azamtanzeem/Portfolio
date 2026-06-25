 Power BI: Data Layer

**Date:** 24 June 2026
**Tools:** Power BI Desktop, Power Query, M Language

---

## What I did

24 June - Loaded the UAE luxury watch market dataset into Power BI Desktop and built a 
cleaned, merged data model using Power Query.

25 June - Star schema review, cardinality, cross-filter direction, 6 custom DAX measures (COUNT, AVERAGE, CALCULATE, ALL, DIVIDE, SUMX)

---

## Steps completed

### 1. Data load
- Loaded `watch_listings_clean.csv` (515 rows, 17 columns) into Power Query
- Promoted headers and verified all column types

### 2. Data type corrections
- `price_aed` → Decimal Number
- `price_usd_approx` → Decimal Number
- `year` → Whole Number
- `watch_age_years` → Whole Number
- `is_dealer` → Whole Number
- `scraped_date` → Date

### 3. Source column clean
- Replaced the full scraper note string with `Chrono24 UAE` across all 515 rows
- Used `Table.ReplaceValue` in M

### 4. Brand lookup merge
- Created `brand_tier.csv` with brand → origin country mapping (16 brands)
- Performed Left Outer join on `brand` column
- Expanded nested table to extract `Origin` column only
- Renamed merged query to `watch_enriched`

---


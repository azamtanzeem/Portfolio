# Watch Listings Dataset - Data Dictionary

## Source
Chrono24 UAE (schema mirrors live listings; data simulated due to JS/Cloudflare
anti-scraping - see scraper.py for full explanation)

Raw file: watch_listings_raw.csv
Clean file: watch_listings_clean.csv
Collection date: 2025-06-18
Records (clean): 515

## Column Definitions

| Column | Type | Description | Example |
|---|---|---|---|
| listing_id | string | Unique listing identifier | C24-UAE-1042 |
| brand | string | Manufacturer standardised to correct casing | Audemars Piguet |
| brand_tier | string | Ultra Luxury / Grand Complication / Luxury / Premium / Accessible Luxury / Accessible | Ultra Luxury |
| model | string | Watch model line name | Royal Oak 15400 |
| reference | string | Manufacturer reference number | 15400ST.OO.1220ST.01 |
| year | integer | Year of manufacture | 2019 |
| watch_age_years | integer | Current year minus manufacture year | 6 |
| age_category | category | Binned age bracket | Modern (6-10y) |
| condition | string | Unworn / Like New / Very Good / Good / Fair | Very Good |
| price_aed | float | Listed price in UAE Dirhams rounded to nearest 100 | 45000 |
| price_usd_approx | float | AED x 0.272 approximate USD equivalent | 12240 |
| price_band | category | Entry / Mid / Premium / Luxury / Ultra Luxury | Premium (30K-75K) |
| seller_type | string | Dealer or Private Seller | Dealer |
| is_dealer | integer | 1=Dealer 0=Private | 1 |
| location | string | UAE emirate of listing | Dubai |
| scraped_date | date | Date collected YYYY-MM-DD | 2025-06-18 |
| source | string | Data provenance note | Chrono24 UAE (simulated) |

## Cleaning Steps Applied

1. Removed 15 exact duplicate rows
2. Standardised brand names - stripped whitespace, title-cased, alias dictionary to fix IWC and Jaeger-LeCoultre casing
3. Imputed 10 missing price_aed values using brand + condition group median, fallback to brand median
4. Removed 5 rows with impossible year values (year = 9999)
5. Engineered new columns: watch_age_years, age_category, price_band, price_usd_approx, brand_tier, is_dealer

## Price Band Thresholds (AED)

| Band | Range |
|---|---|
| Entry | Under 10,000 |
| Mid | 10,000 to 30,000 |
| Premium | 30,000 to 75,000 |
| Luxury | 75,000 to 200,000 |
| Ultra Luxury | Above 200,000 |

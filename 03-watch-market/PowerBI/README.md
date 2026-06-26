## Dashboard
Interactive Power BI dashboard built on the clean dataset.
- 3 KPI cards: Total listings, Average price, Dealer share
- Average price by brand (bar chart)
- Market composition by brand tier (donut)
- Listing count by price band (bar chart)
- Average price by condition (bar chart)
- Slicers: filter by condition and brand tier

Files: `UAE_Watch_Market.pbix` (interactive) | `UAE_Watch_Market.pdf` (static export)



## 26 June 2025 — Week 3 Day 3: Power BI Full Interactive Report

Built a complete 3-page interactive Power BI report on the UAE luxury watch dataset as a portfolio piece.

**Page 1 — Overview**
- KPI cards: Total Listings, Avg Price, Median Price, Max Price
- Donut chart: listing distribution by brand
- Line chart: average price trend by year
- Brand and condition slicers (synced across all pages)

**Page 2 — Brand Comparison**
- Clustered bar chart: average price by brand (sorted descending)
- Scatter chart: price vs year by brand, bubbles sized by listing count
- Summary table: brand × Total Count, Avg, Median, Max Price with data bars

**Page 3 — Condition Analysis**
- Clustered column chart: avg vs median price by condition
- Stacked bar chart: listing volume by brand and condition
- Matrix heatmap: brand × condition avg price with gold gradient conditional formatting
- Bar chart: average price by brand tier (Accessible → Ultra Luxury)

**Technical details**
- Data source: `watch_listings_clean.csv` (515 rows, 17 columns)
- DAX measures: Total Listings, Avg Price USD, Median Price USD, Max Price USD, Avg Year
- Slicers synced across all 3 pages via Sync Slicers
- Saved as `WatchMarket_v3.pbix`


Files: `WatchMarket_v3.pbix` (interactive) | `WatchMarket_v3 PDF.pdf` (static export)

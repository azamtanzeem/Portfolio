import pandas as pd
import numpy as np
from datetime import datetime

df = pd.read_csv('data/watch_listings_raw.csv')
print(f"Loaded: {len(df)} rows")
print("\n--- Raw Data Issues ---")
print(df.isnull().sum())
print(f"Duplicates: {df.duplicated().sum()}")

# 1. Remove Duplicates
df = df.drop_duplicates()
print(f"\nAfter dedup: {len(df)} rows")

# 2. Standardise Brand Names
df['brand'] = df['brand'].str.strip().str.title()

brand_aliases = {
    'Ap': 'Audemars Piguet',
    'Ap Royal Oak': 'Audemars Piguet',
    'Pp': 'Patek Philippe',
    'Rm': 'Richard Mille',
    'Jlc': 'Jaeger-LeCoultre',
    'Jaeger Lecoultre': 'Jaeger-LeCoultre',
    'Jaeger-Lecoultre': 'Jaeger-LeCoultre',
    'Tag': 'Tag Heuer',
    'Iwc': 'IWC',
}
df['brand'] = df['brand'].replace(brand_aliases)
print(f"\nBrands after standardisation:\n{df['brand'].value_counts()}")

# 3. Handle Missing Prices
print(f"\nMissing prices: {df['price_aed'].isnull().sum()}")
df['price_aed'] = df.groupby(['brand', 'condition'])['price_aed'].transform(
    lambda x: x.fillna(x.median())
)
df['price_aed'] = df.groupby('brand')['price_aed'].transform(
    lambda x: x.fillna(x.median())
)
df['price_aed'] = df['price_aed'].round(-2)

# 4. Fix Bad Year Values
current_year = datetime.now().year
df['year'] = pd.to_numeric(df['year'], errors='coerce')
df = df[df['year'].between(1970, current_year)]
print(f"\nAfter year filter: {len(df)} rows")

# 5. Watch Age Column
df['watch_age_years'] = current_year - df['year']
df['age_category'] = pd.cut(
    df['watch_age_years'],
    bins=[0, 2, 5, 10, 20, 100],
    labels=['Nearly New (0-2y)', 'Recent (3-5y)', 'Modern (6-10y)', 'Vintage Adjacent (11-20y)', 'Vintage (20y+)']
)

# 6. Price Bands
df['price_band'] = pd.cut(
    df['price_aed'],
    bins=[0, 10000, 30000, 75000, 200000, float('inf')],
    labels=['Entry (<10K)', 'Mid (10K-30K)', 'Premium (30K-75K)', 'Luxury (75K-200K)', 'Ultra Luxury (200K+)']
)

# 7. Derived Columns
df['price_usd_approx'] = (df['price_aed'] * 0.272).round(0)

tier_map = {
    'Richard Mille': 'Ultra Luxury',
    'Patek Philippe': 'Ultra Luxury',
    'Audemars Piguet': 'Ultra Luxury',
    'Vacheron Constantin': 'Grand Complication',
    'Jaeger-LeCoultre': 'Grand Complication',
    'Rolex': 'Luxury',
    'Hublot': 'Luxury',
    'IWC': 'Luxury',
    'Panerai': 'Luxury',
    'Cartier': 'Luxury',
    'Omega': 'Premium',
    'Breitling': 'Premium',
    'Tag Heuer': 'Accessible Luxury',
    'Tudor': 'Accessible Luxury',
    'Seiko': 'Accessible',
}
df['brand_tier'] = df['brand'].map(tier_map).fillna('Other')
df['is_dealer'] = (df['seller_type'] == 'Dealer').astype(int)

# 8. Final Column Order
col_order = [
    'listing_id', 'brand', 'brand_tier', 'model', 'reference',
    'year', 'watch_age_years', 'age_category',
    'condition', 'price_aed', 'price_usd_approx', 'price_band',
    'seller_type', 'is_dealer', 'location', 'scraped_date', 'source'
]
df = df[col_order]

# 9. Save
df.to_csv('data/watch_listings_clean.csv', index=False)
print(f"\n✅ Clean dataset: {len(df)} rows saved to data/watch_listings_clean.csv")
print(f"\nPrice band distribution:\n{df['price_band'].value_counts()}")
print(f"\nBrand tier distribution:\n{df['brand_tier'].value_counts()}")

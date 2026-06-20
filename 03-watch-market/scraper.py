import pandas as pd
import numpy as np
import random
from datetime import datetime

random.seed(42)
np.random.seed(42)

BRANDS = {
    'Rolex': ['Submariner Date', 'Datejust 41', 'GMT-Master II', 'Day-Date 40', 'Explorer II', 'Daytona', 'Oyster Perpetual 41', 'Sky-Dweller'],
    'Omega': ['Speedmaster Professional', 'Seamaster 300M', 'Constellation', 'De Ville', 'Planet Ocean'],
    'Patek Philippe': ['Nautilus 5711', 'Aquanaut 5167', 'Calatrava', 'Complications 5396'],
    'Audemars Piguet': ['Royal Oak 15400', 'Royal Oak Offshore', 'Royal Oak Concept'],
    'Richard Mille': ['RM 011', 'RM 055', 'RM 035', 'RM 010'],
    'Hublot': ['Big Bang', 'Classic Fusion', 'Spirit of Big Bang'],
    'IWC': ['Portugieser Chronograph', 'Pilot Mark XVIII', 'Aquatimer'],
    'Breitling': ['Navitimer', 'Superocean', 'Chronomat'],
    'Tag Heuer': ['Carrera', 'Monaco', 'Aquaracer'],
    'Panerai': ['Luminor Marina', 'Radiomir', 'Submersible'],
    'Cartier': ['Santos', 'Tank', 'Ballon Bleu'],
    'Vacheron Constantin': ['Overseas', 'Patrimony', 'Traditionnelle'],
    'Jaeger-LeCoultre': ['Reverso', 'Master Ultra Thin', 'Polaris'],
    'Tudor': ['Black Bay 58', 'Pelagos', 'Heritage Chrono'],
    'Seiko': ['Prospex', 'Presage', 'Astron'],
}

CONDITIONS = ['Unworn', 'Like New', 'Very Good', 'Good', 'Fair']
CONDITION_WEIGHTS = [0.10, 0.25, 0.30, 0.25, 0.10]
SELLER_TYPES = ['Dealer', 'Private Seller']
SELLER_WEIGHTS = [0.65, 0.35]

def generate_price(brand, condition, year):
    base_prices = {
        'Richard Mille': (150000, 900000),
        'Patek Philippe': (60000, 400000),
        'Audemars Piguet': (50000, 300000),
        'Vacheron Constantin': (35000, 200000),
        'Rolex': (18000, 120000),
        'Jaeger-LeCoultre': (15000, 80000),
        'IWC': (12000, 60000),
        'Hublot': (18000, 150000),
        'Panerai': (10000, 50000),
        'Omega': (6000, 35000),
        'Breitling': (8000, 40000),
        'Cartier': (8000, 45000),
        'Tag Heuer': (4000, 25000),
        'Tudor': (5000, 20000),
        'Seiko': (800, 8000),
    }
    low, high = base_prices.get(brand, (5000, 30000))
    price = random.uniform(low, high)
    condition_multipliers = {
        'Unworn': 1.05, 'Like New': 1.00, 'Very Good': 0.88,
        'Good': 0.75, 'Fair': 0.60
    }
    price *= condition_multipliers.get(condition, 1.0)
    age = datetime.now().year - year
    if brand not in ['Rolex', 'Patek Philippe', 'Audemars Piguet']:
        price *= max(0.5, 1 - (age * 0.04))
    return round(price, -2)

def generate_reference(brand, model):
    ref_map = {
        'Submariner Date': '126610LN',
        'Datejust 41': '126334',
        'GMT-Master II': '126710BLRO',
        'Nautilus 5711': '5711/1A-010',
        'Royal Oak 15400': '15400ST.OO.1220ST.01',
        'Speedmaster Professional': '311.30.42.30.01.005',
        'Big Bang': '411.CM.1180.RX',
    }
    return ref_map.get(model, f'REF-{random.randint(10000, 99999)}')

listings = []
listing_id = 1000

for _ in range(520):
    brand = random.choice(list(BRANDS.keys()))
    model = random.choice(BRANDS[brand])
    year = random.randint(1995, 2024)
    condition = random.choices(CONDITIONS, weights=CONDITION_WEIGHTS)[0]
    seller_type = random.choices(SELLER_TYPES, weights=SELLER_WEIGHTS)[0]
    price = generate_price(brand, condition, year)
    listings.append({
        'listing_id': f'C24-UAE-{listing_id}',
        'brand': brand,
        'model': model,
        'reference': generate_reference(brand, model),
        'price_aed': price,
        'condition': condition,
        'year': year,
        'seller_type': seller_type,
        'location': random.choice(['Dubai', 'Abu Dhabi', 'Sharjah', 'Ajman']),
        'scraped_date': '2025-06-18',
        'source': 'Chrono24 UAE (simulated — site uses JS rendering, data schema mirrors live listings)'
    })
    listing_id += 1

df_raw = pd.DataFrame(listings)

noise_idx = df_raw.sample(frac=0.08).index
df_raw.loc[noise_idx[:10], 'brand'] = df_raw.loc[noise_idx[:10], 'brand'].str.upper()
df_raw.loc[noise_idx[10:20], 'price_aed'] = None
df_raw.loc[noise_idx[20:25], 'year'] = 9999
df_raw = pd.concat([df_raw, df_raw.sample(15)], ignore_index=True)

df_raw.to_csv('data/watch_listings_raw.csv', index=False)
print(f"Raw dataset: {len(df_raw)} rows saved to data/watch_listings_raw.csv")

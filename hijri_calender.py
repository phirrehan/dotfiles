from hijri_converter import convert
from datetime import datetime

# Get the current Gregorian date
today = datetime.now()

# Convert to Hijri date
hijri_date = convert.Gregorian(today.year, today.month, today.day).to_hijri()

#print(f"Gregorian Date: {today.strftime('%Y-%m-%d')}")
print(
    f"Hijri Date (Lahore, Pakistan): {hijri_date.year}-{hijri_date.month:02d}-{hijri_date.day:02d}")

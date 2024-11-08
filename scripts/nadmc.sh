#!/bin/bash

path_to_milk_list=~/files/privateFiles/milk_list
liter_taiammi=1
milk_rate_taiAmmi=170
liter_abji=2
milk_rate_abji=200

# When year is not given current year is  chosen
[ -z $2 ] && year=$(date +%Y) || year=$2

# When month is not given current month is chosen
[ -z $1 ] && month=$(date +%m) || month=$1

# Get days in $month
days_in_month=$(date -d "$year-$month-01 +1 month -1 day" +%d)

# Check if directory does not exist
[ ! -d $path_to_milk_list/taiAmmi ] && echo "Directory $path_to_milk_list/taiAmmi does not exist" && exit 1
[ ! -d $path_to_milk_list/abji ] && echo "Directory $path_to_milk_list/abji does not exist" && exit 2

# Check if file does not exist
[ ! -f $path_to_milk_list/taiAmmi/$month-$year ] && echo "File $month-$year does not exist." && exit 3
[ ! -f $path_to_milk_list/abji/$month-$year ] && echo "File $month-$year does not exist." && exit 4

# Tai Ammi
## Counting number of naghas and double milk
naghacount=$(cat $path_to_milk_list/taiAmmi/$month-$year | grep "Nagha" | wc -l)
doublecount=$(cat $path_to_milk_list/taiAmmi/$month-$year | grep "Double Milk" | wc -l)
milkCount=$(expr $days_in_month - $naghacount + $doublecount)
price=$(expr $milkCount \* $milk_rate_taiAmmi \* $liter_taiammi)

## Print both counts and Price per month
echo "Tai Ammi"
echo "Naghas:$naghacount"; echo "Double Milk:$doublecount"
echo "Price Per Month: Rs. $price"

# Abji
## Counting number of naghas and double milk
naghacount=$(cat $path_to_milk_list/abji/$month-$year | grep "Nagha" | wc -l)
milkCount=$(expr $days_in_month - $naghacount)
price=$(expr $milkCount \* $milk_rate_abji \* $liter_abji)

## Print both counts and Price per month
echo -e "\nAbji"
echo "Naghas:$naghacount";
echo "Price Per Month: Rs. $price"


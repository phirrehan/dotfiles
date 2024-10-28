#!/bin/bash
path_to_milk_list=~/files/privateFiles/milk_list

# Check for errors
[ ! -d $path_to_milk_list/taiAmmi ] && echo "The directory $path_to_milk_list/taiAmmi does not exist." && exit 1
[ ! -d $path_to_milk_list/abji ] && echo "The directory $path_to_milk_list/abji does not exist." && exit 2

# Current_month and prev_date is date formatted in
# MM-YYYY and YYYY-MM-DD respectively
yest_month=$(date -d "yesterday" +%m-%Y)
prev_date=$(date -d "yesterday" +%Y-%m-%d)

# Tai Ammi
## Check if file is not already made
[ ! -f $path_to_milk_list/taiAmmi/yest_month ] && touch $path_to_milk_list/taiAmmi/$yest_month 

## Count variable store number of lines in current month file
count=$(cat $path_to_milk_list/taiAmmi/$yest_month | grep $prev_date | wc -l)

## Write data in the file
[ $count -ge 1 ] || echo "Nagha on $prev_date" >> $path_to_milk_list/taiAmmi/$yest_month

# Abji
## Check if file is not already made
[ ! -f $path_to_milk_list/abji/yest_month ] && touch $path_to_milk_list/abji/$yest_month 

## Count variable store number of lines in current month file
count=$(cat $path_to_milk_list/abji/$yest_month | grep $prev_date | wc -l)

[ $count -ge 1 ] || echo "Nagha on $prev_date" >> $path_to_milk_list/abji/$yest_month

echo -e "Naghas written successfully!\n"
echo "Tai Ammi's Record"
cat $path_to_milk_list/taiAmmi/$yest_month
echo -e "\nAbji's Record"
cat $path_to_milk_list/abji/$yest_month

echo -ne "\nEnter any key to exit: "; read ans

#!/bin/bash
path_to_milk_list=~/files/privateFiles/milk_list

#current_month and current_date is date formatted in
#MM-YYYY and YYYY-MM-DD respectively
current_month=$(date +%m-%Y)
current_date=$(date +%Y-%m-%d)

#check if file does not exits in directory (nagha_list)
[ ! -f $path_to_milk_list/taiAmmi/$current_month ] && touch $path_to_milk_list/taiAmmi/$current_month

#count variable store number of lines in current month file
count=$(cat $path_to_milk_list/taiAmmi/$current_month | grep $current_date | wc -l)

#write data in the file
[ $count -ge 1 ] || echo "Double Milk on $current_date" >> $path_to_milk_list/taiAmmi/$current_month

echo "Double Milk written successfully!"
echo -e "\nTai Ammi's Record"
cat $path_to_milk_list/taiAmmi/$current_month

echo -ne "\nEnter any key to exit: "; read ans
